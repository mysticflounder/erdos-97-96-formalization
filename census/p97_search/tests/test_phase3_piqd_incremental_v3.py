from __future__ import annotations

import hashlib
import json
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_incremental_discovery as incremental
from census.p97_search import phase3_piqd_incremental_v3 as incremental_v3
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.tests.test_phase3_piqd_incremental_discovery import (
    JOB_ID,
    SEED,
    FakeSessionTransport,
)

SOURCE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
PRODUCER_CLAIMS = {
    **SOURCE_CLAIMS,
    "one_process": False,
    "one_core": False,
}


def _manifests() -> tuple[bytes, bytes]:
    source = {
        "schema": static.SOURCE_SCHEMA,
        "source_id": "p97-projected-static-v3-fixture",
        "source_path": "census/p97_search/sat_generate.py",
        "source_sha256": "a" * 64,
        "finite_schema": "p97-projected-static-v3-fixture/v1",
        "cardinality_scope": "one finite stable base CNF",
        "source_theorem": "Problem97.projectedStaticV3Fixture",
        "claims": SOURCE_CLAIMS,
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": static.PRODUCER_SCHEMA,
        "producer_id": "projected-static-v3-fixture-producer",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": "b" * 64,
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "claims": PRODUCER_CLAIMS,
    }
    return source_bytes, canonical_json_bytes(producer)


def _private_file(path: Path, data: bytes) -> None:
    path.write_bytes(data)
    path.chmod(0o600)


def _production_authority(
    tmp_path: Path, source: bytes, producer: bytes
) -> qualification.ProductionAuthorityV2:
    base_sha256 = sha256_bytes(SEED)
    producer_sha256 = sha256_bytes(producer)
    value = {
        "schema": qualification.PRODUCTION_V2_AUTHORITY_SCHEMA,
        "daemon_url": "http://piqd.test",
        "daemon_version_pre_sha256": "c" * 64,
        "source_manifest_sha256": sha256_bytes(source),
        "producer_manifest_sha256": producer_sha256,
        "base_cnf_sha256": base_sha256,
        "raw_dimacs_identity": qualification.raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=base_sha256,
            producer_manifest_sha256=producer_sha256,
            requested_core_limit=1,
        ),
        "producer_job_id": JOB_ID,
        "solver": {
            "name": "fake-cadical",
            "sha256": "a" * 64,
            "signature": "fake-cadical",
            "backend": "cadical",
            "lane": "sat",
        },
        "policy": dict(qualification.PRODUCTION_V2_POLICY),
    }
    value["authority_sha256"] = sha256_bytes(canonical_json_bytes(value))
    path = tmp_path / "production-authority-v2.json"
    path.write_bytes(canonical_json_bytes(value))
    return qualification.load_production_authority_v2(path)


def _current_cnf(*clauses: tuple[int, ...]) -> bytes:
    lines = [f"p cnf 2 {len(clauses)}\n"]
    lines.extend(" ".join(map(str, clause)) + " 0\n" for clause in clauses)
    return "".join(lines).encode()


def _receipt_digest(
    status: str,
    *,
    interrupted_by: str | None = None,
    core: list[int] | None = None,
    model: tuple[int, ...] | None = None,
) -> str:
    def literals(value: list[int] | tuple[int, ...] | None) -> bytes:
        if value is None:
            return b"-"
        ordered = sorted(value, key=lambda literal: (abs(literal), literal))
        return " ".join(str(literal) for literal in ordered).encode("ascii")

    digest = hashlib.sha256()
    digest.update(b"piqd-solve-result/v1")
    digest.update(b"\nstatus=" + status.encode("ascii"))
    digest.update(b"\ninterrupted_by=" + (interrupted_by or "").encode())
    digest.update(b"\ncore=" + literals(core))
    digest.update(b"\nmodel=" + literals(model))
    return digest.hexdigest()


