from __future__ import annotations

import json
import os
import stat
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace
from unittest import mock

import pytest

from census.card_head.exact12_next_row_cell_run import (
    JOB_SCHEMA,
    EncodingError,
    _claim_empty_workdir,
)
from census.card_head.exact12_next_row_structural_cegar import (
    DETECTOR_CONTRACT,
    StructuralDiscoveryRequest,
)
from census.card_head.exact12_next_row_structural_piqd import (
    CUSTODY_SEAL_SCHEMA,
    MAX_RECEIPT_BYTES,
    PIQD_PROJECT,
    Exact12NextRowStructuralPiqdDiscoveryFactory,
    Exact12NextRowStructuralPiqdError,
    _capture_regular,
    _install_descriptor,
    _persist_current_cnf,
    run_exact12_next_row_structural_piqd,
    validate_exact12_next_row_structural_piqd_artifacts,
)
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import SEAL_SCHEMA
from census.p97_search.phase3_piqd_oracle import raw_dimacs_identity
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    RECEIPT_SCHEMA,
    StaticSolverResult,
)


class TinyInstance:
    def __init__(self) -> None:
        self.cnf = SimpleNamespace(n_variables=1, clauses=[(1,)])

    def dimacs(self) -> str:
        return "p cnf 1 1\n1 0\n"

    def decode_model(self, positive: frozenset[int]) -> dict[int, list[int]]:
        if positive != frozenset({1}):
            raise ValueError("unexpected model")
        return {0: [1]}


def _request(tmp_path: Path) -> tuple[Path, StructuralDiscoveryRequest]:
    repo_root = tmp_path / "repo"
    source = repo_root / "source.py"
    source.parent.mkdir(parents=True)
    source.write_bytes(b"# synthetic structural source\n")
    sources = [
        {
            "path": "source.py",
            "bytes": source.stat().st_size,
            "sha256": sha256_bytes(source.read_bytes()),
        }
    ]
    instance = TinyInstance()
    current = instance.dimacs().encode("ascii")
    payload = {
        "schema": JOB_SCHEMA,
        "scope": "synthetic finite structural cell",
        "compiler_schema": "compiler/test",
        "candidate_schema": "candidate/test",
        "candidate_profile": [5, 6, 4],
        "lean_ingress_theorem": "NONE",
        "compiler_manifest": {"schema": "compiler/test", "identity": "tiny"},
        "cnf": {
            "bytes": len(current),
            "sha256": sha256_bytes(current),
            "variables": 1,
            "clauses": 1,
        },
        "sources": sources,
    }
    job = {**payload, "job_id": sha256_json(payload)}
    request = StructuralDiscoveryRequest(
        instance=instance,  # type: ignore[arg-type]
        job=job,
        detector_contract_sha256=sha256_json(
            {"contract": DETECTOR_CONTRACT, "sources": sources}
        ),
        cell_index=0,
        iteration=0,
        local_iteration=0,
        parent_record_sha256=job["job_id"],
        current_dimacs=current,
        current_cnf_sha256=sha256_bytes(current),
        num_variables=1,
        num_clauses=1,
    )
    return repo_root, request


