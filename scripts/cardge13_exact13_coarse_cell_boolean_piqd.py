#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Classify the 100 source-entitled exact-13 coarse cells through PIQD.

The split retains the boundary orientation, the uncovered label in the
five-label second-opposite interval, and the exact two-or-three labels of that
interval belonging to the first second-apex row.  The source packet proves the
four intersections between the two source rows and the two second-apex rows
have cardinality at most two.  The older global-cell encoder included only the
two bounds against the second row; this wrapper adds the two bounds against
the first row without changing the source used by in-flight PIQD sessions.

Every verdict remains formula-scoped.  The catalog records the intended Lean
producers, but it is not a proof that a source packet enters one of the cells.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd as learner
import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as resume
import cardge13_exact13_global_source_cell_boolean_slice_piqd as boolean_base
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-coarse-cell-boolean-piqd/v1"
CATALOG_SCHEMA = "cardge13-exact13-coarse-cell-catalog/v1"
ORIENTATIONS = ("direct", "mirror")
EXPECTED_CELL_COUNT = 100
DEPENDENCY_PATHS = (
    "scripts/cardge13_exact13_global_source_cell_csp_piqd.py",
    "scripts/cardge13_exact13_global_source_cell_boolean_slice_piqd.py",
    "scripts/cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd.py",
    "scripts/cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd.py",
    "scripts/cardge13_exact13_coarse_cell_boolean_piqd.py",
)
SOURCE_PRODUCERS = {
    "orientation": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress.orientation"
    ),
    "z_in_second_opposite_interval": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "exactThirteen_zraw_mem_I2raw"
    ),
    "two_three_partition": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "ExactThirteenRawTwoThreePartition"
    ),
    "source_row_1_first_row_intersection_bound": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "fivePositionalRows_sourceRow₁_firstRow_inter_card_le_two"
    ),
    "source_row_2_first_row_intersection_bound": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "fivePositionalRows_sourceRow₂_firstRow_inter_card_le_two"
    ),
    "source_row_1_second_row_intersection_bound": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "fivePositionalRows_sourceRow₁_secondRow_inter_card_le_two"
    ),
    "source_row_2_second_row_intersection_bound": (
        "Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress."
        "fivePositionalRows_sourceRow₂_secondRow_inter_card_le_two"
    ),
    "outer_row_normalization": (
        "Problem97.ATailFrontierLiveClosure.CardGeThirteenRawOtherOuterSupport."
        "is_other"
    ),
    "coarse_signature_bridge": (
        "Problem97.ATailFrontierLiveClosure."
        "nonempty_exactThirteenCoarseCellSignature"
    ),
}


class CoarseCellError(RuntimeError):
    """A coarse-cell input, custody record, or decoded model is malformed."""


@dataclass(frozen=True, order=True)
class CoarseCell:
    """One orientation, uncovered label, and exact first-row I2 slice."""

    orientation: str
    z: int
    k_i2: tuple[int, ...]

    def __post_init__(self) -> None:
        if self.orientation not in ORIENTATIONS:
            raise CoarseCellError("orientation must be direct or mirror")
        if self.z not in base.I2:
            raise CoarseCellError("z must lie in the second-opposite interval")
        if self.k_i2 != tuple(sorted(set(self.k_i2))):
            raise CoarseCellError("K/I2 labels must be sorted and distinct")
        if len(self.k_i2) not in (2, 3):
            raise CoarseCellError("K/I2 must contain two or three labels")
        if self.z in self.k_i2 or not set(self.k_i2) <= set(base.I2):
            raise CoarseCellError("K/I2 must be drawn from I2 minus z")

    @property
    def l_i2(self) -> tuple[int, ...]:
        """The forced complementary second-row slice in I2."""
        return tuple(sorted(set(base.I2) - set(self.k_i2)))

    @property
    def cell_id(self) -> str:
        """A stable filesystem-safe identifier for the cell."""
        k_text = "-".join(f"{point:02d}" for point in self.k_i2)
        return f"{self.orientation}-z{self.z:02d}-k{k_text}"

    def to_json(self, index: int) -> dict[str, object]:
        """Return the canonical public cell record."""
        return {
            "cell_id": self.cell_id,
            "index": index,
            "orientation": self.orientation,
            "z": self.z,
            "k_i2": list(self.k_i2),
            "l_i2": list(self.l_i2),
        }


