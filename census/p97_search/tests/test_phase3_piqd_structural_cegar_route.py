from __future__ import annotations

import sys
import urllib.parse
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
HERE = ROOT / "census/p97_search"
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

from census.p97_search import phase3_cegar_wave as wave
from census.p97_search import phase3_piqd_oracle as oracle
from census.p97_search import phase3_piqd_static_solver_runner as static_runner
from census.p97_search import phase3_piqd_structural_cegar_route as route
from census.p97_search import phase3_structural_cegar as structural
from census.p97_search import sat_generate as sat

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
        "schema": static_runner.SOURCE_SCHEMA,
        "source_id": "p97-structural-cegar-test",
        "source_path": "census/p97_search/phase3_structural_cegar.py",
        "source_sha256": "a" * 64,
        "finite_schema": "p97-phase3-structural-cegar-v1",
        "cardinality_scope": "one finite structural CEGAR CNF",
        "source_theorem": "Problem97.structuralCegarFiniteSearch",
        "claims": SOURCE_CLAIMS,
    }
    source_bytes = wave.canonical_json_bytes(source)
    producer = {
        "schema": static_runner.PRODUCER_SCHEMA,
        "producer_id": "phase3-structural-cegar-test-producer",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": wave.sha256_bytes(source_bytes),
        "variable_map_sha256": "b" * 64,
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "claims": PRODUCER_CLAIMS,
    }
    return source_bytes, wave.canonical_json_bytes(producer)


