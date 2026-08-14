# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated apex/first/surplus/second common-five family.

For every ``a`` in ``{10,11}``, ``b`` in ``{3,4,5}``, and ``y`` in
``{6,7,8,9}``, the checked Lean producer refutes the positive rows

    0:{a,b}, y:{a,b}, 1:{0,b,y}.

The center-``1`` triples reuse twelve exact variables from the authenticated
parent.  The compiler allocates thirty fresh pair definitions and adds the 24
role blocks after the surplus-pair/second-opposite/apex-pair family.

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
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    Exact12SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyBankError,
    _lean_import_modules,
    _project_lean_source_path,
    attest_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank_live_sources,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_apex_first_surplus_second_"
    "common_five_membership_family_bank.v1"
)
FAMILY_ID = "apex-first-surplus-second-common-five-a1011-b345-y6789.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_FIRST_SURPLUS_SECOND_COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_247
EXPECTED_PARENT_CLAUSES = 642_425
EXPECTED_PARENT_DIMACS_SHA256 = (
    "d23b721936153e866afc6ca780b6829a8d3a9217e55f420fad9489baf1a7b7bb"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "6f694411435294a727f07f24cd1c20cbf49b1ebc7b907d1ae8b76ac8ac97291d"
)
EXPECTED_FINAL_VARIABLES = 45_277
EXPECTED_FINAL_CLAUSES = 643_379
EXPECTED_FINAL_DIMACS_SHA256 = (
    "18f09d0b8a854cfbe0783c6f84130366dc90011b25ce816eaeb8cdd5b8000ea8"
)
EXPECTED_DELTA_SHA256 = (
    "d33901febd186e4f7a625040d3db12b1c9731bf4efa71f3671f6f0cd5122a767"
)
EXPECTED_COMPILED_SHA256 = (
    "994ca3069f2433ff062141093405cbd59e85dc6db6354f60dc859dcf6eb1b3c7"
)
EXPECTED_ROLES_SHA256 = (
    "cc66611413279f475594b4356bde78cda0c0da689a328e6489012118ae7833d3"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 42
EXPECTED_REUSED_REQUIREMENT_COUNT = 12
EXPECTED_FRESH_REQUIREMENT_COUNT = 30
EXPECTED_DEFINITION_COUNT = 30
EXPECTED_REUSED_REQUIREMENTS = tuple(
    (1, (0, b, y)) for b in (3, 4, 5) for y in (6, 7, 8, 9)
)
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(range(45_078, 45_090))
EXPECTED_FRESH_REQUIREMENTS = tuple(
    (center, (b, a))
    for center in (0, 6, 7, 8, 9)
    for b in (3, 4, 5)
    for a in (10, 11)
)
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(range(45_248, 45_278))
EXPECTED_DUPLICATE_BLOCK_COUNT = 0

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
SURFACE_SOURCE_PATH = "census/card_head/source_faithful_candidate_surface.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf"
    ),
)


class Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
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
            raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
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
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            f"no production apex/first/surplus/second family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    roles = tuple(
        (a, b, y)
        for a in (10, 11)
        for b in (3, 4, 5)
        for y in (6, 7, 8, 9)
    )
    if len(roles) != EXPECTED_PATTERN_COUNT:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second role count drifted"
        )
    return roles


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        (
            {"center": 0, "support": [a, b]},
            {"center": y, "support": [a, b]},
            {"center": 1, "support": [0, b, y]},
        )
        for a, b, y in family_roles()
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
            "_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_first_surplus_second_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-surplus-pair common-five parent"
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
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "role pattern or logical requirement count drifted"
        )
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
            (-choice_variable, variable) for choice_variable in candidate_variables
        )
        if implications != expected:
            raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
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
        or len(reused_variables) != EXPECTED_REUSED_REQUIREMENT_COUNT
        or len(definitions) != EXPECTED_FRESH_REQUIREMENT_COUNT
        or len(definitions) != EXPECTED_DEFINITION_COUNT
    ):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "parent reuse or fresh definition set drifted"
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
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
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
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "compiled apex/first/surplus/second family differs from the frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "compiled apex/first/surplus/second payload hash drifted"
        )
    return compiled


def build_apex_first_surplus_second_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"a": a, "b": b, "y": y} for a, b, y in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second role hash drifted"
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
        "parent_surplus_pair_second_opposite_apex_pair_common_five_bank": parent,
        "surplus_pair_second_opposite_apex_pair_common_five_bank": copy.deepcopy(
            dict(parent_bank)
        ),
        "roles": roles,
        "roles_sha256": _sha256_json(roles),
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "duplicate_block_count": EXPECTED_DUPLICATE_BLOCK_COUNT,
        "source_manifest": [
            _source_record(repo_root.resolve(), path) for path in _source_paths(repo_root)
        ],
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_apex_first_surplus_second_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get(
        "surplus_pair_second_opposite_apex_pair_common_five_bank"
    )
    if not isinstance(parent, Mapping):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "embedded surplus-pair common-five bank is malformed"
        )
    try:
        attest_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12SurplusPairSecondOppositeApexPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "embedded surplus-pair common-five sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    if not isinstance(manifest, list) or not manifest:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second source manifest is malformed"
        )
    expected_paths = list(_source_paths(repo_root))
    if [
        record.get("path") for record in manifest if isinstance(record, Mapping)
    ] != expected_paths:
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
                "apex/first/surplus/second source bytes or hashes drifted"
            )


def validate_apex_first_surplus_second_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second family bank is not a mapping"
        )
    fresh = build_apex_first_surplus_second_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second family differs from a live authenticated rebuild"
        )


def install_apex_first_surplus_second_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    attribute = (
        "_apex_first_surplus_second_common_five_membership_family_bank_installed"
    )
    if getattr(instance, attribute, False):
        raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
            "apex/first/surplus/second family is already installed"
        )
    bank = build_apex_first_surplus_second_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_first_surplus_second_common_five_membership_family_bank(
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
            raise Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError(
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
    "Exact12ApexFirstSurplusSecondCommonFiveMembershipFamilyBankError",
    "attest_apex_first_surplus_second_common_five_membership_family_bank_live_sources",
    "build_apex_first_surplus_second_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_first_surplus_second_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_first_surplus_second_common_five_membership_family_bank",
]
