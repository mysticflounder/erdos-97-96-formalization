# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated 24-pattern surplus/apex-pair common-five family.

The cell-1 arm-static canary repeatedly returned common-five cores with

    a in {3,4,5}, c in {10,11}, y in {6,7,8,9},

and positive row requirements ``0:{2,a}``, ``y:{2,a}``, and
``c:{0,2,y}``.  The checked Lean theorem refutes every one of these 24 role
assignments in either frozen source order.  This module compiles the complete
family as one deterministic extension after the existing block-spanning and
ThreeTriad banks.

This is a finite proof-backed discovery refinement.  It is not terminal
UNSAT, aggregate placement coverage, a universal lift, or live closure.
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
from .exact12_three_triad_membership_bank import (
    BANK_SCHEMA as THREE_TRIAD_BANK_SCHEMA,
)
from .exact12_three_triad_membership_bank import (
    CUT_ID as THREE_TRIAD_CUT_ID,
)
from .exact12_three_triad_membership_bank import (
    Exact12ThreeTriadMembershipBankError,
    attest_three_triad_membership_bank_live_sources,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_surplus_apex_pair_membership_family_bank.v1"
FAMILY_ID = "surplus-apex-pair-a345-c1011-y6789.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PROVED_SURPLUS_APEX_PAIR_MEMBERSHIP_FAMILY"
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 44_902
EXPECTED_PARENT_CLAUSES = 635_440
EXPECTED_PARENT_DIMACS_SHA256 = (
    "5cdfec59aae93a18a667338e7d412a01f1e3162d8f5685cc7a9285b9711d5c4a"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "d226ef40fa277516a245c7f9f03ccf3d9f52df715bc8082c16cd6871c4aa249f"
)
EXPECTED_FINAL_VARIABLES = 44_925
EXPECTED_FINAL_CLAUSES = 635_961
EXPECTED_FINAL_DIMACS_SHA256 = (
    "014ac24d16b93f2c63413eb979c01e2259bfb9783adecd73afc26bd78a1c6a13"
)
EXPECTED_DELTA_SHA256 = (
    "d73cfe2bdd0ed42bb74d673d7526029fbd29869489908933ff9e72bb091f00c5"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_DEFINITION_COUNT = 23

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusApexPairCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusApexPairMembershipFamilyCnf.lean"
    ),
)


class Exact12SurplusApexPairMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "surplus/apex-pair family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            f"no production surplus/apex-pair family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    """Return the Lean-mirrored lexicographic ``(a,c,y)`` role order."""

    return tuple(
        (a, c, y)
        for a in (3, 4, 5)
        for c in (10, 11)
        for y in (6, 7, 8, 9)
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all 24 checked positive-membership patterns."""

    return tuple(
        (
            {"center": 0, "support": [2, a]},
            {"center": y, "support": [2, a]},
            {"center": c, "support": [0, 2, y]},
        )
        for a, c, y in family_roles()
    )


def _parent_record(
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    three_triad_bank: Mapping[str, Any],
) -> dict[str, Any]:
    bank_body = dict(three_triad_bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    if (
        not isinstance(layout, StaticConvexLayout)
        or three_triad_bank.get("schema") != THREE_TRIAD_BANK_SCHEMA
        or three_triad_bank.get("cut_id") != THREE_TRIAD_CUT_ID
        or bank_sha256 != EXPECTED_PARENT_BANK_SHA256
        or _sha256_json(bank_body) != bank_sha256
        or instance.cnf.n_variables != EXPECTED_PARENT_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_PARENT_CLAUSES
        or dimacs_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or not getattr(instance, "_three_triad_membership_bank_installed", False)
        or getattr(
            instance,
            "_surplus_apex_pair_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "instance is not the frozen post-ThreeTriad cell-1 parent"
        )
    return {
        "schema": THREE_TRIAD_BANK_SCHEMA,
        "cut_id": THREE_TRIAD_CUT_ID,
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
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "compiled surplus/apex-pair family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    return compiled


def build_surplus_apex_pair_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    three_triad_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_three_triad_membership_bank_live_sources(repo_root, three_triad_bank)
    parent = _parent_record(instance, layout, three_triad_bank)
    compiled = _compile_payload(instance)
    roles = [{"a": a, "c": c, "y": y} for a, c, y in family_roles()]
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
        "parent_three_triad_bank": parent,
        "three_triad_bank": copy.deepcopy(dict(three_triad_bank)),
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


def attest_surplus_apex_pair_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("three_triad_bank")
    if not isinstance(parent, Mapping):
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "embedded ThreeTriad bank is malformed"
        )
    try:
        attest_three_triad_membership_bank_live_sources(repo_root, parent)
    except Exact12ThreeTriadMembershipBankError as exc:
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "embedded ThreeTriad sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "surplus/apex-pair source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12SurplusApexPairMembershipFamilyBankError(
                "surplus/apex-pair source bytes or hashes drifted"
            )


def validate_surplus_apex_pair_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    three_triad_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "surplus/apex-pair family bank is not a mapping"
        )
    fresh = build_surplus_apex_pair_membership_family_bank(
        repo_root, instance, layout, three_triad_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "surplus/apex-pair family differs from a live authenticated rebuild"
        )


def install_surplus_apex_pair_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    three_triad_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_surplus_apex_pair_membership_family_bank_installed",
        False,
    ):
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "surplus/apex-pair family is already installed"
        )
    bank = build_surplus_apex_pair_membership_family_bank(
        repo_root, instance, layout, three_triad_bank, cell_index=cell_index
    )
    validate_surplus_apex_pair_membership_family_bank(
        repo_root,
        instance,
        layout,
        three_triad_bank,
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
        raise Exact12SurplusApexPairMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._surplus_apex_pair_membership_family_bank_installed = True
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
    "Exact12SurplusApexPairMembershipFamilyBankError",
    "attest_surplus_apex_pair_membership_family_bank_live_sources",
    "build_surplus_apex_pair_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_surplus_apex_pair_membership_family_bank",
    "production_family_id_for_cell",
    "validate_surplus_apex_pair_membership_family_bank",
]
