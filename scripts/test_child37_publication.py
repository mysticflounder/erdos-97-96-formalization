from __future__ import annotations

import json
from dataclasses import replace
from pathlib import Path

import pytest
import run_piqd_exact17_thirty_seventh_root as runner
import validate_exact17_thirty_sixth_model_refinements_export as export
import validate_exact17_thirty_sixth_model_refinements_ingress as ingress


def test_child37_exact_pins_and_model_cut() -> None:
    assert export.PRODUCTION_SPEC.provisioned
    assert export.PRODUCTION_SPEC.parent_clauses == 5_847_264
    assert export.PRODUCTION_SPEC.child_clauses == 5_847_268
    assert export.PRODUCTION_SPEC.child_sha256 == "98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3"
    assignment = export.authenticated_model(Path(export.MODEL_PATH))
    assert export.require_motivating_model_cut(export.SUFFIX, assignment) == (3,)
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.manifest_sha256 == "3d02b8e2a18ba75b08020e8275ca7e7aadb8e0556762a062dbca3ae546026f18"
    assert runner.PRODUCTION_RUNNER_SPEC.root_sha256 == export.PRODUCTION_SPEC.child_sha256
    assert runner.PRODUCTION_RUNNER_SPEC.root_bytes == export.PRODUCTION_SPEC.child_bytes
    assert runner.PRODUCTION_RUNNER_SPEC.clauses == 5_847_268
    assert runner.PRODUCTION_RUNNER_SPEC.artifact_namespace == "child37"


def test_child37_export_and_ingress_validate() -> None:
    result = export.validate_export(Path(export.PARENT_PATH), Path(export.CHILD_PATH), Path(export.MODEL_PATH))
    assert result["status"] == "PASS"
    assert result["motivating_model_cut_suffix_indices"] == [3]
    ingress_result = ingress.validate_ingress()
    assert ingress_result["status"] == "PASS"
    assert ingress_result["clauses"] == 5_847_268


def test_child37_rejects_mutated_suffix(tmp_path: Path) -> None:
    original = Path(export.CHILD_PATH).read_bytes()
    marker = b"-307 -9 -3 -281 -284 -267 -258 0\n"
    assert marker in original
    mutated = tmp_path / "mutated.cnf"
    mutated.write_bytes(original.replace(marker, b"-307 -9 -3 -281 -284 -267 -259 0\n", 1))
    with pytest.raises(ValueError, match="child37 suffix mismatch"):
        export.validate_export(Path(export.PARENT_PATH), mutated, Path(export.MODEL_PATH))


def test_child37_rejects_suffix_permutation(tmp_path: Path) -> None:
    original = Path(export.CHILD_PATH).read_bytes()
    marker = b"-307 -9 -3 -281 -284 -267 -258 0\n"
    assert marker in original
    permuted = tmp_path / "permuted.cnf"
    permuted.write_bytes(original.replace(marker, b"-307 -3 -9 -281 -284 -267 -258 0\n", 1))
    with pytest.raises(ValueError, match="child37 suffix mismatch"):
        export.validate_export(Path(export.PARENT_PATH), permuted, Path(export.MODEL_PATH))


def test_child37_runner_refuses_unprovisioned_spec() -> None:
    spec = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    with pytest.raises(ingress.UnprovisionedError):
        runner.validate_local(spec=spec)


def test_child37_manifest_is_exactly_bound() -> None:
    payload = json.loads(ingress.PRODUCTION_INGRESS_PATHS.manifest.read_text())
    assert payload["source_modules"] == [
        "BlockerVExactSeventeenThirtySixthModelRefinements",
        "BlockerVExactSeventeenThirtySixthModelRefinementsExport",
    ]
    assert payload["validation"]["motivating_model_cut_suffix_indices"] == [3]
