from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_DUPLICATE_BLOCK_COUNT,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_PARENT_BANK_SHA256,
    EXPECTED_PARENT_CLAUSES,
    EXPECTED_PARENT_DIMACS_SHA256,
    EXPECTED_PARENT_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    SEMANTIC_STATUS,
    Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
    _lean_import_modules,
    _lean_source_paths,
    _project_lean_source_path,
    _source_paths,
    attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources,
    build_apex_first_opposite_shared_pair_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_first_opposite_shared_pair_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_first_opposite_shared_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    install_apex_internal_shared_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_shared_pair_cross_block_membership_family_bank import (
    install_apex_shared_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_static_cegar import (
    materialize_positive_membership_static_cell,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)
from census.card_head.exact12_surplus_three_triad_membership_family_bank import (
    install_surplus_three_triad_membership_family_bank,
)
from census.card_head.exact12_zero_center_cross_block_membership_family_bank import (
    install_zero_center_cross_block_membership_family_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]

EXPECTED_ROLES = (
    (6, 10, 11),
    (6, 11, 10),
    (7, 10, 11),
    (7, 11, 10),
    (8, 10, 11),
    (8, 11, 10),
    (9, 10, 11),
    (9, 11, 10),
)
# Sources the manifest must reach.  The manifest is the frozen KERNEL
# dependency set, not the transitive import closure, so a file belongs here
# only when it supplies a declaration this bank's root modules actually use.
# ExactTwelveRigid221LearnedClauseBridge and
# ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf were required
# while the manifest walked imports; neither supplies a reached declaration --
# the first serves the downstream consumer layer and the second is a sibling
# family's generated CNF -- so both left the manifest with the narrowing.
REQUIRED_SOURCE_PATHS = {
    "census/card_head/exact12_positive_membership_cnf.py",
    "census/card_head/exact12_positive_membership_source_order_bank.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221OrderedCoreConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SameBoundaryOrderIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SafeCoverCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.lean"
    ),
}


def _parent():
    instance, _compiled, layout, bank = materialize_positive_membership_static_cell(
        REPO_ROOT, 1
    )
    for installer in (
        install_surplus_apex_pair_membership_family_bank,
        install_adjacent_apex_cross_block_membership_family_bank,
        install_second_cap_apex_surplus_membership_family_bank,
        install_surplus_three_triad_membership_family_bank,
        install_zero_center_cross_block_membership_family_bank,
        install_apex_zero_cross_block_membership_family_bank,
        install_apex_pair_cross_block_membership_family_bank,
        install_apex_shared_pair_cross_block_membership_family_bank,
        install_apex_internal_shared_pair_common_five_membership_family_bank,
    ):
        bank = installer(REPO_ROOT, instance, layout, bank, cell_index=1)
    return instance, layout, bank


def test_recursive_lean_import_parser_is_fail_closed() -> None:
    module = "Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate"
    source = f"/- import Erdos9796Proof.Fake -/\nimport {module} -- live\nnamespace X"
    assert _lean_import_modules(source, relative_path="lean/Test.lean") == (module,)
    assert _lean_import_modules(
        "namespace GeneratedWithoutImports", relative_path="lean/Generated.lean"
    ) == ()
    assert _project_lean_source_path("Mathlib.Data.Finset.Card") is None
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="malformed Lean import",
    ):
        _lean_import_modules("importX Bad", relative_path="lean/Bad.lean")
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="Lean import appears after source header",
    ):
        _lean_import_modules(
            f"namespace X\nimport {module}", relative_path="lean/Late.lean"
        )
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="malformed repository-local Lean import",
    ):
        _project_lean_source_path("Erdos9796Proof.P97.Bad-Module")


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    return bank, instance, layout, parent


