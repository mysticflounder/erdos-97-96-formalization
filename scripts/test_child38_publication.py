from __future__ import annotations

from dataclasses import replace
from pathlib import Path

import export_exact17_thirty_eighth_root as publisher
import pytest
import run_piqd_exact17_thirty_eighth_root as runner
import validate_exact17_thirty_seventh_model_refinements_export as export
import validate_exact17_thirty_seventh_model_refinements_ingress as ingress

ROOT = Path(__file__).resolve().parents[1]
CANDIDATE = ROOT / "scratch/exact17-lean-to-sat/child38-provisioning-candidate.cnf"


def test_child38_exact_pins_sources_and_authenticated_model_cut() -> None:
    assert export.PRODUCTION_SPEC.provisioned
    assert export.PRODUCTION_SPEC.parent_clauses == 5_847_268
    assert export.PRODUCTION_SPEC.child_clauses == 5_847_276
    assert export.PRODUCTION_SPEC.child_sha256 == "07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7"
    assert len(export.SUFFIX) == 8
    export.validate_sources()
    assignment = export.authenticated_model(Path(export.MODEL_PATH))
    assert export.require_motivating_model_cut(export.SUFFIX, assignment) == (7,)
    assert ingress.PRODUCTION_INGRESS_SPEC.provisioned


def test_child38_candidate_is_exact_lean_owned_successor() -> None:
    result = export.validate_export(Path(export.PARENT_PATH), CANDIDATE, Path(export.MODEL_PATH))
    assert result["status"] == "PASS"
    assert result["motivating_model_cut_suffix_indices"] == [7]
    assert result["source_clause_families"] == ["child37SixHitCancellationClauses"]


def test_child38_rejects_source_pin_drift() -> None:
    spec = replace(export.PRODUCTION_SPEC, lean_root_sha256="0" * 64)
    with pytest.raises(ValueError, match="authenticated Lean source drifted"):
        export.validate_sources(spec)


def test_child38_rejects_semantic_suffix_duplicate(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(export, "SUFFIX", export.SUFFIX[:-1] + (export.SUFFIX[0],))
    with pytest.raises(ValueError, match="duplicate semantic"):
        export.validate_spec(export.PRODUCTION_SPEC)


def test_export_receipt_is_ledger_last_on_serialization_failure(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    target = tmp_path / "receipt.json"

    def fail_after_partial_write(*args: object, **kwargs: object) -> None:
        handle = args[1]
        handle.write("{")
        handle.flush()
        raise RuntimeError("injected serialization failure")

    monkeypatch.setattr(publisher.json, "dump", fail_after_partial_write)
    with pytest.raises(RuntimeError, match="injected"):
        publisher._publish_json_ledger_last(target, {"status": "PASS"})
    assert not target.exists()
    assert list(tmp_path.iterdir()) == []


def test_ingress_manifest_is_ledger_last_and_no_overwrite(tmp_path: Path) -> None:
    target = tmp_path / "manifest.json"
    ingress._immutable_json(target, {"status": "PASS"})
    original = target.read_bytes()
    with pytest.raises(FileExistsError):
        ingress._immutable_json(target, {"status": "DRIFT"})
    assert target.read_bytes() == original


def test_child38_live_export_ingress_and_runner_are_exactly_bound() -> None:
    result = export.validate_export(Path(export.PARENT_PATH), Path(export.CHILD_PATH), Path(export.MODEL_PATH))
    assert result["status"] == "PASS"
    ingress_result = ingress.validate_ingress(
        expected_manifest_sha256="6b74b75871940761fa346469b04c0ad17064a36b56766c5413c2ff6e048ad815"
    )
    assert ingress_result["status"] == "PASS"
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.root_sha256 == export.PRODUCTION_SPEC.child_sha256
    assert runner.PRODUCTION_RUNNER_SPEC.root_bytes == export.PRODUCTION_SPEC.child_bytes
    assert runner.PRODUCTION_RUNNER_SPEC.clauses == 5_847_276


def test_child38_runner_refuses_unprovisioned_override() -> None:
    spec = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    with pytest.raises(ingress.UnprovisionedError, match="UNPROVISIONED"):
        runner.validate_local(spec=spec)
