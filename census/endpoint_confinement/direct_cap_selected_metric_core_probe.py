#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Direct finite probe for the forced card-eleven `(6,4,4)` branch.

Unlike the packet-stratified probes, this search quantifies the dangerous
blocker condition directly.  For each ordered pair of distinct
surplus-interior labels it chooses:

* the fixed exact pinned row;
* a surplus-apex row containing the deleted source; and
* one selected four-row at every other center.

It enforces the exact cap-selected hit counts and rejects every assignment
containing one of the twelve formalized metric cores.  At a complete
assignment it derives a critical-shell blocker map using exactly those
centers whose selected row remains exact-compatible with the equality
closure.  No local tuple kill is used.  Thus a complete all-UNSAT result
matches the intended finite Lean code more closely than the earlier
one-packet-per-type census.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from datetime import datetime, timezone
from functools import lru_cache
from pathlib import Path
from typing import Sequence

from census.endpoint_confinement.metric_realizability_probe import (
    MetricRow,
    _closure_circle_index,
    _formalized_metric_core,
    _row_equality_closure,
)
from census.endpoint_confinement.probe import PIN_CENTER, packet_labels
from census.endpoint_confinement.shadow import (
    ClassRow,
    VariableRow,
    full_center_extension_rows,
    hull_order,
    solve_rows,
)
from census.endpoint_confinement.surplus_source_metric_core_probe import (
    _cap_selected_rows_ok,
)
from census.multi_center import multi_center_census as mc


HERE = Path(__file__).resolve().parent
DEFAULT_OUT = HERE / "direct_cap_selected_metric_core_results_n11.json"
DEFAULT_RESIDUAL_OUT = (
    HERE / "direct_cap_selected_metric_core_residuals_n11.json"
)
SCHEMA = "p97-direct-cap-selected-metric-core-v1"
RESIDUAL_SCHEMA = "p97-direct-cap-selected-metric-core-residual-bank-v1"
STATUSES = ("SAT", "UNSAT", "INDETERMINATE")
DEPENDENCIES = (
    HERE / "metric_realizability_probe.py",
    HERE / "probe.py",
    HERE / "shadow.py",
    HERE / "surplus_source_metric_core_probe.py",
    HERE.parent / "candidate_d_probe" / "q2_token.py",
    HERE.parent / "multi_center" / "multi_center_census.py",
    HERE.parent / "q3_two_center" / "q3_token.py",
)


def _metric_rows(rows: Sequence[ClassRow]) -> tuple[MetricRow, ...]:
    merged: dict[tuple[int, tuple[int, ...]], bool] = {}
    for row in rows:
        key = row.center, tuple(sorted(row.support))
        merged[key] = merged.get(key, False) or row.exact
    return tuple(
        MetricRow(center, support, exact)
        for (center, support), exact in sorted(merged.items())
    )


def _safe_blocker_assignment(
    rows: tuple[MetricRow, ...],
    n: int,
    pin_class: frozenset[int],
    deleted: int,
) -> tuple[int, ...] | None:
    """Derive a blocker map whose used rows can consistently be exact.

    Equality closure is independent of row exactness.  A center is safe when
    its selected row is not closure-forced to contain an omitted point on the
    same circle.  The critical-shell premises then reduce to coverage by safe
    centers, with the pinned support forced to use the pinned center.
    """

    by_center = {row.center: row for row in rows}
    if len(by_center) != n:
        raise AssertionError("complete assignment must have one row per center")
    closure = _row_equality_closure(n, rows)
    roots, _ = _closure_circle_index(closure, n)
    safe: set[int] = set()
    for center, row in by_center.items():
        support = frozenset(row.support)
        reference = roots[center][row.support[0]]
        if all(
            point == center
            or point in support
            or roots[center][point] != reference
            for point in range(n)
        ):
            safe.add(center)

    if PIN_CENTER not in safe:
        return None
    blocker = []
    for source in range(n):
        if source in pin_class:
            blocker.append(PIN_CENTER)
            continue
        choices = [
            center
            for center in sorted(safe)
            if source in by_center[center].support
            and (source != deleted or center != PIN_CENTER)
        ]
        if not choices:
            return None
        blocker.append(choices[0])
    return tuple(blocker)


