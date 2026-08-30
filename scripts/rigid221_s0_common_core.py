#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Deterministic custody and common-core extraction for the two Rigid221 S0 cells.

This module deliberately does not call a solver.  It imports
``rigid221_s0_full_l1``, rebuilds both frozen formulas in memory, authenticates
their exact bytes, and emits two source-subset surfaces:

``legacy_decisive``
    Byte-identical replay of the two diagnostic UNSAT inputs.  Its known role
    selection bugs are retained and recorded so the historical evidence stays
    reproducible.

``retained_only``
    A symmetric repair that admits only the eight retained roles and only the
    five physical roles' cap-arm clauses.

Each surface is decomposed as a multiplicity-aware COMMON/I_ONLY/N_ONLY
multiset.  Split formulas share ``rigid221_s0_common__`` symbols:
``common.smt2`` is a declaration/assertion prefix, while each ``*_only.smt2``
is an assertion suffix ending in ``(check-sat)``.  Concatenating the common
prefix with either suffix reconstructs that branch's alpha-renamed multiset.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import tempfile
from collections import Counter, defaultdict, deque
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import z3

try:
    from scripts import rigid221_s0_full_l1 as full_l1
except ModuleNotFoundError:  # Direct execution: ``python scripts/<this-file>``.
    import rigid221_s0_full_l1 as full_l1  # type: ignore[no-redef]


SCHEMA = "rigid221-s0-common-core-custody/v1"
LEDGER_SCHEMA = "rigid221-s0-assertion-occurrence/v1"
GENERIC_NAMESPACE = "rigid221_s0_common"
RETAINED_ROLES = frozenset({"O", "m1", "m2", "u", "xu", "delta", "v", "xv"})
AUXILIARY_ROLES = frozenset(full_l1.ROLE_SET - RETAINED_ROLES)
PHYSICAL_CAP_ROLES = frozenset({"u", "xu", "delta", "v", "xv"})

CELL_ORDER = ("m0-distinct-s0-i", "m0-distinct-s0-n")
BRANCH_BY_CELL = {
    "m0-distinct-s0-i": "S0-I",
    "m0-distinct-s0-n": "S0-N",
}
SOURCE_ASSERTION_COUNT = 1365
SOURCE_CELL_SHA256 = {
    "m0-distinct-s0-i": "708bf91a0afb0a573b7fb33da517296bfd47e52acea6b8f1040c6660f1f0adcf",
    "m0-distinct-s0-n": "d91c12d084ec6d7313607152519e18d463220c0bd7dec1eb24eb5ef90583c7a7",
}
LEGACY_DECISIVE_SHA256 = {
    "m0-distinct-s0-i": "c5a4347c5cf9e70e8c77e34a3039dbaac4a74bbe2186a3ca0099abf7359a031b",
    "m0-distinct-s0-n": "96ca6876fbdee6c287e3ffcc6ddbf7711662a46ad07f8867fa412b11c2d8683c",
}
LEGACY_DECISIVE_COUNTS = {
    "m0-distinct-s0-i": 217,
    "m0-distinct-s0-n": 208,
}
RETAINED_ONLY_COUNT = 82

SURFACE_FILES = {
    "legacy_decisive": {
        "i": "s0_i_physical_min.smt2",
        "n": "s0_n_physical_min.smt2",
        "common": "common.smt2",
        "i_only": "i_only.smt2",
        "n_only": "n_only.smt2",
    },
    "retained_only": {
        "i": "s0_i_retained_only.smt2",
        "n": "s0_n_retained_only.smt2",
        "common": "retained_common.smt2",
        "i_only": "retained_i_only.smt2",
        "n_only": "retained_n_only.smt2",
    },
}
DATA_FILENAMES = tuple(
    filename for files in SURFACE_FILES.values() for filename in files.values()
) + ("assertion_ledger.jsonl",)
GENERATED_FILENAMES = DATA_FILENAMES + ("manifest.json", "SHA256SUMS")


