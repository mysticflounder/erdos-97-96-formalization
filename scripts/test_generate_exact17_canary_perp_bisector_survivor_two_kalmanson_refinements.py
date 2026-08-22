from __future__ import annotations

import copy
import importlib.util
import json
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = (
    ROOT
    / "scripts"
    / "generate_exact17_canary_perp_bisector_survivor_two_kalmanson_refinements.py"
)


def generator_module():
    spec = importlib.util.spec_from_file_location(
        "exact17_canary_survivor_two_kalmanson_generator_test", GENERATOR
    )
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


def test_authenticated_ledger_replays_all_seventeen_and_renders_expected_root() -> None:
    module = generator_module()
    ledger = module.load_authenticated_ledger(module.LEDGER)
    occurrences = module.validate_ledger(ledger)
    assert len(occurrences) == module.EXPECTED_OCCURRENCES == 17
    assert module.EXPECTED_SUFFIX_CLAUSES == 68
    assert module.PARENT_ROOT_CLAUSES == 7_409_304
    assert module.EXPECTED_ROOT_CLAUSES == 7_409_372

    lean = module.render_lean(ledger)
    assert lean.count("  { hits := [") == 17
    assert "def twoKalmansonRefinementClauses" in lean
    assert "twoKalmansonRefinementClauses.length = 68" in lean
    assert (
        "canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf.length = 7409372" in lean
    )
    assert (
        "false_of_sourceRealization_of_"
        "canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_unsat" in lean
    )


def test_wrong_status_is_rejected_after_valid_self_hash() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["status"] = "INCOMPLETE"
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="status is not COMPLETE"):
        module.validate_ledger(ledger)


def test_wrong_consumer_is_rejected_after_valid_record_hashes() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = ledger["candidates"][0]
    candidate["lean_consumer"] = "Problem97.unreviewed"
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="Lean consumer drifted"):
        module.validate_ledger(ledger)


def test_candidate_record_hash_mutation_is_rejected() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][0]["record_sha256"] = "0" * 64
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="record self-hash drifted"):
        module.validate_ledger(ledger)


def test_support_core_mismatch_is_rejected() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = ledger["candidates"][0]
    candidate["support"][0] = [0, 1]
    candidate["support"] = sorted(candidate["support"], key=module.canonical_json_bytes)
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="support/core mismatch"):
        module.validate_ledger(ledger)


def test_pairing_flag_mutation_is_rejected() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = ledger["candidates"][0]
    candidate["payload"]["paired_forward_reverse_replay"] = False
    resign_candidate(module, candidate)
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="pairing is not certified"):
        module.validate_ledger(ledger)


def test_candidate_count_mutation_is_rejected() -> None:
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"].pop()
    ledger["candidates_examined"] = 16
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="expected exactly 17 candidates"):
        module.validate_ledger(ledger)


def test_strict_json_rejects_duplicate_keys_and_nan() -> None:
    module = generator_module()
    with pytest.raises(module.PromotionError, match="duplicate JSON key"):
        module.strict_json(b'{"status":"COMPLETE","status":"INCOMPLETE"}')
    with pytest.raises(module.PromotionError, match="non-finite JSON constant"):
        module.strict_json(b'{"value":NaN}')


def test_immutable_output_refuses_overwrite(tmp_path: Path) -> None:
    module = generator_module()
    output = tmp_path / "Generated.lean"
    module.write_text_once(output, "first\n")
    with pytest.raises(FileExistsError, match="immutable publication target exists"):
        module.write_text_once(output, "second\n")
    assert output.read_text(encoding="utf-8") == "first\n"


def test_unpinned_ledger_bytes_are_rejected(tmp_path: Path) -> None:
    module = generator_module()
    copied = tmp_path / "candidate-ledger.json"
    copied.write_text(json.dumps(real_ledger(module)), encoding="utf-8")
    with pytest.raises(module.PromotionError, match="path or byte hash drifted"):
        module.load_authenticated_ledger(copied)
