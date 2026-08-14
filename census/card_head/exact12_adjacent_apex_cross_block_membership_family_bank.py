# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated adjacent-apex cross-block common-five family.

The first arm-static cell-6 survivor after the surplus/apex-pair refinement
exposed the role pattern

    b in {3,4,5}, c in {10,11}, y in {6,7,8,9},

with positive requirements ``0:{1,b}``, ``y:{1,b}``, and
``c:{0,b,y}``.  The checked Lean producer refutes all 24 assignments in both
frozen source orientations.  This module deterministically compiles that
family after the surplus/apex-pair parent.

This is a finite proof-backed refinement, not terminal UNSAT, aggregate
coverage, a universal lift, or live closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

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
from .exact12_surplus_apex_pair_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_surplus_apex_pair_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_surplus_apex_pair_membership_family_bank import (
    Exact12SurplusApexPairMembershipFamilyBankError,
    attest_surplus_apex_pair_membership_family_bank_live_sources,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_adjacent_apex_cross_block_membership_family_bank.v1"
)
FAMILY_ID = "adjacent-apex-cross-block-b345-c1011-y6789.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_ADJACENT_APEX_CROSS_BLOCK_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 44_925
EXPECTED_PARENT_CLAUSES = 635_961
EXPECTED_PARENT_DIMACS_SHA256 = (
    "014ac24d16b93f2c63413eb979c01e2259bfb9783adecd73afc26bd78a1c6a13"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "93dd9665c30c80f81484bf53e388dc6fa53176667e4f220c43192b7bb7ce74c5"
)
EXPECTED_FINAL_VARIABLES = 44_964
EXPECTED_FINAL_CLAUSES = 636_630
EXPECTED_FINAL_DIMACS_SHA256 = (
    "393c08c6837740304f9102020d6299a9fd0a6ac4879a87c3b48c9ab39a6038d9"
)
EXPECTED_DELTA_SHA256 = (
    "65190cf69763a7ae55b356e60d1e9554a3c5310a26594eef4a1acf5678d0ff4b"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_DEFINITION_COUNT = 39

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221AdjacentApexCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221AdjacentApexCrossBlockMembershipFamilyCnf.lean"
    ),
)


class Exact12AdjacentApexCrossBlockMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "adjacent-apex family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            f"no production adjacent-apex family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    """Return the Lean-mirrored lexicographic ``(b,c,y)`` role order."""

    return tuple(
        (b, c, y)
        for b in (3, 4, 5)
        for c in (10, 11)
        for y in (6, 7, 8, 9)
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all 24 checked positive-membership patterns."""

    return tuple(
        (
            {"center": 0, "support": [1, b]},
            {"center": y, "support": [1, b]},
            {"center": c, "support": [0, b, y]},
        )
        for b, c, y in family_roles()
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
            "_surplus_apex_pair_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_adjacent_apex_cross_block_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "instance is not the frozen post-surplus/apex-pair parent"
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
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "compiled adjacent-apex family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    return compiled


def build_adjacent_apex_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_surplus_apex_pair_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"b": b, "c": c, "y": y} for b, c, y in family_roles()]
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
        "parent_surplus_apex_pair_bank": parent,
        "surplus_apex_pair_bank": copy.deepcopy(dict(parent_bank)),
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


def attest_adjacent_apex_cross_block_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("surplus_apex_pair_bank")
    if not isinstance(parent, Mapping):
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "embedded surplus/apex-pair bank is malformed"
        )
    try:
        attest_surplus_apex_pair_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12SurplusApexPairMembershipFamilyBankError as exc:
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "embedded surplus/apex-pair sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "adjacent-apex source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
                "adjacent-apex source bytes or hashes drifted"
            )


def validate_adjacent_apex_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "adjacent-apex family bank is not a mapping"
        )
    fresh = build_adjacent_apex_cross_block_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "adjacent-apex family differs from a live authenticated rebuild"
        )


def install_adjacent_apex_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_adjacent_apex_cross_block_membership_family_bank_installed",
        False,
    ):
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "adjacent-apex family is already installed"
        )
    bank = build_adjacent_apex_cross_block_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_adjacent_apex_cross_block_membership_family_bank(
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
        raise Exact12AdjacentApexCrossBlockMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._adjacent_apex_cross_block_membership_family_bank_installed = True
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
    "Exact12AdjacentApexCrossBlockMembershipFamilyBankError",
    "attest_adjacent_apex_cross_block_membership_family_bank_live_sources",
    "build_adjacent_apex_cross_block_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_adjacent_apex_cross_block_membership_family_bank",
    "production_family_id_for_cell",
    "validate_adjacent_apex_cross_block_membership_family_bank",
]
