#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Direct finite probe for the endpoint-escape card-eleven `(6,4,4)` branch.

Endpoint analogue of ``direct_cap_selected_metric_core_probe``: instead of
the fixed exact pinned row `{0, 7, 8, pinSource}` at center 1, the seed is
the ``EndpointLeftShellOK`` family derived from
`Problem97.SurplusCapPacket.EndpointEscapeLeftAt` at forced card eleven
(docs/audits/2026-07-11-endpoint-generalm-representability.md):

* the fixed exact escaped row `{7, 8, escapee, fourth}` at center 1, with
  `escapee ∈ intO2`, `fourth ∈ {2} ∪ intS`, and the Moser apex `0` forced
  OUT of the row (this is exactly where the pinned seed fails to cover the
  endpoint configuration);
* a surplus-apex row (center 0) containing the deleted source
  `deleted ∈ intS`, `fourth ≠ deleted`; and
* one selected four-row at every other center.

The blocker-map side conditions of ``EndpointLeftShellOK`` — every escaped
row member blocks at center 1, `blocker deleted ≠ 1` — are implemented by
the safe-blocker derivation with the escaped support in the pinned-class
slot.  The ``right`` family is the O1↔O2 mirror: escaped row
`{9, 10, escapee, fourth}` at center 2 with `escapee ∈ intO1`,
`fourth ∈ {1} ∪ intS`.

Everything else — the exact cap-selected hit counts, the twelve formalized
metric cores, the equality-closure safe-center analysis — is unchanged from
the pinned direct probe.  32 ordered placements per family.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
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
DEFAULT_OUT = HERE / "endpoint_direct_metric_core_results_n11.json"
DEFAULT_RESIDUAL_OUT = HERE / "endpoint_direct_metric_core_residuals_n11.json"
SCHEMA = "p97-endpoint-direct-cap-selected-metric-core-v1"
RESIDUAL_SCHEMA = "p97-endpoint-direct-cap-selected-metric-core-residual-bank-v1"
FAMILIES = ("left", "right")
DEPENDENCIES = (
    HERE / "metric_realizability_probe.py",
    HERE / "probe.py",
    HERE / "shadow.py",
    HERE / "surplus_source_metric_core_probe.py",
    HERE / "critical_shell_probe.py",
    HERE.parent / "multi_center" / "multi_center_census.py",
)


@dataclass(frozen=True)
class EndpointLabels:
    """One ordered placement of the endpoint-escape seed family."""

    n: int
    profile: tuple[int, int, int]
    family: str
    seed_center: int
    escapee: int
    fourth: int
    deleted: int
    escaped_support: frozenset[int]


def endpoint_labels(
    n: int,
    *,
    family: str,
    escapee: int,
    fourth: int,
    deleted: int,
) -> EndpointLabels:
    """Validated endpoint seed labels for one ordered placement."""

    if n < 11:
        raise ValueError("the endpoint general-m regime starts at n = 11")
    profile = (n - 5, 4, 4)
    frame = mc.build_frame(profile)
    int_s = set(frame.ints["S"])
    if family == "left":
        seed_center = 1
        own_interiors = frame.ints["O1"]
        escapee_pool = set(frame.ints["O2"])
        fourth_pool = {2} | int_s
    elif family == "right":
        seed_center = 2
        own_interiors = frame.ints["O2"]
        escapee_pool = set(frame.ints["O1"])
        fourth_pool = {1} | int_s
    else:
        raise ValueError(f"unknown family: {family!r}")
    if escapee not in escapee_pool:
        raise ValueError("escapee is outside the opposite-cap interior")
    if fourth not in fourth_pool:
        raise ValueError("fourth is outside its allowed pool")
    if deleted not in int_s:
        raise ValueError("deleted is outside the surplus interior")
    if fourth == deleted:
        raise ValueError("fourth and deleted must differ")
    return EndpointLabels(
        n,
        profile,
        family,
        seed_center,
        escapee,
        fourth,
        deleted,
        frozenset((*own_interiors, escapee, fourth)),
    )


