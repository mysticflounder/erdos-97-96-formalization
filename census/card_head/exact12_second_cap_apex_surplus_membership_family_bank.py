# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated second-cap/apex/surplus common-five family.

The next arm-static cell-6 survivor exposed the role pattern

    x,b,c are monotone distinct labels in {6,7,8,9}; y in {3,4,5},

with positive requirements ``x:{2,b}``, ``y:{2,b}``, and
``c:{x,b,y}``.  The checked Lean producer refutes all 24 assignments in every
source-entitled boundary order.  This module deterministically compiles that
family after the adjacent-apex cross-block parent.

This is a finite proof-backed refinement, not terminal UNSAT, aggregate
coverage, a universal lift, or live closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_adjacent_apex_cross_block_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_adjacent_apex_cross_block_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_adjacent_apex_cross_block_membership_family_bank import (
    Exact12AdjacentApexCrossBlockMembershipFamilyBankError,
    attest_adjacent_apex_cross_block_membership_family_bank_live_sources,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import (
    SCHEMA as MEMBERSHIP_CNF_SCHEMA,
)
from .exact12_positive_membership_cnf import (
    compile_fresh_positive_membership_extension,
)
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_second_cap_apex_surplus_membership_family_bank.v1"
)
FAMILY_ID = "second-cap-monotone-triple-apex2-surplus345.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_SECOND_CAP_APEX_SURPLUS_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 44_964
EXPECTED_PARENT_CLAUSES = 636_630
EXPECTED_PARENT_DIMACS_SHA256 = (
    "393c08c6837740304f9102020d6299a9fd0a6ac4879a87c3b48c9ab39a6038d9"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "884a38075fd029b951948ac50d1822dcec67d3e3af09f1aeb08716635790c9a1"
)
EXPECTED_FINAL_VARIABLES = 45_000
EXPECTED_FINAL_CLAUSES = 637_236
EXPECTED_FINAL_DIMACS_SHA256 = (
    "2a7a0f63bcbeb983d9019b87797ffb8fa4c1c644045a21c1e79141b631075f90"
)
EXPECTED_DELTA_SHA256 = (
    "4855eb70ff77277d5708a21c0115fbd55c009dd12624c176d73569cd6eab9d9f"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_DEFINITION_COUNT = 36

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SecondCapApexSurplusCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf.lean"
    ),
)


class Exact12SecondCapApexSurplusMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "second-cap/apex/surplus family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            f"no production second-cap/apex/surplus family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int, int], ...]:
    """Return the Lean-mirrored lexicographic ``(x,b,c,y)`` role order."""

    return tuple(
        (x, b, c, y)
        for x, b, c in (
            (6, 7, 8),
            (6, 7, 9),
            (6, 8, 9),
            (7, 8, 9),
            (8, 7, 6),
            (9, 7, 6),
            (9, 8, 6),
            (9, 8, 7),
        )
        for y in (3, 4, 5)
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all 24 checked positive-membership patterns."""

    return tuple(
        (
            {"center": x, "support": [2, b]},
            {"center": y, "support": [2, b]},
            {"center": c, "support": [x, b, y]},
        )
        for x, b, c, y in family_roles()
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
            "_adjacent_apex_cross_block_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_second_cap_apex_surplus_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "instance is not the frozen post-adjacent-apex parent"
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


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = compile_fresh_positive_membership_extension(
        working, family_patterns()
    ).as_dict()
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled.get("schema") != MEMBERSHIP_CNF_SCHEMA
        or len(compiled.get("pattern_keys", ())) != EXPECTED_PATTERN_COUNT
        or len(compiled.get("pattern_definitions", ()))
        != EXPECTED_DEFINITION_COUNT
        or len(compiled.get("entries", ())) != EXPECTED_PATTERN_COUNT
        or compiled.get("initial_n_variables") != EXPECTED_PARENT_VARIABLES
        or compiled.get("initial_n_clauses") != EXPECTED_PARENT_CLAUSES
        or compiled.get("final_n_variables") != EXPECTED_FINAL_VARIABLES
        or compiled.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES
        or compiled.get("delta_sha256") != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "compiled second-cap/apex/surplus family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    return compiled


def build_second_cap_apex_surplus_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_adjacent_apex_cross_block_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [
        {"x": x, "b": b, "c": c, "y": y}
        for x, b, c, y in family_roles()
    ]
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
        "parent_adjacent_apex_cross_block_bank": parent,
        "adjacent_apex_cross_block_bank": copy.deepcopy(dict(parent_bank)),
        "roles": roles,
        "roles_sha256": _sha256_json(roles),
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "source_manifest": [
            _source_record(repo_root.resolve(), path)
            for path in sorted(
                (*LEAN_SOURCE_PATHS, COMPILER_SOURCE_PATH, HELPER_SOURCE_PATH)
            )
        ],
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_second_cap_apex_surplus_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("adjacent_apex_cross_block_bank")
    if not isinstance(parent, Mapping):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "embedded adjacent-apex bank is malformed"
        )
    try:
        attest_adjacent_apex_cross_block_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12AdjacentApexCrossBlockMembershipFamilyBankError as exc:
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "embedded adjacent-apex sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "second-cap/apex/surplus source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
                "second-cap/apex/surplus source bytes or hashes drifted"
            )


def validate_second_cap_apex_surplus_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "second-cap/apex/surplus family bank is not a mapping"
        )
    fresh = build_second_cap_apex_surplus_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "second-cap/apex/surplus family differs from a live authenticated rebuild"
        )


def install_second_cap_apex_surplus_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_second_cap_apex_surplus_membership_family_bank_installed",
        False,
    ):
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "second-cap/apex/surplus family is already installed"
        )
    bank = build_second_cap_apex_surplus_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_second_cap_apex_surplus_membership_family_bank(
        repo_root,
        instance,
        layout,
        parent_bank,
        bank,
        cell_index=cell_index,
    )
    installed = compile_fresh_positive_membership_extension(
        instance, family_patterns()
    ).as_dict()
    expected = copy.deepcopy(bank["compiled"])
    expected.pop("compiled_sha256")
    expected.pop("final_dimacs_sha256")
    if installed != expected:
        raise Exact12SecondCapApexSurplusMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._second_cap_apex_surplus_membership_family_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "FAMILY_ID",
    "Exact12SecondCapApexSurplusMembershipFamilyBankError",
    "attest_second_cap_apex_surplus_membership_family_bank_live_sources",
    "build_second_cap_apex_surplus_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_second_cap_apex_surplus_membership_family_bank",
    "production_family_id_for_cell",
    "validate_second_cap_apex_surplus_membership_family_bank",
]
