from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType, SimpleNamespace
from typing import Any

import pytest

from census.card_head.frontier_lane_piqd import (
    LEGACY_LOCAL_BACKEND,
    PIQD_BACKEND,
    add_solver_arguments,
)
from census.card_head.piqd_certified_solver import (
    PiqdCertifiedSolver,
    PiqdPerQueryCertifiedSolver,
)
from census.card_head.piqd_frontier_a import (
    A_SMOKE_SOURCES,
    ACoreCallerPackageProfile,
    AllocationPhase,
    make_query_factory,
    make_solver,
    solver_from_args,
)
from census.card_head.sat_encoding import CadicalResult

REPO_ROOT = Path(__file__).resolve().parents[3]
A_CORE_ROOT = REPO_ROOT / "census" / "frontier-packages" / "a_core"
_THIS_SOURCE = "census/card_head/tests/test_piqd_frontier_a_callers.py"


def _load_a_module(script: str) -> ModuleType:
    module_path = A_CORE_ROOT / f"{script}.py"
    module_name = f"_test_frontier_a_{script}_{id(module_path)}"
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


def _allocation_counts(encoding: Any) -> tuple[int, int, int]:
    encoder = encoding.ACoreEncoder()
    base_n = encoder.cnf.n_variables
    encoder.build_del3_clauses()
    del3_n = encoder.cnf.n_variables
    encoder.build_a1_extension()
    final_n = encoder.cnf.n_variables
    return base_n, del3_n, final_n


def _profile() -> ACoreCallerPackageProfile:
    return ACoreCallerPackageProfile(
        source_paths=(_THIS_SOURCE,),
        allocation_phases=(
            AllocationPhase("base allocation", 2, "base variables"),
            AllocationPhase("DEL3 allocation", 3, "one auxiliary variable"),
            AllocationPhase("A1 allocation", 4, "one extension variable"),
        ),
        live_leaf="finite-local-test-leaf",
        finite_schema="finite-local-test-schema",
        cardinality_scope="four propositional variables only",
        source_theorem="NONE: unit-test package has no theorem entitlement",
    )


class _NeverReplayer:
    def __init__(self, **_kwargs: Any) -> None:
        pass

    def replay(self, **_kwargs: Any) -> Any:
        raise AssertionError("fake-only test must not invoke Lean")


class _RecordingSolver:
    def __init__(
        self, *, verified_unsat: bool = True, proof_requests_are_unsat: bool = True
    ) -> None:
        self.verified_unsat = verified_unsat
        self.proof_requests_are_unsat = proof_requests_are_unsat
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
            self.calls.append((cnf_path, proof_path))
            if proof_path is not None and self.proof_requests_are_unsat:
                return CadicalResult(
                    "UNSAT", None, 1, self.verified_unsat, "fake UNSAT", None
                )
            return CadicalResult("SAT", {"n>=25": True}, 1, False, "fake SAT", None)
        finally:
            self.active -= 1