def _receipt(
    *,
    verdict: str,
    returncode: int,
    current_sha256: str,
    source_sha256: str,
    producer_sha256: str,
) -> str:
    job_id = "synthetic-piqd-job"
    receipt = {
        "schema": RECEIPT_SCHEMA,
        "attempt": 0,
        "attempt_directory": "/synthetic/attempt",
        "journal": "/synthetic/attempt/attempt.jsonl",
        "receipt_path": "/synthetic/attempt/solver-receipt.json",
        "custody_seal_path": "/synthetic/attempt/custody-seal.json",
        "job_id": job_id,
        "prepare_freshness_claimed": False,
        "outcome": {
            "SAT": "STRUCTURAL_SAT",
            "UNSAT": "DISCOVERY_UNSAT",
            "UNKNOWN": "ERROR",
        }[verdict],
        "adapter_verdict": verdict,
        "adapter_returncode": returncode,
        "cnf_sha256": current_sha256,
        "num_variables": 1,
        "num_clauses": 1,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
        "terminal_record_sha256": "8" * 64,
        "journal_record_count": 1,
        "seal_sha256": "9" * 64,
        "status_classification": "SYNTHETIC_STATUS",
        "status_detail": "synthetic offline receipt",
        "terminal_status": None,
        "terminal_status_canonical_sha256": None,
        "terminal_status_raw_sha256": None,
        "terminal_status_raw_size": None,
        "terminal_status_raw_artifact_sha256": None,
        "terminal_status_identity_scope": "NO_PARSED_TERMINAL_STATUS",
        "terminal_status_exposed_identity_fields": [],
        "model_response_sha256": None,
        "endpoint_trace": [
            {"method": "POST", "target": "/jobs/prepare-cnf"},
            {"method": "GET", "target": f"/jobs/{job_id}"},
        ],
        "failure_detail": None,
        "custody_retry_policy": "REMOVE_UNSEALED_RESERVED_ATTEMPT",
        "claims": {
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
            "lean_closure": False,
            "one_process": False,
            "one_core": False,
        },
        "job_identity": {
            "job_id": job_id,
            "backend": "cadical",
            "solver_profile": "sat",
            "project": PIQD_PROJECT,
            "cnf_blob_hash": current_sha256,
            "identity_hash": raw_dimacs_identity(
                backend="cadical",
                solver_profile="sat",
                cnf_sha256=current_sha256,
                producer_manifest_sha256=producer_sha256,
                requested_core_limit=1,
            ),
            "num_vars": 1,
            "num_clauses": 1,
            "existing": False,
            "requested_core_limit": 1,
        },
    }
    receipt["receipt_sha256"] = sha256_json(receipt)
    return canonical_json_bytes(receipt).decode("utf-8") + "\n"


