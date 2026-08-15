#!/usr/bin/env python3
"""Exact Euclidean screening of one enriched FreshThird incidence shadow.

The Boolean ingress model is source-faithful but non-geometric.  This script
first obtains one cyclically ordered model from that packet, then asks the
audited QF_NRA backend whether its seventeen selected four-classes can be
realized by a strictly convex Euclidean point set in the same order.  A
selected row is marked exact only when its center is an actual blocker of at
least one source; ``critical_support_exact`` is what entitles that exclusion.
A second stage also preserves every full rich (cardinality at least four)
radius class at the surplus and second opposite apices.

This is theorem mining only: one UNSAT shadow is not universal Lean closure.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from collections import deque
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE.parents[2]))

import n17_freshthird_incidence_probe as base  # noqa: E402
import n19_freshthird_global_ingress_probe as ingress  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    probe_metric_rows,
)


DEFAULT_OUT = HERE / "artifacts-apex-rich-metric-geometry-n17"


def is_true(model: z3.ModelRef, term: z3.ExprRef) -> bool:
    return z3.is_true(model.eval(term, model_completion=True))


def radius_classes(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
    center: int,
) -> list[tuple[int, ...]]:
    """Read the exact Boolean radius partition at one center."""
    remaining = set(point for point in base.ALL if point != center)
    classes: list[tuple[int, ...]] = []
    while remaining:
        anchor = min(remaining)
        support = tuple(
            point
            for point in sorted(remaining)
            if is_true(model, probe.E(center, anchor, point))
        )
        classes.append(support)
        remaining.difference_update(support)
    return classes


def solve_ingress(
    arm: str,
    radius_mode: str,
    timeout_ms: int,
) -> tuple[ingress.FreshThirdN19Global, z3.ModelRef, tuple[int, ...]]:
    ingress.configure_n17()
    probe = ingress.FreshThirdN19Global(timeout_ms, cyclic_metric=True)
    probe.add("selected_residual_arm", probe.residual[arm])
    probe.add(
        "selected_radius_mode",
        probe.aligned_radii()
        if radius_mode == "aligned"
        else probe.common_new_radius(),
    )
    if radius_mode == "aligned":
        probe.add(
            "retained_first_apex_deletion_core",
            probe.retained_first_apex_deletion_core(),
        )
    probe.add("negated_named_ingress", probe.no_named_ingress())
    status = probe.solver.check()
    if status != z3.sat:
        reason = probe.solver.reason_unknown() if status == z3.unknown else ""
        raise RuntimeError(f"ingress shadow is {status}: {reason}")
    model = probe.solver.model()
    order = tuple(
        sorted(
            base.ALL,
            key=lambda point: model.eval(
                probe.position[point], model_completion=True
            ).as_long(),
        )
    )
    return probe, model, order


def selected_rows(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> list[MetricRow]:
    rows = []
    for center in base.ALL:
        support = tuple(
            point for point in base.ALL if is_true(model, probe.m[center, point])
        )
        if len(support) != 4 or center in support:
            raise AssertionError((center, support))
        exact = any(is_true(model, probe.b[source, center]) for source in base.ALL)
        rows.append(MetricRow(center, support, exact))
    return rows


def blocker_preimages(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, list[str]]:
    """Record the source witnesses that make selected rows exact."""
    return {
        base.NAMES[center]: [
            base.NAMES[source]
            for source in base.ALL
            if is_true(model, probe.b[source, center])
        ]
        for center in base.ALL
    }


def rich_rows(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> list[MetricRow]:
    rows = []
    for center_name in ("a2", "a3"):
        center = base.IDX[center_name]
        for support in radius_classes(probe, model, center):
            if len(support) >= 4:
                rows.append(MetricRow(center, support, True))
    return rows


def row_json(row: MetricRow) -> dict[str, object]:
    return {
        "center": base.NAMES[row.center],
        "support": [base.NAMES[point] for point in row.support],
        "exact": row.exact,
    }


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def exact_off_circle_chain(
    rows: list[MetricRow], core: dict[str, object]
) -> list[dict[str, object]]:
    """Return a shortest row-equality chain witnessing an exactness clash."""
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], MetricRow]]] = {}
    for row in rows:
        reference = edge(row.center, row.support[0])
        for point in row.support[1:]:
            other = edge(row.center, point)
            graph.setdefault(reference, []).append((other, row))
            graph.setdefault(other, []).append((reference, row))
    center = int(core["center"])
    support = tuple(int(point) for point in core["support"])
    start = edge(center, support[0])
    target = edge(center, int(core["off_support"]))
    queue = deque([start])
    previous: dict[
        tuple[int, int], tuple[tuple[int, int], MetricRow] | None
    ] = {start: None}
    while queue and target not in previous:
        current = queue.popleft()
        for neighbor, row in graph.get(current, []):
            if neighbor not in previous:
                previous[neighbor] = (current, row)
                queue.append(neighbor)
    if target not in previous:
        raise AssertionError((start, target))
    path = []
    current = target
    while previous[current] is not None:
        prior, row = previous[current]
        path.append({
            "from_edge": [base.NAMES[point] for point in prior],
            "to_edge": [base.NAMES[point] for point in current],
            "row": row_json(row),
        })
        current = prior
    path.reverse()
    return path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--arm", choices=base.FreshThirdN17.RESIDUALS, default="firstNonHit"
    )
    parser.add_argument(
        "--radius-mode", choices=("aligned", "common"), default="aligned"
    )
    parser.add_argument("--ingress-timeout-ms", type=int, default=120_000)
    parser.add_argument("--metric-timeout-s", type=float, default=120.0)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()

    started = time.monotonic()
    probe, model, order = solve_ingress(
        args.arm, args.radius_mode, args.ingress_timeout_ms
    )
    selected = selected_rows(probe, model)
    rich = rich_rows(probe, model)
    stages = []
    for name, rows in (
        ("selected-four-classes", selected),
        ("selected-plus-rich-apex-classes", selected + rich),
    ):
        result = probe_metric_rows(
            base.N,
            rows,
            order=order,
            timeout_s=args.metric_timeout_s,
        )
        core = result.get("exact_off_circle_core")
        if isinstance(core, dict):
            result["exact_off_circle_equality_chain"] = exact_off_circle_chain(
                rows, core
            )
        stages.append({"name": name, "rows": [row_json(row) for row in rows],
                       "result": result})
        if result["status"] != "SAT":
            break

    payload = {
        "schema": "p97-freshthird-apex-rich-metric-geometry-v2",
        "arm": args.arm,
        "radius_mode": args.radius_mode,
        "n": base.N,
        "cyclic_order": [base.NAMES[point] for point in order],
        "selected_row_blocker_preimages": blocker_preimages(probe, model),
        "rich_radius_classes": [row_json(row) for row in rich],
        "stages": stages,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "trust_boundary": (
            "external Z3 QF_NRA theorem-mining diagnostic; selected-row "
            "off-circle exclusions are enabled only at actual blocker centers; "
            "no Lean or universal claim"
        ),
    }
    args.out.mkdir(parents=True, exist_ok=True)
    artifact = args.out / f"{time.strftime('%Y%m%dT%H%M%SZ')}.json"
    artifact.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "artifact": str(artifact),
        "cyclic_order": payload["cyclic_order"],
        "exact_selected_centers": [
            base.NAMES[row.center] for row in selected if row.exact
        ],
        "rich_class_sizes": [len(row.support) for row in rich],
        "stage_statuses": [stage["result"]["status"] for stage in stages],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
