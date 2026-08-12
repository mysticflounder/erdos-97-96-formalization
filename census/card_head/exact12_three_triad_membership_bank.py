# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated cell-1 ThreeTriad cut after the block-spanning family.

The frozen 24-role family leaves a source-faithful SAT survivor whose selected
rows realize a ``ThreeTriadCollisionCore``.  The Lean adapter only needs five
positive row-membership facts, so this supplemental layer allocates five fresh
Boolean variables, links each selected row to its required membership, and
blocks their conjunction.

The variables deliberately duplicate requirements that may already occur in
the preceding family bank.  This keeps the family artifact frozen and makes
the supplemental delta agree exactly with its Lean CNF bridge.  This is one
finite cell-1 cut; it is not terminal UNSAT or a live theorem closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_block_spanning_membership_family_bank import (
    BANK_SCHEMA as FAMILY_BANK_SCHEMA,
)
from .exact12_block_spanning_membership_family_bank import (
    EXPECTED_FINAL_CLAUSES as FAMILY_FINAL_CLAUSES,
)
from .exact12_block_spanning_membership_family_bank import (
    EXPECTED_FINAL_VARIABLES as FAMILY_FINAL_VARIABLES,
)
from .exact12_block_spanning_membership_family_bank import (
    FAMILY_ID,
    Exact12BlockSpanningMembershipFamilyBankError,
    attest_block_spanning_membership_family_bank_live_sources,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_three_triad_membership_bank.v1"
COMPILED_SCHEMA = "p97_exact12_supplemental_positive_membership_cnf.v1"
CUT_ID = "three-triad-cell1-after-block-spanning-family.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PROVED_THREE_TRIAD_POSITIVE_MEMBERSHIP_CUT"
PRODUCTION_CUT_ID_BY_CELL = {1: CUT_ID}

EXPECTED_PARENT_VARIABLES = FAMILY_FINAL_VARIABLES
EXPECTED_PARENT_CLAUSES = FAMILY_FINAL_CLAUSES
EXPECTED_PARENT_DIMACS_SHA256 = (
    "126f9c5f2c44915e3132ec8ffe85b7af8f7195f9998f7d1de7ebdabbc2f9a55c"
)
EXPECTED_FINAL_VARIABLES = 44_902
EXPECTED_FINAL_CLAUSES = 635_440
EXPECTED_DELTA_SHA256 = (
    "964480f60337fd044afd53db769e1a3c4b0b8a5abad23269c86a1e6fddcb0dcd"
)
EXPECTED_DEFINITION_COUNT = 5
EXPECTED_PATTERN_COUNT = 1

REQUIREMENTS = (
    (0, (1, 2)),
    (1, (0, 6)),
    (2, (0, 1, 11)),
    (6, (2, 9, 11)),
    (9, (1, 2, 11)),
)
EXPECTED_CANDIDATE_INDICES = {
    (0, (1, 2)): (0, 1, 2),
    (1, (0, 6)): (0, 1, 2, 6, 7, 8, 12, 13, 14, 18, 19, 20, 24, 25, 26),
    (2, (0, 1, 11)): (0,),
    (6, (2, 9, 11)): (54, 137, 213, 228, 238, 243, 246, 248),
    (9, (1, 2, 11)): (117, 123, 128, 132, 135, 137, 138),
}

LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/Census554/"
        "ThreeTriadCollision.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticCell1AfterFamilyThreeTriadPositiveCut.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticCell1AfterFamilyThreeTriadMembershipCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ThreeTriadMembershipTerminalConsumer.lean"
    ),
)
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "ThreeTriadMembershipTerminalConsumer."
    "false_of_terminalStaticNextRowThreeTriadMembershipBank"
)


class Exact12ThreeTriadMembershipBankError(ValueError):
    """The supplemental cut, its sources, or its frozen parent drifted."""


def production_cut_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ThreeTriadMembershipBankError(
            "ThreeTriad membership cell index must be an integer"
        )
    try:
        return PRODUCTION_CUT_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ThreeTriadMembershipBankError(
            f"no production ThreeTriad membership cut for cell {cell_index}"
        ) from exc


