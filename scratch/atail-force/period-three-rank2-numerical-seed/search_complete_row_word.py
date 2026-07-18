#!/usr/bin/env python3
"""24-core extension search from the exact complete-b0-row witness.

The boundary differs from the first fixed word only by putting x0,y0 before
nI.  This makes the exact eleven-point subsequence

    second,x0,y0,nI,c0,b0,b2,c1,b1,c2,nS

source/order compatible.  All unmapped roles are inserted on strict outward
edge bulges before the hard SLSQP continuation.
"""

from __future__ import annotations

import argparse
import json
from math import pi, sin
from multiprocessing import get_context
from pathlib import Path

import numpy as np

import search_constrained as hard
import search_coordinates as model
from probe_complete_row_word import BOUNDARY


HERE = Path(__file__).resolve().parent


def unit(t: float) -> np.ndarray:
    return np.asarray(((1.0 - t * t) / (1.0 + t * t), 2.0 * t / (1.0 + t * t)))


def exact_complete_row_seed(attempt: int) -> np.ndarray:
    o = np.asarray((0.0, 0.0))
    left = unit(0.0)
    right = unit(163.0 / 192.0)
    source0 = unit(4.0 / 231.0)
    source1 = unit(123.0 / 184.0)
    source2 = unit(3.0 / 4.0)
    blocker0 = (45.0 / 86.0) * (source0 + source1)
    blocker1 = (251.0 / 500.0) * (source1 + source2)
    blocker2 = (271.0 / 500.0) * (source2 + source0)

    def rotated_target(t: float) -> np.ndarray:
        cosine = (1.0 - t * t) / (1.0 + t * t)
        sine = 2.0 * t / (1.0 + t * t)
        rotation = np.asarray(((cosine, -sine), (sine, cosine)))
        return blocker0 + rotation @ (source0 - blocker0)

    target_x = rotated_target(-47.0 / 149.0)
    target_y = rotated_target(-28.0 / 95.0)

    coords = np.full((len(model.POINTS), 2), np.nan)
    by_name = {
        "nS": right,
        model.SECOND: o,
        "x0": target_x,
        "y0": target_y,
        "nI": left,
        "c0": source0,
        "b0": blocker0,
        "b2": blocker2,
        "c1": source1,
        "b1": blocker1,
        "c2": source2,
    }
    keys = {model.INDEX[name]: point for name, point in by_name.items()}
    for index, point in keys.items():
        coords[index] = point

    rng = np.random.default_rng(30_000 + attempt)
    known = sorted(keys)
    for start_pos, start in enumerate(known):
        end = known[(start_pos + 1) % len(known)]
        gap = (end - start - 1) % len(model.POINTS)
        if gap == 0:
            continue
        a = coords[start]
        b = coords[end]
        chord = b - a
        length = float(np.linalg.norm(chord))
        left_normal = np.asarray((-chord[1], chord[0])) / length
        bulge = (0.003 + 0.001 * (attempt % 5)) * length
        previous_t = 0.0
        for offset in range(1, gap + 1):
            index = (start + offset) % len(model.POINTS)
            t = offset / (gap + 1) + rng.normal(scale=0.01 / (gap + 1))
            t = min(0.99, max(previous_t + 0.001, t))
            previous_t = t
            coords[index] = (
                (1.0 - t) * a + t * b
                - bulge * sin(pi * t) * left_normal
            )

    assert not np.isnan(coords).any()
    z_first = complex(*coords[model.INDEX[model.FIRST]])
    z_second = complex(*coords[model.INDEX[model.SECOND]])
    normalized = np.asarray([
        (complex(*point) - z_first) / (z_second - z_first) - 0.5
        for point in coords
    ])
    result = np.column_stack((normalized.real, normalized.imag))
    assert min(model.edge_orientations(result)) > model.Margins().orientation

    # The exact subsequence survives the common similarity: physical five,
    # all three source pairs, and the complete reverse-0 row are roundoff exact.
    physical = model.PHYSICAL_FIVE
    physical_r = model.squared_distance(result, model.SECOND, physical[0])
    assert max(abs(model.squared_distance(result, model.SECOND, p) - physical_r) for p in physical) < 1e-12
    reverse0 = ("c0", "c1", "x0", "y0")
    reverse0_r = model.squared_distance(result, "b0", reverse0[0])
    assert max(abs(model.squared_distance(result, "b0", p) - reverse0_r) for p in reverse0) < 1e-12
    for row in range(3):
        a = model.CYCLE[row]
        b = model.CYCLE[(row + 1) % 3]
        assert abs(
            model.squared_distance(result, model.BLOCKERS[row], a)
            - model.squared_distance(result, model.BLOCKERS[row], b)
        ) < 1e-12
    return result


