from __future__ import annotations

import copy
from pathlib import Path

import pytest

import census.card_head.exact12_all_order_common_five_membership_family_bank as parent_family_bank_module
import census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    _admissible as _strict_admissible,
)
from census.card_head.exact12_all_order_common_five_membership_family_bank import (
    install_all_order_common_five_membership_family_bank,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
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
    EXPECTED_STRICT_ORBIT_ROLE_COUNT,
    EXPECTED_TRIPLE_REQUIREMENT_COUNT,
    EXPECTED_WIDENED_ORBIT_ROLE_COUNT,
    FAMILY_ID,
    Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
    _admissible_center_exchange,
    _expected_fresh_requirements,
    _lean_source_paths,
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources,
    build_center_exchange_all_order_common_five_membership_family_bank,
    family_patterns,
    family_roles,
    install_center_exchange_all_order_common_five_membership_family_bank,
    production_family_id_for_cell,
    validate_center_exchange_all_order_common_five_membership_family_bank,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json
from census.card_head.tests.test_exact12_all_order_common_five_membership_family_bank import (
    _parent as _all_order_parent,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CenterExchangeAllOrderCommonFiveCertificate.lean"
)
BRIDGE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CenterExchangeBoundaryOrderBridge.lean"
)


def _parent():
    instance, layout, v23_bank = _all_order_parent()
    parent = install_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, v23_bank, cell_index=6
    )
    return instance, layout, parent


@pytest.fixture(scope="module")
def bank_and_parent():
    instance, layout, parent = _parent()
    bank = build_center_exchange_all_order_common_five_membership_family_bank(
        REPO_ROOT, instance, layout, parent, cell_index=6
    )
    return bank, instance, layout, parent


