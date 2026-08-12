from __future__ import annotations

import copy
from pathlib import Path

import pytest

import census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_DUPLICATE_BLOCK_COUNT,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENT_COUNT,
    EXPECTED_FRESH_REQUIREMENTS,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_PATTERN_VARIABLES,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_apex_first_surplus_second_common_five_membership_family_bank_live_sources,
    build_apex_first_surplus_second_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_first_surplus_second_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_first_surplus_second_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank import (
    install_apex_triple_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    install_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank import (
    _parent as _pre_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.lean"
)
SURFACE_PATH = "census/card_head/source_faithful_candidate_surface.py"


def _parent():
    instance, layout, pre_parent = _pre_parent()
    parent = install_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, pre_parent, cell_index=1
    )
    parent = install_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return instance, layout, parent


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_apex_first_surplus_second_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_patterns_and_frozen_reuse_aware_compilation(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_apex_first_surplus_second_"
        "common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == "apex-first-surplus-second-common-five-a1011-b345-y6789.v1"
    expected_roles = tuple(
        (a, b, y)
        for a in (10, 11)
        for b in (3, 4, 5)
        for y in (6, 7, 8, 9)
    )
    assert family_roles() == expected_roles
    assert len(expected_roles) == EXPECTED_PATTERN_COUNT == 24
    assert _sha256_json(
        [{"a": a, "b": b, "y": y} for a, b, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256
    assert family_patterns()[0] == (
        {"center": 0, "support": [10, 3]},
        {"center": 6, "support": [10, 3]},
        {"center": 1, "support": [0, 3, 6]},
    )
    assert family_patterns()[-1] == (
        {"center": 0, "support": [11, 5]},
        {"center": 9, "support": [11, 5]},
        {"center": 1, "support": [0, 5, 9]},
    )

    compiled = bank["compiled"]
    definitions = tuple(
        (item["center"], tuple(item["required"]))
        for item in compiled["pattern_definitions"]
    )
    definition_variables = tuple(
        item["pattern_variable"] for item in compiled["pattern_definitions"]
    )
    assert definitions == EXPECTED_FRESH_REQUIREMENTS
    assert definition_variables == EXPECTED_FRESH_PATTERN_VARIABLES
    assert len(compiled["pattern_keys"]) == EXPECTED_PATTERN_COUNT
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT == 30
    assert EXPECTED_LOGICAL_REQUIREMENT_COUNT == 42
    assert EXPECTED_REUSED_REQUIREMENT_COUNT == 12
    assert EXPECTED_FRESH_REQUIREMENT_COUNT == 30
    assert bank["reused_requirement_count"] == EXPECTED_REUSED_REQUIREMENT_COUNT
    assert bank["duplicate_block_count"] == EXPECTED_DUPLICATE_BLOCK_COUNT == 0
    assert compiled["initial_n_variables"] == 45_247
    assert compiled["initial_n_clauses"] == 642_425
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 45_277
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 643_379
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    validate_apex_first_surplus_second_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, bank, cell_index=6
    )


def test_source_manifest_covers_both_lean_roots_recursively(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert SURFACE_PATH in manifest_paths
    attest_apex_first_surplus_second_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )


def test_target_survivor_falsifies_its_proof_backed_block(bank_and_parent) -> None:
    bank, instance, _layout, _parent = bank_and_parent
    target_rows = {
        0: {3, 10, 11},
        1: {0, 3, 7, 9},
        7: {3, 10, 11},
    }
    entry = bank["entries"][1]
    assert entry["requirements"] == [
        {"center": 0, "required": [3, 10]},
        {"center": 1, "required": [0, 3, 7]},
        {"center": 7, "required": [3, 10]},
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
        -definitions[(0, (3, 10))],
        -instance.pattern_variables[(1, frozenset({0, 3, 7}))],
        -definitions[(7, (3, 10))],
    ]


def test_tampering_duplicate_install_and_parent_reuse_fail_closed(
    bank_and_parent,
) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["b"] = 4
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_first_surplus_second_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )

    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_apex_first_surplus_second_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )

    install_instance = copy.deepcopy(instance)
    fresh_requirement_set = {
        (center, frozenset(required))
        for center, required in EXPECTED_FRESH_REQUIREMENTS
    }
    inherited_requirements = sorted(
        {
            (center, frozenset(required))
            for pattern in bank["compiled"]["pattern_keys"]
            for center, required in (
                (item["center"], tuple(item["required"])) for item in pattern
            )
            if (center, frozenset(required)) not in fresh_requirement_set
        },
        key=lambda item: (item[0], tuple(sorted(item[1]))),
    )
    inherited_before = {
        key: install_instance.pattern_variables[key] for key in inherited_requirements
    }
    assert tuple(inherited_before.values()) == EXPECTED_REUSED_PATTERN_VARIABLES

    install_apex_first_surplus_second_common_five_membership_family_bank(
        REPO_ROOT, install_instance, layout, parent, cell_index=6
    )
    assert {
        key: install_instance.pattern_variables[key] for key in inherited_requirements
    } == inherited_before
    assert tuple(
        install_instance.pattern_variables[(center, frozenset(required))]
        for center, required in EXPECTED_FRESH_REQUIREMENTS
    ) == EXPECTED_FRESH_PATTERN_VARIABLES
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_first_surplus_second_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )


def test_family_selection_is_cell6_only_and_fail_closed() -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="no production apex/first/surplus/second family",
    ):
        production_family_id_for_cell(1)
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)


def test_failed_installation_rolls_back_instance(bank_and_parent, monkeypatch) -> None:
    _bank, instance, layout, parent = bank_and_parent
    install_instance = copy.deepcopy(instance)
    initial_n_variables = install_instance.cnf.n_variables
    initial_clauses = tuple(install_instance.cnf.clauses)
    initial_pattern_variables = dict(install_instance.pattern_variables)
    original_compile = family_bank_module._compile_reusing_parent_requirements

    def compile_with_install_drift(target):
        compiled = original_compile(target)
        if target is install_instance:
            compiled = copy.deepcopy(compiled)
            compiled["final_n_clauses"] += 1
        return compiled

    monkeypatch.setattr(
        family_bank_module,
        "_compile_reusing_parent_requirements",
        compile_with_install_drift,
    )
    with pytest.raises(
        Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError,
        match="installed family delta",
    ):
        install_apex_first_surplus_second_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )
    assert install_instance.cnf.n_variables == initial_n_variables
    assert tuple(install_instance.cnf.clauses) == initial_clauses
    assert install_instance.pattern_variables == initial_pattern_variables
    assert not getattr(
        install_instance,
        "_apex_first_surplus_second_common_five_membership_family_bank_installed",
        False,
    )
