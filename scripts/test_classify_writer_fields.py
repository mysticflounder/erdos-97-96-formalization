"""Tests for the Tier-1 field-provenance classifier.

The six repository ground truths are pinned byte-exactly.  They are the reason
this tool exists: each one is a field an earlier audit read as a result.
"""

from __future__ import annotations

import ast
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import classify_writer_fields as mod

REPO = Path(__file__).resolve().parents[1]

GROUND_TRUTH = [
    (
        "census/card_head/exact12_next_row_arm_static_canary.py",
        "terminal_promotion_status",
        mod.LITERAL,
    ),
    (
        "census/card_head/exact12_next_row_arm_static_canary.py",
        "lean_terminal_ingress_ready",
        mod.LITERAL,
    ),
    ("scripts/endpoint-certificate.py", "python_exact_polynomial", mod.FLAG_ECHO),
    ("scripts/endpoint-certificate.py", "singular_lifted_column", mod.COMPUTED),
    (
        "census/card_head/exact12_all_order_common_five_membership_family_bank.py",
        "reused_requirement_count",
        mod.GUARDED,
    ),
    (
        "census/global_confinement/cap_selected_nogood_certificate_probe.py",
        "direct_row_equality_replay",
        mod.LITERAL,
    ),
]


@pytest.mark.parametrize(("module", "field", "expected"), GROUND_TRUTH)
def test_repository_ground_truth(module: str, field: str, expected: str) -> None:
    path = REPO / module
    if not path.exists():
        pytest.skip(f"{module} is absent from this checkout")
    record = mod.classify_module(path, module)
    assert record is not None
    entry = record["fields"].get(field)
    assert entry is not None, f"{module} does not write {field}"
    assert entry["aggregate"] == expected


def test_status_dispatch_is_not_a_guard() -> None:
    """Regression: a nested raise under `if x == CONST:` must not promote CONST.

    This is the one classification the first implementation got wrong, and it
    got it wrong in the worst direction -- a stamped status constant promoted
    into GUARDED, the trustworthy class.
    """
    source = (
        "STATUS = 'TERMINAL'\n"
        "def emit(status, proof):\n"
        "    if status == STATUS:\n"
        "        if proof is None:\n"
        "            raise ValueError('no proof')\n"
        "    return {'terminal_promotion_status': STATUS}\n"
    )
    facts = mod.ModuleFacts(ast.parse(source))
    assert "STATUS" not in facts.guarded_names


def test_length_check_against_a_constant_is_a_guard() -> None:
    source = (
        "EXPECTED = 583\n"
        "def emit(rows):\n"
        "    if len(rows) != EXPECTED:\n"
        "        raise ValueError('drift')\n"
        "    return {'count': EXPECTED}\n"
    )
    facts = mod.ModuleFacts(ast.parse(source))
    assert "EXPECTED" in facts.guarded_names


def _classify(source: str, field: str, tmp_path: Path) -> str:
    path = tmp_path / "w.py"
    path.write_text(source)
    record = mod.classify_module(path, "w.py")
    assert record is not None
    return record["fields"][field]["aggregate"]


def test_bare_constant_is_literal(tmp_path: Path) -> None:
    assert _classify("def f():\n    return {'a': True}\n", "a", tmp_path) == mod.LITERAL


def test_module_constant_is_literal(tmp_path: Path) -> None:
    assert (
        _classify("C = 'x'\ndef f():\n    return {'a': C}\n", "a", tmp_path)
        == mod.LITERAL
    )


def test_rebound_module_name_is_not_a_constant(tmp_path: Path) -> None:
    source = "C = 'x'\nC = 'y'\ndef f():\n    return {'a': C}\n"
    assert _classify(source, "a", tmp_path) == mod.UNKNOWN


def test_argparse_attribute_is_flag_echo(tmp_path: Path) -> None:
    source = "def f(args):\n    return {'a': args.no_check}\n"
    assert _classify(source, "a", tmp_path) == mod.FLAG_ECHO