def _discovery_fixture(
    status: str = "UNSAT",
    *,
    assignment: tuple[int, ...] = (),
    clauses: tuple[tuple[int, ...], ...] = ((1,), (-1,)),
    interrupted_by: str | None = None,
) -> tuple[incremental.DiscoveryResult, tuple[tuple[int, ...], ...]]:
    variable_count = max(
        (abs(literal) for clause in clauses for literal in clause), default=0
    )
    journal = b"".join(
        (
            " ".join(str(literal) for literal in clause)
            + (" " if clause else "")
            + "0\n"
        ).encode("ascii")
        for clause in clauses
    )
    core = [] if status == "UNSAT" else None
    model = assignment if status == "SAT" else None
    digest = _receipt_digest(
        status, interrupted_by=interrupted_by, core=core, model=model
    )
    receipt: dict[str, Any] = {
        "solve_index": 1,
        "base_clauses": len(clauses),
        "base_bytes": len(journal),
        "base_sha256": hashlib.sha256(journal).hexdigest(),
        "assumptions": [],
        "status": status,
        "model_recorded": status == "SAT",
        "result_sha256": digest,
        "at": 1,
    }
    if status == "UNSAT":
        receipt["core"] = []
    if interrupted_by is not None:
        receipt["interrupted_by"] = interrupted_by
    frontier_digest = hashlib.sha256()
    frontier_digest.update(
        (
            f"p97-piqd-clause-frontier-v1\np cnf {variable_count} {len(clauses)}\n"
        ).encode()
    )
    for clause in clauses:
        frontier_digest.update(
            (" ".join(str(literal) for literal in clause) + " 0\n").encode()
        )
    return (
        incremental.DiscoveryResult(
            status,
            assignment,
            1,
            digest,
            receipt,
            len(clauses),
            frontier_digest.hexdigest(),
        ),
        clauses,
    )


def _normalize_fixture(
    result: incremental.DiscoveryResult,
    clauses: tuple[tuple[int, ...], ...],
) -> incremental_v3.LegacyDiscoveryResult:
    variable_count = max(
        (abs(literal) for clause in clauses for literal in clause), default=0
    )
    return incremental_v3.normalize_discovery_result(
        result,
        frontier_variable_count=variable_count,
        frontier_clauses=clauses,
    )


def _runner(
    out: Path,
    transport: FakeSessionTransport,
    local_calls: list[tuple[Path, int, Path | None]],
) -> incremental_v3.PiqdIncrementalV3SolverRunner:
    source, producer = _manifests()

    def local_proof(
        cnf_path: Path, timeout_s: int, proof_path: Path | None
    ) -> static.StaticSolverResult:
        local_calls.append((cnf_path, timeout_s, proof_path))
        assert proof_path is not None
        proof_path.write_bytes(b"0\n")
        return static.StaticSolverResult("UNSAT", {}, 20, "local proof\n", "")

    return incremental_v3.make_piqd_incremental_v3_solver_runner(
        base_url="http://piqd.test",
        custody_root=out,
        base_cnf_path=out / "base.cnf",
        source_manifest=source,
        producer_manifest=producer,
        producer_job_id=JOB_ID,
        solver_name="fake-cadical",
        local_proof_runner=local_proof,
        transport=transport,
        allow_unqualified_test_profile=True,
    )