def _publish_fake_attempt(
    journal_root: Path,
    *,
    receipt: dict[str, object],
    current_dimacs: bytes,
    source_manifest: bytes,
    producer_manifest: bytes,
) -> tuple[Path, Path]:
    attempt = (
        journal_root
        / "attempts"
        / f"attempt-00000000-{sha256_bytes(current_dimacs)[:16]}"
    )
    artifacts = attempt / "attempt.jsonl.artifacts"
    artifacts.mkdir(parents=True, mode=0o700)
    for directory in (journal_root, journal_root / "attempts", attempt, artifacts):
        directory.chmod(0o700)
    journal_raw = b'{"synthetic":"journal"}\n'
    (attempt / "attempt.jsonl").write_bytes(journal_raw)
    (attempt / "attempt.jsonl.lock").write_bytes(b"")
    for payload in (current_dimacs, source_manifest, producer_manifest):
        (artifacts / sha256_bytes(payload)).write_bytes(payload)

    unsigned_driver_seal = {
        "schema": SEAL_SCHEMA,
        "wave_manifest_sha256": "7" * 64,
        "record_count": 1,
        "terminal_attempt_sha256": "8" * 64,
        "journal_sha256": sha256_bytes(journal_raw),
    }
    driver_seal = {
        **unsigned_driver_seal,
        "seal_sha256": sha256_json(unsigned_driver_seal),
    }
    driver_seal_raw = canonical_json_bytes(driver_seal) + b"\n"
    (attempt / "attempt.jsonl.seal.json").write_bytes(driver_seal_raw)

    published_receipt = dict(receipt)
    published_receipt.pop("receipt_sha256")
    published_receipt.update(
        attempt=0,
        attempt_directory=str(attempt),
        journal=str(attempt / "attempt.jsonl"),
        receipt_path=str(attempt / "solver-receipt.json"),
        custody_seal_path=str(attempt / "custody-seal.json"),
        journal_record_count=1,
        terminal_record_sha256="8" * 64,
        seal_sha256=driver_seal["seal_sha256"],
    )
    published_receipt["receipt_sha256"] = sha256_json(published_receipt)
    receipt_raw = canonical_json_bytes(published_receipt) + b"\n"
    receipt_path = attempt / "solver-receipt.json"
    receipt_path.write_bytes(receipt_raw)

    artifact_inventory = []
    for path in sorted(artifacts.iterdir()):
        metadata = path.stat()
        artifact_inventory.append(
            {
                "sha256": path.name,
                "size": metadata.st_size,
                "device": metadata.st_dev,
                "inode": metadata.st_ino,
            }
        )
    journal_metadata = (attempt / "attempt.jsonl").stat()
    lock_metadata = (attempt / "attempt.jsonl.lock").stat()
    receipt_metadata = receipt_path.stat()
    attempt_metadata = attempt.stat()
    inventory = {
        "journal_sha256": sha256_bytes(journal_raw),
        "journal_size": len(journal_raw),
        "journal_device": journal_metadata.st_dev,
        "journal_inode": journal_metadata.st_ino,
        "lock_device": lock_metadata.st_dev,
        "lock_inode": lock_metadata.st_ino,
        "driver_seal_sha256": sha256_bytes(driver_seal_raw),
        "artifacts": artifact_inventory,
    }
    unsigned_custody_seal = {
        "schema": CUSTODY_SEAL_SCHEMA,
        "attempt_directory_device": attempt_metadata.st_dev,
        "attempt_directory_inode": attempt_metadata.st_ino,
        "receipt_sha256": published_receipt["receipt_sha256"],
        "receipt_file_sha256": sha256_bytes(receipt_raw),
        "receipt_file_size": len(receipt_raw),
        "receipt_device": receipt_metadata.st_dev,
        "receipt_inode": receipt_metadata.st_ino,
        "inventory": inventory,
        "retry_policy": "REMOVE_UNSEALED_RESERVED_ATTEMPT",
    }
    custody_seal = {
        **unsigned_custody_seal,
        "custody_seal_sha256": sha256_json(unsigned_custody_seal),
    }
    (attempt / "custody-seal.json").write_bytes(
        canonical_json_bytes(custody_seal) + b"\n"
    )
    for path in attempt.iterdir():
        if path.is_file():
            path.chmod(0o600)
    for path in artifacts.iterdir():
        path.chmod(0o600)
    return receipt_path, artifacts / sha256_bytes(current_dimacs)


def _factory(
    tmp_path: Path,
    repo_root: Path,
    request: StructuralDiscoveryRequest,
    *,
    verdict: str,
    assignment: dict[int, bool] | None = None,
):
    proof_paths: list[Path | None] = []

    def construct(**kwargs):
        source_sha = sha256_bytes(kwargs["source_manifest"])
        producer_sha = sha256_bytes(kwargs["producer_manifest"])
        returncode = {"SAT": 10, "UNSAT": 20, "UNKNOWN": 1}[verdict]

        def runner(_cnf_path: Path, _timeout: int, proof_path: Path | None):
            proof_paths.append(proof_path)
            return StaticSolverResult(
                verdict,
                assignment or {},
                returncode,
                _receipt(
                    verdict=verdict,
                    returncode=returncode,
                    current_sha256=request.current_cnf_sha256,
                    source_sha256=source_sha,
                    producer_sha256=producer_sha,
                ),
            )

        return runner

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd."
            "make_static_piqd_solver_runner",
            side_effect=construct,
        ) as constructor,
    ):
        discovery = Exact12NextRowStructuralPiqdDiscoveryFactory(
            repo_root=repo_root,
            base_url="http://piqd.invalid",
            journal_root=tmp_path / "piqd",
            sleep=lambda _seconds: None,
        )(request)
    return discovery, proof_paths, constructor


def _replace_receipt(
    discovery: object,
    mutation,
    *,
    rehash: bool = True,
) -> None:
    original = discovery.runner

    def crossed(*args):
        result = original(*args)
        receipt = json.loads(result.stdout)
        mutation(receipt)
        if rehash:
            receipt.pop("receipt_sha256", None)
            receipt["receipt_sha256"] = sha256_json(receipt)
        return replace(
            result,
            stdout=canonical_json_bytes(receipt).decode("utf-8") + "\n",
        )

    discovery.runner = crossed


