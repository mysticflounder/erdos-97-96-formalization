#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Batch every two-form provider cancellation exposed by one PIQD SAT model."""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path
from typing import Any

import cardge13_exact13_coarse_cell_batch_piqd as one_form_batch
import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd as pair_cegar
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-coarse-cell-two-form-batch-piqd/v1"
SELF_PATH = "scripts/cardge13_exact13_coarse_cell_two_form_batch_piqd.py"


class TwoFormBatchError(RuntimeError):
    """A source event, run manifest, or two-form conflict is malformed."""


FormVector = tuple[tuple[tuple[int, int], int], ...]


def negative_vector(vector: FormVector) -> FormVector:
    """Negate one canonical projected strict-form vector."""
    return tuple((edge, -coefficient) for edge, coefficient in vector)


def opposite_form_pairs(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[tuple[dict[str, object], dict[str, object]], ...]:
    """Enumerate every unordered nonzero pair whose projected vectors cancel."""
    base.validate_cell(cell)
    roots = base.edge_roots_for_rows(base.cell_rows(cell))
    grouped: dict[FormVector, list[dict[str, object]]] = defaultdict(list)
    for form in base.kalmanson_forms(order):
        grouped[base.projected_form_vector(form, roots)].append(form)

    result: list[tuple[dict[str, object], dict[str, object]]] = []
    for vector in sorted(grouped):
        if not vector:
            continue
        opposite = negative_vector(vector)
        if vector >= opposite or opposite not in grouped:
            continue
        for left in grouped[vector]:
            for right in grouped[opposite]:
                result.append((left, right))
    return tuple(result)


def all_two_form_incidence_conflicts(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[dict[str, object], ...]:
    """Produce an explicit provider-path proof for every opposite-form pair."""
    conflicts: list[dict[str, object]] = []
    for left, right in opposite_form_pairs(cell, order):
        left_id = left.get("form")
        right_id = right.get("form")
        if not isinstance(left_id, tuple) or not isinstance(right_id, tuple):
            raise TwoFormBatchError("malformed Kalmanson form identifier")
        conflict = pair_cegar.incidence_minimize_pair_conflict(
            cell, order, {"forms": (left_id, right_id)}
        )
        if conflict.get("kind") != "two-form-incidence-path":
            raise TwoFormBatchError("pair minimizer returned the wrong conflict kind")
        conflicts.append(conflict)
    return tuple(conflicts)


def _repo_relative(repo_root: Path, path: Path, label: str) -> tuple[str, Path]:
    resolved = path.resolve()
    try:
        relative = resolved.relative_to(repo_root)
    except ValueError as exc:
        raise TwoFormBatchError(f"{label} is outside the repository") from exc
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
        raise TwoFormBatchError("run manifest has no source digest map")
    producer = repo_root / SELF_PATH
    if source_digests.get(SELF_PATH) != coarse.sha256_bytes(producer.read_bytes()):
        raise TwoFormBatchError("run manifest does not anchor the batch producer")
    relative, resolved_event = _repo_relative(repo_root, source_event_path, "source event")
    event_bytes = resolved_event.read_bytes()
    input_digests = manifest.get("input_digests")
    if not isinstance(input_digests, dict):
        raise TwoFormBatchError("run manifest has no input digest map")
    if input_digests.get(relative) != coarse.sha256_bytes(event_bytes):
        raise TwoFormBatchError("run manifest does not anchor the source event")
    return manifest_sha256, run_root, json.loads(event_bytes), event_bytes


def batch_payload(
    *,
    manifest_sha256: str,
    source_event_path: str,
    source_event_bytes: bytes,
    event: dict[str, Any],
) -> dict[str, object]:
    """Build a seed-compatible batch event from one replayed source model."""
    coarse_cell = one_form_batch.source_coarse_cell(event)
    cell = one_form_batch.final_replayed_cell(event)
    coarse.validate_decoded_cell(coarse_cell, cell)
    order = (
        base.DIRECT_ORDER
        if coarse_cell.orientation == "direct"
        else base.MIRROR_ORDER
    )
    conflicts = all_two_form_incidence_conflicts(cell, order)
    rows = one_form_batch.unique_conflict_cuts(conflicts)
    iterations = [
        {"index": index, "linear_conflict": conflict, "cut": cut}
        for index, (conflict, cut) in enumerate(rows)
    ]
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "claim_scope": {
            "classification": "one-replayed-model-all-two-form-cuts",
            "source_coverage": False,
            "theorem_promotion": False,
        },
        "cell": coarse_cell.to_json(int(event["cell"].get("index", 0))),
        "opposite_form_pair_count": len(conflicts),
        "unique_cut_count": len(rows),
        "run_manifest_sha256": manifest_sha256,
        "source_event": source_event_path,
        "source_event_sha256": coarse.sha256_bytes(source_event_bytes),
        "solves": [{"solver": "derived-from-replayed-model", "iterations": iterations}],
    }
    payload["event_sha256"] = coarse.sha256_bytes(coarse.canonical_json_bytes(payload))
    return payload


def main() -> int:
    """Emit one authenticated two-form batch below a governed run root."""
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
                "opposite_form_pairs": payload["opposite_form_pair_count"],
                "unique_cuts": payload["unique_cut_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