class VerificationError(ValueError):
    """A deterministic source, selection, composition, or custody check failed."""

    def __init__(self, code: str, detail: str) -> None:
        super().__init__(f"{code}: {detail}")
        self.code = code
        self.detail = detail


@dataclass(frozen=True)
class SourceCell:
    """One exact regenerated source cell and its indexed occurrences."""

    cell: full_l1.Cell
    smt2: str
    header: str
    occurrences: tuple[AssertionOccurrence, ...]


@dataclass(frozen=True)
class AssertionOccurrence:
    """Occurrence-level identity; indices and multiplicity are authoritative."""

    cell_id: str
    branch: str
    source_assertion_index: int
    raw_assertion_text: str
    raw_assertion_sha256: str
    canonical_sexpr: str
    canonical_sexpr_sha256: str
    cell_alpha_sexpr: str
    cell_alpha_sexpr_sha256: str
    duplicate_ordinal: int
    semantic_group: str
    all_role_names: tuple[str, ...]
    auxiliary_roles: tuple[str, ...]
    dependency_flags: tuple[tuple[str, bool], ...]
    source_universal_status: str

    @property
    def occurrence_id(self) -> str:
        return f"{self.cell_id}:{self.source_assertion_index}"


@dataclass(frozen=True)
class MultiplicityPartition:
    """Stable occurrence indices for a multiplicity-aware two-way partition."""

    common_pairs: tuple[tuple[int, int], ...]
    left_only: tuple[int, ...]
    right_only: tuple[int, ...]


@dataclass(frozen=True)
class Surface:
    """Selected I/N occurrences and their deterministic multiset partition."""

    name: str
    i: tuple[AssertionOccurrence, ...]
    n: tuple[AssertionOccurrence, ...]
    partition: MultiplicityPartition


@dataclass(frozen=True)
class Bundle:
    """Fully materialized deterministic custody bundle."""

    files: Mapping[str, bytes]
    manifest: Mapping[str, Any]


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_text(value: str) -> str:
    return _sha256_bytes(value.encode("utf-8"))


def _canonical_json(value: object, *, pretty: bool = False) -> str:
    if pretty:
        return json.dumps(value, indent=2, sort_keys=True) + "\n"
    return json.dumps(value, separators=(",", ":"), sort_keys=True) + "\n"


def _cell_prefix(cell: full_l1.Cell) -> str:
    return re.sub(r"[^a-zA-Z0-9_]", "_", cell.cell_id)


def _alpha_rename(text: str, cell: full_l1.Cell) -> str:
    return text.replace(f"{_cell_prefix(cell)}__", f"{GENERIC_NAMESPACE}__")


def _normalize_sexpr(text: str) -> str:
    """Normalize Z3's width-dependent layout for this identifier-only corpus."""

    return re.sub(r"\s+", " ", text).strip()


def _roles_in_sexpr(sexpr: str, cell: full_l1.Cell) -> tuple[str, ...]:
    """Extract every coordinate role, including roles outside the retained set."""

    prefix = re.escape(_cell_prefix(cell))
    pattern = re.compile(rf"(?<![A-Za-z0-9_]){prefix}__([A-Za-z0-9]+)_[xy](?![A-Za-z0-9_])")
    found = frozenset(pattern.findall(sexpr))
    unknown = found - full_l1.ROLE_SET
    if unknown:
        raise VerificationError("unknown_role", f"{cell.cell_id}: {sorted(unknown)}")
    return tuple(role for role in full_l1.ROLE_ORDER if role in found)


def _semantic_group(index: int) -> str:
    if 0 <= index < 6:
        return "fixed_coordinates"
    if index < 9:
        return "positive_radii"
    if index < 100:
        return "pairwise_distinct"
    if index < 142:
        return "fiber_membership"
    if index < 156:
        return "mec_enclosure"
    if index < 159:
        return "mec_boundary"
    if index < 162:
        return "moser_nonobtuse"
    if index < 330:
        return "strict_convex_orientation"
    if index < 339:
        return "cap_endpoint"
    if index < 372:
        return "cap_arm"
    if index == 372:
        return "surplus_cap"
    if index == 373:
        return "j_membership_u"
    if index == 374:
        return "s0_branch_xu_membership"
    if index < SOURCE_ASSERTION_COUNT:
        return "no_qfree"
    raise VerificationError("assertion_index", f"unexpected source assertion {index}")


