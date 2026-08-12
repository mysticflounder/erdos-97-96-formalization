# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated apex-shared-pair cross-block common-five family.

For each lexicographically ordered role triple ``(a,b,c)`` with
``a in {6,7,8,9}``, ``b in {3,4,5}``, and ``c in {10,11}``, the checked Lean
producer refutes the positive rows ``0:{a,b}``, ``1:{a,b}``, and
``c:{0,1,b}``.  This module deterministically compiles all twenty-four
proof-backed patterns after the apex-pair cross-block parent.

This is a finite proof-backed refinement, not terminal UNSAT, aggregate
coverage, a universal lift, or live closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_pair_cross_block_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_pair_cross_block_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_pair_cross_block_membership_family_bank import (
    Exact12ApexPairCrossBlockMembershipFamilyBankError,
    attest_apex_pair_cross_block_membership_family_bank_live_sources,
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
    "p97_rigid221_exact12_apex_shared_pair_cross_block_membership_family_bank.v1"
)
FAMILY_ID = "apex-shared-pair-cross-block-a6789-b345-c1011.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PROVED_APEX_SHARED_PAIR_CROSS_BLOCK_MEMBERSHIP_FAMILY"
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_096
EXPECTED_PARENT_CLAUSES = 638_948
EXPECTED_PARENT_DIMACS_SHA256 = (
    "5ec0371e698496e001a75d67d4e39bd874232453d7cd9fbb2c6fc75258645a90"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "4dc37cd0afd6daffaa162fc0038ca7905649c04a5f5a4dbda1b4b0c33d41d85c"
)
EXPECTED_FINAL_VARIABLES = 45_126
EXPECTED_FINAL_CLAUSES = 639_242
EXPECTED_FINAL_DIMACS_SHA256 = (
    "a141b3223365f27eaa4d5b583293986b602e0b3f5467e7d74f319a24d5782d75"
)
EXPECTED_DELTA_SHA256 = (
    "86a80a42906f71d59a30e0d0d26cc579e94d378137e1ab45a5f139e1c9076491"
)
EXPECTED_COMPILED_SHA256 = (
    "e9272240042cdb96d95e3eef0465d57eda9025dad301d6d65265b622768e2179"
)
EXPECTED_ROLES_SHA256 = (
    "c1b263ad53eedf0850a95f95dfe5b64ada71a0807d7414d91211ea4138725af2"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_DEFINITION_COUNT = 30

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexSharedPairCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf.lean"
    ),
)


class Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            f"no production apex-shared-pair cross-block family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    """Return the Lean-mirrored lexicographic ``(a,b,c)`` role order."""

    return tuple((a, b, c) for a in (6, 7, 8, 9) for b in (3, 4, 5) for c in (10, 11))


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all twenty-four checked positive-membership patterns."""

    return tuple(
        (
            {"center": 0, "support": [a, b]},
            {"center": 1, "support": [a, b]},
            {"center": c, "support": [0, 1, b]},
        )
        for a, b, c in family_roles()
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
            "_apex_pair_cross_block_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_shared_pair_cross_block_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "instance is not the frozen post-apex-pair cross-block parent"
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
        or len(compiled.get("pattern_definitions", ())) != EXPECTED_DEFINITION_COUNT
        or len(compiled.get("entries", ())) != EXPECTED_PATTERN_COUNT
        or compiled.get("initial_n_variables") != EXPECTED_PARENT_VARIABLES
        or compiled.get("initial_n_clauses") != EXPECTED_PARENT_CLAUSES
        or compiled.get("final_n_variables") != EXPECTED_FINAL_VARIABLES
        or compiled.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES
        or compiled.get("delta_sha256") != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "compiled apex-shared-pair cross-block family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "compiled apex-shared-pair cross-block payload hash drifted"
        )
    return compiled


def build_apex_shared_pair_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_apex_pair_cross_block_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [list(role) for role in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block role hash drifted"
        )
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
        "parent_apex_pair_cross_block_bank": parent,
        "apex_pair_cross_block_bank": copy.deepcopy(dict(parent_bank)),
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


def attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    bank_body = dict(bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    if not isinstance(bank_sha256, str) or _sha256_json(bank_body) != bank_sha256:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block bank hash drifted"
        )
    parent = bank.get("apex_pair_cross_block_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "embedded apex-pair cross-block bank is malformed"
        )
    try:
        attest_apex_pair_cross_block_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12ApexPairCrossBlockMembershipFamilyBankError as exc:
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "embedded apex-pair cross-block sources drifted"
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
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
                "apex-shared-pair cross-block source bytes or hashes drifted"
            )


def validate_apex_shared_pair_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block family bank is not a mapping"
        )
    fresh = build_apex_shared_pair_cross_block_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block family differs from a live authenticated rebuild"
        )


def install_apex_shared_pair_cross_block_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_apex_shared_pair_cross_block_membership_family_bank_installed",
        False,
    ):
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "apex-shared-pair cross-block family is already installed"
        )
    bank = build_apex_shared_pair_cross_block_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_shared_pair_cross_block_membership_family_bank(
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
        raise Exact12ApexSharedPairCrossBlockMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._apex_shared_pair_cross_block_membership_family_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "EXPECTED_COMPILED_SHA256",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_ROLES_SHA256",
    "FAMILY_ID",
    "Exact12ApexSharedPairCrossBlockMembershipFamilyBankError",
    "attest_apex_shared_pair_cross_block_membership_family_bank_live_sources",
    "build_apex_shared_pair_cross_block_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_shared_pair_cross_block_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_shared_pair_cross_block_membership_family_bank",
]
