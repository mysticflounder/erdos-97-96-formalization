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
    BANK_SCHEMA,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    FAMILY_ID,
    Exact12SecondCapApexSurplusMembershipFamilyBankError,
    attest_second_cap_apex_surplus_membership_family_bank_live_sources,
    build_second_cap_apex_surplus_membership_family_bank,
    family_roles,
    install_second_cap_apex_surplus_membership_family_bank,
    production_family_id_for_cell,
    validate_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent():
    instance, _compiled, layout, three_triad_bank = (
        materialize_positive_membership_static_cell(REPO_ROOT, 1)
    )
    first_bank = install_surplus_apex_pair_membership_family_bank(
        REPO_ROOT,
        instance,
        layout,
        three_triad_bank,
        cell_index=1,
    )
    parent_bank = install_adjacent_apex_cross_block_membership_family_bank(
        REPO_ROOT,
        instance,
        layout,
        first_bank,
        cell_index=1,
    )
    return instance, layout, parent_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent_bank = _parent()
    bank = build_second_cap_apex_surplus_membership_family_bank(
        REPO_ROOT,
        instance,
        layout,
        parent_bank,
        cell_index=1,
    )
    return bank, instance, layout, parent_bank


def test_family_rebuild_matches_frozen_delta(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    rebuilt = build_second_cap_apex_surplus_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    compiled = bank["compiled"]
    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["family_id"] == FAMILY_ID
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT
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
    assert {
        record["path"] for record in bank["source_manifest"]
    } >= {
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221SecondCapApexSurplusCommonFiveCertificate.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf.lean"
        ),
    }


def test_tampering_fails_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["x"] = 7
    with pytest.raises(
        Exact12SecondCapApexSurplusMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_second_cap_apex_surplus_membership_family_bank(
            REPO_ROOT,
            instance,
            layout,
            parent,
            tampered,
            cell_index=1,
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12SecondCapApexSurplusMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_second_cap_apex_surplus_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_the_complete_family_once() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_second_cap_apex_surplus_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12SecondCapApexSurplusMembershipFamilyBankError,
        match="already installed",
    ):
        install_second_cap_apex_surplus_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12SecondCapApexSurplusMembershipFamilyBankError,
        match="no production second-cap/apex/surplus family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12SecondCapApexSurplusMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