def test_roles_and_frozen_payload(bank_and_parent) -> None:
    bank, _instance, _layout, parent = bank_and_parent
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_center_exchange_all_order_common_five_membership_"
        "family_bank.v1"
    )
    assert FAMILY_ID == "center-exchange-all-order-common-five-label-general-abcxy.v1"
    assert family_roles()[0] == (0, 1, 7, 6, 8)
    assert family_roles()[-1] == (11, 10, 8, 7, 9)
    assert DOMINANT_CORE == (5, 11, 7, 6, 8)
    assert DOMINANT_CORE in family_roles()
    assert EXPECTED_WIDENED_ORBIT_ROLE_COUNT == 19_612
    assert EXPECTED_STRICT_ORBIT_ROLE_COUNT == 15_588
    assert (
        EXPECTED_STRICT_ORBIT_ROLE_COUNT
        == parent_family_bank_module.EXPECTED_FULL_ORBIT_ROLE_COUNT
    )
    assert EXPECTED_FULL_ORBIT_ROLE_COUNT == 4_024
    assert (
        EXPECTED_WIDENED_ORBIT_ROLE_COUNT - EXPECTED_STRICT_ORBIT_ROLE_COUNT
        == EXPECTED_FULL_ORBIT_ROLE_COUNT
    )
    assert EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT == 1_878
    assert EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT == 617
    assert EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT == 1_261
    assert (
        len(family_roles())
        == EXPECTED_PATTERN_COUNT
        == EXPECTED_ROLE_COUNT
        == 2_546
    )
    assert _sha256_json(
        [{"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in family_roles()]
    ) == EXPECTED_ROLES_SHA256 == (
        "3c0b4d11dde446726aab949c61c1f5663229ddd079976f275e70158bbbcacec6"
    )
    assert family_patterns()[0] == (
        {"center": 6, "support": [0, 1]},
        {"center": 8, "support": [0, 1]},
        {"center": 7, "support": [1, 6, 8]},
    )
    assert family_patterns()[-1] == (
        {"center": 7, "support": [11, 10]},
        {"center": 9, "support": [11, 10]},
        {"center": 8, "support": [10, 7, 9]},
    )
    compiled = bank["compiled"]
    assert len(bank["entries"]) == EXPECTED_PATTERN_COUNT == 2_546
    assert (
        len(compiled["pattern_definitions"])
        == EXPECTED_DEFINITION_COUNT
        == 1_373
    )
    assert EXPECTED_LOGICAL_REQUIREMENT_COUNT == 1_373
    assert EXPECTED_PAIR_REQUIREMENT_COUNT == 557
    assert EXPECTED_TRIPLE_REQUIREMENT_COUNT == 816
    assert (
        len(
            [
                item
                for item in compiled["pattern_definitions"]
                if len(item["required"]) == 2
            ]
        )
        == 557
    )
    assert (
        len(
            [
                item
                for item in compiled["pattern_definitions"]
                if len(item["required"]) == 3
            ]
        )
        == 816
    )
    reused = [item for item in compiled["pattern_definitions"] if item["reused"]]
    fresh = [item for item in compiled["pattern_definitions"] if not item["reused"]]
    assert len(reused) == EXPECTED_REUSED_REQUIREMENT_COUNT == 1_335
    assert len(fresh) == EXPECTED_FRESH_REQUIREMENT_COUNT == 38
    assert compiled["final_n_variables"] == EXPECTED_FINAL_VARIABLES == 47_174
    assert compiled["final_n_clauses"] == EXPECTED_FINAL_CLAUSES == 679_351
    assert len(compiled["delta_clauses"]) == 3_204
    assert compiled["delta_sha256"] == EXPECTED_DELTA_SHA256 == (
        "707c8bec87a8eaa29edf46737f36d1f6a13ce4d091e5434ff6bcb5e30f0b99b9"
    )
    assert compiled["final_dimacs_sha256"] == EXPECTED_FINAL_DIMACS_SHA256 == (
        "ef94a6d4624b242a77195455d312a8e7f880e3fe547882b23c67d0359ce4d759"
    )
    assert compiled["compiled_sha256"] == EXPECTED_COMPILED_SHA256 == (
        "78367e2b0c9689ffc7d6b2137a395f3c9a35faea3a05bcaa5ebb1c6db4252c67"
    )
    assert bank["bank_sha256"] == EXPECTED_BANK_SHA256 == (
        "701f3f768ed6d65fe1419561d36ef275f8dc188eded83e44b8b4add56ab7e362"
    )
    assert parent["bank_sha256"] == family_bank_module.EXPECTED_PARENT_BANK_SHA256
    assert bank["claims"] == {
        "terminal_unsat": False,
        "lean_terminal_ingress_ready": False,
        "aggregate_placement_coverage": False,
        "universal_lift": False,
        "live_theorem_closure": False,
    }


def test_delta_orbit_counts_match_frozen_pins() -> None:
    widened = 0
    strict = 0
    delta = 0
    for a in range(12):
        for b in range(12):
            for c in range(12):
                for x in range(12):
                    for y in range(x + 1, 12):
                        if not _admissible_center_exchange(a, x, b, c, y):
                            continue
                        widened += 1
                        if _strict_admissible(a, x, b, c, y) or _strict_admissible(
                            a, y, b, c, x
                        ):
                            strict += 1
                        else:
                            delta += 1
    assert widened == EXPECTED_WIDENED_ORBIT_ROLE_COUNT == 19_612
    assert strict == EXPECTED_STRICT_ORBIT_ROLE_COUNT == 15_588
    assert delta == EXPECTED_FULL_ORBIT_ROLE_COUNT == 4_024


def test_v24_core_pattern_installed(bank_and_parent) -> None:
    bank, _instance, _layout, _parent_bank = bank_and_parent
    assert DOMINANT_CORE == (5, 11, 7, 6, 8)
    assert DOMINANT_CORE in family_roles()
    assert {"a": 5, "b": 11, "c": 7, "x": 6, "y": 8} in bank["roles"]
    assert (
        {"center": 6, "support": [5, 11]},
        {"center": 8, "support": [5, 11]},
        {"center": 7, "support": [11, 6, 8]},
    ) in family_patterns()
    assert [
        {"center": 6, "support": [5, 11]},
        {"center": 8, "support": [5, 11]},
        {"center": 7, "support": [11, 6, 8]},
    ] in bank["patterns"]


def test_no_installed_pattern_passes_strict_rule() -> None:
    for a, b, c, x, y in family_roles():
        assert _admissible_center_exchange(a, x, b, c, y)
        assert not _strict_admissible(a, x, b, c, y)
        assert not _strict_admissible(a, y, b, c, x)


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
        range(47_137, 47_175)
    )
    assert tuple(fresh_python.values()) == _expected_fresh_requirements()
    assert tuple(reused_python) == EXPECTED_REUSED_PATTERN_VARIABLES
    assert tuple(reused_python.values()) == EXPECTED_REUSED_REQUIREMENTS
    python_blocks = tuple(
        tuple(entry["blocking_clause"]) for entry in bank["compiled"]["entries"]
    )
    assert len(python_blocks) == 2_546
    assert all(len(block) == 3 for block in python_blocks)
    assert len(set(python_blocks)) == 2_546


def test_source_manifest_and_tampering_fail_closed(bank_and_parent) -> None:
    bank, instance, layout, parent = bank_and_parent
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert BRIDGE_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)
    manifest_paths = [record["path"] for record in bank["source_manifest"]]
    assert CERTIFICATE_PATH in manifest_paths
    assert BRIDGE_PATH in manifest_paths
    assert family_bank_module.ORDER_SOURCE_PATH in manifest_paths
    assert family_bank_module.COMPILER_SOURCE_PATH in manifest_paths
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
        REPO_ROOT, bank
    )
    tampered = copy.deepcopy(bank)
    tampered["roles"][0]["y"] = 4
    with pytest.raises(
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
        match="live authenticated rebuild",
    ):
        validate_center_exchange_all_order_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent, tampered, cell_index=6
        )
    tampered = copy.deepcopy(bank)
    tampered["source_manifest"][0]["bytes"] += 1
    with pytest.raises(
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
        match="source bytes or hashes drifted",
    ):
        attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
            REPO_ROOT, tampered
        )


def test_install_reuse_selection_and_transaction_rollback(
    bank_and_parent, monkeypatch
) -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
        match="no production center-exchange all-order common-five family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
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
    install_center_exchange_all_order_common_five_membership_family_bank(
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
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError,
        match="installed center-exchange all-order common-five family differs",
    ):
        install_center_exchange_all_order_common_five_membership_family_bank(
            REPO_ROOT, failed_instance, layout, parent, cell_index=6
        )
    assert failed_instance.cnf.n_variables == initial_variables
    assert tuple(failed_instance.cnf.clauses) == initial_clauses
    assert failed_instance.pattern_variables == initial_patterns
