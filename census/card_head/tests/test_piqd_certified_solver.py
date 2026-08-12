# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

from __future__ import annotations

from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.card_head.piqd_certified_solver import (
    PiqdCertifiedSolver,
    PiqdCertifiedSolverError,
    PiqdPerQueryCertifiedSolver,
)
from census.card_head.sat_encoding import EncodingError
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    canonical_json_bytes,
    sha256_bytes,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_card_head_adapter import (
    CERTIFICATE_KIND,
    AuthenticatedPackageSnapshot,
    CardHeadPiqdPacket,
    CardHeadPiqdRequest,
)
from census.p97_search.phase3_piqd_clause_map import (
    CERTIFICATE_BOUNDARY,
    CLAUSE_MAP_VERSION,
    EXPANSION_RULE,
)
from census.p97_search.phase3_piqd_driver import (
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    DriverResult,
)
from census.p97_search.phase3_piqd_oracle import PreparedJob, raw_dimacs_identity
from census.p97_search.phase3_piqd_replay import (
    NORMALIZATION_SCHEMA,
    REPLAY_SCHEMA,
    LeanLratReplayer,
    LratReplayResult,
    canonical_kept_dimacs,
    lean_checker_source,
)

PRODUCER = canonical_json_bytes(
    {"schema": "certified-test-producer/v1", "semantic_status": "FINITE_LOCAL"}
)
VALID_LRAT = b"3 0 1 2 0\n"


def _digest(character: str) -> str:
    return character * 64


def _wave(cnf: bytes, *, profile: str) -> bytes:
    header = cnf.splitlines()[0].split()
    return canonical_json_bytes(
        {
            "schema": "p97-cegar-wave/v1",
            "wave_id": f"certified-{profile}-fixture",
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": "Problem97.certifiedFixture",
                "ingress_hypotheses_sha256": _digest("1"),
                "finite_schema": "certified-fixture/v1",
                "cardinality_scope": "one finite fixture",
                "source_theorem": "Problem97.certifiedFixtureSource",
            },
            "encoding": {
                "cnf_sha256": sha256_bytes(cnf),
                "variable_map_sha256": _digest("2"),
                "producer_manifest_sha256": sha256_bytes(PRODUCER),
                "num_variables": int(header[2]),
                "num_clauses": int(header[3]),
                "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": profile,
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": _digest("3"),
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
    )


class FixtureInstance:
    def __init__(self, cnf: bytes, *, decoded: object = None) -> None:
        self._cnf = cnf
        self.decoded = {0: [0]} if decoded is None else decoded
        self.decode_calls: list[frozenset[int]] = []

    def dimacs(self, _extra_clauses: object = ()) -> str:
        return self._cnf.decode("ascii")

    def decode_model(self, positive: frozenset[int]) -> object:
        self.decode_calls.append(positive)
        if isinstance(self.decoded, Exception):
            raise self.decoded
        return self.decoded


class MultiQueryInstance(FixtureInstance):
    def dimacs(self, extra_clauses: object = ()) -> str:
        clauses = [(1,)] + [tuple(clause) for clause in extra_clauses]  # type: ignore[union-attr]
        body = "".join(
            " ".join(str(item) for item in clause) + " 0\n" for clause in clauses
        )
        return f"p cnf 1 {len(clauses)}\n{body}"


class UnusedReplayer:
    def replay(self, **_kwargs: object) -> LratReplayResult:
        raise AssertionError("SAT/UNKNOWN must not invoke the LRAT replayer")


def _package(cnf: bytes, *, profile: str) -> AuthenticatedPackageSnapshot:
    return AuthenticatedPackageSnapshot(cnf, PRODUCER, _wave(cnf, profile=profile))


def _job(package: AuthenticatedPackageSnapshot) -> PreparedJob:
    profile = package.wave_manifest["execution"]["solver_profile"]
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile=profile,
        cnf_sha256=package.cnf_sha256,
        producer_manifest_sha256=package.producer_manifest_sha256,
        requested_core_limit=1,
    )
    return PreparedJob(
        "job-certified",
        "cadical",
        profile,
        package.cnf_sha256,
        identity,
        package.num_vars,
        package.num_clauses,
        False,
        1,
    )