def test_query_factory_binds_exact_a_map_sources_ledger_and_profile(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    from census.card_head import piqd_frontier_a as module

    encoding = _load_a_module("encoding")
    encoder = encoding.ACoreEncoder()
    base_n = encoder.cnf.n_variables
    encoder.build_del3_clauses()
    del3_n = encoder.cnf.n_variables
    encoder.build_a1_extension()
    final_n = encoder.cnf.n_variables
    assert base_n < del3_n < final_n

    packages: list[Any] = []
    outputs: list[Path] = []
    real_builder = module.build_frontier_authenticated_package

    def capture_package(**kwargs: Any) -> Any:
        package = real_builder(**kwargs)
        packages.append(package)
        return package

    def fake_transport_builder(_snapshot: Any, **kwargs: Any) -> Any:
        outputs.append(kwargs["output_root"])
        assert kwargs["fetch_certified_kept_blob"] is True

        def never(_request: Any) -> Any:
            raise AssertionError("fake-only test must not contact PIQD")

        return never

    monkeypatch.setattr(module, "build_frontier_authenticated_package", capture_package)
    factory = make_query_factory(
        encoder=encoder,
        profile=ACoreCallerPackageProfile(
            source_paths=A_SMOKE_SOURCES,
            allocation_phases=(
                AllocationPhase("A common base allocation", base_n, "base"),
                AllocationPhase("A physical DEL3 allocation", del3_n, "DEL3"),
                AllocationPhase("A1 extension allocation", final_n, "A1"),
            ),
            live_leaf="A-core finite-local test package",
            finite_schema="p97-a-core-layer1.v1.3-test",
            cardinality_scope="A-core symbolic cardinality buckets",
            source_theorem="NONE: focused test has no theorem entitlement",
        ),
        artifact_root=tmp_path,
        packet_transport_builder=fake_transport_builder,
        replayer_builder=_NeverReplayer,
    )
    instance = encoding.RunInstance(encoder, encoder.base_clauses)
    cnf = instance.dimacs().encode("ascii")
    first = factory(cnf, tmp_path / "g_base.cnf")
    second = factory(cnf, tmp_path / "g_base.cnf")

    assert type(first) is type(second) is PiqdCertifiedSolver
    assert len(packages) == len(outputs) == 2
    assert outputs[0] != outputs[1]
    assert all(path.parent == tmp_path / "piqd-attempts" for path in outputs)

    variable_map = json.loads(packages[0].variable_map_bytes)
    assert variable_map["coverage"] == "COMPLETE_1_TO_NUM_VARIABLES"
    assert len(variable_map["entries"]) == final_n
    by_id = {entry["id"]: entry for entry in variable_map["entries"]}
    for name, variable_id in encoder.names.items():
        assert by_id[variable_id]["name"] == name

    ledger = json.loads(packages[0].build_phase_ledger_bytes)
    assert [phase["allocator_num_variables"] for phase in ledger["phases"]] == [
        base_n,
        del3_n,
        final_n,
        final_n,
    ]
    lane_profile = json.loads(packages[0].lane_profile_bytes)
    assert lane_profile["lane"] == "A"
    assert lane_profile["semantic_status"] == "FINITE_LOCAL"
    assert lane_profile["evidence_classification"] == "LOCAL_CERTIFICATE"
    assert lane_profile["source_theorem"].startswith("NONE:")
    assert set(lane_profile["claims"].values()) == {False}
    source_manifest = json.loads(packages[0].source_manifest_bytes)
    assert [entry["logical_path"] for entry in source_manifest["entries"]] == list(
        A_SMOKE_SOURCES
    )


def test_backend_default_is_piqd_legacy_is_explicit_and_no_fallback(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    from census.card_head import piqd_frontier_a as module

    parser = argparse.ArgumentParser()
    add_solver_arguments(parser)
    defaults = parser.parse_args([])
    assert defaults.solver_backend == PIQD_BACKEND
    assert defaults.workers == 1
    with pytest.raises(SystemExit):
        parser.parse_args(["--workers", "2"])

    sentinel = object()
    legacy = SimpleNamespace(
        workers=1,
        solver_backend=LEGACY_LOCAL_BACKEND,
        piqd_base_url="http://piqd.invalid",
        piqd_max_polls=1,
        piqd_poll_interval=0.0,
        lean_replay_timeout=1,
    )
    assert (
        solver_from_args(
            args=legacy,
            encoder=SimpleNamespace(names={}),
            profile=_profile(),
            artifact_root=tmp_path,
            legacy_solver=sentinel,  # type: ignore[arg-type]
        )
        is sentinel
    )

    def fail(**_kwargs: Any) -> Any:
        raise RuntimeError("synthetic PIQD construction failure")

    monkeypatch.setattr(module, "make_solver", fail)
    piqd = SimpleNamespace(**{**vars(legacy), "solver_backend": PIQD_BACKEND})
    with pytest.raises(RuntimeError, match="synthetic PIQD construction failure"):
        solver_from_args(
            args=piqd,
            encoder=SimpleNamespace(names={}),
            profile=_profile(),
            artifact_root=tmp_path,
            legacy_solver=sentinel,  # type: ignore[arg-type]
        )

    solver = make_solver(
        encoder=SimpleNamespace(names={"x": 1, "y": 2, "z": 3, "a": 4}),
        profile=_profile(),
        artifact_root=tmp_path,
    )
    assert type(solver) is PiqdPerQueryCertifiedSolver


def test_run_preserves_order_single_worker_and_requested_drat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run = _load_a_module("run")
    run.OUT_DIR = tmp_path / "run"
    run.OUT_DIR.mkdir(parents=True)
    sentinel = run.OUT_DIR / "base.drat"
    sentinel.write_bytes(b"pre-existing legacy DRAT\n")
    solver = _RecordingSolver(proof_requests_are_unsat=False)
    profiles: list[ACoreCallerPackageProfile] = []

    def fake_solver_from_args(**kwargs: Any) -> _RecordingSolver:
        profiles.append(kwargs["profile"])
        return solver

    monkeypatch.setattr(run, "solver_from_args", fake_solver_from_args)
    monkeypatch.setattr(sys, "argv", ["a-run"])
    assert run.main() == 0
    base_n, del3_n, final_n = _allocation_counts(run.enc)

    assert solver.max_active == 1
    assert [path.stem for path, _proof in solver.calls] == [
        "base",
        "base+P",
        "base+P+A2",
        "base+P+A3",
        "base+P+A6",
        "base+P+A7",
        "base+P+A8",
        "base+A1",
    ]
    assert [profile.allocation_phases[-1].last_id for profile in profiles] == [
        base_n,
        del3_n,
        final_n,
    ]
    assert sentinel.read_bytes() == b"pre-existing legacy DRAT\n"
    manifest = json.loads((run.OUT_DIR / "manifest.json").read_bytes())
    assert all(record["solver_backend"] == PIQD_BACKEND for record in manifest)
    assert all(record["requested_proof_file"].endswith(".drat") for record in manifest)
    assert all(record["proof_file"] is None for record in manifest)


def test_smoke_preserves_gates_and_requires_verified_unsat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    smoke = _load_a_module("smoke")
    smoke.OUT_DIR = tmp_path / "smoke"
    smoke.OUT_DIR.mkdir(parents=True)

    unverified = _RecordingSolver(verified_unsat=False)
    negative = smoke.gate_c6(smoke.enc.ACoreEncoder(), 1, unverified, PIQD_BACKEND)
    assert negative["verdict"] == "UNSAT"
    assert negative["proof_verified"] is False
    assert negative["pass"] is False

    requested = smoke.OUT_DIR / "g_c6.drat"
    requested.write_bytes(b"pre-existing legacy DRAT\n")
    solver = _RecordingSolver(verified_unsat=True)
    profiles: list[ACoreCallerPackageProfile] = []

    def fake_solver_from_args(**kwargs: Any) -> _RecordingSolver:
        profiles.append(kwargs["profile"])
        return solver

    monkeypatch.setattr(smoke, "solver_from_args", fake_solver_from_args)
    monkeypatch.setattr(sys, "argv", ["a-smoke"])
    assert smoke.main() == 0
    assert solver.max_active == 1
    assert len(profiles) == 1
    assert [phase.last_id for phase in profiles[0].allocation_phases] == [
        *_allocation_counts(smoke.enc),
    ]
    expected_calls = 22 if hasattr(smoke.enc.ACoreEncoder, "OVERFLOW") else 21
    assert len(solver.calls) == expected_calls
    assert requested.read_bytes() == b"pre-existing legacy DRAT\n"

    report = json.loads((smoke.OUT_DIR / "smoke_report.json").read_bytes())
    assert report["ALL_GATES_PASS"] is True
    assert report["G-C6"]["proof_verified"] is True
    assert report["G-C6"]["proof_format"] == "LRAT"
    assert report["G-C6"]["requested_proof_file"].endswith("g_c6.drat")
    assert report["G-C6"]["proof_file"].endswith("g_c6.lrat")
    assert all(pair["proof_verified"] is True for pair in report["G-EXCL"]["pairs"])
    assert all(
        probe["proof_verified"] is True for probe in report["G-PROBES"]["probes"]
    )
