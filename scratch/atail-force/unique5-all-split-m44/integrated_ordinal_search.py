#!/usr/bin/env python3
"""Integrated exact ordinal search for a fixed-card-15 closed carrier.

The structural outer is shared with ``search_kalmanson_aware_survivor.py``.
Seven-bit ranks represent all 105 unordered distance terms.  Represented
radius classes become guarded rank equalities, complete-partition exactness
becomes guarded disequality, and every one-term cancellation of either strict
Kalmanson inequality becomes a guarded strict rank comparison.

SAT is an ordinal/Kalmanson shadow only.  UNSAT is external solver evidence
for the fixed cyclic order and two-exact-four-class robust mode, not live
coverage and not a Lean proof.  The live residual does not state that these
15 roles exhaust the carrier; minimality forces row escape if they do not.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "unique5_kalmanson_outer", HERE / "search_kalmanson_aware_survivor.py"
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot import structural outer")
OUTER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(OUTER)


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("zero distance is not ranked")
    return (a, b) if a < b else (b, a)


def build(timeout_ms: int, seed: int, first_apex_mode: str):
    solver, member, blocker, class0a, class0b, _ = OUTER.build(
        timeout_ms,
        seed,
        with_metric=False,
        first_apex_mode=first_apex_mode,
    )
    rank = {
        pair: z3.BitVec(f"rank_{pair[0]}_{pair[1]}", 7)
        for pair in itertools.combinations(OUTER.V, 2)
    }
    r0a, r0b, r1 = z3.BitVecs("rank_r0a rank_r0b rank_r1", 7)
    row_radius = {
        c: z3.BitVec(f"rank_row_{c}", 7)
        for c in OUTER.V if c not in {0, 1}
    }

    def value(a: int, b: int):
        return rank[edge(a, b)]

    # Complete radius partitions: two exact four-classes at center 0, one
    # exact five-class at center 1, and one exact four-class plus singleton
    # outside radii at every other center.
    if first_apex_mode == "two-exact-four":
        solver.add(r0a != r0b)
    for p in OUTER.V:
        if p != 0:
            solver.add(z3.Implies(class0a[p], value(0, p) == r0a))
            if first_apex_mode == "two-exact-four":
                solver.add(z3.Implies(class0b[p], value(0, p) == r0b))
                solver.add(z3.Implies(
                    z3.And(z3.Not(class0a[p]), z3.Not(class0b[p])),
                    z3.And(value(0, p) != r0a, value(0, p) != r0b),
                ))
            else:
                solver.add(z3.Implies(z3.Not(class0a[p]), value(0, p) != r0a))
        if p != 1:
            solver.add(
                value(1, p) == r1
                if p in OUTER.EXACT_FIVE
                else value(1, p) != r1
            )
        for c, radius in row_radius.items():
            if p == c:
                continue
            solver.add(z3.Implies(member[c, p], value(c, p) == radius))
            solver.add(z3.Implies(z3.Not(member[c, p]), value(c, p) != radius))

    for c in OUTER.V:
        points = tuple(p for p in OUTER.V if p != c)
        for p, q in itertools.combinations(points, 2):
            if c == 0:
                outside = z3.And(z3.Not(class0a[p]), z3.Not(class0a[q]))
                if first_apex_mode == "two-exact-four":
                    outside = z3.And(
                        outside, z3.Not(class0b[p]), z3.Not(class0b[q])
                    )
            elif c == 1:
                if p in OUTER.EXACT_FIVE or q in OUTER.EXACT_FIVE:
                    continue
                outside = z3.BoolVal(True)
            else:
                outside = z3.And(z3.Not(member[c, p]), z3.Not(member[c, q]))
            solver.add(z3.Implies(outside, value(c, p) != value(c, q)))

    # Complete one-term strict-Kalmanson cancellation system.  If one term on
    # each side cancels in the equality quotient, the remaining negative term
    # is strictly smaller than the remaining diagonal term.
    for ia, ib, ic, id_ in itertools.combinations(range(OUTER.N), 4):
        a, b, c, d = (OUTER.ORDER[i] for i in (ia, ib, ic, id_))
        positive = (value(a, c), value(b, d))
        for negative in (
            (value(a, b), value(c, d)),
            (value(a, d), value(b, c)),
        ):
            for pi in range(2):
                for ni in range(2):
                    solver.add(z3.Implies(
                        positive[pi] == negative[ni],
                        z3.ULT(negative[1 - ni], positive[1 - pi]),
                    ))
    return solver, member, blocker, class0a, class0b, rank


def decode(
    model,
    member,
    blocker,
    class0a,
    class0b,
    rank,
    *,
    first_apex_mode: str,
):
    return {
        "status": "SAT_VERIFIED_ORDINAL_KALMANSON_SHADOW",
        "epistemic_status": "EXACT_QF_BV_ORDINAL_NOT_FULL_LRA_NOT_EUCLIDEAN_NOT_LEAN",
        "order": list(OUTER.ORDER),
        "caps": [sorted(cap) for cap in OUTER.CAPS],
        "exact_five": sorted(OUTER.EXACT_FIVE),
        "first_apex_mode": first_apex_mode,
        "first_apex_classes": [
            [p for p in OUTER.V if z3.is_true(model.eval(class0a[p], model_completion=True))],
            [p for p in OUTER.V if z3.is_true(model.eval(class0b[p], model_completion=True))],
        ],
        "rows": {
            str(c): [p for p in OUTER.V if z3.is_true(model.eval(member[c, p], model_completion=True))]
            for c in OUTER.V
        },
        "blockers": {
            str(s): next(c for c in OUTER.V if z3.is_true(model.eval(blocker[s, c], model_completion=True)))
            for s in OUTER.V
        },
        "ranks": {
            f"{a},{b}": model.eval(value, model_completion=True).as_long()
            for (a, b), value in rank.items()
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    parser.add_argument(
        "--first-apex-mode",
        choices=("two-exact-four", "one-large"),
        default="two-exact-four",
    )
    args = parser.parse_args()
    solver, member, blocker, class0a, class0b, rank = build(
        args.timeout_ms, args.seed, args.first_apex_mode
    )
    verdict = solver.check()
    if verdict == z3.sat:
        payload = decode(
            solver.model(),
            member,
            blocker,
            class0a,
            class0b,
            rank,
            first_apex_mode=args.first_apex_mode,
        )
    else:
        payload = {
            "status": str(verdict).upper(),
            "reason": solver.reason_unknown() if verdict == z3.unknown else None,
            "epistemic_status": (
                "EXTERNAL_FIXED_ORDER_FIXED_CARD_15_CLOSED_CARRIER_MODE_NOT_LIVE_COVERAGE_NOT_LEAN"
            ),
            "order": list(OUTER.ORDER),
            "first_apex_mode": args.first_apex_mode,
        }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