def _cap_filtered_rows(frame, candidates, deleted) -> tuple[VariableRow, ...]:
    """Choose one row per nonpinned center after unary cap filtering."""

    rows = []
    for spec in full_center_extension_rows(frame, candidates, {PIN_CENTER}):
        supports = tuple(
            support
            for support in spec.candidates
            if (spec.center != 0 or deleted in support)
            and _cap_selected_rows_ok(
                (MetricRow(spec.center, tuple(sorted(support)), False),), frame
            )
        )
        rows.append(VariableRow(spec.name, spec.center, supports))
    return tuple(rows)


def _placement_job(args: tuple[int, int, int, bool]) -> dict:
    pin_source_index, deleted_index, max_nodes, enumerate_residuals = args
    started = time.perf_counter()
    labels = packet_labels(
        11,
        pin_source_index=pin_source_index,
        deleted_index=deleted_index,
    )
    frame, candidates = mc.cached_candidate_lists(labels.profile, set())
    assert candidates is not None

    pinned = ClassRow("pinned", PIN_CENTER, labels.pin_class, exact=True)
    variable_rows = _cap_filtered_rows(frame, candidates, labels.deleted)
    order = hull_order(frame)

    prefix_misses = 0
    complete_misses = 0
    residuals = []

    @lru_cache(maxsize=None)
    def prefix_ok(rows: tuple[MetricRow, ...]) -> bool:
        nonlocal prefix_misses
        prefix_misses += 1
        if not _cap_selected_rows_ok(rows, frame):
            return False
        return _formalized_metric_core(
            rows, frame.n, order, include_extended=False
        ) is None

    @lru_cache(maxsize=None)
    def complete_ok(rows: tuple[MetricRow, ...]) -> bool:
        nonlocal complete_misses
        complete_misses += 1
        if not _cap_selected_rows_ok(rows, frame):
            return False
        if _formalized_metric_core(rows, frame.n, order) is not None:
            return False
        blocker = _safe_blocker_assignment(
            rows, frame.n, labels.pin_class, labels.deleted
        )
        if blocker is None:
            return False
        if enumerate_residuals:
            residuals.append(
                {
                    "rows": [row.as_dict() for row in rows],
                    "blocker": list(blocker),
                }
            )
            return False
        return True

    result = solve_rows(
        frame,
        set(),
        fixed_rows=(pinned,),
        variable_rows=variable_rows,
        max_nodes=max_nodes,
        want_assignment=True,
        prefix_compatible=lambda rows: prefix_ok(_metric_rows(rows)),
        complete_compatible=lambda rows: complete_ok(_metric_rows(rows)),
    )
    blocker = None
    if not enumerate_residuals and result["status"] == "SAT":
        assignment = result["assignment"]
        metric_rows = tuple(
            MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                bool(row["exact"]),
            )
            for row in assignment.values()
        )
        blocker = _safe_blocker_assignment(
            metric_rows, frame.n, labels.pin_class, labels.deleted
        )
        if blocker is None:
            raise AssertionError("SAT assignment has no safe blocker map")
    status = result["status"]
    if enumerate_residuals and status == "UNSAT":
        status = "EXHAUSTIVE"
    return {
        "pin_source_index": pin_source_index,
        "deleted_index": deleted_index,
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "status": status,
        "nodes": result["nodes"],
        **(
            {"assignment": result["assignment"]}
            if not enumerate_residuals and "assignment" in result
            else {}
        ),
        **({"blocker": list(blocker)} if blocker is not None else {}),
        **(
            {"residual_count": len(residuals), "residuals": residuals}
            if enumerate_residuals
            else {}
        ),
        "prefix_cache_misses": prefix_misses,
        "complete_cache_misses": complete_misses,
        "elapsed_sec": time.perf_counter() - started,
    }


