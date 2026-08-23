# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "generate_exact17_four_point_two_circle_v4_combined_refinements.py"
)


def generator_module():
    spec = importlib.util.spec_from_file_location("exact17_v4_combined_adapter", SCRIPT)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def test_authenticated_inputs_have_exact_cross_family_census():
    module = generator_module()
    inputs = module.load_authenticated_inputs()
    assert len(inputs.two_k_suffix) == 236
    assert len(inputs.other_core_suffix) == 8
    assert len(inputs.fourpoint_core_suffix) == 8
    assert len(inputs.production_suffix) == 244
    assert len(set(inputs.production_suffix)) == 244
    assert set(inputs.fourpoint_core_suffix) <= set(inputs.two_k_suffix)
    assert set(inputs.fourpoint_core_suffix).isdisjoint(inputs.other_core_suffix)
    assert set(inputs.two_k_suffix).isdisjoint(inputs.other_core_suffix)
    assert module.EXPECTED_CROSS_FAMILY_INTERSECTIONS == {
        "fourpoint_core_and_two_k": 8,
        "fourpoint_core_and_other_core": 0,
        "two_k_and_other_core": 0,
    }


def test_authenticated_parent_prefix_has_exact_pinned_novelty_census():
    module = generator_module()
    novelty = module.verify_authenticated_parent_novelty(
        module.load_authenticated_inputs()
    )
    assert novelty.exact_duplicate_clause_count == 0
    assert novelty.strictly_subsumed_clause_count == 61
    assert novelty.strict_new_clause_count == 183
    assert (
        novelty.census_sha256
        == "4c523553875cf0da883c052e4d286eb24a8448cf2da18fc83e3c94ffcb228997"
    )
    assert module.PARENT_BASELINE_CNF.stat().st_size == 346_288_246
    assert module.PARENT_ROOT_CLAUSES == 7_409_516
    assert module.PARENT_BASELINE_TOTAL_CLAUSES == 7_409_522


def test_streaming_novelty_excludes_the_physical_none_tail(tmp_path: Path):
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    raw = b"p cnf 5 4\n-1 0\n5 0\n-3 -4 0\n-3 0\n"
    parent.write_bytes(raw)
    novelty = module.classify_parent_prefix_novelty(
        parent,
        ((-1, -2), (-3, -4)),
        expected_sha256=module.sha256_bytes(raw),
        expected_bytes=len(raw),
        expected_num_variables=5,
        expected_total_clauses=4,
        parent_prefix_clauses=2,
    )
    assert novelty.exact_duplicate_multiplicities == (0, 0)
    assert novelty.strict_subsumer_multiplicities == (1, 0)
    assert novelty.strict_new_clause_count == 1


@pytest.mark.parametrize(
    ("raw", "byte_delta", "expected_hash", "message"),
    [
        (b"p cnf 5 1\n-1 0\n", 1, None, "byte length drifted"),
        (b"p cnf 4 1\n-1 0\n", 0, None, "header drifted"),
        (b"p cnf 5 1\n-6 0\n", 0, None, "out of range"),
        (b"p cnf 5 1\n-1 0\n", 0, "0" * 64, "byte hash drifted"),
    ],
)
def test_streaming_novelty_fails_closed(
    tmp_path: Path,
    raw: bytes,
    byte_delta: int,
    expected_hash: str | None,
    message: str,
):
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(raw)
    with pytest.raises(module.PromotionError, match=message):
        module.classify_parent_prefix_novelty(
            parent,
            ((-1, -2),),
            expected_sha256=expected_hash or module.sha256_bytes(raw),
            expected_bytes=len(raw) + byte_delta,
            expected_num_variables=5,
            expected_total_clauses=1,
            parent_prefix_clauses=1,
        )


def test_dependency_hash_and_ledger_path_drift_fail_closed(tmp_path: Path):
    module = generator_module()
    dependency = module.TWO_K_LEAN
    original_hash = module.EXPECTED_DEPENDENCY_SHA256[dependency]
    module.EXPECTED_DEPENDENCY_SHA256[dependency] = "0" * 64
    try:
        with pytest.raises(module.PromotionError, match="dependency hash drifted"):
            module.authenticate_dependencies()
    finally:
        module.EXPECTED_DEPENDENCY_SHA256[dependency] = original_hash
    wrong_ledger = tmp_path / "candidate-ledger.json"
    wrong_ledger.write_bytes(module.LEDGER.read_bytes())
    with pytest.raises(module.PromotionError, match="ledger path drifted"):
        module.load_authenticated_inputs(wrong_ledger)


def test_checked_in_lean_is_exact_generator_output():
    module = generator_module()
    inputs = module.load_authenticated_inputs()
    rendered = module.render_lean(inputs)
    assert module.LEAN_OUTPUT.read_text() == rendered
    assert module.sha256_bytes(rendered.encode()) == module.EXPECTED_LEAN_SHA256
    assert "fourPointTwoCircleV4CombinedRefinementClauses.length = 244" in rendered
    assert "fourPointTwoCircleV4CoreRefinementClauses_subset_combined" in rendered
    assert "7409760" in rendered
    assert rendered.count("import Erdos9796Proof.P97.ATail.") == 3


def test_immutable_output_refuses_overwrite(tmp_path: Path):
    module = generator_module()
    output = tmp_path / "Generated.lean"
    module.write_text_once(output, "first\n")
    with pytest.raises(FileExistsError, match="immutable publication target exists"):
        module.write_text_once(output, "second\n")
    assert output.read_text() == "first\n"
