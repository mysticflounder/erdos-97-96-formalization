from __future__ import annotations

import hashlib
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import export_exact17_thirty_ninth_root as exporter
import run_piqd_exact17_thirty_ninth_root as runner
import validate_exact17_thirty_eighth_model_refinements_export as export_validation
import validate_exact17_thirty_eighth_model_refinements_ingress as ingress


def test_child38_parent_and_child39_boundary_are_pinned() -> None:
    assert export_validation.VARIABLES == 308
    assert export_validation.PARENT_CLAUSES == 5_847_276
    assert export_validation.NEW_CLAUSES == 112
    assert export_validation.CHILD_CLAUSES == 5_847_388
    assert export_validation.PARENT_SHA256 == "07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7"
    assert export_validation.MODEL_JOB_ID == "aeaefb24-0f57-4b1f-9c62-644208e65977"
    assert len(export_validation.SUFFIX) == 112
    ordered = b"".join((" ".join(map(str, clause)) + " 0\n").encode() for clause in export_validation.SUFFIX)
    assert hashlib.sha256(ordered).hexdigest() == "4cc66a1b3f4af46d60ed0a2c59f4fb6b0cb016f3ab1b111989ffe015f5b33925"
    assert runner.PRODUCTION_RUNNER_SPEC.artifact_namespace == "child39"
    assert runner.PRODUCTION_RUNNER_SPEC.project == "erdos-97-96-exact17-child39"


def test_child38_custody_model_authenticates_without_provisioning() -> None:
    assignment = export_validation.authenticated_model(Path(export_validation.MODEL_PATH))
    assert len(assignment) == export_validation.VARIABLES
    assert assignment[1] in {True, False}


def test_export_ingress_and_runner_are_bound_without_external_work() -> None:
    assert export_validation.PRODUCTION_SPEC.provisioned
    export_validation.validate_spec(export_validation.PRODUCTION_SPEC, require_source_pins=True)
    assert ingress.PRODUCTION_INGRESS_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert ingress.validate_ingress()["manifest_sha256"] == ingress.MANIFEST_SHA256
    assert runner.validate_local()["status"] == "PASS"


def test_child39_paths_are_new_and_do_not_alias_child38_root() -> None:
    assert exporter.PRODUCTION_PATHS.child.name == "exact17-thirty-ninth-root-thirty-eighth-model-refinements.cnf"
    assert exporter.PRODUCTION_PATHS.receipt.name == "child39-export-receipt.json"
    assert runner.PRODUCTION_RUNNER_PATHS.model == Path(export_validation.MODEL_PATH)
    assert runner.PRODUCTION_RUNNER_PATHS.intent.name.startswith("piqd-child39-")
    assert runner.PRODUCTION_RUNNER_PATHS.solver_log.name.startswith("piqd-child39-")
