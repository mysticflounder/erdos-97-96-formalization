# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated exact-12 apex-internal shared-pair common-five family.

The 36 source-valid role assignments are sorted by ``(a, x, b, c, y)`` and
compile the positive rows ``x:{a,b}``, ``y:{a,b}``, and ``c:{b,x,y}``.
Twenty-four requirements are already present in the apex-shared-pair parent;
the remaining 36 requirements receive fresh variables.  The role bank keeps
all 36 assignments, including the twelve duplicate blocking clauses induced by
swapping ``x`` and ``y``.  This is finite proof-backed infrastructure only.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_shared_pair_cross_block_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_shared_pair_cross_block_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_shared_pair_cross_block_membership_family_bank import (
    Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
    attest_apex_shared_pair_cross_block_membership_family_bank_live_sources,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    Exact12PositiveMembershipSourceOrderBankError,
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_apex_internal_shared_pair_common_five_"
    "membership_family_bank.v1"
)
FAMILY_ID = "apex-internal-shared-pair-common-five-a6789-b345-c6789.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_INTERNAL_SHARED_PAIR_COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_126
EXPECTED_PARENT_CLAUSES = 639_242
EXPECTED_PARENT_DIMACS_SHA256 = (
    "a141b3223365f27eaa4d5b583293986b602e0b3f5467e7d74f319a24d5782d75"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "b98864239b86c3de94c51b05fa81860549607b4cde31e1ee92af36b4b5e13b88"
)
EXPECTED_FINAL_VARIABLES = 45_162
EXPECTED_FINAL_CLAUSES = 640_454
EXPECTED_FINAL_DIMACS_SHA256 = (
    "34e2a2d14aaa2ca93cf71af94f5f3e19f4bb67ae106d9c9cdff33d1c582d182e"
)
EXPECTED_DELTA_SHA256 = (
    "55bac342e4e178e27d9b2fbbe863812d87935a64d15108f04cd027144cb7a705"
)
EXPECTED_COMPILED_SHA256 = (
    "23b07449e37accf9cd161d2913aaa3bbe6993f01acccbd2acb159776cd5e6f92"
)
EXPECTED_ROLES_SHA256 = (
    "d97c470d4600181c8f55cb043528c7849a4f1506627e362585df695719cfabab"
)
EXPECTED_PATTERN_COUNT = 36
EXPECTED_DEFINITION_COUNT = 36
EXPECTED_REUSED_REQUIREMENT_COUNT = 24
EXPECTED_DUPLICATE_BLOCK_COUNT = 12

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf.lean"
    ),
)


class Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            f"no production apex-internal shared-pair family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    """Return all 36 valid roles in lexicographic ``(a,x,b,c,y)`` order."""

    return tuple(
        sorted(
            (a, x, b, c, y)
            for a in (6, 7, 8, 9)
            for x in (6, 7, 8, 9)
            for b in (3, 4, 5)
            for c in (6, 7, 8, 9)
            for y in (6, 7, 8, 9)
            if len({a, x, c, y}) == 4
            and ((a < x and c < y) or (x < a and y < c))
        )
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return the 36 role-ordered positive-membership patterns."""

    return tuple(
        (
            {"center": x, "support": [a, b]},
            {"center": y, "support": [a, b]},
            {"center": c, "support": [b, x, y]},
        )
        for a, x, b, c, y in family_roles()
    )