def _dependency_flags(group: str) -> tuple[tuple[str, bool], ...]:
    return (
        ("all_distinct_cell", group == "pairwise_distinct"),
        ("cyclic_order", group in {"strict_convex_orientation", "cap_arm"}),
        ("fixed_coordinate", group == "fixed_coordinates"),
        ("s0_branch", group == "s0_branch_xu_membership"),
    )


def _source_universal_status(group: str) -> str:
    if group in {
        "fixed_coordinates",
        "pairwise_distinct",
        "strict_convex_orientation",
        "cap_arm",
    }:
        return "CELL_RESTRICTION"
    return "SOURCE_MAPPED_CONSTRAINT"


def regenerate_source_cells() -> dict[str, SourceCell]:
    """Rebuild and authenticate both source cells without invoking ``check``."""

    result: dict[str, SourceCell] = {}
    for cell in full_l1.CELL_TEMPLATES:
        if cell.cell_id not in SOURCE_CELL_SHA256:
            continue
        solver, _points, _radii = full_l1.build_solver(cell, timeout_ms=1)
        assertions = tuple(solver.assertions())
        smt2 = full_l1.export_smt2(solver)
        actual_hash = _sha256_text(smt2)
        expected_hash = SOURCE_CELL_SHA256[cell.cell_id]
        if actual_hash != expected_hash:
            raise VerificationError(
                "source_hash",
                f"{cell.cell_id}: expected {expected_hash}, got {actual_hash}",
            )
        if len(assertions) != SOURCE_ASSERTION_COUNT:
            raise VerificationError(
                "source_assertion_count",
                f"{cell.cell_id}: expected {SOURCE_ASSERTION_COUNT}, got {len(assertions)}",
            )
        marker = smt2.find("(assert")
        if marker < 0:
            raise VerificationError("source_header", f"{cell.cell_id}: no assertion")
        header = smt2[:marker]
        seen: Counter[str] = Counter()
        occurrences: list[AssertionOccurrence] = []
        for index, assertion in enumerate(assertions):
            source_sexpr = assertion.sexpr()
            canonical = _normalize_sexpr(source_sexpr)
            alpha = _alpha_rename(canonical, cell)
            seen[alpha] += 1
            roles = _roles_in_sexpr(source_sexpr, cell)
            group = _semantic_group(index)
            raw = f"(assert {source_sexpr})"
            occurrences.append(
                AssertionOccurrence(
                    cell_id=cell.cell_id,
                    branch=cell.branch,
                    source_assertion_index=index,
                    raw_assertion_text=raw,
                    raw_assertion_sha256=_sha256_text(raw),
                    canonical_sexpr=canonical,
                    canonical_sexpr_sha256=_sha256_text(canonical),
                    cell_alpha_sexpr=alpha,
                    cell_alpha_sexpr_sha256=_sha256_text(alpha),
                    duplicate_ordinal=seen[alpha],
                    semantic_group=group,
                    all_role_names=roles,
                    auxiliary_roles=tuple(role for role in roles if role in AUXILIARY_ROLES),
                    dependency_flags=_dependency_flags(group),
                    source_universal_status=_source_universal_status(group),
                )
            )
        result[cell.cell_id] = SourceCell(cell, smt2, header, tuple(occurrences))

    if tuple(cell_id for cell_id in CELL_ORDER if cell_id in result) != CELL_ORDER:
        raise VerificationError("source_cells", f"expected {CELL_ORDER}, got {tuple(result)}")
    alpha_headers = {_alpha_rename(result[cell_id].header, result[cell_id].cell) for cell_id in CELL_ORDER}
    if len(alpha_headers) != 1:
        raise VerificationError("alpha_header", "I and N declaration headers differ")
    return result


