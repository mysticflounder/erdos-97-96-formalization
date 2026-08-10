from __future__ import annotations

import json
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_exact12_source54_package import LoadedPackage
from census.p97_search.phase3_piqd_exact12_source54_runner import (
    ATTESTATION_BASIS,
    RUN_RECEIPT_SCHEMA,
    SOURCE54_BANK_BODY_SHA256,
    SOURCE54_BANK_FILE_SHA256,
    RunPacket,
    Source54RunnerError,
    _derive_execution_wave,
    _run_packet,
    validate_run_receipt,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PreparedJob,
    raw_dimacs_identity,
)

SAT_CNF = b"p cnf 2 2\n1 0\n-1 2 0\n"
_MISSING = object()


def test_exact54_bank_identity_pins_are_independent() -> None:
    assert SOURCE54_BANK_BODY_SHA256 == (
        "4fe83285d1336a8aaa21906cfa460893ab2eb8fa8b3f2318c98fd0f7cfc0dbd9"
    )
    assert SOURCE54_BANK_FILE_SHA256 == (
        "fa138c495c1f425e18a57cfb5e916eabdbe87dffb1e4e21d7488ce8eda399d4b"
    )
    assert SOURCE54_BANK_BODY_SHA256 != SOURCE54_BANK_FILE_SHA256


def _fixture_bank_identity() -> dict[str, str | None]:
    return {
        "canonical_body_sha256": "3" * 64,
        "package_file_sha256": None,
        "producer_compiler_replay_sha256": "3" * 64,
    }


