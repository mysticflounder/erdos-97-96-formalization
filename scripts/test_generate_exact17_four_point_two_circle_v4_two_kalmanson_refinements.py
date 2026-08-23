from __future__ import annotations

import copy
import importlib.util
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = (
    ROOT
    / "scripts"
    / "generate_exact17_four_point_two_circle_v4_two_kalmanson_refinements.py"
)


def generator_module():
    spec = importlib.util.spec_from_file_location("exact17_fourpoint_v4_twok_test", GENERATOR)
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


def test_authenticated_ledger_replays_59_and_renders_236_distinct_clauses():
    module = generator_module()
    ledger = module.load_authenticated_ledger()
    occurrences = module.validate_ledger(ledger)
    suffix = module.render_dimacs_suffix(occurrences)
    assert len(occurrences) == module.EXPECTED_OCCURRENCES == 59
    assert len({hits for hits, _forward, _reverse in occurrences}) == 59
    assert len(suffix) == len(set(suffix)) == module.EXPECTED_SUFFIX_CLAUSES == 236
    assert module.PARENT_ROOT_CLAUSES == 7_409_516
    assert module.EXPECTED_ROOT_CLAUSES == 7_409_752
    assert all(len(module.orbit_clauses(hits)) == 4 for hits, _forward, _reverse in occurrences)


def test_rendered_lean_imports_parent_and_banks_nodup_and_source_coverage():
    module = generator_module()
    lean = module.render_lean(real_ledger(module))
    assert lean.count("  { hits := [") == 59
    assert "import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements" in lean
    assert "cancellationOccurrences.length = 59" in lean
    assert "v4TwoKalmansonRefinementClauses.length = 236" in lean
    assert "v4TwoKalmansonRefinementClauses_nodup" in lean
    assert "sourceAssign_v4TwoKalmansonRefinementClauses" in lean
    assert "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf" in lean
    assert "7409752" in lean


def test_generated_lean_is_the_authenticated_deterministic_render():
    module = generator_module()
    generated = (
        ROOT
        / "lean"
        / "Erdos9796Proof"
        / "P97"
        / "ATail"
        / "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements.lean"
    )
    assert generated.read_text(encoding="utf-8") == module.render_lean(
        module.load_authenticated_ledger()
    )


def test_family_inventory_is_exact_and_core_candidates_are_not_rendered():
    module = generator_module()
    ledger = real_ledger(module)
    assert ledger["family_inventory"] == module.EXPECTED_FAMILY_INVENTORY
    assert len(module.validate_ledger(ledger)) == 59
    assert len([candidate for candidate in ledger["candidates"] if candidate["family"] == module.CORE_FAMILY]) == 4


def test_first_occurrence_has_complete_two_order_two_direction_orbit():
    module = generator_module()
    hits, _forward, _reverse = module.validate_ledger(real_ledger(module))[0]
    clauses = module.orbit_clauses(hits)
    assert [clause[0] for clause in clauses] == [-307, -307, -308, -308]
    assert clauses[0] != clauses[1]
    assert clauses[2] != clauses[3]
    assert all(clause[-1] != 0 for clause in clauses)


def test_wrong_path_and_raw_hash_are_rejected(tmp_path: Path):
    module = generator_module()
    copied = tmp_path / "candidate-ledger.json"
    copied.write_bytes(module.LEDGER.read_bytes())
    with pytest.raises(module.PromotionError, match="path drifted"):
        module.load_authenticated_ledger(copied)


def test_wrong_status_is_rejected_after_valid_self_hash():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["status"] = "INCOMPLETE"
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="schema/status drifted"):
        module.validate_ledger(ledger)


def test_scanner_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["scanner"]["version"] = "3"
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="scanner drifted"):
        module.validate_ledger(ledger)


def test_family_count_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["family_inventory"]["family_candidate_counts"][module.FAMILY] = 58
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="family inventory drifted"):
        module.validate_ledger(ledger)


def test_generic_consumer_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(candidate for candidate in ledger["candidates"] if candidate["family"] == module.FAMILY)
    candidate["lean_consumer"] = "Problem97.unreviewed"
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="family/consumer drifted"):
        module.validate_ledger(ledger)


def test_nested_record_consumer_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(candidate for candidate in ledger["candidates"] if candidate["family"] == module.FAMILY)
    candidate["payload"]["forward"]["lean_consumer"] = "Problem97.unreviewed"
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="record consumer drifted"):
        module.validate_ledger(ledger)


def test_support_core_mismatch_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(candidate for candidate in ledger["candidates"] if candidate["family"] == module.FAMILY)
    candidate["support"][0] = [0, 1]
    candidate["support"] = sorted(candidate["support"], key=module.canonical_json_bytes)
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="support/core mismatch"):
        module.validate_ledger(ledger)


def test_duplicate_support_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidates = [candidate for candidate in ledger["candidates"] if candidate["family"] == module.FAMILY]
    candidates[1]["support"] = copy.deepcopy(candidates[0]["support"])
    resign_candidate(module, candidates[1])
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="duplicate support"):
        module.validate_ledger(ledger)


def test_projection_order_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(candidate for candidate in ledger["candidates"] if candidate["family"] == module.FAMILY)
    candidate["payload"]["reverse"]["projection"]["order"] = list(module.EXPECTED_ORDER)
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="projection order drifted"):
        module.validate_ledger(ledger)


def test_parent_novelty_streaming_classifier(tmp_path: Path):
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    parent.write_text(
        "p cnf 9 4\n-1 -2 0\n-1 -2 -3 0\n-4 -4 0\n5 0\n", encoding="ascii"
    )
    suffix = ((-1, -2, -3), (-4, -5), (6,))
    novelty = module.classify_parent_novelty(parent, suffix)
    assert novelty.exact_duplicate_multiplicities == (1, 0, 0)
    assert novelty.strict_subsumer_multiplicities == (1, 1, 0)
    assert novelty.exact_duplicate_clause_count == 1
    assert novelty.strictly_subsumed_clause_count == 2


def test_immutable_output_refuses_overwrite(tmp_path: Path):
    module = generator_module()
    output = tmp_path / "Generated.lean"
    module.V2.write_text_once(output, "first\n")
    with pytest.raises(FileExistsError, match="immutable publication target exists"):
        module.V2.write_text_once(output, "second\n")
    assert output.read_text(encoding="utf-8") == "first\n"


def test_duplicate_json_keys_and_nonfinite_values_are_rejected():
    module = generator_module()
    with pytest.raises(module.PromotionError, match="duplicate JSON key"):
        module.strict_json(b'{"status":"COMPLETE","status":"INCOMPLETE"}')
    with pytest.raises(module.PromotionError, match="non-finite JSON constant"):
        module.strict_json(b'{"value":NaN}')
