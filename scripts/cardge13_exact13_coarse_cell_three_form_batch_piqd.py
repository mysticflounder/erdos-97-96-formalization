#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Batch equal-weight three-form provider cancellations from one PIQD model."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Any

import cardge13_exact13_coarse_cell_batch_piqd as one_form_batch
import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as path_cegar
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-coarse-cell-three-form-batch-piqd/v1"
SELF_PATH = "scripts/cardge13_exact13_coarse_cell_three_form_batch_piqd.py"
FormVector = tuple[tuple[tuple[int, int], int], ...]
Edge = tuple[int, int]
PathWitness = tuple[tuple[str, ...], tuple[dict[str, object], ...]]


class ThreeFormBatchError(RuntimeError):
    """A source event, run manifest, or three-form conflict is malformed."""


def add_vectors(*vectors: FormVector) -> FormVector:
    """Add canonical sparse integer vectors."""
    total: Counter[Edge] = Counter()
    for vector in vectors:
        total.update(dict(vector))
    return tuple(sorted((edge, coefficient) for edge, coefficient in total.items() if coefficient))


def negative_vector(vector: FormVector) -> FormVector:
    """Negate one canonical sparse integer vector."""
    return tuple((edge, -coefficient) for edge, coefficient in vector)


def representative_projected_forms(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[tuple[FormVector, dict[str, object]], ...]:
    """Choose one stable raw strict form for each projected vector."""
    base.validate_cell(cell)
    roots = base.edge_roots_for_rows(base.cell_rows(cell))
    first: dict[FormVector, dict[str, object]] = {}
    for form in base.kalmanson_forms(order):
        vector = base.projected_form_vector(form, roots)
        first.setdefault(vector, form)
    return tuple((vector, first[vector]) for vector in sorted(first))


def equal_weight_three_form_candidates(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[tuple[dict[str, object], dict[str, object], dict[str, object]], ...]:
    """Enumerate vector-representative triples whose equal-weight sum is zero."""
    projected = tuple(
        (vector, form)
        for vector, form in representative_projected_forms(cell, order)
        if vector
    )
    index = {vector: position for position, (vector, _form) in enumerate(projected)}
    candidates: list[
        tuple[dict[str, object], dict[str, object], dict[str, object]]
    ] = []
    for first_index, (first_vector, first_form) in enumerate(projected):
        for second_index in range(first_index, len(projected)):
            second_vector, second_form = projected[second_index]
            target = negative_vector(add_vectors(first_vector, second_vector))
            third_index = index.get(target)
            if third_index is None or third_index < second_index:
                continue
            candidates.append((first_form, second_form, projected[third_index][1]))
    return tuple(candidates)


def incidence_path_cache(
    cell: dict[str, object], forms: tuple[dict[str, object], ...]
) -> dict[tuple[Edge, Edge], PathWitness | None]:
    """Cache every directed edge path needed by the selected strict forms."""
    graph = path_cegar.equality_graph(cell)
    edges: set[Edge] = set()
    for form in forms:
        positive = form.get("positive")
        negative = form.get("negative")
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise ThreeFormBatchError("malformed Kalmanson edges")
        edges.update(base.distance_edge(*edge) for edge in (*positive, *negative))
    return {
        (left, right): path_cegar.shortest_incidence_path(graph, left, right)
        for left in sorted(edges)
        for right in sorted(edges)
    }


def best_three_form_conflict(
    forms: tuple[dict[str, object], dict[str, object], dict[str, object]],
    cache: dict[tuple[Edge, Edge], PathWitness | None],
) -> dict[str, object]:
    """Choose one low-incidence six-edge pairing for a three-form cancellation."""
    form_ids: list[tuple[int, ...]] = []
    left_edges: list[Edge] = []
    right_edges: list[Edge] = []
    for form in forms:
        form_id = form.get("form")
        positive = form.get("positive")
        negative = form.get("negative")
        if not isinstance(form_id, tuple):
            raise ThreeFormBatchError("malformed Kalmanson form identifier")
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise ThreeFormBatchError("malformed Kalmanson edges")
        form_ids.append(form_id)
        left_edges.extend(base.distance_edge(*edge) for edge in positive)
        right_edges.extend(base.distance_edge(*edge) for edge in negative)

    best: tuple[tuple[object, ...], dict[str, object]] | None = None
    for permutation in sorted(set(itertools.permutations(right_edges))):
        found = tuple(cache[(left, right)] for left, right in zip(left_edges, permutation, strict=True))
        if any(path is None for path in found):
            continue
        concrete = tuple(path for path in found if path is not None)
        atoms = tuple(sorted({atom for path_atoms, _steps in concrete for atom in path_atoms}))
        if not atoms:
            continue
        pairings = tuple(
            {"left": left, "right": right, "steps": steps}
            for left, right, (_atoms, steps) in zip(
                left_edges, permutation, concrete, strict=True
            )
        )
        conflict: dict[str, object] = {
            "kind": "three-form-incidence-path",
            "forms": tuple(form_ids),
            "pairings": pairings,
            "atoms": atoms,
        }
        key: tuple[object, ...] = (
            len(atoms),
            sum(len(steps) for _atoms, steps in concrete),
            permutation,
            atoms,
        )
        if best is None or key < best[0]:
            best = (key, conflict)
    if best is None:
        raise ThreeFormBatchError("three-form cancellation has no provider pairing")
    return best[1]


def all_three_form_incidence_conflicts(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[dict[str, object], ...]:
    """Compile every equal-weight representative triple to provider paths."""
    candidates = equal_weight_three_form_candidates(cell, order)
    forms = tuple(form for candidate in candidates for form in candidate)
    cache = incidence_path_cache(cell, forms)
    return tuple(best_three_form_conflict(candidate, cache) for candidate in candidates)


def _repo_relative(repo_root: Path, path: Path, label: str) -> tuple[str, Path]:
    resolved = path.resolve()
    try:
        relative = resolved.relative_to(repo_root)
    except ValueError as exc:
        raise ThreeFormBatchError(f"{label} is outside the repository") from exc
    return relative.as_posix(), resolved


def load_inputs(
    repo_root: Path, manifest_path: Path, source_event_path: Path
) -> tuple[str, Path, dict[str, Any], bytes]:
    """Authenticate the run manifest, producer, and source event."""
    manifest, manifest_sha256, run_root = coarse.load_run_manifest(
        repo_root, manifest_path
    )
    source_digests = manifest.get("source_digests")
    if not isinstance(source_digests, dict):
        raise ThreeFormBatchError("run manifest has no source digest map")
    producer = repo_root / SELF_PATH
    if source_digests.get(SELF_PATH) != coarse.sha256_bytes(producer.read_bytes()):
        raise ThreeFormBatchError("run manifest does not anchor the producer")
    relative, resolved_event = _repo_relative(repo_root, source_event_path, "source event")
    event_bytes = resolved_event.read_bytes()
    input_digests = manifest.get("input_digests")
    if not isinstance(input_digests, dict):
        raise ThreeFormBatchError("run manifest has no input digest map")
    if input_digests.get(relative) != coarse.sha256_bytes(event_bytes):
        raise ThreeFormBatchError("run manifest does not anchor the source event")
    return manifest_sha256, run_root, json.loads(event_bytes), event_bytes


def batch_payload(
    *,
    manifest_sha256: str,
    source_event_path: str,
    source_event_bytes: bytes,
    event: dict[str, Any],
) -> dict[str, object]:
    """Build a seed-compatible three-form batch from one replayed model."""
    coarse_cell = one_form_batch.source_coarse_cell(event)
    cell = one_form_batch.final_replayed_cell(event)
    coarse.validate_decoded_cell(coarse_cell, cell)
    order = base.DIRECT_ORDER if coarse_cell.orientation == "direct" else base.MIRROR_ORDER
    conflicts = all_three_form_incidence_conflicts(cell, order)
    rows = one_form_batch.unique_conflict_cuts(conflicts)
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-replayed-model-equal-weight-three-form-cuts",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": coarse_cell.to_json(int(event["cell"].get("index", 0))),
        "three_form_candidate_count": len(conflicts),
        "unique_cut_count": len(rows),
        "run_manifest_sha256": manifest_sha256,
        "source_event": source_event_path,
        "source_event_sha256": coarse.sha256_bytes(source_event_bytes),
        "solves": [
            {
                "solver": "derived-from-replayed-model",
                "iterations": [
                    {"index": index, "linear_conflict": conflict, "cut": cut}
                    for index, (conflict, cut) in enumerate(rows)
                ],
            }
        ],
    }
    payload["event_sha256"] = coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    return payload


def main() -> int:
    """Emit one authenticated three-form batch under a governed run root."""
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
    source_relative, _resolved = _repo_relative(
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
                "three_form_candidates": payload["three_form_candidate_count"],
                "unique_cuts": payload["unique_cut_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
