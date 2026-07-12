#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Probe the surplus-source row against the formalized metric cores.

The general-m Lean producer now selects a four-class at the surplus Moser
center that contains the deleted surplus point. Earlier source-shell scans
selected only an arbitrary global row at that center. This probe adds the
stronger row and asks whether an incidence assignment can avoid every core in
``MetricCoreAlternative``. Five cheap cores prune partial assignments; seven
additional equality-only cores are checked at complete DFS leaves.

The input packets and candidate domains remain bounded incidence artifacts.
An UNSAT result is not a general-n completeness theorem.
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

from census.endpoint_confinement.critical_shell_probe import (
    no_qfree_compatibility,
    source_shell_rows,
)
from census.endpoint_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)
from census.endpoint_confinement.probe import _fixed_rows, packet_labels
from census.endpoint_confinement.shadow import (
    ChoiceRow,
    ClassRow,
    RowChoice,
    full_center_extension_rows,
    hull_order,
    solve_choice_rows,
)
from census.multi_center import multi_center_census as mc


HERE = Path(__file__).resolve().parent
DEFAULT_INPUT = HERE / "critical_shell_results_all_placements_n11_12.json"
DEFAULT_OUT = HERE / "surplus_source_metric_core_results_n11_12.json"
SCHEMA = "p97-global-confinement-surplus-source-metric-core-v6"
CAP_SELECTED_SCHEMA = (
    "p97-global-confinement-cap-selected-row-metric-core-v2"
)
CAP_SELECTED_UNORDERED_SCHEMA = (
    "p97-global-confinement-cap-selected-row-unordered-metric-core-v1"
)
CAP_SELECTED_LEGACY_SCHEMAS = {
    "p97-global-confinement-cap-selected-row-metric-core-v1":
        "cap-hit-upper-bounds",
}
LEGACY_SCHEMAS = {
    "p97-global-confinement-surplus-source-metric-core-v1": "five-core",
    "p97-global-confinement-surplus-source-metric-core-v2": "eight-core",
    "p97-global-confinement-surplus-source-metric-core-v3":
        "nine-core-distinct-role",
    "p97-global-confinement-surplus-source-metric-core-v4":
        "nine-core-correct-role",
    "p97-global-confinement-surplus-source-metric-core-v5":
        "eleven-core-correct-role",
}
SURPLUS_CENTER = 0
STATUSES = ("SAT", "UNSAT", "INDETERMINATE")


def _metric_rows(rows: Sequence[ClassRow]) -> tuple[MetricRow, ...]:
    """Merge named aliases while retaining exactness for core detection."""

    merged: dict[tuple[int, tuple[int, ...]], bool] = {}
    for row in rows:
        key = row.center, tuple(sorted(row.support))
        merged[key] = merged.get(key, False) or row.exact
    return tuple(
        MetricRow(center, support, exact)
        for (center, support), exact in sorted(merged.items())
    )


def _cap_selected_rows_ok(rows: Sequence[ClassRow], frame: mc.Frame) -> bool:
    """Apply the proved surplus-cap hit counts to every represented row."""

    endpoints = frozenset((1, 2))
    for row in rows:
        if row.center not in frame.S:
            continue
        bound = 1 if row.center in endpoints else 2
        hits = len(frame.S.intersection(row.support))
        if frame.profile == (6, 4, 4):
            if hits != bound:
                return False
        elif hits > bound:
            return False
    return True


def _choice_rows(frame: mc.Frame, candidates, packet: dict):
    labels = packet_labels(
        packet["n"],
        pin_source_index=packet["pin_source_index"],
        deleted_index=packet["deleted_index"],
    )
    fixed = _fixed_rows(
        labels, packet["blocker"], frozenset(packet["dangerous"])
    )
    shells = source_shell_rows(
        frame, candidates, fixed_sources={labels.deleted}
    )
    surplus_choices = tuple(
        RowChoice(SURPLUS_CENTER, support)
        for support in candidates[SURPLUS_CENTER]
        if labels.deleted in support
    )
    surplus_row = ChoiceRow("surplus-source", surplus_choices)
    occupied = {row.center for row in fixed} | {SURPLUS_CENTER}
    global_rows = tuple(
        ChoiceRow(
            row.name,
            tuple(RowChoice(row.center, support) for support in row.candidates),
            exact=row.exact,
        )
        for row in full_center_extension_rows(frame, candidates, occupied)
    )
    source_by_row = {
        "dangerous": labels.deleted,
        **{
            row.name: int(row.name.split(":", maxsplit=1)[1])
            for row in shells
        },
    }
    return (
        labels,
        fixed,
        (*shells, surplus_row, *global_rows),
        no_qfree_compatibility(source_by_row),
        len(surplus_choices),
    )


