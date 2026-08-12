from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_static_cegar import (
    materialize_positive_membership_static_cell,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)
from census.card_head.exact12_surplus_three_triad_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    FAMILY_ID,
    Exact12SurplusThreeTriadMembershipFamilyBankError,
    attest_surplus_three_triad_membership_family_bank_live_sources,
    build_surplus_three_triad_membership_family_bank,
    family_patterns,
    family_roles,
    install_surplus_three_triad_membership_family_bank,
    production_family_id_for_cell,
    validate_surplus_three_triad_membership_family_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
FROZEN_CELL6_SURVIVOR_ASSIGNMENT_SHA256 = (
    "5be3956a4bafa46e9667e75da7f8338bc218da2a31de941b69368e2cfb8633a5"
)
FROZEN_CELL6_SURVIVOR_CUBE = {
    0: [3, 4, 7, 11],
    1: [0, 3, 6, 8],
    2: [0, 1, 10, 11],
    3: [1, 2, 5, 9],
    4: [1, 2, 3, 8],
    5: [0, 2, 3, 7],
    6: [0, 2, 4, 9],
    7: [4, 5, 6, 8],
    8: [4, 6, 9, 11],
    9: [0, 5, 6, 7],
    10: [1, 3, 9, 11],
    11: [5, 7, 9, 10],
}


def _parent():
    instance, _compiled, layout, three_triad_bank = (
        materialize_positive_membership_static_cell(REPO_ROOT, 1)
    )
    first_bank = install_surplus_apex_pair_membership_family_bank(
        REPO_ROOT, instance, layout, three_triad_bank, cell_index=1
    )
    second_bank = install_adjacent_apex_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, first_bank, cell_index=1
    )
    parent_bank = install_second_cap_apex_surplus_membership_family_bank(
        REPO_ROOT, instance, layout, second_bank, cell_index=1
    )
    return instance, layout, parent_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent_bank = _parent()
    bank = build_surplus_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=1
    )
    return bank, instance, layout, parent_bank


def test_family_rebuild_matches_frozen_delta(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    rebuilt = build_surplus_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    compiled = bank["compiled"]
    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["family_id"] == FAMILY_ID
    assert family_roles() == (3, 4, 5)
    assert len(family_patterns()) == EXPECTED_PATTERN_COUNT
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }
    assert {record["path"] for record in bank["source_manifest"]} >= {
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221SurplusThreeTriadCertificate.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf.lean"
        ),
    }


def test_family_blocks_the_frozen_cell6_survivor(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    matching = []
    for entry in bank["entries"]:
        if all(
            set(requirement["required"])
            <= set(FROZEN_CELL6_SURVIVOR_CUBE[requirement["center"]])
            for requirement in entry["requirements"]
        ):
            matching.append(entry)
    assert FROZEN_CELL6_SURVIVOR_ASSIGNMENT_SHA256 == (
        "5be3956a4bafa46e9667e75da7f8338bc218da2a31de941b69368e2cfb8633a5"
    )
    assert [entry["index"] for entry in matching] == [1]
    assert matching[0]["blocking_clause"] == [-45002, -45005, -45008, -45010]


def test_tampering_fails_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["a"] = 4
    with pytest.raises(
        Exact12SurplusThreeTriadMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_surplus_three_triad_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=1
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12SurplusThreeTriadMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_surplus_three_triad_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_the_complete_family_once() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_surplus_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12SurplusThreeTriadMembershipFamilyBankError,
        match="already installed",
    ):
        install_surplus_three_triad_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12SurplusThreeTriadMembershipFamilyBankError,
        match="no production surplus three-triad family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12SurplusThreeTriadMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
