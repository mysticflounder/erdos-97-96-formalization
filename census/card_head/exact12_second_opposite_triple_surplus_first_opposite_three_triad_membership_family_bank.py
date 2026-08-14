# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated second-opposite-triple/surplus/first-opposite three-triad family.

For pairwise-distinct ``a,c,e`` in ``{6,7,8,9}``, ``b`` in ``{3,4,5}``, and
``d`` in ``{10,11}``, the checked source producer refutes the positive rows

    b:{c,d}, d:{b,a}, c:{a,d,e}, e:{a,b,d}.

The twenty-four center-``d`` pair definitions are reused from the
authenticated v22 parent.  The other 120 definitions are fresh.  The family
appends their implications followed by 144 four-literal blocks.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    _lean_import_modules,
    _project_lean_source_path,
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources,
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
    "p97_rigid221_exact12_second_opposite_triple_surplus_first_opposite_"
    "three_triad_membership_family_bank.v1"
)
FAMILY_ID = (
    "second-opposite-triple-surplus-first-opposite-three-triad-"
    "a6789-b345-c6789-d1011-e6789.v1"
)
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_SECOND_OPPOSITE_TRIPLE_SURPLUS_FIRST_OPPOSITE_"
    "THREE_TRIAD_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_369
EXPECTED_PARENT_CLAUSES = 644_351
EXPECTED_PARENT_DIMACS_SHA256 = (
    "082162cdbee0f545dab56035ea768e3ad37ce06b9fb580c568781fd63b0d1200"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "f33d3c0b220ee502a49914a892580d3477337bb44fddff7e93eddad7733694e3"
)
EXPECTED_FINAL_VARIABLES = 45_489
EXPECTED_FINAL_CLAUSES = 646_103
EXPECTED_FINAL_DIMACS_SHA256 = (
    "dc63ac918ed05c66cb9207f05219f66b2ad1df0310537bad1c3028abe980c300"
)
EXPECTED_DELTA_SHA256 = (
    "9030716a4eb59b31ed676486d481d7a41e5513aaac61eac2767287a3f3fb0496"
)
EXPECTED_COMPILED_SHA256 = (
    "51980848a4ebe7e419b73d79e6a88c3ff4c4fd1497e5cfe5f3de753243eabfec"
)
EXPECTED_BANK_SHA256 = (
    "fdc0308a147dcfd0b1b99da000ec1b32e60010fd34f192c86f3d794f2f56a348"
)
EXPECTED_ROLES_SHA256 = (
    "0e938ed52472210000f82a509a79fb72a8bb76d4620011fcb840f1da6b113fd0"
)
EXPECTED_PATTERN_COUNT = 144
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 144
EXPECTED_REUSED_REQUIREMENT_COUNT = 24
EXPECTED_FRESH_REQUIREMENT_COUNT = 120
EXPECTED_DEFINITION_COUNT = 144
EXPECTED_REUSED_REQUIREMENTS = tuple(
    (center, (b, a)) for center in (10, 11) for b in (3, 4, 5) for a in (6, 7, 8, 9)
)
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(range(45_201, 45_225))
EXPECTED_FRESH_REQUIREMENTS = tuple(
    sorted(
        {
            *((b, tuple(sorted((c, d)))) for b in (3, 4, 5) for c in (6, 7, 8, 9) for d in (10, 11)),
            *((c, tuple(sorted((a, d, e)))) for a in (6, 7, 8, 9) for c in (6, 7, 8, 9) for d in (10, 11) for e in (6, 7, 8, 9) if len({a, c, e}) == 3),
            *((e, tuple(sorted((a, b, d)))) for a in (6, 7, 8, 9) for b in (3, 4, 5) for d in (10, 11) for e in (6, 7, 8, 9) if a != e),
        }
    )
)
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(range(45_370, 45_490))

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
SURFACE_SOURCE_PATH = "census/card_head/source_faithful_candidate_surface.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221SecondOppositeTripleSurplusFirstOppositeThreeTriadCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyCnf"
    ),
)


class Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
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
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
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
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            f"no production second-opposite-triple family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    return tuple(
        (a, b, c, d, e)
        for a in (6, 7, 8, 9)
        for b in (3, 4, 5)
        for c in (6, 7, 8, 9)
        for d in (10, 11)
        for e in (6, 7, 8, 9)
        if len({a, c, e}) == 3
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        (
            {"center": b, "support": [c, d]},
            {"center": d, "support": [b, a]},
            {"center": c, "support": [a, d, e]},
            {"center": e, "support": [a, b, d]},
        )
        for a, b, c, d, e in family_roles()
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
            "_first_opposite_pair_surplus_second_opposite_common_five_"
            "membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_second_opposite_triple_surplus_first_opposite_three_triad_"
            "membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "instance is not the frozen post-v22 three-triad parent"
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
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                "positive membership requirement has no candidate realization"
            )
        inherited_variable = instance.pattern_variables.get(key)
        expected_reused_variable = expected_reused_variables.get((center, required))
        if expected_reused_variable is None:
            if inherited_variable is not None:
                raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                    "fresh membership requirement was unexpectedly inherited"
                )
            reused = False
        else:
            if inherited_variable != expected_reused_variable:
                raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                    "authenticated parent membership variable changed"
                )
            reused = True
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        implications = tuple(instance.cnf.clauses[before:])
        candidate_variables = tuple(
            instance.choice_variables[(center, index)] for index in candidate_indices
        )
        expected = tuple(
            (-choice_variable, variable) for choice_variable in candidate_variables
        )
        if (reused and implications) or (not reused and implications != expected):
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
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
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                "three-triad family contains a duplicate block"
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
    definition_variables = tuple(
        definition["pattern_variable"] for definition in definitions
    )
    reused = tuple(
        requirement
        for requirement, definition in zip(
            definition_requirements, definitions, strict=True
        )
        if definition["reused"]
    )
    reused_variables = tuple(
        variable
        for variable, definition in zip(definition_variables, definitions, strict=True)
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
        for variable, definition in zip(definition_variables, definitions, strict=True)
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
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family requirement binding drifted"
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
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "compiled three-triad family counts or hashes drifted"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "compiled three-triad family payload hash drifted: "
            f"expected {EXPECTED_COMPILED_SHA256}, "
            f"observed {compiled['compiled_sha256']}"
        )
    return compiled


def build_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [
        {"a": a, "b": b, "c": c, "d": d, "e": e}
        for a, b, c, d, e in family_roles()
    ]
    roles_sha256 = _sha256_json(roles)
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family role hash drifted"
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
        "parent_first_opposite_pair_common_five_bank": parent,
        "first_opposite_pair_common_five_bank": copy.deepcopy(dict(parent_bank)),
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "source_manifest": [
            _source_record(repo_root.resolve(), path)
            for path in _source_paths(repo_root)
        ],
    }
    bank_sha256 = _sha256_json(body)
    if bank_sha256 != EXPECTED_BANK_SHA256:
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family bank hash drifted: "
            f"expected {EXPECTED_BANK_SHA256}, observed {bank_sha256}"
        )
    return {**body, "bank_sha256": bank_sha256}


def attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("first_opposite_pair_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "embedded v22 common-five bank is malformed"
        )
    attest_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank_live_sources(
        repo_root, parent
    )
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
    ):
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                "three-triad family source bytes or hashes drifted"
            )


def validate_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    fresh = build_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family differs from a live authenticated rebuild"
        )


def install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    attribute = (
        "_second_opposite_triple_surplus_first_opposite_three_triad_"
        "membership_family_bank_installed"
    )
    if getattr(instance, attribute, False):
        raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
            "three-triad family is already installed"
        )
    bank = build_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank(
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
            raise Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError(
                "installed three-triad family differs from its authenticated bank"
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
    "Exact12SecondOppositeTripleSurplusFirstOppositeThreeTriadMembershipFamilyBankError",
    "attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources",
    "build_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank",
    "production_family_id_for_cell",
    "validate_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank",
]
