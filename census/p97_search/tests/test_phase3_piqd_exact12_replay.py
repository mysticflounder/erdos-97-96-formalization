from __future__ import annotations

import json
from pathlib import Path
from types import SimpleNamespace

import pytest

from census.p97_search import phase3_piqd_exact12_replay as replay

REPO_ROOT = Path(__file__).resolve().parents[3]
SOURCE_JOB_ID = "exact12-v14-0000-stable-producer-id"
PIQD_JOB_ID = "cc4054b6-6e73-4bb6-9c09-ed4814f07c93"
CNF = b"p cnf 1 1\n1 0\n"


@pytest.fixture
def fixture_paths(tmp_path: Path) -> tuple[Path, Path, Path]:
    job = tmp_path / "job.json"
    cnf = tmp_path / "discovery.cnf"
    model = tmp_path / "model.json"
    job.write_text(
        json.dumps(
            {
                "schema": replay.BOUND_JOB_SCHEMA,
                "job_id": SOURCE_JOB_ID,
                "cell_index": 0,
                "cnf": {
                    "encoding": "DIMACS",
                    "bytes": len(CNF),
                    "n_variables": 1,
                    "n_clauses": 1,
                    "sha256": replay._sha256(CNF),
                },
            }
        ),
        encoding="utf-8",
    )
    cnf.write_bytes(CNF)
    model.write_text(
        json.dumps(
            {
                "job_id": PIQD_JOB_ID,
                "result": "SAT",
                "num_assigned": 1,
                "assignment": [1],
            }
        ),
        encoding="utf-8",
    )
    return job, cnf, model


@pytest.fixture
def stub_source(monkeypatch: pytest.MonkeyPatch) -> None:
    cube = {center: [(center + 1) % 12] for center in range(12)}
    instance = SimpleNamespace(
        model=SimpleNamespace(cardinality=12),
        cnf=SimpleNamespace(n_variables=1, clauses=((1,),)),
        dimacs=lambda: CNF.decode("ascii"),
        decode_model=lambda positive: (
            cube
            if set(positive) == {1}
            else (_ for _ in ()).throw(ValueError("bad model"))
        ),
    )
    materialized = SimpleNamespace(
        instance=instance,
        compiled=SimpleNamespace(cell=object(), blocker_variables={}),
    )
    monkeypatch.setattr(replay, "build_manifest", lambda _root: {"fake": True})
    monkeypatch.setattr(
        replay,
        "instantiate_validated_bound_job",
        lambda _job, _manifest, _root: materialized,
    )
    monkeypatch.setattr(replay, "source_faithful_cube_ok", lambda _model, _cube: True)
    monkeypatch.setattr(replay, "decode_blockers", lambda _positive, _variables: {})
    monkeypatch.setattr(
        replay, "added_constraints_hold", lambda _cell, _cube, _blockers: True
    )


@pytest.fixture
def duplicate_center_detector(monkeypatch: pytest.MonkeyPatch) -> dict:
    certificate = {
        "stage": replay.SOURCE_CLASSIFIER_STAGE,
        "rows": [
            {"center": 0, "support": [1], "exact": False},
            {"center": 2, "support": [3], "exact": False},
        ],
    }
    monkeypatch.setattr(
        replay, "detect_structural_certificate", lambda _cube, n: certificate
    )
    monkeypatch.setattr(
        replay, "validate_structural_certificate", lambda _certificate, n: True
    )
    monkeypatch.setattr(
        replay,
        "learned_clause_for_certificate",
        lambda _instance, _certificate: (-1,),
    )
    return certificate


def run_replay(paths: tuple[Path, Path, Path]) -> dict:
    job, cnf, model = paths
    return replay.replay_exact12_model(
        REPO_ROOT, job, cnf, model, expected_piqd_job_id=PIQD_JOB_ID
    )


