from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank import (
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
    Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_apex_triple_surplus_second_opposite_common_five_membership_family_bank_live_sources,
    build_apex_triple_surplus_second_opposite_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_triple_surplus_second_opposite_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.tests.test_exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    _parent as _pre_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf.lean"
)


def _parent():
    instance, layout, pre_parent = _pre_parent()
    parent = install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, pre_parent, cell_index=1
    )
    return instance, layout, parent


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    return bank, instance, layout, parent


def test_roles_patterns_and_frozen_compilation(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_apex_triple_surplus_second_opposite_"
        "common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == (
        "apex-triple-surplus-second-opposite-common-five-c345-y6789.v1"
    )
    assert family_roles() == tuple(
        (c, y) for c in (3, 4, 5) for y in (6, 7, 8, 9)
    )
    assert _sha256_json(
        [{"c": c, "y": y} for c, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256
    assert family_patterns()[0] == (
        {"center": 0, "support": [1, 2]},
        {"center": 3, "support": [0, 2, 6]},
        {"center": 6, "support": [1, 2]},
    )
    assert family_patterns()[-1] == (
        {"center": 0, "support": [1, 2]},
        {"center": 5, "support": [0, 2, 9]},
        {"center": 9, "support": [1, 2]},
    )
    compiled = bank["compiled"]
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT == 12
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT == 17
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 45_241
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 642_191
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, bank, cell_index=1
    )


def test_source_manifest_covers_both_lean_roots_recursively(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)
    attest_apex_triple_surplus_second_opposite_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )


def test_target_survivor_falsifies_its_proof_backed_block(bank_and_parent) -> None:
    bank, _instance, _layout, _parent = bank_and_parent
    target_rows = {
        0: {1, 2, 4, 5},
        3: {0, 2, 7, 11},
        7: {1, 2, 6, 8},
    }
    entry = bank["entries"][1]
    assert entry["requirements"] == [
        {"center": 0, "required": [1, 2]},
        {"center": 3, "required": [0, 2, 7]},
        {"center": 7, "required": [1, 2]},
    ]
    assert all(
        set(requirement["required"]) <= target_rows[requirement["center"]]
        for requirement in entry["requirements"]
    )
    definitions = {
        (item["center"], tuple(item["required"])): item["pattern_variable"]
        for item in bank["compiled"]["pattern_definitions"]
    }
    assert entry["blocking_clause"] == [
        -definitions[(item["center"], tuple(item["required"]))]
        for item in entry["requirements"]
    ]


def test_tampering_and_duplicate_install_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["y"] = 7
    with pytest.raises(
        Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=1
        )

    install_instance = copy.deepcopy(instance)
    install_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, install_instance, layout, parent, cell_index=1
    )
    with pytest.raises(
        Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=1
        )


def test_family_selection_is_cell_keyed_and_fail_closed() -> None:
    assert production_family_id_for_cell(1) == FAMILY_ID
    with pytest.raises(
        Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="no production apex-triple",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