def _packet(cnf: bytes = SAT_CNF) -> RunPacket:
    bank_digest = "3" * 64
    body = {
        "fixture": "source54-runner-known-result",
        "compiler_replay": {"source_order_bank_sha256": bank_digest},
    }
    body_digest = sha256_json(body)
    producer = canonical_json_bytes(
        {**body, "identity": {"canonical_body_sha256": body_digest}}
    )
    header = cnf.splitlines()[0].split()
    package_wave = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "exact12-source54-cell8-fixture",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.fixture",
            "ingress_hypotheses_sha256": "1" * 64,
            "finite_schema": "fixture/v1",
            "cardinality_scope": "fixture",
            "source_theorem": "NONE_SOURCE_ENTITLEMENT_FALSE",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(cnf),
            "variable_map_sha256": sha256_json({}),
            "producer_manifest_sha256": sha256_bytes(producer),
            "num_variables": int(header[2]),
            "num_clauses": int(header[3]),
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        },
        "execution": {
            "backend": "piqd-raw-dimacs",
            "solver_profile": "runner-supplied",
            "shard_id": 8,
            "shard_count": 648,
            "order_sha256": "2" * 64,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": "LOCAL_CERTIFICATE",
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    run_wave = {
        **package_wave,
        "execution": {
            **package_wave["execution"],
            "backend": "cadical",
            "solver_profile": "sat",
        },
    }
    return RunPacket(
        packet_id=run_wave["wave_id"],
        cnf=cnf,
        producer_manifest=producer,
        package_wave_manifest=canonical_json_bytes(package_wave),
        wave_manifest=run_wave,
        variable_map={},
        package_artifact_sha256={
            "discovery.cnf": sha256_bytes(cnf),
            "producer-manifest.json": sha256_bytes(producer),
        },
        producer_manifest_file_sha256=sha256_bytes(producer),
        producer_manifest_canonical_body_sha256=body_digest,
        source_order_bank_sha256=bank_digest,
        source54_package=False,
    )


class FakeDaemon:
    def __init__(
        self,
        *,
        cnf: bytes = SAT_CNF,
        result: str = "SAT",
        assignment: tuple[int, ...] = (1, 2),
        status_id: str = "source54-job-1",
        status_state: str = "completed",
        requested_core_limit: Any = 1,
        attested_solver_processes: Any = 1,
        attestation_basis: Any = ATTESTATION_BASIS,
        solver_log: Any = _MISSING,
    ) -> None:
        self.cnf = cnf
        self.result = result
        self.assignment = assignment
        self.status_id = status_id
        self.status_state = status_state
        self.requested_core_limit = requested_core_limit
        self.attested_solver_processes = attested_solver_processes
        self.attestation_basis = attestation_basis
        self.solver_log = solver_log
        self.calls = {"prepare": 0, "confirm": 0, "status": 0, "model": 0, "log": 0}

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        self.calls["prepare"] += 1
        assert kwargs["requested_core_limit"] == 1
        cnf_hash = sha256_bytes(kwargs["cnf"])
        return PreparedJob(
            job_id="source54-job-1",
            backend="cadical",
            solver_profile="sat",
            cnf_blob_hash=cnf_hash,
            identity_hash=raw_dimacs_identity(
                backend="cadical",
                solver_profile="sat",
                cnf_sha256=cnf_hash,
                producer_manifest_sha256=sha256_bytes(kwargs["producer_manifest"]),
                requested_core_limit=1,
            ),
            num_vars=kwargs["wave_manifest"]["encoding"]["num_variables"],
            num_clauses=kwargs["wave_manifest"]["encoding"]["num_clauses"],
            existing=False,
            requested_core_limit=1,
        )

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self.calls["confirm"] += 1
        assert expected_cnf == self.cnf
        return "confirmed"

    def status(self, job_id: str) -> dict[str, Any]:
        self.calls["status"] += 1
        return {
            "id": self.status_id,
            "status": self.status_state,
            "result": self.result,
            "requested_core_limit": self.requested_core_limit,
            "attested_solver_processes": self.attested_solver_processes,
            "attestation_basis": self.attestation_basis,
        }

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        self.calls["model"] += 1
        body = canonical_json_bytes(
            {"id": job.job_id, "result": "SAT", "assignment": self.assignment}
        )
        return CheckedModel(self.assignment, sha256_bytes(body), body)

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        self.calls["log"] += 1
        payload = self.solver_log
        if payload is _MISSING:
            payload = f"s {self.result}\n".encode()
        return payload, sha256_bytes(payload)

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        raise AssertionError("this discovery runner must not retrieve a proof")


def _run(tmp_path: Path, daemon: FakeDaemon, packet: RunPacket | None = None):
    return _run_packet(
        packet or _packet(),
        client=daemon,
        journal_path=tmp_path / "attempts.jsonl",
        receipt_path=tmp_path / "receipt.json",
        semantic_validator=lambda _assignment: {"0": [1, 2]},
        max_polls=1,
        poll_interval_s=0,
    )


def test_sat_receipt_binds_serial_run_model_log_and_semantic_replay(
    tmp_path: Path,
) -> None:
    daemon = FakeDaemon()
    run = _run(tmp_path, daemon)
    receipt = run.receipt
    assert run.driver_result.outcome == STRUCTURAL_SAT
    assert receipt["schema"] == RUN_RECEIPT_SCHEMA
    assert receipt["sat_semantic_replay"]["performed"] is True
    assert receipt["sat_semantic_replay"]["every_clause_satisfied"] is True
    assert (
        receipt["journal"]["terminal_model_sha256"]
        in receipt["journal"]["artifact_sha256"]
    )
    assert (
        receipt["journal"]["terminal_solver_log_sha256"]
        in receipt["journal"]["artifact_sha256"]
    )
    assert receipt["journal"]["terminal_status_raw_available"] is False
    assert receipt["journal"]["terminal_status_raw_sha256"] is None
    assert receipt["source_order_bank_identity"] == _fixture_bank_identity()
    assert not any(receipt["claims"].values())
    assert daemon.calls == {
        "prepare": 1,
        "confirm": 1,
        "status": 1,
        "model": 1,
        "log": 1,
    }


def test_package_wave_is_preserved_while_execution_wave_is_derived() -> None:
    base = _packet()
    package_wave = {
        **base.wave_manifest,
        "execution": {
            **base.wave_manifest["execution"],
            "backend": "piqd-raw-dimacs",
            "solver_profile": "runner-supplied",
        },
    }
    package_bytes = canonical_json_bytes(package_wave)
    run_wave = _derive_execution_wave(package_wave)
    assert canonical_json_bytes(package_wave) == package_bytes
    assert package_wave["execution"]["backend"] == "piqd-raw-dimacs"
    assert run_wave["execution"]["backend"] == "cadical"
    assert run_wave["execution"]["solver_profile"] == "sat"


def test_package_inventory_accepts_self_describing_index() -> None:
    import census.p97_search.phase3_piqd_exact12_source54_runner as runner

    artifacts = {name: name.encode("ascii") for name in runner._PACKAGE_FILES}
    records = [
        {
            "name": name,
            "bytes": len(artifacts[name]),
            "file_sha256": sha256_bytes(artifacts[name]),
        }
        for name in runner._PACKAGE_FILES
    ]
    index = {
        "schema": runner.INDEX_SCHEMA,
        "package_schema": runner.PACKAGE_SCHEMA,
        "create_once": True,
        "artifacts": records,
        "artifacts_sha256": sha256_json(records),
    }
    artifacts["package-index.json"] = canonical_json_bytes(index)
    loaded = LoadedPackage(directory=Path("."), artifacts=artifacts)

    hashes = runner._validate_package_inventory(loaded)

    assert set(hashes) == set(artifacts)
    assert hashes["package-index.json"] == sha256_bytes(artifacts["package-index.json"])

    with_extra = {**artifacts, "unexpected.json": b"{}"}
    with pytest.raises(Source54RunnerError, match="artifact set drifted"):
        runner._validate_package_inventory(
            LoadedPackage(directory=Path("."), artifacts=with_extra)
        )

    reversed_records = list(reversed(records))
    reordered_index = {
        **index,
        "artifacts": reversed_records,
        "artifacts_sha256": sha256_json(reversed_records),
    }
    reordered_artifacts = {
        **artifacts,
        "package-index.json": canonical_json_bytes(reordered_index),
    }
    with pytest.raises(Source54RunnerError, match="artifact record drifted"):
        runner._validate_package_inventory(
            LoadedPackage(directory=Path("."), artifacts=reordered_artifacts)
        )


def test_clause_anomaly_scan_counts_all_clauses_and_rejects_scalar_subclasses() -> None:
    import census.p97_search.phase3_piqd_exact12_source54_runner as runner

    clean = {
        "clauses_scanned": runner.NUM_CLAUSES,
        "tautological_clauses": 0,
        "repeated_literal_clauses": 0,
        "empty_clauses": 0,
    }
    runner._validate_clause_anomaly_scan(clean)

    with pytest.raises(Source54RunnerError, match="anomaly scan"):
        runner._validate_clause_anomaly_scan({**clean, "clauses_scanned": 0})
    with pytest.raises(Source54RunnerError, match="anomaly scan"):
        runner._validate_clause_anomaly_scan({**clean, "empty_clauses": False})


def test_packet_ingestion_live_calls_exact_source_bank_validator(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    import census.p97_search.phase3_piqd_exact12_source54_runner as runner

    artifacts = {name: b"{}" for name in runner._PACKAGE_FILES}
    artifacts["discovery.cnf"] = SAT_CNF
    bound_job = {"cell_index": runner.CELL_INDEX}
    bank = {"sentinel": "must-be-validated"}
    loaded = SimpleNamespace(
        artifacts=artifacts,
        producer_manifest={},
        wave_manifest={},
        variable_map={},
    )
    monkeypatch.setattr(
        runner,
        "_validate_package_inventory",
        lambda _package: {
            name: sha256_bytes(payload) for name, payload in artifacts.items()
        },
    )
    monkeypatch.setattr(
        runner,
        "SOURCE54_BANK_FILE_SHA256",
        sha256_bytes(artifacts["source-order-bank.json"]),
    )
    monkeypatch.setattr(runner, "CNF_BYTES", len(SAT_CNF))
    monkeypatch.setattr(runner, "CNF_SHA256", sha256_bytes(SAT_CNF))
    monkeypatch.setattr(runner, "NUM_VARIABLES", 2)
    monkeypatch.setattr(runner, "NUM_CLAUSES", 2)
    monkeypatch.setattr(runner, "JOB_SHA256", sha256_json(bound_job))
    monkeypatch.setattr(runner, "_validate_total_map_boundary", lambda *_args: None)
    parsed = {
        "producer-manifest.json": {},
        "wave-manifest.json": {},
        "variable-map.json": {},
        "source-order-bank.json": bank,
        "order.json": {},
        "bound-job.json": bound_job,
    }
    monkeypatch.setattr(
        runner,
        "_canonical_object",
        lambda _payload, *, source: parsed[source],
    )

    class BankValidatorReached(Exception):
        pass

    def reject_bank(value: object) -> None:
        assert value is bank
        raise BankValidatorReached

    monkeypatch.setattr(runner, "_validate_source_bank", reject_bank)
    with pytest.raises(BankValidatorReached):
        runner.packet_from_package(loaded)


def test_receipt_distinguishes_producer_file_and_canonical_body_digests(
    tmp_path: Path,
) -> None:
    packet = _packet()
    assert (
        packet.producer_manifest_file_sha256
        != packet.producer_manifest_canonical_body_sha256
    )
    receipt = _run(tmp_path, FakeDaemon(), packet).receipt
    assert receipt["producer_manifest_file_sha256"] == sha256_bytes(
        packet.producer_manifest
    )
    assert (
        receipt["producer_manifest_canonical_body_sha256"]
        == packet.producer_manifest_canonical_body_sha256
    )


def test_current_failed_state_uses_exact_null_no_solver_attestation(
    tmp_path: Path,
) -> None:
    daemon = FakeDaemon(
        result="UNKNOWN",
        status_state="failed",
        attested_solver_processes=None,
        attestation_basis=None,
    )
    run = _run(tmp_path, daemon)
    assert run.driver_result.outcome == ERROR
    assert run.receipt["terminal_status"] == "failed"
    assert run.receipt["terminal_result"] == "UNKNOWN"
    assert (
        run.receipt["solver_process_attestation"]["no_solver_run_state_accepted"]
        is True
    )
    assert run.receipt["source_order_bank_identity"] == _fixture_bank_identity()
    assert daemon.calls["model"] == daemon.calls["log"] == 0


def test_unsat_receipt_still_binds_source_bank_identity(tmp_path: Path) -> None:
    run = _run(tmp_path, FakeDaemon(result="UNSAT"))
    assert run.driver_result.outcome == DISCOVERY_UNSAT
    assert run.receipt["source_order_bank_identity"] == _fixture_bank_identity()


@pytest.mark.parametrize(
    ("assignment", "match"),
    [
        ((1,), "SAT run lacks model artifact"),
        ((1, 1), "SAT run lacks model artifact"),
        ((-1, 2), "SAT run lacks model artifact"),
        ((1, 3), "SAT run lacks model artifact"),
    ],
)
def test_incomplete_duplicate_unsatisfying_or_out_of_range_model_has_no_receipt(
    tmp_path: Path, assignment: tuple[int, ...], match: str
) -> None:
    with pytest.raises(Source54RunnerError, match=match):
        _run(tmp_path, FakeDaemon(assignment=assignment))
    assert not (tmp_path / "receipt.json").exists()


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("status_id", "foreign-job"),
        ("requested_core_limit", 2),
        ("requested_core_limit", True),
        ("attested_solver_processes", 2),
        ("attested_solver_processes", 1.0),
        ("attestation_basis", "PROCESS_COUNT_GUESSED"),
    ],
)
def test_foreign_status_or_attestation_tamper_has_no_receipt(
    tmp_path: Path, field: str, value: Any
) -> None:
    with pytest.raises(Source54RunnerError):
        _run(tmp_path, FakeDaemon(**{field: value}))
    assert not (tmp_path / "receipt.json").exists()


