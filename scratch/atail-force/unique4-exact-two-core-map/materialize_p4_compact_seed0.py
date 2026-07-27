#!/usr/bin/env python3
"""Materialize the authenticated P4 seed-0 compact exact-two CNF.

This is deliberately a finite-artifact operation.  It selects the recorded
28 retained families from the hashed P4 input core, preserves authenticated
core-occurrence order, densely renumbers the used variables, and emits no SAT
or proof claim beyond the source greedy artifact's recorded external result.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
SELECTION_PATH = HERE / "p4.greedy-family-largest-seed0.json"
OUTPUT_DIR = HERE / "generated" / "p4-seed0-compact"

SELECTION_SHA256 = (
    "bec58bf074615aebcdd6ce2883ef7fc0bee1676e046ee0570a1b95bea2a878a6"
)
CORE_SHA256 = (
    "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b"
)
MAP_SHA256 = (
    "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b"
)
FAMILY_ABLATION_SHA256 = (
    "04314f610448e747b95a3b71a56c3622ef00980eb6ad24a32b5ac6eb4b006d63"
)
EXTRACTION_SHA256 = (
    "e376a612cf74d279cefab2b16ea372f3e256da9e880ca6166462b41887b7de3e"
)

EXPECTED_PROFILE = 4
EXPECTED_SEED = 0
EXPECTED_CORE_VARIABLE_COUNT = 12_672
EXPECTED_CORE_CLAUSE_COUNT = 48_605
EXPECTED_COMPACT_VARIABLE_COUNT = 2_557
EXPECTED_COMPACT_CLAUSE_COUNT = 19_048

EXPECTED_FAMILY_COUNTS: dict[str, int] = {
    "blocker_center_row_eq_critical_support": 29,
    "class_source_critical_support_eq_class": 19,
    "critical_support_at_least_4": 2,
    "critical_support_eq_full_radius_class": 69,
    "critical_support_excludes_center": 2,
    "direct_memberships_imply_row_pattern": 1_265,
    "direct_no_four_turn_disjoint_outer_arcs": 6_170,
    "direct_row_pattern_implies_outer_arc": 3_179,
    "exact_two_left_adjacent_hit_at_least_1": 1,
    "exact_two_right_adjacent_hit_at_least_1": 1,
    "exact_two_strict_hits_at_least_2": 2,
    "first_apex_class_pairwise_equal": 1,
    "first_apex_fiber_eq_class": 10,
    "first_apex_not_in_own_class": 1,
    "first_apex_row_eq_class": 18,
    "full_class_cyclic_alternation": 1_279,
    "full_linear_kalmanson_cegar_cut": 6,
    "mutual_triangle_cross_center_radius_transport": 392,
    "radius_partition_transitivity": 3_218,
    "row_at_least_4": 981,
    "selected_row_endpoint_own_cap_at_most_one_0": 12,
    "selected_row_endpoint_own_cap_at_most_one_1": 5,
    "selected_row_endpoint_own_cap_at_most_one_2": 12,
    "selected_row_own_cap_at_most_two_0": 12,
    "selected_row_own_cap_at_most_two_1": 2,
    "selected_row_own_cap_at_most_two_2": 12,
    "selected_row_subset_radius_class": 441,
    "verified_kalmanson_order_schema_cut": 1_907,
}

CNF_NAME = "p4-seed0-compact.cnf"
OCCURRENCES_NAME = "p4-seed0-compact-occurrences.jsonl"
MANIFEST_NAME = "p4-seed0-compact-manifest.json"
OUTPUT_NAMES = frozenset({CNF_NAME, OCCURRENCES_NAME, MANIFEST_NAME})


class MaterializationError(ValueError):
    """An authenticated input or deterministic output invariant failed."""


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        separators=(",", ":"),
        sort_keys=True,
    ).encode("utf-8")


def pretty_json_bytes(value: Any) -> bytes:
    return (
        json.dumps(value, ensure_ascii=True, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")


def require_sha256(path: Path, expected: str, label: str) -> None:
    actual = sha256_file(path)
    if actual != expected:
        raise MaterializationError(
            f"{label} SHA-256 drift: expected {expected}, got {actual}"
        )


def _has_parent_traversal(raw_path: str) -> bool:
    return ".." in Path(raw_path).parts


def resolve_source_dependency(
    raw_path: str,
    *,
    source_dir: Path,
    expected_name: str,
    label: str,
) -> Path:
    """Resolve one manifest dependency without permitting path traversal."""

    if not raw_path or "\x00" in raw_path or _has_parent_traversal(raw_path):
        raise MaterializationError(f"{label} path contains traversal or NUL")
    source_root = source_dir.resolve(strict=True)
    given = Path(raw_path)
    candidate = given if given.is_absolute() else source_root / given
    try:
        resolved = candidate.resolve(strict=True)
    except OSError as error:
        raise MaterializationError(f"{label} path does not resolve") from error
    if resolved.parent != source_root or resolved.name != expected_name:
        raise MaterializationError(
            f"{label} path escapes or differs from its expected source file"
        )
    if candidate.is_symlink() or not resolved.is_file():
        raise MaterializationError(f"{label} must be a regular non-symlink file")
    return resolved


def safe_output_path(output_dir: Path, filename: str) -> Path:
    if (
        not filename
        or Path(filename).name != filename
        or _has_parent_traversal(filename)
        or "\x00" in filename
    ):
        raise MaterializationError("output filename contains traversal")
    root = output_dir.resolve()
    candidate = (root / filename).resolve()
    if candidate.parent != root:
        raise MaterializationError("output path escapes its dedicated directory")
    return candidate


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    variable_count: int | None = None
    expected_clause_count: int | None = None
    clauses: list[tuple[int, ...]] = []
    with path.open("r", encoding="ascii") as stream:
        for line_number, raw_line in enumerate(stream, 1):
            line = raw_line.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p "):
                if variable_count is not None:
                    raise MaterializationError(
                        f"{path}:{line_number}: duplicate DIMACS header"
                    )
                fields = line.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise MaterializationError(
                        f"{path}:{line_number}: malformed DIMACS header"
                    )
                variable_count = int(fields[2])
                expected_clause_count = int(fields[3])
                if variable_count <= 0 or expected_clause_count <= 0:
                    raise MaterializationError(
                        f"{path}:{line_number}: nonpositive DIMACS count"
                    )
                continue
            if variable_count is None:
                raise MaterializationError(
                    f"{path}:{line_number}: clause before DIMACS header"
                )
            values = tuple(map(int, line.split()))
            if not values or values[-1] != 0 or 0 in values[:-1]:
                raise MaterializationError(
                    f"{path}:{line_number}: malformed DIMACS clause"
                )
            clause = values[:-1]
            if not clause:
                raise MaterializationError(
                    f"{path}:{line_number}: empty DIMACS clause"
                )
            if len(set(clause)) != len(clause):
                raise MaterializationError(
                    f"{path}:{line_number}: duplicate literal"
                )
            if any(abs(literal) > variable_count for literal in clause):
                raise MaterializationError(
                    f"{path}:{line_number}: variable outside DIMACS header"
                )
            clauses.append(clause)
    if variable_count is None or expected_clause_count is None:
        raise MaterializationError(f"{path}: missing DIMACS header")
    if len(clauses) != expected_clause_count:
        raise MaterializationError(
            f"{path}: header count {expected_clause_count} != {len(clauses)}"
        )
    return variable_count, clauses


def _load_json(path: Path, label: str) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as error:
        raise MaterializationError(f"{label} is not valid UTF-8 JSON") from error
    if not isinstance(value, dict):
        raise MaterializationError(f"{label} JSON root is not an object")
    return value


def validate_selection(
    selection_path: Path = SELECTION_PATH,
    *,
    source_dir: Path = HERE,
) -> tuple[
    dict[str, Any],
    Path,
    Path,
    Path,
    Path,
]:
    source_root = source_dir.resolve(strict=True)
    selection = resolve_source_dependency(
        str(selection_path),
        source_dir=source_root,
        expected_name=SELECTION_PATH.name,
        label="seed-0 selection",
    )
    require_sha256(selection, SELECTION_SHA256, "seed-0 selection")
    greedy = _load_json(selection, "seed-0 selection")
    if (
        greedy.get("schema")
        != "p97-unique4-exact-two-greedy-family-core-v1"
        or int(greedy.get("profile", -1)) != EXPECTED_PROFILE
        or int(greedy.get("seed", -1)) != EXPECTED_SEED
        or greedy.get("order") != "largest"
        or greedy.get("final_solver_result", {}).get("status") != "UNSAT"
    ):
        raise MaterializationError("seed-0 selection identity drifted")

    retained = list(map(str, greedy.get("retained_families", [])))
    if retained != sorted(EXPECTED_FAMILY_COUNTS):
        raise MaterializationError("retained family names/order drifted")
    if (
        int(greedy.get("retained_family_count", -1))
        != len(EXPECTED_FAMILY_COUNTS)
        or int(greedy.get("retained_clause_count", -1))
        != EXPECTED_COMPACT_CLAUSE_COUNT
        or int(greedy["final_solver_result"].get("kept_clause_count", -1))
        != EXPECTED_COMPACT_CLAUSE_COUNT
        or int(greedy["final_solver_result"].get("removed_clause_count", -1))
        != EXPECTED_CORE_CLAUSE_COUNT - EXPECTED_COMPACT_CLAUSE_COUNT
    ):
        raise MaterializationError("seed-0 selection count drifted")
    mandatory = set(map(str, greedy.get("mandatory_families", [])))
    retained_optional = set(
        map(str, greedy.get("retained_optional_families", []))
    )
    if (
        mandatory | retained_optional != set(retained)
        or mandatory & retained_optional
        or len(mandatory) != 27
        or retained_optional != {"critical_support_excludes_center"}
    ):
        raise MaterializationError("mandatory/optional family partition drifted")

    core_record = greedy.get("core", {})
    map_record = greedy.get("map", {})
    ablation_record = greedy.get("family_ablation", {})
    core_path = resolve_source_dependency(
        str(core_record.get("path", "")),
        source_dir=source_root,
        expected_name="p4.input-core.cnf",
        label="source core",
    )
    map_path = resolve_source_dependency(
        str(map_record.get("path", "")),
        source_dir=source_root,
        expected_name="p4.input-core-map.json",
        label="source occurrence map",
    )
    ablation_path = resolve_source_dependency(
        str(ablation_record.get("path", "")),
        source_dir=source_root,
        expected_name="p4.family-ablation.json",
        label="family ablation",
    )
    if (
        core_record.get("sha256") != CORE_SHA256
        or map_record.get("sha256") != MAP_SHA256
        or ablation_record.get("sha256") != FAMILY_ABLATION_SHA256
        or int(core_record.get("variable_count", -1))
        != EXPECTED_CORE_VARIABLE_COUNT
        or int(core_record.get("clause_count", -1))
        != EXPECTED_CORE_CLAUSE_COUNT
    ):
        raise MaterializationError("selection dependency record drifted")
    require_sha256(core_path, CORE_SHA256, "source core")
    require_sha256(map_path, MAP_SHA256, "source occurrence map")
    require_sha256(
        ablation_path, FAMILY_ABLATION_SHA256, "family ablation"
    )
    return greedy, selection, core_path, map_path, ablation_path


def validate_map_and_select(
    mapping: dict[str, Any],
    clauses: list[tuple[int, ...]],
    *,
    retained: set[str],
    source_dir: Path,
) -> tuple[list[dict[str, Any]], Counter[str], Path]:
    if (
        mapping.get("schema")
        != "p97-unique4-exact-two-drat-input-core-map-v1"
        or int(mapping.get("profile", -1)) != EXPECTED_PROFILE
    ):
        raise MaterializationError("source occurrence-map identity drifted")
    core_record = mapping.get("core", {})
    if (
        core_record.get("sha256") != CORE_SHA256
        or int(core_record.get("header_variable_count", -1))
        != EXPECTED_CORE_VARIABLE_COUNT
        or int(core_record.get("clause_count", -1))
        != EXPECTED_CORE_CLAUSE_COUNT
    ):
        raise MaterializationError("occurrence-map core authentication drifted")
    summary = mapping.get("matching_summary", {})
    if (
        summary.get("allocation_is_injective") is not True
        or int(summary.get("core_clause_count", -1))
        != EXPECTED_CORE_CLAUSE_COUNT
        or int(summary.get("allocated_input_occurrence_count", -1))
        != EXPECTED_CORE_CLAUSE_COUNT
        or int(summary.get("canonically_unmatched_count", -1)) != 0
    ):
        raise MaterializationError("occurrence-map allocation invariant drifted")
    provenance = mapping.get("input_occurrence_provenance_invariants", {})
    if (
        provenance.get("clause_order_preserved") is not True
        or provenance.get("literal_order_preserved") is not True
        or provenance.get("duplicate_occurrences_preserved") is not True
        or provenance.get("duplicate_literals_rejected") is not True
        or provenance.get("indexing")
        != "one_based_dimacs_clause_occurrence"
    ):
        raise MaterializationError("input-occurrence provenance drifted")

    extraction = mapping.get("extraction_authentication", {})
    if (
        extraction.get("schema") != "p97-exacttwo-drat-core-extraction-v1"
        or int(extraction.get("profile", -1)) != EXPECTED_PROFILE
        or extraction.get("sha256") != EXTRACTION_SHA256
        or extraction.get("core_sha256") != CORE_SHA256
        or extraction.get("drat_trim_verdict") != "s VERIFIED"
    ):
        raise MaterializationError("core-extraction authentication drifted")
    extraction_path = resolve_source_dependency(
        str(extraction.get("path", "")),
        source_dir=source_dir,
        expected_name="p4.input-core-extraction.json",
        label="core extraction manifest",
    )
    require_sha256(
        extraction_path, EXTRACTION_SHA256, "core extraction manifest"
    )

    entries = mapping.get("core_clauses")
    if not isinstance(entries, list) or len(entries) != len(clauses):
        raise MaterializationError("occurrence-map/core count mismatch")
    selected: list[dict[str, Any]] = []
    counts: Counter[str] = Counter()
    allocated_input_indices: set[int] = set()
    for expected_index, (clause, entry) in enumerate(
        zip(clauses, entries, strict=True), 1
    ):
        if not isinstance(entry, dict):
            raise MaterializationError("occurrence-map entry is not an object")
        if int(entry.get("core_clause_index", -1)) != expected_index:
            raise MaterializationError("core occurrence order drifted")
        if entry.get("core_clause_literal_order") != list(clause):
            raise MaterializationError("core/map literal order drifted")
        canonical = sorted(clause)
        if entry.get("canonical_signed_literal_multiset") != canonical:
            raise MaterializationError("canonical clause identity drifted")
        input_index = int(entry.get("allocated_input_clause_index", -1))
        input_literals = entry.get("allocated_input_clause_literal_order")
        if (
            input_index <= 0
            or input_index > 2_765_403
            or input_index in allocated_input_indices
            or not isinstance(input_literals, list)
            or sorted(input_literals) != canonical
        ):
            raise MaterializationError(
                "allocated source occurrence is invalid or noninjective"
            )
        allocated_input_indices.add(input_index)
        family = str(entry.get("allocated_family", ""))
        possible = entry.get("possible_families")
        if (
            not family
            or not isinstance(possible, list)
            or family not in possible
        ):
            raise MaterializationError("allocated family provenance drifted")
        candidates = entry.get("candidate_provenance")
        if not isinstance(candidates, list) or not any(
            isinstance(candidate, dict)
            and str(candidate.get("family")) == family
            and int(candidate.get("input_clause_index", -1)) == input_index
            and candidate.get("input_clause_literal_order") == input_literals
            for candidate in candidates
        ):
            raise MaterializationError("allocated occurrence candidate missing")
        if family in retained:
            selected.append(entry)
            counts[family] += 1
    if len(allocated_input_indices) != EXPECTED_CORE_CLAUSE_COUNT:
        raise MaterializationError("source occurrence allocation count drifted")
    if dict(sorted(counts.items())) != EXPECTED_FAMILY_COUNTS:
        raise MaterializationError("selected family ledger drifted")
    if len(selected) != EXPECTED_COMPACT_CLAUSE_COUNT:
        raise MaterializationError("selected clause count drifted")
    return selected, counts, extraction_path


def _render_artifacts(
    clauses: list[tuple[int, ...]],
    selected_entries: list[dict[str, Any]],
) -> tuple[bytes, bytes, dict[int, int], list[tuple[int, ...]]]:
    selected_source_clauses = [
        clauses[int(entry["core_clause_index"]) - 1]
        for entry in selected_entries
    ]
    used_source_variables = sorted(
        {
            abs(literal)
            for clause in selected_source_clauses
            for literal in clause
        }
    )
    if len(used_source_variables) != EXPECTED_COMPACT_VARIABLE_COUNT:
        raise MaterializationError("compact variable count drifted")
    dense_map = {
        source_variable: dense_variable
        for dense_variable, source_variable in enumerate(
            used_source_variables, 1
        )
    }
    dense_clauses = [
        tuple(
            dense_map[abs(literal)]
            if literal > 0
            else -dense_map[abs(literal)]
            for literal in clause
        )
        for clause in selected_source_clauses
    ]
    cnf_lines = [
        f"p cnf {EXPECTED_COMPACT_VARIABLE_COUNT} "
        f"{EXPECTED_COMPACT_CLAUSE_COUNT}"
    ]
    cnf_lines.extend(
        " ".join(map(str, clause)) + " 0" for clause in dense_clauses
    )
    cnf_bytes = ("\n".join(cnf_lines) + "\n").encode("ascii")

    occurrence_lines: list[bytes] = []
    for output_index, (entry, source_clause, dense_clause) in enumerate(
        zip(
            selected_entries,
            selected_source_clauses,
            dense_clauses,
            strict=True,
        ),
        1,
    ):
        record = {
            "dense_literals": list(dense_clause),
            "family": str(entry["allocated_family"]),
            "match_status": str(entry["match_status"]),
            "output_clause_index": output_index,
            "source_core_clause_index": int(entry["core_clause_index"]),
            "source_core_literals": list(source_clause),
            "source_terminal_clause_index": int(
                entry["allocated_input_clause_index"]
            ),
            "source_terminal_literals": entry[
                "allocated_input_clause_literal_order"
            ],
        }
        occurrence_lines.append(canonical_json_bytes(record) + b"\n")
    occurrences_bytes = b"".join(occurrence_lines)
    return cnf_bytes, occurrences_bytes, dense_map, dense_clauses


def _source_record(path: Path) -> dict[str, Any]:
    return {
        "path": path.relative_to(HERE).as_posix(),
        "sha256": sha256_file(path),
    }


def _artifact_record(
    output_dir: Path, filename: str, data: bytes
) -> dict[str, Any]:
    safe_output_path(output_dir, filename)
    return {
        "byte_count": len(data),
        "path": filename,
        "sha256": sha256_bytes(data),
    }


def stable_digest_payload(manifest: dict[str, Any]) -> dict[str, Any]:
    """Return exactly the path-stable formula identity committed by the digest."""

    return {
        "clause_order": manifest["clause_order"],
        "compact_cnf": {
            "clause_count": manifest["compact_cnf"]["clause_count"],
            "sha256": manifest["compact_cnf"]["sha256"],
            "variable_count": manifest["compact_cnf"]["variable_count"],
        },
        "dense_variable_renaming": manifest["dense_variable_renaming"],
        "family_ledger": manifest["family_ledger"],
        "profile": manifest["profile"],
        "seed": manifest["seed"],
        "source_occurrence_mapping": {
            "record_count": manifest["source_occurrence_mapping"][
                "record_count"
            ],
            "sha256": manifest["source_occurrence_mapping"]["sha256"],
        },
        "sources": {
            role: {"sha256": record["sha256"]}
            for role, record in sorted(manifest["sources"].items())
        },
    }


def compute_stable_digest(manifest: dict[str, Any]) -> str:
    return sha256_bytes(canonical_json_bytes(stable_digest_payload(manifest)))


def _atomic_write(path: Path, data: bytes) -> None:
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    with temporary.open("wb") as stream:
        stream.write(data)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def _validate_output_directory(output_dir: Path) -> None:
    if output_dir.exists() and output_dir.is_symlink():
        raise MaterializationError("output directory may not be a symlink")
    output_dir.mkdir(parents=True, exist_ok=True)
    unexpected = {
        child.name
        for child in output_dir.iterdir()
        if child.name not in OUTPUT_NAMES
    }
    if unexpected:
        raise MaterializationError(
            "dedicated output directory contains unexpected files: "
            + ", ".join(sorted(unexpected))
        )
    for filename in OUTPUT_NAMES:
        path = safe_output_path(output_dir, filename)
        if path.exists() and (path.is_symlink() or not path.is_file()):
            raise MaterializationError(
                f"owned output is not a regular file: {filename}"
            )


def materialize(
    output_dir: Path = OUTPUT_DIR,
    *,
    selection_path: Path = SELECTION_PATH,
    source_dir: Path = HERE,
) -> dict[str, Any]:
    greedy, selection, core_path, map_path, ablation_path = (
        validate_selection(selection_path, source_dir=source_dir)
    )
    variable_count, clauses = parse_dimacs(core_path)
    if (
        variable_count != EXPECTED_CORE_VARIABLE_COUNT
        or len(clauses) != EXPECTED_CORE_CLAUSE_COUNT
    ):
        raise MaterializationError("source core DIMACS counts drifted")
    mapping = _load_json(map_path, "source occurrence map")
    retained = set(map(str, greedy["retained_families"]))
    selected_entries, counts, extraction_path = validate_map_and_select(
        mapping,
        clauses,
        retained=retained,
        source_dir=source_dir.resolve(strict=True),
    )
    cnf_bytes, occurrences_bytes, dense_map, dense_clauses = _render_artifacts(
        clauses, selected_entries
    )
    if len(dense_clauses) != EXPECTED_COMPACT_CLAUSE_COUNT:
        raise MaterializationError("rendered compact clause count drifted")

    _validate_output_directory(output_dir)
    cnf_record = _artifact_record(output_dir, CNF_NAME, cnf_bytes)
    occurrence_record = _artifact_record(
        output_dir, OCCURRENCES_NAME, occurrences_bytes
    )
    manifest: dict[str, Any] = {
        "schema": "p97-unique4-exact-two-p4-seed0-compact-materialization-v1",
        "epistemic_status": (
            "DETERMINISTIC RECONSTRUCTION OF THE HASHED FIXED-N P4 "
            "SELECTION; RECORDED EXTERNAL UNSAT ONLY; NO LRAT OR LEAN CLOSURE"
        ),
        "claim_scope": (
            "This manifest authenticates clause selection, ordering, dense "
            "renaming, and source occurrence allocation. It does not prove "
            "a source-to-CNF bridge or kernel-check UNSAT."
        ),
        "profile": EXPECTED_PROFILE,
        "seed": EXPECTED_SEED,
        "sources": {
            "core": _source_record(core_path),
            "core_extraction": _source_record(extraction_path),
            "family_ablation": _source_record(ablation_path),
            "occurrence_map": _source_record(map_path),
            "selection": _source_record(selection),
        },
        "inherited_terminal_authentication": {
            "clause_count": int(
                mapping["terminal_verification"]["clause_count"]
            ),
            "core_extraction_verdict": mapping["extraction_authentication"][
                "drat_trim_verdict"
            ],
            "drat_sha256": mapping["extraction_authentication"][
                "proof_sha256"
            ],
            "terminal_sha256": mapping["terminal_verification"]["sha256"],
            "variable_count": int(
                mapping["terminal_verification"]["variable_count"]
            ),
        },
        "clause_order": {
            "policy": (
                "ascending_authenticated_source_core_clause_index; "
                "literal_order_preserved_from_source_core"
            ),
            "first_source_core_clause_index": int(
                selected_entries[0]["core_clause_index"]
            ),
            "last_source_core_clause_index": int(
                selected_entries[-1]["core_clause_index"]
            ),
        },
        "family_ledger": [
            {"clause_count": count, "family": family}
            for family, count in sorted(counts.items())
        ],
        "dense_variable_renaming": {
            "dense_variable_count": len(dense_map),
            "old_to_new": [
                [source, dense]
                for source, dense in sorted(dense_map.items())
            ],
            "policy": (
                "sorted_used_positive_source_variable_ids_to_contiguous_"
                "one_based_ids"
            ),
            "source_header_variable_count": variable_count,
        },
        "compact_cnf": {
            **cnf_record,
            "clause_count": len(dense_clauses),
            "variable_count": len(dense_map),
        },
        "source_occurrence_mapping": {
            **occurrence_record,
            "record_count": len(selected_entries),
            "schema": (
                "canonical-json-lines; one record per compact clause in "
                "output order"
            ),
        },
        "generator": _source_record(Path(__file__).resolve()),
    }
    manifest["stable_digest"] = {
        "algorithm": "sha256(canonical-json(stable_digest_payload))",
        "sha256": compute_stable_digest(manifest),
    }
    manifest_bytes = pretty_json_bytes(manifest)

    _atomic_write(safe_output_path(output_dir, CNF_NAME), cnf_bytes)
    _atomic_write(
        safe_output_path(output_dir, OCCURRENCES_NAME), occurrences_bytes
    )
    _atomic_write(
        safe_output_path(output_dir, MANIFEST_NAME), manifest_bytes
    )
    verify_generated(output_dir)
    return manifest


def verify_generated(output_dir: Path = OUTPUT_DIR) -> dict[str, Any]:
    _validate_output_directory(output_dir)
    manifest_path = safe_output_path(output_dir, MANIFEST_NAME)
    if not manifest_path.is_file():
        raise MaterializationError("generated manifest is missing")
    manifest = _load_json(manifest_path, "generated manifest")
    if (
        manifest.get("schema")
        != "p97-unique4-exact-two-p4-seed0-compact-materialization-v1"
        or int(manifest.get("profile", -1)) != EXPECTED_PROFILE
        or int(manifest.get("seed", -1)) != EXPECTED_SEED
    ):
        raise MaterializationError("generated manifest identity drifted")
    if manifest.get("family_ledger") != [
        {"clause_count": count, "family": family}
        for family, count in sorted(EXPECTED_FAMILY_COUNTS.items())
    ]:
        raise MaterializationError("generated family ledger drifted")
    cnf_path = safe_output_path(output_dir, CNF_NAME)
    occurrences_path = safe_output_path(output_dir, OCCURRENCES_NAME)
    require_sha256(
        cnf_path, manifest["compact_cnf"]["sha256"], "generated compact CNF"
    )
    require_sha256(
        occurrences_path,
        manifest["source_occurrence_mapping"]["sha256"],
        "generated occurrence mapping",
    )
    variable_count, clauses = parse_dimacs(cnf_path)
    if (
        variable_count != EXPECTED_COMPACT_VARIABLE_COUNT
        or len(clauses) != EXPECTED_COMPACT_CLAUSE_COUNT
        or manifest["compact_cnf"]["variable_count"] != variable_count
        or manifest["compact_cnf"]["clause_count"] != len(clauses)
    ):
        raise MaterializationError("generated compact DIMACS counts drifted")
    with occurrences_path.open("r", encoding="utf-8") as stream:
        for expected_index, (line, clause) in enumerate(
            zip(stream, clauses, strict=True), 1
        ):
            record = json.loads(line)
            if (
                int(record.get("output_clause_index", -1)) != expected_index
                or record.get("dense_literals") != list(clause)
            ):
                raise MaterializationError(
                    "generated occurrence/CNF order drifted"
                )
    if (
        manifest["source_occurrence_mapping"]["record_count"]
        != EXPECTED_COMPACT_CLAUSE_COUNT
        or manifest.get("stable_digest", {}).get("sha256")
        != compute_stable_digest(manifest)
    ):
        raise MaterializationError("generated stable digest drifted")
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--verify-only",
        action="store_true",
        help="verify the dedicated generated package without rewriting it",
    )
    args = parser.parse_args()
    manifest = (
        verify_generated(OUTPUT_DIR)
        if args.verify_only
        else materialize(OUTPUT_DIR)
    )
    print(
        json.dumps(
            {
                "clause_count": manifest["compact_cnf"]["clause_count"],
                "cnf_sha256": manifest["compact_cnf"]["sha256"],
                "manifest": str(OUTPUT_DIR / MANIFEST_NAME),
                "occurrence_map_sha256": manifest[
                    "source_occurrence_mapping"
                ]["sha256"],
                "stable_digest": manifest["stable_digest"]["sha256"],
                "status": manifest["epistemic_status"],
                "variable_count": manifest["compact_cnf"]["variable_count"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
