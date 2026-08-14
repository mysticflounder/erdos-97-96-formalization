# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated surplus-role three-triad positive-membership family.

For each surplus label ``a`` in ``{3,4,5}``, the checked Lean producer refutes
the four positive rows

    9:{7,6}, 6:{9,a}, 7:{a,6,8}, 8:{a,9,6}.

The contradiction is the general three-triad collision and does not use a
boundary order, convex orientation, or complete-fibre interpretation.  This
module compiles the three proof-backed patterns after the second-cap/apex/
surplus common-five family.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
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
from .exact12_second_cap_apex_surplus_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_second_cap_apex_surplus_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_second_cap_apex_surplus_membership_family_bank import (
    Exact12SecondCapApexSurplusMembershipFamilyBankError,
    attest_second_cap_apex_surplus_membership_family_bank_live_sources,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_surplus_three_triad_membership_family_bank.v1"
FAMILY_ID = "surplus345-fixed6789-three-triad.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PROVED_SURPLUS_THREE_TRIAD_MEMBERSHIP_FAMILY"
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_000
EXPECTED_PARENT_CLAUSES = 637_236
EXPECTED_PARENT_DIMACS_SHA256 = (
    "2a7a0f63bcbeb983d9019b87797ffb8fa4c1c644045a21c1e79141b631075f90"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "8f7f45cdb9b824bc97ada125addec4cf7cea7ba146b47eefe5d04f1c5ea853bf"
)
EXPECTED_FINAL_VARIABLES = 45_010
EXPECTED_FINAL_CLAUSES = 637_414
EXPECTED_FINAL_DIMACS_SHA256 = (
    "2844611d6030452f2513307fde1de2439eb51a2eea11df2621bb653314b8dab4"
)
EXPECTED_DELTA_SHA256 = (
    "ad8988be515c9828a29a00dfa47c59cafb29415dd0d621faddec06d4e65c5f75"
)
EXPECTED_PATTERN_COUNT = 3
EXPECTED_DEFINITION_COUNT = 10

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusThreeTriadCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf.lean"
    ),
)


class Exact12SurplusThreeTriadMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "surplus three-triad family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            f"no production surplus three-triad family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[int, ...]:
    """Return the Lean-mirrored lexicographic surplus-role order."""

    return (3, 4, 5)


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all three checked positive-membership patterns."""

    return tuple(
        (
            {"center": 9, "support": [6, 7]},
            {"center": 6, "support": [a, 9]},
            {"center": 7, "support": [a, 6, 8]},
            {"center": 8, "support": [a, 6, 9]},
        )
        for a in family_roles()
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
            "_second_cap_apex_surplus_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_surplus_three_triad_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "instance is not the frozen post-second-cap/apex/surplus parent"
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
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "compiled surplus three-triad family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    return compiled


def build_surplus_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_second_cap_apex_surplus_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"a": a} for a in family_roles()]
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
        "parent_second_cap_apex_surplus_bank": parent,
        "second_cap_apex_surplus_bank": copy.deepcopy(dict(parent_bank)),
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


def attest_surplus_three_triad_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("second_cap_apex_surplus_bank")
    if not isinstance(parent, Mapping):
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "embedded second-cap/apex/surplus bank is malformed"
        )
    try:
        attest_second_cap_apex_surplus_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12SecondCapApexSurplusMembershipFamilyBankError as exc:
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "embedded second-cap/apex/surplus sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "surplus three-triad source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12SurplusThreeTriadMembershipFamilyBankError(
                "surplus three-triad source bytes or hashes drifted"
            )


def validate_surplus_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "surplus three-triad family bank is not a mapping"
        )
    fresh = build_surplus_three_triad_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "surplus three-triad family differs from a live authenticated rebuild"
        )


def install_surplus_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_surplus_three_triad_membership_family_bank_installed",
        False,
    ):
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "surplus three-triad family is already installed"
        )
    bank = build_surplus_three_triad_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_surplus_three_triad_membership_family_bank(
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
        raise Exact12SurplusThreeTriadMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._surplus_three_triad_membership_family_bank_installed = True
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
    "Exact12SurplusThreeTriadMembershipFamilyBankError",
    "attest_surplus_three_triad_membership_family_bank_live_sources",
    "build_surplus_three_triad_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_surplus_three_triad_membership_family_bank",
    "production_family_id_for_cell",
    "validate_surplus_three_triad_membership_family_bank",
]
