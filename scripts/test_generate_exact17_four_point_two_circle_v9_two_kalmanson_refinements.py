from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / "scripts/generate_exact17_four_point_two_circle_v9_two_kalmanson_refinements.py"


def generator_module():
    name = "exact17_fourpoint_v9_twok_test"
    spec = importlib.util.spec_from_file_location(name, GENERATOR)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def test_v9_audit_facts_are_pinned():
    module = generator_module()
    assert module.EXPECTED_TOTAL_CANDIDATES == 19
    assert module.EXPECTED_ORBIT_CLAUSES == 76
    assert module.EXPECTED_PARENT_SUBSUMED_CLAUSES == 20
    assert module.EXPECTED_STRICT_NEW_CLAUSES == 56
    assert module.EXPECTED_ORBIT_JSON_SHA256 == (
        "45f6534755d2242c4175824716ab6e7e1a7ef9251793ced6d20b21bd44c74206"
    )
    assert module.EXPECTED_STRICT_NEW_JSON_SHA256 == (
        "e6f2940cdea17d8f5819c65e9c7b181f83f107034b5043ae73d9c6dcb354bcd2"
    )
    assert module.EXPECTED_STRICT_NEW_INDEX_LIST_SHA256 == (
        "9b519c1292c89b4cd4a98f0cd6801d769b5eaa7fd300d9e1c9aab1dd1a649987"
    )


def test_only_refrozen_official_artifacts_are_accepted():
    module = generator_module()
    assert module.OFFICIAL_ARTIFACTS.as_posix().endswith(
        "sat-profile-portfolio-v8-refrozen/artifacts"
    )
    assert "diagnostic" not in module.LEDGER.as_posix()
    assert module.LEDGER.parent == module.RECEIPT.parent
    with pytest.raises(module.PromotionError, match="production pins are unfinalized"):
        module.load_authenticated_ledger()


def test_unfinalized_pins_block_every_production_entrypoint():
    module = generator_module()
    with pytest.raises(module.PromotionError, match="production pins are unfinalized"):
        module._require_finalized_pins()
    with pytest.raises(module.PromotionError, match="production pins are unfinalized"):
        module.load_authenticated_receipt()


def test_ledger_and_receipt_path_guards_reject_copies(tmp_path: Path):
    module = generator_module()
    copied_ledger = tmp_path / "candidate-ledger.json"
    copied_ledger.write_text("{}", encoding="utf-8")
    with pytest.raises(module.PromotionError, match="official ledger path drifted"):
        module._load_exact_artifact(copied_ledger, module.LEDGER, "ledger")
    copied_receipt = tmp_path / "mine-receipt.json"
    copied_receipt.write_text("{}", encoding="utf-8")
    with pytest.raises(module.PromotionError, match="official mine receipt path drifted"):
        module._load_exact_artifact(copied_receipt, module.RECEIPT, "mine receipt")


def test_strict_new_clause_audit_fails_closed_before_hashing():
    module = generator_module()
    clauses = tuple((index,) for index in range(module.EXPECTED_ORBIT_CLAUSES))
    with pytest.raises(module.PromotionError, match="strict-new clause count drifted"):
        module.strict_new_clauses(clauses, tuple(range(50)))
    with pytest.raises(module.PromotionError, match="strict-new index list is not unique"):
        module.strict_new_clauses(clauses, (0,) * module.EXPECTED_STRICT_NEW_CLAUSES)


def test_receipt_schema_identity_is_v8_mine_contract():
    module = generator_module()
    assert module.RECEIPT_SCHEMA == module.MINER.WAVE_MINE_SCHEMA
    assert module.CANDIDATE_SCHEMA == module.MINER.WAVE_MINE_CANDIDATE_SCHEMA
    assert module.LEDGER_SCHEMA == module.MINER.WAVE_MINE_LEDGER_SCHEMA


def test_source_valid_family_inventory_matches_miner_contract():
    module = generator_module()
    assert list(module.MINER.SOURCE_VALID_FAMILIES) == [
        "formalized-core-bank",
        "perpendicular-bisector-equality-component",
        "two-kalmanson-cancellation",
    ]


def test_current_miner_identity_is_hard_pinned():
    module = generator_module()
    assert module.MINER_SOURCE_BYTES == 10009
    assert module.MINER_SOURCE_SHA256 == (
        "e370ada228b6bcdff619e2997b0b3faa54ac11bbe913546e7b266398a7e402c5"
    )
    scanner = {
        "name": module.MINER.MINER_NAME,
        "schema": module.MINER.MINER_SCHEMA,
        "source_path": module.MINER.MINER_RELATIVE,
        "source_sha256": module.MINER_SOURCE_SHA256,
        "version": module.MINER.MINER_VERSION,
    }
    module._validate_scanner(scanner)
    scanner["source_sha256"] = "0" * 64
    with pytest.raises(module.PromotionError, match="scanner source identity drifted"):
        module._validate_scanner(scanner)


def test_receipt_descriptor_helper_rejects_key_path_and_hash_tampering():
    module = generator_module()
    raw = b"official-ledger"
    descriptor = {
        "bytes": len(raw),
        "path": module.LEDGER.relative_to(module.REPO).as_posix(),
        "sha256": module.sha256_bytes(raw),
    }
    with pytest.raises(module.PromotionError, match="descriptor keys drifted"):
        module.validate_receipt_descriptor({**descriptor, "extra": True}, raw)
    with pytest.raises(module.PromotionError, match="descriptor path drifted"):
        module.validate_receipt_descriptor({**descriptor, "path": "diagnostic.json"}, raw)
    with pytest.raises(module.PromotionError, match="descriptor identity drifted"):
        module.validate_receipt_descriptor({**descriptor, "sha256": "0" * 64}, raw)


def test_receipt_binding_helper_rejects_job_model_and_cell_drift():
    module = generator_module()
    ledger = {"job_id": "job", "model_sha256": "model", "portfolio_cell_id": "cell"}
    receipt = dict(ledger)
    module.validate_receipt_bindings(receipt, ledger)
    for key in ledger:
        tampered = dict(receipt)
        tampered[key] = "tampered"
        with pytest.raises(module.PromotionError, match=f"{key} binding drifted"):
            module.validate_receipt_bindings(tampered, ledger)


def test_parent_dimensions_are_v8_root_plus_v9_suffix():
    module = generator_module()
    assert module.PARENT_ROOT_CLAUSES == 7_409_839
    assert module.EXPECTED_V9_ROOT_CLAUSES == 7_409_895
    assert module.PARENT_PHYSICAL_CLAUSES == 7_409_845
    assert module.NUM_VARIABLES == 308


def test_rendering_template_keeps_v8_whole_root_and_axiom_audit_surface():
    source = GENERATOR.read_text(encoding="utf-8")
    assert "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf" in source
    assert "#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf" in source