def _offline_bundle(tmp_path: Path):
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNSAT"
    )
    cnf_path = tmp_path / "run" / "discovery.cnf"
    with mock.patch(
        "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
        ("source.py",),
    ):
        discovery(
            request.instance,
            cnf_path,
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )
    assert discovery.receipt is not None
    receipt_path, current_artifact = _publish_fake_attempt(
        tmp_path / "piqd",
        receipt=dict(discovery.receipt),
        current_dimacs=request.current_dimacs,
        source_manifest=discovery.source_manifest,
        producer_manifest=discovery.producer_manifest,
    )
    return repo_root, discovery, cnf_path, receipt_path, current_artifact


def test_sat_model_is_replayed_and_piqd_receives_literal_none(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, proof_paths, constructor = _factory(
        tmp_path, repo_root, request, verdict="SAT", assignment={1: True}
    )

    with mock.patch(
        "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
        ("source.py",),
    ):
        result = discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )

    assert result.verdict == "SAT"
    assert result.positive_variables == frozenset({1})
    assert proof_paths == [None]
    assert constructor.call_args.kwargs["policy"].requested_core_limit == 1
    assert stat.S_IMODE((tmp_path / "piqd").stat().st_mode) == 0o700
    assert stat.S_IMODE((tmp_path / "run").stat().st_mode) == 0o700
    assert stat.S_IMODE((tmp_path / "run" / "discovery.cnf").stat().st_mode) == 0o600


def test_claimed_workdir_is_exactly_private_and_existing_mode_fails_closed(
    tmp_path: Path,
) -> None:
    unsafe = tmp_path / "unsafe-run"
    unsafe.mkdir(mode=0o755)
    unsafe.chmod(0o755)
    with pytest.raises(EncodingError, match="exact mode 0700"):
        _claim_empty_workdir(unsafe)

    claimed = _claim_empty_workdir(tmp_path / "new-run")
    assert stat.S_IMODE(claimed.parent.stat().st_mode) == 0o700
    claimed.unlink()


def test_discovery_rejects_non_none_proof_path_before_runner(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    with pytest.raises(Exact12NextRowStructuralPiqdError, match="proof_path=None"):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=tmp_path / "forbidden.drat",
        )
    assert proof_paths == []


@pytest.mark.parametrize("verdict", ("UNSAT", "UNKNOWN"))
def test_non_sat_piqd_results_remain_observational(
    tmp_path: Path, verdict: str
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict=verdict
    )
    with mock.patch(
        "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
        ("source.py",),
    ):
        result = discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )

    assert result.verdict == verdict
    assert not result.proof_verified
    assert proof_paths == [None]