def canonical_json_bytes(value: object) -> bytes:
    """Encode canonical compact JSON with a final newline."""
    return (
        json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)
        + "\n"
    ).encode("ascii")


def sha256_bytes(payload: bytes) -> str:
    """Return the lowercase SHA-256 digest of bytes."""
    return hashlib.sha256(payload).hexdigest()


def catalog_cells() -> tuple[CoarseCell, ...]:
    """Enumerate the complete deterministic 2 × 5 × 10 coarse split."""
    cells = tuple(
        CoarseCell(orientation, z, tuple(k_i2))
        for orientation in ORIENTATIONS
        for z in sorted(base.I2)
        for size in (2, 3)
        for k_i2 in itertools.combinations(sorted(set(base.I2) - {z}), size)
    )
    if len(cells) != EXPECTED_CELL_COUNT or len(set(cells)) != EXPECTED_CELL_COUNT:
        raise AssertionError("coarse-cell census is not the expected 100-cell split")
    return cells


def intersection_card_le_two_commands(left: str, right: str) -> tuple[str, ...]:
    """Forbid every three-label intersection of two named rows."""
    if left not in base.BASE_ROWS or right not in base.BASE_ROWS:
        raise CoarseCellError("intersection bounds require named base rows")
    return tuple(
        f"(assert {base.disjunction(f'(not {base.member(row, point)})' for point in triple for row in (left, right))})"
        for triple in itertools.combinations(base.LABELS, 3)
    )


def coarse_cell_commands(cell: CoarseCell) -> tuple[str, ...]:
    """Pin the coarse signature and add the two newly sourced overlap bounds."""
    commands = [f"(assert {base.role('z', cell.z)})"]
    k_i2 = set(cell.k_i2)
    for point in sorted(base.I2):
        if point in k_i2:
            commands.extend(
                (
                    f"(assert {base.member('K', point)})",
                    f"(assert (not {base.member('L', point)}))",
                )
            )
        else:
            commands.extend(
                (
                    f"(assert (not {base.member('K', point)}))",
                    f"(assert {base.member('L', point)})",
                )
            )
    commands.extend(intersection_card_le_two_commands("C0", "K"))
    commands.extend(intersection_card_le_two_commands("C1", "K"))
    return tuple(commands)


