#!/usr/bin/env python3
"""Continue the exact three-row model from a near-right to an acute triangle."""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
import sys

import numpy as np
from scipy.optimize import differential_evolution, minimize


PREDECESSOR = Path(__file__).resolve().parents[1] / "cycle-three-rows-euclidean"
sys.path.insert(0, str(PREDECESSOR))
import search_cycle_three_rows as base  # noqa: E402


def exact_seed() -> np.ndarray:
    return np.array([
        2 * math.atan(15091 / 15143),
        2 * math.atan(943 / 92200),
        2 * math.atan(9643 / 22662),
        2 * math.atan(194 / 199),
        12637 / 25058, 45957 / 91523, 66359 / 95986,
        2 * math.atan(-12151 / 50741), 2 * math.atan(-11188 / 69765),
        2 * math.atan(-364045 / 54493), 2 * math.atan(-58655 / 15086),
        2 * math.atan(42572 / 38447), 2 * math.atan(88847 / 40943),
    ])


def candidate(apex: float, tail: np.ndarray) -> base.Candidate:
    return base.evaluate(np.concatenate(([apex], tail)))


def score(apex: float, tail: np.ndarray) -> float:
    return candidate(apex, tail).minimum_margin


def bounds(apex: float, previous: np.ndarray) -> list[tuple[float, float]]:
    result = [
        (0.002, min(apex - 0.02, max(0.10, previous[0] + 0.20))),
        (0.01, apex - 0.01),
        (0.02, apex - 0.002),
        (0.15, 1.20), (0.15, 1.20), (0.15, 1.20),
    ]
    result.extend((-math.pi, math.pi) for _ in range(6))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", type=float, default=1.05)
    parser.add_argument("--step", type=float, default=0.04)
    parser.add_argument("--de-steps", type=int, default=120)
    parser.add_argument("--popsize", type=int, default=12)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument(
        "--checkpoint",
        type=Path,
        default=Path(__file__).with_name("homotopy-progress.json"),
        help="Rewrite this JSON checkpoint after every continuation step.",
    )
    parser.add_argument(
        "--resume",
        type=Path,
        help="Resume from the final record of an earlier checkpoint.",
    )
    args = parser.parse_args()
    seed = exact_seed()
    if args.resume is not None:
        prior = json.loads(args.resume.read_text())
        prior_records = prior.get("records", [])
        if not prior_records:
            raise ValueError(f"resume checkpoint has no records: {args.resume}")
        seed = np.array(prior_records[-1]["parameters"], dtype=float)
    apex = float(seed[0])
    tail = seed[1:].copy()
    records = []
    while apex - args.target > 1e-9:
        next_apex = max(args.target, apex - args.step)
        start = tail.copy()
        limits = bounds(next_apex, start)
        start = np.array([
            min(max(value, lower + 1e-8), upper - 1e-8)
            for value, (lower, upper) in zip(start, limits, strict=True)
        ])
        local = minimize(lambda x: -score(next_apex, x), start, method="Powell",
                         bounds=limits,
                         options={"maxiter": 12000, "xtol": 1e-11, "ftol": 1e-13})
        best = local.x if score(next_apex, local.x) > score(next_apex, start) else start
        if score(next_apex, best) <= 0:
            de = differential_evolution(lambda x: -score(next_apex, x), limits,
                x0=best, seed=args.seed + len(records), maxiter=args.de_steps,
                popsize=args.popsize, workers=1, polish=False, tol=1e-9)
            if score(next_apex, de.x) > score(next_apex, best):
                best = de.x
        found = candidate(next_apex, best)
        records.append({
            "apex": next_apex,
            "minimum_margin": found.minimum_margin,
            "cyclic_order": list(found.order),
            "parameters": np.concatenate(([next_apex], best)).tolist(),
            "minimum_by_group": {name: min(values) for name, values in found.groups.items()},
        })
        args.checkpoint.write_text(json.dumps({
            "schema": "three-complete-row-acute-continuation-v1",
            "epistemic_status": "BOUNDED_NUMERIC_CONTINUATION_NOT_COVERAGE",
            "status": "RUNNING" if found.minimum_margin > 0 else "STOPPED_BEFORE_TARGET",
            "target_apex": args.target,
            "step": args.step,
            "records": records,
        }, indent=2) + "\n")
        print(json.dumps(records[-1]), flush=True)
        if found.minimum_margin <= 0:
            break
        apex, tail = next_apex, best
    final = records[-1] if records else {
        "apex": apex, "minimum_margin": score(apex, tail),
        "parameters": np.concatenate(([apex], tail)).tolist(),
    }
    payload = {
        "schema": "three-complete-row-acute-continuation-v1",
        "epistemic_status": "BOUNDED_NUMERIC_CONTINUATION_NOT_COVERAGE",
        "status": "NUMERIC_ACUTE_CONTINUATION_HIT" if final["minimum_margin"] > 0 and final["apex"] <= args.target else "STOPPED_BEFORE_TARGET",
        "target_apex": args.target,
        "step": args.step,
        "records": records,
    }
    args.checkpoint.write_text(json.dumps(payload, indent=2) + "\n")
    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