def test_receipt_rejects_job_proof_endpoint_trace(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    _replace_receipt(
        discovery,
        lambda receipt: receipt["endpoint_trace"].append(
            {"method": "GET", "target": "/jobs/synthetic-piqd-job/proof"}
        ),
    )
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="proof endpoint"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


@pytest.mark.parametrize(
    "target",
    (
        "/jobs/synthetic-piqd-job/proof/",
        "/jobs/synthetic-piqd-job/%70roof",
        "/jobs/synthetic-piqd-job/%2570roof",
        "/jobs/synthetic-piqd-job/proof?format=drat",
        "/jobs/synthetic-piqd-job/proof#fragment",
        "http://127.0.0.1:7272/jobs/synthetic-piqd-job/proof",
        "https://attacker.invalid/jobs/synthetic-piqd-job/proof",
    ),
)
def test_receipt_rejects_ambiguous_or_absolute_proof_endpoint_forms(
    tmp_path: Path, target: str
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    _replace_receipt(
        discovery,
        lambda receipt: receipt["endpoint_trace"].append(
            {"method": "GET", "target": target}
        ),
    )
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_cross_bound_receipt_is_rejected(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    original = discovery.runner

    def crossed(*args):
        result = original(*args)
        receipt = json.loads(result.stdout)
        receipt["cnf_sha256"] = "9" * 64
        receipt.pop("receipt_sha256")
        receipt["receipt_sha256"] = sha256_json(receipt)
        return replace(
            result,
            stdout=canonical_json_bytes(receipt).decode("utf-8") + "\n",
        )

    discovery.runner = crossed
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="cross-bound"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


@pytest.mark.parametrize("hostile_kind", ("symlink", "hardlink", "directory"))
def test_staging_publication_rejects_symlink_hardlink_and_nonregular_targets(
    tmp_path: Path, hostile_kind: str
) -> None:
    staging = tmp_path / "staging"
    staging.mkdir(mode=0o700)
    target = staging / "current.cnf"
    victim = staging / "victim.cnf"
    victim.write_bytes(b"victim\n")
    victim.chmod(0o600)
    if hostile_kind == "symlink":
        target.symlink_to(victim)
    elif hostile_kind == "hardlink":
        target.hardlink_to(victim)
    else:
        target.mkdir(mode=0o700)

    with pytest.raises(Exact12NextRowStructuralPiqdError):
        _persist_current_cnf(target, b"p cnf 1 1\n1 0\n")
    assert victim.read_bytes() == b"victim\n"


def test_componentwise_capture_rejects_symlinked_intermediate_and_oversize_file(
    tmp_path: Path,
) -> None:
    real = tmp_path / "real"
    real.mkdir(mode=0o700)
    (tmp_path / "linked").symlink_to(real, target_is_directory=True)
    with pytest.raises(Exact12NextRowStructuralPiqdError, match="symlink"):
        _persist_current_cnf(tmp_path / "linked" / "current.cnf", b"p cnf 1 1\n1 0\n")

    oversized = real / "oversized"
    oversized.write_bytes(b"123456789")
    oversized.chmod(0o600)
    with pytest.raises(Exact12NextRowStructuralPiqdError, match="exceeds bound"):
        _capture_regular(oversized, maximum_bytes=8)


def test_staging_parent_rebind_is_detected_and_owned_file_is_retained(
    tmp_path: Path,
) -> None:
    staging = tmp_path / "staging"
    staging.mkdir(mode=0o700)
    held = tmp_path / "held-staging"
    original_fsync = os.fsync
    rebound = False

    def rebind_on_file_sync(descriptor: int) -> None:
        nonlocal rebound
        metadata = os.fstat(descriptor)
        if not rebound and not stat.S_ISDIR(metadata.st_mode):
            staging.rename(held)
            staging.mkdir(mode=0o700)
            rebound = True
        original_fsync(descriptor)

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.os.fsync",
            side_effect=rebind_on_file_sync,
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="rebound"),
    ):
        _persist_current_cnf(staging / "current.cnf", b"p cnf 1 1\n1 0\n")
    assert (held / "current.cnf").read_bytes() == b"p cnf 1 1\n1 0\n"
    assert not (staging / "current.cnf").exists()


def test_staging_existing_rebind_never_deletes_racer(
    tmp_path: Path,
) -> None:
    staging = tmp_path / "staging"
    staging.mkdir(mode=0o700)
    target = staging / "current.cnf"
    target.write_bytes(b"previous\n")
    target.chmod(0o600)
    held = tmp_path / "held-staging"
    hostile = b"racer\n"
    original_open = os.open
    rebound = False

    def rebind_before_existing_open(path, flags, mode=0o777, *, dir_fd=None):
        nonlocal rebound
        if (
            not rebound
            and path == "current.cnf"
            and flags & os.O_RDWR
        ):
            rebound = True
            staging.rename(held)
            staging.mkdir(mode=0o700)
            replacement = staging / "current.cnf"
            replacement.write_bytes(hostile)
            replacement.chmod(0o600)
        return original_open(path, flags, mode, dir_fd=dir_fd)

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.os.open",
            side_effect=rebind_before_existing_open,
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="rebound"),
    ):
        _persist_current_cnf(target, b"p cnf 1 1\n1 0\n")
    assert (staging / "current.cnf").read_bytes() == hostile
    assert (held / "current.cnf").is_file()


