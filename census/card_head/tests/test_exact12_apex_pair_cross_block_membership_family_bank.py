from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    FAMILY_ID,
    Exact12ApexPairCrossBlockMembershipFamilyBankError,
    attest_apex_pair_cross_block_membership_family_bank_live_sources,
    build_apex_pair_cross_block_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_pair_cross_block_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.tests.test_exact12_apex_zero_cross_block_membership_family_bank import (
    _parent as _pre_apex_pair_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent():
    instance, layout, pre_apex_parent = _pre_apex_pair_parent()
    parent_bank = install_apex_zero_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, pre_apex_parent, cell_index=1
    )
    return instance, layout, parent_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent_bank = _parent()
    bank = build_apex_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=1
    )
    return bank, instance, layout, parent_bank


def test_family_rebuild_matches_frozen_delta(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    rebuilt = build_apex_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    compiled = bank["compiled"]
    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["family_id"] == FAMILY_ID
    assert family_roles() == tuple(
        (x, y) for x in (6, 7, 8, 9) for y in (3, 4, 5)
    )
    assert len(family_patterns()) == EXPECTED_PATTERN_COUNT
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
    assert compiled["initial_n_variables"] == 45_077
    assert compiled["initial_n_clauses"] == 638_704
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
            "ExactTwelveRigid221ApexPairCrossBlockCommonFiveCertificate.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221ApexPairCrossBlockMembershipFamilyCnf.lean"
        ),
    }


def test_family_patterns_preserve_the_requested_role_and_row_order() -> None:
    assert family_patterns()[0] == (
        {"center": 1, "support": [0, 3, 6]},
        {"center": 3, "support": [0, 2]},
        {"center": 6, "support": [0, 2]},
    )
    assert family_patterns()[-1] == (
        {"center": 1, "support": [0, 5, 9]},
        {"center": 5, "support": [0, 2]},
        {"center": 9, "support": [0, 2]},
    )


def test_tampering_fails_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["x"] = 7
    with pytest.raises(
        Exact12ApexPairCrossBlockMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_pair_cross_block_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=1
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12ApexPairCrossBlockMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_apex_pair_cross_block_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_the_complete_family_once() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_apex_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12ApexPairCrossBlockMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_pair_cross_block_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12ApexPairCrossBlockMembershipFamilyBankError,
        match="no production apex-pair cross-block family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ApexPairCrossBlockMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
