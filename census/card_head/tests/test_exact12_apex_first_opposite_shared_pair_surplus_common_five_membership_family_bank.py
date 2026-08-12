from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

import census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_BANK_SHA256,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENTS,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_PATTERN_VARIABLES,
    EXPECTED_REUSED_REQUIREMENTS,
    EXPECTED_ROLES_SHA256,
    FAMILY_ID,
    Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources,
    build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    build_second_apex_surplus_second_first_common_five_membership_family_bank,
    install_second_apex_surplus_second_first_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    _parent as _v18_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf.lean"
)
REUSED_CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.lean"
)

_LEAN_DEFINITION_RE = re.compile(
    r"^\s*def\s+\S+\s*:=\s*mkDefinition\s+"
    r"(?P<variable>[0-9]+)\s+(?P<center>[0-9]+)\s*"
    r"\{(?P<support>[0-9, \t]*)\}\s*$",
    re.MULTILINE,
)


def _lean_mk_definition_bindings(path: Path) -> dict[int, tuple[int, tuple[int, ...]]]:
    bindings: dict[int, tuple[int, tuple[int, ...]]] = {}
    for declaration in _LEAN_DEFINITION_RE.finditer(path.read_text(encoding="utf-8")):
        variable = int(declaration.group("variable"))
        assert variable not in bindings
        support = tuple(
            sorted(
                int(label)
                for label in declaration.group("support").split(",")
                if label.strip()
            )
        )
        bindings[variable] = (int(declaration.group("center")), support)
    return bindings


def _lean_blocking_clauses(path: Path) -> tuple[tuple[int, int, int], ...]:
    source = path.read_text(encoding="utf-8")
    theorem_body = source.split("theorem blockingClauses_eq :", 1)[1].split(
        ":= by", 1
    )[0]
    clauses = re.findall(
        r"\[(?P<clause>-\d+\s*,\s*-\d+\s*,\s*-\d+)\]", theorem_body
    )
    return tuple(
        tuple(int(literal) for literal in clause.split(","))  # type: ignore[misc]
        for clause in clauses
    )


def _parent():
    instance, layout, v17_parent = _v18_parent()
    v18_bank = build_second_apex_surplus_second_first_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v17_parent, cell_index=6
    )
    install_second_apex_surplus_second_first_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v17_parent, cell_index=6
    )
    return instance, layout, v18_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_reuse_aware_payload(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_apex_first_opposite_shared_pair_surplus_"
        "common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == (
        "apex-first-opposite-shared-pair-surplus-common-five-x6789-b1011-y345.v1"
    )
    assert family_roles() == tuple(
        (x, b, y)
        for x in (6, 7, 8, 9)
        for b in (10, 11)
        for y in (3, 4, 5)
    )
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT == 24
    assert _sha256_json(
        [{"x": x, "b": b, "y": y} for x, b, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256
    assert family_patterns()[0] == (
        {"center": 6, "support": [0, 10]},
        {"center": 3, "support": [0, 10]},
        {"center": 2, "support": [10, 6, 3]},
    )
    assert family_patterns()[-1] == (
        {"center": 9, "support": [0, 11]},
        {"center": 5, "support": [0, 11]},
        {"center": 2, "support": [11, 9, 5]},
    )

    compiled = bank["compiled"]
    assert tuple(
        (item["center"], tuple(item["required"]))
        for item in compiled["pattern_definitions"]
    ) == EXPECTED_FRESH_REQUIREMENTS
    assert tuple(
        item["pattern_variable"] for item in compiled["pattern_definitions"]
    ) == EXPECTED_FRESH_PATTERN_VARIABLES
    assert len(
        {
            (item["center"], tuple(item["required"]))
            for pattern in compiled["pattern_keys"]
            for item in pattern
        }
    ) == EXPECTED_LOGICAL_REQUIREMENT_COUNT == 38
    for (x, b, y), pattern in zip(
        family_roles(), compiled["pattern_keys"], strict=True
    ):
        assert pattern == [
            {"center": 2, "required": sorted((b, x, y))},
            {"center": y, "required": [0, b]},
            {"center": x, "required": [0, b]},
        ]
    assert compiled["initial_n_variables"] == 45_307
    assert compiled["initial_n_clauses"] == 643_805
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 45_337
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 644_063
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256
    assert bank["reused_requirement_count"] == 8
    assert all(claim is False for claim in bank["claims"].values())
    validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, bank, cell_index=6
    )


def test_lean_bindings_and_block_order_match_python_compilation(
    bank_and_parent,
) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    compiled = bank["compiled"]
    python_bindings = {
        item["pattern_variable"]: (item["center"], tuple(item["required"]))
        for item in compiled["pattern_definitions"]
    }
    python_bindings.update(
        {
            variable: (center, tuple(required))
            for (center, required), variable in zip(
                EXPECTED_REUSED_REQUIREMENTS,
                EXPECTED_REUSED_PATTERN_VARIABLES,
                strict=True,
            )
        }
    )

    fresh_bindings = _lean_mk_definition_bindings(REPO_ROOT / CNF_PATH)
    reused_variables = set(EXPECTED_REUSED_PATTERN_VARIABLES)
    reused_bindings = {
        variable: binding
        for variable, binding in _lean_mk_definition_bindings(
            REPO_ROOT / REUSED_CNF_PATH
        ).items()
        if variable in reused_variables
    }
    assert set(fresh_bindings) == set(EXPECTED_FRESH_PATTERN_VARIABLES)
    assert set(reused_bindings) == reused_variables
    assert {**reused_bindings, **fresh_bindings} == python_bindings

    python_blocks = tuple(
        tuple(entry["blocking_clause"]) for entry in compiled["entries"]
    )
    lean_blocks = _lean_blocking_clauses(REPO_ROOT / CNF_PATH)
    assert len(lean_blocks) == EXPECTED_PATTERN_COUNT
    assert lean_blocks == python_blocks


def test_source_manifest_covers_both_live_lean_roots(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert CERTIFICATE_PATH in manifest_paths
    assert CNF_PATH in manifest_paths
    attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )


def test_tampering_and_parent_reuse_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["x"] = 7
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )

    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )

    install_instance = copy.deepcopy(instance)
    inherited_keys = tuple(
        (center, frozenset(required)) for center, required in EXPECTED_REUSED_REQUIREMENTS
    )
    inherited_before = {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    }
    assert tuple(inherited_before.values()) == EXPECTED_REUSED_PATTERN_VARIABLES
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        REPO_ROOT, install_instance, layout, parent, cell_index=6
    )
    assert {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    } == inherited_before
    assert tuple(
        install_instance.pattern_variables[(center, frozenset(required))]
        for center, required in EXPECTED_FRESH_REQUIREMENTS
    ) == EXPECTED_FRESH_PATTERN_VARIABLES
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )


def test_family_selection_is_cell6_only_and_fail_closed() -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
        match="no production apex/first-opposite/shared-pair/surplus family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
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
        Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError,
        match="installed family delta",
    ):
        install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )
    assert install_instance.cnf.n_variables == initial_n_variables
    assert tuple(install_instance.cnf.clauses) == initial_clauses
    assert install_instance.pattern_variables == initial_pattern_variables
    assert not getattr(
        install_instance,
        "_apex_first_opposite_shared_pair_surplus_common_five_"
        "membership_family_bank_installed",
        False,
    )
