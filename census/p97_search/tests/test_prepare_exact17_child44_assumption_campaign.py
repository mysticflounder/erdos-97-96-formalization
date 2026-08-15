from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path

import pytest

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_cegar_wave_control import load_wave_control

_SCRIPT = Path(__file__).resolve().parents[3] / "scripts/prepare_exact17_child44_assumption_campaign.py"
_SPEC = importlib.util.spec_from_file_location("child44_preparation", _SCRIPT)
assert _SPEC is not None and _SPEC.loader is not None
preparation = importlib.util.module_from_spec(_SPEC)
sys.modules[_SPEC.name] = preparation
_SPEC.loader.exec_module(preparation)


def _stub_ingress(control, root: Path):
    return {
        "wave_manifest_sha256": control.manifest.sha256,
        "parent": {
            "path": str(root / "parent.cnf"),
            "sha256": preparation.PARENT_SHA256,
            "bytes": preparation.PARENT_BYTES,
            "variables": preparation.PARENT_VARIABLES,
            "clauses": preparation.PARENT_CLAUSES,
            "max_var": preparation.PARENT_VARIABLES,
            "journal_sha256": sha256_bytes(b"journal"),
            "journal_bytes": 7,
            "all_variables_used": True,
            "source_dev": 1,
            "source_ino": 2,
            "path_chain": [],
        },
        "producer_manifest_sha256": preparation.PRODUCER_SHA256,
        "variable_map_sha256": control.variable_map.sha256,
        "campaign_sha256": control.campaign.sha256,
        "campaign": {"schema": "fixture"},
    }


def _stub_plan(control, root: Path):
    return {
        "registration": {"wave_kind": "ASSUMPTION_CNF", "adapter_id": "assumption-cnf-piqd"},
        "control_sha256": sha256_bytes(control.canonical_bytes),
        "plan": {"steps": ["authenticate-control"], "proof_path": None, "workers": 1, "sequential": True},
    }


def _patch_fixture(monkeypatch, tmp_path: Path) -> Path:
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(b"fixture parent; not read by the stubbed registry\n")
    monkeypatch.setattr(preparation, "PARENT_PATH", parent)
    monkeypatch.setattr(preparation, "validate_registered_ingress", _stub_ingress)
    monkeypatch.setattr(preparation, "plan_execution", _stub_plan)
    return tmp_path / "package"


def test_document_generation_has_full_map_and_closed_control(tmp_path: Path):
    output = tmp_path / "package"
    documents = preparation.build_documents(tmp_path, output, parent_path=tmp_path / "parent.cnf")
    variable_map = json.loads(documents["variable-map.json"])
    assert len(variable_map["hit"]) == 17 * 17
    assert len(variable_map["next_center"]) == 17
    assert len(variable_map["named_order"]) == 2
    control = load_wave_control(documents["control.json"])
    assert control.policy.requested_core_limit == 1
    assert control.value["campaign"]["path"].endswith("campaign.json")


def test_prepare_calls_committed_path_and_is_idempotent(monkeypatch, tmp_path: Path):
    output = _patch_fixture(monkeypatch, tmp_path)
    calls: list[str] = []
    original_ingress = preparation.validate_registered_ingress
    original_plan = preparation.plan_execution

    def ingress(control, root):
        calls.append("validate")
        return original_ingress(control, root)

    def plan(control, root):
        calls.append("plan")
        return original_plan(control, root)

    monkeypatch.setattr(preparation, "validate_registered_ingress", ingress)
    monkeypatch.setattr(preparation, "plan_execution", plan)
    first = preparation.prepare_campaign(repo_root=tmp_path, output_dir=output)
    second = preparation.prepare_campaign(repo_root=tmp_path, output_dir=output)
    assert first == second
    assert calls == ["validate", "plan", "validate", "plan"]
    assert (output / "report.json").is_file()


def test_write_once_and_path_escape_fail_closed(monkeypatch, tmp_path: Path):
    output = _patch_fixture(monkeypatch, tmp_path)
    preparation.prepare_campaign(repo_root=tmp_path, output_dir=output)
    (output / "control.json").write_bytes(b"different")
    with pytest.raises(preparation.PreparationError, match="write-once"):
        preparation.prepare_campaign(repo_root=tmp_path, output_dir=output)
    with pytest.raises(preparation.PreparationError, match="inside repo_root"):
        preparation.prepare_campaign(repo_root=tmp_path, output_dir=tmp_path.parent / "escape")


def test_source_identity_mismatch_is_rejected(tmp_path: Path):
    bad = tmp_path / "bad-producer.json"
    bad.write_bytes(canonical_json_bytes({"producer": "wrong"}))
    with pytest.raises(preparation.PreparationError, match="producer manifest hash drifted"):
        preparation.build_documents(
            tmp_path,
            tmp_path / "package",
            parent_path=tmp_path / "parent.cnf",
            producer_path=bad,
        )
