# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Trace saved metric obstructions back to their named incidence rows.

The structural metric report deliberately deduplicates rows by
``(center, support)``.  That is the right surface for geometry, but it hides
whether a contradiction used a pinned row, a dangerous row, a global K4 row,
or exactness contributed by a source-indexed critical shell.  This utility
reopens one saved source assignment, restores those aliases, and greedily
minimizes the rows while preserving the report's decisive obstruction family.

The result is a proof-planning artifact.  Greedy minimality is deterministic,
but it is not a minimum-cardinality certificate and it is not a coverage
theorem for arbitrary audit frames.
"""
from __future__ import annotations

import argparse
import json
import os
from collections import Counter
from pathlib import Path
from typing import Any, Mapping, Sequence

from .metric_realizability_probe import (
    ROOT,
    MetricRow,
    _convex_rhombus_equilateral_core,
    _duplicate_center_core,
    _equal_k4_core,
    _exact_off_circle_core,
    _five_point_bisector_circle_core,
    _perpendicular_bisector_core,
)


DEFAULT_INPUT = (
    ROOT
    / "census"
    / "global_confinement"
    / "metric_realizability_structural_complete.json"
)
DEFAULT_OUT = (
    ROOT
    / "census"
    / "global_confinement"
    / "metric_core_dependencies.json"
)
SCHEMA = "p97-global-confinement-metric-core-dependencies-v1"


def _json_pointer_get(root: Any, pointer: str) -> Any:
    value = root
    if pointer == "":
        return value
    if not pointer.startswith("/"):
        raise ValueError(f"invalid JSON pointer: {pointer!r}")
    for raw_part in pointer[1:].split("/"):
        part = raw_part.replace("~1", "/").replace("~0", "~")
        value = value[int(part)] if isinstance(value, list) else value[part]
    return value


def _row_groups(assignment: Mapping[str, Any], n: int) -> list[dict[str, Any]]:
    grouped: dict[tuple[int, tuple[int, ...]], dict[str, Any]] = {}
    for name, raw in assignment.items():
        center = int(raw["center"])
        support = tuple(sorted(int(point) for point in raw["support"]))
        if len(support) != 4 or len(set(support)) != 4:
            raise ValueError(f"row {name!r} does not have four distinct points")
        if not 0 <= center < n or any(not 0 <= point < n for point in support):
            raise ValueError(f"row {name!r} has a label outside 0..{n - 1}")
        key = (center, support)
        group = grouped.setdefault(
            key,
            {
                "center": center,
                "support": list(support),
                "names": [],
                "exact_names": [],
            },
        )
        group["names"].append(name)
        if bool(raw.get("exact", False)):
            group["exact_names"].append(name)
    groups = sorted(
        grouped.values(), key=lambda group: (group["center"], group["support"])
    )
    for group in groups:
        group["names"].sort()
        group["exact_names"].sort()
    return groups


def _metric_rows(groups: Sequence[Mapping[str, Any]]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(
            int(group["center"]),
            tuple(int(point) for point in group["support"]),
            bool(group["exact_names"]),
        )
        for group in groups
    )


def _core_for_stage(
    stage: str,
    groups: Sequence[Mapping[str, Any]],
    n: int,
    order: Sequence[int],
) -> Mapping[str, Any] | None:
    rows = _metric_rows(groups)
    if stage == "equality-duplicate-center":
        return _duplicate_center_core(rows, n)
    if stage == "equality-exact-off-circle":
        return _exact_off_circle_core(rows, n)
    if stage == "equality-equal-k4":
        return _equal_k4_core(rows, n)
    if stage == "equality-perpendicular-bisector-convex":
        return _perpendicular_bisector_core(rows, n)
    if stage == "equality-convex-five-point":
        return _five_point_bisector_circle_core(rows, n, order)
    if stage == "equality-convex-rhombus-equilateral":
        return _convex_rhombus_equilateral_core(rows, n, order)
    raise ValueError(f"unsupported structural stage: {stage}")


def _minimize_groups(
    stage: str,
    groups: Sequence[Mapping[str, Any]],
    n: int,
    order: Sequence[int],
) -> tuple[list[Mapping[str, Any]], Mapping[str, Any]]:
    kept = list(groups)
    changed = True
    while changed:
        changed = False
        for index in range(len(kept) - 1, -1, -1):
            candidate = kept[:index] + kept[index + 1 :]
            if _core_for_stage(stage, candidate, n, order) is not None:
                kept = candidate
                changed = True
    core = _core_for_stage(stage, kept, n, order)
    if core is None:
        raise AssertionError(f"minimization lost the {stage} core")
    return kept, core


def _prefix(name: str) -> str:
    return name.split(":", 1)[0]


def _source_label(name: str, prefix: str) -> int | None:
    marker = f"{prefix}:"
    if not name.startswith(marker):
        return None
    try:
        return int(name[len(marker) :])
    except ValueError:
        return None


def _choose_source(
    result: Mapping[str, Any], family: str
) -> Mapping[str, Any] | None:
    sources = [source for source in result["sources"] if source["family"] == family]
    return min(sources, key=lambda source: (source["file"], source["json_pointer"])) if sources else None


def analyze(input_path: Path, family: str) -> dict[str, Any]:
    report = json.loads(input_path.read_text())
    source_cache: dict[Path, Any] = {}
    results = []

    for result in report["results"]:
        source = _choose_source(result, family)
        if source is None:
            continue
        source_path = (ROOT / source["file"]).resolve()
        if source_path not in source_cache:
            source_cache[source_path] = json.loads(source_path.read_text())
        source_root = source_cache[source_path]
        assignment = _json_pointer_get(source_root, source["json_pointer"])
        n = int(result["n"])
        order = tuple(int(point) for point in result["order"])
        groups = _row_groups(assignment, n)
        normalized = [
            {
                "center": group["center"],
                "support": group["support"],
                "exact": bool(group["exact_names"]),
            }
            for group in groups
        ]
        if normalized != result["rows"]:
            raise ValueError(f"source rows drifted for {result['system_id']}")

        stage = str(result["decisive_stage"])
        kept, core = _minimize_groups(stage, groups, n, order)
        pinned_support = set()
        for group in groups:
            if "pinned" in group["names"]:
                pinned_support.update(group["support"])
        context = source.get("context", {})
        base_labels = {0, 1, 2} | pinned_support
        for field in ("pin_source", "deleted", "blocker"):
            if field in context:
                base_labels.add(int(context[field]))
        for field in ("dangerous", "aux", "audit_centers"):
            if field in context:
                base_labels.update(int(label) for label in context[field])

        names = sorted({name for group in kept for name in group["names"]})
        shell_sources = sorted(
            {
                label
                for name in names
                if (label := _source_label(name, "shell")) is not None
            }
        )
        global_centers = sorted(
            {
                label
                for name in names
                if (label := _source_label(name, "global")) is not None
            }
        )
        ambient_shell_sources = [label for label in shell_sources if label not in base_labels]
        ambient_global_centers = [label for label in global_centers if label not in base_labels]
        results.append(
            {
                "system_id": result["system_id"],
                "n": n,
                "profile": result["profile"],
                "decisive_stage": stage,
                "source": source,
                "original_row_count": len(groups),
                "greedy_row_count": len(kept),
                "core": core,
                "rows": kept,
                "name_prefixes": dict(
                    sorted(Counter(_prefix(name) for name in names).items())
                ),
                "base_labels": sorted(base_labels),
                "shell_sources": shell_sources,
                "ambient_shell_sources": ambient_shell_sources,
                "global_centers": global_centers,
                "ambient_global_centers": ambient_global_centers,
            }
        )

    stage_counts = Counter(result["decisive_stage"] for result in results)
    row_histogram = Counter(result["greedy_row_count"] for result in results)
    summary = {
        "systems": len(results),
        "decisive_stage_counts": dict(sorted(stage_counts.items())),
        "greedy_row_count_histogram": {
            str(size): count for size, count in sorted(row_histogram.items())
        },
        "systems_using_shell_rows": sum(bool(result["shell_sources"]) for result in results),
        "systems_using_ambient_shell_sources": sum(
            bool(result["ambient_shell_sources"]) for result in results
        ),
        "systems_using_ambient_global_centers": sum(
            bool(result["ambient_global_centers"]) for result in results
        ),
    }
    return {
        "schema": SCHEMA,
        "input": os.path.relpath(input_path, ROOT),
        "family": family,
        "summary": summary,
        "results": results,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--family", default="critical-shell-global")
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()
    output = analyze(args.input.resolve(), args.family)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
