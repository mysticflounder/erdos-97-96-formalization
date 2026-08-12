from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

import census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_BANK_SHA256,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENTS,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_PATTERN_VARIABLES,
    EXPECTED_REUSED_REQUIREMENTS,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources,
    build_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    _parent as _v21_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyCnf.lean"
)

_LEAN_DEFINITION_RE = re.compile(
    r"^\s*def\s+\S+\s*:=\s*mkDefinition\s+"
    r"(?P<variable>[0-9]+)\s+(?P<center>[0-9]+)\s*"
    r"\{(?P<support>[0-9, \t]*)\}\s*$",
    re.MULTILINE,
)


def _lean_mk_definition_bindings(path: Path) -> dict[int, tuple[int, tuple[int, ...]]]:
    bindings: dict[int, tuple[int, tuple[int, ...]]] = {}
    for declaration in _LEAN_DEFINITION_RE.finditer(path.read_text(encoding="utf-8")):
        variable = int(declaration.group("variable"))
        assert variable not in bindings
        support = tuple(
            sorted(
                int(label)
                for label in declaration.group("support").split(",")
                if label.strip()
            )
        )
        bindings[variable] = (int(declaration.group("center")), support)
    return bindings


def _lean_clauses(path: Path, theorem: str, arity: int) -> tuple[tuple[int, ...], ...]:
    source = path.read_text(encoding="utf-8")
    body = source.split(f"theorem {theorem} :", 1)[1].split(":= by", 1)[0]
    pattern = r"\[(?P<clause>" + r"\s*,\s*".join([r"-?\d+"] * arity) + r")\]"
    return tuple(
        tuple(int(literal) for literal in match.group("clause").split(","))
        for match in re.finditer(pattern, body)
    )


def _parent():
    instance, layout, v20_parent = _v21_parent()
    parent = install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v20_parent, cell_index=6
    )
    return instance, layout, parent


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_payload(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    assert BANK_SCHEMA.endswith("common_five_membership_family_bank.v1")
    assert FAMILY_ID.endswith("a6789-b345-c6789.v1")
    assert family_roles() == tuple(
        (a, b, c) for a in (6, 7, 8, 9) for b in (3, 4, 5) for c in (6, 7, 8, 9)
    )
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT == 48
    assert (
        _sha256_json([{"a": a, "b": b, "c": c} for a, b, c in family_roles()])
        == EXPECTED_ROLES_SHA256
    )
    assert family_patterns()[0] == (
        {"center": 10, "support": [6, 3]},
        {"center": 11, "support": [6, 3]},
        {"center": 6, "support": [3, 10]},
        {"center": 6, "support": [3, 11]},
    )
    assert family_patterns()[-1] == (
        {"center": 10, "support": [9, 5]},
        {"center": 11, "support": [9, 5]},
        {"center": 9, "support": [5, 10]},
        {"center": 9, "support": [5, 11]},
    )
    compiled = bank["compiled"]
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
    assert EXPECTED_DEFINITION_COUNT == EXPECTED_LOGICAL_REQUIREMENT_COUNT == 36
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert len(compiled["delta_clauses"]) == 144
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }


def test_python_bindings_implications_and_blocks_match_lean(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    definitions = bank["compiled"]["pattern_definitions"]
    fresh_python = {
        item["pattern_variable"]: (item["center"], tuple(item["required"]))
        for item in definitions
        if not item["reused"]
    }
    reused_python = {
        item["pattern_variable"]: (item["center"], tuple(item["required"]))
        for item in definitions
        if item["reused"]
    }
    assert tuple(fresh_python) == EXPECTED_FRESH_PATTERN_VARIABLES
    assert tuple(fresh_python.values()) == EXPECTED_FRESH_REQUIREMENTS
    assert tuple(reused_python) == EXPECTED_REUSED_PATTERN_VARIABLES
    assert tuple(reused_python.values()) == EXPECTED_REUSED_REQUIREMENTS
    assert _lean_mk_definition_bindings(REPO_ROOT / CNF_PATH) == fresh_python
    python_implications = tuple(
        tuple(clause)
        for definition in definitions
        if not definition["reused"]
        for clause in definition["implication_clauses"]
    )
    assert len(python_implications) == 96
    assert _lean_clauses(REPO_ROOT / CNF_PATH, "implicationDimacs_eq", 2) == (
        python_implications
    )
    assert _lean_clauses(REPO_ROOT / CNF_PATH, "blockingClauses_eq", 3) == tuple(
        tuple(entry["blocking_clause"]) for entry in bank["compiled"]["entries"]
    )


def test_source_manifest_and_tampering_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["c"] = 7
    with pytest.raises(
        Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_reuse_selection_and_rollback(bank_and_parent, monkeypatch) -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="no production first-opposite-pair family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)

    _bank, instance, layout, parent = bank_and_parent
    install_instance = copy.deepcopy(instance)
    inherited_keys = tuple(
        (center, frozenset(required))
        for center, required in EXPECTED_REUSED_REQUIREMENTS
    )
    inherited_before = {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    }
    install_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, install_instance, layout, parent, cell_index=6
    )
    assert {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    } == inherited_before
    assert (
        tuple(
            install_instance.pattern_variables[(center, frozenset(required))]
            for center, required in EXPECTED_FRESH_REQUIREMENTS
        )
        == EXPECTED_FRESH_PATTERN_VARIABLES
    )

    failed_instance = copy.deepcopy(instance)
    initial_variables = failed_instance.cnf.n_variables
    initial_clauses = tuple(failed_instance.cnf.clauses)
    initial_patterns = dict(failed_instance.pattern_variables)
    original_compile = family_bank_module._compile

    def compile_with_drift(target):
        compiled = original_compile(target)
        if target is failed_instance:
            compiled = copy.deepcopy(compiled)
            compiled["final_n_clauses"] += 1
        return compiled

    monkeypatch.setattr(family_bank_module, "_compile", compile_with_drift)
    with pytest.raises(
        Exact12FirstOppositePairSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="installed common-five family differs",
    ):
        install_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, failed_instance, layout, parent, cell_index=6
        )
    assert failed_instance.cnf.n_variables == initial_variables
    assert tuple(failed_instance.cnf.clauses) == initial_clauses
    assert failed_instance.pattern_variables == initial_patterns
