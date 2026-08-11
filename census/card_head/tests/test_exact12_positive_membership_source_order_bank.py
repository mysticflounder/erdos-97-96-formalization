# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_static_convex import (
    install_static_convex_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.exact12_positive_membership_source_order_bank import (
    BANK_SCHEMA,
    PROMOTION_STATUS,
    Exact12PositiveMembershipSourceOrderBankError,
    attest_positive_membership_source_order_bank_live_sources,
    build_positive_membership_source_order_bank,
    install_positive_membership_source_order_bank,
    validate_positive_membership_source_order_bank,
)
from census.card_head.exact12_v14_ordered_coverage import (
    NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_MEMBERSHIP_LEAN_BINDING,
    NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_MEMBERSHIP_LEAN_CHOICES,
)
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _parent() -> tuple[SourceFaithfulCoverInstance, object]:
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[0])
    return instance, install_static_convex_extension(instance, compiled)


@pytest.fixture(scope="module")
def parent() -> tuple[SourceFaithfulCoverInstance, object]:
    return _parent()


@pytest.fixture(scope="module")
def bank(parent: tuple[SourceFaithfulCoverInstance, object]) -> dict:
    instance, layout = parent
    return build_positive_membership_source_order_bank(REPO_ROOT, instance, layout)


def test_rebuild_is_deterministic_and_authenticates_the_single_binding(bank, parent) -> None:
    instance, layout = parent
    rebuilt = build_positive_membership_source_order_bank(REPO_ROOT, instance, layout)
    entry = bank["entries"][0]
    compiled = entry["compiled"]

    assert rebuilt == bank
    assert bank["schema"] == BANK_SCHEMA
    assert bank["promotion_status"] == PROMOTION_STATUS
    assert bank["claims"]["terminal_promotion"] is False
    assert bank["claims"]["terminal_unsat"] is False
    assert bank["claims"]["universal_lift"] is False
    assert bank["claims"]["live_theorem_closure"] is False
    assert bank["claims"]["runner_integrated"] is False
    assert [record["path"] for record in bank["lean_source_manifest"]] == [
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221NextRowStaticConvexCell0ThirdMembershipCnf.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221NextRowStaticConvexCell0ThirdPositiveCut.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221PositiveMembershipCnfBridge.lean"
        ),
    ]
    assert len(bank["entries"]) == 1
    assert entry["generated_lean_membership_binding"] == (
        NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_MEMBERSHIP_LEAN_BINDING
    )
    bridge = entry["generated_lean_membership_binding"]["terminal_pattern_bridge"]
    assert bridge["schema"] == "p97_exact12_positive_membership_lean_bridge.v1"
    assert bridge["implication_satisfaction_declaration"].endswith(
        ".NextRowStaticConvexCell0ThirdMembershipCnf.implicationDimacs_sat"
    )
    assert bridge["blocking_false_declaration"].endswith(
        ".positiveRowsMatch_of_blockingClause_false"
    )
    assert entry["choices"] == NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_MEMBERSHIP_LEAN_CHOICES
    assert len(entry["certificate"]["coverage"]) == 48
    assert len(compiled["delta_clauses"]) == 117
    assert compiled["initial_n_variables"] == 44875
    assert compiled["initial_n_clauses"] == 634859
    assert compiled["final_n_variables"] == 44880
    assert compiled["final_n_clauses"] == 634976
    assert compiled["delta_sha256"] == entry["compiled"]["delta_sha256"]


@pytest.mark.parametrize(
    "mutation",
    [
        lambda value: value["lean_source_manifest"][0].__setitem__(
            "sha256", "0" * 64
        ),
        lambda value: value["entries"][0]["choices"].pop(),
        lambda value: value["entries"][0]["compiled"]["delta_clauses"][0].__setitem__(
            0, 1
        ),
        lambda value: value["entries"][0]["compiled"]["pattern_definitions"][0][
            "candidate_indices"
        ].__setitem__(0, 999),
        lambda value: value["entries"][0].__setitem__(
            "entry_sha256", "0" * 64
        ),
        lambda value: value["parent_static_convex"].__setitem__(
            "n_variables", 1
        ),
    ],
    ids=["source", "choices", "delta", "candidate-hits", "hash", "parent-formula"],
)
def test_tampering_fails_closed(
    bank,
    parent: tuple[SourceFaithfulCoverInstance, object],
    mutation,
) -> None:
    instance, layout = parent
    tampered = copy.deepcopy(bank)
    mutation(tampered)
    with pytest.raises(
        Exact12PositiveMembershipSourceOrderBankError,
        match="fresh authenticated rebuild|Lean source bytes",
    ):
        validate_positive_membership_source_order_bank(
            REPO_ROOT, instance, layout, tampered
        )


def test_live_source_attestation_rejects_tampered_manifest(bank) -> None:
    tampered = copy.deepcopy(bank)
    tampered["compiler_source"]["sha256"] = "0" * 64
    with pytest.raises(
        Exact12PositiveMembershipSourceOrderBankError,
        match="compiler source bytes or hash",
    ):
        attest_positive_membership_source_order_bank_live_sources(REPO_ROOT, tampered)


def test_install_appends_complete_delta_once() -> None:
    instance, layout = _parent()
    before = len(instance.cnf.clauses)
    bank = install_positive_membership_source_order_bank(REPO_ROOT, instance, layout)
    delta = [tuple(clause) for clause in bank["entries"][0]["compiled"]["delta_clauses"]]
    assert len(instance.cnf.clauses) == before + len(delta)
    assert instance.cnf.clauses[-len(delta) :] == delta
    with pytest.raises(
        Exact12PositiveMembershipSourceOrderBankError,
        match="already installed",
    ):
        install_positive_membership_source_order_bank(REPO_ROOT, instance, layout)
