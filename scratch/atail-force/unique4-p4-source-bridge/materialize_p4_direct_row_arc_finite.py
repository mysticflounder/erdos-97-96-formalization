#!/usr/bin/env python3
"""Materialize the authenticated finite P4 row-pattern-to-outer-arc table.

The source occurrence map supplies the semantic row/arc parameters.  The
compact occurrence ledger proves which of those authenticated core
occurrences were retained, and fixes their output order.  This program joins
the two by both source clause indices, rejects any drift, and emits a
canonical provenance ledger plus one Lean data module.

This is a source-bridge artifact, not an UNSAT proof.  Its generated Lean
module contains one batch ``native_decide`` check of all finite datum
predicates; the certificate checker separately owns the UNSAT replay.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
CORE_MAP_DIR = HERE.parent / "unique4-exact-two-core-map"
MAP_PATH = CORE_MAP_DIR / "p4.input-core-map.json"
COMPACT_DIR = CORE_MAP_DIR / "generated" / "p4-seed0-compact"
COMPACT_MANIFEST_PATH = COMPACT_DIR / "p4-seed0-compact-manifest.json"
COMPACT_LEDGER_PATH = COMPACT_DIR / "p4-seed0-compact-occurrences.jsonl"
OUTPUT_DIR = HERE / "generated" / "p4-direct-row-arc-finite"

MAP_SHA256 = (
    "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b"
)
COMPACT_MANIFEST_SHA256 = (
    "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305"
)
COMPACT_LEDGER_SHA256 = (
    "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac"
)
COMPACT_CNF_SHA256 = (
    "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae"
)
COMPACT_STABLE_DIGEST = (
    "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1"
)

EXPECTED_PROFILE = 4
EXPECTED_SEED = 0
EXPECTED_COMPACT_RECORD_COUNT = 19_048
EXPECTED_DATUM_COUNT = 3_179
TARGET_FAMILY = "direct_row_pattern_implies_outer_arc"

LEAN_NAME = "P4DirectOuterArcFiniteData.lean"
LEDGER_NAME = "p4-direct-row-arc-finite-data.jsonl"
MANIFEST_NAME = "p4-direct-row-arc-finite-manifest.json"
CHUNK_SIZE = 128
EXPECTED_CHUNK_COUNT = (EXPECTED_DATUM_COUNT + CHUNK_SIZE - 1) // CHUNK_SIZE


def chunk_module_name(index: int) -> str:
    return f"P4DirectOuterArcFiniteDataChunk{index:03d}"


def chunk_filename(index: int) -> str:
    return f"{chunk_module_name(index)}.lean"


OUTPUT_NAMES = frozenset(
    {
        LEAN_NAME,
        LEDGER_NAME,
        MANIFEST_NAME,
        *(chunk_filename(index) for index in range(EXPECTED_CHUNK_COUNT)),
    }
)

# Rebuildable Lean 4.27 artifacts live beside this durable generated package.
# They are not materializer inputs and are excluded from its source manifest.
COMPILED_CACHE_DIRS = frozenset({"olean-427"})


class MaterializationError(RuntimeError):
    """A pinned input, semantic invariant, or owned output drifted."""


@dataclass(frozen=True)
class DirectRowArcDatum:
    output_clause_index: int
    source_core_clause_index: int
    source_terminal_clause_index: int
    center: int
    row_support: tuple[int, int, int, int]
    side: str
    turn_mask: int

    def semantic_record(self) -> dict[str, Any]:
        return {
            "center": self.center,
            "row_support": list(self.row_support),
            "side": self.side,
            "turn_mask": self.turn_mask,
        }

    def provenance_record(self) -> dict[str, Any]:
        return {
            **self.semantic_record(),
            "family": TARGET_FAMILY,
            "output_clause_index": self.output_clause_index,
            "source_core_clause_index": self.source_core_clause_index,
            "source_terminal_clause_index": self.source_terminal_clause_index,
        }


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
        value, ensure_ascii=True, separators=(",", ":"), sort_keys=True
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


def resolve_fixed_input(
    raw_path: str,
    *,
    allowed_dir: Path,
    expected_name: str,
    label: str,
) -> Path:
    """Resolve one input while forbidding traversal, aliases, and symlinks."""

    if not raw_path or "\x00" in raw_path or _has_parent_traversal(raw_path):
        raise MaterializationError(f"{label} path contains traversal or NUL")
    root = allowed_dir.resolve(strict=True)
    given = Path(raw_path)
    candidate = given if given.is_absolute() else root / given
    try:
        resolved = candidate.resolve(strict=True)
    except OSError as error:
        raise MaterializationError(f"{label} path does not resolve") from error
    if resolved.parent != root or resolved.name != expected_name:
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


def _load_json(path: Path, label: str) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as error:
        raise MaterializationError(f"{label} is not valid UTF-8 JSON") from error
    if not isinstance(value, dict):
        raise MaterializationError(f"{label} JSON root is not an object")
    return value


def validate_compact_manifest(
    manifest: dict[str, Any],
    *,
    compact_dir: Path = COMPACT_DIR,
) -> Path:
    if (
        manifest.get("schema")
        != "p97-unique4-exact-two-p4-seed0-compact-materialization-v1"
        or int(manifest.get("profile", -1)) != EXPECTED_PROFILE
        or int(manifest.get("seed", -1)) != EXPECTED_SEED
    ):
        raise MaterializationError("compact manifest identity drifted")
    source = manifest.get("sources", {}).get("occurrence_map", {})
    compact_cnf = manifest.get("compact_cnf", {})
    ledger = manifest.get("source_occurrence_mapping", {})
    if (
        source.get("sha256") != MAP_SHA256
        or compact_cnf.get("sha256") != COMPACT_CNF_SHA256
        or int(compact_cnf.get("clause_count", -1))
        != EXPECTED_COMPACT_RECORD_COUNT
        or ledger.get("sha256") != COMPACT_LEDGER_SHA256
        or int(ledger.get("record_count", -1))
        != EXPECTED_COMPACT_RECORD_COUNT
        or manifest.get("stable_digest", {}).get("sha256")
        != COMPACT_STABLE_DIGEST
    ):
        raise MaterializationError("compact manifest authentication drifted")
    return resolve_fixed_input(
        str(ledger.get("path", "")),
        allowed_dir=compact_dir,
        expected_name=COMPACT_LEDGER_PATH.name,
        label="compact occurrence ledger",
    )


def _require_int(value: Any, *, label: str, lower: int, upper: int) -> int:
    if isinstance(value, bool) or not isinstance(value, int):
        raise MaterializationError(f"{label} is not an integer")
    if not lower <= value <= upper:
        raise MaterializationError(f"{label} is outside [{lower}, {upper}]")
    return value


def finite_turn_mask(
    center: int,
    support: tuple[int, int, int, int],
    side: str,
) -> int:
    """Mirror the encoder's finite formula for independent input rejection."""

    centered = sorted((center - point) % 11 for point in support)
    global_start = (-center) % 11
    if side == "left":
        start = global_start
        turn_count = centered[1] - 1
    elif side == "right":
        start = global_start + centered[2]
        turn_count = 10 - centered[2]
    else:
        raise MaterializationError("outer-arc side drifted")
    return sum(1 << ((start + offset) % 11) for offset in range(turn_count))


