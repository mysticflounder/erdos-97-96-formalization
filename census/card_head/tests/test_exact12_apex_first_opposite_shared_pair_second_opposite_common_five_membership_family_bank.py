from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    install_apex_first_opposite_shared_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENT_COUNT,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PARENT_BANK_SHA256,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_PATTERN_VARIABLES,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    SEMANTIC_STATUS,
    Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError,
    _compile_payload,
    _compile_reusing_parent_requirements,
    _lean_source_paths,
    _project_lean_source_path,
    attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources,
    build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank,
    family_patterns,
    family_roles,
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
MEMBERSHIP_CNF_PATH = (
    REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf.lean"
)
PARENT_MEMBERSHIP_CNF_PATH = (
    REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf.lean"
)
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveCertificate.lean"
)


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
        install_apex_first_opposite_shared_pair_common_five_membership_family_bank,
    ):
        bank = installer(REPO_ROOT, instance, layout, bank, cell_index=1)
    return instance, layout, bank


@pytest.fixture(scope="module")
def parent():
    return _parent()


def test_roles_patterns_and_frozen_compilation(parent) -> None:
    instance, _layout, _bank = parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_apex_first_opposite_shared_pair_second_opposite_"
        "common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == (
        "apex-first-opposite-shared-pair-second-opposite-common-five-"
        "a6789-b345-c6789-y1011.v1"
    )
    assert SEMANTIC_STATUS.startswith("FINITE_SOURCE_PROVED_")
    roles = family_roles()
    assert len(roles) == EXPECTED_PATTERN_COUNT == 96
    assert roles == tuple(sorted(roles))
    assert roles[0] == (6, 3, 6, 10)
    assert roles[-1] == (9, 5, 9, 11)
    assert _sha256_json([list(role) for role in roles]) == EXPECTED_ROLES_SHA256
    assert len(family_patterns()) == EXPECTED_PATTERN_COUNT
    assert all(len(pattern) == 3 for pattern in family_patterns())

    compiled = _compile_payload(instance)
    assert compiled["initial_n_variables"] == 45_176
    assert compiled["initial_n_clauses"] == 640_828
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 45_224
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 641_980
    assert len(compiled["entries"]) == EXPECTED_PATTERN_COUNT
    logical_requirements = {
        (item["center"], tuple(item["required"]))
        for pattern in compiled["pattern_keys"]
        for item in pattern
    }
    assert len(logical_requirements) == EXPECTED_LOGICAL_REQUIREMENT_COUNT == 60
    assert (
        len(compiled["pattern_definitions"])
        == EXPECTED_DEFINITION_COUNT
        == EXPECTED_FRESH_REQUIREMENT_COUNT
        == 48
    )
    assert [
        definition["pattern_variable"]
        for definition in compiled["pattern_definitions"]
    ] == list(EXPECTED_FRESH_PATTERN_VARIABLES)
    reused_bindings = sorted(
        (center, tuple(sorted(required)), variable)
        for (center, required), variable in instance.pattern_variables.items()
        if variable in EXPECTED_REUSED_PATTERN_VARIABLES
    )
    assert [binding[0] for binding in reused_bindings] == [0] * 12
    assert [binding[2] for binding in reused_bindings] == list(
        EXPECTED_REUSED_PATTERN_VARIABLES
    )
    assert len(reused_bindings) == EXPECTED_REUSED_REQUIREMENT_COUNT == 12
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256


def test_compilation_replay_matches_authenticated_payload(parent) -> None:
    instance, _layout, _bank = parent
    replay = _compile_reusing_parent_requirements(copy.deepcopy(instance))
    expected = _compile_payload(instance)
    expected.pop("compiled_sha256")
    expected.pop("final_dimacs_sha256")
    assert replay == expected


def test_lean_reused_definitions_match_python_parent_bindings(parent) -> None:
    instance, _layout, _bank = parent
    source = MEMBERSHIP_CNF_PATH.read_text(encoding="utf-8")
    parent_source = PARENT_MEMBERSHIP_CNF_PATH.read_text(encoding="utf-8")

    reused_block = re.search(
        r"def reusedDefinitions : List PositiveMembershipDefinition :=\s*"
        r"\[(.*?)\]\s*/-- Every definition",
        source,
        flags=re.DOTALL,
    )
    assert reused_block is not None
    reused_names = re.findall(
        r"ApexSharedPairCrossBlockMembershipFamilyCnf\.(definition0_\d+)",
        reused_block.group(1),
    )
    expected_names = [
        "definition0_36",
        "definition0_37",
        "definition0_38",
        "definition0_39",
        "definition0_46",
        "definition0_47",
        "definition0_48",
        "definition0_49",
        "definition0_56",
        "definition0_57",
        "definition0_58",
        "definition0_59",
    ]
    assert reused_names == expected_names

    parent_definitions = {
        name: (int(variable), int(center), tuple(sorted(map(int, support.split(", ")))))
        for name, variable, center, support in re.findall(
            r"def (definition0_\d+) := mkDefinition (\d+) (\d+) \{([0-9, ]+)\}",
            parent_source,
        )
    }
    lean_bindings = [parent_definitions[name] for name in reused_names]
    python_bindings = sorted(
        (variable, center, tuple(sorted(required)))
        for (center, required), variable in instance.pattern_variables.items()
        if variable in EXPECTED_REUSED_PATTERN_VARIABLES
    )
    assert lean_bindings == python_bindings
    assert [binding[0] for binding in lean_bindings] == list(
        EXPECTED_REUSED_PATTERN_VARIABLES
    )

    # These exact source forms keep the mixed fresh/reused partition proof-relevant:
    # only fresh definitions emit implications, while all 60 definitions remain in
    # the block scope and reused meanings are supplied by the caller.
    assert "freshDefinitions ++ reusedDefinitions" in source
    assert "freshDefinitions.flatMap fun definition =>" in source
    assert "(hreused : ∀ definition ∈ reusedDefinitions," in source


def test_source_paths_authenticate_certificate_and_cnf_roots_recursively(parent) -> None:
    assert _project_lean_source_path(
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveCertificate"
    ) == CERTIFICATE_PATH
    expected_cnf_path = MEMBERSHIP_CNF_PATH.relative_to(REPO_ROOT).as_posix()
    assert MEMBERSHIP_CNF_PATH.exists()
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert expected_cnf_path in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)

    instance, layout, parent_bank = parent
    bank = build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent_bank, cell_index=1
    )
    attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert CERTIFICATE_PATH in manifest_paths
    assert expected_cnf_path in manifest_paths


def test_tampered_parent_hash_is_rejected(parent) -> None:
    instance, layout, parent_bank = parent
    assert parent_bank["bank_sha256"] == EXPECTED_PARENT_BANK_SHA256
    tampered = copy.deepcopy(parent_bank)
    tampered["bank_sha256"] = "0" * 64
    module = __import__(
        "census.card_head.exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank",
        fromlist=["_parent_record"],
    )
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError,
        match="frozen post-first-opposite shared-pair parent",
    ):
        module._parent_record(instance, layout, tampered)