def test_constants_roles_patterns_and_counts(bank_and_parent) -> None:
    bank, instance, _layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_apex_first_opposite_shared_pair_common_five_"
        "membership_family_bank.v1"
    )
    assert FAMILY_ID == "apex-first-opposite-shared-pair-common-five-x6789-b1011-y1011.v1"
    assert SEMANTIC_STATUS == (
        "FINITE_SOURCE_PROVED_APEX_FIRST_OPPOSITE_SHARED_PAIR_COMMON_FIVE_MEMBERSHIP_FAMILY"
    )
    assert production_family_id_for_cell(1) == FAMILY_ID
    assert family_roles() == EXPECTED_ROLES
    assert family_roles() == tuple(sorted(family_roles()))
    assert len(family_patterns()) == EXPECTED_PATTERN_COUNT == 8
    assert len(bank["roles"]) == EXPECTED_PATTERN_COUNT
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT
    assert len(bank["compiled"]["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT == 14
    assert [
        definition["pattern_variable"]
        for definition in bank["compiled"]["pattern_definitions"]
    ] == list(range(45_163, 45_177))
    assert bank["reused_requirement_count"] == EXPECTED_REUSED_REQUIREMENT_COUNT == 0
    assert bank["duplicate_block_count"] == EXPECTED_DUPLICATE_BLOCK_COUNT == 0
    assert bank["roles_sha256"] == EXPECTED_ROLES_SHA256
    assert len(bank["bank_sha256"]) == 64
    assert parent["bank_sha256"] == EXPECTED_PARENT_BANK_SHA256
    assert parent["compiled"]["final_n_variables"] == EXPECTED_PARENT_VARIABLES
    assert parent["compiled"]["final_n_clauses"] == EXPECTED_PARENT_CLAUSES
    assert parent["compiled"]["final_dimacs_sha256"] == EXPECTED_PARENT_DIMACS_SHA256
    assert instance.cnf.n_variables == EXPECTED_PARENT_VARIABLES
    assert len(instance.cnf.clauses) == EXPECTED_PARENT_CLAUSES


def test_patterns_preserve_all_eight_roles_and_row_order() -> None:
    for role, pattern in zip(EXPECTED_ROLES, family_patterns(), strict=True):
        x, b, y = role
        assert pattern == (
            {"center": x, "support": [0, b]},
            {"center": y, "support": [0, b]},
            {"center": 2, "support": [b, x, y]},
        )
    assert family_patterns()[0] == (
        {"center": 6, "support": [0, 10]},
        {"center": 11, "support": [0, 10]},
        {"center": 2, "support": [10, 6, 11]},
    )
    assert family_patterns()[-1] == (
        {"center": 9, "support": [0, 11]},
        {"center": 10, "support": [0, 11]},
        {"center": 2, "support": [11, 9, 10]},
    )


def test_full_build_validation_and_frozen_hashes(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    rebuilt = build_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    validate_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, bank, cell_index=1
    )
    attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )
    assert rebuilt == bank
    compiled = bank["compiled"]
    assert compiled["initial_n_variables"] == EXPECTED_PARENT_VARIABLES
    assert compiled["initial_n_clauses"] == EXPECTED_PARENT_CLAUSES
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert len(compiled["delta_clauses"]) == EXPECTED_FINAL_CLAUSES - EXPECTED_PARENT_CLAUSES
    assert len(compiled["entries"]) == EXPECTED_PATTERN_COUNT == 8
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert manifest_paths == _source_paths(REPO_ROOT)
    assert REQUIRED_SOURCE_PATHS <= set(manifest_paths)
    assert tuple(path for path in manifest_paths if path.endswith(".lean")) == (
        _lean_source_paths(REPO_ROOT)
    )
    blockers = [tuple(entry["blocking_clause"]) for entry in bank["entries"]]
    assert blockers == [
        (-45163, -45167, -45176),
        (-45163, -45168, -45175),
        (-45164, -45169, -45176),
        (-45164, -45170, -45175),
        (-45165, -45171, -45176),
        (-45165, -45172, -45175),
        (-45166, -45173, -45176),
        (-45166, -45174, -45175),
    ]
    assert len(blockers) == EXPECTED_PATTERN_COUNT == 8
    assert len(set(blockers)) == len(blockers)
    assert all(len(blocker) == 3 for blocker in blockers)


def test_source_and_payload_tampering_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0][1] = 11
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_first_opposite_shared_pair_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=1
        )

    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    body = dict(tampered)
    body.pop("bank_sha256")
    tampered["bank_sha256"] = _sha256_json(body)
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )

    tampered = copy.deepcopy(bank)
    tampered["source_manifest"] = tampered["source_manifest"][:1]
    body = dict(tampered)
    body.pop("bank_sha256")
    tampered["bank_sha256"] = _sha256_json(body)
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="source manifest is malformed",
    ):
        attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_appends_family_once_and_selection_fails_closed() -> None:
    instance, layout, parent = _parent()
    before = len(instance.cnf.clauses)
    bank = install_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=1
    )
    delta = [tuple(clause) for clause in bank["compiled"]["delta_clauses"]]
    assert instance.cnf.clauses[-len(delta) :] == delta
    assert len(instance.cnf.clauses) == before + len(delta)
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_first_opposite_shared_pair_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, cell_index=1
        )
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="no production apex-first-opposite shared-pair family for cell 0",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)