def test_one_hop_parameter_from_argparse_is_flag_echo(tmp_path: Path) -> None:
    source = (
        "def build(flag):\n"
        "    return {'a': flag}\n"
        "def main(args):\n"
        "    return build(flag=not args.no_check)\n"
    )
    assert _classify(source, "a", tmp_path) == mod.FLAG_ECHO


def test_call_is_computed(tmp_path: Path) -> None:
    assert (
        _classify("def f(x):\n    return {'a': len(x)}\n", "a", tmp_path)
        == mod.COMPUTED
    )


def test_unresolved_name_is_unknown_not_computed(tmp_path: Path) -> None:
    source = "def f():\n    return {'a': mystery}\n"
    assert _classify(source, "a", tmp_path) == mod.UNKNOWN


def test_loop_bound_name_is_unknown(tmp_path: Path) -> None:
    source = "def f(rows):\n    out = []\n    for r in rows:\n        out.append({'a': r})\n    return out\n"
    assert _classify(source, "a", tmp_path) == mod.UNKNOWN


def test_aggregate_takes_the_least_trustworthy_class(tmp_path: Path) -> None:
    source = (
        "def f(x):\n    if x:\n        return {'a': len(x)}\n    return {'a': True}\n"
    )
    assert _classify(source, "a", tmp_path) == mod.LITERAL


def test_known_non_results_are_flagged(tmp_path: Path) -> None:
    source = "def f():\n    return {'semantic_status': 'PROVED_FAMILY'}\n"
    path = tmp_path / "w.py"
    path.write_text(source)
    record = mod.classify_module(path, "w.py")
    assert record["fields"]["semantic_status"]["known_non_result"] is True


def test_claims_vector_is_captured(tmp_path: Path) -> None:
    source = (
        "_FALSE_CLAIMS = ('source_entitlement', 'theorem_coverage')\n"
        "def f():\n    return {'a': 1}\n"
    )
    path = tmp_path / "w.py"
    path.write_text(source)
    record = mod.classify_module(path, "w.py")
    assert record["claims_vectors"] == {
        "_FALSE_CLAIMS": ["source_entitlement", "theorem_coverage"]
    }


def test_excluded_paths_match_the_corrected_set() -> None:
    assert mod.is_excluded("scratch/a-e6e12303-source/scripts/x.py")
    assert not mod.is_excluded("census/card_head/x.py")


def test_pre_registered_non_result_cannot_be_promoted(tmp_path: Path) -> None:
    """A circular guard must not promote a stamped status constant.

    `record["terminal_promotion_status"] != CONST` is a raise-guarded
    comparison with a computed side, so the AST verdict is GUARDED -- but the
    field it reads was stamped with that same constant, so the check is
    circular.  The pre-registration overrides the AST verdict.
    """
    source = (
        "CONST = 'TERMINAL'\n"
        "def check(record):\n"
        "    if record['terminal_promotion_status'] != CONST:\n"
        "        raise ValueError('drift')\n"
        "def emit():\n"
        "    return {'terminal_promotion_status': CONST}\n"
    )
    path = tmp_path / "w.py"
    path.write_text(source)
    record = mod.classify_module(path, "w.py")
    entry = record["fields"]["terminal_promotion_status"]
    assert entry["raw_aggregate"] == mod.GUARDED
    assert entry["aggregate"] == mod.UNKNOWN
    assert entry["trust_capped"] is True


def test_ordinary_field_is_not_trust_capped(tmp_path: Path) -> None:
    source = (
        "EXPECTED = 5\n"
        "def emit(rows):\n"
        "    if len(rows) != EXPECTED:\n"
        "        raise ValueError('drift')\n"
        "    return {'count': EXPECTED}\n"
    )
    path = tmp_path / "w.py"
    path.write_text(source)
    entry = mod.classify_module(path, "w.py")["fields"]["count"]
    assert entry["aggregate"] == mod.GUARDED
    assert entry["trust_capped"] is False