def decode_target_entry(entry: dict[str, Any]) -> tuple[
    int, int, int, tuple[int, int, int, int], str, int
]:
    """Decode one occurrence-map row with exact schema and parameter checks."""

    if entry.get("allocated_family") != TARGET_FAMILY:
        raise MaterializationError("attempted to decode a non-target family")
    provenance = entry.get("candidate_provenance")
    if not isinstance(provenance, list) or len(provenance) != 1:
        raise MaterializationError("target occurrence provenance is not unique")
    candidate = provenance[0]
    if not isinstance(candidate, dict):
        raise MaterializationError("target occurrence provenance is malformed")
    if (
        candidate.get("family") != TARGET_FAMILY
        or candidate.get("producer_function") is not None
    ):
        # producer_function belongs inside semantic_parameters, never beside it.
        raise MaterializationError("target candidate identity drifted")
    terminal_index = _require_int(
        entry.get("allocated_input_clause_index"),
        label="terminal clause index",
        lower=1,
        upper=10**9,
    )
    if candidate.get("input_clause_index") != terminal_index:
        raise MaterializationError("candidate terminal clause index drifted")
    terminal_literals = entry.get("allocated_input_clause_literal_order")
    if (
        candidate.get("input_clause_literal_order") != terminal_literals
        or not isinstance(terminal_literals, list)
        or len(terminal_literals) != 2
        or any(isinstance(x, bool) or not isinstance(x, int) for x in terminal_literals)
        or terminal_literals[0] >= 0
        or terminal_literals[1] <= 0
    ):
        raise MaterializationError("target terminal literal shape drifted")

    parameters = candidate.get("semantic_parameters")
    if not isinstance(parameters, dict) or set(parameters) != {
        "center",
        "outer_arc",
        "producer_function",
        "row_support",
    }:
        raise MaterializationError("target semantic parameter keys drifted")
    if parameters.get("producer_function") != "add_direct_curvature_overlay":
        raise MaterializationError("target producer function drifted")
    center = _require_int(
        parameters.get("center"), label="center", lower=0, upper=10
    )
    support_raw = parameters.get("row_support")
    if (
        not isinstance(support_raw, list)
        or len(support_raw) != 4
        or any(isinstance(x, bool) or not isinstance(x, int) for x in support_raw)
    ):
        raise MaterializationError("row support is not four integer labels")
    support = tuple(support_raw)
    if tuple(sorted(set(support))) != support or not all(0 <= x <= 10 for x in support):
        raise MaterializationError("row support is not canonical in Fin 11")

    outer = parameters.get("outer_arc")
    if not isinstance(outer, dict) or set(outer) != {
        "center",
        "side",
        "turn_mask",
    }:
        raise MaterializationError("outer-arc parameter keys drifted")
    if outer.get("center") != center:
        raise MaterializationError("row and outer-arc centers differ")
    side = outer.get("side")
    if side not in {"left", "right"}:
        raise MaterializationError("outer-arc side drifted")
    turn_mask = _require_int(
        outer.get("turn_mask"), label="turn mask", lower=0, upper=(1 << 11) - 1
    )
    if turn_mask != finite_turn_mask(center, support, side):
        raise MaterializationError(
            "outer-arc turn mask disagrees with the finite formula"
        )

    core_index = _require_int(
        entry.get("core_clause_index"),
        label="core clause index",
        lower=1,
        upper=48_605,
    )
    core_literals = entry.get("core_clause_literal_order")
    if (
        not isinstance(core_literals, list)
        or len(core_literals) != 2
        or sorted(core_literals) != sorted(terminal_literals)
    ):
        raise MaterializationError("target core literals drifted")
    return core_index, terminal_index, center, support, side, turn_mask


