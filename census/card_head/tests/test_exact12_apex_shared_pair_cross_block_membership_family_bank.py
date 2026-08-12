from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_shared_pair_cross_block_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
    attest_apex_shared_pair_cross_block_membership_family_bank_live_sources,
    build_apex_shared_pair_cross_block_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_shared_pair_cross_block_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_shared_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.tests.test_exact12_apex_pair_cross_block_membership_family_bank import (
    _parent as _pre_shared_pair_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent():
    instance, layout, parent_bank = _pre_shared_pair_parent()
    parent_bank = install_apex_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=1
    )
    return instance, layout, parent_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent_bank = _parent()
    bank = build_apex_shared_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=1
    )
    return bank, instance, layout, parent_bank


def test_family_rebuild_matches_frozen_delta(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    rebuilt = build_apex_shared_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    compiled = bank["compiled"]
    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["family_id"] == FAMILY_ID
    assert family_roles() == tuple(
        (a, b, c) for a in (6, 7, 8, 9) for b in (3, 4, 5) for c in (10, 11)
    )
    assert len(family_patterns()) == EXPECTED_PATTERN_COUNT
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
    assert compiled["initial_n_variables"] == 45_096
    assert compiled["initial_n_clauses"] == 638_948
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["roles_sha256"] == EXPECTED_ROLES_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }
    assert {record["path"] for record in bank["source_manifest"]} == {
        "census/card_head/exact12_positive_membership_cnf.py",
        "census/card_head/exact12_positive_membership_source_order_bank.py",
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221ApexSharedPairCrossBlockCommonFiveCertificate.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf.lean"
        ),
    }


def test_family_patterns_preserve_the_requested_role_and_row_order() -> None:
    assert family_patterns()[0] == (
        {"center": 0, "support": [6, 3]},
        {"center": 1, "support": [6, 3]},
        {"center": 10, "support": [0, 1, 3]},
    )
    assert family_patterns()[-1] == (
        {"center": 0, "support": [9, 5]},
        {"center": 1, "support": [9, 5]},
        {"center": 11, "support": [0, 1, 5]},
    )


def test_tampering_fails_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0][0] = 7
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_shared_pair_cross_block_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=1
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    body = dict(tampered)
    body.pop("bank_sha256")
    tampered["bank_sha256"] = _sha256_json(body)
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"] = tampered["source_manifest"][:1]
    body = dict(tampered)
    body.pop("bank_sha256")
    tampered["bank_sha256"] = _sha256_json(body)
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="source manifest is malformed",
    ):
        attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_the_complete_family_once() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_apex_shared_pair_cross_block_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_shared_pair_cross_block_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="no production apex-shared-pair cross-block family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
