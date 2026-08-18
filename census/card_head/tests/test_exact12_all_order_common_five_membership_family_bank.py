from __future__ import annotations

import copy
import re
from pathlib import Path

import pytest

import census.card_head.exact12_all_order_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA,
    DOMINANT_CORE,
    EXPECTED_BANK_SHA256,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_PATTERN_VARIABLES,
    EXPECTED_FRESH_REQUIREMENT_COUNT,
    EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT,
    EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT,
    EXPECTED_FULL_ORBIT_ROLE_COUNT,
    EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PAIR_REQUIREMENT_COUNT,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_REUSED_PATTERN_VARIABLES,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    EXPECTED_REUSED_REQUIREMENTS,
    EXPECTED_ROLE_COUNT,
    EXPECTED_ROLES_SHA256,
    EXPECTED_TRIPLE_REQUIREMENT_COUNT,
    FAMILY_ID,
    Exact12AllOrderCommonFiveMembershipFamilyBankError,
    _expected_fresh_requirements,
    _lean_source_paths,
    attest_all_order_common_five_membership_family_bank_live_sources,
    build_all_order_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_all_order_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_all_order_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank,
)
from census.card_head.tests.test_exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    _parent as _three_triad_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221AllOrderCommonFiveCertificate.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221AllOrderCommonFiveMembershipFamilyCnf.lean"
)

# The generated module holds mkDefinition entries in chunked list
# literals, not one named def per definition, so the bindings parser is
# region-scoped: fresh chunks, then reused chunks, then familyData.
_LEAN_MK_DEFINITION_RE = re.compile(
    r"mkDefinition\s+(?P<variable>[0-9]+)\s+(?P<center>[0-9]+)\s*"
    r"\{(?P<support>[0-9, \t]*)\}"
)
_LEAN_ROLE_RE = re.compile(
    r"\{a := (?P<a>[0-9]+), b := (?P<b>[0-9]+), c := (?P<c>[0-9]+), "
    r"x := (?P<x>[0-9]+), y := (?P<y>[0-9]+)\}"
)


def _lean_region(source: str, start: str, end: str) -> str:
    start_index = source.index(start)
    end_index = source.index(end, start_index)
    return source[start_index:end_index]


def _lean_definition_bindings(
    region: str,
) -> tuple[tuple[int, tuple[int, tuple[int, ...]]], ...]:
    return tuple(
        (
            int(declaration.group("variable")),
            (
                int(declaration.group("center")),
                tuple(
                    sorted(
                        int(label)
                        for label in declaration.group("support").split(",")
                        if label.strip()
                    )
                ),
            ),
        )
        for declaration in _LEAN_MK_DEFINITION_RE.finditer(region)
    )


def _lean_clauses(path: Path, kind: str, arity: int) -> tuple[tuple[int, ...], ...]:
    source = path.read_text(encoding="utf-8")
    marker = rf"/- (BEGIN|END) GENERATED {kind} CLAUSE ANCHORS? -/"
    sections = list(re.finditer(marker, source))
    assert len(sections) == 2
    body = source[sections[0].end() : sections[1].start()]
    pattern = r"\[(?P<clause>" + r"\s*,\s*".join([r"-?[0-9]+"] * arity) + r")\]"
    return tuple(
        tuple(int(literal) for literal in match.group("clause").split(","))
        for match in re.finditer(pattern, body)
    )


