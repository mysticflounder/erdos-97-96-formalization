from __future__ import annotations

import hashlib
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import export_exact17_thirty_fortieth_root as exporter
import run_piqd_exact17_thirty_fortieth_root as runner
import validate_exact17_thirty_ninth_model_refinements_export as export_validation
import validate_exact17_thirty_ninth_model_refinements_ingress as ingress


def test_child39_parent_and_child40_boundary_are_pinned() -> None:
    assert export_validation.VARIABLES == 308
    assert export_validation.PARENT_CLAUSES == 5_847_388
    assert export_validation.NEW_CLAUSES == 196
    assert export_validation.CHILD_CLAUSES == 5_847_584
    assert export_validation.PARENT_SHA256 == "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a"
    assert export_validation.MODEL_JOB_ID == "68cfcaf6-1a90-466e-8fc3-d1c3ffc8e377"
    assert len(export_validation.SUFFIX) == 196
    ordered = b"".join((" ".join(map(str, clause)) + " 0\n").encode() for clause in export_validation.SUFFIX)
    assert hashlib.sha256(ordered).hexdigest() == "e34111b179caf00ed0e04c3f28d17fd670d7a2291a9761a09f0d6984bdf19be5"
    assert runner.PRODUCTION_RUNNER_SPEC.artifact_namespace == "child40"
    assert runner.PRODUCTION_RUNNER_SPEC.project == "erdos-97-96-exact17-child40"


def test_child39_custody_model_authenticates_without_provisioning() -> None:
    assignment = export_validation.authenticated_model(Path(export_validation.MODEL_PATH))
    assert len(assignment) == export_validation.VARIABLES
    assert assignment[1] in {True, False}


def test_export_ingress_and_runner_are_bound_without_external_work() -> None:
    assert not export_validation.PRODUCTION_SPEC.provisioned
    export_validation.validate_spec(export_validation.PRODUCTION_SPEC, require_source_pins=True)
    assert not ingress.PRODUCTION_INGRESS_SPEC.provisioned
    assert not runner.PRODUCTION_RUNNER_SPEC.provisioned
    with pytest.raises(export_validation.UnprovisionedError):
        exporter.export_child40()
    with pytest.raises(ingress.UnprovisionedError):
        ingress.emit_ingress()
    with pytest.raises(runner.UnprovisionedError):
        runner.validate_local()


def test_child40_paths_are_new_and_do_not_alias_child39_root() -> None:
    assert exporter.PRODUCTION_PATHS.child.name == "exact17-thirty-fortieth-root-thirty-ninth-model-refinements.cnf"
    assert exporter.PRODUCTION_PATHS.receipt.name == "child40-export-receipt.json"
    lifecycle = runner.PRODUCTION_RUNNER_PATHS
    for field in ("intent", "prepared", "state", "final", "model", "solver_log", "lock"):
        path = getattr(lifecycle, field)
        assert path.name.startswith("piqd-child40-")
        assert "child32" not in str(path)


def test_stale_child32_artifacts_are_irrelevant_to_child40_start(tmp_path: Path) -> None:
    stale = tmp_path / "child32" / "piqd-child32-core1-fresh-custody-final.json"
    stale.parent.mkdir()
    stale.write_text("stale child32 final\n", encoding="utf-8")
    child40 = tmp_path / "child40"
    paths = runner.RunnerPaths(
        runner.PRODUCTION_INGRESS_PATHS,
        *(child40 / f"piqd-child40-core1-custody-{field}.json" for field in ("intent", "prepared", "live-state", "final", "model")),
        child40 / "piqd-child40-core1-custody-solver.log",
        child40 / "piqd-child40-core1-custody-runner.lock",
    )

    class NoContact:
        def version(self) -> None:
            raise AssertionError("PIQD contact must not be made by this test")

    with pytest.raises(runner.UnprovisionedError):
        runner.start(NoContact(), paths=paths, ingress_validator=lambda *_args, **_kwargs: {"status": "PASS"})
