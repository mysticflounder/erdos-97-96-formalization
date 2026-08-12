# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated exact-12 block-spanning positive-membership family.

The family contains every source-valid role assignment

    a in {6,7,8,9},  x,c in {3,4,5},  x != c,

for the generic block-spanning common-five theorem.  Its 24 Boolean blocks are
compiled together so shared membership definitions receive one canonical
variable allocation.  The fixed dimensions and delta hash agree with the Lean
CNF bridge and terminal consumer authenticated below.

This is a finite cell-1 cut family.  It does not claim terminal UNSAT,
all-placement coverage, a universal lift, or closure of a live theorem.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import compile_positive_membership_bank
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_block_spanning_membership_family_bank.v1"
FAMILY_ID = "block-spanning-a6789-xc345-distinct.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PROVED_BLOCK_SPANNING_MEMBERSHIP_FAMILY"
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 44_875
EXPECTED_PARENT_CLAUSES = 634_859
EXPECTED_PARENT_DIMACS_SHA256 = (
    "d42ec939104be161d1ce74ab0536967043ae84c56d04c857ea905c279506442e"
)
EXPECTED_FINAL_VARIABLES = 44_897
EXPECTED_FINAL_CLAUSES = 635_405
EXPECTED_DELTA_SHA256 = (
    "8b8b9d5b3ea55ddcc93b7ddf047f80b602f200db6e0fa0b5856d78b008ba8d6c"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_DEFINITION_COUNT = 22

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningMembershipFamilyTerminalConsumer.lean"
    ),
)
LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "BlockSpanningMembershipFamilyTerminalConsumer."
    "false_of_terminalStaticNextRowBlockSpanningFamilyBank"
)


class Exact12BlockSpanningMembershipFamilyBankError(ValueError):
    """The family, authenticated sources, parent, or compiled delta drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "membership-family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12BlockSpanningMembershipFamilyBankError(
            f"no production block-spanning family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    """Return the Lean-mirrored lexicographic `(a,x,c)` role order."""

    return tuple(
        (a, x, c)
        for a in (6, 7, 8, 9)
        for x in (3, 4, 5)
        for c in (3, 4, 5)
        if x != c
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return the 24 proof-backed positive-membership patterns."""

    return tuple(
        (
            {"center": x, "support": [0, a]},
            {"center": 1, "support": [0, a]},
            {"center": c, "support": [0, 1, x]},
        )
        for a, x, c in family_roles()
    )


def _parent_record(
    instance: SourceFaithfulCoverInstance, layout: StaticConvexLayout
) -> dict[str, Any]:
    if not isinstance(layout, StaticConvexLayout):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "static-convex parent layout is required"
        )
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    if (
        instance.cnf.n_variables != EXPECTED_PARENT_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_PARENT_CLAUSES
        or dimacs_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or layout.final_n_variables != EXPECTED_PARENT_VARIABLES
        or layout.final_n_clauses != EXPECTED_PARENT_CLAUSES
        or layout.final_cnf_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or not getattr(instance, "_exact12_next_row_static_convex_layout", False)
        or instance.pattern_variables
    ):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "instance is not the frozen cell-1 static-convex parent"
        )
    return {
        "schema": layout.manifest()["schema"],
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": dimacs_sha256,
        "layout_manifest_sha256": _sha256_json(layout.manifest()),
    }


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = compile_positive_membership_bank(working, family_patterns()).as_dict()
    if (
        compiled.get("schema") != MEMBERSHIP_CNF_SCHEMA
        or len(compiled.get("pattern_keys", ())) != EXPECTED_PATTERN_COUNT
        or len(compiled.get("pattern_definitions", ())) != EXPECTED_DEFINITION_COUNT
        or len(compiled.get("entries", ())) != EXPECTED_PATTERN_COUNT
        or compiled.get("initial_n_variables") != EXPECTED_PARENT_VARIABLES
        or compiled.get("initial_n_clauses") != EXPECTED_PARENT_CLAUSES
        or compiled.get("final_n_variables") != EXPECTED_FINAL_VARIABLES
        or compiled.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES
        or compiled.get("delta_sha256") != EXPECTED_DELTA_SHA256
    ):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "compiled block-spanning family differs from the Lean bridge"
        )
    compiled["compiled_sha256"] = _sha256_json(compiled)
    return compiled


def build_block_spanning_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    compiled = _compile_payload(instance)
    roles = [
        {"a": a, "x": x, "c": c} for a, x, c in family_roles()
    ]
    body = {
        "schema": BANK_SCHEMA,
        "family_id": family_id,
        "cell_index": cell_index,
        "semantic_status": SEMANTIC_STATUS,
        "claims": {
            "terminal_unsat": False,
            "aggregate_placement_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
        "lean_terminal_consumer": LEAN_TERMINAL_CONSUMER,
        "parent_static_convex": _parent_record(instance, layout),
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


def validate_block_spanning_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "block-spanning family bank is not a mapping"
        )
    fresh = build_block_spanning_membership_family_bank(
        repo_root, instance, layout, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "block-spanning family bank differs from a live authenticated rebuild"
        )


def attest_block_spanning_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "block-spanning family source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12BlockSpanningMembershipFamilyBankError(
                "block-spanning family source bytes or hashes drifted"
            )


def install_block_spanning_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(instance, "_block_spanning_membership_family_bank_installed", False):
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "block-spanning family is already installed"
        )
    bank = build_block_spanning_membership_family_bank(
        repo_root, instance, layout, cell_index=cell_index
    )
    validate_block_spanning_membership_family_bank(
        repo_root, instance, layout, bank, cell_index=cell_index
    )
    installed = compile_positive_membership_bank(instance, family_patterns()).as_dict()
    expected = copy.deepcopy(bank["compiled"])
    expected.pop("compiled_sha256")
    if installed != expected:
        raise Exact12BlockSpanningMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._block_spanning_membership_family_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "FAMILY_ID",
    "LEAN_TERMINAL_CONSUMER",
    "PRODUCTION_FAMILY_ID_BY_CELL",
    "Exact12BlockSpanningMembershipFamilyBankError",
    "attest_block_spanning_membership_family_bank_live_sources",
    "build_block_spanning_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_block_spanning_membership_family_bank",
    "production_family_id_for_cell",
    "validate_block_spanning_membership_family_bank",
]