def _compact(result: dict) -> dict:
    return {
        key: result[key]
        for key in ("status", "nodes", "assignment")
        if key in result
    }


def _packet_job(args: tuple[int, dict, int, bool, bool]) -> dict:
    index, packet, max_nodes, cap_selected_row_counting, include_ordered = args
    started = time.perf_counter()
    frame, candidates = mc.cached_candidate_lists(
        tuple(packet["profile"]), set(mc.PROVEN_ROWS)
    )
    assert candidates is not None
    labels, fixed, choices, no_qfree, surplus_choice_count = _choice_rows(
        frame, candidates, packet
    )
    order = hull_order(frame)

    incidence = solve_choice_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed,
        choice_rows=choices,
        max_nodes=max_nodes,
        want_assignment=True,
        extra_compatible=no_qfree,
    )
    first_core = None
    if incidence["status"] == "SAT":
        rows = tuple(
            ClassRow(
                name,
                raw["center"],
                frozenset(raw["support"]),
                exact=raw["exact"],
            )
            for name, raw in incidence["assignment"].items()
        )
        first_core = _formalized_metric_core(
            _metric_rows(rows), frame.n, order, include_ordered=include_ordered
        )

    prefix_cache_misses = 0
    complete_cache_misses = 0

    @lru_cache(maxsize=None)
    def prefix_core_free(metric_rows: tuple[MetricRow, ...]) -> bool:
        nonlocal prefix_cache_misses
        prefix_cache_misses += 1
        if cap_selected_row_counting and not _cap_selected_rows_ok(
            metric_rows, frame
        ):
            return False
        return _formalized_metric_core(
            metric_rows,
            frame.n,
            order,
            include_extended=False,
            include_ordered=include_ordered,
        ) is None

    @lru_cache(maxsize=None)
    def complete_core_free(metric_rows: tuple[MetricRow, ...]) -> bool:
        nonlocal complete_cache_misses
        complete_cache_misses += 1
        if cap_selected_row_counting and not _cap_selected_rows_ok(
            metric_rows, frame
        ):
            return False
        return _formalized_metric_core(
            metric_rows, frame.n, order, include_ordered=include_ordered
        ) is None

    if incidence["status"] == "UNSAT":
        core_free_result = {"status": "UNSAT", "nodes": incidence["nodes"]}
    elif incidence["status"] == "INDETERMINATE":
        core_free_result = {
            "status": "INDETERMINATE",
            "nodes": incidence["nodes"],
        }
    else:
        core_free_result = solve_choice_rows(
            frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=fixed,
            choice_rows=choices,
            max_nodes=max_nodes,
            want_assignment=True,
            extra_compatible=no_qfree,
            prefix_compatible=lambda rows: prefix_core_free(_metric_rows(rows)),
            complete_compatible=lambda rows: complete_core_free(
                _metric_rows(rows)
            ),
        )

    prefix_cache_info = prefix_core_free.cache_info()
    complete_cache_info = complete_core_free.cache_info()
    return {
        "packet_index": index,
        "n": packet["n"],
        "profile": packet["profile"],
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "blocker": packet["blocker"],
        "dangerous": packet["dangerous"],
        "type": packet["type"],
        "surplus_choice_count": surplus_choice_count,
        "cap_selected_row_counting": cap_selected_row_counting,
        "include_ordered_metric_cores": include_ordered,
        "incidence": _compact(incidence) | {"assignment": None},
        "first_incidence_core": first_core,
        "core_free": _compact(core_free_result),
        "core_cache": {
            "prefix": {
                "hits": prefix_cache_info.hits,
                "misses": prefix_cache_misses,
            },
            "complete": {
                "hits": complete_cache_info.hits,
                "misses": complete_cache_misses,
            },
        },
        "elapsed_sec": time.perf_counter() - started,
    }


