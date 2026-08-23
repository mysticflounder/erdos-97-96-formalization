from __future__ import annotations

import copy
import importlib.util
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = (
    ROOT
    / "scripts/generate_exact17_four_point_two_circle_v8_two_kalmanson_refinements.py"
)
GENERATED_LEAN = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinements.lean"
)


def generator_module():
    name = "exact17_fourpoint_v8_twok_test"
    spec = importlib.util.spec_from_file_location(name, GENERATOR)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def real_ledger(module):
    return module.strict_json(module.LEDGER.read_bytes())


def resign_ledger(module, ledger):
    ledger["manifest_sha256"] = module.self_hash(ledger, "manifest_sha256")


def resign_candidate(module, candidate):
    candidate["candidate_id"] = module.candidate_id(candidate)
    candidate["record_sha256"] = module.self_hash(candidate, "record_sha256")


def test_authenticated_ledger_banks_eleven_occurrences_and_exact_clause_hashes():
    module = generator_module()
    ledger = module.load_authenticated_ledger()
    occurrences = module.validate_ledger(ledger)
    orbit = module.render_orbit_clauses(occurrences)
    suffix = module.strict_new_clauses(orbit)
    assert len(occurrences) == module.EXPECTED_OCCURRENCES == 11
    assert len(orbit) == len(set(orbit)) == module.EXPECTED_ORBIT_CLAUSES == 44
    assert len(suffix) == len(set(suffix)) == module.V8_SUFFIX_CLAUSES == 29
    assert module._canonical_sha256([list(clause) for clause in orbit]) == (
        module.EXPECTED_ORBIT_JSON_SHA256
    )
    assert module._canonical_sha256([list(clause) for clause in suffix]) == (
        module.EXPECTED_STRICT_NEW_JSON_SHA256
    )


def test_immediate_parent_novelty_and_current_model_cut_are_fail_closed():
    module = generator_module()
    occurrences = module.validate_ledger(real_ledger(module))
    novelty = module.verify_immediate_parent_novelty(occurrences)
    assert novelty.exact_duplicate_multiplicities == (0,) * 44
    assert novelty.strict_subsumer_multiplicities == (
        module.EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES
    )
    assert novelty.strict_new_indices == module.EXPECTED_STRICT_NEW_INDICES
    assert novelty.census_sha256 == module.EXPECTED_PARENT_NOVELTY_CENSUS_SHA256
    _novelty, falsified_orbit, falsified_suffix = module.compute_parent_facts(
        occurrences
    )
    assert falsified_orbit == tuple(range(0, 44, 4))
    assert falsified_suffix == tuple(range(0, 44, 4))


def test_rendered_lean_is_deterministic_and_has_source_coverage():
    module = generator_module()
    lean = module.render_lean(module.load_authenticated_ledger())
    assert GENERATED_LEAN.read_text(encoding="utf-8") == lean
    assert lean.count("def v8CancellationOccurrence") == 12
    assert "V7TwoKalmansonRefinements" in lean
    assert "v8CancellationOccurrences.length = 11" in lean
    assert "v8TwoKalmansonOrbitClauses.length = 44" in lean
    assert "v8TwoKalmansonRefinementClauses.length = 29" in lean
    assert "7409839" in lean
    assert "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8" in lean
    assert "sorry" not in lean


def test_production_indices_encode_expected_order_and_direction():
    module = generator_module()
    expressions = [
        module._occurrence_refinement_expression(index)
        for index in module.EXPECTED_STRICT_NEW_INDICES
    ]
    assert expressions[0].endswith("Occurrence0.hits 0 .forward")
    assert expressions[1].endswith("Occurrence0.hits 0 .reverse")
    assert expressions[-1].endswith("Occurrence10.hits 1 .reverse")
    assert len(expressions) == 29


def test_three_formalized_core_records_are_authenticated_but_emit_no_occurrences():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    occurrences = module.validate_ledger(ledger)
    assert len(occurrences) == 11
    ledger["candidates"][2]["lean_consumer"] = "Problem97.invalid"
    resign_candidate(module, ledger["candidates"][2])
    records = list(module.EXPECTED_CANDIDATE_RECORDS)
    records[2] = (
        ledger["candidates"][2]["candidate_id"],
        ledger["candidates"][2]["record_sha256"],
    )
    module.EXPECTED_CANDIDATE_RECORDS = tuple(records)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="formalized-core consumer drifted"):
        module.validate_ledger(ledger)


def test_authenticated_candidate_record_drift_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][3]["record_sha256"] = "0" * 64
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="authenticated identity drifted"):
        module.validate_ledger(ledger)


def test_path_certificate_drift_is_rejected_even_after_resigning():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = ledger["candidates"][3]
    candidate["payload"]["forward_path_support"] = []
    resign_candidate(module, candidate)
    records = list(module.EXPECTED_CANDIDATE_RECORDS)
    records[3] = (candidate["candidate_id"], candidate["record_sha256"])
    module.EXPECTED_CANDIDATE_RECORDS = tuple(records)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="forward support drifted"):
        module.validate_ledger(ledger)


def test_wrong_ledger_parent_and_model_paths_are_rejected(tmp_path: Path):
    module = generator_module()
    copied_ledger = tmp_path / "candidate-ledger.json"
    copied_ledger.write_bytes(module.LEDGER.read_bytes())
    with pytest.raises(module.PromotionError, match="ledger path drifted"):
        module.load_authenticated_ledger(copied_ledger)
    copied_lean = tmp_path / "V7.lean"
    copied_lean.write_bytes(module.V7_LEAN.read_bytes())
    with pytest.raises(module.PromotionError, match="parent path drifted"):
        module.verify_v7_parent_source(copied_lean)
    copied_model = tmp_path / "model.json"
    copied_model.write_bytes(module.MODEL.read_bytes())
    with pytest.raises(module.PromotionError, match="model path drifted"):
        module._load_authenticated_assignment(copied_model)


def test_ledger_header_and_dependency_inventory_are_pinned():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["scanner_dependencies"]["census/__init__.py"]["bytes"] += 1
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="dependency inventory drifted"):
        module.validate_ledger(ledger)


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