def load_target_map(map_path: Path) -> dict[int, tuple[
    int, int, tuple[int, int, int, int], str, int, tuple[int, int]
]]:
    mapping = _load_json(map_path, "P4 source occurrence map")
    if (
        mapping.get("schema")
        != "p97-unique4-exact-two-drat-input-core-map-v1"
        or int(mapping.get("profile", -1)) != EXPECTED_PROFILE
        or mapping.get("core", {}).get("sha256")
        != "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b"
    ):
        raise MaterializationError("P4 source occurrence-map identity drifted")
    entries = mapping.get("core_clauses")
    if not isinstance(entries, list):
        raise MaterializationError("P4 source occurrence-map clauses are missing")

    result: dict[int, tuple[
        int, int, tuple[int, int, int, int], str, int, tuple[int, int]
    ]] = {}
    for raw in entries:
        if not isinstance(raw, dict) or raw.get("allocated_family") != TARGET_FAMILY:
            continue
        core, terminal, center, support, side, mask = decode_target_entry(raw)
        literals_raw = raw["core_clause_literal_order"]
        literals = (int(literals_raw[0]), int(literals_raw[1]))
        if core in result:
            raise MaterializationError("duplicate target core occurrence")
        result[core] = (terminal, center, support, side, mask, literals)
    if len(result) != EXPECTED_DATUM_COUNT:
        raise MaterializationError(
            f"target map count drifted: expected {EXPECTED_DATUM_COUNT}, "
            f"got {len(result)}"
        )
    return result