def _artifact(
    input_path: Path,
    *,
    workers: int,
    max_nodes: int,
    limit: int | None,
    expected_packets: int,
    results: Sequence[dict],
    complete: bool,
    cap_selected_row_counting: bool = False,
    include_ordered: bool = True,
) -> dict:
    ordered = sorted(results, key=lambda result: result["packet_index"])
    incidence_counts = Counter(row["incidence"]["status"] for row in ordered)
    core_free_counts = Counter(row["core_free"]["status"] for row in ordered)
    first_core_counts = Counter(
        row["first_incidence_core"]["stage"]
        for row in ordered
        if row["first_incidence_core"] is not None
    )
    legacy_reuse_counts = Counter(
        row["legacy_resume"]["schema"]
        for row in ordered
        if "legacy_resume" in row
    )
    return {
        "schema": (
            CAP_SELECTED_UNORDERED_SCHEMA
            if cap_selected_row_counting and not include_ordered
            else CAP_SELECTED_SCHEMA if cap_selected_row_counting else SCHEMA
        ),
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "input": os.path.relpath(input_path, HERE.parents[1]),
        "input_sha256": hashlib.sha256(input_path.read_bytes()).hexdigest(),
        "complete": complete,
        "scope": {
            "workers": workers,
            "max_nodes": max_nodes,
            "limit": limit,
            "expected_packets": expected_packets,
            "completed_packets": len(ordered),
            "legacy_reused_packets": sum(legacy_reuse_counts.values()),
            "cap_selected_row_counting": cap_selected_row_counting,
            "include_ordered_metric_cores": include_ordered,
        },
        "summary": {
            "incidence": {status: incidence_counts[status] for status in STATUSES},
            "core_free": {status: core_free_counts[status] for status in STATUSES},
            "first_incidence_core": dict(sorted(first_core_counts.items())),
            "legacy_reuse": dict(sorted(legacy_reuse_counts.items())),
        },
        "results": ordered,
    }


def _validated_resume_results(
    resume: dict,
    input_path: Path,
    *,
    limit: int | None,
    cap_selected_row_counting: bool = False,
    include_ordered: bool = True,
) -> tuple[tuple[dict, ...], str]:
    """Validate a checkpoint and retain only reusable terminal verdicts."""

    resume_schema = resume.get("schema")
    current_schema = (
        CAP_SELECTED_UNORDERED_SCHEMA
        if cap_selected_row_counting and not include_ordered
        else CAP_SELECTED_SCHEMA if cap_selected_row_counting else SCHEMA
    )
    allowed_default_legacy = (
        not cap_selected_row_counting and resume_schema in LEGACY_SCHEMAS
    )
    allowed_cap_legacy = (
        cap_selected_row_counting
        and resume_schema in CAP_SELECTED_LEGACY_SCHEMAS
    )
    allowed_legacy = allowed_default_legacy or allowed_cap_legacy
    if resume_schema != current_schema and not allowed_legacy:
        raise ValueError("--resume artifact has the wrong schema")

    expected_input = os.path.relpath(input_path, HERE.parents[1])
    if resume.get("input") != expected_input:
        raise ValueError("--resume artifact names a different input")
    digest = resume.get("input_sha256")
    current_digest = hashlib.sha256(input_path.read_bytes()).hexdigest()
    if resume_schema == current_schema and digest != current_digest:
        raise ValueError("--resume input content has changed")
    if digest is not None and digest != current_digest:
        raise ValueError("--resume legacy input content has changed")

    source = json.loads(input_path.read_text())
    packets = source["packets"][:limit]
    scope = resume.get("scope", {})
    if bool(scope.get("cap_selected_row_counting", False)) != (
        cap_selected_row_counting
    ):
        raise ValueError("--resume artifact has different cap-row constraints")
    if bool(scope.get("include_ordered_metric_cores", True)) != include_ordered:
        raise ValueError("--resume artifact has a different metric-core set")
    if scope.get("limit") != limit:
        raise ValueError("--resume artifact has a different packet limit")
    if scope.get("expected_packets") != len(packets):
        raise ValueError("--resume artifact has a different packet scope")

    raw_results = tuple(resume.get("results", ()))
    seen: set[int] = set()
    for result in raw_results:
        index = result.get("packet_index")
        if not isinstance(index, int) or not 0 <= index < len(packets):
            raise ValueError("--resume artifact contains an invalid packet index")
        if index in seen:
            raise ValueError("--resume artifact contains a duplicate packet")
        seen.add(index)
        packet = packets[index]
        labels = packet_labels(
            packet["n"],
            pin_source_index=packet["pin_source_index"],
            deleted_index=packet["deleted_index"],
        )
        expected_context = {
            "n": packet["n"],
            "profile": packet["profile"],
            "pin_source": labels.pin_source,
            "deleted": labels.deleted,
            "blocker": packet["blocker"],
            "dangerous": packet["dangerous"],
            "type": packet["type"],
        }
        if any(result.get(key) != value for key, value in expected_context.items()):
            raise ValueError(
                f"--resume packet {index} does not match the current input"
            )

    reusable_statuses = {"UNSAT"} if allowed_legacy else {
        "SAT",
        "UNSAT",
    }
    reusable = []
    for result in raw_results:
        if result.get("core_free", {}).get("status") not in reusable_statuses:
            continue
        copied = dict(result)
        if allowed_legacy:
            copied["legacy_resume"] = {
                "schema": resume_schema,
                "basis": "monotone-unsat",
            }
        reusable.append(copied)
    description = (
        (
            CAP_SELECTED_LEGACY_SCHEMAS[resume_schema]
            if allowed_cap_legacy
            else LEGACY_SCHEMAS[resume_schema]
        )
        if allowed_legacy
        else (
            "cap-selected-current-schema"
            if cap_selected_row_counting
            else "current-schema"
        )
    )
    return tuple(reusable), description