def ordered_endpoint_placements(
    n: int, family: str
) -> tuple[EndpointLabels, ...]:
    """Every ordered (escapee, fourth, deleted) seed placement of a family."""

    frame = mc.build_frame((n - 5, 4, 4))
    int_s = frame.ints["S"]
    if family == "left":
        escapees = frame.ints["O2"]
        fourths = (2, *int_s)
    elif family == "right":
        escapees = frame.ints["O1"]
        fourths = (1, *int_s)
    else:
        raise ValueError(f"unknown family: {family!r}")
    return tuple(
        endpoint_labels(
            n, family=family, escapee=escapee, fourth=fourth, deleted=deleted
        )
        for escapee in escapees
        for fourth in fourths
        for deleted in int_s
        if fourth != deleted
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
    seed_center: int,
    seed_class: frozenset[int],
    deleted: int,
) -> tuple[int, ...] | None:
    """Derive a blocker map whose used rows can consistently be exact.

    Identical to the pinned probe's derivation with the escaped support in
    the pinned-class slot: every escaped-row member blocks at the seed
    center, and the deleted source must block elsewhere.
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

    if seed_center not in safe:
        return None
    blocker = []
    for source in range(n):
        if source in seed_class:
            blocker.append(seed_center)
            continue
        choices = [
            center
            for center in sorted(safe)
            if source in by_center[center].support
            and (source != deleted or center != seed_center)
        ]
        if not choices:
            return None
        blocker.append(choices[0])
    return tuple(blocker)


def _cap_filtered_rows(
    frame, candidates, deleted, seed_center
) -> tuple[VariableRow, ...]:
    """Choose one row per non-seed center after unary cap filtering."""

    rows = []
    for spec in full_center_extension_rows(frame, candidates, {seed_center}):
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


def _placement_job(
    args: tuple[EndpointLabels, int, bool, bool]
) -> dict:
    labels, max_nodes, enumerate_residuals, apply_cores = args
    started = time.perf_counter()
    frame, candidates = mc.cached_candidate_lists(labels.profile, set())
    assert candidates is not None

    escaped = ClassRow(
        "escaped", labels.seed_center, labels.escaped_support, exact=True
    )
    variable_rows = _cap_filtered_rows(
        frame, candidates, labels.deleted, labels.seed_center
    )
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
        if not apply_cores:
            return True
        return _formalized_metric_core(
            rows, frame.n, order, include_extended=False
        ) is None

    @lru_cache(maxsize=None)
    def complete_ok(rows: tuple[MetricRow, ...]) -> bool:
        nonlocal complete_misses
        complete_misses += 1
        if not _cap_selected_rows_ok(rows, frame):
            return False
        if apply_cores and _formalized_metric_core(rows, frame.n, order) is not None:
            return False
        blocker = _safe_blocker_assignment(
            rows,
            frame.n,
            labels.seed_center,
            labels.escaped_support,
            labels.deleted,
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
        fixed_rows=(escaped,),
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
            metric_rows,
            frame.n,
            labels.seed_center,
            labels.escaped_support,
            labels.deleted,
        )
        if blocker is None:
            raise AssertionError("SAT assignment has no safe blocker map")
    status = result["status"]
    if enumerate_residuals and status == "UNSAT":
        status = "EXHAUSTIVE"
    return {
        "family": labels.family,
        "seed_center": labels.seed_center,
        "escapee": labels.escapee,
        "fourth": labels.fourth,
        "deleted": labels.deleted,
        "escaped_row": sorted(labels.escaped_support),
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
                    "family": result["family"],
                    "escapee": result["escapee"],
                    "fourth": result["fourth"],
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


def run(
    *,
    families: Sequence[str],
    workers: int,
    max_nodes: int,
    enumerate_residuals: bool = False,
    apply_cores: bool = True,
) -> dict:
    placements = [
        labels
        for family in families
        for labels in ordered_endpoint_placements(11, family)
    ]
    jobs = [
        (labels, max_nodes, enumerate_residuals, apply_cores)
        for labels in placements
    ]
    results = []
    with ProcessPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(_placement_job, job): job for job in jobs}
        for index, future in enumerate(as_completed(futures), start=1):
            result = future.result()
            results.append(result)
            print(
                f"[{index}/{len(jobs)}] {result['family']} "
                f"escapee={result['escapee']} fourth={result['fourth']} "
                f"deleted={result['deleted']}: {result['status']} "
                f"nodes={result['nodes']}",
                flush=True,
            )
    results.sort(
        key=lambda row: (
            row["family"],
            row["escapee"],
            row["fourth"],
            row["deleted"],
        )
    )
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
            "families": list(families),
            "placements": len(jobs),
            "workers": workers,
            "max_nodes": max_nodes,
            "seed": "endpoint-escaped-row",
            "local_row_kills": [],
            "metric_core_count": 12 if apply_cores else 0,
            "apply_cores": apply_cores,
            "cap_selected_exact_counts": True,
            "one_selected_row_per_center": True,
            "blocker_map": "derived-from-exact-compatible-centers",
            "mode": "enumerate-residuals"
            if enumerate_residuals
            else "first-residual",
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
    parser.add_argument(
        "--family", choices=(*FAMILIES, "both"), default="both"
    )
    parser.add_argument(
        "--workers", type=int, default=min(8, os.cpu_count() or 1)
    )
    parser.add_argument("--max-nodes", type=int, default=10_000_000)
    parser.add_argument(
        "--enumerate-residuals",
        action="store_true",
        help="record every core-free complete pattern and continue to exhaustion",
    )
    parser.add_argument(
        "--no-cores",
        action="store_true",
        help="encoding smoke test: disable the metric-core rejection; "
        "placements are expected to come back SAT",
    )
    args = parser.parse_args()
    if args.workers < 1:
        parser.error("--workers must be positive")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")
    families = FAMILIES if args.family == "both" else (args.family,)
    artifact = run(
        families=families,
        workers=args.workers,
        max_nodes=args.max_nodes,
        enumerate_residuals=args.enumerate_residuals,
        apply_cores=not args.no_cores,
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
