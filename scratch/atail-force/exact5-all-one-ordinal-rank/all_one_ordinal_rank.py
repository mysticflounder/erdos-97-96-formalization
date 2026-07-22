#!/usr/bin/env python3
"""Aggregate ordinal-rank gate for exact-five card-13 all-one outcomes.

This is the all-one analogue of the source formula that closed the
card-thirteen same-radius asymmetric leaf.  It retains the source-faithful
finite parent from ``exact5-global-cover-parent-gate`` and adds only necessary
consequences of one common convex boundary order:

* every selected row identifies its centered distance ranks;
* the complete exact-five shell identifies all second-apex distance ranks;
* cancellation in either strict Kalmanson inequality forces a strict rank
  comparison.

An UNSAT result is exact within this necessary abstraction, but is not a Lean
proof until the source core and SAT certificate are replayed in Lean.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
import sys
import time

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PARENT = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
sys.path.insert(0, str(PARENT))

from encode import Outer  # noqa: E402
from verify import SECOND_APEX, VERTICES  # noqa: E402


ORBITS = (
    "allOneHitHubLeft",
    "allOneHitHubMiddle",
    "allOneHitHubRight",
)


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance atom endpoints must be distinct")
    return tuple(sorted((left, right)))


def build(orbit: str, seed: int, timeout_ms: int):
    if orbit not in ORBITS:
        raise ValueError(orbit)
    outer = Outer(orbit, 0, seed)
    base = list(outer.solver.assertions())

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=seed)
    solver.add(*base)
    outer.solver = solver

    atoms = tuple(itertools.combinations(VERTICES, 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"ord_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    for variable in rank.values():
        solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))

    guarded_row_equalities = 0

    def add_row(center: int, row: list[z3.BoolRef]) -> None:
        nonlocal guarded_row_equalities
        targets = [point for point in VERTICES if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(z3.Implies(
                z3.And(row[left], row[right]),
                rank[edge(center, left)] == rank[edge(center, right)],
            ))
            guarded_row_equalities += 1

    for family in (outer.m, *outer.cover):
        for center in VERTICES:
            add_row(center, [family[center, point] for point in VERTICES])
    add_row(4, outer.b1)

    shell_equalities = 0
    shell_targets = [point for point in VERTICES if point != SECOND_APEX]
    for left, right in itertools.combinations(shell_targets, 2):
        solver.add(z3.Implies(
            z3.And(outer.shell[left], outer.shell[right]),
            rank[edge(SECOND_APEX, left)]
            == rank[edge(SECOND_APEX, right)],
        ))
        shell_equalities += 1

    cancellation_implications = 0
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for positive_index in range(2):
                for negative_index in range(2):
                    solver.add(z3.Implies(
                        rank[positive[positive_index]]
                        == rank[negative[negative_index]],
                        z3.UGT(
                            rank[positive[1 - positive_index]],
                            rank[negative[1 - negative_index]],
                        ),
                    ))
                    cancellation_implications += 1

    counts = {
        "base_assertions": len(base),
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "guarded_selected_row_rank_equalities": guarded_row_equalities,
        "guarded_exact_five_shell_rank_equalities": shell_equalities,
        "kalmanson_cancellation_implications": cancellation_implications,
        "total_source_assertions": len(solver.assertions()),
    }
    return outer, rank, counts


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--seconds", type=float, default=600.0)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--smt2", type=Path)
    args = parser.parse_args()

    started = time.monotonic()
    outer, rank, counts = build(
        args.orbit, args.seed, max(1, int(args.seconds * 1000))
    )
    built = time.monotonic()
    if args.smt2 is not None:
        args.smt2.write_text(outer.solver.to_smt2(), encoding="utf-8")
    print(json.dumps({
        "event": "built",
        "orbit": args.orbit,
        "seed": args.seed,
        "elapsed_seconds": built - started,
        **counts,
    }, sort_keys=True), flush=True)
    verdict = outer.solver.check()
    finished = time.monotonic()
    result: dict[str, object] = {
        "schema": "p97-exact5-card13-all-one-ordinal-rank-v1",
        "orbit": args.orbit,
        "seed": args.seed,
        "result": str(verdict),
        "build_seconds": built - started,
        "solve_seconds": finished - built,
        "total_seconds": finished - started,
        "counts": counts,
        "statistics": str(outer.solver.statistics()),
    }
    if verdict == z3.unknown:
        result["reason_unknown"] = outer.solver.reason_unknown()
    elif verdict == z3.sat:
        decoded = outer.decode(outer.solver.model())
        result["decoded"] = decoded
        result["rank_values"] = {
            f"{left},{right}": outer.solver.model().eval(value).as_long()
            for (left, right), value in rank.items()
        }
    output = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(output, encoding="utf-8")
    print(output, end="", flush=True)


if __name__ == "__main__":
    main()