def build_commands(
    cell: CoarseCell,
    seed_events: tuple[Path, ...] = (),
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    """Build one cell plus cumulative authenticated incidence-path cuts."""
    order = base.DIRECT_ORDER if cell.orientation == "direct" else base.MIRROR_ORDER
    commands, bank = boolean_base.build_commands(order)
    cuts, _sources = resume.seed_cuts(seed_events)
    return (*commands, *coarse_cell_commands(cell), *cuts), bank


def compact_solve_record(record: dict[str, Any]) -> dict[str, object]:
    """Retain replay/cut custody without copying every full model into the event."""
    iterations: list[dict[str, object]] = []
    raw_iterations = record.get("iterations")
    if not isinstance(raw_iterations, list):
        raise CoarseCellError("PIQD solve lacks an iterations array")
    for raw in raw_iterations:
        if not isinstance(raw, dict):
            raise CoarseCellError("PIQD iteration is malformed")
        solved = raw.get("solved")
        if not isinstance(solved, dict):
            raise CoarseCellError("PIQD iteration lacks a solve receipt")
        summary: dict[str, object] = {
            "index": raw.get("index"),
            "solved": {
                key: solved.get(key)
                for key in (
                    "status",
                    "solve_index",
                    "solve_ms",
                    "result_sha256",
                    "solver_sha256",
                    "solver_signature",
                    "timeout_ms",
                    "model_replay",
                )
                if key in solved
            },
        }
        for key in ("cell", "linear_conflict", "cut", "asserted"):
            if key in raw:
                summary[key] = raw[key]
        iterations.append(summary)
    receipts = record.get("receipts")
    receipt_summary: dict[str, object] = {}
    if isinstance(receipts, dict):
        receipt_summary = {
            key: receipts.get(key)
            for key in (
                "count",
                "journal_path",
                "lane",
                "receipts_path",
                "session_id",
            )
            if key in receipts
        }
    return {
        "solver": record.get("solver"),
        "created": record.get("created"),
        "assertions": record.get("assertions"),
        "iterations": iterations,
        "cegar_status": record.get("cegar_status"),
        "solved": iterations[-1]["solved"] if iterations else {},
        "receipts": receipt_summary,
        "closed": record.get("closed"),
    }


def validate_decoded_cell(cell: CoarseCell, decoded: dict[str, object]) -> None:
    """Check that a PIQD model lies in the requested coarse cell."""
    base.validate_cell(decoded)
    roles = decoded.get("roles")
    rows = decoded.get("base_rows")
    if not isinstance(roles, dict) or not isinstance(rows, dict):
        raise CoarseCellError("decoded model lacks roles or base rows")
    if roles.get("z") != cell.z:
        raise CoarseCellError("decoded model violates the z pin")
    k_support = rows.get("K")
    l_support = rows.get("L")
    if not isinstance(k_support, list) or not isinstance(l_support, list):
        raise CoarseCellError("decoded model lacks K or L support")
    if set(k_support) & set(base.I2) != set(cell.k_i2):
        raise CoarseCellError("decoded model violates the K/I2 slice")
    if set(l_support) & set(base.I2) != set(cell.l_i2):
        raise CoarseCellError("decoded model violates the L/I2 slice")
    for source_row in ("C0", "C1"):
        source_support = rows.get(source_row)
        if not isinstance(source_support, list):
            raise CoarseCellError("decoded model lacks a source support")
        if len(set(source_support) & set(k_support)) > 2:
            raise CoarseCellError("decoded model violates a source/K overlap bound")


def load_run_manifest(repo_root: Path, path: Path) -> tuple[dict[str, Any], str, Path]:
    """Authenticate the lane manifest and the three source files it pins."""
    manifest_path = (repo_root / path).resolve() if not path.is_absolute() else path.resolve()
    data = json.loads(manifest_path.read_bytes())
    if not isinstance(data, dict) or data.get("schema") != "worktree-run-manifest/v1":
        raise CoarseCellError("run manifest schema mismatch")
    expected = data.get("manifest_sha256")
    unsigned = dict(data)
    unsigned.pop("manifest_sha256", None)
    actual = sha256_bytes(
        json.dumps(unsigned, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode(
            "ascii"
        )
    )
    if expected != actual:
        raise CoarseCellError("run manifest self-hash mismatch")
    root_text = data.get("root")
    digests = data.get("source_digests")
    if not isinstance(root_text, str) or not isinstance(digests, dict):
        raise CoarseCellError("run manifest root or source digests are malformed")
    run_root = (repo_root / root_text).resolve()
    for relative in DEPENDENCY_PATHS:
        expected_digest = digests.get(relative)
        source_path = (repo_root / relative).resolve()
        if expected_digest != sha256_bytes(source_path.read_bytes()):
            raise CoarseCellError(f"run manifest does not anchor {relative}")
    return data, actual, run_root


def require_under_run_root(path: Path, run_root: Path, label: str) -> Path:
    """Require one output path to lie strictly below the registered run root."""
    resolved = path.resolve()
    if resolved == run_root or run_root not in resolved.parents:
        raise CoarseCellError(f"{label} is outside the registered run root")
    return resolved


def write_new(path: Path, payload: bytes) -> None:
    """Write one new artifact without replacing existing evidence."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("xb") as stream:
        stream.write(payload)


def catalog_payload(manifest_sha256: str) -> dict[str, object]:
    """Build the diagnostic 100-cell coverage catalog."""
    payload: dict[str, object] = {
        "schema": CATALOG_SCHEMA,
        "claim_scope": {
            "classification": "source-signature-catalog-only",
            "source_coverage": False,
            "theorem_promotion": False,
            "reason": (
                "The catalog enumerates the intended finite split but does not "
                "prove that every Lean source packet enters a listed cell."
            ),
        },
        "cell_count": EXPECTED_CELL_COUNT,
        "cells": [cell.to_json(index) for index, cell in enumerate(catalog_cells())],
        "run_manifest_sha256": manifest_sha256,
        "source_producers": SOURCE_PRODUCERS,
    }
    payload["catalog_sha256"] = sha256_bytes(canonical_json_bytes(payload))
    return payload


def main() -> int:
    """Emit the catalog or run one selected cell through PIQD."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--run-manifest", type=Path, required=True)
    parser.add_argument("--catalog", type=Path)
    parser.add_argument("--cell-index", type=int)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--event", type=Path)
    parser.add_argument("--seed-event", action="append", type=Path, default=[])
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-refinements", type=int, default=250)
    args = parser.parse_args()

    repo_root = args.repo_root.resolve()
    _manifest, manifest_sha256, run_root = load_run_manifest(
        repo_root, args.run_manifest
    )
    if (args.catalog is None) == (args.cell_index is None):
        parser.error("select exactly one of --catalog or --cell-index")
    if args.catalog is not None:
        catalog_path = require_under_run_root(args.catalog, run_root, "catalog")
        write_new(catalog_path, canonical_json_bytes(catalog_payload(manifest_sha256)))
        print(json.dumps({"cells": EXPECTED_CELL_COUNT, "catalog": str(catalog_path)}))
        return 0

    if args.out is None or args.event is None:
        parser.error("--cell-index requires --out and --event")
    cells = catalog_cells()
    if args.cell_index < 0 or args.cell_index >= len(cells):
        parser.error(f"--cell-index must lie in [0,{len(cells)})")
    cell = cells[args.cell_index]
    out_path = require_under_run_root(args.out, run_root, "journal")
    event_path = require_under_run_root(args.event, run_root, "event")
    seed_events = tuple(args.seed_event)
    commands, bank = build_commands(cell, seed_events)
    seed_cuts, seed_sources = resume.seed_cuts(seed_events)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    write_new(out_path, journal)
    order = base.DIRECT_ORDER if cell.orientation == "direct" else base.MIRROR_ORDER
    original_learner = base.minimal_linear_conflict
    base.minimal_linear_conflict = learner.minimal_incidence_linear_conflict
    try:
        solves = (
            base.run_piqd_chunked(
                out_path,
                commands,
                tuple(args.solver or ()),
                args.timeout_ms,
                label=f"cardge13-exact13-coarse-{cell.cell_id}",
                order=order,
                max_refinements=args.max_refinements,
            )
            if args.solver
            else []
        )
    finally:
        base.minimal_linear_conflict = original_learner
    decoded_models: list[dict[str, object]] = []
    for solve in solves:
        result = solve.get("solved")
        if not isinstance(result, dict):
            raise CoarseCellError("PIQD solve response is malformed")
        if result.get("status") == "SAT":
            replay = result.get("model_replay")
            model = result.get("model")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                raise CoarseCellError("PIQD SAT model did not replay")
            if not isinstance(model, str):
                raise CoarseCellError("PIQD SAT model is missing")
            decoded = base.decode_model(model)
            validate_decoded_cell(cell, decoded)
            decoded_models.append({"solver": solve.get("solver"), "cell": decoded})
    report: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-formula-coarse-cell-only",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": cell.to_json(args.cell_index),
        "command_count": len(commands),
        "conflict_count": len(bank),
        "decoded_sat_models": decoded_models,
        "journal": str(out_path.relative_to(repo_root)),
        "journal_sha256": sha256_bytes(journal),
        "run_manifest_sha256": manifest_sha256,
        "seed_cut_count": len(seed_cuts),
        "seed_sources": seed_sources,
        "solves": [compact_solve_record(record) for record in solves],
    }
    report["event_sha256"] = sha256_bytes(canonical_json_bytes(report))
    write_new(event_path, canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "cell": cell.cell_id,
                "commands": len(commands),
                "conflicts": len(bank),
                "statuses": [row.get("solved", {}).get("status") for row in solves],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