def configure() -> None:
    model.BOUNDARY = BOUNDARY
    model.POINTS = BOUNDARY
    model.INDEX = {name: index for index, name in enumerate(BOUNDARY)}
    model.FREE = tuple(name for name in BOUNDARY if name not in {model.FIRST, model.SECOND})
    hard.POINTS = BOUNDARY
    hard.INDEX = model.INDEX
    hard.exact_cycle_core_seed = exact_complete_row_seed
    hard.AFFINE_EXACT_SEEDS = False


def run_attempt(payload: tuple[int, int]) -> dict[str, object]:
    configure()
    result = hard.run_attempt(payload)
    result["boundary_word"] = "complete_row_compatible"
    if result["attempt"] % 2 == 0:
        result["initial_seed"] = "exact_complete_b0_row"
    return result


def quality(result: dict[str, object]) -> tuple[float, float]:
    return hard.quality(result)


def main() -> None:
    configure()
    parser = argparse.ArgumentParser()
    parser.add_argument("--attempts", type=int, default=192)
    parser.add_argument("--jobs", type=int, default=24)
    parser.add_argument("--maxiter", type=int, default=1500)
    parser.add_argument(
        "--output", type=Path,
        default=HERE / "COMPLETE_ROW_WORD_COORDINATE_RESULT.json",
    )
    args = parser.parse_args()
    payloads = [(attempt, args.maxiter) for attempt in range(args.attempts)]
    if args.jobs == 1:
        results = []
        for payload in payloads:
            result = run_attempt(payload)
            results.append(result)
            if result["verified_coordinate_hit"]:
                break
    else:
        with get_context("spawn").Pool(processes=args.jobs) as pool:
            results = []
            for result in pool.imap_unordered(run_attempt, payloads):
                results.append(result)
                if result["verified_coordinate_hit"]:
                    pool.terminate()
                    break
    results.sort(key=quality)
    verified = [result for result in results if result["verified_coordinate_hit"]]
    output = {
        "epistemic_status": (
            "NUMERICAL_COORDINATE_HIT_NOT_PROOF_NOT_MEC_NOT_CSS_NOT_LEAN"
            if verified else "NO_NUMERICAL_HIT_WITHIN_RECORDED_BUDGET_NOT_UNSAT"
        ),
        "method": "complete_row_exact_seed_plus_SLSQP_hard_constraints",
        "boundary": list(BOUNDARY),
        "exact_seed_subsequence": [
            model.SECOND, "x0", "y0", "nI",
            "c0", "b0", "b2", "c1", "b1", "c2", "nS",
        ],
        "scheduled_attempt_count": args.attempts,
        "completed_attempt_count": len(results),
        "remaining_attempt_seeds": sorted(
            set(range(args.attempts)) - {int(result["attempt"]) for result in results}
        ),
        "jobs": args.jobs,
        "max_iterations": args.maxiter,
        "verified_hit_count": len(verified),
        "margins": asdict_margins(),
        "best": results[0],
        "attempt_summaries": [
            {key: result[key] for key in (
                "attempt", "initial_seed", "optimizer_success", "optimizer_status",
                "iterations", "function_evaluations", "minimum_signed_constraint",
                "maximum_equality_residual", "verified_coordinate_hit", "diagnostics",
            )}
            for result in results
        ],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    print(json.dumps({key: value for key, value in output.items() if key != "attempt_summaries"}, indent=2))
    print(f"wrote {args.output}")


def asdict_margins() -> dict[str, float]:
    margins = model.Margins()
    return {
        "pair_sq": margins.pair_sq,
        "orientation": margins.orientation,
        "support_gap_sq": margins.support_gap_sq,
        "radius_gap_sq": margins.radius_gap_sq,
    }


if __name__ == "__main__":
    main()