def test_positive_contract_replay_distinguishes_both_job_ids(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    receipt = run_replay(fixture_paths)
    assert receipt["status"] == "ACCEPTED"
    assert receipt["job"]["source_job_id"] == SOURCE_JOB_ID
    assert receipt["job"]["piqd_job_id"] == PIQD_JOB_ID
    assert receipt["gates"]["piqd_job_id"]["ok"] is True


def test_duplicate_json_key_is_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    _job, _cnf, model = fixture_paths
    model.write_text(
        '{"job_id":"x","job_id":"x","result":"SAT","num_assigned":1,"assignment":[1]}',
        encoding="utf-8",
    )
    with pytest.raises(replay.Exact12PiqdReplayError, match="strict JSON"):
        run_replay(fixture_paths)


def test_duplicate_source_job_key_is_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    job, _cnf, _model = fixture_paths
    job.write_text(
        '{"schema":"x","job_id":"first","job_id":"second"}',
        encoding="utf-8",
    )
    with pytest.raises(replay.Exact12PiqdReplayError, match="strict JSON"):
        run_replay(fixture_paths)


@pytest.mark.parametrize("constant", ["NaN", "Infinity", "-Infinity"])
def test_nonfinite_json_constants_are_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None, constant: str
) -> None:
    _job, _cnf, model = fixture_paths
    model.write_text(
        f'{{"job_id":"{PIQD_JOB_ID}","result":"SAT",'
        f'"num_assigned":{constant},"assignment":[1]}}',
        encoding="utf-8",
    )
    with pytest.raises(replay.Exact12PiqdReplayError, match="strict JSON"):
        run_replay(fixture_paths)


def test_canonical_json_rejects_nonfinite_values() -> None:
    with pytest.raises(ValueError, match="JSON compliant"):
        replay.canonical_json_bytes({"not_finite": float("nan")})


