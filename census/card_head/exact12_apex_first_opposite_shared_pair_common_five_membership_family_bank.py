# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated exact-12 apex/first-opposite shared-pair common-five family.

The eight source-valid roles are sorted by ``(x, b, y)`` and compile the
positive rows ``x:{0,b}``, ``y:{0,b}``, and ``2:{b,x,y}``.  The family is
installed after the authenticated apex-internal shared-pair family.  This is
finite proof-backed infrastructure only.
"""

from __future__ import annotations

import copy
import hashlib
import re
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError,
    attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources,
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
    "p97_rigid221_exact12_apex_first_opposite_shared_pair_common_five_"
    "membership_family_bank.v1"
)
FAMILY_ID = "apex-first-opposite-shared-pair-common-five-x6789-b1011-y1011.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_APEX_FIRST_OPPOSITE_SHARED_PAIR_COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {1: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_162
EXPECTED_PARENT_CLAUSES = 640_454
EXPECTED_PARENT_DIMACS_SHA256 = (
    "34e2a2d14aaa2ca93cf71af94f5f3e19f4bb67ae106d9c9cdff33d1c582d182e"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "d06b9d7102bf5c918ac9fdcb4e801ffa76de96ba8202822eb1612c70f91df3d4"
)
EXPECTED_FINAL_VARIABLES = 45_176
EXPECTED_FINAL_CLAUSES = 640_828
EXPECTED_FINAL_DIMACS_SHA256 = (
    "1c5e5128225ad7d3878a2e1580f3628ca8955172982b0803d599ed2ad94c2d59"
)
EXPECTED_DELTA_SHA256 = (
    "7f4d1279b9473a900370100061a12b3ac93f6a7ccb08c275be375c1f01de4ea0"
)
EXPECTED_COMPILED_SHA256 = (
    "fac6a62933f8fcdde0d523f07f66136d8d2b917c271380ca3ef4bc625a65aada"
)
EXPECTED_ROLES_SHA256 = (
    "0261c9b8e86a75a150b04d7f6faeacf4ca62153b40cb0ba9104b730db0d4a46b"
)
EXPECTED_PATTERN_COUNT = 8
EXPECTED_DEFINITION_COUNT = 14
EXPECTED_REUSED_REQUIREMENT_COUNT = 0
EXPECTED_DUPLICATE_BLOCK_COUNT = 0

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf"
    ),
)

# The repository-local Lean modules that supply a declaration the root
# modules transitively depend on, mined from the Lean kernel by
# ``scripts/mine_bank_lean_dependencies.py`` and frozen here.  This is the
# source set the bank manifest authenticates.
#
# It is deliberately NOT the transitive import closure.  Hashing that closure
# made every unrelated commit inside it break this pin and every pin below it,
# which already cost one repair (5fe42600); only these 25 modules carry a
# declaration the root modules use.
#
# Freezing the set rather than recomputing it is safe because the set is closed
# under change detection: a new dependency can only be introduced by editing a
# declaration that already lies inside the set, and every module in the set is
# hashed, so no edit can add a dependency without breaking the pin first.
# Re-mine with ``--compare`` after any change to a listed module.
LEAN_DEPENDENCY_MODULES = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveCarrierIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveCertificate",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BoundaryOrderIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221Ingress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_01",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverIndexBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate",
    "Erdos9796Proof.P97.Census554.ConvexFivePointCore",
    "Erdos9796Proof.P97.Census554.CoverCnf",
    "Erdos9796Proof.P97.Census554.EqualityCore",
    "Erdos9796Proof.P97.Census554.SinzSat",
    "Erdos9796Proof.P97.ConvexCyclicOrder.Basic",
    "Erdos9796Proof.P97.Foundation",
    "Erdos9796Proof.P97.Q3SharedInterior",
    "Erdos9796Proof.P97.SignedAreaOangle",
    "Erdos9796Proof.P97.SurplusCOMPGBankSep",
    "Erdos9796Proof.P97.U2.OneHitMonotone",
    "Erdos9796Proof.P97.U2.SimilarityNormalization",
)
_LEAN_MODULE_SEGMENT = re.compile(r"[A-Za-z_][A-Za-z0-9_']*")


class Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
    ValueError
):
    """The family, its authenticated sources, or frozen parent drifted."""


def _project_lean_source_path(module: str) -> str | None:
    segments = module.split(".")
    if not segments or segments[0] != "Erdos9796Proof":
        return None
    if any(_LEAN_MODULE_SEGMENT.fullmatch(segment) is None for segment in segments):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
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
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"Lean import appears after source header at "
                f"{relative_path}:{line_number}"
            )
        if line == "import" or not line.startswith("import "):
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"malformed Lean import at {relative_path}:{line_number}"
            )
        modules = line.removeprefix("import ").split()
        if not modules:
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"empty Lean import at {relative_path}:{line_number}"
            )
        imports.extend(modules)
    if block_depth:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            f"unterminated Lean block comment in {relative_path}"
        )
    return tuple(imports)


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
    """The frozen kernel dependency set, resolved to repository-local paths.

    Fails closed on a module that is not repository-local, on an unreadable
    source file, and on a root module missing from the frozen set.
    """

    root = repo_root.resolve()
    source_paths: set[str] = set()
    for module in LEAN_DEPENDENCY_MODULES:
        relative_path = _project_lean_source_path(module)
        if relative_path is None:
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"frozen Lean dependency is not repository-local: {module}"
            )
        try:
            (root / relative_path).read_bytes()
        except OSError as exc:
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"frozen Lean dependency is unreadable: {relative_path}"
            ) from exc
        source_paths.add(relative_path)
    for module in LEAN_ROOT_MODULES:
        if module not in LEAN_DEPENDENCY_MODULES:
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                f"root module absent from the frozen dependency set: {module}"
            )
    return tuple(sorted(source_paths))


def _source_paths(repo_root: Path) -> tuple[str, ...]:
    return tuple(
        sorted((*_lean_source_paths(repo_root), COMPILER_SOURCE_PATH, HELPER_SOURCE_PATH))
    )


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            f"no production apex-first-opposite shared-pair family for cell {cell_index}"
        ) from exc


def family_roles() -> tuple[tuple[int, int, int], ...]:
    """Return all eight valid roles in lexicographic ``(x,b,y)`` order."""

    return tuple(
        sorted(
            (x, b, y)
            for x in (6, 7, 8, 9)
            for b in (10, 11)
            for y in (10, 11)
            if b != y
        )
    )


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    """Return the eight role-ordered positive-membership patterns."""

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
            "_apex_internal_shared_pair_common_five_membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_apex_first_opposite_shared_pair_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-apex-internal shared-pair parent"
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
    patterns = family_patterns()
    normalized = tuple(normalize_memberships(12, choices) for choices in patterns)
    if len(normalized) != EXPECTED_PATTERN_COUNT:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "role pattern count drifted"
        )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    reused = 0
    for center, required in requirements:
        key = (center, frozenset(required))
        was_installed = key in instance.pattern_variables
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        variables[(center, required)] = variable
        if was_installed:
            reused += 1
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
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
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
    if reused != EXPECTED_REUSED_REQUIREMENT_COUNT or len(definitions) != EXPECTED_DEFINITION_COUNT:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
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
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
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
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "compiled apex-first-opposite shared-pair family differs from frozen bridge"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "compiled apex-first-opposite shared-pair payload hash drifted"
        )
    return compiled


def build_apex_first_opposite_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [list(role) for role in family_roles()]
    if _sha256_json(roles) != EXPECTED_ROLES_SHA256:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair role hash drifted"
        )
    try:
        source_manifest = [
            _source_record(repo_root.resolve(), path)
            for path in _source_paths(repo_root)
        ]
    except Exact12PositiveMembershipSourceOrderBankError as exc:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair source manifest is not live-complete"
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
        "parent_apex_internal_shared_pair_common_five_bank": parent,
        "apex_internal_shared_pair_common_five_bank": copy.deepcopy(dict(parent_bank)),
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


def attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    bank_body = dict(bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    if not isinstance(bank_sha256, str) or _sha256_json(bank_body) != bank_sha256:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair bank hash drifted"
        )
    parent = bank.get("apex_internal_shared_pair_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "embedded apex-internal shared-pair bank is malformed"
        )
    try:
        attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources(
            repo_root, parent
        )
    except Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "embedded apex-internal shared-pair sources drifted"
        ) from exc
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
        or len(manifest) != len(expected_paths)
    ):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair source manifest is malformed"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
                "apex-first-opposite shared-pair source bytes or hashes drifted"
            )


def validate_apex_first_opposite_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    if not isinstance(bank, Mapping):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair family bank is not a mapping"
        )
    fresh = build_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair family differs from live authenticated rebuild"
        )


def install_apex_first_opposite_shared_pair_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    if getattr(
        instance,
        "_apex_first_opposite_shared_pair_common_five_membership_family_bank_installed",
        False,
    ):
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "apex-first-opposite shared-pair family is already installed"
        )
    bank = build_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_apex_first_opposite_shared_pair_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
    )
    compiled = _compile_reusing_parent_requirements(instance)
    expected = copy.deepcopy(bank["compiled"])
    expected.pop("compiled_sha256")
    expected.pop("final_dimacs_sha256")
    if compiled != expected:
        raise Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError(
            "installed family delta differs from authenticated bank"
        )
    instance._apex_first_opposite_shared_pair_common_five_membership_family_bank_installed = True
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
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "FAMILY_ID",
    "Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError",
    "attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources",
    "build_apex_first_opposite_shared_pair_common_five_membership_family_bank",
    "family_patterns",
    "family_roles",
    "install_apex_first_opposite_shared_pair_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_apex_first_opposite_shared_pair_common_five_membership_family_bank",
]