def join_compact_ledger(
    ledger_path: Path,
    target_map: dict[int, tuple[
        int, int, tuple[int, int, int, int], str, int, tuple[int, int]
    ]],
) -> list[DirectRowArcDatum]:
    result: list[DirectRowArcDatum] = []
    seen_core: set[int] = set()
    record_count = 0
    with ledger_path.open("r", encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, 1):
            try:
                record = json.loads(line)
            except json.JSONDecodeError as error:
                raise MaterializationError(
                    f"compact ledger line {line_number} is malformed"
                ) from error
            if not isinstance(record, dict):
                raise MaterializationError(
                    f"compact ledger line {line_number} is not an object"
                )
            record_count += 1
            if record.get("output_clause_index") != record_count:
                raise MaterializationError("compact ledger output order drifted")
            if record.get("family") != TARGET_FAMILY:
                continue
            core = _require_int(
                record.get("source_core_clause_index"),
                label="ledger core clause index",
                lower=1,
                upper=48_605,
            )
            if core not in target_map or core in seen_core:
                raise MaterializationError("compact target/core join drifted")
            terminal, center, support, side, mask, core_literals = target_map[core]
            if (
                record.get("source_terminal_clause_index") != terminal
                or record.get("source_core_literals") != list(core_literals)
                or not isinstance(record.get("dense_literals"), list)
                or len(record["dense_literals"]) != 2
                or sorted(record.get("source_terminal_literals", []))
                != sorted(core_literals)
            ):
                raise MaterializationError("compact target provenance drifted")
            seen_core.add(core)
            result.append(
                DirectRowArcDatum(
                    output_clause_index=record_count,
                    source_core_clause_index=core,
                    source_terminal_clause_index=terminal,
                    center=center,
                    row_support=support,
                    side=side,
                    turn_mask=mask,
                )
            )
    if record_count != EXPECTED_COMPACT_RECORD_COUNT:
        raise MaterializationError("compact occurrence-ledger count drifted")
    if len(result) != EXPECTED_DATUM_COUNT or seen_core != set(target_map):
        raise MaterializationError("compact target family is not an exact join")
    semantic = [datum.semantic_record() for datum in result]
    if len({canonical_json_bytes(value) for value in semantic}) != len(semantic):
        raise MaterializationError("finite semantic datum list contains duplicates")
    return result


def semantic_digest(datums: Iterable[DirectRowArcDatum]) -> str:
    payload = [datum.semantic_record() for datum in datums]
    return sha256_bytes(canonical_json_bytes(payload))


def _finset_literal(points: Iterable[int]) -> str:
    return "{" + ", ".join(map(str, points)) + "}"


