"""Focused contract tests for the finite PIQD structural-seed adapter."""

from __future__ import annotations

import copy
import shutil
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import pytest

from census.card_head import exact12_v14_structural_cegar as structural
from census.card_head.exact12_v14_bound_jobs import (
    build_bound_job,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_schedule import build_manifest
from census.card_head.sat_encoding import CadicalResult
from census.p97_search import phase3_piqd_structural_seed as seed

ROOT = Path(__file__).resolve().parents[3]
FIXTURE = (
    Path(__file__).resolve().parent
    / "fixtures"
    / "p97_source_duplicate_center_classifier_0000.v2.json.xz"
)


@pytest.fixture(scope="module")
def prepared_inputs(
    tmp_path_factory: pytest.TempPathFactory,
) -> tuple[Path, Path, dict]:
    work = tmp_path_factory.mktemp("piqd-seed-inputs")
    manifest = build_manifest(ROOT)
    job = build_bound_job(manifest, ROOT, 0)
    materialized = instantiate_validated_bound_job(job, manifest, ROOT)
    (work / "job.json").write_bytes(seed._canonical_json_bytes(job))
    (work / "discovery.cnf").write_bytes(materialized.instance.dimacs().encode("ascii"))
    classifier = seed.load_classifier(FIXTURE)
    return work, FIXTURE, classifier


def _write_classifier(path: Path, value: dict) -> None:
    path.write_bytes(seed._canonical_json_bytes(value))


def _local_inputs(prepared: tuple[Path, Path, dict], tmp_path: Path) -> Path:
    source, _, _ = prepared
    work = tmp_path / "inputs"
    work.mkdir()
    for name in ("job.json", "discovery.cnf"):
        shutil.copyfile(source / name, work / name)
    return work


def _emit(work: Path, classifier: Path) -> dict:
    return seed.emit_structural_seed(
        ROOT,
        classifier_path=classifier,
        source_job_path=work / "job.json",
        discovery_cnf_path=work / "discovery.cnf",
        journal_path=work / "seed.jsonl",
        sidecar_path=work / "seed.binding.json",
    )


def _replay(
    work: Path, classifier: Path
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    return seed.replay_seed_packet(
        ROOT,
        classifier_path=classifier,
        source_job_path=work / "job.json",
        discovery_cnf_path=work / "discovery.cnf",
        journal_path=work / "seed.jsonl",
        sidecar_path=work / "seed.binding.json",
    )


def test_exact_committed_xz_and_raw_json_publish_one_replayable_seed(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    _, fixture, classifier = prepared_inputs
    assert seed.load_classifier(fixture)["schema"] == seed.CLASSIFIER_SCHEMA
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, classifier)
    sidecar = _emit(work, raw_classifier)
    assert sidecar["claims"] == seed.SEED_CLAIMS
    assert "finite-local" in sidecar["scope"]
    assert sidecar["claims"]["piqd_producer_receipt_present"] is False
    assert sidecar["claims"]["piqd_daemon_origin_custody"] is False
    assert sidecar["claims"]["downstream_seed_packet_custody"] is False
    assert (work / "seed.jsonl.commit").is_file()
    assert sidecar["source_model_sha256"] == classifier["model_sha256"]
    assert sidecar["source_bundle_sha256"] == classifier["source_bundle_sha256"]
    assert sidecar["classifier_detector_contract"]["label"] == (
        "classifier_stage_pinned_six_file_contract"
    )
    assert (
        sidecar["classifier_detector_contract"]["detector_source_manifest"]
        == (classifier["detector_source_manifest"])
    )
    assert sidecar["claims"]["executed_byte_provenance"] is False
    assert all(
        contract["executed_byte_provenance"] is False
        for contract in (
            sidecar["classifier_detector_contract"],
            sidecar["structural_detector_contract"],
        )
    )
    journal = work / "seed.jsonl"
    assert len(journal.read_text().splitlines()) == 1
    count, parent, clauses = _replay(work, raw_classifier)
    assert (count, parent) == (1, sidecar["record_sha256"])
    assert len(clauses) == 1


@pytest.mark.parametrize(
    "kwargs",
    [
        {"package_dir": Path("package")},
        {"piqd_journal": Path("journal")},
        {"source_receipt": Path("receipt")},
        {"package_dir": Path("package"), "piqd_journal": Path("journal")},
    ],
)
def test_authenticated_custody_inputs_are_all_or_none(
    prepared_inputs: tuple[Path, Path, dict],
    tmp_path: Path,
    kwargs: dict[str, Path],
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    with pytest.raises(seed.StructuralSeedError, match="supplied together"):
        seed.emit_structural_seed(
            ROOT,
            classifier_path=prepared_inputs[1],
            source_job_path=work / "job.json",
            discovery_cnf_path=work / "discovery.cnf",
            journal_path=tmp_path / "seed.jsonl",
            sidecar_path=tmp_path / "seed.binding.json",
            **kwargs,
        )


def test_authenticated_custody_metadata_is_bound_to_sidecar(
    prepared_inputs: tuple[Path, Path, dict],
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])
    custody = {
        "package_identity_schema": seed.PACKAGE_IDENTITY_SCHEMA,
        "package_identity": {"schema": seed.PACKAGE_IDENTITY_SCHEMA, "artifacts": {}},
        "package_identity_sha256": "a" * 64,
        "wave_manifest_sha256": "b" * 64,
        "producer_manifest_sha256": "c" * 64,
        "source_bundle_sha256": "d" * 64,
        "journal_sha256": "e" * 64,
        "journal_seal_sha256": "f" * 64,
        "terminal_record_sha256": "0" * 64,
        "model_sha256": "1" * 64,
        "checkpoint_sha256": "2" * 64,
        "piqd_job_id": "synthetic-job",
        "source_receipt_sha256": "3" * 64,
        "classifier_sha256": "4" * 64,
        "source_classifier_cube_sha256": "5" * 64,
        "source_receipt_cube_sha256": "5" * 64,
        "claims": {
            **seed.SEED_CLAIMS,
            "local_package_custody": True,
            "local_driver_journal_custody": True,
            "source_receipt_custody": True,
        },
    }
    monkeypatch.setattr(
        seed, "_validate_custody_bundle", lambda *args, **kwargs: custody
    )
    sidecar = seed.emit_structural_seed(
        ROOT,
        classifier_path=raw_classifier,
        source_job_path=work / "job.json",
        discovery_cnf_path=work / "discovery.cnf",
        journal_path=tmp_path / "seed.jsonl",
        sidecar_path=tmp_path / "seed.binding.json",
        package_dir=tmp_path / "package",
        piqd_journal=tmp_path / "driver.jsonl",
        source_receipt=tmp_path / "receipt.json",
    )
    assert sidecar["custody"] == custody
    assert sidecar["claims"]["local_package_custody"] is True
    assert sidecar["claims"]["piqd_daemon_origin_custody"] is False


def test_source_job_hash_mismatch_fails_closed(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    classifier = prepared_inputs[2]
    changed = copy.deepcopy(classifier)
    changed["source_job_sha256"] = "0" * 64
    classifier_path = tmp_path / "classifier.json"
    _write_classifier(classifier_path, changed)
    with pytest.raises(seed.StructuralSeedError, match="source_job_sha256"):
        _emit(work, classifier_path)


def test_discovery_cnf_hash_and_bytes_are_authenticated(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    fixture = prepared_inputs[1]
    changed_cnf = tmp_path / "changed.cnf"
    changed_cnf.write_bytes((work / "discovery.cnf").read_bytes() + b"\n")
    with pytest.raises(seed.StructuralSeedError, match="discovery CNF"):
        seed.emit_structural_seed(
            ROOT,
            classifier_path=fixture,
            source_job_path=work / "job.json",
            discovery_cnf_path=changed_cnf,
            journal_path=tmp_path / "seed.jsonl",
            sidecar_path=tmp_path / "seed.binding.json",
        )


def test_selected_variables_must_replay_classifier_cube(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    classifier = prepared_inputs[2]
    changed = copy.deepcopy(classifier)
    selected = list(changed["selected_positive_variables"])
    selected[selected.index(875)] = 876
    selected.sort()
    changed["selected_positive_variables"] = selected
    changed["selected_positive_variables_sha256"] = seed._sha256_json(selected)
    classifier_path = tmp_path / "classifier.json"
    _write_classifier(classifier_path, changed)
    with pytest.raises(seed.StructuralSeedError):
        _emit(work, classifier_path)


def test_cube_identity_is_checked_after_classifier_validation(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    classifier = prepared_inputs[2]
    changed = copy.deepcopy(classifier)
    changed["cube"]["10"] = sorted(changed["cube"]["10"] + [1])
    changed["cube_sha256"] = seed._sha256_json(changed["cube"])
    classifier_path = tmp_path / "classifier.json"
    _write_classifier(classifier_path, changed)
    with pytest.raises(seed.StructuralSeedError, match="different classifier cube"):
        _emit(work, classifier_path)


def test_contract_metadata_and_tampered_journal_are_rejected(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    classifier = prepared_inputs[2]
    changed = copy.deepcopy(classifier)
    changed["detector_contract"] = "untrusted"
    classifier_path = tmp_path / "bad-contract.json"
    _write_classifier(classifier_path, changed)
    with pytest.raises(seed.StructuralSeedError, match="classifier validation"):
        _emit(work, classifier_path)

    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, classifier)
    seed.emit_structural_seed(
        ROOT,
        classifier_path=raw_classifier,
        source_job_path=work / "job.json",
        discovery_cnf_path=work / "discovery.cnf",
        journal_path=tmp_path / "seed.jsonl",
        sidecar_path=tmp_path / "seed.binding.json",
    )
    journal = tmp_path / "seed.jsonl"
    tampered = journal.read_bytes().replace(b'"index":0', b'"index":1', 1)
    journal.write_bytes(tampered)
    with pytest.raises(seed.StructuralSeedError):
        _replay(tmp_path, raw_classifier)


@pytest.mark.parametrize(
    "payload",
    [
        b"not xz",
        FIXTURE.read_bytes() + b"tail",
        FIXTURE.read_bytes() + FIXTURE.read_bytes(),
    ],
)
def test_malformed_trailing_and_concatenated_xz_fail_closed(
    payload: bytes, tmp_path: Path
) -> None:
    path = tmp_path / "bad.json.xz"
    path.write_bytes(payload)
    with pytest.raises(seed.StructuralSeedError):
        seed.load_classifier(path)


def test_symlink_and_descriptor_snapshot_inputs_are_not_path_trusted(
    prepared_inputs: tuple[Path, Path, dict],
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    classifier_link = tmp_path / "classifier-link.xz"
    classifier_link.symlink_to(prepared_inputs[1])
    with pytest.raises(seed.StructuralSeedError):
        _emit(work, classifier_link)
    job_link = tmp_path / "job-link.json"
    job_link.symlink_to(work / "job.json")
    with pytest.raises(seed.StructuralSeedError):
        seed.emit_structural_seed(
            ROOT,
            classifier_path=prepared_inputs[1],
            source_job_path=job_link,
            discovery_cnf_path=work / "discovery.cnf",
            journal_path=tmp_path / "job-link-seed.jsonl",
            sidecar_path=tmp_path / "job-link-seed.binding.json",
        )
    cnf_link = tmp_path / "cnf-link"
    cnf_link.symlink_to(work / "discovery.cnf")
    with pytest.raises(seed.StructuralSeedError):
        seed.emit_structural_seed(
            ROOT,
            classifier_path=prepared_inputs[1],
            source_job_path=work / "job.json",
            discovery_cnf_path=cnf_link,
            journal_path=tmp_path / "cnf-link-seed.jsonl",
            sidecar_path=tmp_path / "cnf-link-seed.binding.json",
        )

    authenticated = tmp_path / "authenticated.txt"
    authenticated.write_bytes(b"original")
    original_open = seed.os.open
    replaced = False

    def replace_after_open(path, flags, *args):
        nonlocal replaced
        descriptor = original_open(path, flags, *args)
        if Path(path) == authenticated and not replaced:
            replaced = True
            authenticated.unlink()
            authenticated.write_bytes(b"tampered")
        return descriptor

    monkeypatch.setattr(seed.os, "open", replace_after_open)
    assert (
        seed._authenticated_file_bytes(authenticated, limit=100, label="snapshot")
        == b"original"
    )
    assert replaced


def test_replay_recomputes_source_hashes_after_publication(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])
    _emit(work, raw_classifier)
    source_job = work / "job.json"
    source_job.write_bytes(
        source_job.read_bytes().replace(b'"cell_index":0', b'"cell_index":1', 1)
    )
    with pytest.raises(seed.StructuralSeedError, match="source job"):
        _replay(work, raw_classifier)


def test_publication_rejects_symlinked_parent(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])
    real_output = tmp_path / "real-output"
    real_output.mkdir()
    symlink_output = tmp_path / "symlink-output"
    symlink_output.symlink_to(real_output, target_is_directory=True)
    with pytest.raises(seed.StructuralSeedError, match="publication parent"):
        seed.emit_structural_seed(
            ROOT,
            classifier_path=raw_classifier,
            source_job_path=work / "job.json",
            discovery_cnf_path=work / "discovery.cnf",
            journal_path=symlink_output / "seed.jsonl",
            sidecar_path=symlink_output / "seed.binding.json",
        )
    assert not list(real_output.iterdir())


def test_concurrent_writers_publish_one_committed_packet(
    prepared_inputs: tuple[Path, Path, dict], tmp_path: Path
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])

    def attempt() -> str:
        try:
            _emit(work, raw_classifier)
        except seed.StructuralSeedError:
            return "rejected"
        return "published"

    with ThreadPoolExecutor(max_workers=2) as executor:
        outcomes = list(executor.map(lambda _: attempt(), range(2)))
    assert sorted(outcomes) == ["published", "rejected"]
    assert (work / "seed.jsonl.commit").is_file()
    assert not (work / ".seed.jsonl.lock").exists()


def test_injected_publication_failure_cleans_uncommitted_files_and_retries(
    prepared_inputs: tuple[Path, Path, dict],
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])
    original = seed._install_exclusive
    failed = False

    def fail_once(temporary: Path, target: Path) -> None:
        nonlocal failed
        if target.name == "seed.binding.json" and not failed:
            failed = True
            raise seed.StructuralSeedError("injected publication failure")
        original(temporary, target)

    monkeypatch.setattr(seed, "_install_exclusive", fail_once)
    with pytest.raises(seed.StructuralSeedError, match="injected"):
        _emit(work, raw_classifier)
    assert failed
    assert not any(
        (work / name).exists()
        for name in (
            "seed.jsonl",
            "seed.binding.json",
            "seed.jsonl.commit",
            ".seed.jsonl.lock",
        )
    )
    monkeypatch.setattr(seed, "_install_exclusive", original)
    _emit(work, raw_classifier)
    assert (work / "seed.jsonl.commit").is_file()


def test_runner_consumes_record_zero_from_seed_journal(
    prepared_inputs: tuple[Path, Path, dict],
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    work = _local_inputs(prepared_inputs, tmp_path)
    raw_classifier = tmp_path / "classifier.json"
    _write_classifier(raw_classifier, prepared_inputs[2])
    sidecar = _emit(work, raw_classifier)
    _replay(work, raw_classifier)
    seen: list[tuple[int, ...]] = []

    def fake_solver(instance, cnf_path, **kwargs):
        clause = tuple(prepared_inputs[2]["learned_clause"])
        seen.extend(
            tuple(item) for item in instance.cnf.clauses if tuple(item) == clause
        )
        cnf_path.write_text(instance.dimacs(), encoding="ascii")
        return CadicalResult("UNKNOWN", None, None, False, "bounded test")

    monkeypatch.setattr(structural, "solve_cadical", fake_solver)
    summary = structural.run_structural_cegar(
        ROOT,
        tmp_path / "runner-workdir",
        0,
        max_iterations=1,
        timeout_seconds=1,
        nice=1,
        seed_journal=work / "seed.jsonl",
    )
    assert summary["records"] == 1
    assert summary["journal_replayed"] is True
    assert seen == [tuple(prepared_inputs[2]["learned_clause"])]
    assert sidecar["record_sha256"] == summary["terminal_record_sha256"]