def test_stable_seed_appends_current_suffix_then_unsat_and_fresh_local_proof(
    tmp_path: Path,
) -> None:
    out = tmp_path / "out"
    out.mkdir(mode=0o700)
    _private_file(out / "base.cnf", SEED)
    # The first current formula is deliberately not byte-identical to the
    # stable seed: its already-established suffix must be appended after PIQD
    # session construction.
    current = _current_cnf((1, 2), (1,))
    _private_file(out / ".solver.cnf", current)
    transport = FakeSessionTransport()
    local_calls: list[tuple[Path, int, Path | None]] = []
    runner = _runner(out, transport, local_calls)

    unopened = runner.manifest_metadata()
    assert unopened["state"] == "lazy-unopened"
    assert unopened["incremental_session"] is None
    assert not any(path == "sessions" for _, path, _ in transport.calls)

    sat_result = runner(out / ".solver.cnf", 3, None)
    assert sat_result.verdict == "SAT"
    assert sat_result.returncode == 10
    assert sat_result.assignment == {1: True, 2: False}
    assert sat_result.stderr == ""
    assert len(sat_result.stdout.encode()) <= incremental_v3.MAX_NORMALIZED_LOG_BYTES
    sat_log = json.loads(sat_result.stdout)
    assert sat_log["status"] == "SAT"
    assert sat_log["proof_verified"] is False
    assert transport.clauses == [(1, 2), (1,)]
    assert local_calls == []

    transport.status = "UNSAT"
    _private_file(out / ".solver.cnf", _current_cnf((1, 2), (1,), (-1,)))
    unsat_result = runner(out / ".solver.cnf", 4, None)
    assert unsat_result.verdict == "UNSAT"
    assert unsat_result.returncode == 20
    assert unsat_result.assignment == {}
    assert transport.clauses == [(1, 2), (1,), (-1,)]
    assert local_calls == []

    terminal_cnf = out / "terminal.cnf"
    proof_path = out / "terminal.drat"
    local_result = runner(terminal_cnf, 5, proof_path)
    assert local_result.verdict == "UNSAT"
    assert proof_path.read_bytes() == b"0\n"
    assert local_calls == [(terminal_cnf, 5, proof_path)]
    assert sum(path.endswith("/solve") for _, path, _ in transport.calls) == 2

    metadata = runner.manifest_metadata()
    assert metadata["schema"] == incremental_v3.TEST_SCHEMA
    assert metadata["state"] == "open"
    assert metadata["producer_job_id"] == JOB_ID
    assert metadata["producer_job_requested_core_limit"] == 1
    assert metadata["session_resource_attestation"] == {
        "core_limit_attested": False,
        "solver_processes_attested": False,
        "cpu_affinity_attested": False,
    }
    assert metadata["incremental_session"]["schema"] == incremental.SCHEMA
    assert metadata["incremental_session"]["solve_count"] == 2
    runner.close()
    assert transport.close_calls == 1
    assert runner.manifest_metadata()["state"] == "closed"
    assert runner.manifest_metadata()["incremental_session"]["solve_count"] == 2


def test_unknown_and_seed_blob_error_fail_closed_without_local_fallback(
    tmp_path: Path,
) -> None:
    unknown_out = tmp_path / "unknown"
    unknown_out.mkdir(mode=0o700)
    _private_file(unknown_out / "base.cnf", SEED)
    _private_file(unknown_out / ".solver.cnf", SEED)
    unknown_transport = FakeSessionTransport(status="UNKNOWN")
    local_calls: list[tuple[Path, int, Path | None]] = []
    unknown_runner = _runner(unknown_out, unknown_transport, local_calls)

    result = unknown_runner(unknown_out / ".solver.cnf", 2, None)
    assert result.verdict == "UNKNOWN"
    assert result.returncode == 0
    assert result.assignment == {}
    assert result.stderr == "PIQD incremental discovery returned UNKNOWN\n"
    assert local_calls == []
    unknown_runner.close()

    mismatch_out = tmp_path / "mismatch"
    mismatch_out.mkdir(mode=0o700)
    _private_file(mismatch_out / "base.cnf", SEED)
    _private_file(mismatch_out / ".solver.cnf", SEED)
    mismatch_transport = FakeSessionTransport(job_cnf=b"not the stable seed\n")
    mismatch_runner = _runner(mismatch_out, mismatch_transport, local_calls)
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError,
        match="producer job blob bytes differ",
    ):
        mismatch_runner(mismatch_out / ".solver.cnf", 2, None)
    assert local_calls == []


def test_manifest_authentication_precedes_descriptor_and_custody_is_contained(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    out = tmp_path / "out"
    out.mkdir(mode=0o700)
    descriptor_called = False

    def descriptor(**_kwargs: Any) -> Any:
        nonlocal descriptor_called
        descriptor_called = True
        raise AssertionError("descriptor must not be constructed")

    monkeypatch.setattr(incremental, "DiscoveryDescriptor", descriptor)
    with pytest.raises(static.StaticPiqdRunnerError):
        incremental_v3.make_piqd_incremental_v3_solver_runner(
            base_url="http://piqd.test",
            custody_root=out,
            base_cnf_path=out / "base.cnf",
            source_manifest=b'{"not":"canonical"}',
            producer_manifest=b"{}",
            producer_job_id=JOB_ID,
            solver_name="fake-cadical",
            local_proof_runner=lambda *_args: pytest.fail("unexpected local call"),
        )
    assert descriptor_called is False

    source, producer = _manifests()
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError, match="escapes the custody root"
    ):
        incremental_v3.make_piqd_incremental_v3_solver_runner(
            base_url="http://piqd.test",
            custody_root=out,
            base_cnf_path=tmp_path / "outside" / "base.cnf",
            source_manifest=source,
            producer_manifest=producer,
            producer_job_id=JOB_ID,
            solver_name="fake-cadical",
            local_proof_runner=lambda *_args: pytest.fail("unexpected local call"),
        )

    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="base.cnf"):
        incremental_v3.make_piqd_incremental_v3_solver_runner(
            base_url="http://piqd.test",
            custody_root=out,
            base_cnf_path=out / "seed.cnf",
            source_manifest=source,
            producer_manifest=producer,
            producer_job_id=JOB_ID,
            solver_name="fake-cadical",
            local_proof_runner=lambda *_args: pytest.fail("unexpected local call"),
        )


