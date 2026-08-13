# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated reciprocal first/surplus/second common-five family.

For every ``a`` in ``{10,11}``, ``x`` in ``{3,4,5}``, and ``c`` in
``{6,7,8,9}``, the checked source producer refutes the positive rows

    a:{2,x}, 2:{a,x}, 0:{2,a}, c:{0,2,x}.

The compiler merges the producer's two center-``c`` pair requirements into
the equivalent triple requirement.  Six first-opposite pair definitions reuse
the authenticated parent variables 45302--45307; twenty requirements are
fresh.  The family adds 24 four-literal role blocks after the v20 bank.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    _lean_import_modules,
    _project_lean_source_path,
    attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_reciprocal_first_opposite_surplus_second_"
    "opposite_common_five_membership_family_bank.v1"
)
FAMILY_ID = (
    "reciprocal-first-opposite-surplus-second-opposite-common-five-"
    "a1011-x345-c6789.v1"
)
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_RECIPROCAL_FIRST_OPPOSITE_SURPLUS_SECOND_"
    "OPPOSITE_COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_337
EXPECTED_PARENT_CLAUSES = 644_063
EXPECTED_PARENT_DIMACS_SHA256 = (
    "4f4314afc7c11b672655f6c67ea48286fc0adc3ae1d54f0e41f65c903947aed5"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "17fafc5bedce988d41b2b52e8bf43119498349cd376922ad1c98dfd87d14a842"
)
EXPECTED_FINAL_VARIABLES = 45_357
EXPECTED_FINAL_CLAUSES = 644_207
EXPECTED_FINAL_DIMACS_SHA256 = (
    "ee31f59067eb0dc9140e0a9a4cc1a5fd077154c2b8f54910ed42162ff95adc9c"
)
EXPECTED_DELTA_SHA256 = (
    "596466a1a6131c08c073a560bb5c14cdcd352abf21446cede380b0425b49794b"
)
EXPECTED_COMPILED_SHA256 = (
    "b199915ca71557108ff1574fc694a7341edbf8014fd4c45844640f409e59a35d"
)
EXPECTED_BANK_SHA256 = (
    "bc36df451d653b9f8ac8dae68418269f7225fe6495646bcebfd2c14361518cf7"
)
EXPECTED_ROLES_SHA256 = (
    "68b644141ef61f37beef118890d5164b63d10d1e0845b9007a1dd91861c7151b"
)
EXPECTED_PATTERN_COUNT = 24
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 26
EXPECTED_REUSED_REQUIREMENT_COUNT = 6
EXPECTED_FRESH_REQUIREMENT_COUNT = 20
EXPECTED_DEFINITION_COUNT = 26
EXPECTED_REUSED_REQUIREMENTS = tuple(
    (a, (2, x)) for a in (10, 11) for x in (3, 4, 5)
)
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(range(45_302, 45_308))
EXPECTED_FRESH_REQUIREMENTS = (
    ((0, (2, 10)), (0, (2, 11)))
    + tuple((2, (x, a)) for x in (3, 4, 5) for a in (10, 11))
    + tuple((c, (0, 2, x)) for c in (6, 7, 8, 9) for x in (3, 4, 5))
)
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(range(45_338, 45_358))

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = (
    "census/card_head/exact12_positive_membership_source_order_bank.py"
)
SURFACE_SOURCE_PATH = "census/card_head/source_faithful_candidate_surface.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyCnf"
    ),
)


class Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
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
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
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
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal common-five family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            f"no production reciprocal common-five family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    return tuple(
        (a, x, c)
        for a in (10, 11)
        for x in (3, 4, 5)
        for c in (6, 7, 8, 9)
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        (
            {"center": a, "support": [2, x]},
            {"center": 2, "support": [a, x]},
            {"center": 0, "support": [2, a]},
            {"center": c, "support": [2, x]},
            {"center": c, "support": [0, 2]},
        )
        for a, x, c in family_roles()
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
            "_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-v20 common-five parent"
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


