#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Batch every one-form incidence conflict exposed by one PIQD SAT model.

The sequential exact-13 learner keeps only one source-entitled Kalmanson
conflict per model.  This producer retains one deterministic minimal
provider-incidence proof for every strict form already collapsed by the same
replayed model and emits the corresponding clauses as a seed event for the
next governed PIQD wave.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as paths
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-coarse-cell-batch-incidence-piqd/v1"
SELF_PATH = "scripts/cardge13_exact13_coarse_cell_batch_piqd.py"


class BatchIncidenceError(RuntimeError):
    """A source event, run manifest, or derived conflict is malformed."""


def _best_conflict_for_form(
    graph: dict[paths.Edge, tuple[tuple[paths.Edge, tuple[str, ...], dict[str, object]], ...]],
    form: dict[str, object],
) -> dict[str, object] | None:
    """Choose one deterministic minimal incidence proof for a strict form."""
    positive = form.get("positive")
    negative = form.get("negative")
    form_id = form.get("form")
    if not isinstance(positive, tuple) or not isinstance(negative, tuple):
        raise BatchIncidenceError("malformed Kalmanson edge lists")
    if not isinstance(form_id, tuple):
        raise BatchIncidenceError("malformed Kalmanson form identifier")
    positive_edges = tuple(base.distance_edge(*edge) for edge in positive)
    best: tuple[tuple[object, ...], dict[str, object]] | None = None
    for permutation in itertools.permutations(negative):
        negative_edges = tuple(base.distance_edge(*edge) for edge in permutation)
        found = tuple(
            paths.shortest_incidence_path(graph, left, right)
            for left, right in zip(positive_edges, negative_edges, strict=True)
        )
        if any(path is None for path in found):
            continue
        concrete = tuple(path for path in found if path is not None)
        atoms = tuple(
            sorted({atom for path_atoms, _steps in concrete for atom in path_atoms})
        )
        if not atoms:
            continue
        pairings = tuple(
            {"left": left, "right": right, "steps": steps}
            for left, right, (_atoms, steps) in zip(
                positive_edges, negative_edges, concrete, strict=True
            )
        )
        conflict: dict[str, object] = {
            "kind": "transitive-incidence-path",
            "form": form_id,
            "pairings": pairings,
            "atoms": atoms,
        }
        key: tuple[object, ...] = (
            len(atoms),
            sum(len(steps) for _atoms, steps in concrete),
            form_id,
            negative_edges,
            atoms,
        )
        if best is None or key < best[0]:
            best = (key, conflict)
    return None if best is None else best[1]


