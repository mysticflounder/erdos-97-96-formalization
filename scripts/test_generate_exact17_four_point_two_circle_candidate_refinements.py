from __future__ import annotations

import copy
import importlib.util
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "generate_exact17_four_point_two_circle_candidate_refinements.py"
)


def generator_module():
    spec = importlib.util.spec_from_file_location(
        "exact17_fourpoint_source_adapter", SCRIPT
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def real_ledger(module):
    return module.strict_json(module.LEDGER.read_bytes())


def resign_candidate(module, candidate):
    candidate["candidate_id"] = module.candidate_id(candidate)
    candidate["record_sha256"] = module.self_hash(candidate, "record_sha256")


def resign_ledger(module, ledger):
    ledger["manifest_sha256"] = module.self_hash(ledger, "manifest_sha256")


def full_support(module, ledger):
    rows = ledger["decoded_selectors"]["rows"]
    return sorted(
        [[center, point] for center in range(module.N) for point in rows[str(center)]],
        key=module.canonical_json_bytes,
    )


def test_authenticated_v3_ledger_reduces_to_exact_source_supports():
    module = generator_module()
    ledger = module.load_authenticated_ledger()
    candidate_a, candidate_b = module.validate_ledger(ledger)
    assert candidate_a.physical_core == (10, 8, 9, 6)
    assert candidate_a.canonical_core == (4, 2, 5, 1)
    assert candidate_a.hits == module.EXPECTED_SPECS["candidateA"]["hits"]
    assert len(candidate_a.hits) == 10
    assert candidate_b.physical_core == (5, 1, 10, 6)
    assert candidate_b.canonical_core == (13, 14, 4, 1)
    assert candidate_b.hits == module.EXPECTED_SPECS["candidateB"]["hits"]
    assert len(candidate_b.hits) == 9
    assert module.EXPECTED_SUFFIX_CLAUSES == 4
    assert module.EXPECTED_ROOT_CLAUSES == 7_409_516


def test_every_replayed_row_step_is_covered_by_reduced_hits():
    module = generator_module()
    for candidate in module.validate_ledger(real_ledger(module)):
        hits = set(candidate.hits)
        for path in (candidate.qu_path, candidate.uv_path):
            for step in path:
                if step.kind == "row":
                    assert (step.center, step.first) in hits
                    assert (step.center, step.second) in hits
        choice_hits = {
            (center, point)
            for center, support in candidate.choices
            for point in support
        }
        assert choice_hits == hits


def test_checked_in_lean_is_exact_generator_output():
    module = generator_module()
    rendered = module.render_lean(real_ledger(module))
    assert module.LEAN_OUTPUT.read_text(encoding="utf-8") == rendered
    assert module.sha256_bytes(rendered.encode()) == module.EXPECTED_LEAN_SHA256
    assert rendered.count("occurrenceClauses candidate") >= 2
    assert "fourPointTwoCircleRefinementClauses.length = 4" in rendered
    assert (
        "def fourPointTwoCircleRefinementClauses : Std.Sat.CNF Atom :=\n"
        "  candidateBClauses"
    ) in rendered
    assert "candidateAClauses ++ candidateBClauses" not in rendered
    assert "fourPointTwoCircleRefinementClauses_nodup" in rendered
    assert "candidateAClauses_already_in_v2" in rendered
    assert "candidateBClauses_disjoint_v2" in rendered
    assert "=\n      7409516" in rendered


def test_wrong_ledger_path_and_raw_hash_are_rejected(tmp_path: Path):
    module = generator_module()
    wrong = tmp_path / "candidate-ledger.json"
    wrong.write_bytes(module.LEDGER.read_bytes())
    with pytest.raises(module.PromotionError, match="path drifted"):
        module.load_authenticated_ledger(wrong)
    original = module.LEDGER_SHA256
    module.LEDGER_SHA256 = "0" * 64
    try:
        with pytest.raises(module.PromotionError, match="hash drifted"):
            module.load_authenticated_ledger()
    finally:
        module.LEDGER_SHA256 = original


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("schema", "wrong", "schema/status/count drifted"),
        ("status", "INCOMPLETE", "schema/status/count drifted"),
        ("candidates_examined", 36, "schema/status/count drifted"),
    ],
)
def test_ledger_schema_status_and_counts_are_fail_closed(field, value, message):
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger[field] = value
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match=message):
        module.validate_ledger(ledger)


def test_family_inventory_mutation_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["family_inventory"]["family_candidate_counts"][module.FAMILY] = 1
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="family inventory drifted"):
        module.validate_ledger(ledger)


def test_core_consumer_mutation_is_rejected_even_when_resigned():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["lean_consumer"] = "Problem97.unreviewed"
    candidate["payload"]["canonical_bank_record"]["lean_consumer"] = (
        "Problem97.unreviewed"
    )
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="consumer drifted"):
        module.validate_ledger(ledger)


def test_core_and_orientation_mutations_are_rejected():
    module = generator_module()
    for mutation, message in (
        ("core", "unexpected formalized core"),
        ("orientation", "orientation drifted"),
    ):
        ledger = copy.deepcopy(real_ledger(module))
        candidate = next(
            c for c in ledger["candidates"] if c["family"] == module.FAMILY
        )
        record = candidate["payload"]["canonical_bank_record"]
        if mutation == "core":
            record["core"]["Q"] = 11
        else:
            record["orientation"] = "reverse"
        resign_candidate(module, candidate)
        resign_ledger(module, ledger)
        with pytest.raises(module.PromotionError, match=message):
            module.validate_ledger(ledger)


def test_full_support_mutation_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = next(c for c in ledger["candidates"] if c["family"] == module.FAMILY)
    candidate["support"] = candidate["support"][1:]
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="full support drifted"):
        module.validate_ledger(ledger)


def test_authenticated_row_mutation_changes_the_deterministic_path():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["decoded_selectors"]["rows"]["10"] = [2, 5, 8, 9]
    support = full_support(module, ledger)
    for candidate in ledger["candidates"]:
        if candidate["family"] == module.FAMILY:
            candidate["support"] = copy.deepcopy(support)
            resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(
        module.PromotionError, match="equality path drifted|unreachable"
    ):
        module.validate_ledger(ledger)


def test_extra_candidate_key_and_bad_record_hash_are_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = ledger["candidates"][0]
    candidate["extra"] = True
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match=r"candidate\[0\] schema drifted"):
        module.validate_ledger(ledger)
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][0]["record_sha256"] = "0" * 64
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="candidate record hash drifted"):
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
