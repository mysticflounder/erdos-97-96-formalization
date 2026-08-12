from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_block_spanning_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    FAMILY_ID,
    Exact12BlockSpanningMembershipFamilyBankError,
    attest_block_spanning_membership_family_bank_live_sources,
    build_block_spanning_membership_family_bank,
    family_roles,
    install_block_spanning_membership_family_bank,
    production_family_id_for_cell,
    validate_block_spanning_membership_family_bank,
)
from census.card_head.exact12_next_row_static_convex import (
    install_static_convex_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent() -> tuple[SourceFaithfulCoverInstance, object]:
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[1])
    return instance, install_static_convex_extension(instance, compiled)


@pytest.fixture(scope="module")
def bank_and_parent() -> tuple[dict, SourceFaithfulCoverInstance, object]:
    instance, layout = _parent()
    bank = build_block_spanning_membership_family_bank(
        REPO_ROOT, instance, layout, cell_index=1
    )
    return bank, instance, layout


def test_full_family_rebuild_is_deterministic_and_matches_lean_bridge(
    bank_and_parent,
) -> None:
    bank, instance, layout = bank_and_parent
    rebuilt = build_block_spanning_membership_family_bank(
        REPO_ROOT, instance, layout, cell_index=1
    )
    compiled = bank["compiled"]

    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["family_id"] == FAMILY_ID
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT
    assert len(bank["roles"]) == EXPECTED_PATTERN_COUNT
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT
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
        lambda value: value["roles"][0].__setitem__("a", 7),
        lambda value: value["compiled"]["delta_clauses"][0].__setitem__(0, 1),
        lambda value: value["entries"].pop(),
        lambda value: value["parent_static_convex"].__setitem__("n_variables", 1),
    ],
)
def test_tampering_fails_closed(bank_and_parent, mutation) -> None:
    bank, instance, layout = bank_and_parent
    tampered = copy.deepcopy(bank)
    mutation(tampered)
    with pytest.raises(
        Exact12BlockSpanningMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_block_spanning_membership_family_bank(
            REPO_ROOT, instance, layout, tampered, cell_index=1
        )


def test_live_source_attestation_fails_closed(bank_and_parent) -> None:
    bank, _instance, _layout = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12BlockSpanningMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_block_spanning_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_the_complete_family_once() -> None:
    instance, layout = _parent()
    before = len(instance.cnf.clauses)
    bank = install_block_spanning_membership_family_bank(
        REPO_ROOT, instance, layout, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12BlockSpanningMembershipFamilyBankError,
        match="already installed",
    ):
        install_block_spanning_membership_family_bank(
            REPO_ROOT, instance, layout, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12BlockSpanningMembershipFamilyBankError,
        match="no production block-spanning family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12BlockSpanningMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
