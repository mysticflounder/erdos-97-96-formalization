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
    instance = SimpleNamespace(
        model=object(),
        cnf=SimpleNamespace(n_variables=1, clauses=((1,),)),
        dimacs=lambda: CNF.decode("ascii"),
        decode_model=lambda positive: (
            {0: [1]}
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
