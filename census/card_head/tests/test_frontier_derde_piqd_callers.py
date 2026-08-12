from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType, SimpleNamespace
from typing import Any

import pytest

from census.card_head import frontier_lane_piqd as lane_piqd
from census.card_head.piqd_certified_solver import (
    PiqdCertifiedSolver,
    PiqdPerQueryCertifiedSolver,
)
from census.card_head.piqd_frontier_package import FrontierAuthenticatedPackage
from census.card_head.sat_encoding import CadicalResult

REPO_ROOT = Path(__file__).resolve().parents[3]
FRONTIER_ROOT = REPO_ROOT / "census" / "frontier-packages"


def _load_frontier_module(lane: str, script: str) -> ModuleType:
    """Load a standalone frontier script without cross-lane `encoding` reuse."""

    module_path = FRONTIER_ROOT / f"{lane}_core" / f"{script}.py"
    module_name = f"_test_frontier_{lane}_{script}_{id(module_path)}"
    spec = importlib.util.spec_from_file_location(module_name, module_path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    old_encoding = sys.modules.pop("encoding", None)
    old_path = list(sys.path)
    sys.modules[module_name] = module
    try:
        spec.loader.exec_module(module)
    finally:
        sys.path[:] = old_path
        sys.modules.pop("encoding", None)
        if old_encoding is not None:
            sys.modules["encoding"] = old_encoding
    return module


def _result(verdict: str, *, verified: bool = False) -> CadicalResult:
    cube: dict[Any, Any] | None = {} if verdict == "SAT" else None
    return CadicalResult(verdict, cube, 10, verified, "fake-only result", None)


class _RecordingSolver:
    def __init__(self, verdict: str = "SAT", *, verified: bool = False) -> None:
        self.verdict = verdict
        self.verified = verified
        self.calls: list[tuple[Path, Path | None]] = []
        self.active = 0
        self.max_active = 0

    def __call__(
        self,
        _instance: Any,
        cnf_path: Path,
        *,
        extra_clauses: Any = (),
        timeout_seconds: int = 30,
        nice: int = 10,
        proof_path: Path | None = None,
    ) -> CadicalResult:
        del extra_clauses, timeout_seconds, nice
        self.active += 1
        self.max_active = max(self.max_active, self.active)
        try:
            cnf_path.parent.mkdir(parents=True, exist_ok=True)
            cnf_path.write_bytes(b"p cnf 1 1\n1 0\n")
            self.calls.append((cnf_path, proof_path))
            return _result(self.verdict, verified=self.verified)
        finally:
            self.active -= 1


def test_backend_is_piqd_by_default_legacy_is_explicit_and_workers_are_closed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    parser = argparse.ArgumentParser()
    lane_piqd.add_solver_arguments(parser)
    default_args = parser.parse_args([])
    assert default_args.solver_backend == "piqd"
    assert default_args.workers == 1
    with pytest.raises(SystemExit):
        parser.parse_args(["--workers", "2"])

    sentinel = _RecordingSolver()
    legacy_args = parser.parse_args(["--solver-backend", "legacy-local"])
    monkeypatch.setattr(
        lane_piqd,
        "make_solver",
        lambda **_kwargs: pytest.fail("legacy-local must not construct PIQD"),
    )
    assert (
        lane_piqd.solver_from_args(
            args=legacy_args,
            lane="E",
            encoder=SimpleNamespace(names={"x": 1}),
            artifact_root=tmp_path,
            legacy_solver=sentinel,
        )
        is sentinel
    )


def test_default_construction_failure_has_no_legacy_fallback(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    parser = argparse.ArgumentParser()
    lane_piqd.add_solver_arguments(parser)
    args = parser.parse_args([])

    def fail(**_kwargs: Any) -> Any:
        raise RuntimeError("synthetic PIQD construction failure")

    monkeypatch.setattr(lane_piqd, "make_solver", fail)
    with pytest.raises(RuntimeError, match="synthetic PIQD construction failure"):
        lane_piqd.solver_from_args(
            args=args,
            lane="DE",
            encoder=SimpleNamespace(names={"x": 1}),
            artifact_root=tmp_path,
            legacy_solver=_RecordingSolver(),
        )


def test_shared_solver_is_exact_per_query_type(tmp_path: Path) -> None:
    solver = lane_piqd.make_solver(
        lane="DR",
        encoder=SimpleNamespace(names={"x": 1}),
        artifact_root=tmp_path,
    )
    assert type(solver) is PiqdPerQueryCertifiedSolver


def test_each_effective_dimacs_gets_fresh_package_transport_and_replayer(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    packages: list[FrontierAuthenticatedPackage] = []
    transports: list[tuple[object, Path]] = []
    replayers: list[object] = []
    real_builder = lane_piqd.build_frontier_authenticated_package

    def record_package(**kwargs: Any) -> FrontierAuthenticatedPackage:
        package = real_builder(**kwargs)
        packages.append(package)
        return package

    def fake_transport(package: object, *, output_root: Path, **_kwargs: Any) -> Any:
        transports.append((package, output_root))

        def transport(_request: object) -> object:
            raise AssertionError("factory construction must not contact PIQD")

        return transport

    class FakeReplayer:
        def __init__(self, **_kwargs: Any) -> None:
            replayers.append(self)

        def replay(self, **_kwargs: Any) -> object:
            raise AssertionError("factory construction must not run Lean")

    monkeypatch.setattr(
        lane_piqd, "build_frontier_authenticated_package", record_package
    )
    factory = lane_piqd.make_query_factory(
        lane="E",
        encoder=SimpleNamespace(names={"x(1)=yes": 1}),
        artifact_root=tmp_path,
        packet_transport_builder=fake_transport,
        replayer_builder=FakeReplayer,
    )
    first_cnf = b"p cnf 1 1\n1 0\n"
    second_cnf = b"p cnf 1 1\n-1 0\n"
    first = factory(first_cnf, tmp_path / "query.cnf")
    second = factory(second_cnf, tmp_path / "query.cnf")

    assert type(first) is type(second) is PiqdCertifiedSolver
    assert len(packages) == len(transports) == len(replayers) == 2
    assert packages[0] is not packages[1]
    assert first.package is packages[0].snapshot
    assert second.package is packages[1].snapshot
    assert first.package.cnf == first_cnf
    assert second.package.cnf == second_cnf
    assert transports[0][0] is first.package
    assert transports[1][0] is second.package
    assert transports[0][1] != transports[1][1]
    assert first.replayer is not second.replayer
    variable_map = json.loads(packages[0].variable_map_bytes)
    assert variable_map["entries"][0]["name"] == "x(1)=yes"
    assert [snapshot.relative_path for snapshot in packages[0].source_snapshots] == [
        "census/frontier-packages/E-ENCODING-SPEC.md",
        "census/frontier-packages/e_core/encoding.py",
    ]


@pytest.mark.parametrize(
    ("directory", "lane", "encoder_name", "spec_name"),
    [
        ("de", "DE", "DEEncoder", "D-E-ENCODING-SPEC.md"),
        ("dr", "DR", "DREncoder", "D-R-ENCODING-SPEC.md"),
        ("e", "E", "EEncoder", "E-ENCODING-SPEC.md"),
    ],
)
def test_real_lane_encoders_build_closed_finite_local_packages(
    directory: str,
    lane: str,
    encoder_name: str,
    spec_name: str,
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    encoding = _load_frontier_module(directory, "encoding")
    encoder = getattr(encoding, encoder_name)()
    packages: list[FrontierAuthenticatedPackage] = []
    real_builder = lane_piqd.build_frontier_authenticated_package

    def record_package(**kwargs: Any) -> FrontierAuthenticatedPackage:
        package = real_builder(**kwargs)
        packages.append(package)
        return package

    def fake_transport(_package: object, **_kwargs: Any) -> Any:
        return lambda _request: pytest.fail("package-only test contacted PIQD")

    class FakeReplayer:
        def __init__(self, **_kwargs: Any) -> None:
            pass

        def replay(self, **_kwargs: Any) -> object:
            raise AssertionError("package-only test ran Lean")

    monkeypatch.setattr(
        lane_piqd, "build_frontier_authenticated_package", record_package
    )
    factory = lane_piqd.make_query_factory(
        lane=lane,
        encoder=encoder,
        artifact_root=tmp_path / lane.lower(),
        packet_transport_builder=fake_transport,
        replayer_builder=FakeReplayer,
    )
    num_variables = encoder.cnf.n_variables
    cnf = f"p cnf {num_variables} 1\n1 0\n".encode("ascii")
    factory(cnf, tmp_path / f"{lane.lower()}.cnf")

    assert len(packages) == 1
    profile = json.loads(packages[0].lane_profile_bytes)
    assert profile["lane"] == lane
    assert profile["semantic_status"] == "FINITE_LOCAL"
    assert profile["evidence_classification"] == "LOCAL_CERTIFICATE"
    assert profile["source_theorem"].startswith("NONE:")
    assert set(profile["claims"].values()) == {False}
    assert [snapshot.relative_path for snapshot in packages[0].source_snapshots] == [
        f"census/frontier-packages/{spec_name}",
        f"census/frontier-packages/{directory}_core/encoding.py",
    ]


def test_piqd_manifest_uses_lrat_custody_and_never_touches_requested_drat(
    tmp_path: Path,
) -> None:
    e_run = _load_frontier_module("e", "run")
    e_run.OUT_DIR = tmp_path / "out"
    e_run.OUT_DIR.mkdir(parents=True)
    encoder = e_run.enc.EEncoder()
    requested = e_run.OUT_DIR / "base.drat"
    requested.write_bytes(b"preexisting sentinel")

    class FakePiqd(_RecordingSolver):
        def __call__(
            self, *args: Any, proof_path: Path | None = None, **kwargs: Any
        ) -> CadicalResult:
            result = super().__call__(*args, proof_path=proof_path, **kwargs)
            assert proof_path is not None
            for suffix in (
                ".lrat",
                ".kept.cnf",
                ".clause-map.json",
                ".replay.lean",
                ".replay.json",
                ".piqd-certified.json",
            ):
                proof_path.with_suffix(suffix).write_bytes(suffix.encode("ascii"))
            return result

    solver = FakePiqd("UNSAT", verified=True)
    record = e_run.run_one(
        encoder,
        "base",
        list(encoder.base_clauses),
        [],
        1,
        solver=solver,
        backend="piqd",
    )
    assert requested.read_bytes() == b"preexisting sentinel"
    assert record["proof_format"] == "LRAT"
    assert record["proof_file"].endswith("base.lrat")
    assert record["kept_cnf_file"].endswith("base.kept.cnf")
    assert record["proof_clause_map_file"].endswith("base.clause-map.json")
    assert record["lean_replay_source_file"].endswith("base.replay.lean")
    assert record["lean_replay_receipt_file"].endswith("base.replay.json")
    assert record["certified_receipt_file"].endswith("base.piqd-certified.json")
    assert record["requested_proof_file"].endswith("base.drat")


def test_legacy_local_manifest_is_raw_drat_only(tmp_path: Path) -> None:
    proof_path = tmp_path / "legacy.drat"
    proof_path.write_bytes(b"raw DRAT")
    fields = lane_piqd.proof_manifest_fields(
        backend="legacy-local",
        requested_proof_path=proof_path,
        result=_result("UNSAT", verified=True),
        relative_to=tmp_path,
    )
    assert fields == {
        "solver_backend": "legacy-local",
        "proof_format": "DRAT",
        "proof_file": "legacy.drat",
        "requested_proof_file": "legacy.drat",
    }


def test_de_official_runs_are_sequential_in_one_worker(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    de_run = _load_frontier_module("de", "run")
    de_run.OUT_DIR = tmp_path / "out"
    solver = _RecordingSolver("SAT")
    monkeypatch.setattr(de_run, "solver_from_args", lambda **_kwargs: solver)
    monkeypatch.setattr(sys, "argv", ["de-run"])
    assert de_run.main() == 0
    assert solver.max_active == 1
    assert [path.stem for path, _proof in solver.calls] == list(
        de_run.enc.DEEncoder.RUNS
    )
    assert all(proof is not None for _path, proof in solver.calls)


@pytest.mark.parametrize("verdict", ["UNKNOWN", "TIMEOUT", "UNSAT"])
def test_e_run_rejects_inconclusive_or_unverified_unsat(
    verdict: str, monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    e_run = _load_frontier_module("e", "run")
    e_run.OUT_DIR = tmp_path / "out"
    solver = _RecordingSolver(verdict, verified=False)
    monkeypatch.setattr(e_run, "solver_from_args", lambda **_kwargs: solver)
    monkeypatch.setattr(sys, "argv", ["e-run"])
    assert e_run.main() == 1


def test_e_expected_unsat_probes_require_proof_verification(tmp_path: Path) -> None:
    e_smoke = _load_frontier_module("e", "smoke")
    e_smoke.OUT_DIR = tmp_path / "out" / "smoke"
    e_smoke.OUT_DIR.mkdir(parents=True)
    result = e_smoke.gate_probes(
        e_smoke.enc.EEncoder(),
        1,
        _RecordingSolver("UNSAT", verified=False),
        "piqd",
    )
    assert result["pass"] is False
    assert len(result["probes"]) == 5
    assert all(probe["pass"] is False for probe in result["probes"])


def test_de_and_dr_existing_unsat_proof_gates_remain_closed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    de_smoke = _load_frontier_module("de", "smoke")
    de_smoke.OUT_DIR = tmp_path / "de" / "smoke"
    solver = _RecordingSolver()

    def fixture_solver(
        *args: Any, proof_path: Path | None = None, **kwargs: Any
    ) -> CadicalResult:
        verdict = "UNSAT" if proof_path is not None else "SAT"
        solver.verdict = verdict
        solver.verified = False
        return solver(*args, proof_path=proof_path, **kwargs)

    monkeypatch.setattr(de_smoke, "solver_from_args", lambda **_kwargs: fixture_solver)
    monkeypatch.setattr(sys, "argv", ["de-smoke"])
    assert de_smoke.main() == 1

    dr_smoke = _load_frontier_module("dr", "smoke")
    dr_smoke.OUT_DIR = tmp_path / "dr" / "smoke"
    dr_smoke.OUT_DIR.mkdir(parents=True)
    encoder = dr_smoke.enc.DREncoder()
    negative = dr_smoke.solve_probe(
        encoder,
        "unverified",
        "dr-common",
        [(encoder.delta_q,), (encoder.delta_w,)],
        "UNSAT",
        1,
        solver=_RecordingSolver("UNSAT", verified=False),
        backend="piqd",
    )
    assert negative["pass"] is False


def test_dr_role_swap_gate_does_not_invoke_solver(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    dr_smoke = _load_frontier_module("dr", "smoke")
    dr_smoke.OUT_DIR = tmp_path / "out" / "smoke"

    class ExpectedSolver(_RecordingSolver):
        def __call__(
            self, *args: Any, proof_path: Path | None = None, **kwargs: Any
        ) -> CadicalResult:
            self.verdict = "UNSAT" if proof_path is not None else "SAT"
            self.verified = proof_path is not None
            return super().__call__(*args, proof_path=proof_path, **kwargs)

    solver = ExpectedSolver()
    monkeypatch.setattr(dr_smoke, "solver_from_args", lambda **_kwargs: solver)
    monkeypatch.setattr(sys, "argv", ["dr-smoke"])
    assert dr_smoke.main() == 0
    report = json.loads((dr_smoke.OUT_DIR / "smoke_report.json").read_text())
    direct = [
        gate for gate in report["gates"] if gate["gate"] == "direct-double-role-swap"
    ]
    assert len(direct) == 1 and direct[0]["pass"] is True
    assert len(report["gates"]) == 30
    assert len(solver.calls) == 29