def _parent():
    instance, layout, v22_bank = _three_triad_parent()
    parent = install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
        REPO_ROOT, instance, layout, v22_bank, cell_index=6
    )
    return instance, layout, parent


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_payload(bank_and_parent) -> None:
    bank, _instance, _layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_all_order_common_five_membership_family_bank.v1"
    )
    assert FAMILY_ID == "all-order-common-five-label-general-abcxy.v1"
    assert family_roles()[0] == (0, 1, 0, 2, 3)
    assert family_roles()[-1] == (11, 10, 11, 8, 9)
    assert DOMINANT_CORE == (1, 7, 6, 9, 11)
    assert DOMINANT_CORE in family_roles()
    assert EXPECTED_FULL_ORBIT_ROLE_COUNT == 15_588
    assert EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT == 2_585
    assert EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT == 641
    assert EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT == 1_944
    assert len(family_roles()) == EXPECTED_PATTERN_COUNT == EXPECTED_ROLE_COUNT == 11_052
    assert _sha256_json(
        [{"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256 == (
        "7c5d4985772d96146f08d93061c6a661e1b70b6e21ae9e70261c7c555d8dd9b6"
    )
    assert family_patterns()[0] == (
        {"center": 2, "support": [0, 1]},
        {"center": 3, "support": [0, 1]},
        {"center": 0, "support": [1, 2, 3]},
    )
    assert family_patterns()[-1] == (
        {"center": 8, "support": [11, 10]},
        {"center": 9, "support": [11, 10]},
        {"center": 11, "support": [10, 8, 9]},
    )
    compiled = bank["compiled"]
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT == 11_052
    assert len(compiled["pattern_definitions"]) == EXPECTED_DEFINITION_COUNT == 2_230
    assert EXPECTED_LOGICAL_REQUIREMENT_COUNT == 2_230
    assert EXPECTED_PAIR_REQUIREMENT_COUNT == 603
    assert EXPECTED_TRIPLE_REQUIREMENT_COUNT == 1_627
    assert (
        len(
            [
                item
                for item in compiled["pattern_definitions"]
                if len(item["required"]) == 2
            ]
        )
        == 603
    )
    assert (
        len(
            [
                item
                for item in compiled["pattern_definitions"]
                if len(item["required"]) == 3
            ]
        )
        == 1_627
    )
    reused = [item for item in compiled["pattern_definitions"] if item["reused"]]
    fresh = [item for item in compiled["pattern_definitions"] if not item["reused"]]
    assert len(reused) == EXPECTED_REUSED_REQUIREMENT_COUNT == 583
    assert len(fresh) == EXPECTED_FRESH_REQUIREMENT_COUNT == 1_647
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 47_136
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 676_147
    assert len(compiled["delta_clauses"]) == 30_044
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256 == (
        "df88eb0c2a5eed985c79f1173e7b97aad7b5de1a47354719733787ca4717255b"
    )
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256 == (
        "f6109195cea858ae0e0a179a9ccd4118118bb3e786d1169e40a94e399435166b"
    )
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256 == (
        "54c666518e5a547af921bb5c611e82469486e4a4dd779146453a4f5e2f61a058"
    )
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256 == (
        "249fc7633e167d916e3383bb8d978bd290b816c4eb92143146888dad09a6b7a3"
    )
    assert parent["bank_sha256"] == family_bank_module.EXPECTED_PARENT_BANK_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }


def test_bindings_and_variable_ranges(bank_and_parent) -> None:
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
    assert tuple(fresh_python) == EXPECTED_FRESH_PATTERN_VARIABLES == tuple(
        range(45_490, 47_137)
    )
    assert tuple(fresh_python.values()) == _expected_fresh_requirements()
    assert tuple(reused_python) == EXPECTED_REUSED_PATTERN_VARIABLES
    assert tuple(reused_python.values()) == EXPECTED_REUSED_REQUIREMENTS
    python_blocks = tuple(
        tuple(entry["blocking_clause"]) for entry in bank["compiled"]["entries"]
    )
    assert len(python_blocks) == 11_052
    assert all(len(block) == 3 for block in python_blocks)
    assert len(set(python_blocks)) == 11_052


def test_python_bindings_implications_blocks_and_roles_match_lean(
    bank_and_parent,
) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    definitions = bank["compiled"]["pattern_definitions"]
    fresh_python = tuple(
        (item["pattern_variable"], (item["center"], tuple(item["required"])))
        for item in definitions
        if not item["reused"]
    )
    reused_python = tuple(
        (item["pattern_variable"], (item["center"], tuple(item["required"])))
        for item in definitions
        if item["reused"]
    )
    source = (REPO_ROOT / CNF_PATH).read_text(encoding="utf-8")
    fresh_region = _lean_region(
        source, "def freshDefinitionsChunk000", "def reusedDefinitionsChunk000"
    )
    reused_region = _lean_region(
        source, "def reusedDefinitionsChunk000", "def definitions :"
    )
    assert _lean_definition_bindings(fresh_region) == fresh_python
    assert _lean_definition_bindings(reused_region) == reused_python
    python_implications = tuple(
        tuple(clause)
        for definition in definitions
        if not definition["reused"]
        for clause in definition["implication_clauses"]
    )
    assert len(python_implications) == 18_992
    assert _lean_clauses(REPO_ROOT / CNF_PATH, "IMPLICATION", 2) == python_implications
    python_blocks = tuple(
        tuple(entry["blocking_clause"]) for entry in bank["compiled"]["entries"]
    )
    assert len(python_blocks) == 11_052
    assert _lean_clauses(REPO_ROOT / CNF_PATH, "BLOCKING", 3) == python_blocks
    role_region = _lean_region(source, "def familyDataChunk000", "def familyData :")
    lean_roles = tuple(
        (
            int(record.group("a")),
            int(record.group("b")),
            int(record.group("c")),
            int(record.group("x")),
            int(record.group("y")),
        )
        for record in _LEAN_ROLE_RE.finditer(role_region)
    )
    assert lean_roles == family_roles()


def test_source_manifest_and_tampering_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert CNF_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)
    manifest_paths = [record["path"] for record in bank["source_manifest"]]
    assert family_bank_module.ORDER_SOURCE_PATH in manifest_paths
    assert family_bank_module.COMPILER_SOURCE_PATH in manifest_paths
    attest_all_order_common_five_membership_family_bank_live_sources(REPO_ROOT, bank)
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["y"] = 4
    with pytest.raises(
        Exact12AllOrderCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12AllOrderCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_all_order_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_reuse_selection_and_transaction_rollback(
    bank_and_parent, monkeypatch
) -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12AllOrderCommonFiveMembershipFamilyBankError,
        match="no production all-order common-five family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12AllOrderCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)

    _bank, instance, layout, parent = bank_and_parent
    install_instance = copy.deepcopy(instance)
    inherited_keys = tuple(
        (center, frozenset(required))
        for center, required in EXPECTED_REUSED_REQUIREMENTS
    )
    inherited_before = {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    }
    install_all_order_common_five_membership_family_bank(
        REPO_ROOT, install_instance, layout, parent, cell_index=6
    )
    assert {
        key: install_instance.pattern_variables[key] for key in inherited_keys
    } == inherited_before
    assert tuple(
        install_instance.pattern_variables[(center, frozenset(required))]
        for center, required in _expected_fresh_requirements()
    ) == EXPECTED_FRESH_PATTERN_VARIABLES

    failed_instance = copy.deepcopy(instance)
    initial_variables = failed_instance.cnf.n_variables
    initial_clauses = tuple(failed_instance.cnf.clauses)
    initial_patterns = dict(failed_instance.pattern_variables)
    original_compile = family_bank_module._compile

    def compile_with_drift(target):
        compiled = original_compile(target)
        if target is failed_instance:
            compiled = copy.deepcopy(compiled)
            compiled["final_n_clauses"] += 1
        return compiled

    monkeypatch.setattr(family_bank_module, "_compile", compile_with_drift)
    with pytest.raises(
        Exact12AllOrderCommonFiveMembershipFamilyBankError,
        match="installed all-order common-five family differs",
    ):
        install_all_order_common_five_membership_family_bank(
            REPO_ROOT, failed_instance, layout, parent, cell_index=6
        )
    assert failed_instance.cnf.n_variables == initial_variables
    assert tuple(failed_instance.cnf.clauses) == initial_clauses
    assert failed_instance.pattern_variables == initial_patterns
