from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

import census.card_head.exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import (
    _sha256_json,
)
from census.card_head.exact12_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA,
    EXPECTED_BANK_SHA256,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
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
    Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
    _lean_source_paths,
    attest_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_live_sources,
    build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.tests.test_exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    _parent as _v20_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf.lean"
)
REUSED_CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveMembershipFamilyCnf.lean"
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


def _lean_blocking_clauses(path: Path) -> tuple[tuple[int, int, int, int], ...]:
    source = path.read_text(encoding="utf-8")
    theorem_body = source.split("theorem blockingClauses_eq :", 1)[1].split(
        ":= by", 1
    )[0]
    clauses = re.findall(
        r"\[(?P<clause>-\d+\s*,\s*-\d+\s*,\s*-\d+\s*,\s*-\d+)\]",
        theorem_body,
    )
    return tuple(
        tuple(int(literal) for literal in clause.split(","))  # type: ignore[misc]
        for clause in clauses
    )


def _lean_implication_clauses(path: Path) -> tuple[tuple[int, int], ...]:
    source = path.read_text(encoding="utf-8")
    theorem_body = source.split("theorem implicationDimacs_eq :", 1)[1].split(
        ":= by", 1
    )[0]
    clauses = re.findall(
        r"\[(?P<clause>-\d+\s*,\s*\d+)\]",
        theorem_body,
    )
    return tuple(
        tuple(int(literal) for literal in clause.split(","))  # type: ignore[misc]
        for clause in clauses
    )


def _parent():
    instance, layout, v19_parent = _v20_parent()
    v20_bank = (
        build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, v19_parent, cell_index=6
        )
    )
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v19_parent, cell_index=6
    )
    return instance, layout, v20_bank


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_reuse_aware_payload(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_reciprocal_first_opposite_surplus_second_"
        "opposite_common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == (
        "reciprocal-first-opposite-surplus-second-opposite-common-five-"
        "a1011-x345-c6789.v1"
    )
    assert family_roles() == tuple(
        (a, x, c)
        for a in (10, 11)
        for x in (3, 4, 5)
        for c in (6, 7, 8, 9)
    )
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT == 24
    assert _sha256_json(
        [{"a": a, "x": x, "c": c} for a, x, c in family_roles()]
    ) == EXPECTED_ROLES_SHA256
    assert family_patterns()[0] == (
        {"center": 10, "support": [2, 3]},
        {"center": 2, "support": [10, 3]},
        {"center": 0, "support": [2, 10]},
        {"center": 6, "support": [2, 3]},
        {"center": 6, "support": [0, 2]},
    )
    assert family_patterns()[-1] == (
        {"center": 11, "support": [2, 5]},
        {"center": 2, "support": [11, 5]},
        {"center": 0, "support": [2, 11]},
        {"center": 9, "support": [2, 5]},
        {"center": 9, "support": [0, 2]},
    )

    compiled = bank["compiled"]
    definitions = compiled["pattern_definitions"]
    assert len(definitions) == EXPECTED_DEFINITION_COUNT
    assert len(definitions) == EXPECTED_LOGICAL_REQUIREMENT_COUNT
    assert sum(bool(item["reused"]) for item in definitions) == len(
        EXPECTED_REUSED_REQUIREMENTS
    )
    assert sum(not bool(item["reused"]) for item in definitions) == len(
        EXPECTED_FRESH_REQUIREMENTS
    )
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES
    assert len(compiled["delta_clauses"]) == 144
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256
    assert bank["roles_sha256"] == EXPECTED_ROLES_SHA256
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }


def test_python_bindings_and_blocks_match_lean(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    definitions = bank["compiled"]["pattern_definitions"]
    fresh_python = {
        item["pattern_variable"]: (item["center"], tuple(item["required"]))
        for item in definitions
        if not item["reused"]
    }
    reused_python = {
        item["pattern_variable"]: (item["center"], tuple(item["required"]))
        for item in definitions
        if item["reused"]
    }
    assert tuple(fresh_python) == EXPECTED_FRESH_PATTERN_VARIABLES
    assert tuple(reused_python) == EXPECTED_REUSED_PATTERN_VARIABLES
    assert tuple(fresh_python.values()) == EXPECTED_FRESH_REQUIREMENTS
    assert tuple(reused_python.values()) == EXPECTED_REUSED_REQUIREMENTS

    assert _lean_mk_definition_bindings(REPO_ROOT / CNF_PATH) == fresh_python
    reused_variables = set(EXPECTED_REUSED_PATTERN_VARIABLES)
    inherited_lean = {
        variable: binding
        for variable, binding in _lean_mk_definition_bindings(
            REPO_ROOT / REUSED_CNF_PATH
        ).items()
        if variable in reused_variables
    }
    assert inherited_lean == reused_python
    python_implications = tuple(
        tuple(clause)
        for definition in definitions
        if not definition["reused"]
        for clause in definition["implication_clauses"]
    )
    assert len(python_implications) == 120
    assert _lean_implication_clauses(REPO_ROOT / CNF_PATH) == python_implications
    assert _lean_blocking_clauses(REPO_ROOT / CNF_PATH) == tuple(
        tuple(entry["blocking_clause"])
        for entry in bank["compiled"]["entries"]
    )


def test_source_manifest_and_tampering_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    manifest_paths = tuple(record["path"] for record in bank["source_manifest"])
    assert CERTIFICATE_PATH in manifest_paths
    assert CNF_PATH in manifest_paths
    attest_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )

    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["c"] = 7
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )

    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_reuses_parent_variables_and_is_fail_closed(bank_and_parent) -> None:
    _bank, instance, layout, parent = bank_and_parent
    install_instance = copy.deepcopy(instance)
    inherited_keys = tuple(
        (center, frozenset(required)) for center, required in EXPECTED_REUSED_REQUIREMENTS
    )
    inherited_before = {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    }
    install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
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
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="already installed",
    ):
        install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )


def test_compile_rejects_requirement_without_candidate_realization(
    bank_and_parent,
) -> None:
    _bank, instance, _layout, _parent = bank_and_parent
    malformed = copy.deepcopy(instance)
    malformed.candidates[0] = ()
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="no candidate realization",
    ):
        family_bank_module._compile(malformed)


def test_selection_and_failed_installation_rollback(bank_and_parent, monkeypatch) -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="no production reciprocal common-five family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)

    _bank, instance, layout, parent = bank_and_parent
    install_instance = copy.deepcopy(instance)
    initial_n_variables = install_instance.cnf.n_variables
    initial_clauses = tuple(install_instance.cnf.clauses)
    initial_pattern_variables = dict(install_instance.pattern_variables)
    original_compile = family_bank_module._compile

    def compile_with_install_drift(target):
        compiled = original_compile(target)
        if target is install_instance:
            compiled = copy.deepcopy(compiled)
            compiled["final_n_clauses"] += 1
        return compiled

    monkeypatch.setattr(family_bank_module, "_compile", compile_with_install_drift)
    with pytest.raises(
        Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError,
        match="installed reciprocal family differs from its authenticated bank",
    ):
        install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
            REPO_ROOT, install_instance, layout, parent, cell_index=6
        )
    assert install_instance.cnf.n_variables == initial_n_variables
    assert tuple(install_instance.cnf.clauses) == initial_clauses
    assert install_instance.pattern_variables == initial_pattern_variables
    assert not getattr(
        install_instance,
        "_reciprocal_first_opposite_surplus_second_opposite_common_five_"
        "membership_family_bank_installed",
        False,
    )