def test_production_runner_requires_full_solver_and_session_identity(
    tmp_path: Path,
) -> None:
    out = tmp_path / "out"
    out.mkdir(mode=0o700)
    _private_file(out / "base.cnf", SEED)
    source, producer = _manifests()
    with pytest.raises(
        incremental_v3.PiqdIncrementalV3Error,
        match="production PIQD requires transport, solver SHA/signature",
    ):
        incremental_v3.make_piqd_incremental_v3_solver_runner(
            base_url="http://piqd.test",
            custody_root=out,
            base_cnf_path=out / "base.cnf",
            source_manifest=source,
            producer_manifest=producer,
            producer_job_id=JOB_ID,
            solver_name="fake-cadical",
            local_proof_runner=lambda *_args: pytest.fail("unexpected local call"),
        )
    with pytest.raises(
        incremental_v3.PiqdIncrementalV3Error,
        match="preflight qualification transport",
    ):
        incremental_v3.make_piqd_incremental_v3_solver_runner(
            base_url="http://piqd.test",
            custody_root=out,
            base_cnf_path=out / "base.cnf",
            source_manifest=source,
            producer_manifest=producer,
            producer_job_id=JOB_ID,
            solver_name="fake-cadical",
            local_proof_runner=lambda *_args: pytest.fail("unexpected local call"),
            transport=FakeSessionTransport(),
            expected_solver_sha256="1" * 64,
            expected_solver_signature="cadical-test",
            session_identity_evidence_path=(out / qualification.IDENTITY_NAME),
        )


def test_production_v2_prepares_qualified_transport_and_recovers_lost_close_once(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    out = tmp_path / "out"
    out.mkdir(mode=0o700)
    _private_file(out / "base.cnf", SEED)
    _private_file(out / ".solver.cnf", SEED)
    source, producer = _manifests()
    source_path = tmp_path / "source.json"
    producer_path = tmp_path / "producer.json"
    source_path.write_bytes(source)
    producer_path.write_bytes(producer)
    authority = _production_authority(tmp_path, source, producer)
    transport = FakeSessionTransport(close_transport_loss=True)

    class Contract:
        def __init__(self) -> None:
            self.transport = transport

    contract = Contract()
    prepared: list[dict[str, Any]] = []

    def prepare(**kwargs: Any) -> Any:
        prepared.append(kwargs)
        return contract

    finalized: list[tuple[Any, str]] = []

    def finalize(actual: Any, *, driver_status: str) -> dict[str, Any]:
        finalized.append((actual, driver_status))
        return {"sealed": False}

    monkeypatch.setattr(qualification, "prepare_production_qualification_v2", prepare)
    monkeypatch.setattr(qualification, "finalize_production_qualification_v2", finalize)
    runner = incremental_v3.make_piqd_incremental_v3_solver_runner(
        base_url="http://piqd.test",
        custody_root=out,
        base_cnf_path=out / "base.cnf",
        source_manifest=source,
        producer_manifest=producer,
        producer_job_id=JOB_ID,
        solver_name="fake-cadical",
        local_proof_runner=lambda *_args: pytest.fail("unexpected local proof"),
        production_authority=authority,
        source_manifest_path=source_path,
        producer_manifest_path=producer_path,
        transport=transport,
    )

    result = runner(out / ".solver.cnf", 2, None)
    assert result.verdict == "SAT"
    assert len(prepared) == 1
    assert prepared[0]["authority"] is authority
    assert prepared[0]["transport"] is transport
    runner.close()
    assert transport.close_calls == 1
    assert transport.closed is True
    assert runner.finalize_qualification("UNKNOWN") == {"sealed": False}
    assert finalized == [(contract, "UNKNOWN")]


def test_normalization_rejects_false_proof_authority() -> None:
    digest = hashlib.sha256(b"result").hexdigest()
    result = incremental.DiscoveryResult(
        "UNSAT",
        (),
        1,
        digest,
        {
            "status": "UNSAT",
            "solve_index": 1,
            "result_sha256": digest,
            "base_clauses": 2,
        },
        2,
        hashlib.sha256(b"frontier").hexdigest(),
        proof_verified=True,
    )
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="proof"):
        incremental_v3.normalize_discovery_result(result)


