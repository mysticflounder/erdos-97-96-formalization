#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exhaust the ordered surplus source/deletion placements.

This scan is deliberately narrower than ``probe.py``: it asks only whether a
pinned exact class and marked dangerous exact class extend to one compatible
selected four-class at every ambient center.  It is the placement-coverage
gate for promoting zero-extension row types to theorem candidates.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from collections import Counter, defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Sequence

from census.global_confinement.probe import (
    PIN_CENTER,
    _fixed_rows,
    ordered_surplus_placements,
    packet_labels,
)
from census.global_confinement.shadow import full_center_extension_rows, solve_rows
from census.multi_center import multi_center_census as mc


STATUSES = ("SAT", "UNSAT", "INDETERMINATE")


def _row_type(frame: mc.Frame, blocker: int, dangerous: frozenset[int]) -> str:
    if blocker < 3:
        return f"Moser-{blocker}"
    return str(mc.type_of_fast(frame, blocker, dangerous))


def _placement_job(args: tuple) -> dict:
    n, pin_source_index, deleted_index, max_nodes, row_types = args
    row_type_filter = set(row_types) if row_types is not None else None
    labels = packet_labels(
        n,
        pin_source_index=pin_source_index,
        deleted_index=deleted_index,
    )
    frame, candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert candidates is not None

    rows = []
    counts = Counter()
    type_counts: dict[str, dict[str, int]] = defaultdict(
        lambda: {"candidates": 0, **{status: 0 for status in STATUSES}}
    )
    started = time.perf_counter()
    for blocker in range(frame.n):
        if blocker in {PIN_CENTER, labels.deleted}:
            continue
        for dangerous in candidates[blocker]:
            if labels.deleted not in dangerous:
                continue
            row_type = _row_type(frame, blocker, dangerous)
            if row_type_filter is not None and row_type not in row_type_filter:
                continue
            fixed = _fixed_rows(labels, blocker, dangerous)
            occupied = {row.center for row in fixed}
            result = solve_rows(
                frame,
                set(mc.PROVEN_ROWS),
                fixed_rows=fixed,
                variable_rows=full_center_extension_rows(
                    frame, candidates, occupied
                ),
                max_nodes=max_nodes,
            )
            counts[result["status"]] += 1
            type_counts[row_type]["candidates"] += 1
            type_counts[row_type][result["status"]] += 1
            rows.append(
                {
                    "blocker": blocker,
                    "dangerous": sorted(dangerous),
                    "type": row_type,
                    "status": result["status"],
                    "nodes": result["nodes"],
                }
            )

    return {
        "n": n,
        "profile": list(labels.profile),
        "pin_source_index": pin_source_index,
        "deleted_index": deleted_index,
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "pin_class": sorted(labels.pin_class),
        "counts": {status: counts[status] for status in STATUSES},
        "type_counts": dict(sorted(type_counts.items())),
        "elapsed_sec": time.perf_counter() - started,
        "rows": rows,
    }


def scan_range(
    n_min: int,
    n_max: int,
    *,
    max_nodes: int,
    workers: int,
    row_types: Sequence[str] | None = None,
) -> dict:
    normalized_types = tuple(sorted(set(row_types))) if row_types else None
    jobs = []
    for n in range(n_min, n_max + 1):
        placements = ordered_surplus_placements(n)
        index_of = {point: index for index, point in enumerate(mc.build_frame(
            (n - 5, 4, 4)
        ).ints["S"])}
        jobs.extend(
            (
                n,
                index_of[placement.pin_source],
                index_of[placement.deleted],
                max_nodes,
                normalized_types,
            )
            for placement in placements
        )

    results = []
    if workers == 1:
        for index, job in enumerate(jobs, start=1):
            results.append(_placement_job(job))
            print(
                f"[placement-scan] placement {index}/{len(jobs)} "
                f"n={job[0]} source={job[1]} deleted={job[2]}",
                file=sys.stderr,
                flush=True,
            )
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            futures = {pool.submit(_placement_job, job): job for job in jobs}
            for index, future in enumerate(as_completed(futures), start=1):
                job = futures[future]
                results.append(future.result())
                print(
                    f"[placement-scan] placement {index}/{len(jobs)} "
                    f"n={job[0]} source={job[1]} deleted={job[2]}",
                    file=sys.stderr,
                    flush=True,
                )
    results.sort(key=lambda row: (
        row["n"], row["pin_source_index"], row["deleted_index"]
    ))

    by_n = []
    stable_zero: set[str] | None = None
    for n in range(n_min, n_max + 1):
        placements = [row for row in results if row["n"] == n]
        total = Counter()
        type_totals: dict[str, Counter] = defaultdict(Counter)
        for placement in placements:
            total.update(placement["counts"])
            for row_type, counts in placement["type_counts"].items():
                type_totals[row_type].update(counts)
        zero_types = sorted(
            row_type
            for row_type, counts in type_totals.items()
            if counts["candidates"] > 0
            and counts["SAT"] == 0
            and counts["INDETERMINATE"] == 0
        )
        current_zero = set(zero_types)
        stable_zero = (
            current_zero if stable_zero is None else stable_zero & current_zero
        )
        by_n.append(
            {
                "n": n,
                "placement_count": len(placements),
                "counts": {status: total[status] for status in STATUSES},
                "zero_extension_types": zero_types,
                "type_totals": {
                    row_type: dict(counts)
                    for row_type, counts in sorted(type_totals.items())
                },
            }
        )

    return {
        "schema": "p97-global-confinement-placement-scan-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "scope": {
            "n_min": n_min,
            "n_max": n_max,
            "max_nodes_per_search": max_nodes,
            "workers": workers,
            "ordered_placements": "all distinct surplus-interior pairs",
            "layer": "full-center extension only",
            "row_type_filter": list(normalized_types) if normalized_types else None,
        },
        "by_n": by_n,
        "stable_zero_extension_types": sorted(stable_zero or set()),
        "placements": results,
    }


