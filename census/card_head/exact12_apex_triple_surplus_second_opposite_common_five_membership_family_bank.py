# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated apex-triple/surplus/second-opposite common-five family.

For every surplus ``c`` in ``{3,4,5}`` and second-opposite label ``y`` in
``{6,7,8,9}``, the checked Lean producer refutes the positive rows

    0:{1,2}, y:{1,2}, c:{0,2,y}.

The contradiction uses the frozen boundary order only to discharge the
generic common-five obstruction.  This module compiles all twelve
proof-backed roles after the authenticated first-opposite/second-opposite
common-five parent family.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError,
    _lean_import_modules,
    _project_lean_source_path,
    attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources,
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
    "p97_rigid221_exact12_apex_triple_surplus_second_opposite_"
    "common_five_membership_family_bank.v1"
)
FAMILY_ID = "apex-triple-surplus-second-opposite-common-five-c345-y6789.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_TRIPLE_SURPLUS_SECOND_OPPOSITE_"
    "COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_224
EXPECTED_PARENT_CLAUSES = 641_980
EXPECTED_PARENT_DIMACS_SHA256 = (
    "ffbfbff4b327943b0a889bb16b99b75ae934ec72027d829e0f332f24a98f5f9d"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "8f7005479eb9cf440468ac55b5cc3d5d3a869674934b69c786e90e49531e3e25"
)
EXPECTED_FINAL_VARIABLES = 45_241
EXPECTED_FINAL_CLAUSES = 642_191
EXPECTED_FINAL_DIMACS_SHA256 = (
    "b475d468f085adb54ecb352277c0df0c69d27ef00c61b89562edb2d5445385b7"
)
EXPECTED_DELTA_SHA256 = (
    "ff3fef9fe7c16b849e6964f738f8475686394dc4f3ff1ccad1cc2ff5a47f0c16"
)
EXPECTED_COMPILED_SHA256 = (
    "cb9c658562230dfd4d71a4e5d646c3eb555910d344add8fcfe7df507d801a771"
)
EXPECTED_ROLES_SHA256 = (
    "cfd5b1fce6c3fc1a14d514eb90a111e4480c6e0a22d9c43948defeb88254f72f"
)
EXPECTED_PATTERN_COUNT = 12
EXPECTED_DEFINITION_COUNT = 17

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyCnf"
    ),
)


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
    """Return the complete repository-local import closure of both Lean roots."""

    root = repo_root.resolve()
    pending = list(LEAN_ROOT_MODULES)
    seen_modules: set[str] = set()
    source_paths: set[str] = set()
    while pending:
        module = pending.pop()
        if module in seen_modules:
            continue
        seen_modules.add(module)
        relative_path = _project_lean_source_path(module)
        if relative_path is None:
            continue
        source_path = root / relative_path
        try:
            source = source_path.read_text(encoding="utf-8")
        except (OSError, UnicodeError) as exc:
            raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                f"repository-local Lean import is unreadable: {relative_path}"
            ) from exc
        source_paths.add(relative_path)
        for imported_module in _lean_import_modules(
            source, relative_path=relative_path
        ):
            if _project_lean_source_path(imported_module) is not None:
                pending.append(imported_module)
    return tuple(sorted(source_paths))


def _source_paths(repo_root: Path) -> tuple[str, ...]:
    return tuple(
        sorted((*_lean_source_paths(repo_root), COMPILER_SOURCE_PATH, HELPER_SOURCE_PATH))
    )


class Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            f"no production apex-triple surplus second-opposite common-five family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int], ...]:
    """Return the Lean-mirrored lexicographic ``(c, y)`` role order."""

    return tuple((c, y) for c in (3, 4, 5) for y in (6, 7, 8, 9))


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return all twelve checked positive-membership patterns."""

    return tuple(
        (
            {"center": 0, "support": [1, 2]},
            {"center": c, "support": [0, 2, y]},
            {"center": y, "support": [1, 2]},
        )
        for c, y in family_roles()
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
            "_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_triple_surplus_second_opposite_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-first-opposite/second-opposite common-five parent"
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
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled apex-triple surplus second-opposite common-five family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled apex-triple common-five payload hash drifted"
        )
    return compiled


def build_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"c": c, "y": y} for c, y in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple common-five role hash drifted"
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
        "parent_apex_first_opposite_shared_pair_second_opposite_common_five_bank": parent,
        "apex_first_opposite_shared_pair_second_opposite_common_five_bank": copy.deepcopy(
            dict(parent_bank)
        ),
        "roles": roles,
        "roles_sha256": _sha256_json(roles),
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "source_manifest": [
            _source_record(repo_root.resolve(), path) for path in _source_paths(repo_root)
        ],
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_apex_triple_surplus_second_opposite_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get(
        "apex_first_opposite_shared_pair_second_opposite_common_five_bank"
    )
    if not isinstance(parent, Mapping):
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "embedded first-opposite/second-opposite common-five bank is malformed"
        )
    try:
        attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError as exc:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "embedded first-opposite/second-opposite common-five sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five source manifest is malformed"
        )
    expected_paths = list(_source_paths(repo_root))
    if [record.get("path") for record in manifest if isinstance(record, Mapping)] != expected_paths:
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "apex-triple surplus second-opposite common-five source bytes or hashes drifted"
            )


def validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five family bank is not a mapping"
        )
    fresh = build_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five family differs from a live authenticated rebuild"
        )


def install_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_apex_triple_surplus_second_opposite_common_five_membership_family_bank_installed",
        False,
    ):
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "apex-triple surplus second-opposite common-five family is already installed"
        )
    bank = build_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
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
        raise Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "installed family delta differs from its authenticated bank"
        )
    instance._apex_triple_surplus_second_opposite_common_five_membership_family_bank_installed = True
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
    "Exact12ApexTripleSurplusSecondOppositeCommonFiveMembershipFamilyBankError",
    "attest_apex_triple_surplus_second_opposite_common_five_membership_family_bank_live_sources",
    "build_apex_triple_surplus_second_opposite_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_triple_surplus_second_opposite_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_triple_surplus_second_opposite_common_five_membership_family_bank",
]