def _base_selection_indices() -> set[int]:
    indices = set(range(9))
    indices.update(100 + 3 * full_l1.ROLE_ORDER.index(role) for role in full_l1.PHYSICAL)
    indices.update(142 + full_l1.ROLE_ORDER.index(role) for role in RETAINED_ROLES)
    indices.update(range(156, 162))
    indices.update(range(330, 339))
    return indices


def _legacy_indices(source: SourceCell) -> tuple[int, ...]:
    indices = _base_selection_indices()
    if source.cell.branch == "S0-I":
        # Historical bug: ROLE_ORDER includes three Moser roles, while cap-arm
        # assertions do not.  These offsets therefore leak cu/cv/au clauses.
        indices.update(
            339 + 3 * full_l1.ROLE_ORDER.index(role) + offset
            for role in RETAINED_ROLES
            for offset in range(3)
        )
    else:
        # The later N builder used the correct five physical cap-arm blocks.
        indices.update(range(339, 354))

    # Historical bug: names was built only from RETAINED_ROLES, so its subset
    # test was tautological.  The real predicate was merely nonempty overlap.
    indices.update(
        occurrence.source_assertion_index
        for occurrence in source.occurrences[162:330]
        if set(occurrence.all_role_names) & RETAINED_ROLES
    )
    return tuple(sorted(indices))


def _retained_only_indices(source: SourceCell) -> tuple[int, ...]:
    indices = _base_selection_indices()
    indices.update(range(339, 354))
    indices.update(
        occurrence.source_assertion_index
        for occurrence in source.occurrences[162:330]
        if occurrence.all_role_names
        and set(occurrence.all_role_names).issubset(RETAINED_ROLES)
    )
    return tuple(sorted(indices))


def multiplicity_partition(
    left_keys: Sequence[str], right_keys: Sequence[str]
) -> MultiplicityPartition:
    """Pair earliest equal occurrences, preserving both input orders."""

    right_by_key: dict[str, deque[int]] = defaultdict(deque)
    for index, key in enumerate(right_keys):
        right_by_key[key].append(index)

    common: list[tuple[int, int]] = []
    left_only: list[int] = []
    matched_right: set[int] = set()
    for left_index, key in enumerate(left_keys):
        candidates = right_by_key[key]
        if candidates:
            right_index = candidates.popleft()
            common.append((left_index, right_index))
            matched_right.add(right_index)
        else:
            left_only.append(left_index)
    right_only = [index for index in range(len(right_keys)) if index not in matched_right]
    return MultiplicityPartition(tuple(common), tuple(left_only), tuple(right_only))


def _build_surface(
    name: str,
    sources: Mapping[str, SourceCell],
    selector: Any,
) -> Surface:
    i_source = sources[CELL_ORDER[0]]
    n_source = sources[CELL_ORDER[1]]
    i = tuple(i_source.occurrences[index] for index in selector(i_source))
    n = tuple(n_source.occurrences[index] for index in selector(n_source))
    partition = multiplicity_partition(
        [occurrence.cell_alpha_sexpr for occurrence in i],
        [occurrence.cell_alpha_sexpr for occurrence in n],
    )
    return Surface(name, i, n, partition)


def build_surfaces(sources: Mapping[str, SourceCell]) -> dict[str, Surface]:
    surfaces = {
        "legacy_decisive": _build_surface("legacy_decisive", sources, _legacy_indices),
        "retained_only": _build_surface("retained_only", sources, _retained_only_indices),
    }
    _validate_selection_invariants(surfaces)
    return surfaces


def _selected_group_count(occurrences: Sequence[AssertionOccurrence], group: str) -> int:
    return sum(occurrence.semantic_group == group for occurrence in occurrences)


def _aux_group_count(occurrences: Sequence[AssertionOccurrence], group: str) -> int:
    return sum(
        occurrence.semantic_group == group and bool(occurrence.auxiliary_roles)
        for occurrence in occurrences
    )