@pytest.mark.parametrize("cnf", [b"p cnf 0 0\n", b"p cnf 1 0\n"])
def test_vacuous_cnf_is_rejected_before_daemon(tmp_path: Path, cnf: bytes) -> None:
    daemon = FakeDaemon(cnf=cnf)
    with pytest.raises(Source54RunnerError, match="vacuous"):
        _run(tmp_path, daemon, _packet(cnf))
    assert daemon.calls["prepare"] == 0


def test_nonempty_completed_solver_log_is_mandatory(tmp_path: Path) -> None:
    with pytest.raises(Source54RunnerError, match="completed run lacks solver log"):
        _run(tmp_path, FakeDaemon(solver_log=b""))
    assert not (tmp_path / "receipt.json").exists()


def test_receipt_is_create_once(tmp_path: Path) -> None:
    (tmp_path / "receipt.json").write_bytes(b"occupied")
    with pytest.raises(Source54RunnerError, match="create-once"):
        _run(tmp_path, FakeDaemon())


def test_receipt_self_hash_and_journal_tamper_fail_closed(tmp_path: Path) -> None:
    packet = _packet()
    _run(tmp_path, FakeDaemon(), packet)
    receipt_path = tmp_path / "receipt.json"
    receipt_path.write_bytes(
        receipt_path.read_bytes().replace(b'"packet_id"', b'"packet_ix"')
    )
    with pytest.raises(Source54RunnerError):
        validate_run_receipt(
            receipt_path, packet=packet, journal_path=tmp_path / "attempts.jsonl"
        )