def all_incidence_path_conflicts(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[dict[str, object], ...]:
    """Return one minimal one-form conflict for every collapsed strict form."""
    base.validate_cell(cell)
    graph = paths.equality_graph(cell)
    conflicts = tuple(
        conflict
        for form in base.kalmanson_forms(order)
        if (conflict := _best_conflict_for_form(graph, form)) is not None
    )
    if len({tuple(conflict["form"]) for conflict in conflicts}) != len(conflicts):
        raise AssertionError("batch contains duplicate strict-form identifiers")
    return conflicts


def unique_conflict_cuts(
    conflicts: tuple[dict[str, object], ...]
) -> tuple[tuple[dict[str, object], str], ...]:
    """Deduplicate conflicts that induce the same Boolean clause."""
    seen: set[tuple[str, ...]] = set()
    rows: list[tuple[dict[str, object], str]] = []
    for conflict in conflicts:
        atoms = conflict.get("atoms")
        if not isinstance(atoms, tuple) or not all(isinstance(atom, str) for atom in atoms):
            raise BatchIncidenceError("incidence conflict has malformed atoms")
        if atoms in seen:
            continue
        seen.add(atoms)
        rows.append((conflict, base.transitive_conflict_clause(conflict)))
    return tuple(rows)


def final_replayed_cell(event: dict[str, Any]) -> dict[str, object]:
    """Extract the last replayed SAT cell from a compact coarse-cell event."""
    solves = event.get("solves")
    if not isinstance(solves, list):
        raise BatchIncidenceError("source event has no solves array")
    for solve in reversed(solves):
        if not isinstance(solve, dict):
            raise BatchIncidenceError("source event has a malformed solve")
        iterations = solve.get("iterations")
        if not isinstance(iterations, list):
            raise BatchIncidenceError("source solve has no iterations array")
        for iteration in reversed(iterations):
            if not isinstance(iteration, dict):
                raise BatchIncidenceError("source event has a malformed iteration")
            solved = iteration.get("solved")
            cell = iteration.get("cell")
            if not isinstance(solved, dict) or solved.get("status") != "SAT":
                continue
            replay = solved.get("model_replay")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                raise BatchIncidenceError("source SAT model lacks successful replay")
            if not isinstance(cell, dict):
                raise BatchIncidenceError("source SAT iteration lacks a decoded cell")
            base.validate_cell(cell)
            return cell
    raise BatchIncidenceError("source event has no replayed SAT cell")


def source_coarse_cell(event: dict[str, Any]) -> coarse.CoarseCell:
    """Recover and validate the source event's requested coarse cell."""
    raw = event.get("cell")
    if not isinstance(raw, dict):
        raise BatchIncidenceError("source event has no coarse-cell descriptor")
    orientation = raw.get("orientation")
    z = raw.get("z")
    k_i2 = raw.get("k_i2")
    if not isinstance(orientation, str) or type(z) is not int or not isinstance(k_i2, list):
        raise BatchIncidenceError("source coarse-cell descriptor is malformed")
    if not all(type(point) is int for point in k_i2):
        raise BatchIncidenceError("source K/I2 slice is malformed")
    return coarse.CoarseCell(orientation, z, tuple(k_i2))


def _repo_relative(repo_root: Path, path: Path, label: str) -> tuple[str, Path]:
    resolved = path.resolve()
    try:
        relative = resolved.relative_to(repo_root)
    except ValueError as exc:
        raise BatchIncidenceError(f"{label} is outside the repository") from exc
    return relative.as_posix(), resolved


def load_inputs(
    repo_root: Path, manifest_path: Path, source_event_path: Path
) -> tuple[str, Path, dict[str, Any], bytes]:
    """Authenticate the run manifest, this producer, and the source event."""
    manifest, manifest_sha256, run_root = coarse.load_run_manifest(
        repo_root, manifest_path
    )
    source_digests = manifest.get("source_digests")
    if not isinstance(source_digests, dict):
        raise BatchIncidenceError("run manifest has no source digest map")
    producer = repo_root / SELF_PATH
    if source_digests.get(SELF_PATH) != coarse.sha256_bytes(producer.read_bytes()):
        raise BatchIncidenceError("run manifest does not anchor the batch producer")
    relative, resolved_event = _repo_relative(repo_root, source_event_path, "source event")
    event_bytes = resolved_event.read_bytes()
    input_digests = manifest.get("input_digests")
    if not isinstance(input_digests, dict):
        raise BatchIncidenceError("run manifest has no input digest map")
    if input_digests.get(relative) != coarse.sha256_bytes(event_bytes):
        raise BatchIncidenceError("run manifest does not anchor the source event")
    return manifest_sha256, run_root, json.loads(event_bytes), event_bytes


def batch_payload(
    *,
    manifest_sha256: str,
    source_event_path: str,
    source_event_bytes: bytes,
    event: dict[str, Any],
) -> dict[str, object]:
    """Build a seed-compatible batch event from one replayed source model."""
    coarse_cell = source_coarse_cell(event)
    cell = final_replayed_cell(event)
    coarse.validate_decoded_cell(coarse_cell, cell)
    order = (
        base.DIRECT_ORDER
        if coarse_cell.orientation == "direct"
        else base.MIRROR_ORDER
    )
    conflicts = all_incidence_path_conflicts(cell, order)
    rows = unique_conflict_cuts(conflicts)
    iterations = [
        {"index": index, "linear_conflict": conflict, "cut": cut}
        for index, (conflict, cut) in enumerate(rows)
    ]
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-replayed-model-batched-one-form-cuts",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": coarse_cell.to_json(int(event["cell"].get("index", 0))),
        "form_conflict_count": len(conflicts),
        "unique_cut_count": len(rows),
        "run_manifest_sha256": manifest_sha256,
        "source_event": source_event_path,
        "source_event_sha256": coarse.sha256_bytes(source_event_bytes),
        "solves": [{"solver": "derived-from-replayed-model", "iterations": iterations}],
    }
    payload["event_sha256"] = coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    return payload


def main() -> int:
    """Emit one authenticated batch event below a governed run root."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--run-manifest", type=Path, required=True)
    parser.add_argument("--source-event", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    repo_root = args.repo_root.resolve()
    manifest_sha256, run_root, event, event_bytes = load_inputs(
        repo_root, args.run_manifest, args.source_event
    )
    source_relative, _source_resolved = _repo_relative(
        repo_root, args.source_event, "source event"
    )
    output = coarse.require_under_run_root(args.out, run_root, "batch event")
    payload = batch_payload(
        manifest_sha256=manifest_sha256,
        source_event_path=source_relative,
        source_event_bytes=event_bytes,
        event=event,
    )
    coarse.write_new(output, coarse.canonical_json_bytes(payload))
    print(
        json.dumps(
            {
                "event": str(output.relative_to(repo_root)),
                "forms": payload["form_conflict_count"],
                "unique_cuts": payload["unique_cut_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