def membership_pattern() -> tuple[dict[str, Any], ...]:
    return tuple(
        {"center": center, "support": list(required)}
        for center, required in REQUIREMENTS
    )


def _parent_record(
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    family_bank: Mapping[str, Any],
) -> dict[str, Any]:
    if not isinstance(layout, StaticConvexLayout):
        raise Exact12ThreeTriadMembershipBankError(
            "static-convex parent layout is required"
        )
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    compiled = family_bank.get("compiled")
    family_body = dict(family_bank)
    family_bank_sha256 = family_body.pop("bank_sha256", None)
    if (
        family_bank.get("schema") != FAMILY_BANK_SCHEMA
        or family_bank.get("family_id") != FAMILY_ID
        or not isinstance(family_bank_sha256, str)
        or _sha256_json(family_body) != family_bank_sha256
        or not isinstance(compiled, Mapping)
        or compiled.get("final_n_variables") != EXPECTED_PARENT_VARIABLES
        or compiled.get("final_n_clauses") != EXPECTED_PARENT_CLAUSES
        or instance.cnf.n_variables != EXPECTED_PARENT_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_PARENT_CLAUSES
        or dimacs_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or not getattr(instance, "_block_spanning_membership_family_bank_installed", False)
        or getattr(instance, "_three_triad_membership_bank_installed", False)
    ):
        raise Exact12ThreeTriadMembershipBankError(
            "instance is not the frozen post-family cell-1 parent"
        )
    return {
        "family_id": FAMILY_ID,
        "family_bank_sha256": family_bank_sha256,
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": dimacs_sha256,
        "layout_manifest_sha256": _sha256_json(layout.manifest()),
    }


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    initial_n_variables = working.cnf.n_variables
    initial_n_clauses = len(working.cnf.clauses)
    definitions: list[dict[str, Any]] = []
    pattern_variables: list[int] = []

    for center, required in REQUIREMENTS:
        hits = tuple(
            index
            for index, candidate in enumerate(working.candidates[center])
            if set(required) <= set(candidate)
        )
        if hits != EXPECTED_CANDIDATE_INDICES[(center, required)]:
            raise Exact12ThreeTriadMembershipBankError(
                f"candidate realizations drifted for ({center}, {required})"
            )
        variable = working.cnf.new_variable()
        pattern_variables.append(variable)
        candidate_variables = tuple(
            working.choice_variables[(center, index)] for index in hits
        )
        implications = tuple(
            (-candidate_variable, variable)
            for candidate_variable in candidate_variables
        )
        for clause in implications:
            working.cnf.add_clause(clause)
        definitions.append(
            {
                "center": center,
                "required": list(required),
                "pattern_variable": variable,
                "candidate_indices": list(hits),
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )

    block = tuple(-variable for variable in pattern_variables)
    working.cnf.add_clause(block)
    requirements = [
        {"center": center, "required": list(required)}
        for center, required in REQUIREMENTS
    ]
    entries = [
        {
            "index": 0,
            "requirements": requirements,
            "requirements_sha256": _sha256_json(requirements),
            "blocking_clause": list(block),
            "blocking_clause_sha256": _sha256_json(block),
        }
    ]
    delta = tuple(working.cnf.clauses[initial_n_clauses:])
    body = {
        "schema": COMPILED_SCHEMA,
        "pattern_keys": [requirements],
        "pattern_definitions": definitions,
        "entries": entries,
        "initial_n_variables": initial_n_variables,
        "initial_n_clauses": initial_n_clauses,
        "final_n_variables": working.cnf.n_variables,
        "final_n_clauses": len(working.cnf.clauses),
        "delta_clauses": [list(clause) for clause in delta],
        "delta_sha256": _sha256_json(delta),
    }
    if (
        body["initial_n_variables"] != EXPECTED_PARENT_VARIABLES
        or body["initial_n_clauses"] != EXPECTED_PARENT_CLAUSES
        or body["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or body["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
        or len(definitions) != EXPECTED_DEFINITION_COUNT
        or len(entries) != EXPECTED_PATTERN_COUNT
        or body["delta_sha256"] != EXPECTED_DELTA_SHA256
    ):
        raise Exact12ThreeTriadMembershipBankError(
            "compiled ThreeTriad delta differs from the Lean bridge"
        )
    return {**body, "compiled_sha256": _sha256_json(body)}


def build_three_triad_membership_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    family_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    cut_id = production_cut_id_for_cell(cell_index)
    attest_block_spanning_membership_family_bank_live_sources(repo_root, family_bank)
    parent = _parent_record(instance, layout, family_bank)
    compiled = _compile_payload(instance)
    body = {
        "schema": BANK_SCHEMA,
        "cut_id": cut_id,
        "cell_index": cell_index,
        "semantic_status": SEMANTIC_STATUS,
        "claims": {
            "terminal_unsat": False,
            "aggregate_placement_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
        "lean_terminal_consumer": LEAN_TERMINAL_CONSUMER,
        "block_spanning_family_bank": copy.deepcopy(dict(family_bank)),
        "parent_block_spanning_family": parent,
        "pattern": list(membership_pattern()),
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "source_manifest": [
            _source_record(repo_root.resolve(), path)
            for path in sorted((*LEAN_SOURCE_PATHS, HELPER_SOURCE_PATH))
        ],
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def validate_three_triad_membership_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    family_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ThreeTriadMembershipBankError(
            "ThreeTriad membership bank is not a mapping"
        )
    fresh = build_three_triad_membership_bank(
        repo_root, instance, layout, family_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ThreeTriadMembershipBankError(
            "ThreeTriad membership bank differs from a live authenticated rebuild"
        )


def attest_three_triad_membership_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    family_bank = bank.get("block_spanning_family_bank")
    if not isinstance(family_bank, Mapping):
        raise Exact12ThreeTriadMembershipBankError(
            "embedded block-spanning family bank is malformed"
        )
    try:
        attest_block_spanning_membership_family_bank_live_sources(
            repo_root, family_bank
        )
    except Exact12BlockSpanningMembershipFamilyBankError as exc:
        raise Exact12ThreeTriadMembershipBankError(
            "embedded block-spanning family sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12ThreeTriadMembershipBankError(
            "ThreeTriad membership source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ThreeTriadMembershipBankError(
                "ThreeTriad membership source bytes or hashes drifted"
            )


def install_three_triad_membership_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    family_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(instance, "_three_triad_membership_bank_installed", False):
        raise Exact12ThreeTriadMembershipBankError(
            "ThreeTriad membership bank is already installed"
        )
    bank = build_three_triad_membership_bank(
        repo_root, instance, layout, family_bank, cell_index=cell_index
    )
    validate_three_triad_membership_bank(
        repo_root, instance, layout, family_bank, bank, cell_index=cell_index
    )
    installed = _compile_payload(instance)
    allocated = tuple(
        instance.cnf.new_variable() for _ in range(EXPECTED_DEFINITION_COUNT)
    )
    expected_allocated = tuple(
        definition["pattern_variable"]
        for definition in installed["pattern_definitions"]
    )
    if allocated != expected_allocated:
        raise Exact12ThreeTriadMembershipBankError(
            "installed ThreeTriad variable allocation drifted"
        )
    for clause in installed["delta_clauses"]:
        instance.cnf.add_clause(clause)
    if (
        instance.cnf.n_variables != installed["final_n_variables"]
        or len(instance.cnf.clauses) != installed["final_n_clauses"]
    ):
        raise Exact12ThreeTriadMembershipBankError(
            "installed ThreeTriad delta differs from its authenticated bank"
        )
    instance._three_triad_membership_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "COMPILED_SCHEMA",
    "CUT_ID",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "LEAN_TERMINAL_CONSUMER",
    "PRODUCTION_CUT_ID_BY_CELL",
    "Exact12ThreeTriadMembershipBankError",
    "attest_three_triad_membership_bank_live_sources",
    "build_three_triad_membership_bank",
    "install_three_triad_membership_bank",
    "membership_pattern",
    "production_cut_id_for_cell",
    "validate_three_triad_membership_bank",
]