def _map_bytes(cnf: bytes) -> bytes:
    kept = canonical_kept_dimacs(cnf)
    clauses = int(cnf.splitlines()[0].split()[3])
    kept_clauses = int(kept.splitlines()[0].split()[3])
    return canonical_json_bytes(
        {
            "version": CLAUSE_MAP_VERSION,
            "submitted_sha256": sha256_bytes(cnf),
            "submitted_clauses": clauses,
            "kept_sha256": sha256_bytes(kept),
            "kept_clauses": kept_clauses,
            "exceptions": [],
            "expansion_rule": EXPANSION_RULE,
            "boundary": CERTIFICATE_BOUNDARY,
        }
    )


def _status(
    package: AuthenticatedPackageSnapshot,
    job: PreparedJob,
    result: str,
    *,
    kept_hash: str | None = None,
) -> bytes:
    value: dict[str, Any] = {
        "id": job.job_id,
        "status": "failed" if result == "UNKNOWN" else "completed",
        "result": result,
        "backend": job.backend,
        "project": "erdos-97-96-formalization",
        "identity_hash": job.identity_hash,
        "cnf_blob_hash": package.cnf_sha256,
        "producer_manifest_hash": package.producer_manifest_sha256,
    }
    if kept_hash is not None:
        value["kept_cnf_blob_hash"] = kept_hash
    return canonical_json_bytes(value)


def _base_packet(
    package: AuthenticatedPackageSnapshot,
    result: str,
) -> CardHeadPiqdPacket:
    job = _job(package)
    status = _status(package, job, result)
    outcome = {"SAT": STRUCTURAL_SAT, "UNSAT": DISCOVERY_UNSAT}.get(result, ERROR)
    driver = DriverResult(job.job_id, outcome, _digest("4"), 1, _digest("5"))
    return CardHeadPiqdPacket(
        job=job,
        driver_result=driver,
        terminal_record_sha256=driver.terminal_record_sha256,
        journal_sha256=_digest("6"),
        seal_sha256=driver.seal_sha256,
        status_response=status,
        status_canonical_receipt=status,
        state="failed" if result == "UNKNOWN" else "completed",
        result=result,
    )


def _unsat_packet(package: AuthenticatedPackageSnapshot) -> CardHeadPiqdPacket:
    packet = _base_packet(package, "UNSAT")
    kept = canonical_kept_dimacs(package.cnf)
    kept_hash = sha256_bytes(kept)
    status = _status(package, packet.job, "UNSAT", kept_hash=kept_hash)
    return replace(
        packet,
        status_response=status,
        status_canonical_receipt=status,
        clause_map_response=_map_bytes(package.cnf),
        certificate_kind=CERTIFICATE_KIND,
        certificate=VALID_LRAT,
        proof_blob_hash=sha256_bytes(VALID_LRAT),
        kept_cnf_blob_hash=kept_hash,
        kept_cnf_blob=kept,
    )


def _sat_packet(
    package: AuthenticatedPackageSnapshot, assignment: list[object]
) -> CardHeadPiqdPacket:
    packet = _base_packet(package, "SAT")
    model = canonical_json_bytes(
        {
            "job_id": packet.job.job_id,
            "result": "SAT",
            "num_assigned": len(assignment),
            "assignment": assignment,
        }
    )
    return replace(
        packet,
        model_response=model,
        model_canonical_receipt=model,
        model_response_journal_sha256=sha256_bytes(model),
    )