class FakePiqdTransport:
    def __init__(
        self,
        *,
        cnf: bytes,
        producer: bytes,
        result: str,
        assignment: list[object] | None = None,
    ) -> None:
        self.cnf = cnf
        self.stored_cnf = cnf
        self.producer = producer
        self.result = result
        self.assignment = assignment
        self.job_id = "phase3-structural-cegar-job"
        self.calls: list[tuple[str, str]] = []
        self.fail_at: tuple[str, str] | None = None

    @staticmethod
    def _json(value: dict[str, Any]) -> oracle.HttpResponse:
        return oracle.HttpResponse(
            200,
            wave.canonical_json_bytes(value),
            {"Content-Type": "application/json"},
        )

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | oracle.MultipartBody | None,
        _headers: object,
    ) -> oracle.HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        if self.fail_at == (method, path):
            raise OSError("injected transport failure")
        cnf_hash = wave.sha256_bytes(self.cnf)
        producer_hash = wave.sha256_bytes(self.producer)
        identity = oracle.raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=producer_hash,
            requested_core_limit=1,
        )
        if method == "POST" and path == "/jobs/prepare-cnf":
            assert isinstance(body, bytes)
            assert self.cnf in body
            assert self.producer in body
            num_vars, num_clauses = oracle.scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_hash,
                    "identity_hash": identity,
                    "num_vars": num_vars,
                    "num_clauses": num_clauses,
                    "preview": "",
                    "existing": False,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return oracle.HttpResponse(
                200,
                self.stored_cnf,
                {"Content-Type": "application/octet-stream"},
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            return self._json({"job_id": self.job_id, "status": "confirmed"})
        if method == "GET" and path == f"/jobs/{self.job_id}":
            return self._json(
                {
                    "id": self.job_id,
                    "status": "completed",
                    "result": self.result,
                    "requested_core_limit": 1,
                    "progress": {"solver_started": True},
                    "attested_solver_processes": 1,
                    "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            assignment = self.assignment if self.assignment is not None else []
            return self._json(
                {
                    "job_id": self.job_id,
                    "result": "SAT",
                    "num_assigned": len(assignment),
                    "assignment": assignment,
                }
            )
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            log = f"s {self.result}\n".encode()
            return oracle.HttpResponse(
                200,
                log,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Log-Size-Bytes": str(len(log)),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/proof":
            raise AssertionError("observational UNSAT must not fetch a proof")
        raise AssertionError((method, path))


def _make_route(
    tmp_path: Path,
    api: FakePiqdTransport,
    local_proof_runner: Callable[[Path, int, Path | None], Any],
) -> route.StructuralCegarPiqdRoute:
    source, producer = _manifests()
    journal_root = tmp_path / "journals"
    journal_root.mkdir(parents=True, exist_ok=True)
    return route.make_piqd_structural_cegar_route(
        base_url="http://piqd.invalid",
        journal_root=journal_root,
        source_manifest_bytes=source,
        producer_manifest_bytes=producer,
        transport=api,
        sleep=lambda _seconds: None,
        local_proof_runner=local_proof_runner,
    )


def test_sat_returns_piqd_replayed_model_without_local_fallback(
    tmp_path: Path,
) -> None:
    cnf = b"p cnf 3 2\n1 -2 0\n2 3 0\n"
    _source, producer = _manifests()
    api = FakePiqdTransport(
        cnf=cnf,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    local_calls: list[tuple[Path, Path | None]] = []
    composite = _make_route(
        tmp_path,
        api,
        lambda cnf_path, _timeout, proof_path: local_calls.append(
            (cnf_path, proof_path)
        ),
    ).solver_runner
    cnf_path = tmp_path / "query.cnf"
    proof_path = tmp_path / "query.drat"
    cnf_path.write_bytes(cnf)

    result = composite(cnf_path, 5, proof_path)

    assert result.verdict == "SAT"
    assert result.assignment == {1: True, 2: True, 3: True}
    assert local_calls == []
    assert not proof_path.exists()
    assert not any(path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize("failure", ["unknown", "custody", "transport"])
def test_unknown_transport_or_custody_failure_has_no_local_fallback(
    tmp_path: Path,
    failure: str,
) -> None:
    cnf = b"p cnf 1 1\n1 0\n"
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="UNKNOWN")
    if failure == "custody":
        api.stored_cnf = cnf + b"c drift\n"
    if failure == "transport":
        api.fail_at = ("GET", f"/jobs/{api.job_id}")
    local_calls: list[tuple[Path, Path | None]] = []
    composite = _make_route(
        tmp_path,
        api,
        lambda cnf_path, _timeout, proof_path: local_calls.append(
            (cnf_path, proof_path)
        ),
    ).solver_runner
    cnf_path = tmp_path / "query.cnf"
    proof_path = tmp_path / "query.drat"
    cnf_path.write_bytes(cnf)

    result = composite(cnf_path, 5, proof_path)
    assert result.verdict == "UNKNOWN"
    assert local_calls == []
    assert not proof_path.exists()


def test_observational_unsat_gets_exactly_one_local_proof_rerun(
    tmp_path: Path,
) -> None:
    cnf = b"p cnf 1 2\n1 0\n-1 0\n"
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="UNSAT")
    local_calls: list[tuple[Path, Path, bytes]] = []

    def local_proof(
        cnf_path: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        assert proof_path is not None
        local_calls.append((cnf_path, proof_path, cnf_path.read_bytes()))
        proof_path.write_bytes(b"0\n")
        return sat.SolverResult("UNSAT", {}, 20, "", "")

    piqd_route = _make_route(tmp_path, api, local_proof)
    cnf_path = tmp_path / "query.cnf"
    proof_path = tmp_path / "query.drat"
    cnf_path.write_bytes(cnf)

    result = piqd_route.solver_runner(cnf_path, 5, proof_path)

    assert result.verdict == "UNSAT"
    assert local_calls == [(cnf_path, proof_path, cnf)]
    assert proof_path.read_bytes() == b"0\n"
    assert not any(path.endswith("/proof") for _, path in api.calls)
    configuration = piqd_route.configuration()
    assert configuration["schema"] == route.ROUTE_SCHEMA
    assert configuration["discovery_proof_path"] == "always-none"
    assert configuration["legacy_composite_proof_path"] == "required-non-null"
    assert configuration["local_proof_non_unsat"] == ("raise-terminal-disagreement")
    assert configuration["terminal_proof_runner_origin"] == "caller-supplied"
    assert configuration["terminal_proof_runner_identity_claim"] == (
        "diagnostic-only-not-authenticated"
    )
    assert "local_proof" in configuration["terminal_proof_runner_identity"]


@pytest.mark.parametrize("local_mode", ["sat", "unknown", "exception", "missing"])
def test_composite_fails_closed_on_local_proof_runner_outcome(
    tmp_path: Path,
    local_mode: str,
) -> None:
    cnf = b"p cnf 1 2\n1 0\n-1 0\n"
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="UNSAT")
    local_calls = 0

    def local_proof(
        _cnf_path: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        nonlocal local_calls
        local_calls += 1
        assert proof_path is not None
        if local_mode == "exception":
            raise OSError("local solver failed")
        verdict = {
            "sat": "SAT",
            "unknown": "UNKNOWN",
            "missing": "UNSAT",
        }[local_mode]
        return sat.SolverResult(
            verdict,
            {},
            {"SAT": 10, "UNKNOWN": 0, "UNSAT": 20}[verdict],
            "",
            "",
        )

    composite = _make_route(tmp_path, api, local_proof).solver_runner
    cnf_path = tmp_path / "query.cnf"
    proof_path = tmp_path / "query.drat"
    cnf_path.write_bytes(cnf)

    if local_mode == "exception":
        with pytest.raises(OSError, match="local solver failed"):
            composite(cnf_path, 5, proof_path)
    elif local_mode in {"sat", "unknown"}:
        with pytest.raises(
            route.PiqdStructuralCegarRouteError,
            match=f"returned '{local_mode.upper()}'",
        ):
            composite(cnf_path, 5, proof_path)
    else:
        result = composite(cnf_path, 5, proof_path)
        assert result.verdict == "UNSAT"
        assert not proof_path.exists()
    assert local_calls == 1


def test_composite_routes_literal_none_only_to_piqd_and_legacy_path_only_to_local(
    tmp_path: Path,
) -> None:
    cnf_path = tmp_path / "query.cnf"
    cnf_path.write_bytes(b"p cnf 0 0\n")
    first_proof = tmp_path / "first.drat"
    second_proof = tmp_path / "second.drat"
    piqd_results = iter(
        [
            sat.SolverResult("SAT", {}, 10, "", ""),
            sat.SolverResult("UNSAT", {}, 20, "", ""),
        ]
    )
    calls: list[tuple[str, Path | None]] = []

    def piqd_spy(
        observed_cnf: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        assert observed_cnf == cnf_path
        calls.append(("piqd", proof_path))
        return next(piqd_results)

    def local_spy(
        observed_cnf: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        assert observed_cnf == cnf_path
        calls.append(("local", proof_path))
        return sat.SolverResult("UNSAT", {}, 20, "", "")

    composite = route._legacy_composite_solver_runner(piqd_spy, local_spy)

    assert composite(cnf_path, 5, first_proof).verdict == "SAT"
    assert composite(cnf_path, 5, second_proof).verdict == "UNSAT"
    assert calls == [
        ("piqd", None),
        ("piqd", None),
        ("local", second_proof),
    ]


def test_factory_default_and_injected_runner_provenance_are_truthful(
    tmp_path: Path,
) -> None:
    source, producer = _manifests()
    api = FakePiqdTransport(cnf=b"p cnf 0 0\n", producer=producer, result="SAT")
    default_route = route.make_piqd_structural_cegar_route(
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "default-journal",
        source_manifest_bytes=source,
        producer_manifest_bytes=producer,
        transport=api,
        sleep=lambda _seconds: None,
    )
    configuration = default_route.configuration()

    assert configuration["terminal_proof_runner_origin"] == (
        "factory-default-sat.run_cadical"
    )
    assert configuration["terminal_proof_runner_identity"].endswith(".run_cadical")
    with pytest.raises(TypeError, match="must be callable"):
        route.make_piqd_structural_cegar_route(
            base_url="http://piqd.invalid",
            journal_root=tmp_path / "bad-journal",
            source_manifest_bytes=source,
            producer_manifest_bytes=producer,
            local_proof_runner=object(),
        )


def test_composite_rejects_missing_legacy_proof_path(tmp_path: Path) -> None:
    cnf = b"p cnf 0 0\n"
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="SAT")
    composite = _make_route(
        tmp_path,
        api,
        lambda *_args: pytest.fail("local proof runner must not run"),
    ).solver_runner
    cnf_path = tmp_path / "query.cnf"
    cnf_path.write_bytes(cnf)

    with pytest.raises(ValueError, match="must supply a proof path"):
        composite(cnf_path, 5, None)
    assert api.calls == []


def test_frozen_outer_checker_is_authoritative_after_observational_unsat(
    tmp_path: Path,
) -> None:
    cnf = structural._phase3_encoding(projected_static_v2=False).cnf_bytes(())
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="UNSAT")
    local_calls: list[tuple[Path, Path, bytes]] = []

    def local_proof(
        cnf_path: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        assert proof_path is not None
        local_calls.append((cnf_path, proof_path, cnf_path.read_bytes()))
        proof_path.write_bytes(b"fresh local proof\n")
        return sat.SolverResult("UNSAT", {}, 20, "", "")

    checker_calls: list[tuple[Path, Path]] = []

    def checker(cnf_path: Path, proof_path: Path, _timeout: int) -> sat.CheckerResult:
        checker_calls.append((cnf_path, proof_path))
        assert cnf_path.read_bytes() == cnf
        assert proof_path.read_bytes() == b"fresh local proof\n"
        return sat.CheckerResult(True, 0, "s VERIFIED\n", "")

    out = tmp_path / "out"
    result = structural.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_make_route(tmp_path, api, local_proof).solver_runner,
        checker_runner=checker,
    )

    assert result["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert local_calls == [(out / ".solver.cnf", out / ".solver.drat", cnf)]
    assert checker_calls == [(out / "terminal.cnf", out / "terminal.drat")]
    assert not any(path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize(
    ("local_mode", "failure_kind"),
    [
        ("sat", "SOLVER_EXCEPTION"),
        ("unknown", "SOLVER_EXCEPTION"),
        ("exception", "SOLVER_EXCEPTION"),
        ("missing", "MISSING_DRAT"),
    ],
)
def test_frozen_driver_fails_closed_on_local_proof_rerun_failure(
    tmp_path: Path,
    local_mode: str,
    failure_kind: str,
) -> None:
    cnf = structural._phase3_encoding(projected_static_v2=False).cnf_bytes(())
    _source, producer = _manifests()
    api = FakePiqdTransport(cnf=cnf, producer=producer, result="UNSAT")
    local_calls = 0

    def local_proof(
        _cnf_path: Path, _timeout: int, proof_path: Path | None
    ) -> sat.SolverResult:
        nonlocal local_calls
        local_calls += 1
        assert proof_path is not None
        if local_mode == "exception":
            raise OSError("injected local proof failure")
        verdict = {
            "sat": "SAT",
            "unknown": "UNKNOWN",
            "missing": "UNSAT",
        }[local_mode]
        return sat.SolverResult(
            verdict,
            {},
            {"SAT": 10, "UNKNOWN": 0, "UNSAT": 20}[verdict],
            "",
            "",
        )

    result = structural.run_driver(
        tmp_path / "out",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        solver_runner=_make_route(tmp_path, api, local_proof).solver_runner,
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
    )

    assert result["status"] == "UNKNOWN"
    assert result["failure"]["kind"] == failure_kind
    assert local_calls == 1