def _validate_selection_invariants(surfaces: Mapping[str, Surface]) -> None:
    legacy = surfaces["legacy_decisive"]
    for occurrences, cell_id in zip((legacy.i, legacy.n), CELL_ORDER, strict=True):
        if len(occurrences) != LEGACY_DECISIVE_COUNTS[cell_id]:
            raise VerificationError(
                "legacy_count",
                f"{cell_id}: expected {LEGACY_DECISIVE_COUNTS[cell_id]}, got {len(occurrences)}",
            )
        if _selected_group_count(occurrences, "strict_convex_orientation") != 156:
            raise VerificationError("legacy_orientation_count", cell_id)
        if _aux_group_count(occurrences, "strict_convex_orientation") != 126:
            raise VerificationError("legacy_orientation_leaks", cell_id)
    if _aux_group_count(legacy.i, "cap_arm") != 9:
        raise VerificationError("legacy_i_cap_leaks", "expected 9")
    if _aux_group_count(legacy.n, "cap_arm") != 0:
        raise VerificationError("legacy_n_cap_leaks", "expected 0")

    retained = surfaces["retained_only"]
    for occurrences, cell_id in zip((retained.i, retained.n), CELL_ORDER, strict=True):
        if len(occurrences) != RETAINED_ONLY_COUNT:
            raise VerificationError(
                "retained_count",
                f"{cell_id}: expected {RETAINED_ONLY_COUNT}, got {len(occurrences)}",
            )
        if _selected_group_count(occurrences, "strict_convex_orientation") != 30:
            raise VerificationError("retained_orientation_count", cell_id)
        if _selected_group_count(occurrences, "cap_arm") != 15:
            raise VerificationError("retained_cap_count", cell_id)
        for occurrence in occurrences:
            if not set(occurrence.all_role_names).issubset(RETAINED_ROLES):
                raise VerificationError(
                    "retained_auxiliary_role", occurrence.occurrence_id
                )
            if occurrence.semantic_group == "cap_arm":
                subject = set(occurrence.all_role_names) - set(full_l1.MOSER)
                if len(subject) != 1 or not subject.issubset(PHYSICAL_CAP_ROLES):
                    raise VerificationError("retained_cap_role", occurrence.occurrence_id)


def _render_selected(source: SourceCell, occurrences: Sequence[AssertionOccurrence]) -> str:
    return source.header + "\n".join(item.raw_assertion_text for item in occurrences) + "\n"


def _generic_header(sources: Mapping[str, SourceCell]) -> str:
    source = sources[CELL_ORDER[0]]
    return _alpha_rename(source.header, source.cell)


def _render_common_prefix(
    surface: Surface, sources: Mapping[str, SourceCell]
) -> str:
    common = [surface.i[left].cell_alpha_sexpr for left, _right in surface.partition.common_pairs]
    return _generic_header(sources) + "\n".join(f"(assert {sexpr})" for sexpr in common) + "\n"


def _render_only_suffix(
    occurrences: Sequence[AssertionOccurrence], indices: Sequence[int]
) -> str:
    assertions = "\n".join(
        f"(assert {occurrences[index].cell_alpha_sexpr})" for index in indices
    )
    return (assertions + "\n" if assertions else "") + "(check-sat)\n"


def _validate_composition(
    surface: Surface,
    common_text: str,
    i_only_text: str,
    n_only_text: str,
) -> None:
    for branch, suffix, expected in (
        ("S0-I", i_only_text, surface.i),
        ("S0-N", n_only_text, surface.n),
    ):
        try:
            parsed = tuple(z3.parse_smt2_string(common_text + suffix))
        except z3.Z3Exception as exc:
            raise VerificationError("composition_parse", f"{surface.name}/{branch}: {exc}") from exc
        actual_multiset = Counter(_normalize_sexpr(assertion.sexpr()) for assertion in parsed)
        expected_multiset = Counter(item.cell_alpha_sexpr for item in expected)
        if actual_multiset != expected_multiset:
            raise VerificationError(
                "composition_multiset",
                f"{surface.name}/{branch}: parsed {len(parsed)}, expected {len(expected)}",
            )