def test_rehashed_receipt_cannot_expand_attestation_schema(tmp_path: Path) -> None:
    packet = _packet()
    _run(tmp_path, FakeDaemon(), packet)
    receipt_path = tmp_path / "receipt.json"
    receipt = json.loads(receipt_path.read_bytes())
    receipt["solver_process_attestation"]["guessed_parallelism"] = False
    unsigned = dict(receipt)
    unsigned.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(unsigned)
    receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Source54RunnerError, match="process/core enforcement"):
        validate_run_receipt(
            receipt_path, packet=packet, journal_path=tmp_path / "attempts.jsonl"
        )


def test_packet_rejects_producer_body_digest_tamper_before_daemon(
    tmp_path: Path,
) -> None:
    packet = replace(_packet(), producer_manifest_canonical_body_sha256="f" * 64)
    daemon = FakeDaemon()
    with pytest.raises(Source54RunnerError, match="canonical-body"):
        _run(tmp_path, daemon, packet)
    assert daemon.calls["prepare"] == 0


def test_packet_rejects_source_bank_substitution_before_daemon(
    tmp_path: Path,
) -> None:
    packet = replace(_packet(), source_order_bank_sha256="f" * 64)
    daemon = FakeDaemon()
    with pytest.raises(Source54RunnerError, match="producer source-order bank"):
        _run(tmp_path, daemon, packet)
    assert daemon.calls["prepare"] == 0


def test_run_directory_substitution_fails_and_cleans_held_inode(
    tmp_path: Path,
) -> None:
    daemon = FakeDaemon()
    original_prepare = daemon.prepare_cnf
    displaced = tmp_path.with_name(f"{tmp_path.name}-displaced")

    def substitute_directory(**kwargs: Any) -> PreparedJob:
        tmp_path.rename(displaced)
        tmp_path.mkdir()
        return original_prepare(**kwargs)

    daemon.prepare_cnf = substitute_directory  # type: ignore[method-assign]
    with pytest.raises(Source54RunnerError, match="pathname changed"):
        _run(tmp_path, daemon)
    assert not list(displaced.iterdir())
    assert not list(tmp_path.iterdir())