def _replay_result(
    package: AuthenticatedPackageSnapshot,
    packet: CardHeadPiqdPacket,
    *,
    verified: bool = True,
) -> LratReplayResult:
    proof = packet.certificate
    assert proof is not None
    kept = canonical_kept_dimacs(package.cnf)
    checker = lean_checker_source(kept_cnf=kept, proof=proof)
    receipt = canonical_json_bytes(
        {
            "schema": REPLAY_SCHEMA,
            "normalization": {
                "schema": NORMALIZATION_SCHEMA,
                "submitted_cnf_sha256": package.cnf_sha256,
                "canonical_kept_cnf_sha256": sha256_bytes(kept),
                "submitted_bytes_equal_kept_bytes": package.cnf == kept,
            },
            "job": {
                "id": packet.job.job_id,
                "backend": packet.job.backend,
                "solver_profile": packet.job.solver_profile,
                "identity_hash": packet.job.identity_hash,
                "cnf_blob_hash": packet.job.cnf_blob_hash,
            },
            "wave_manifest_sha256": wave_manifest_sha256(package.wave_manifest),
            "proof_sha256": sha256_bytes(proof),
            "checker_source_sha256": sha256_bytes(checker),
            "checker": {"kind": "injected-test-double"},
            "execution": {
                "returncode": 0 if verified else 1,
                "error": None if verified else "rejected",
            },
            "verified": verified,
        }
    )
    return LratReplayResult(verified, checker, receipt)


def _invoke(
    tmp_path: Path,
    package: AuthenticatedPackageSnapshot,
    instance: FixtureInstance,
    packet: CardHeadPiqdPacket,
    replayer: object,
    *,
    proof: bool,
):
    cnf_path = tmp_path / "solver.cnf"
    cnf_path.write_bytes(package.cnf)
    calls: list[CardHeadPiqdRequest] = []

    def transport(request: CardHeadPiqdRequest) -> CardHeadPiqdPacket:
        calls.append(request)
        return packet

    solver = PiqdCertifiedSolver(package, transport, replayer)  # type: ignore[arg-type]
    result = solver(
        instance, cnf_path, proof_path=tmp_path / "solver.drat" if proof else None
    )
    return result, calls


def test_certified_sat_requires_total_exact_replay_and_decoder(tmp_path: Path) -> None:
    package = _package(b"p cnf 1 1\n1 0\n", profile="sat")
    instance = FixtureInstance(package.cnf, decoded={0: [1]})
    packet = _sat_packet(package, [1])

    result, calls = _invoke(
        tmp_path, package, instance, packet, UnusedReplayer(), proof=False
    )

    assert result.verdict == "SAT"
    assert result.proof_verified is False
    assert result.cube == {0: [1]}
    assert result.positive_variables == frozenset({1})
    assert instance.decode_calls == [frozenset({1})]
    assert len(calls) == 1


def test_per_query_solver_mints_an_exact_package_for_each_effective_dimacs(
    tmp_path: Path,
) -> None:
    instance = MultiQueryInstance(b"", decoded={0: [1]})
    built: list[tuple[bytes, Path]] = []

    def query_factory(cnf: bytes, cnf_path: Path) -> PiqdCertifiedSolver:
        built.append((cnf, cnf_path))
        package = _package(cnf, profile="sat")
        packet = _sat_packet(package, [1])
        return PiqdCertifiedSolver(
            package,
            lambda _request: packet,
            UnusedReplayer(),  # type: ignore[arg-type]
        )

    solver = PiqdPerQueryCertifiedSolver(query_factory)
    first_path = tmp_path / "B.cnf"
    second_path = tmp_path / "DE.cnf"
    first = solver(instance, first_path)
    second = solver(instance, second_path, extra_clauses=((1,),))

    assert first.verdict == second.verdict == "SAT"
    assert len(built) == 2
    assert built[0][0] != built[1][0]
    assert built[0][1] == first_path
    assert built[1][1] == second_path
    assert first_path.read_bytes() == built[0][0]
    assert second_path.read_bytes() == built[1][0]


def test_per_query_solver_rejects_crossed_package_before_transport(
    tmp_path: Path,
) -> None:
    instance = MultiQueryInstance(b"")
    base = instance.dimacs().encode("ascii")
    package = _package(base, profile="sat")
    transport_called = False

    def transport(_request: CardHeadPiqdRequest) -> CardHeadPiqdPacket:
        nonlocal transport_called
        transport_called = True
        return _sat_packet(package, [1])

    solver = PiqdPerQueryCertifiedSolver(
        lambda _cnf, _path: PiqdCertifiedSolver(
            package,
            transport,
            UnusedReplayer(),  # type: ignore[arg-type]
        )
    )
    with pytest.raises(PiqdCertifiedSolverError, match="effective DIMACS"):
        solver(instance, tmp_path / "crossed.cnf", extra_clauses=((1,),))
    assert transport_called is False
    assert not (tmp_path / "crossed.cnf").exists()