def test_discovery_rejects_journal_root_rebind_even_with_identical_descriptor(
    tmp_path: Path,
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    journal_root = tmp_path / "piqd"
    held_root = tmp_path / "held-piqd"
    journal_root.rename(held_root)
    replacement_descriptors = journal_root / "descriptors"
    replacement_descriptors.mkdir(parents=True, mode=0o700)
    journal_root.chmod(0o700)
    replacement_descriptors.chmod(0o700)
    replacement = replacement_descriptors / discovery.descriptor_path.name
    replacement.write_bytes(discovery.descriptor_bytes)
    replacement.chmod(0o600)

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="rebound"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )
    assert proof_paths == []


def test_discovery_rejects_staging_root_rebind_during_runner(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    original = discovery.runner

    def rebind_staging(*args):
        result = original(*args)
        staging = tmp_path / "run"
        staging.rename(tmp_path / "held-run")
        staging.mkdir(mode=0o700)
        replacement = staging / "discovery.cnf"
        replacement.write_bytes(request.current_dimacs)
        replacement.chmod(0o600)
        return result

    discovery.runner = rebind_staging
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="rebound"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_private_root_mode_is_exact_and_successful_publications_are_private(
    tmp_path: Path,
) -> None:
    unsafe_root = tmp_path / "unsafe"
    unsafe_root.mkdir(mode=0o755)
    unsafe_root.chmod(0o755)
    payload = b"{}\n"
    with pytest.raises(Exact12NextRowStructuralPiqdError, match="0700"):
        _install_descriptor(unsafe_root, payload, sha256_bytes(payload))

    private_root = tmp_path / "private"
    descriptor, _root_anchor, _descriptor_identity = _install_descriptor(
        private_root, payload, sha256_bytes(payload)
    )
    assert stat.S_IMODE(private_root.stat().st_mode) == 0o700
    assert stat.S_IMODE(descriptor.parent.stat().st_mode) == 0o700
    assert stat.S_IMODE(descriptor.stat().st_mode) == 0o600


def test_descriptor_create_once_race_fails_without_replacing_racer_bytes(
    tmp_path: Path,
) -> None:
    root = tmp_path / "piqd"
    payload = b'{"safe":true}\n'
    digest = sha256_bytes(payload)
    hostile = b'{"racer":true}\n'
    original_open = os.open
    raced = False

    def race_open(path, flags, mode=0o777, *, dir_fd=None):
        nonlocal raced
        if (
            not raced
            and isinstance(path, str)
            and path == f"descriptor-{digest}.json"
            and flags & os.O_EXCL
        ):
            raced = True
            attacker = original_open(
                path,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL,
                0o600,
                dir_fd=dir_fd,
            )
            os.write(attacker, hostile)
            os.fsync(attacker)
            os.close(attacker)
            raise FileExistsError(path)
        return original_open(path, flags, mode, dir_fd=dir_fd)

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.os.open",
            side_effect=race_open,
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="crossed bytes"),
    ):
        _install_descriptor(root, payload, digest)
    raced_path = root / "descriptors" / f"descriptor-{digest}.json"
    assert raced_path.read_bytes() == hostile


def test_staging_create_once_race_fails_without_replacing_racer_bytes(
    tmp_path: Path,
) -> None:
    staging = tmp_path / "staging"
    staging.mkdir(mode=0o700)
    destination = staging / "current.cnf"
    hostile = b"racer\n"
    original_open = os.open
    raced = False

    def race_open(path, flags, mode=0o777, *, dir_fd=None):
        nonlocal raced
        if not raced and path == "current.cnf" and flags & os.O_EXCL:
            raced = True
            attacker = original_open(
                path,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL,
                0o600,
                dir_fd=dir_fd,
            )
            os.write(attacker, hostile)
            os.fsync(attacker)
            os.close(attacker)
            raise FileExistsError(path)
        return original_open(path, flags, mode, dir_fd=dir_fd)

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.os.open",
            side_effect=race_open,
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="create-once"),
    ):
        _persist_current_cnf(destination, b"p cnf 1 1\n1 0\n")
    assert destination.read_bytes() == hostile


