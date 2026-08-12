from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_block_spanning_membership_family_bank import (
    install_block_spanning_membership_family_bank,
)
from census.card_head.exact12_next_row_static_convex import (
    install_static_convex_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.exact12_three_triad_membership_bank import (
    BANK_SCHEMA,
    CUT_ID,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    Exact12ThreeTriadMembershipBankError,
    attest_three_triad_membership_bank_live_sources,
    build_three_triad_membership_bank,
    install_three_triad_membership_bank,
    membership_pattern,
    production_cut_id_for_cell,
    validate_three_triad_membership_bank,
)
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent() -> tuple[SourceFaithfulCoverInstance, object, dict]:
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[1])
    layout = install_static_convex_extension(instance, compiled)
    family_bank = install_block_spanning_membership_family_bank(
        REPO_ROOT, instance, layout, cell_index=1
    )
    return instance, layout, family_bank


@pytest.fixture(scope="module")
def bank_and_parent() -> tuple[dict, SourceFaithfulCoverInstance, object, dict]:
    instance, layout, family_bank = _parent()
    bank = build_three_triad_membership_bank(
        REPO_ROOT, instance, layout, family_bank, cell_index=1
    )
    return bank, instance, layout, family_bank


def test_rebuild_is_deterministic_and_matches_lean_bridge(bank_and_parent) -> None:
    bank, instance, layout, family_bank = bank_and_parent
    rebuilt = build_three_triad_membership_bank(
        REPO_ROOT, instance, layout, family_bank, cell_index=1
    )
    compiled = bank["compiled"]

    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["cut_id"] == CUT_ID
    assert len(membership_pattern()) == EXPECTED_DEFINITION_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
    assert len(compiled["entries"]) == EXPECTED_PATTERN_COUNT
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }


@pytest.mark.parametrize(
    "mutation",
    [
        lambda value: value["source_manifest"][0].__setitem__("sha256", "0" * 64),
        lambda value: value["pattern"][0].__setitem__("center", 1),
        lambda value: value["compiled"]["delta_clauses"][0].__setitem__(0, 1),
        lambda value: value["entries"].pop(),
        lambda value: value["parent_block_spanning_family"].__setitem__(
            "n_variables", 1
        ),
    ],
)
def test_tampering_fails_closed(bank_and_parent, mutation) -> None:
    bank, instance, layout, family_bank = bank_and_parent
    tampered = copy.deepcopy(bank)
    mutation(tampered)
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="live authenticated rebuild",
    ):
        validate_three_triad_membership_bank(
            REPO_ROOT,
            instance,
            layout,
            family_bank,
            tampered,
            cell_index=1,
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout, _family_bank = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="source bytes or hashes drifted",
    ):
        attest_three_triad_membership_bank_live_sources(REPO_ROOT, tampered)


def test_family_parent_tampering_fails_closed(bank_and_parent) -> None:
    _bank, instance, layout, family_bank = bank_and_parent
    tampered_family = copy.deepcopy(family_bank)
    tampered_family["compiled"]["delta_clauses"][0][0] *= -1
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="frozen post-family",
    ):
        build_three_triad_membership_bank(
            REPO_ROOT, instance, layout, tampered_family, cell_index=1
        )


def test_install_appends_the_complete_supplement_once() -> None:
    instance, layout, family_bank = _parent()
    before_variables = instance.cnf.n_variables
    before_clauses = len(instance.cnf.clauses)
    bank = install_three_triad_membership_bank(
        REPO_ROOT, instance, layout, family_bank, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert instance.cnf.n_variables == EXPECTED_FINAL_VARIABLES
    assert len(instance.cnf.clauses) == EXPECTED_FINAL_CLAUSES
    assert instance.cnf.n_variables == before_variables + EXPECTED_DEFINITION_COUNT
    assert len(instance.cnf.clauses) == before_clauses + len(delta)
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="already installed",
    ):
        install_three_triad_membership_bank(
            REPO_ROOT, instance, layout, family_bank, cell_index=1
        )


def test_cut_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_cut_id_for_cell(1) == CUT_ID
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="no production ThreeTriad membership cut for cell 0",
    ):
        production_cut_id_for_cell(0)
    with pytest.raises(
        Exact12ThreeTriadMembershipBankError,
        match="cell index must be an integer",
    ):
        production_cut_id_for_cell(True)
