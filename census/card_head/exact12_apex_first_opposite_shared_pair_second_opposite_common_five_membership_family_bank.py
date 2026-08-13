# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated exact-12 first-opposite/second-opposite common-five family.

The 96 source-valid roles are sorted by ``(a, b, c, y)`` and compile the
positive rows ``0:{a,b}``, ``y:{a,b}``, and ``c:{b,0,y}``.  The family is
installed after the authenticated first-opposite shared-pair family.  This
is finite proof-backed infrastructure only.
"""

from __future__ import annotations

import copy
import hashlib
import re
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
    attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    Exact12PositiveMembershipSourceOrderBankError,
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_apex_first_opposite_shared_pair_second_opposite_"
    "common_five_membership_family_bank.v1"
)
FAMILY_ID = (
    "apex-first-opposite-shared-pair-second-opposite-common-five-"
    "a6789-b345-c6789-y1011.v1"
)
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_FIRST_OPPOSITE_SHARED_PAIR_SECOND_OPPOSITE_"
    "COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_176
EXPECTED_PARENT_CLAUSES = 640_828
EXPECTED_PARENT_DIMACS_SHA256 = (
    "1c5e5128225ad7d3878a2e1580f3628ca8955172982b0803d599ed2ad94c2d59"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "ce89f4ea11ac2d8e03aa7502da5f45693452fa0f435f07d993f74e82b8f51ee0"
)
EXPECTED_FINAL_VARIABLES = 45_224
EXPECTED_FINAL_CLAUSES = 641_980
EXPECTED_FINAL_DIMACS_SHA256 = (
    "ffbfbff4b327943b0a889bb16b99b75ae934ec72027d829e0f332f24a98f5f9d"
)
EXPECTED_DELTA_SHA256 = (
    "04728382408884774f44b3afe07598a7b84d420f10990eb3c062c44ef00e033e"
)
EXPECTED_COMPILED_SHA256 = (
    "e703aabe4c3c353ab82a6f21c3ba25ddac94911e426db869a42ad04d1448837d"
)
EXPECTED_ROLES_SHA256 = (
    "989a84237110c09d421ad0ee27f96deded608c71809d1959a2da545bd125c0c4"
)
EXPECTED_PATTERN_COUNT = 96
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 60
EXPECTED_DEFINITION_COUNT = 48
EXPECTED_REUSED_REQUIREMENT_COUNT = 12
EXPECTED_FRESH_REQUIREMENT_COUNT = 48
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(range(45_097, 45_109))
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(range(45_177, 45_225))
EXPECTED_DUPLICATE_BLOCK_COUNT = 0

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyCnf"
    ),
)
_LEAN_MODULE_SEGMENT = re.compile(r"[A-Za-z_][A-Za-z0-9_']*")


class Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
    ValueError
):
    """The family, its authenticated sources, or frozen parent drifted."""


def _project_lean_source_path(module: str) -> str | None:
    segments = module.split(".")
    if not segments or segments[0] != "Erdos9796Proof":
        return None
    if any(_LEAN_MODULE_SEGMENT.fullmatch(segment) is None for segment in segments):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            f"malformed repository-local Lean import: {module!r}"
        )
    return (Path("lean").joinpath(*segments).with_suffix(".lean")).as_posix()


def _lean_import_modules(source: str, *, relative_path: str) -> tuple[str, ...]:
    imports: list[str] = []
    block_depth = 0
    header_closed = False
    for line_number, raw_line in enumerate(source.splitlines(), start=1):
        code: list[str] = []
        index = 0
        while index < len(raw_line):
            pair = raw_line[index : index + 2]
            if block_depth:
                if pair == "/-":
                    block_depth += 1
                    index += 2
                elif pair == "-/":
                    block_depth -= 1
                    index += 2
                else:
                    index += 1
            elif pair == "--":
                break
            elif pair == "/-":
                block_depth = 1
                index += 2
            else:
                code.append(raw_line[index])
                index += 1
        line = "".join(code).strip()
        if not line:
            continue
        if not line.startswith("import"):
            header_closed = True
            continue
        if header_closed:
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
                f"Lean import appears after source header at "
                f"{relative_path}:{line_number}"
            )
        if line == "import" or not line.startswith("import "):
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
                f"malformed Lean import at {relative_path}:{line_number}"
            )
        modules = line.removeprefix("import ").split()
        if not modules:
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
                f"empty Lean import at {relative_path}:{line_number}"
            )
        imports.extend(modules)
    if block_depth:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            f"unterminated Lean block comment in {relative_path}"
        )
    return tuple(imports)


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
    """Return the complete repository-local import closure of both roots."""

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
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
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


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            f"no second-opposite common-five family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int, int], ...]:
    """Return all 96 valid roles in lexicographic ``(a, b, c, y)`` order."""

    return tuple(
        sorted(
            (a, b, c, y)
            for a in (6, 7, 8, 9)
            for b in (3, 4, 5)
            for c in (6, 7, 8, 9)
            for y in (10, 11)
        )
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return the 96 role-ordered positive-membership patterns."""

    return tuple(
        (
            {"center": 0, "support": [a, b]},
            {"center": y, "support": [a, b]},
            {"center": c, "support": [b, 0, y]},
        )
        for a, b, c, y in family_roles()
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
            "_apex_first_opposite_shared_pair_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-first-opposite shared-pair parent"
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
    if len(normalized) != EXPECTED_PATTERN_COUNT:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "role pattern count drifted"
        )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    if len(requirements) != EXPECTED_LOGICAL_REQUIREMENT_COUNT:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "logical requirement count drifted"
        )
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    reused = 0
    reused_centers: list[int] = []
    reused_variables: list[int] = []
    fresh_variables: list[int] = []
    for center, required in requirements:
        key = (center, frozenset(required))
        was_installed = key in instance.pattern_variables
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        variables[(center, required)] = variable
        if was_installed:
            reused += 1
            reused_centers.append(center)
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
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
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
        fresh_variables.append(variable)
    if (
        reused != EXPECTED_REUSED_REQUIREMENT_COUNT
        or len(definitions) != EXPECTED_FRESH_REQUIREMENT_COUNT
        or len(definitions) != EXPECTED_DEFINITION_COUNT
        or tuple(reused_centers) != (0,) * EXPECTED_REUSED_REQUIREMENT_COUNT
        or tuple(reused_variables) != EXPECTED_REUSED_PATTERN_VARIABLES
        or tuple(fresh_variables) != EXPECTED_FRESH_PATTERN_VARIABLES
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "parent reuse or fresh definition count drifted"
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
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
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
        compiled["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or compiled["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
        or compiled["delta_sha256"] != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled second-opposite common-five family differs from frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "compiled second-opposite common-five payload hash drifted"
        )
    return compiled


def build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    try:
        attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
            repo_root, parent_bank
        )
    except Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "frozen first-opposite shared-pair parent sources drifted"
        ) from exc
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [list(role) for role in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five role hash drifted"
        )
    try:
        source_manifest = [
            _source_record(repo_root.resolve(), path) for path in _source_paths(repo_root)
        ]
    except Exact12PositiveMembershipSourceOrderBankError as exc:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five source manifest is not live-complete"
        ) from exc
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
        "parent_apex_first_opposite_shared_pair_common_five_bank": parent,
        "apex_first_opposite_shared_pair_common_five_bank": copy.deepcopy(
            dict(parent_bank)
        ),
        "roles": roles,
        "roles_sha256": _sha256_json(roles),
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "duplicate_block_count": EXPECTED_DUPLICATE_BLOCK_COUNT,
        "source_manifest": source_manifest,
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    bank_body = dict(bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    if (
        not isinstance(bank_sha256, str)
        or bank.get("schema") != BANK_SCHEMA
        or bank.get("family_id") != FAMILY_ID
        or _sha256_json(bank_body) != bank_sha256
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five bank hash drifted"
        )
    parent = bank.get("apex_first_opposite_shared_pair_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "embedded first-opposite shared-pair bank is malformed"
        )
    try:
        attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "embedded first-opposite shared-pair sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
        or len(manifest) != len(expected_paths)
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
                "second-opposite common-five source bytes or hashes drifted"
            )


def validate_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five family bank is not a mapping"
        )
    fresh = build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five family differs from live authenticated rebuild"
        )


def install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_installed",
        False,
    ):
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "second-opposite common-five family is already installed"
        )
    bank = build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
    )
    compiled = _compile_reusing_parent_requirements(instance)
    expected = copy.deepcopy(bank["compiled"])
    expected.pop("compiled_sha256")
    expected.pop("final_dimacs_sha256")
    if compiled != expected:
        raise Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError(
            "installed family delta differs from authenticated bank"
        )
    instance._apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_installed = True
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
    "EXPECTED_FRESH_REQUIREMENT_COUNT",
    "EXPECTED_LOGICAL_REQUIREMENT_COUNT",
    "EXPECTED_PARENT_BANK_SHA256",
    "EXPECTED_PARENT_CLAUSES",
    "EXPECTED_PARENT_DIMACS_SHA256",
    "EXPECTED_PARENT_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_REUSED_PATTERN_VARIABLES",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "FAMILY_ID",
    "SEMANTIC_STATUS",
    "Exact12ApexFirstOppositeSharedPairSecondOppositeCommonFiveMembershipFamilyBankError",
    "attest_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank_live_sources",
    "build_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank",
]