def _residual_bank(results: Sequence[dict]) -> list[dict]:
    """Deduplicate enumerated row patterns while retaining every placement."""

    bank = {}
    for result in results:
        for residual in result.get("residuals", ()):
            key = tuple(
                (row["center"], tuple(row["support"]))
                for row in residual["rows"]
            )
            entry = bank.setdefault(
                key,
                {"rows": residual["rows"], "occurrences": []},
            )
            entry["occurrences"].append(
                {
                    "pin_source_index": result["pin_source_index"],
                    "deleted_index": result["deleted_index"],
                    "pin_source": result["pin_source"],
                    "deleted": result["deleted"],
                    "blocker": residual["blocker"],
                }
            )
    entries = []
    for key in sorted(bank):
        entry = bank[key]
        canonical = json.dumps(
            entry["rows"], sort_keys=True, separators=(",", ":")
        ).encode()
        entry["pattern_sha256"] = hashlib.sha256(canonical).hexdigest()
        entries.append(entry)
    return entries


def run(*, workers: int, max_nodes: int, enumerate_residuals: bool = False) -> dict:
    jobs = [
        (pin, deleted, max_nodes, enumerate_residuals)
        for pin in range(4)
        for deleted in range(4)
        if pin != deleted
    ]
    results = []
    with ProcessPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(_placement_job, job): job for job in jobs}
        for index, future in enumerate(as_completed(futures), start=1):
            result = future.result()
            results.append(result)
            print(
                f"[{index}/{len(jobs)}] source={result['pin_source']} "
                f"deleted={result['deleted']}: {result['status']} "
                f"nodes={result['nodes']}",
                flush=True,
            )
    results.sort(key=lambda row: (row["pin_source_index"], row["deleted_index"]))
    counts = Counter(row["status"] for row in results)
    residual_bank = _residual_bank(results) if enumerate_residuals else []
    source = Path(__file__).resolve()
    artifact = {
        "schema": RESIDUAL_SCHEMA if enumerate_residuals else SCHEMA,
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "source": os.path.relpath(source, HERE.parents[1]),
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "dependency_sha256": {
            os.path.relpath(path, HERE.parents[1]): hashlib.sha256(
                path.read_bytes()
            ).hexdigest()
            for path in DEPENDENCIES
        },
        "complete": len(results) == len(jobs)
        and all(row["status"] != "INDETERMINATE" for row in results),
        "scope": {
            "profile": [6, 4, 4],
            "placements": len(jobs),
            "workers": workers,
            "max_nodes": max_nodes,
            "local_row_kills": [],
            "metric_core_count": 12,
            "cap_selected_exact_counts": True,
            "one_selected_row_per_center": True,
            "blocker_map": "derived-from-exact-compatible-centers",
            "mode": "enumerate-residuals" if enumerate_residuals else "first-residual",
        },
        "summary": dict(sorted(counts.items())),
        "results": results,
    }
    if enumerate_residuals:
        artifact["residual_pattern_count"] = len(residual_bank)
        artifact["residual_bank"] = residual_bank
    return artifact


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--workers", type=int, default=min(8, os.cpu_count() or 1))
    parser.add_argument("--max-nodes", type=int, default=10_000_000)
    parser.add_argument(
        "--enumerate-residuals",
        action="store_true",
        help="record every core-free complete pattern and continue to exhaustion",
    )
    args = parser.parse_args()
    if args.workers < 1:
        parser.error("--workers must be positive")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")
    artifact = run(
        workers=args.workers,
        max_nodes=args.max_nodes,
        enumerate_residuals=args.enumerate_residuals,
    )
    out = args.out or (
        DEFAULT_RESIDUAL_OUT if args.enumerate_residuals else DEFAULT_OUT
    )
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")
    print(json.dumps(artifact["summary"], indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