def _compile(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    normalized = tuple(
        normalize_memberships(12, choices) for choices in family_patterns()
    )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    expected_reused_variables = dict(
        zip(
            EXPECTED_REUSED_REQUIREMENTS,
            EXPECTED_REUSED_PATTERN_VARIABLES,
            strict=True,
        )
    )
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    for center, required in requirements:
        key = (center, frozenset(required))
        candidate_indices = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if set(required) <= set(candidate)
        ]
        if not candidate_indices:
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "positive membership requirement has no candidate realization"
            )
        inherited_variable = instance.pattern_variables.get(key)
        expected_reused_variable = expected_reused_variables.get((center, required))
        if expected_reused_variable is None:
            if inherited_variable is not None:
                raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                    "fresh membership requirement was unexpectedly inherited"
                )
            reused = False
        else:
            if inherited_variable != expected_reused_variable:
                raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                    "authenticated parent membership variable changed"
                )
            reused = True
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        implications = tuple(instance.cnf.clauses[before:])
        candidate_variables = tuple(
            instance.choice_variables[(center, index)]
            for index in candidate_indices
        )
        expected = tuple(
            (-choice_variable, variable)
            for choice_variable in candidate_variables
        )
        if (reused and implications) or (not reused and implications != expected):
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "pattern implication compiler drifted"
            )
        variables[(center, required)] = variable
        definitions.append(
            {
                "center": center,
                "required": list(required),
                "pattern_variable": variable,
                "reused": reused,
                "candidate_indices": candidate_indices,
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )
    entries: list[dict[str, Any]] = []
    blocks: set[tuple[int, ...]] = set()
    for index, pattern in enumerate(normalized):
        block = tuple(-variables[item] for item in pattern)
        if block in blocks:
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "reciprocal family contains a duplicate block"
            )
        instance.cnf.add_clause(block)
        blocks.add(block)
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
    delta = tuple(instance.cnf.clauses[initial_clauses:])
    compiled = {
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
    definition_requirements = tuple(
        (definition["center"], tuple(definition["required"]))
        for definition in definitions
    )
    variables = tuple(definition["pattern_variable"] for definition in definitions)
    reused = tuple(
        requirement
        for requirement, definition in zip(
            definition_requirements, definitions, strict=True
        )
        if definition["reused"]
    )
    reused_variables = tuple(
        variable
        for variable, definition in zip(variables, definitions, strict=True)
        if definition["reused"]
    )
    fresh = tuple(
        requirement
        for requirement, definition in zip(
            definition_requirements, definitions, strict=True
        )
        if not definition["reused"]
    )
    fresh_variables = tuple(
        variable
        for variable, definition in zip(variables, definitions, strict=True)
        if not definition["reused"]
    )
    if (
        len(compiled["pattern_keys"]) != EXPECTED_PATTERN_COUNT
        or len(definitions) != EXPECTED_DEFINITION_COUNT
        or len(definition_requirements) != EXPECTED_LOGICAL_REQUIREMENT_COUNT
        or len(reused) != EXPECTED_REUSED_REQUIREMENT_COUNT
        or len(fresh) != EXPECTED_FRESH_REQUIREMENT_COUNT
        or reused != EXPECTED_REUSED_REQUIREMENTS
        or reused_variables != EXPECTED_REUSED_PATTERN_VARIABLES
        or fresh != EXPECTED_FRESH_REQUIREMENTS
        or fresh_variables != EXPECTED_FRESH_PATTERN_VARIABLES
    ):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family requirement binding drifted"
        )
    return compiled


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = _compile(working)
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled["initial_n_variables"] != EXPECTED_PARENT_VARIABLES
        or compiled["initial_n_clauses"] != EXPECTED_PARENT_CLAUSES
        or compiled["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or compiled["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
        or compiled["delta_sha256"] != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled reciprocal family counts or hashes drifted"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled reciprocal family payload hash drifted"
        )
    return compiled


def build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [{"a": a, "x": x, "c": c} for a, x, c in family_roles()]
    roles_sha256 = _sha256_json(roles)
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family role hash drifted"
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
        "parent_apex_first_opposite_shared_pair_surplus_common_five_bank": parent,
        "apex_first_opposite_shared_pair_surplus_common_five_bank": copy.deepcopy(
            dict(parent_bank)
        ),
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "source_manifest": [
            _source_record(repo_root.resolve(), path) for path in _source_paths(repo_root)
        ],
    }
    bank_sha256 = _sha256_json(body)
    if bank_sha256 != EXPECTED_BANK_SHA256:
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family bank hash drifted: "
            f"expected {EXPECTED_BANK_SHA256}, observed {bank_sha256}"
        )
    return {**body, "bank_sha256": bank_sha256}


def attest_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("apex_first_opposite_shared_pair_surplus_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "embedded v20 common-five bank is malformed"
        )
    attest_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank_live_sources(
        repo_root, parent
    )
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if not isinstance(manifest, list) or [
        record.get("path") for record in manifest if isinstance(record, Mapping)
    ] != expected_paths:
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "reciprocal family source bytes or hashes drifted"
            )


def validate_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    fresh = build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family differs from a live authenticated rebuild"
        )


def install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    attribute = (
        "_reciprocal_first_opposite_surplus_second_opposite_common_five_"
        "membership_family_bank_installed"
    )
    if getattr(instance, attribute, False):
        raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
            "reciprocal family is already installed"
        )
    bank = build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
    )
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_pattern_variables = dict(instance.pattern_variables)
    try:
        installed = _compile(instance)
        expected = copy.deepcopy(bank["compiled"])
        expected.pop("compiled_sha256")
        expected.pop("final_dimacs_sha256")
        if installed != expected:
            raise Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError(
                "installed reciprocal family differs from its authenticated bank"
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
    "Exact12ReciprocalFirstOppositeSurplusSecondOppositeCommonFiveMembershipFamilyBankError",
    "attest_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank_live_sources",
    "build_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_reciprocal_first_opposite_surplus_second_opposite_common_five_membership_family_bank",
]