def _selection_issues(occurrence: AssertionOccurrence, surface: str) -> tuple[str, ...]:
    issues: list[str] = []
    if surface == "legacy_decisive" and occurrence.auxiliary_roles:
        if occurrence.semantic_group == "strict_convex_orientation":
            issues.append("AUXILIARY_ORIENTATION_LEAK")
        if occurrence.semantic_group == "cap_arm":
            issues.append("AUXILIARY_CAP_OFFSET_LEAK")
    return tuple(issues)


def _ledger_rows(surfaces: Mapping[str, Surface]) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for surface_name in ("legacy_decisive", "retained_only"):
        surface = surfaces[surface_name]
        common_i = {left: pair for pair, (left, _right) in enumerate(surface.partition.common_pairs, 1)}
        common_n = {right: pair for pair, (_left, right) in enumerate(surface.partition.common_pairs, 1)}
        for side, occurrences, common_map, only_indices in (
            ("I", surface.i, common_i, set(surface.partition.left_only)),
            ("N", surface.n, common_n, set(surface.partition.right_only)),
        ):
            for selected_index, occurrence in enumerate(occurrences):
                common_pair = common_map.get(selected_index)
                partition = "COMMON" if common_pair is not None else f"{side}_ONLY"
                if common_pair is None and selected_index not in only_indices:
                    raise VerificationError("ledger_partition", occurrence.occurrence_id)
                rows.append(
                    {
                        "all_role_names": list(occurrence.all_role_names),
                        "auxiliary_roles": list(occurrence.auxiliary_roles),
                        "branch": occurrence.branch,
                        "canonical_sexpr": occurrence.canonical_sexpr,
                        "canonical_sexpr_sha256": occurrence.canonical_sexpr_sha256,
                        "cell_alpha_sexpr": occurrence.cell_alpha_sexpr,
                        "cell_alpha_sexpr_sha256": occurrence.cell_alpha_sexpr_sha256,
                        "cell_id": occurrence.cell_id,
                        "common_pair_ordinal": common_pair,
                        "dependency_flags": dict(occurrence.dependency_flags),
                        "duplicate_ordinal": occurrence.duplicate_ordinal,
                        "occurrence_id": occurrence.occurrence_id,
                        "partition": partition,
                        "raw_assertion_sha256": occurrence.raw_assertion_sha256,
                        "raw_assertion_text": occurrence.raw_assertion_text,
                        "schema": LEDGER_SCHEMA,
                        "selection_issues": list(_selection_issues(occurrence, surface_name)),
                        "semantic_group": occurrence.semantic_group,
                        "source_assertion_index": occurrence.source_assertion_index,
                        "source_universal_status": occurrence.source_universal_status,
                        "surface": surface_name,
                    }
                )
    return rows


def _surface_manifest(
    surface: Surface, files: Mapping[str, bytes]
) -> dict[str, Any]:
    names = SURFACE_FILES[surface.name]
    result: dict[str, Any] = {
        "cell_assertion_counts": {"S0-I": len(surface.i), "S0-N": len(surface.n)},
        "cell_files": {"S0-I": names["i"], "S0-N": names["n"]},
        "decomposition": {
            "common_count": len(surface.partition.common_pairs),
            "common_file": names["common"],
            "i_only_count": len(surface.partition.left_only),
            "i_only_file": names["i_only"],
            "n_only_count": len(surface.partition.right_only),
            "n_only_file": names["n_only"],
            "namespace": GENERIC_NAMESPACE,
            "composition": "common prefix + branch suffix; suffix ends with check-sat",
        },
        "file_sha256": {
            key: _sha256_bytes(files[filename]) for key, filename in names.items()
        },
    }
    if surface.name == "legacy_decisive":
        result["known_selection_bugs"] = {
            "S0-I": {
                "auxiliary_cap_offset_leaks": _aux_group_count(surface.i, "cap_arm"),
                "auxiliary_orientation_leaks": _aux_group_count(
                    surface.i, "strict_convex_orientation"
                ),
            },
            "S0-N": {
                "auxiliary_cap_offset_leaks": _aux_group_count(surface.n, "cap_arm"),
                "auxiliary_orientation_leaks": _aux_group_count(
                    surface.n, "strict_convex_orientation"
                ),
            },
            "orientation_predicate": "selected when any retained role occurred; the subset test was tautological",
            "s0_i_cap_predicate": "indexed non-Moser cap blocks with ROLE_ORDER offsets including Moser roles",
        }
    else:
        result["selection_invariants"] = {
            "allowed_roles": [role for role in full_l1.ROLE_ORDER if role in RETAINED_ROLES],
            "cap_arm_subject_roles": [
                role for role in full_l1.ROLE_ORDER if role in PHYSICAL_CAP_ROLES
            ],
            "auxiliary_role_occurrences": 0,
            "orientation_assertions_per_cell": 30,
        }
    return result


