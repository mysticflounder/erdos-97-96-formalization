from __future__ import annotations

import copy
import importlib.util
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / "scripts" / "generate_exact17_two_kalmanson_v2_candidate_refinements.py"


def generator_module():
    spec = importlib.util.spec_from_file_location("exact17_two_kalmanson_v2_test", GENERATOR)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def real_ledger(module):
    return module.strict_json(module.LEDGER.read_bytes())


def resign_ledger(module, ledger):
    ledger["manifest_sha256"] = module.self_hash(ledger, "manifest_sha256")


def resign_candidate(module, candidate):
    candidate["candidate_id"] = module.candidate_id(candidate)
    candidate["record_sha256"] = module.self_hash(candidate, "record_sha256")


def test_authenticated_ledger_replays_35_and_renders_140_distinct_clauses():
    module = generator_module()
    ledger = module.load_authenticated_ledger()
    occurrences = module.validate_ledger(ledger)
    assert len(occurrences) == module.EXPECTED_OCCURRENCES == 35
    assert module.EXPECTED_SUFFIX_CLAUSES == 140
    assert module.PARENT_ROOT_CLAUSES == 7_409_372
    assert module.EXPECTED_ROOT_CLAUSES == 7_409_512
    lean = module.render_lean(ledger)
    assert lean.count("  { hits := [") == 35
    assert "cancellationOccurrences.length = 35" in lean
    assert "twoKalmansonRefinementClauses.length = 140" in lean
    assert "twoKalmansonRefinementClauses_nodup" in lean
    assert "canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf.length = 7409512" in lean
    assert "false_of_twoKalmansonCancellationData_of_check" in lean or "sourceAssign_cancellationOccurrenceClause" in lean


def test_family_counts_and_core_candidates_are_not_promoted():
    module = generator_module()
    ledger = real_ledger(module)
    assert ledger["family_inventory"]["family_candidate_counts"] == {
        module.CORE_FAMILY: 2,
        module.COMPONENT_FAMILY: 0,
        module.FAMILY: 35,
    }
    assert len(module.validate_ledger(ledger)) == 35


def test_wrong_hash_is_rejected():
    module = generator_module()
    with pytest.raises(module.PromotionError, match="path drifted"):
        module.load_authenticated_ledger(module.LEDGER.with_name("not-the-ledger.json"))


def test_wrong_status_is_rejected_after_valid_self_hash():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["status"] = "INCOMPLETE"
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="schema/status drifted"):
        module.validate_ledger(ledger)


def test_wrong_consumer_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["lean_consumer"] = "Problem97.unreviewed"
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="Lean consumer drifted"):
        module.validate_ledger(ledger)


def test_nested_forward_consumer_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["payload"]["forward"]["lean_consumer"] = "Problem97.unreviewed"
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="record consumer drifted"):
        module.validate_ledger(ledger)


def test_support_core_mismatch_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["support"][0] = [0, 1]
    candidate["support"] = sorted(candidate["support"], key=module.canonical_json_bytes)
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="support/core mismatch"):
        module.validate_ledger(ledger)


def test_reflected_path_support_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["payload"]["reverse_path_support"][0] = [0, 0]
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="support/core mismatch"):
        module.validate_ledger(ledger)


def test_duplicate_support_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidates = [c for c in ledger["candidates"] if c["family"] == module.FAMILY]
    candidates[1]["support"] = copy.deepcopy(candidates[0]["support"])
    resign_candidate(module, candidates[1])
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="duplicate support"):
        module.validate_ledger(ledger)


def test_orbit_nodup_fact_is_emitted():
    module = generator_module()
    lean = module.render_lean(real_ledger(module))
    assert "theorem twoKalmansonRefinementClauses_nodup" in lean
    assert "twoKalmansonRefinementClauses.length = 140" in lean


def test_duplicate_json_keys_and_nonfinite_values_are_rejected():
    module = generator_module()
    with pytest.raises(module.PromotionError, match="duplicate JSON key"):
        module.strict_json(b'{"status":"COMPLETE","status":"INCOMPLETE"}')
    with pytest.raises(module.PromotionError, match="non-finite JSON constant"):
        module.strict_json(b'{"value":NaN}')


def test_immutable_output_refuses_overwrite(tmp_path: Path):
    module = generator_module()
    output = tmp_path / "Generated.lean"
    module.write_text_once(output, "first\n")
    with pytest.raises(FileExistsError, match="immutable publication target exists"):
        module.write_text_once(output, "second\n")
    assert output.read_text(encoding="utf-8") == "first\n"


def test_noncanonical_support_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["support"] = list(reversed(candidate["support"]))
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="canonical"):
        module.validate_ledger(ledger)