def _parent_record(
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
) -> dict[str, Any]:
    bank_body = dict(parent_bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    if (
        not isinstance(layout, StaticConvexLayout)
        or parent_bank.get("schema") != PARENT_BANK_SCHEMA
        or parent_bank.get("family_id") != PARENT_FAMILY_ID
        or bank_sha256 != EXPECTED_PARENT_BANK_SHA256
        or _sha256_json(bank_body) != bank_sha256
        or instance.cnf.n_variables != EXPECTED_PARENT_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_PARENT_CLAUSES
        or dimacs_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or not getattr(
            instance,
            "_apex_shared_pair_cross_block_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_internal_shared_pair_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-apex-shared-pair parent"
        )
    return {
        "schema": PARENT_BANK_SCHEMA,
        "family_id": PARENT_FAMILY_ID,
        "bank_sha256": bank_sha256,
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": dimacs_sha256,
        "layout_manifest_sha256": _sha256_json(layout.manifest()),
    }


def _compile_reusing_parent_requirements(
    instance: SourceFaithfulCoverInstance,
) -> dict[str, Any]:
    patterns = family_patterns()
    normalized = tuple(normalize_memberships(12, choices) for choices in patterns)
    if len(normalized) != EXPECTED_PATTERN_COUNT:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "role pattern count drifted"
        )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    reused = 0
    for center, required in requirements:
        key = (center, frozenset(required))
        was_installed = key in instance.pattern_variables
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        variables[(center, required)] = variable
        if was_installed:
            reused += 1
            continue
        implications = tuple(instance.cnf.clauses[before:])
        candidate_indices = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if set(required) <= set(candidate)
        ]
        candidate_variables = tuple(
            instance.choice_variables[(center, index)] for index in candidate_indices
        )
        expected = tuple((-choice_variable, variable) for choice_variable in candidate_variables)
        if implications != expected:
            raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
                "pattern implication compiler drifted"
            )
        definitions.append(
            {
                "center": center,
                "required": list(required),
                "pattern_variable": variable,
                "candidate_indices": candidate_indices,
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )
    if reused != EXPECTED_REUSED_REQUIREMENT_COUNT or len(definitions) != EXPECTED_DEFINITION_COUNT:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "parent reuse or fresh definition count drifted"
        )
    entries: list[dict[str, Any]] = []
    blocks: list[tuple[int, ...]] = []
    for index, pattern in enumerate(normalized):
        block = tuple(-variables[item] for item in pattern)
        instance.cnf.add_clause(block)
        blocks.append(block)
        requirements_payload = [
            {"center": center, "required": list(required)}
            for center, required in pattern
        ]
        entries.append(
            {
                "index": index,
                "requirements": requirements_payload,
                "requirements_sha256": _sha256_json(requirements_payload),
                "blocking_clause": list(block),
                "blocking_clause_sha256": _sha256_json(block),
            }
        )
    duplicate_blocks = len(blocks) - len(set(blocks))
    if duplicate_blocks != EXPECTED_DUPLICATE_BLOCK_COUNT:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "duplicate role-block count drifted"
        )
    delta = tuple(instance.cnf.clauses[initial_clauses:])
    compiled = {
        "schema": MEMBERSHIP_CNF_SCHEMA,
        "pattern_keys": [
            [
                {"center": center, "required": list(required)}
                for center, required in pattern
            ]
            for pattern in normalized
        ],
        "pattern_definitions": definitions,
        "entries": entries,
        "initial_n_variables": initial_variables,
        "initial_n_clauses": initial_clauses,
        "final_n_variables": instance.cnf.n_variables,
        "final_n_clauses": len(instance.cnf.clauses),
        "delta_clauses": [list(clause) for clause in delta],
        "delta_sha256": _sha256_json(delta),
    }
    return compiled


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = _compile_reusing_parent_requirements(working)
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or compiled["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
        or compiled["delta_sha256"] != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "compiled apex-internal shared-pair family differs from frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "compiled apex-internal shared-pair payload hash drifted"
        )
    return compiled


def build_apex_internal_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [list(role) for role in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair role hash drifted"
        )
    try:
        source_manifest = [
            _source_record(repo_root.resolve(), path)
            for path in sorted(
                (*LEAN_SOURCE_PATHS, COMPILER_SOURCE_PATH, HELPER_SOURCE_PATH)
            )
        ]
    except Exact12PositiveMembershipSourceOrderBankError as exc:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair source manifest is not live-complete"
        ) from exc
    body = {
        "schema": BANK_SCHEMA,
        "family_id": family_id,
        "cell_index": cell_index,
        "semantic_status": SEMANTIC_STATUS,
        "claims": {
            "terminal_unsat": False,
            "lean_terminal_ingress_ready": False,
            "aggregate_placement_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
        "parent_apex_shared_pair_cross_block_bank": parent,
        "apex_shared_pair_cross_block_bank": copy.deepcopy(dict(parent_bank)),
        "roles": roles,
        "roles_sha256": _sha256_json(roles),
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "duplicate_block_count": EXPECTED_DUPLICATE_BLOCK_COUNT,
        "source_manifest": source_manifest,
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    bank_body = dict(bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    if not isinstance(bank_sha256, str) or _sha256_json(bank_body) != bank_sha256:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair bank hash drifted"
        )
    parent = bank.get("apex_shared_pair_cross_block_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "embedded apex-shared-pair bank is malformed"
        )
    try:
        attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12ApexSharedPairCrossBlockMembershipFamilyBankError as exc:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "embedded apex-shared-pair sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    expected_paths = sorted(
        (*LEAN_SOURCE_PATHS, COMPILER_SOURCE_PATH, HELPER_SOURCE_PATH)
    )
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
        or len(manifest) != len(expected_paths)
    ):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
                "apex-internal shared-pair source bytes or hashes drifted"
            )


def validate_apex_internal_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair family bank is not a mapping"
        )
    fresh = build_apex_internal_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair family differs from live authenticated rebuild"
        )


def install_apex_internal_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_apex_internal_shared_pair_common_five_membership_family_bank_installed",
        False,
    ):
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "apex-internal shared-pair family is already installed"
        )
    bank = build_apex_internal_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_internal_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
    )
    compiled = _compile_reusing_parent_requirements(instance)
    expected = copy.deepcopy(bank["compiled"])
    expected.pop("compiled_sha256")
    expected.pop("final_dimacs_sha256")
    if compiled != expected:
        raise Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError(
            "installed family delta differs from authenticated bank"
        )
    instance._apex_internal_shared_pair_common_five_membership_family_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "EXPECTED_COMPILED_SHA256",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_DUPLICATE_BLOCK_COUNT",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "FAMILY_ID",
    "Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError",
    "attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources",
    "build_apex_internal_shared_pair_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_internal_shared_pair_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_internal_shared_pair_common_five_membership_family_bank",
]
