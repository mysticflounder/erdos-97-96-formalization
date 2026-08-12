from __future__ import annotations

import argparse
import json
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.card_head.frontier_lane_piqd import (
    LEGACY_LOCAL_BACKEND,
    PIQD_BACKEND,
    add_solver_arguments,
    proof_manifest_fields,
)
from census.card_head.piqd_certified_solver import (
    PiqdCertifiedSolver,
    PiqdPerQueryCertifiedSolver,
)
from census.card_head.piqd_frontier_bc import (
    AllocationPhase,
    BcCallerPackageProfile,
    make_query_factory,
    make_solver,
    solver_from_args,
)
from census.card_head.sat_encoding import CadicalResult

_THIS_SOURCE = "census/card_head/tests/test_piqd_frontier_bc.py"


class _NeverTransport:
    def __call__(self, request: Any) -> Any:
        raise AssertionError("unit test must not contact PIQD")


class _NeverReplayer:
    def __init__(self, **kwargs: Any) -> None:
        self.kwargs = kwargs

    def replay(self, **kwargs: Any) -> Any:
        raise AssertionError("unit test must not invoke Lean")


def _profile() -> BcCallerPackageProfile:
    return BcCallerPackageProfile(
        lane="C",
        source_paths=(_THIS_SOURCE,),
        allocation_phases=(
            AllocationPhase("base allocation", 2, "base variables"),
            AllocationPhase("DEL3 allocation", 3, "one auxiliary variable"),
            AllocationPhase("C2 allocation", 4, "one fresh-P variable"),
        ),
        live_leaf="finite-local-test-leaf",
        finite_schema="finite-local-test-schema",
        cardinality_scope="four propositional variables only",
        source_theorem="NONE: unit-test package has no theorem entitlement",
    )


def test_query_factory_builds_fresh_exact_packages_with_full_custody(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    from census.card_head import piqd_frontier_bc as module

    cnf = b"p cnf 4 2\n1 0\n-4 0\n"
    encoder = SimpleNamespace(names={"base.x": 1, "c2.P": 4})
    packages: list[Any] = []
    outputs: list[Path] = []
    real_builder = module.build_frontier_authenticated_package

    def capture_package(**kwargs: Any) -> Any:
        package = real_builder(**kwargs)
        packages.append(package)
        return package

    def fake_transport_builder(snapshot: Any, **kwargs: Any) -> _NeverTransport:
        outputs.append(kwargs["output_root"])
        assert kwargs["fetch_certified_kept_blob"] is True
        return _NeverTransport()

    monkeypatch.setattr(module, "build_frontier_authenticated_package", capture_package)
    factory = make_query_factory(
        encoder=encoder,
        profile=_profile(),
        artifact_root=tmp_path,
        base_url="http://piqd.invalid",
        packet_transport_builder=fake_transport_builder,
        replayer_builder=_NeverReplayer,
    )

    first = factory(cnf, tmp_path / "query.cnf")
    second = factory(cnf, tmp_path / "query.cnf")

    assert type(first) is PiqdCertifiedSolver
    assert type(second) is PiqdCertifiedSolver
    assert len(packages) == 2
    assert packages[0] is not packages[1]
    assert packages[0].cnf == cnf == packages[1].cnf
    assert len(outputs) == 2 and outputs[0] != outputs[1]
    assert all(path.parent == tmp_path / "piqd-attempts" for path in outputs)

    variable_map = json.loads(packages[0].variable_map_bytes)
    assert variable_map["coverage"] == "COMPLETE_1_TO_NUM_VARIABLES"
    assert [entry["id"] for entry in variable_map["entries"]] == [1, 2, 3, 4]
    assert variable_map["entries"][2] == {
        "id": 3,
        "kind": "anonymous_auxiliary",
        "name": "anonymous_auxiliary:3",
        "used_in_cnf": False,
    }

    ledger = json.loads(packages[0].build_phase_ledger_bytes)
    assert [phase["allocator_num_variables"] for phase in ledger["phases"]] == [
        2,
        3,
        4,
        4,
    ]
    assert ledger["phases"][-1]["query"]["cnf_sha256"]
    lane_profile = json.loads(packages[0].lane_profile_bytes)
    assert lane_profile["source_theorem"].startswith("NONE:")
    assert lane_profile["claims"]["source_entitlement_established"] is False
    source_manifest = json.loads(packages[0].source_manifest_bytes)
    assert source_manifest["entries"][0]["logical_path"] == _THIS_SOURCE


def test_make_solver_uses_shared_per_query_seam(tmp_path: Path) -> None:
    encoder = SimpleNamespace(names={"x": 1, "y": 2, "aux": 3, "p": 4})
    solver = make_solver(encoder=encoder, profile=_profile(), artifact_root=tmp_path)
    assert type(solver) is PiqdPerQueryCertifiedSolver


def test_backend_default_and_explicit_legacy_have_no_fallback(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    from census.card_head import piqd_frontier_bc as module

    parser = argparse.ArgumentParser()
    add_solver_arguments(parser)
    defaults = parser.parse_args([])
    assert defaults.solver_backend == PIQD_BACKEND
    assert defaults.workers == 1

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

    piqd_sentinel = object()
    monkeypatch.setattr(module, "make_solver", lambda **kwargs: piqd_sentinel)
    piqd = SimpleNamespace(**{**vars(legacy), "solver_backend": PIQD_BACKEND})
    assert (
        solver_from_args(
            args=piqd,
            encoder=SimpleNamespace(names={}),
            profile=_profile(),
            artifact_root=tmp_path,
            legacy_solver=sentinel,  # type: ignore[arg-type]
        )
        is piqd_sentinel
    )


def test_piqd_custody_fields_leave_requested_drat_untouched(tmp_path: Path) -> None:
    requested = tmp_path / "gate.drat"
    requested.write_bytes(b"pre-existing legacy DRAT\n")
    result = CadicalResult("UNSAT", None, 20, True, "certified", None)

    fields = proof_manifest_fields(
        backend=PIQD_BACKEND,
        requested_proof_path=requested,
        result=result,
        relative_to=tmp_path,
    )

    assert requested.read_bytes() == b"pre-existing legacy DRAT\n"
    assert fields == {
        "solver_backend": "piqd",
        "proof_format": "LRAT",
        "proof_file": "gate.lrat",
        "requested_proof_file": "gate.drat",
        "kept_cnf_file": "gate.kept.cnf",
        "proof_clause_map_file": "gate.clause-map.json",
        "lean_replay_source_file": "gate.replay.lean",
        "lean_replay_receipt_file": "gate.replay.json",
        "certified_receipt_file": "gate.piqd-certified.json",
    }
