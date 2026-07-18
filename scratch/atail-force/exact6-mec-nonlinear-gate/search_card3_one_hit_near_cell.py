#!/usr/bin/env python3
"""Search the legal cap cell nearest the free-cap card-three candidate.

The free-cap run approached strict convexity with blockers in
``(lower,upper,lower)`` but put three support targets in the source and target
blockers' own caps.  Cap curvature forbids that.  This wrapper searches the
nearest legal cell: source targets ``2L+1U``, target targets ``1L+2U``, and
unused targets ``3U``.  Both adjacent closed caps then have cardinality at
least six.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from scipy.optimize import differential_evolution, minimize

import search_single_physical_hit as base


CAP_CELL = {
    "blocker_source": "lower",
    "blocker_target": "upper",
    "blocker_unused": "lower",
    "source_x0": "lower",
    "source_x1": "lower",
    "source_x2": "upper",
    "target_x0": "lower",
    "target_x1": "upper",
    "target_x2": "upper",
    "unused_x0": "upper",
    "unused_x1": "upper",
    "unused_x2": "upper",
}


def install_cap_cell() -> None:
    base.CAP.clear()
    base.CAP.update(CAP_CELL)


def objective(parameters):
    install_cap_cell()
    return base.objective(parameters)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1600)
    parser.add_argument("--popsize", type=int, default=28)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = differential_evolution(
        objective,
        base.bounds(),
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        updating="deferred" if args.workers != 1 else "immediate",
        polish=False,
        tol=1e-10,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=base.bounds(),
        options={"maxiter": 30_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    install_cap_cell()
    payload = base.render(base.evaluate(best))
    payload["schema"] = "p97-exact6-card3-one-hit-near-legal-cap-cell-search-v1"
    payload["cap_cell"] = CAP_CELL
    payload["represented_closed_cap_cards"] = {
        "physical": 6,
        "lower": 2 + sum(cap == "lower" for cap in CAP_CELL.values()),
        "upper": 2 + sum(cap == "upper" for cap in CAP_CELL.values()),
    }
    payload["represented_blocker_cap"] = {
        row: CAP_CELL[f"blocker_{row}"] + " strict interior"
        for row in ("source", "target", "unused")
    }
    payload["represented_same_blocker_cap_support_hits"] = {
        "source": 2,
        "target": 2,
        "unused": 0,
    }
    payload["represented_same_blocker_cap_bound"] = 2
    payload["endpoint_sharpening"] = (
        "not applicable: all represented blockers are strict cap-interior points"
    )
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()