@pytest.mark.parametrize(
    "claim",
    (
        "source_entitlement",
        "theorem_coverage",
        "universal_lift",
        "lean_closure",
        "one_process",
        "one_core",
    ),
)
def test_rehashed_receipt_cannot_assert_any_false_claim(
    tmp_path: Path, claim: str
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    _replace_receipt(
        discovery, lambda receipt: receipt["claims"].__setitem__(claim, True)
    )

    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="claims"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


@pytest.mark.parametrize("crossing", ("receipt-job", "identity-job", "identity-hash"))
def test_rehashed_receipt_cannot_cross_raw_job_identity(
    tmp_path: Path, crossing: str
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )

    def cross(receipt):
        if crossing == "receipt-job":
            receipt["job_id"] = "other-job"
        elif crossing == "identity-job":
            receipt["job_identity"]["job_id"] = "other-job"
        else:
            receipt["job_identity"]["identity_hash"] = "a" * 64

    _replace_receipt(discovery, cross)
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="cross-bound"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


@pytest.mark.parametrize(
    "crossing", ("extra-receipt-key", "extra-job-key", "bool-as-int")
)
def test_receipt_requires_exact_schema_and_builtin_field_types(
    tmp_path: Path, crossing: str
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )

    def cross(receipt):
        if crossing == "extra-receipt-key":
            receipt["hostile"] = False
        elif crossing == "extra-job-key":
            receipt["job_identity"]["hostile"] = False
        else:
            receipt["job_identity"]["existing"] = 0

    _replace_receipt(discovery, cross)
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_receipt_requires_canonical_bytes_and_valid_self_hash(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    original = discovery.runner

    def noncanonical(*args):
        result = original(*args)
        return replace(
            result, stdout=json.dumps(json.loads(result.stdout), indent=2) + "\n"
        )

    discovery.runner = noncanonical
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="not canonical"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )

    discovery.runner = original
    _replace_receipt(
        discovery,
        lambda receipt: receipt.__setitem__("status_detail", "tampered"),
        rehash=False,
    )
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="hash is invalid"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_hostile_result_container_and_path_subclasses_are_rejected(
    tmp_path: Path,
) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="SAT", assignment={1: True}
    )
    original = discovery.runner

    class HostileDict(dict):
        pass

    def hostile_result(*args):
        result = original(*args)
        return replace(result, assignment=HostileDict(result.assignment))

    discovery.runner = hostile_result
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="hostile"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )

    class HostilePath(type(Path())):
        pass

    with pytest.raises(Exact12NextRowStructuralPiqdError, match="builtin Path"):
        discovery(
            request.instance,
            HostilePath(str(tmp_path / "run" / "discovery.cnf")),
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_oversize_receipt_is_rejected_before_json_decode(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    discovery, _proof_paths, _constructor = _factory(
        tmp_path, repo_root, request, verdict="UNKNOWN"
    )
    original = discovery.runner

    def oversized(*args):
        return replace(original(*args), stdout="{" + " " * MAX_RECEIPT_BYTES + "}\n")

    discovery.runner = oversized
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.DETECTOR_PATHS",
            ("source.py",),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match="byte bound"),
    ):
        discovery(
            request.instance,
            tmp_path / "run" / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )


def test_offline_validator_rebinds_descriptor_cnf_and_receipt(tmp_path: Path) -> None:
    repo_root, discovery, cnf_path, receipt_path, current_artifact = _offline_bundle(
        tmp_path
    )
    result = validate_exact12_next_row_structural_piqd_artifacts(
        repo_root=repo_root,
        descriptor_path=discovery.descriptor_path,
        current_cnf_path=cnf_path,
        receipt_path=receipt_path,
        piqd_journal_root=tmp_path / "piqd",
    )

    assert result["status"] == "VALIDATED_FINITE_LOCAL_DISCOVERY_ARTIFACTS"
    assert result["claims"]["theorem_coverage"] is False
    current_artifact.write_bytes(b"p cnf 1 1\n-1 0\n")
    with pytest.raises(Exact12NextRowStructuralPiqdError, match="artifact"):
        validate_exact12_next_row_structural_piqd_artifacts(
            repo_root=repo_root,
            descriptor_path=discovery.descriptor_path,
            current_cnf_path=cnf_path,
            receipt_path=receipt_path,
            piqd_journal_root=tmp_path / "piqd",
        )