def _markdown(artifact: dict) -> str:
    row_type_filter = artifact["scope"].get("row_type_filter")
    filter_lines = [] if row_type_filter is None else [
        "",
        "Row-type filter: "
        + ", ".join(f"`{row_type}`" for row_type in row_type_filter)
        + ".",
    ]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Ordered-placement extension scan",
        "",
        f"Generated `{artifact['generated_at']}`.",
        "",
        "This exhausts every ordered pair of distinct surplus-interior labels at ",
        "each scanned cardinality. It tests only full-center extension of the ",
        "fixed pin plus marked dangerous exact row. It does not repeat the audit ",
        "survival/confinement scan, encode coordinates, or encode the ",
        "source-indexed critical-shell system.",
        *filter_lines,
        "",
        "`SAT` is an incidence witness, not a Euclidean realization. `UNSAT` is ",
        "scoped to the declared shadow. Any node-capped search is reported as ",
        "`INDETERMINATE`.",
        "",
        "## Summary",
        "",
        "| n | ordered placements | dangerous SAT | UNSAT | INDETERMINATE | zero-extension types |",
        "|---:|---:|---:|---:|---:|---|",
    ]
    for row in artifact["by_n"]:
        counts = row["counts"]
        zero = ", ".join(f"`{value}`" for value in row["zero_extension_types"])
        lines.append(
            f"| {row['n']} | {row['placement_count']} | {counts['SAT']} | "
            f"{counts['UNSAT']} | {counts['INDETERMINATE']} | {zero or 'none'} |"
        )
    stable = ", ".join(
        f"`{value}`" for value in artifact["stable_zero_extension_types"]
    )
    lines.extend(
        [
            "",
            "Types with zero extension at every scanned cardinality and placement: "
            + (stable or "none"),
            "",
            "## Placements",
            "",
            "| n | source -> q | dangerous SAT/total | zero-extension types |",
            "|---:|---|---:|---|",
        ]
    )
    for placement in artifact["placements"]:
        counts = placement["counts"]
        zero = [
            row_type
            for row_type, type_counts in placement["type_counts"].items()
            if type_counts["candidates"] > 0
            and type_counts["SAT"] == 0
            and type_counts["INDETERMINATE"] == 0
        ]
        zero_text = ", ".join(f"`{value}`" for value in zero) or "none"
        total = sum(counts.values())
        lines.append(
            f"| {placement['n']} | {placement['pin_source']} -> "
            f"{placement['deleted']} | {counts['SAT']}/{total} | {zero_text} |"
        )
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n-min", type=int, default=11)
    parser.add_argument("--n-max", type=int, default=12)
    parser.add_argument("--max-nodes", type=int, default=200_000)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument(
        "--row-type",
        action="append",
        dest="row_types",
        help="scan only this exact dangerous-row type; may be repeated",
    )
    parser.add_argument("--out", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.n_min < 11 or args.n_min > args.n_max:
        parser.error("require 11 <= --n-min <= --n-max")
    if not 1 <= args.workers <= 8:
        parser.error("--workers must be between 1 and 8")

    artifact = scan_range(
        args.n_min,
        args.n_max,
        max_nodes=args.max_nodes,
        workers=args.workers,
        row_types=args.row_types,
    )
    encoded = json.dumps(artifact, indent=2, sort_keys=True) + "\n"
    if args.out:
        args.out.write_text(encoded)
    else:
        print(encoded, end="")
    if args.markdown:
        args.markdown.write_text(_markdown(artifact))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