def test_snapshot_replay_never_reopens_paths_and_preserves_path_spellings(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    job, cnf, model = fixture_paths
    job_raw = job.read_bytes()
    cnf_raw = cnf.read_bytes()
    model_raw = model.read_bytes()
    source_label = Path("archive/../source-job.json")
    cnf_label = Path("archive/../discovery.cnf")
    model_label = Path("archive/../model.json")

    job.write_bytes(b"not the authenticated job")
    cnf.unlink()
    model.write_bytes(b"not the authenticated model")
    receipt = replay.replay_exact12_model_snapshot(
        REPO_ROOT,
        source_job_path=source_label,
        source_job_bytes=job_raw,
        discovery_cnf_path=cnf_label,
        discovery_cnf_bytes=cnf_raw,
        model_path=model_label,
        model_bytes=model_raw,
        expected_piqd_job_id=PIQD_JOB_ID,
    )

    assert receipt["status"] == "ACCEPTED"
    assert receipt["inputs"]["source_job"] == str(source_label)
    assert receipt["inputs"]["discovery_cnf"] == str(cnf_label)
    assert receipt["inputs"]["model"] == str(model_label)


def test_snapshot_replay_requires_immutable_bytes(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    job, cnf, model = fixture_paths
    with pytest.raises(replay.Exact12PiqdReplayError, match="immutable bytes"):
        replay.replay_exact12_model_snapshot(
            REPO_ROOT,
            source_job_path=job,
            source_job_bytes=bytearray(job.read_bytes()),  # type: ignore[arg-type]
            discovery_cnf_path=cnf,
            discovery_cnf_bytes=cnf.read_bytes(),
            model_path=model,
            model_bytes=model.read_bytes(),
            expected_piqd_job_id=PIQD_JOB_ID,
        )


def test_wrong_piqd_job_id_is_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    _job, _cnf, model = fixture_paths
    payload = json.loads(model.read_bytes())
    payload["job_id"] = "wrong-daemon-uuid"
    model.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(replay.Exact12PiqdReplayError, match="expected piqd job ID"):
        run_replay(fixture_paths)


def test_source_predicate_rejection_is_fail_closed(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(replay, "source_faithful_cube_ok", lambda _model, _cube: False)
    with pytest.raises(replay.Exact12PiqdReplayError, match="replay gates"):
        run_replay(fixture_paths)


def test_malformed_assignment_is_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    _job, _cnf, model = fixture_paths
    payload = json.loads(model.read_bytes())
    payload["assignment"] = [1, 1]
    payload["num_assigned"] = 2
    model.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(replay.Exact12PiqdReplayError, match="full assignment"):
        run_replay(fixture_paths)


def test_cnf_identity_mismatch_is_rejected(
    fixture_paths: tuple[Path, Path, Path], stub_source: None
) -> None:
    _job, cnf, _model = fixture_paths
    cnf.write_bytes(b"p cnf 1 1\n-1 0\n")
    with pytest.raises(replay.Exact12PiqdReplayError, match="CNF hash"):
        run_replay(fixture_paths)


def test_blocker_decode_failure_is_fail_closed(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        replay,
        "decode_blockers",
        lambda _positive, _variables: (_ for _ in ()).throw(ValueError("bad blockers")),
    )
    with pytest.raises(replay.Exact12PiqdReplayError, match="replay gates"):
        run_replay(fixture_paths)


def test_write_receipt_is_canonical_and_atomic(tmp_path: Path) -> None:
    receipt_path = tmp_path / "receipt.json"
    replay.write_receipt(receipt_path, {"z": 1, "a": [True]})
    assert receipt_path.read_bytes() == b'{"a":[true],"z":1}\n'
    assert list(tmp_path.glob(".receipt.json.*.tmp")) == []


def test_write_receipt_rejects_symlink_target_and_parent(tmp_path: Path) -> None:
    target = tmp_path / "target.json"
    target.write_bytes(b"keep")
    symlink_target = tmp_path / "link.json"
    symlink_target.symlink_to(target)
    with pytest.raises(replay.Exact12PiqdReplayError, match="symlink"):
        replay.write_receipt(symlink_target, {"ok": True})
    assert target.read_bytes() == b"keep"

    real_parent = tmp_path / "real"
    real_parent.mkdir()
    symlink_parent = tmp_path / "parent-link"
    symlink_parent.symlink_to(real_parent, target_is_directory=True)
    with pytest.raises(replay.Exact12PiqdReplayError, match="symlink"):
        replay.write_receipt(symlink_parent / "receipt.json", {"ok": True})


def test_write_receipt_survives_named_parent_swap(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent = tmp_path / "race-parent"
    parent.mkdir()
    moved_parent = tmp_path / "race-parent-old"
    evil_parent = tmp_path / "evil-parent"
    evil_parent.mkdir()
    real_open = replay.os.open
    swapped = False

    def racing_open(path, flags, mode=0o777, *, dir_fd=None):
        nonlocal swapped
        fd = real_open(path, flags, mode, dir_fd=dir_fd)
        if path == "race-parent" and dir_fd is not None and not swapped:
            parent.rename(moved_parent)
            parent.symlink_to(evil_parent, target_is_directory=True)
            swapped = True
        return fd

    monkeypatch.setattr(replay.os, "open", racing_open)
    replay.write_receipt(parent / "receipt.json", {"ok": True})
    assert (moved_parent / "receipt.json").read_bytes() == b'{"ok":true}\n'
    assert not (evil_parent / "receipt.json").exists()


def test_write_receipt_parent_fsync_failure_is_not_success(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    receipt_path = tmp_path / "receipt.json"
    real_fsync = replay.os.fsync
    calls = 0

    def fail_parent_fsync(fd: int) -> None:
        nonlocal calls
        calls += 1
        if calls == 2:
            raise OSError("simulated parent fsync failure")
        real_fsync(fd)

    monkeypatch.setattr(replay.os, "fsync", fail_parent_fsync)
    with pytest.raises(replay.Exact12PiqdReplayError, match="cannot write receipt"):
        replay.write_receipt(receipt_path, {"ok": True})
    assert list(tmp_path.glob(".receipt.json.*.tmp")) == []


def _derive_classifier(paths: tuple[Path, Path, Path]) -> tuple[dict, dict]:
    job, cnf, model = paths
    return replay.derive_source_duplicate_center_classifier_snapshot(
        REPO_ROOT,
        source_job_path=job,
        source_job_bytes=job.read_bytes(),
        discovery_cnf_path=cnf,
        discovery_cnf_bytes=cnf.read_bytes(),
        model_path=model,
        model_bytes=model.read_bytes(),
        source_bundle_bytes=b'{"source":"fixture"}\n',
        expected_piqd_job_id=PIQD_JOB_ID,
    )


def test_source_classifier_is_deterministic_and_uses_one_cube_identity(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
) -> None:
    receipt_a, classifier_a = _derive_classifier(fixture_paths)
    receipt_b, classifier_b = _derive_classifier(fixture_paths)

    assert replay.canonical_json_bytes(classifier_a) == replay.canonical_json_bytes(
        classifier_b
    )
    assert receipt_a == receipt_b
    assert receipt_a["decoded"]["cube_sha256"] == classifier_a["cube_sha256"]
    int_keyed_cube = {int(key): value for key, value in classifier_a["cube"].items()}
    assert replay._json_sha256(
        replay._canonical_cube_payload(int_keyed_cube)
    ) == replay._json_sha256(classifier_a["cube"])
    assert classifier_a["row_semantics"]["ambient_fiber_completeness"] is False
    assert classifier_a["claims"] == replay.SOURCE_CLASSIFIER_CLAIMS
    assert classifier_a["detector_custody"]["executed_byte_provenance"] is False
    assert classifier_a["selected_positive_variables"] == [1]
    assert all(
        entry["content_base64"] for entry in classifier_a["detector_source_manifest"]
    )


def test_source_classifier_snapshot_does_not_reopen_authenticated_inputs(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
) -> None:
    job, cnf, model = fixture_paths
    snapshots = (job.read_bytes(), cnf.read_bytes(), model.read_bytes())
    job.write_bytes(b"changed")
    cnf.unlink()
    model.write_bytes(b"changed")

    receipt, classifier = replay.derive_source_duplicate_center_classifier_snapshot(
        REPO_ROOT,
        source_job_path=job,
        source_job_bytes=snapshots[0],
        discovery_cnf_path=cnf,
        discovery_cnf_bytes=snapshots[1],
        model_path=model,
        model_bytes=snapshots[2],
        source_bundle_bytes=b"bundle snapshot",
        expected_piqd_job_id=PIQD_JOB_ID,
    )

    assert receipt["status"] == "ACCEPTED"
    assert classifier["model_sha256"] == replay._sha256(snapshots[2])


def test_cli_archives_source_derived_classifier(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    tmp_path: Path,
) -> None:
    job, cnf, model = fixture_paths
    source_bundle = tmp_path / "source-bundle.json"
    receipt_path = tmp_path / "receipt.json"
    classifier_path = tmp_path / "classifier.json"
    source_bundle.write_bytes(b'{"source":"fixture"}\n')

    code = replay.main(
        [
            "--repo-root",
            str(REPO_ROOT),
            "--source-job",
            str(job),
            "--discovery-cnf",
            str(cnf),
            "--model",
            str(model),
            "--expected-piqd-job-id",
            PIQD_JOB_ID,
            "--receipt",
            str(receipt_path),
            "--source-bundle",
            str(source_bundle),
            "--classifier",
            str(classifier_path),
        ]
    )

    assert code == 0
    receipt = json.loads(receipt_path.read_bytes())
    classifier = json.loads(classifier_path.read_bytes())
    assert classifier["schema"] == replay.SOURCE_CLASSIFIER_SCHEMA
    assert classifier["cube_sha256"] == receipt["decoded"]["cube_sha256"]


def test_source_classifier_rejects_exact_certificate_rows(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    bad = dict(duplicate_center_detector)
    bad["rows"] = [
        {"center": 0, "support": [1], "exact": True},
        {"center": 2, "support": [3], "exact": False},
    ]
    monkeypatch.setattr(replay, "detect_structural_certificate", lambda _cube, n: bad)
    with pytest.raises(replay.Exact12PiqdReplayError, match="exact=false"):
        _derive_classifier(fixture_paths)


def test_source_classifier_rejects_non_duplicate_stage(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    bad = dict(duplicate_center_detector)
    bad["stage"] = "triangle-heavy"
    monkeypatch.setattr(replay, "detect_structural_certificate", lambda _cube, n: bad)
    with pytest.raises(replay.Exact12PiqdReplayError, match="not classified"):
        _derive_classifier(fixture_paths)


def test_source_classifier_rejects_clause_not_falsified_by_assignment(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        replay,
        "learned_clause_for_certificate",
        lambda _instance, _certificate: (-7, -9),
    )
    with pytest.raises(replay.Exact12PiqdReplayError, match="selected positive"):
        _derive_classifier(fixture_paths)


def test_detector_source_snapshot_rejects_symlink(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    detector_root = tmp_path / "detector-root"
    detector_root.mkdir()
    target = tmp_path / "target.py"
    target.write_bytes(b"pass\n")
    (detector_root / "detector.py").symlink_to(target)
    monkeypatch.setattr(replay, "DETECTOR_FILES", ("detector.py",))
    job, cnf, model = fixture_paths
    with pytest.raises(replay.Exact12PiqdReplayError, match="without following"):
        replay.derive_source_duplicate_center_classifier_snapshot(
            detector_root,
            source_job_path=job,
            source_job_bytes=job.read_bytes(),
            discovery_cnf_path=cnf,
            discovery_cnf_bytes=cnf.read_bytes(),
            model_path=model,
            model_bytes=model.read_bytes(),
            source_bundle_bytes=b"bundle snapshot",
            expected_piqd_job_id=PIQD_JOB_ID,
        )


def test_detector_source_bytes_are_opened_only_for_initial_snapshot(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    opened: list[str] = []
    real_read = replay._read_detector_source_no_follow

    def counted_read(repo_root: Path, relative: str) -> bytes:
        opened.append(relative)
        return real_read(repo_root, relative)

    monkeypatch.setattr(replay, "_read_detector_source_no_follow", counted_read)
    _derive_classifier(fixture_paths)
    assert opened == list(replay.DETECTOR_FILES)


@pytest.mark.parametrize(
    "tamper",
    [
        "missing-source-manifest",
        "detector-contract",
        "detector-source-content",
        "certificate",
        "exact-row",
        "selected-positive",
    ],
)
def test_source_classifier_validation_rejects_tampering(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
    tamper: str,
) -> None:
    _receipt, classifier = _derive_classifier(fixture_paths)
    bad = json.loads(replay.canonical_json_bytes(classifier))
    if tamper == "missing-source-manifest":
        bad.pop("detector_source_manifest")
    elif tamper == "detector-contract":
        bad["detector_contract"] = "self-declared"
    elif tamper == "detector-source-content":
        bad["detector_source_manifest"][0]["content_base64"] = "cGFzcwo="
    elif tamper == "certificate":
        bad["certificate"]["stage"] = "triangle-heavy"
    elif tamper == "exact-row":
        bad["certificate"]["rows"][0]["exact"] = True
        bad["certificate_sha256"] = replay._json_sha256(bad["certificate"])
    else:
        bad["selected_positive_variables"] = [7, 9]
        bad["selected_positive_variables_sha256"] = replay._json_sha256([7, 9])
    with pytest.raises(replay.Exact12PiqdReplayError):
        replay.validate_source_duplicate_center_classifier(bad)


def test_legacy_source_classifier_v1_fails_closed(
    fixture_paths: tuple[Path, Path, Path],
    stub_source: None,
    duplicate_center_detector: dict,
) -> None:
    _receipt, classifier = _derive_classifier(fixture_paths)
    classifier["schema"] = "p97-cegar-source-derived-duplicate-center/v1"
    with pytest.raises(replay.Exact12PiqdReplayError, match="legacy v1"):
        replay.validate_source_duplicate_center_classifier(classifier)