@pytest.mark.parametrize(
    ("field", "value", "match"),
    [
        ("status", ["SAT"], "status"),
        ("status", "failed", "status"),
        ("solve_index", True, "solve_index"),
        ("frontier_count", 1.0, "frontier_count"),
        ("result_sha256", "bad", "result_sha256"),
        ("frontier_sha256", "F" * 64, "frontier_sha256"),
        ("receipt", {}, "inexact schema"),
    ],
)
def test_normalization_rejects_malformed_result_boundary(
    field: str, value: Any, match: str
) -> None:
    valid, clauses = _discovery_fixture()
    result = replace(valid, **{field: value})
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match=match):
        _normalize_fixture(result, clauses)


@pytest.mark.parametrize("field", ["solve_index", "base_clauses"])
def test_normalization_rejects_bool_receipt_integer_alias(field: str) -> None:
    valid, clauses = _discovery_fixture()
    receipt = dict(valid.receipt)
    receipt[field] = True
    result = replace(valid, receipt=receipt)
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match=field):
        _normalize_fixture(result, clauses)


@pytest.mark.parametrize(
    ("mutation", "match"),
    [
        ({"EXTRA": "accepted"}, "inexact schema"),
        ({"base_bytes": None}, "inexact schema"),
    ],
)
def test_normalization_rejects_receipt_schema_substitution(
    mutation: dict[str, Any], match: str
) -> None:
    valid, clauses = _discovery_fixture()
    receipt = dict(valid.receipt)
    if mutation == {"base_bytes": None}:
        del receipt["base_bytes"]
    else:
        receipt.update(mutation)
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match=match):
        _normalize_fixture(replace(valid, receipt=receipt), clauses)


class _IntSubclass(int):
    pass


class _StrSubclass(str):
    pass


class _ListSubclass(list[Any]):
    pass


class _DictSubclass(dict[str, Any]):
    pass


@pytest.mark.parametrize(
    ("field", "value", "match"),
    [
        ("base_bytes", True, "base_bytes"),
        ("base_bytes", 4.0, "base_bytes"),
        ("at", _IntSubclass(1), "receipt at"),
        ("status", _StrSubclass("UNSAT"), "receipt status"),
        ("assumptions", _ListSubclass(), "assumptions"),
        ("model_recorded", 0, "model_recorded"),
        ("core", (), "receipt core"),
    ],
)
def test_normalization_rejects_non_builtin_receipt_values(
    field: str, value: Any, match: str
) -> None:
    valid, clauses = _discovery_fixture()
    receipt = dict(valid.receipt)
    receipt[field] = value
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match=match):
        _normalize_fixture(replace(valid, receipt=receipt), clauses)


def test_normalization_rejects_receipt_dict_subclass() -> None:
    valid, clauses = _discovery_fixture()
    with pytest.raises(
        incremental_v3.PiqdIncrementalV3Error, match="exact builtin dict"
    ):
        _normalize_fixture(
            replace(valid, receipt=_DictSubclass(valid.receipt)), clauses
        )


def test_normalization_rejects_receipt_key_subclass() -> None:
    valid, clauses = _discovery_fixture()
    receipt = dict(valid.receipt)
    at = receipt.pop("at")
    receipt[_StrSubclass("at")] = at
    with pytest.raises(
        incremental_v3.PiqdIncrementalV3Error, match="builtin string keys"
    ):
        _normalize_fixture(replace(valid, receipt=receipt), clauses)


