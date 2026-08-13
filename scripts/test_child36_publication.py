from __future__ import annotations

import json
from dataclasses import replace
from pathlib import Path

import pytest
import run_piqd_exact17_thirty_sixth_root as runner
import validate_exact17_thirty_fifth_model_refinements_ingress as ingress


def test_child36_ingress_and_runner_are_exactly_pinned() -> None:
    assert ingress.PRODUCTION_INGRESS_SPEC.provisioned
    assert ingress.PRODUCTION_INGRESS_SPEC.parent_manifest_sha256 == (
        "3241c3f22d0bb4a1635430ad35a395a0c46cd8b3a06423e05a682999533a72ae"
    )
    assert ingress.PRODUCTION_INGRESS_SPEC.export.child_sha256 == (
        "e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5"
    )
    assert ingress.PRODUCTION_INGRESS_SPEC.export.child_clauses == 5_847_264
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.manifest_sha256 == (
        "65a4a829a6d17629afc72aeb51bc1acdec21e8d7c474f909ed9cbbf0ecc55dea"
    )
    assert runner.PRODUCTION_RUNNER_SPEC.root_bytes == 291_621_334


def test_production_ingress_revalidates_exact_bytes() -> None:
    result = ingress.validate_ingress(
        expected_manifest_sha256=runner.PRODUCTION_RUNNER_SPEC.manifest_sha256
    )
    assert result["status"] == "PASS"
    assert result["dimacs_sha256"] == runner.PRODUCTION_RUNNER_SPEC.root_sha256
    assert result["new_clauses"] == 4


def test_ingress_rejects_mutated_manifest(tmp_path: Path) -> None:
    original = json.loads(ingress.PRODUCTION_INGRESS_PATHS.manifest.read_text())
    original["dimacs"]["clauses"] -= 1
    mutated = tmp_path / "manifest.json"
    mutated.write_text(json.dumps(original), encoding="utf-8")
    paths = replace(ingress.PRODUCTION_INGRESS_PATHS, manifest=mutated)
    with pytest.raises(ValueError, match="content drifted"):
        ingress.validate_ingress(paths)


def test_runner_namespace_is_hardened_and_direct_child36() -> None:
    lifecycle = runner._lifecycle_spec(runner.PRODUCTION_RUNNER_SPEC)
    assert lifecycle.artifact_namespace == "child36"
    assert lifecycle.project == "erdos-97-96-exact17-child36"
    assert runner._base._uses_hardened_protocol(lifecycle)


def test_runner_refuses_unprovisioned_manifest() -> None:
    spec = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    with pytest.raises(ingress.UnprovisionedError):
        runner.validate_local(spec=spec)