def _render_chunk(index: int, datums: list[DirectRowArcDatum]) -> bytes:
    """Render one bounded datum chunk and its native validity check."""

    occurrence_definition = f"directRowArcFiniteOccurrencesChunk{index:03d}"
    occurrence_theorem = f"{occurrence_definition}_batch_valid"
    data_definition = f"directRowArcFiniteDataChunk{index:03d}"
    data_theorem = f"{data_definition}_batch_valid"
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "import P4DirectOuterArcFinite",
        "",
        (
            "/-! Generated bounded finite-data chunk "
            "by materialize_p4_direct_row_arc_finite.py. -/"
        ),
        "",
        "namespace Problem97",
        "namespace P4DirectOuterArcAdapterScratch",
        "",
        f"def {occurrence_definition} : List DirectRowArcFiniteOccurrence := [",
    ]
    for datum in datums:
        mask_points = [
            point for point in range(11) if datum.turn_mask & (1 << point)
        ]
        side = "left" if datum.side == "left" else "right"
        lines.extend(
            [
                (
                    f"  -- compact {datum.output_clause_index}; core "
                    f"{datum.source_core_clause_index}; terminal "
                    f"{datum.source_terminal_clause_index}"
                ),
                (
                    "  { outputClauseIndex := "
                    f"{datum.output_clause_index}, coreClauseIndex := "
                    f"{datum.source_core_clause_index}, terminalClauseIndex := "
                    f"{datum.source_terminal_clause_index}, datum := {{ row := "
                    f"⟨{datum.center}, {_finset_literal(datum.row_support)}⟩, "
                    "arc := "
                    f"⟨{datum.center}, .{side}, "
                    f"{_finset_literal(mask_points)}⟩ }} }},"
                ),
            ]
        )
    lines.extend(
        [
            "]",
            "",
            f"theorem {occurrence_theorem} :",
            f"    {occurrence_definition}.length = {len(datums)} ∧",
            f"      ∀ occurrence ∈ {occurrence_definition}, occurrence.datum.Valid := by",
            "  native_decide",
            "",
            f"def {data_definition} : List DirectRowArcFiniteDatum :=",
            f"  {occurrence_definition}.map (·.datum)",
            "",
            f"theorem {data_theorem} :",
            f"    {data_definition}.length = {len(datums)} ∧",
            f"      ∀ datum ∈ {data_definition}, datum.Valid := by",
            f"  rw [{data_definition}]",
            "  constructor",
            f"  · simpa using {occurrence_theorem}.1",
            "  · intro datum hdatum",
            "    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩",
            f"    exact {occurrence_theorem}.2 occurrence hoccurrence",
            "",
            "end P4DirectOuterArcAdapterScratch",
            "end Problem97",
            "",
        ]
    )
    return "\n".join(lines).encode("utf-8")


def _render_aggregate(
    chunks: list[list[DirectRowArcDatum]], digest: str
) -> bytes:
    """Render a thin aggregate whose proof reuses the bounded checks."""

    imports = [f"import {chunk_module_name(index)}" for index in range(len(chunks))]
    occurrence_definitions = [
        f"directRowArcFiniteOccurrencesChunk{index:03d}"
        for index in range(len(chunks))
    ]
    occurrence_theorems = [
        f"{definition}_batch_valid" for definition in occurrence_definitions
    ]
    validity_lines = [
        "    have h001 := List.forall_mem_append.2",
        f"      ⟨{occurrence_theorems[0]}.2, {occurrence_theorems[1]}.2⟩",
    ]
    for index, theorem in enumerate(occurrence_theorems[2:], 2):
        validity_lines.extend(
            [
                f"    have h{index:03d} := List.forall_mem_append.2",
                f"      ⟨h{index - 1:03d}, {theorem}.2⟩",
            ]
        )
    validity_lines.append(f"    exact h{len(occurrence_theorems) - 1:03d}")
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        *imports,
        "",
        "/-! Generated thin aggregate of the bounded finite-data chunks. -/",
        "",
        "namespace Problem97",
        "namespace P4DirectOuterArcAdapterScratch",
        "",
        f'def directRowArcFiniteDataSha256 : String := "{digest}"',
        f"def directRowArcFiniteDataCount : Nat := {EXPECTED_DATUM_COUNT}",
        "",
        "def directRowArcFiniteOccurrences : List DirectRowArcFiniteOccurrence :=",
        "  " + " ++\n    ".join(occurrence_definitions),
        "",
        "def directRowArcFiniteData : List DirectRowArcFiniteDatum :=",
        "  directRowArcFiniteOccurrences.map (·.datum)",
        "",
        "theorem directRowArcFiniteOccurrences_batch_valid :",
        "    directRowArcFiniteOccurrences.length = directRowArcFiniteDataCount ∧",
        "      ∀ occurrence ∈ directRowArcFiniteOccurrences, occurrence.datum.Valid := by",
        "  constructor",
        "  · simp only [directRowArcFiniteOccurrences, List.length_append,",
    ]
    for index, theorem in enumerate(occurrence_theorems):
        comma = "," if index + 1 < len(occurrence_theorems) else ","
        lines.append(f"      {theorem}.1{comma}")
    lines.extend(
        [
            "      directRowArcFiniteDataCount]",
            "  · rw [directRowArcFiniteOccurrences]",
            *validity_lines,
        ]
    )
    lines.extend(
        [
            "",
            "theorem directRowArcFiniteData_batch_valid :",
            "    directRowArcFiniteData.length = directRowArcFiniteDataCount ∧",
            "      ∀ datum ∈ directRowArcFiniteData, datum.Valid := by",
            "  rw [directRowArcFiniteData]",
            "  constructor",
            "  · simpa using directRowArcFiniteOccurrences_batch_valid.1",
            "  · intro datum hdatum",
            "    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩",
            "    exact directRowArcFiniteOccurrences_batch_valid.2 occurrence hoccurrence",
            "",
            "#print axioms directRowArcFiniteOccurrences_batch_valid",
            "#print axioms directRowArcFiniteData_batch_valid",
            "",
            "end P4DirectOuterArcAdapterScratch",
            "end Problem97",
            "",
        ]
    )
    return "\n".join(lines).encode("utf-8")