@pytest.mark.parametrize("assignment", [[], [True], [-1], [1, -1]])
def test_certified_sat_rejects_partial_typed_or_false_models(
    tmp_path: Path, assignment: list[object]
) -> None:
    package = _package(b"p cnf 1 1\n1 0\n", profile="sat")
    packet = _sat_packet(package, assignment)
    instance = FixtureInstance(package.cnf)

    with pytest.raises(PiqdCertifiedSolverError, match="total|replay/decode"):
        _invoke(tmp_path, package, instance, packet, UnusedReplayer(), proof=False)
    assert instance.decode_calls == []


def test_certified_sat_decoder_failure_is_closed(tmp_path: Path) -> None:
    package = _package(b"p cnf 1 1\n1 0\n", profile="sat")
    instance = FixtureInstance(package.cnf, decoded=EncodingError("bad decoder"))

    with pytest.raises(PiqdCertifiedSolverError, match="decode"):
        _invoke(
            tmp_path,
            package,
            instance,
            _sat_packet(package, [1]),
            UnusedReplayer(),
            proof=False,
        )


def test_certified_unsat_replays_and_custodies_lrat_without_drat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    package = _package(b"p cnf 1 2\n1 0\n-1 0\n", profile="unsat")
    packet = _unsat_packet(package)
    replay = _replay_result(package, packet)
    concrete = LeanLratReplayer(lean_root=tmp_path, work_dir=tmp_path)
    monkeypatch.setattr(LeanLratReplayer, "replay", lambda self, **_kwargs: replay)

    result, _calls = _invoke(
        tmp_path,
        package,
        FixtureInstance(package.cnf),
        packet,
        concrete,
        proof=True,
    )

    assert result.verdict == "UNSAT"
    assert result.proof_verified is True
    assert not (tmp_path / "solver.drat").exists()
    assert (tmp_path / "solver.lrat").read_bytes() == VALID_LRAT
    assert (tmp_path / "solver.kept.cnf").read_bytes() == canonical_kept_dimacs(
        package.cnf
    )
    receipt = (tmp_path / "solver.piqd-certified.json").read_bytes()
    assert b'"proof_verified":true' in receipt


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        ("identity", "identity_hash"),
        ("cnf", "cnf_blob_hash"),
        ("producer", "producer_manifest_hash"),
        ("kept_hash", "kept CNF"),
        ("kept_bytes", "kept CNF bytes"),
        ("map", "clause-map"),
        ("proof", "LRAT header/hash"),
        ("replay_receipt", "replay"),
    ],
)
def test_certified_unsat_rejects_crossed_bindings(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    mutation: str,
    message: str,
) -> None:
    package = _package(b"p cnf 1 2\n1 0\n-1 0\n", profile="unsat")
    packet = _unsat_packet(package)
    replay = _replay_result(package, packet)
    status = __import__("json").loads(packet.status_response)
    if mutation in {"identity", "cnf", "producer"}:
        field = {
            "identity": "identity_hash",
            "cnf": "cnf_blob_hash",
            "producer": "producer_manifest_hash",
        }[mutation]
        status[field] = _digest("a")
        raw = canonical_json_bytes(status)
        packet = replace(packet, status_response=raw, status_canonical_receipt=raw)
    elif mutation == "kept_hash":
        packet = replace(packet, kept_cnf_blob_hash=_digest("a"))
    elif mutation == "kept_bytes":
        packet = replace(packet, kept_cnf_blob=b"p cnf 1 1\n1 0\n")
    elif mutation == "map":
        mapped = __import__("json").loads(packet.clause_map_response)
        mapped["kept_sha256"] = _digest("a")
        packet = replace(packet, clause_map_response=canonical_json_bytes(mapped))
    elif mutation == "proof":
        packet = replace(packet, proof_blob_hash=_digest("a"))
    elif mutation == "replay_receipt":
        value = __import__("json").loads(replay.receipt)
        value["proof_sha256"] = _digest("a")
        replay = replace(replay, receipt=canonical_json_bytes(value))
    concrete = LeanLratReplayer(lean_root=tmp_path, work_dir=tmp_path)
    monkeypatch.setattr(LeanLratReplayer, "replay", lambda self, **_kwargs: replay)

    with pytest.raises(PiqdCertifiedSolverError, match=message):
        _invoke(
            tmp_path,
            package,
            FixtureInstance(package.cnf),
            packet,
            concrete,
            proof=True,
        )
    assert not (tmp_path / "solver.lrat").exists()