def test_normalization_recomputes_unsat_and_unknown_digest_semantics() -> None:
    valid, clauses = _discovery_fixture()
    resigned = "f" * 64
    receipt = {**valid.receipt, "result_sha256": resigned}
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="result digest"):
        _normalize_fixture(
            replace(valid, result_sha256=resigned, receipt=receipt), clauses
        )

    unknown, unknown_clauses = _discovery_fixture(
        "UNKNOWN", interrupted_by="daemon_deadline"
    )
    crossed_receipt = dict(unknown.receipt)
    crossed_receipt["core"] = []
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="UNKNOWN"):
        _normalize_fixture(replace(unknown, receipt=crossed_receipt), unknown_clauses)


def test_normalization_independently_replays_total_sat_model() -> None:
    clauses = ((1, 2), (-2,))
    valid, _ = _discovery_fixture("SAT", assignment=(1, -2), clauses=clauses)
    normalized = _normalize_fixture(valid, clauses)
    assert normalized.verdict == "SAT"
    assert normalized.assignment == {1: True, 2: False}

    crossed, _ = _discovery_fixture("SAT", assignment=(-1, -2), clauses=clauses)
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="replay"):
        _normalize_fixture(crossed, clauses)

    non_total, _ = _discovery_fixture("SAT", assignment=(1, -3), clauses=clauses)
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="total"):
        _normalize_fixture(non_total, clauses)


def test_normalization_rejects_crossed_sat_frontier_receipt() -> None:
    authenticated_clauses = ((1,), (2,))
    crossed_clauses = ((1,), (-2,))
    crossed, _ = _discovery_fixture("SAT", assignment=(1, -2), clauses=crossed_clauses)
    with pytest.raises(incremental_v3.PiqdIncrementalV3Error, match="journal identity"):
        _normalize_fixture(crossed, authenticated_clauses)


def test_run_driver_selects_incremental_composite_at_existing_solver_seam(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    out = tmp_path / "driver"
    config = v3._IncrementalPiqdCallerConfig(
        base_url="http://piqd.test",
        custody_root=out,
        source_manifest=tmp_path / "source.json",
        producer_manifest=tmp_path / "producer.json",
        producer_job_id=JOB_ID,
        solver_name="fake-cadical",
    )
    captured: dict[str, Any] = {}
    discovery_calls: list[tuple[Path, int, Path | None]] = []

    def injected_backend(
        cnf_path: Path, timeout_s: int, proof_path: Path | None
    ) -> static.StaticSolverResult:
        discovery_calls.append((cnf_path, timeout_s, proof_path))
        return static.StaticSolverResult("UNKNOWN", {}, 0, "", "remote unknown")

    def factory(
        actual: v3._IncrementalPiqdCallerConfig,
        *,
        base_cnf_path: Path,
        local_proof_runner: Any,
    ) -> Any:
        captured.update(
            {
                "config": actual,
                "base_cnf_path": base_cnf_path,
                "local_proof_runner": local_proof_runner,
            }
        )
        return injected_backend

    def local_solver(*_args: Any) -> Any:
        pytest.fail("local solver must not be a PIQD discovery fallback")

    monkeypatch.setattr(v3, "_incremental_solver_runner_from_config", factory)
    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        persistent_discovery=True,
        piqd_incremental_config=config,
        solver_runner=local_solver,
    )

    assert result["status"] == "UNKNOWN"
    assert result["configuration"]["solver_protocol"]["discovery"] == (
        "proof-free persistent PIQD incremental CaDiCaL session"
    )
    assert result["configuration"]["solver_protocol"]["incremental"] == {
        "enabled": True,
        "schema": incremental_v3.SCHEMA,
        "append_only_formula": True,
        "resume": "fresh session only; resume rejected",
        "proof_boundary": "outside incremental session",
    }
    assert captured == {
        "config": config,
        "base_cnf_path": out / "base.cnf",
        "local_proof_runner": local_solver,
    }
    assert discovery_calls == [(out / ".solver.cnf", 5, None)]
    assert (out / "base.cnf").is_file()