def _render_ledger(datums: Iterable[DirectRowArcDatum]) -> bytes:
    return b"".join(
        canonical_json_bytes(datum.provenance_record()) + b"\n"
        for datum in datums
    )


def _artifact_record(filename: str, data: bytes) -> dict[str, Any]:
    return {
        "byte_count": len(data),
        "path": filename,
        "sha256": sha256_bytes(data),
    }


def stable_digest_payload(manifest: dict[str, Any]) -> dict[str, Any]:
    return {
        "datum_count": manifest["datum_count"],
        "family": manifest["family"],
        "lean_module": {
            "sha256": manifest["lean_module"]["sha256"],
        },
        "lean_chunks": [
            {
                "datum_count": chunk["datum_count"],
                "first_output_clause_index": chunk[
                    "first_output_clause_index"
                ],
                "last_output_clause_index": chunk["last_output_clause_index"],
                "ordinal": chunk["ordinal"],
                "sha256": chunk["sha256"],
            }
            for chunk in manifest["lean_chunks"]
        ],
        "profile": manifest["profile"],
        "provenance_ledger": {
            "record_count": manifest["provenance_ledger"]["record_count"],
            "sha256": manifest["provenance_ledger"]["sha256"],
        },
        "semantic_data_sha256": manifest["semantic_data_sha256"],
        "sources": {
            role: {"sha256": value["sha256"]}
            for role, value in sorted(manifest["sources"].items())
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
    entries = {child.name: child for child in output_dir.iterdir()}
    unexpected = set(entries) - OUTPUT_NAMES - COMPILED_CACHE_DIRS
    if unexpected:
        raise MaterializationError(
            "dedicated output directory contains unexpected files: "
            + ", ".join(sorted(unexpected))
        )
    for cache_name in COMPILED_CACHE_DIRS & set(entries):
        cache = entries[cache_name]
        if cache.is_symlink() or not cache.is_dir():
            raise MaterializationError("compiled cache entry is not a directory")
    for name in OUTPUT_NAMES:
        path = safe_output_path(output_dir, name)
        if path.exists() and (path.is_symlink() or not path.is_file()):
            raise MaterializationError(f"owned output is not regular: {name}")


def materialize(
    output_dir: Path = OUTPUT_DIR,
    *,
    map_path: Path = MAP_PATH,
    compact_manifest_path: Path = COMPACT_MANIFEST_PATH,
) -> dict[str, Any]:
    map_input = resolve_fixed_input(
        str(map_path),
        allowed_dir=CORE_MAP_DIR,
        expected_name=MAP_PATH.name,
        label="P4 source occurrence map",
    )
    manifest_input = resolve_fixed_input(
        str(compact_manifest_path),
        allowed_dir=COMPACT_DIR,
        expected_name=COMPACT_MANIFEST_PATH.name,
        label="compact manifest",
    )
    require_sha256(map_input, MAP_SHA256, "P4 source occurrence map")
    require_sha256(
        manifest_input, COMPACT_MANIFEST_SHA256, "compact manifest"
    )
    compact_manifest = _load_json(manifest_input, "compact manifest")
    ledger_input = validate_compact_manifest(compact_manifest)
    require_sha256(ledger_input, COMPACT_LEDGER_SHA256, "compact ledger")

    target_map = load_target_map(map_input)
    datums = join_compact_ledger(ledger_input, target_map)
    datum_digest = semantic_digest(datums)
    chunks = [
        datums[start : start + CHUNK_SIZE]
        for start in range(0, len(datums), CHUNK_SIZE)
    ]
    if (
        len(chunks) != EXPECTED_CHUNK_COUNT
        or any(len(chunk) != CHUNK_SIZE for chunk in chunks[:-1])
        or len(chunks[-1])
        != EXPECTED_DATUM_COUNT - CHUNK_SIZE * (EXPECTED_CHUNK_COUNT - 1)
    ):
        raise MaterializationError("deterministic datum chunking drifted")
    chunk_bytes = [
        _render_chunk(index, chunk) for index, chunk in enumerate(chunks)
    ]
    lean_bytes = _render_aggregate(chunks, datum_digest)
    ledger_bytes = _render_ledger(datums)
    _validate_output_directory(output_dir)

    manifest: dict[str, Any] = {
        "schema": "p97-p4-direct-row-arc-finite-data-v1",
        "epistemic_status": (
            "AUTHENTICATED SOURCE-TO-FINITE-DATUM MATERIALIZATION; "
            "GENERATED LEAN BATCH CHECK REQUIRED; NOT AN UNSAT PROOF"
        ),
        "claim_scope": (
            "Joins all retained direct_row_pattern_implies_outer_arc source "
            "occurrences to exact finite parameters in compact clause order."
        ),
        "profile": EXPECTED_PROFILE,
        "seed": EXPECTED_SEED,
        "family": TARGET_FAMILY,
        "datum_count": len(datums),
        "semantic_data_sha256": datum_digest,
        "sources": {
            "compact_manifest": {
                "path": str(manifest_input.relative_to(HERE.parent)),
                "sha256": COMPACT_MANIFEST_SHA256,
            },
            "compact_occurrence_ledger": {
                "path": str(ledger_input.relative_to(HERE.parent)),
                "sha256": COMPACT_LEDGER_SHA256,
            },
            "source_occurrence_map": {
                "path": str(map_input.relative_to(HERE.parent)),
                "sha256": MAP_SHA256,
            },
        },
        "provenance_ledger": {
            **_artifact_record(LEDGER_NAME, ledger_bytes),
            "record_count": len(datums),
            "schema": "canonical-json-lines in compact occurrence order",
        },
        "lean_module": {
            **_artifact_record(LEAN_NAME, lean_bytes),
            "batch_theorem": "directRowArcFiniteData_batch_valid",
            "datum_definition": "directRowArcFiniteData",
        },
        "lean_chunks": [
            {
                **_artifact_record(chunk_filename(index), data),
                "batch_theorem": (
                    f"directRowArcFiniteDataChunk{index:03d}_batch_valid"
                ),
                "datum_count": len(chunk),
                "datum_definition": (
                    f"directRowArcFiniteDataChunk{index:03d}"
                ),
                "first_output_clause_index": chunk[
                    0
                ].output_clause_index,
                "last_output_clause_index": chunk[
                    -1
                ].output_clause_index,
                "ordinal": index,
            }
            for index, (chunk, data) in enumerate(
                zip(chunks, chunk_bytes, strict=True)
            )
        ],
        "generator": {
            "path": Path(__file__).name,
            "sha256": sha256_file(Path(__file__).resolve()),
        },
    }
    manifest["stable_digest"] = {
        "algorithm": "sha256(canonical-json(stable_digest_payload))",
        "sha256": compute_stable_digest(manifest),
    }
    manifest_bytes = pretty_json_bytes(manifest)

    _atomic_write(safe_output_path(output_dir, LEAN_NAME), lean_bytes)
    for index, data in enumerate(chunk_bytes):
        _atomic_write(
            safe_output_path(output_dir, chunk_filename(index)), data
        )
    _atomic_write(safe_output_path(output_dir, LEDGER_NAME), ledger_bytes)
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
        manifest.get("schema") != "p97-p4-direct-row-arc-finite-data-v1"
        or int(manifest.get("profile", -1)) != EXPECTED_PROFILE
        or int(manifest.get("seed", -1)) != EXPECTED_SEED
        or manifest.get("family") != TARGET_FAMILY
        or int(manifest.get("datum_count", -1)) != EXPECTED_DATUM_COUNT
    ):
        raise MaterializationError("generated manifest identity drifted")
    lean_path = safe_output_path(output_dir, LEAN_NAME)
    ledger_path = safe_output_path(output_dir, LEDGER_NAME)
    require_sha256(
        lean_path, manifest["lean_module"]["sha256"], "generated Lean module"
    )
    chunks = manifest.get("lean_chunks")
    if not isinstance(chunks, list) or len(chunks) != EXPECTED_CHUNK_COUNT:
        raise MaterializationError("generated Lean chunk ledger drifted")
    chunk_total = 0
    previous_last = -1
    for index, chunk in enumerate(chunks):
        expected_count = min(
            CHUNK_SIZE, EXPECTED_DATUM_COUNT - index * CHUNK_SIZE
        )
        if (
            not isinstance(chunk, dict)
            or chunk.get("ordinal") != index
            or chunk.get("path") != chunk_filename(index)
            or chunk.get("datum_count") != expected_count
            or not isinstance(chunk.get("first_output_clause_index"), int)
            or not isinstance(chunk.get("last_output_clause_index"), int)
            or chunk["first_output_clause_index"] <= previous_last
        ):
            raise MaterializationError("generated Lean chunk boundary drifted")
        chunk_path = safe_output_path(output_dir, chunk_filename(index))
        require_sha256(
            chunk_path,
            chunk["sha256"],
            f"generated Lean chunk {index:03d}",
        )
        chunk_total += expected_count
        previous_last = chunk["last_output_clause_index"]
    if chunk_total != EXPECTED_DATUM_COUNT:
        raise MaterializationError("generated Lean chunk count drifted")
    require_sha256(
        ledger_path,
        manifest["provenance_ledger"]["sha256"],
        "generated finite provenance ledger",
    )
    records: list[dict[str, Any]] = []
    with ledger_path.open("r", encoding="utf-8") as stream:
        for expected_ordinal, line in enumerate(stream, 1):
            try:
                record = json.loads(line)
            except json.JSONDecodeError as error:
                raise MaterializationError(
                    "generated finite provenance ledger is malformed"
                ) from error
            if (
                not isinstance(record, dict)
                or record.get("family") != TARGET_FAMILY
                or not isinstance(record.get("output_clause_index"), int)
            ):
                raise MaterializationError(
                    "generated finite provenance record drifted"
                )
            if expected_ordinal > EXPECTED_DATUM_COUNT:
                raise MaterializationError("generated finite datum count drifted")
            records.append(record)
    if (
        len(records) != EXPECTED_DATUM_COUNT
        or manifest["provenance_ledger"]["record_count"] != len(records)
    ):
        raise MaterializationError("generated finite datum count drifted")
    semantic = [
        {
            "center": record["center"],
            "row_support": record["row_support"],
            "side": record["side"],
            "turn_mask": record["turn_mask"],
        }
        for record in records
    ]
    if sha256_bytes(canonical_json_bytes(semantic)) != manifest.get(
        "semantic_data_sha256"
    ):
        raise MaterializationError("generated semantic datum digest drifted")
    if manifest.get("stable_digest", {}).get("sha256") != compute_stable_digest(
        manifest
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
                "datum_count": manifest["datum_count"],
                "lean_sha256": manifest["lean_module"]["sha256"],
                "manifest": str(OUTPUT_DIR / MANIFEST_NAME),
                "semantic_data_sha256": manifest["semantic_data_sha256"],
                "stable_digest": manifest["stable_digest"]["sha256"],
                "status": manifest["epistemic_status"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
