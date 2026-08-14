# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated apex/first-opposite shared-pair surplus common-five family.

For every ``x`` in ``{6,7,8,9}``, ``b`` in ``{10,11}``, and ``y`` in
``{3,4,5}``, the checked parent producer refutes the positive rows

    x:{0,b}, y:{0,b}, 2:{b,x,y}.

The eight row-``x`` pairs reuse variables 45167--45174 from the earlier
apex/first-opposite shared-pair family.  The compiler allocates thirty fresh
pair/triple definitions and adds the 24 role blocks after the authenticated
v18 family.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    _lean_import_modules,
    _project_lean_source_path,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    attest_second_apex_surplus_second_first_common_five_membership_family_bank_live_sources,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_apex_first_opposite_shared_pair_surplus_"
    "common_five_membership_family_bank.v1"
)
FAMILY_ID = (
    "apex-first-opposite-shared-pair-surplus-common-five-x6789-b1011-y345.v1"
)
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_FIRST_OPPOSITE_SHARED_PAIR_SURPLUS_"
    "COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_307
EXPECTED_PARENT_CLAUSES = 643_805
EXPECTED_PARENT_DIMACS_SHA256 = (
    "fcf2a28e970cfc3cdc7b831a54ea68617eb1e65eeea8de64a7bc329a76d67e9e"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "f3c9614fa963b0a8a0dfa693092c72df8ac9a2beaec171e23156a7fcae4dfff0"
)
EXPECTED_FINAL_VARIABLES = 45_337
EXPECTED_FINAL_CLAUSES = 644_063
EXPECTED_FINAL_DIMACS_SHA256 = (
    "4f4314afc7c11b672655f6c67ea48286fc0adc3ae1d54f0e41f65c903947aed5"
)
EXPECTED_DELTA_SHA256 = (
    "f511a76eec4163417ed58ed06b06221875a7d7318e7198b3b16ebdde76c858bd"
)
EXPECTED_COMPILED_SHA256 = (
    "e3ec43d05e335ac4c7e24828677afc8674e87c3da074a94864e7372fd22c8863"
)
EXPECTED_BANK_SHA256 = (
    "2d758d969081e624e4624f7b23ee5f3db65758b0f6de7e083b9825a2fc4decc2"
)
EXPECTED_ROLES_SHA256 = (
    "cde3ccc0e4b90052ba7cae5ce7669919fc992e416657d9a41df0c2ff9edea72c"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 38
EXPECTED_REUSED_REQUIREMENT_COUNT = 8
EXPECTED_FRESH_REQUIREMENT_COUNT = 30
EXPECTED_DEFINITION_COUNT = 30
EXPECTED_REUSED_REQUIREMENTS = tuple(
    (x, (0, b)) for x in (6, 7, 8, 9) for b in (10, 11)
)
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(range(45_167, 45_175))
EXPECTED_FRESH_REQUIREMENTS = tuple(
    (2, (y, x, b))
    for y in (3, 4, 5)
    for x in (6, 7, 8, 9)
    for b in (10, 11)
) + tuple((y, (0, b)) for y in (3, 4, 5) for b in (10, 11))
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(range(45_308, 45_338))
EXPECTED_DUPLICATE_BLOCK_COUNT = 0

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
SURFACE_SOURCE_PATH = "census/card_head/source_faithful_candidate_surface.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyCnf"
    ),
)


class Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
    ValueError
):
    """The family, its authenticated sources, or frozen parent drifted."""


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
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
            raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
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
        sorted(
            (
                *_lean_source_paths(repo_root),
                COMPILER_SOURCE_PATH,
                HELPER_SOURCE_PATH,
                SURFACE_SOURCE_PATH,
            )
        )
    )


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "no production apex/first-opposite/shared-pair/surplus family "
            f"for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    roles = tuple(
        (x, b, y)
        for x in (6, 7, 8, 9)
        for b in (10, 11)
        for y in (3, 4, 5)
    )
    if len(roles) != EXPECTED_PATTERN_COUNT:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus role count drifted"
        )
    return roles


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        (
            {"center": x, "support": [0, b]},
            {"center": y, "support": [0, b]},
            {"center": 2, "support": [b, x, y]},
        )
        for x, b, y in family_roles()
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
            "_second_apex_surplus_second_first_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-v18 common-five parent"
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
    normalized = tuple(
        normalize_memberships(12, choices) for choices in family_patterns()
    )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    if (
        len(normalized) != EXPECTED_PATTERN_COUNT
        or len(requirements) != EXPECTED_LOGICAL_REQUIREMENT_COUNT
    ):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "role pattern or logical requirement count drifted"
        )
    # Older banks may have interned some of these logical requirements under
    # the same key.  This family deliberately allocates thirty definitions;
    # only the eight row-x pairs are inherited from the earlier family.
    fresh_keys = {
        (center, frozenset(required))
        for center, required in EXPECTED_FRESH_REQUIREMENTS
    }
    for key in fresh_keys:
        instance.pattern_variables.pop(key, None)
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    reused_requirements: list[tuple[int, tuple[int, ...]]] = []
    reused_variables: list[int] = []
    fresh_requirements: list[tuple[int, tuple[int, ...]]] = []
    fresh_variables: list[int] = []
    for center, required in requirements:
        key = (center, frozenset(required))
        was_installed = key in instance.pattern_variables
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        variables[(center, required)] = variable
        if was_installed:
            reused_requirements.append((center, required))
            reused_variables.append(variable)
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
        expected = tuple(
            (-choice_variable, variable)
            for choice_variable in candidate_variables
        )
        if implications != expected:
            raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
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
        fresh_requirements.append((center, required))
        fresh_variables.append(variable)
    if (
        tuple(reused_requirements) != EXPECTED_REUSED_REQUIREMENTS
        or tuple(reused_variables) != EXPECTED_REUSED_PATTERN_VARIABLES
        or tuple(fresh_requirements) != EXPECTED_FRESH_REQUIREMENTS
        or tuple(fresh_variables) != EXPECTED_FRESH_PATTERN_VARIABLES
    ):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "parent reuse or fresh definition set drifted: "
            f"reused={reused_requirements!r}/{reused_variables!r}, "
            f"fresh={fresh_requirements!r}/{fresh_variables!r}"
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
    if len(blocks) - len(set(blocks)) != EXPECTED_DUPLICATE_BLOCK_COUNT:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "duplicate role-block count drifted"
        )
    delta = tuple(instance.cnf.clauses[initial_clauses:])
    return {
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


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = _compile_reusing_parent_requirements(working)
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled["initial_n_variables"] != EXPECTED_PARENT_VARIABLES
        or compiled["initial_n_clauses"] != EXPECTED_PARENT_CLAUSES
        or compiled["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or compiled["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
    ):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "compiled apex/first-opposite/shared-pair/surplus family counts drifted"
        )
    if (
        compiled["delta_sha256"] != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "compiled apex/first-opposite/shared-pair/surplus family hashes drifted"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "compiled apex/first-opposite/shared-pair/surplus payload hash drifted"
        )
    return compiled


def build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_second_apex_surplus_second_first_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"x": x, "b": b, "y": y} for x, b, y in family_roles()]
    roles_sha256 = _sha256_json(roles)
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus role hash drifted"
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
        "parent_second_apex_surplus_second_first_common_five_bank": parent,
        "second_apex_surplus_second_first_common_five_bank": copy.deepcopy(
            dict(parent_bank)
        ),
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "duplicate_block_count": EXPECTED_DUPLICATE_BLOCK_COUNT,
        "source_manifest": [
            _source_record(repo_root.resolve(), path) for path in _source_paths(repo_root)
        ],
    }
    bank_sha256 = _sha256_json(body)
    if bank_sha256 != EXPECTED_BANK_SHA256:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus bank hash drifted"
        )
    return {**body, "bank_sha256": bank_sha256}


def attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("second_apex_surplus_second_first_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "embedded v18 common-five bank is malformed"
        )
    try:
        attest_second_apex_surplus_second_first_common_five_membership_family_bank_live_sources(
            repo_root, parent
        )
    except ValueError as exc:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "embedded v18 common-five sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if not isinstance(manifest, list) or [
        record.get("path") for record in manifest if isinstance(record, Mapping)
    ] != expected_paths:
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
                "apex/first-opposite/shared-pair/surplus source bytes or hashes drifted"
            )


def validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    fresh = build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus family differs from a live "
            "authenticated rebuild"
        )


def install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    attribute = (
        "_apex_first_opposite_shared_pair_surplus_common_five_"
        "membership_family_bank_installed"
    )
    if getattr(instance, attribute, False):
        raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
            "apex/first-opposite/shared-pair/surplus family is already installed"
        )
    bank = build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
    )
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_pattern_variables = dict(instance.pattern_variables)
    try:
        installed = _compile_reusing_parent_requirements(instance)
        expected = copy.deepcopy(bank["compiled"])
        expected.pop("compiled_sha256")
        expected.pop("final_dimacs_sha256")
        if installed != expected:
            raise Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError(
                "installed family delta differs from its authenticated bank"
            )
    except Exception:
        instance.cnf.n_variables = initial_n_variables
        del instance.cnf.clauses[initial_n_clauses:]
        instance.pattern_variables.clear()
        instance.pattern_variables.update(initial_pattern_variables)
        raise
    setattr(instance, attribute, True)
    return bank


__all__ = [
    "BANK_SCHEMA",
    "EXPECTED_BANK_SHA256",
    "EXPECTED_COMPILED_SHA256",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_DUPLICATE_BLOCK_COUNT",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_FRESH_PATTERN_VARIABLES",
    "EXPECTED_FRESH_REQUIREMENTS",
    "EXPECTED_FRESH_REQUIREMENT_COUNT",
    "EXPECTED_LOGICAL_REQUIREMENT_COUNT",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_REUSED_PATTERN_VARIABLES",
    "EXPECTED_REUSED_REQUIREMENTS",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "FAMILY_ID",
    "Exact12ApexFirstOppositeSharedPairSurplusCommonFiveMembershipFamilyBankError",
    "attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources",
    "build_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank",
]