@pytest.mark.parametrize(
    "hostile_kind", ("symlink", "hardlink", "directory", "oversize")
)
def test_offline_receipt_capture_rejects_hostile_file_kinds_and_size(
    tmp_path: Path, hostile_kind: str
) -> None:
    repo_root, discovery, cnf_path, receipt_path, _artifact = _offline_bundle(tmp_path)
    original = receipt_path.read_bytes()
    receipt_path.unlink()
    if hostile_kind == "directory":
        receipt_path.mkdir(mode=0o700)
    else:
        outside = tmp_path / "outside-receipt"
        outside.write_bytes(
            b"{" + b" " * MAX_RECEIPT_BYTES + b"}\n"
            if hostile_kind == "oversize"
            else original
        )
        outside.chmod(0o600)
        if hostile_kind == "symlink":
            receipt_path.symlink_to(outside)
        elif hostile_kind == "hardlink":
            receipt_path.hardlink_to(outside)
        else:
            receipt_path.write_bytes(outside.read_bytes())
            receipt_path.chmod(0o600)

    with pytest.raises(Exact12NextRowStructuralPiqdError):
        validate_exact12_next_row_structural_piqd_artifacts(
            repo_root=repo_root,
            descriptor_path=discovery.descriptor_path,
            current_cnf_path=cnf_path,
            receipt_path=receipt_path,
            piqd_journal_root=tmp_path / "piqd",
        )


@pytest.mark.parametrize(
    "hostile_kind", ("root-mode", "intermediate-symlink", "root-symlink")
)
def test_offline_custody_rejects_root_mode_and_directory_substitution(
    tmp_path: Path, hostile_kind: str
) -> None:
    repo_root, discovery, cnf_path, receipt_path, _artifact = _offline_bundle(tmp_path)
    journal_root = tmp_path / "piqd"
    if hostile_kind == "root-mode":
        journal_root.chmod(0o755)
    elif hostile_kind == "intermediate-symlink":
        held_attempts = journal_root / "held-attempts"
        (journal_root / "attempts").rename(held_attempts)
        (journal_root / "attempts").symlink_to(held_attempts, target_is_directory=True)
    else:
        held_root = tmp_path / "held-piqd"
        journal_root.rename(held_root)
        journal_root.symlink_to(held_root, target_is_directory=True)

    with pytest.raises(Exact12NextRowStructuralPiqdError):
        validate_exact12_next_row_structural_piqd_artifacts(
            repo_root=repo_root,
            descriptor_path=discovery.descriptor_path,
            current_cnf_path=cnf_path,
            receipt_path=receipt_path,
            piqd_journal_root=journal_root,
        )


@pytest.mark.parametrize(
    ("workers", "parallel_mode", "message"),
    ((2, "sequential", "exactly one worker"), (1, "parallel", "sequential")),
)
def test_production_route_rejects_parallelism_before_coordinator(
    tmp_path: Path, workers: int, parallel_mode: str, message: str
) -> None:
    with (
        mock.patch(
            "census.card_head.exact12_next_row_structural_piqd.run_structural_cegar",
            side_effect=AssertionError("coordinator was reached"),
        ),
        pytest.raises(Exact12NextRowStructuralPiqdError, match=message),
    ):
        run_exact12_next_row_structural_piqd(
            tmp_path,
            tmp_path / "run",
            0,
            piqd_base_url="http://piqd.invalid",
            piqd_journal_root=tmp_path / "piqd",
            workers=workers,
            parallel_mode=parallel_mode,
        )