def build_bundle() -> Bundle:
    """Build every custody byte and validate composition before any write."""

    sources = regenerate_source_cells()
    surfaces = build_surfaces(sources)
    files: dict[str, bytes] = {}

    for surface_name in ("legacy_decisive", "retained_only"):
        surface = surfaces[surface_name]
        names = SURFACE_FILES[surface_name]
        i_text = _render_selected(sources[CELL_ORDER[0]], surface.i)
        n_text = _render_selected(sources[CELL_ORDER[1]], surface.n)
        common_text = _render_common_prefix(surface, sources)
        i_only_text = _render_only_suffix(surface.i, surface.partition.left_only)
        n_only_text = _render_only_suffix(surface.n, surface.partition.right_only)
        _validate_composition(surface, common_text, i_only_text, n_only_text)
        files[names["i"]] = i_text.encode("utf-8")
        files[names["n"]] = n_text.encode("utf-8")
        files[names["common"]] = common_text.encode("utf-8")
        files[names["i_only"]] = i_only_text.encode("utf-8")
        files[names["n_only"]] = n_only_text.encode("utf-8")

    for cell_id, filename in zip(
        CELL_ORDER,
        (SURFACE_FILES["legacy_decisive"]["i"], SURFACE_FILES["legacy_decisive"]["n"]),
        strict=True,
    ):
        actual = _sha256_bytes(files[filename])
        expected = LEGACY_DECISIVE_SHA256[cell_id]
        if actual != expected:
            raise VerificationError(
                "legacy_hash", f"{cell_id}: expected {expected}, got {actual}"
            )

    ledger_rows = _ledger_rows(surfaces)
    files["assertion_ledger.jsonl"] = "".join(
        _canonical_json(row) for row in ledger_rows
    ).encode("utf-8")

    manifest: dict[str, Any] = {
        "schema": SCHEMA,
        "claim_scope": "BOUNDED_FIXED_ORDER_SOURCE_SUBSETS_ONLY",
        "generator": {
            "encoding_version": full_l1.ENCODING_VERSION,
            "full_l1_script_sha256": full_l1.current_script_sha256(),
            "script": "scripts/rigid221_s0_common_core.py",
            "script_sha256": _sha256_bytes(Path(__file__).read_bytes()),
            "solver_calls": 0,
        },
        "ledger": {
            "file": "assertion_ledger.jsonl",
            "rows": len(ledger_rows),
            "sha256": _sha256_bytes(files["assertion_ledger.jsonl"]),
        },
        "source_cells": {
            cell_id: {
                "assertions": len(sources[cell_id].occurrences),
                "branch": BRANCH_BY_CELL[cell_id],
                "sha256": _sha256_text(sources[cell_id].smt2),
            }
            for cell_id in CELL_ORDER
        },
        "split_contract": {
            "common_file": "set-logic + declarations + common assertions; no check-sat",
            "only_file": "branch-only assertions + terminal check-sat; no declarations",
            "reconstruction": "concatenate common bytes and selected branch-only bytes",
            "symbol_namespace": GENERIC_NAMESPACE,
        },
        "surfaces": {
            name: _surface_manifest(surfaces[name], files)
            for name in ("legacy_decisive", "retained_only")
        },
        "files": {
            filename: {
                "bytes": len(files[filename]),
                "sha256": _sha256_bytes(files[filename]),
            }
            for filename in sorted(files)
        },
    }
    files["manifest.json"] = _canonical_json(manifest, pretty=True).encode("utf-8")
    files["SHA256SUMS"] = "".join(
        f"{_sha256_bytes(files[filename])}  {filename}\n"
        for filename in sorted(files)
    ).encode("utf-8")
    if set(files) != set(GENERATED_FILENAMES):
        raise VerificationError(
            "generated_files", f"expected {sorted(GENERATED_FILENAMES)}, got {sorted(files)}"
        )
    return Bundle(files, manifest)


