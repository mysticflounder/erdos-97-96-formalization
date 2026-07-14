#!/usr/bin/env python3
"""Mine small row-equality cores forcing one squared distance to vanish.

Finite-characteristic runs are discovery only.  A returned core becomes a
real proof candidate only after the same ideal-membership query and lift replay
succeed in characteristic zero.
"""

from __future__ import annotations

import argparse
import json
import random

from singular_row_core import (
    load_rows,
    row_equation_labels,
    row_equations,
    run_singular,
    smoke_gate,
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", default="4,5,6")
    parser.add_argument("--pair", default="0,1")
    parser.add_argument("--characteristic", type=int, default=32003)
    parser.add_argument("--orders", type=int, default=8)
    parser.add_argument("--seed", type=int, default=20260714)
    parser.add_argument("--timeout-seconds", type=float, default=5.0)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    profile = tuple(int(item) for item in args.profile.split(","))
    pair = tuple(sorted(int(item) for item in args.pair.split(",")))
    require(profile in {(5, 5, 5), (4, 5, 6)}, "unsupported profile")
    require(len(pair) == 2 and pair[0] != pair[1], "invalid pair")
    require(args.characteristic > 0, "discovery characteristic must be positive")
    require(args.orders > 0, "orders must be positive")

    centers = tuple(range(12))
    rows = load_rows(profile)
    equations = row_equations(rows, centers)
    labels = row_equation_labels(rows, centers)

    calls = 0

    def forced(indices: list[int]) -> bool:
        nonlocal calls
        calls += 1
        result = run_singular(
            [equations[index] for index in indices],
            characteristic=args.characteristic,
            timeout_seconds=args.timeout_seconds,
            scan_pairs=(pair,),
        )
        return list(pair) in result.get("ideal_forced_zero_pairs", [])

    full = list(range(len(equations)))
    require(forced(full), "full system does not force the requested collision")
    rng = random.Random(args.seed)
    orders = [list(range(len(equations))), list(reversed(range(len(equations))))]
    while len(orders) < args.orders:
        order = list(range(len(equations)))
        rng.shuffle(order)
        orders.append(order)

    cores: dict[tuple[int, ...], dict[str, object]] = {}
    for order in orders[:args.orders]:
        active = full.copy()
        for index in order:
            if index not in active:
                continue
            trial = [candidate for candidate in active if candidate != index]
            if forced(trial):
                active = trial
        key = tuple(active)
        cores[key] = {
            "indices": active,
            "equations": [
                {"index": index, **labels[index]} for index in active
            ],
        }

    ranked = sorted(cores.values(), key=lambda row: (len(row["indices"]), row["indices"]))
    result = {
        "profile": list(profile),
        "pair": list(pair),
        "characteristic": args.characteristic,
        "orders": args.orders,
        "singular_calls": calls,
        "distinct_cores": len(ranked),
        "cores": ranked,
        "evidence_scope": (
            "finite-characteristic discovery only; replay the selected indices "
            "in characteristic zero before treating them as a real obstruction"
        ),
    }
    if args.check:
        result["smoke_gate"] = smoke_gate(min(args.timeout_seconds, 5.0))
        require(result["smoke_gate"]["passed"], "Singular smoke gate failed")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