def test_fake_verified_replayer_cannot_promote_unsat(tmp_path: Path) -> None:
    package = _package(b"p cnf 1 2\n1 0\n-1 0\n", profile="unsat")
    packet = _unsat_packet(package)

    class FakeReplayer:
        def replay(self, **_kwargs: object) -> LratReplayResult:
            return _replay_result(package, packet)

    with pytest.raises(PiqdCertifiedSolverError, match="concrete Lean"):
        _invoke(
            tmp_path,
            package,
            FixtureInstance(package.cnf),
            packet,
            FakeReplayer(),
            proof=True,
        )


def test_structural_receipt_is_create_once_and_preflighted(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    package = _package(b"p cnf 1 2\n1 0\n-1 0\n", profile="unsat")
    packet = _unsat_packet(package)
    replay = _replay_result(package, packet)
    concrete = LeanLratReplayer(lean_root=tmp_path, work_dir=tmp_path)
    monkeypatch.setattr(LeanLratReplayer, "replay", lambda self, **_kwargs: replay)
    (tmp_path / "solver.piqd-certified.json").write_bytes(b"crossed")

    with pytest.raises(PiqdCertifiedSolverError, match="already exists"):
        _invoke(
            tmp_path,
            package,
            FixtureInstance(package.cnf),
            packet,
            concrete,
            proof=True,
        )
    assert not (tmp_path / "solver.lrat").exists()
    assert (tmp_path / "solver.piqd-certified.json").read_bytes() == b"crossed"


def test_unknown_and_transport_errors_fail_closed_without_fallback(
    tmp_path: Path,
) -> None:
    package = _package(b"p cnf 1 1\n1 0\n", profile="sat")
    instance = FixtureInstance(package.cnf)
    unknown = _base_packet(package, "UNKNOWN")

    result, calls = _invoke(
        tmp_path, package, instance, unknown, UnusedReplayer(), proof=False
    )
    assert result.verdict == "UNKNOWN"
    assert result.proof_verified is False
    assert "no fallback" in result.stdout_tail
    assert len(calls) == 1
    assert instance.decode_calls == []

    failing_path = tmp_path / "transport" / "solver.cnf"
    failing_path.parent.mkdir()
    failing_path.write_bytes(package.cnf)
    transport_calls = 0

    def failing_transport(_request: CardHeadPiqdRequest) -> CardHeadPiqdPacket:
        nonlocal transport_calls
        transport_calls += 1
        raise RuntimeError("offline")

    solver = PiqdCertifiedSolver(
        package,
        failing_transport,
        UnusedReplayer(),  # type: ignore[arg-type]
    )
    with pytest.raises(PiqdCertifiedSolverError, match="transport failed"):
        solver(instance, failing_path)
    assert transport_calls == 1


def test_march_cu_job_is_explicitly_outside_certified_seam(tmp_path: Path) -> None:
    package = _package(b"p cnf 1 1\n1 0\n", profile="sat")
    packet = _sat_packet(package, [1])
    packet = replace(packet, job=replace(packet.job, backend="march_cu"))

    with pytest.raises(PiqdCertifiedSolverError, match="march_cu jobs"):
        _invoke(
            tmp_path,
            package,
            FixtureInstance(package.cnf),
            packet,
            UnusedReplayer(),
            proof=False,
        )