def _atomic_write(path: Path, content: bytes) -> None:
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if temporary.exists():
            temporary.unlink()


def write_bundle(output_dir: Path, *, replace: bool = False) -> Bundle:
    bundle = build_bundle()
    if output_dir.is_symlink():
        raise VerificationError("output_symlink", str(output_dir))
    output_dir.mkdir(parents=True, exist_ok=True)
    for filename in GENERATED_FILENAMES:
        path = output_dir / filename
        if path.is_symlink():
            raise VerificationError("artifact_symlink", filename)
        content = bundle.files[filename]
        if path.exists() and path.read_bytes() != content and not replace:
            raise VerificationError(
                "existing_artifact_mismatch",
                f"{filename}; pass --replace only after reviewing the mutation",
            )
    for filename in GENERATED_FILENAMES:
        path = output_dir / filename
        content = bundle.files[filename]
        if not path.exists() or path.read_bytes() != content:
            _atomic_write(path, content)
    verify_bundle(output_dir, expected=bundle)
    return bundle


def verify_bundle(output_dir: Path, *, expected: Bundle | None = None) -> Bundle:
    bundle = expected if expected is not None else build_bundle()
    for filename in GENERATED_FILENAMES:
        path = output_dir / filename
        if path.is_symlink() or not path.is_file():
            raise VerificationError("artifact_missing_or_symlink", filename)
        actual = path.read_bytes()
        wanted = bundle.files[filename]
        if actual != wanted:
            raise VerificationError(
                "artifact_bytes",
                f"{filename}: expected {_sha256_bytes(wanted)}, got {_sha256_bytes(actual)}",
            )
    return bundle


def _summary(action: str, output_dir: Path, bundle: Bundle, *, verbose: bool) -> str:
    surfaces = bundle.manifest["surfaces"]
    result: dict[str, Any] = {
        "action": action,
        "output_dir": str(output_dir),
        "status": "VERIFIED",
    }
    if verbose:
        result.update(
            {
                "files": len(bundle.files),
                "legacy": surfaces["legacy_decisive"]["cell_assertion_counts"],
                "legacy_decomposition": surfaces["legacy_decisive"]["decomposition"],
                "retained": surfaces["retained_only"]["cell_assertion_counts"],
                "retained_decomposition": surfaces["retained_only"]["decomposition"],
            }
        )
    return _canonical_json(result, pretty=verbose).rstrip()


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    generate = subparsers.add_parser("generate", help="emit an authenticated bundle")
    generate.add_argument("--output-dir", type=Path, required=True)
    generate.add_argument("--replace", action="store_true")
    generate.add_argument("--verbose", action="store_true")
    verify = subparsers.add_parser("verify", help="regenerate and compare every byte")
    verify.add_argument("--output-dir", type=Path, required=True)
    verify.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        if args.command == "generate":
            bundle = write_bundle(args.output_dir, replace=args.replace)
        else:
            bundle = verify_bundle(args.output_dir)
        print(_summary(args.command, args.output_dir, bundle, verbose=args.verbose))
        return 0
    except (OSError, VerificationError) as exc:
        print(f"ERROR {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