def run(
    input_path: Path,
    *,
    workers: int,
    max_nodes: int,
    limit: int | None,
    checkpoint_path: Path | None = None,
    resume_results: Sequence[dict] = (),
    cap_selected_row_counting: bool = False,
    include_ordered: bool = True,
) -> dict:
    source = json.loads(input_path.read_text())
    packets = source["packets"][:limit]
    completed_indices = {result["packet_index"] for result in resume_results}
    if any(not 0 <= index < len(packets) for index in completed_indices):
        raise ValueError("resume artifact contains a packet outside the current scope")
    jobs = [
        (index, packet, max_nodes, cap_selected_row_counting, include_ordered)
        for index, packet in enumerate(packets)
        if index not in completed_indices
    ]
    results = list(resume_results)
    with ProcessPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(_packet_job, job): job[0] for job in jobs}
        for completed, future in enumerate(
            as_completed(futures), start=len(results) + 1
        ):
            result = future.result()
            results.append(result)
            print(
                f"[{completed}/{len(packets)}] packet {result['packet_index']}: "
                f"incidence={result['incidence']['status']} "
                f"core-free={result['core_free']['status']} "
                f"nodes={result['core_free']['nodes']}",
                flush=True,
            )
            if checkpoint_path is not None:
                checkpoint = _artifact(
                    input_path,
                    workers=workers,
                    max_nodes=max_nodes,
                    limit=limit,
                    expected_packets=len(packets),
                    results=results,
                    complete=False,
                    cap_selected_row_counting=cap_selected_row_counting,
                    include_ordered=include_ordered,
                )
                checkpoint_path.parent.mkdir(parents=True, exist_ok=True)
                checkpoint_path.write_text(
                    json.dumps(checkpoint, indent=2, sort_keys=True) + "\n"
                )
    return _artifact(
        input_path,
        workers=workers,
        max_nodes=max_nodes,
        limit=limit,
        expected_packets=len(packets),
        results=results,
        complete=True,
        cap_selected_row_counting=cap_selected_row_counting,
        include_ordered=include_ordered,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--workers", type=int, default=min(8, os.cpu_count() or 1))
    parser.add_argument("--max-nodes", type=int, default=300_000)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument(
        "--cap-selected-row-counting",
        action="store_true",
        help=(
            "enforce the proved surplus-cap hit bounds, including exact "
            "endpoint/interior counts in the (6,4,4) equality case"
        ),
    )
    parser.add_argument(
        "--exclude-ordered-cores",
        action="store_true",
        help="omit the cyclic five-point and convex-rhombus core detectors",
    )
    args = parser.parse_args()
    if args.workers < 1:
        parser.error("--workers must be positive")
    resume_results = ()
    if args.resume and args.out.exists():
        resume = json.loads(args.out.read_text())
        try:
            resume_results, description = _validated_resume_results(
                resume,
                args.input.resolve(),
                limit=args.limit,
                cap_selected_row_counting=args.cap_selected_row_counting,
                include_ordered=not args.exclude_ordered_cores,
            )
        except ValueError as error:
            parser.error(str(error))
        print(
            f"reusing {len(resume_results)}/{len(resume.get('results', ()))} "
            f"terminal {description} results; retrying all nonterminal rows",
            flush=True,
        )
    output = run(
        args.input.resolve(),
        workers=args.workers,
        max_nodes=args.max_nodes,
        limit=args.limit,
        checkpoint_path=args.out.resolve(),
        resume_results=resume_results,
        cap_selected_row_counting=args.cap_selected_row_counting,
        include_ordered=not args.exclude_ordered_cores,
    )
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output["summary"], indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
