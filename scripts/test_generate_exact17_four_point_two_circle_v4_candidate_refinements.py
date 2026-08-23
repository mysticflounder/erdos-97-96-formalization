# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import importlib.util
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "generate_exact17_four_point_two_circle_v4_candidate_refinements.py"
)


def generator_module():
    spec = importlib.util.spec_from_file_location(
        "exact17_fourpoint_v4_adapter", SCRIPT
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


def target_candidate(module, ledger, tag):
    target_id = module.EXPECTED_SPECS[tag]["candidate_id"]
    return next(
        candidate
        for candidate in ledger["candidates"]
        if candidate["candidate_id"] == target_id
    )


def test_authenticated_v4_ledger_reduces_to_exact_source_supports():
    module = generator_module()
    forward, reverse = module.validate_ledger(module.load_authenticated_ledger())
    assert forward.physical_core == (12, 8, 5, 14)
    assert forward.canonical_core == (6, 2, 13, 16)
    assert forward.hits == module.EXPECTED_SPECS["candidateForward"]["hits"]
    assert len(forward.hits) == 12
    assert reverse.physical_core == (7, 2, 11, 4)
    assert reverse.canonical_core == (7, 8, 3, 12)
    assert reverse.hits == module.EXPECTED_SPECS["candidateReverse"]["hits"]
    assert len(reverse.hits) == 8
    assert module.EXPECTED_SUFFIX_CLAUSES == 8
    assert module.EXPECTED_ROOT_CLAUSES == 7_409_524


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
    assert module.LEAN_OUTPUT.read_text() == rendered
    assert module.sha256_bytes(rendered.encode()) == module.EXPECTED_LEAN_SHA256
    assert rendered.count("occurrenceClauses candidate") >= 2
    assert "fourPointTwoCircleV4CoreRefinementClauses.length = 8" in rendered
    assert "candidateForwardClauses ++ candidateReverseClauses" in rendered
    assert "fourPointTwoCircleV4CoreRefinementClauses_nodup" in rendered
    assert "7409524" in rendered


def test_authenticated_parent_novelty_is_exact_pinned_census():
    module = generator_module()
    candidates = module.validate_ledger(module.load_authenticated_ledger())
    suffix = module.render_dimacs_suffix(candidates)
    assert len(suffix) == 8
    assert len(set(suffix)) == 8
    novelty = module.verify_authenticated_parent_novelty(candidates)
    assert novelty.exact_duplicate_multiplicities == (0,) * 8
    assert novelty.strict_subsumer_multiplicities == (0, 1, 0, 1, 0, 1, 0, 1)
    assert novelty.strict_new == (True, False, True, False) * 2
    assert tuple(sum(novelty.strict_new[index : index + 4]) for index in (0, 4)) == (
        2,
        2,
    )
    assert module.PARENT_BASELINE_CNF.stat().st_size == 346_288_246
    assert (
        module.PARENT_BASELINE_CNF_SHA256
        == "24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f"
    )


def test_streaming_parent_novelty_counts_exact_and_strict_subsumers(tmp_path: Path):
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    raw = b"p cnf 6 4\n-1 -2 -3 0\n-1 -2 0\n-4 0\n6 0\n"
    parent.write_bytes(raw)
    novelty = module.classify_parent_novelty(
        parent,
        ((-1, -2, -3), (-4, -5)),
        expected_sha256=module.sha256_bytes(raw),
        expected_bytes=len(raw),
        expected_num_variables=6,
        expected_num_clauses=4,
    )
    assert novelty.exact_duplicate_multiplicities == (1, 0)
    assert novelty.strict_subsumer_multiplicities == (1, 1)
    assert novelty.strict_new == (False, False)


@pytest.mark.parametrize(
    ("raw", "expected_bytes_delta", "expected_hash", "message"),
    [
        (b"p cnf 6 1\n-1 0\n", 1, None, "byte length drifted"),
        (b"p cnf 5 1\n-1 0\n", 0, None, "header drifted"),
        (b"p cnf 6 1\n-7 0\n", 0, None, "out of range"),
        (b"p cnf 6 1\n-1 0\n", 0, "0" * 64, "byte hash drifted"),
    ],
)
def test_streaming_parent_novelty_fails_closed(
    tmp_path: Path,
    raw: bytes,
    expected_bytes_delta: int,
    expected_hash: str | None,
    message: str,
):
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(raw)
    with pytest.raises(module.PromotionError, match=message):
        module.classify_parent_novelty(
            parent,
            ((-1, -2),),
            expected_sha256=expected_hash or module.sha256_bytes(raw),
            expected_bytes=len(raw) + expected_bytes_delta,
            expected_num_variables=6,
            expected_num_clauses=1,
        )


def test_wrong_ledger_path_and_raw_hash_are_rejected(tmp_path: Path):
    module = generator_module()
    wrong = tmp_path / "candidate-ledger.json"
    wrong.write_bytes(module.LEDGER.read_bytes())
    with pytest.raises(module.PromotionError, match="path drifted"):
        module.load_authenticated_ledger(wrong)
    original_hash = module.LEDGER_SHA256
    module.LEDGER_SHA256 = "0" * 64
    try:
        with pytest.raises(module.PromotionError, match="hash drifted"):
            module.load_authenticated_ledger()
    finally:
        module.LEDGER_SHA256 = original_hash


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("status", "INCOMPLETE", "schema/status/count drifted"),
        ("scan_complete", False, "schema/status/count drifted"),
        ("source_valid_only", False, "schema/status/count drifted"),
        ("complete_no_candidates", True, "schema/status/count drifted"),
        ("candidates_examined", 62, "schema/status/count drifted"),
    ],
)
def test_status_mutations_are_rejected(field, value, message):
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger[field] = value
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match=message):
        module.validate_ledger(ledger)


