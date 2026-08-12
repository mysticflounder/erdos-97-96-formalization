from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

from census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    build_apex_first_surplus_second_common_five_membership_family_bank,
    install_apex_first_surplus_second_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_BANK_SHA256,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENTS,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_second_apex_surplus_second_first_common_five_membership_family_bank_live_sources,
    build_second_apex_surplus_second_first_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_second_apex_surplus_second_first_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_second_apex_surplus_second_first_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    _parent as _v17_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.lean"
)


def _lean_mk_definition_bindings(path: Path) -> tuple[tuple[int, int, tuple[int, ...]], ...]:
    declaration_pattern = re.compile(
        r"^\s*def\s+definition[0-9_]+\s*:=\s*mkDefinition\s+"
        r"(?P<variable>[0-9]+)\s+(?P<center>[0-9]+)\s*"
        r"\{(?P<support>[0-9, \t]*)\}\s*$",
        re.MULTILINE,
    )
    declarations = tuple(declaration_pattern.finditer(path.read_text(encoding="utf-8")))
    assert len(declarations) == len(EXPECTED_FRESH_PATTERN_VARIABLES)
    return tuple(
        (
            int(declaration.group("variable")),
            int(declaration.group("center")),
            tuple(
                sorted(
                    int(label)
                    for label in declaration.group("support").split(",")
                    if label.strip()
                )
            ),
        )
        for declaration in declarations
    )


def _lean_blocking_clauses(path: Path) -> tuple[tuple[int, ...], ...]:
    source = path.read_text(encoding="utf-8")
    theorem = re.search(
        r"theorem\s+blockingClauses_eq\s*:\s*blockingClauses\s*=\s*"
        r"(?P<body>.*?)\s*:=\s*by",
        source,
        re.DOTALL,
    )
    assert theorem is not None
    return tuple(
        tuple(int(literal.strip()) for literal in clause.split(","))
        for clause in re.findall(
            r"\[([+-]?\d+(?:\s*,\s*[+-]?\d+)*)\]", theorem.group("body")
        )
    )


def _parent():
    instance, layout, v17_parent = _v17_parent()
    v17_bank = build_apex_first_surplus_second_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v17_parent, cell_index=6
    )
    install_apex_first_surplus_second_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v17_parent, cell_index=6
    )
    return instance, layout, v17_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_second_apex_surplus_second_first_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_payload(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_second_apex_surplus_second_first_"
        "common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == "second-apex-surplus-second-first-common-five-b345-c6789-y1011.v1"
    assert family_roles() == tuple(
        (b, c, y)
        for b in (3, 4, 5)
        for c in (6, 7, 8, 9)
        for y in (10, 11)
    )
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT == 24
    assert _sha256_json(
        [{"b": b, "c": c, "y": y} for b, c, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256
    assert family_patterns()[0] == (
        {"center": 0, "support": [2, 3]},
        {"center": 10, "support": [2, 3]},
        {"center": 6, "support": [0, 3, 10]},
    )
    compiled = bank["compiled"]
    assert tuple(
        (item["center"], tuple(item["required"]))
        for item in compiled["pattern_definitions"]
    ) == EXPECTED_FRESH_REQUIREMENTS
    assert tuple(
        item["pattern_variable"] for item in compiled["pattern_definitions"]
    ) == EXPECTED_FRESH_PATTERN_VARIABLES
    assert len(
        {
            (item["center"], tuple(item["required"]))
            for pattern in compiled["pattern_keys"]
            for item in pattern
        }
    ) == EXPECTED_LOGICAL_REQUIREMENT_COUNT
    assert compiled["initial_n_variables"] == 45_277
    assert compiled["initial_n_clauses"] == 643_379
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 45_307
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 643_805
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256
    assert bank["reused_requirement_count"] == 3
    assert bank["compiled"]["pattern_definitions"][0]["pattern_variable"] == 45_278
    validate_second_apex_surplus_second_first_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, bank, cell_index=6
    )


def test_committed_lean_cnf_bindings_match_python_expectations() -> None:
    expected_bindings = tuple(
        (variable, center, tuple(support))
        for (center, support), variable in zip(
            EXPECTED_FRESH_REQUIREMENTS,
            EXPECTED_FRESH_PATTERN_VARIABLES,
            strict=True,
        )
    )
    assert tuple(sorted(_lean_mk_definition_bindings(REPO_ROOT / CNF_PATH))) == tuple(
        sorted(expected_bindings)
    )


def test_committed_lean_blocking_clause_order_matches_python(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    expected_clauses = tuple(
        tuple(entry["blocking_clause"]) for entry in bank["compiled"]["entries"]
    )
    assert _lean_blocking_clauses(REPO_ROOT / CNF_PATH) == expected_clauses


def test_source_manifest_covers_v18_roots(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert CERTIFICATE_PATH in manifest_paths
    assert CNF_PATH in manifest_paths
    attest_second_apex_surplus_second_first_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )


def test_tampering_fails_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["c"] = 7
    with pytest.raises(
        Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_second_apex_surplus_second_first_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )


def test_install_appends_family_once() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_second_apex_surplus_second_first_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert instance.cnf.n_variables == EXPECTED_FINAL_VARIABLES
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_second_apex_surplus_second_first_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=6
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError,
        match="no production second-apex/surplus/second/first family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
