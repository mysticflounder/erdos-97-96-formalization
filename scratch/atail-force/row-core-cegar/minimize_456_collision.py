#!/usr/bin/env python3
"""Minimize a collision-producing equality core in the saved 456 shadow.

Large-prime runs are only a discovery filter.  Every reported final core is
rechecked over characteristic zero, and deleting each retained generator is
also checked over characteristic zero.  The result is exact algebraic
evidence for this one pinned finite shadow, not a uniform producer theorem.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import random
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
DRIVER_PATH = HERE.parent / "critical-map-geometry" / "singular_row_core.py"
SPEC = importlib.util.spec_from_file_location("singular_row_core", DRIVER_PATH)
assert SPEC is not None and SPEC.loader is not None
DRIVER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DRIVER)

PROFILE = (4, 5, 6)
CENTERS = tuple(range(12))
TARGET_PAIR = (0, 1)


def target_forced(result: dict[str, Any]) -> bool:
    return (
        result.get("status") == "NONUNIT"
        and list(TARGET_PAIR) in result.get("ideal_forced_zero_pairs", [])
    )


def probe(
    equations: list[Any], indices: tuple[int, ...], *, characteristic: int,
    timeout_seconds: float,
) -> dict[str, Any]:
    return DRIVER.run_singular(
        [equations[index] for index in indices],
        characteristic=characteristic,
        timeout_seconds=timeout_seconds,
        scan_pairs=(TARGET_PAIR,),
    )


def greedy_minimize(
    equations: list[Any], order: list[int], *, characteristic: int,
    timeout_seconds: float, initial: tuple[int, ...] | None = None,
) -> tuple[tuple[int, ...], dict[str, int]]:
    retained = list(range(len(equations))) if initial is None else list(initial)
    counts = {"forced": 0, "not_forced": 0, "timeout_or_error": 0}
    for candidate in order:
        if candidate not in retained:
            continue
        trial = tuple(index for index in retained if index != candidate)
        result = probe(
            equations, trial,
            characteristic=characteristic,
            timeout_seconds=timeout_seconds,
        )
        if target_forced(result):
            retained.remove(candidate)
            counts["forced"] += 1
        elif result.get("status") in {"UNIT", "NONUNIT"}:
            counts["not_forced"] += 1
        else:
            counts["timeout_or_error"] += 1
    return tuple(retained), counts


def greedy_drop_row_blocks(
    equations: list[Any], center_order: list[int], *, characteristic: int,
    timeout_seconds: float,
) -> tuple[tuple[int, ...], dict[str, int]]:
    retained = list(range(len(equations)))
    counts = {"forced": 0, "not_forced": 0, "timeout_or_error": 0}
    for center in center_order:
        block = {3 * center, 3 * center + 1, 3 * center + 2}
        trial = tuple(index for index in retained if index not in block)
        result = probe(
            equations, trial,
            characteristic=characteristic,
            timeout_seconds=timeout_seconds,
        )
        if target_forced(result):
            retained = list(trial)
            counts["forced"] += 1
        elif result.get("status") in {"UNIT", "NONUNIT"}:
            counts["not_forced"] += 1
        else:
            counts["timeout_or_error"] += 1
    return tuple(retained), counts


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--trials", type=int, default=4)
    parser.add_argument("--seed", type=int, default=9796456)
    parser.add_argument("--prime", type=int, default=32003)
    parser.add_argument("--prime-timeout-seconds", type=float, default=10.0)
    parser.add_argument("--qq-timeout-seconds", type=float, default=30.0)
    parser.add_argument(
        "--prime-only", action="store_true",
        help="stop after the explicitly non-exact large-prime discovery pass",
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.check:
        smoke = DRIVER.smoke_gate(min(args.qq_timeout_seconds, 5.0))
        if not smoke["passed"]:
            raise AssertionError("Singular smoke gate failed")
    rows = DRIVER.load_rows(PROFILE)
    equations = DRIVER.row_equations(rows, CENTERS)
    labels = DRIVER.row_equation_labels(rows, CENTERS)
    if len(equations) != 36:
        raise AssertionError("456 equation count drift")

    rng = random.Random(args.seed)
    trial_reports = []
    candidates: set[tuple[int, ...]] = set()
    for trial in range(args.trials):
        center_order = list(CENTERS)
        if trial > 0:
            rng.shuffle(center_order)
        row_retained, row_counts = greedy_drop_row_blocks(
            equations,
            center_order,
            characteristic=args.prime,
            timeout_seconds=args.prime_timeout_seconds,
        )
        order = list(row_retained)
        if trial > 0:
            rng.shuffle(order)
        retained, counts = greedy_minimize(
            equations,
            order,
            characteristic=args.prime,
            timeout_seconds=args.prime_timeout_seconds,
            initial=row_retained,
        )
        candidates.add(retained)
        trial_reports.append(
            {
                "trial": trial,
                "center_order": center_order,
                "row_block_retained": list(row_retained),
                "row_block_probe_counts": row_counts,
                "order": order,
                "retained": list(retained),
                "retained_count": len(retained),
                "probe_counts": counts,
            }
        )

    # Prefer fewer equations, then lexicographic stability.  Prime arithmetic
    # only proposes this candidate; the claims below come from QQ.
    selected = min(candidates, key=lambda item: (len(item), item))
    if args.prime_only:
        print(json.dumps({
            "status": "LARGE_PRIME_DISCOVERY_ONLY",
            "characteristic": args.prime,
            "selected_equation_indices": list(selected),
            "selected_equations": [
                {"index": index, **labels[index]} for index in selected
            ],
            "trials": trial_reports,
        }, indent=2, sort_keys=True))
        return
    print(
        f"prime discovery retained {len(selected)} equations; starting QQ replay",
        file=sys.stderr,
        flush=True,
    )
    qq = probe(
        equations,
        selected,
        characteristic=0,
        timeout_seconds=args.qq_timeout_seconds,
    )
    qq_deletions = []
    for candidate in selected:
        trial = tuple(index for index in selected if index != candidate)
        result = probe(
            equations,
            trial,
            characteristic=0,
            timeout_seconds=args.qq_timeout_seconds,
        )
        qq_deletions.append(
            {
                "deleted_index": candidate,
                "status": result.get("status"),
                "target_forced": target_forced(result),
            }
        )
    result = {
        "schema": "p97-atail-row-core-456-collision-minimization-v1",
        "shadow_sha256": DRIVER.sha256(DRIVER.SHADOWS),
        "profile": list(PROFILE),
        "gauge": {"point_4": [0, 0], "point_0": [1, 0]},
        "target_pair": list(TARGET_PAIR),
        "trials": trial_reports,
        "selected_equation_indices": list(selected),
        "selected_equations": [
            {"index": index, **labels[index]} for index in selected
        ],
        "qq_result": {
            "status": qq.get("status"),
            "dimension": qq.get("dimension"),
            "basis_size": qq.get("basis_size"),
            "target_forced": target_forced(qq),
        },
        "qq_single_deletion_checks": qq_deletions,
        "qq_irredundant_for_direct_target_membership": (
            target_forced(qq)
            and all(not item["target_forced"] for item in qq_deletions)
        ),
        "scope": (
            "exact characteristic-zero ideal-membership evidence for the one "
            "pinned 456 saved finite shadow only"
        ),
    }
    if not result["qq_result"]["target_forced"]:
        raise AssertionError("selected prime candidate did not verify over QQ")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