def test_family_inventory_mutation_is_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["family_inventory"]["family_candidate_counts"][module.FAMILY] = 3
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="family inventory drifted"):
        module.validate_ledger(ledger)


@pytest.mark.parametrize(
    ("tag", "mutation", "message"),
    [
        ("candidateForward", "consumer", "consumer drifted"),
        ("candidateForward", "core", "physical core drifted"),
        ("candidateReverse", "orientation", "orientation drifted"),
        ("candidateReverse", "support", "full support drifted"),
    ],
)
def test_target_candidate_mutations_are_rejected(tag, mutation, message):
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    candidate = target_candidate(module, ledger, tag)
    record = candidate["payload"]["canonical_bank_record"]
    if mutation == "consumer":
        candidate["lean_consumer"] = "Problem97.unreviewed"
        record["lean_consumer"] = "Problem97.unreviewed"
    elif mutation == "core":
        record["core"]["Q"] = 11
    elif mutation == "orientation":
        record["orientation"] = "forward"
    else:
        candidate["support"] = candidate["support"][1:]
    old_id = candidate["candidate_id"]
    resign_candidate(module, candidate)
    module.EXPECTED_SPECS[tag]["candidate_id"] = candidate["candidate_id"]
    module.EXPECTED_SPECS[tag]["record_sha256"] = candidate["record_sha256"]
    try:
        resign_ledger(module, ledger)
        with pytest.raises(module.PromotionError, match=message):
            module.validate_ledger(ledger)
    finally:
        module.EXPECTED_SPECS[tag]["candidate_id"] = old_id


def test_authenticated_row_mutation_changes_the_deterministic_path():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["decoded_selectors"]["rows"]["5"] = [0, 4, 10, 15]
    support = full_support(module, ledger)
    changed_ids = {}
    for tag in module.EXPECTED_SPECS:
        candidate = target_candidate(module, ledger, tag)
        candidate["support"] = copy.deepcopy(support)
        old_id = candidate["candidate_id"]
        resign_candidate(module, candidate)
        changed_ids[tag] = old_id
        module.EXPECTED_SPECS[tag]["candidate_id"] = candidate["candidate_id"]
        module.EXPECTED_SPECS[tag]["record_sha256"] = candidate["record_sha256"]
    try:
        resign_ledger(module, ledger)
        with pytest.raises(
            module.PromotionError, match="equality path drifted|unreachable"
        ):
            module.validate_ledger(ledger)
    finally:
        for tag, old_id in changed_ids.items():
            module.EXPECTED_SPECS[tag]["candidate_id"] = old_id


def test_extra_candidate_key_bad_hash_and_identity_are_rejected():
    module = generator_module()
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][0]["extra"] = True
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match=r"candidate\[0\] schema drifted"):
        module.validate_ledger(ledger)
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][0]["record_sha256"] = "0" * 64
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="candidate record hash drifted"):
        module.validate_ledger(ledger)
    ledger = copy.deepcopy(real_ledger(module))
    ledger["candidates"][0]["candidate_id"] = "formalized-core-bank:" + "0" * 64
    ledger["candidates"][0]["record_sha256"] = module.self_hash(
        ledger["candidates"][0], "record_sha256"
    )
    resign_ledger(module, ledger)
    with pytest.raises(module.PromotionError, match="candidate id drifted"):
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
    assert output.read_text() == "first\n"
