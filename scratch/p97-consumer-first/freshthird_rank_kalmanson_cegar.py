#!/usr/bin/env python3
"""Lazy exact-rational geometry refinement for the FreshThird rank probe.

Only triangle/Kalmanson inequalities violated by the current occupied-rank
model are added.  A SAT exit is therefore a genuine survivor of the complete
rank-geometry abstraction; UNSAT is still only computational evidence until
the documented Lean ingress and universal lift are proved.
"""

from __future__ import annotations

from fractions import Fraction
from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import And, Not, Or, sat, unknown

from freshthird_rank_kalmanson_probe import ORDER_ARMS, build_arm


def rational(model, term) -> Fraction:
    value = model.eval(term, model_completion=True)
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def main() -> None:
    started = monotonic()
    order = next(iter(ORDER_ARMS.values()))
    solver, stats, context = build_arm(
        order, timeout_ms=5000, eager_geometry=False,
        rank_indexed_metric=False,
    )
    ranks = context["ranks"]
    distance = context["metric"]
    rank_bound = context["rank_bound"]
    added_triangles: set[tuple[str, str, str, int]] = set()
    added_kalmanson: set[tuple[str, str, str, str, int]] = set()
    rounds = 0
    result = unknown
    result_name = "unknown"
    status = "round_limit"
    round_trace: list[str] = []

    while rounds < 64 and monotonic() - started < 55:
        rounds += 1
        result = solver.check()
        result_name = str(result)
        if result != sat:
            status = "unsat" if result != unknown else "unknown"
            break
        model = solver.model()
        role_order = sorted(ranks, key=lambda role: model.eval(ranks[role]).as_long())
        representatives = []
        occupied = []
        for role in role_order:
            rank_value = model.eval(ranks[role]).as_long()
            if not occupied or occupied[-1] != rank_value:
                occupied.append(rank_value)
                representatives.append(role)

        triangle_candidates = []
        for a, b, c in combinations(representatives, 3):
            dij = rational(model, distance(a, b))
            dik = rational(model, distance(a, c))
            djk = rational(model, distance(b, c))
            distinct_guard = And(ranks[a] != ranks[b], ranks[a] != ranks[c], ranks[b] != ranks[c])
            inequalities = (
                (0, dij + djk, dik, distance(a, b) + distance(b, c) > distance(a, c)),
                (1, dij + dik, djk, distance(a, b) + distance(a, c) > distance(b, c)),
                (2, dik + djk, dij, distance(a, c) + distance(b, c) > distance(a, b)),
            )
            for side, lhs, rhs, clause in inequalities:
                key = (a, b, c, side)
                if lhs <= rhs and key not in added_triangles:
                    triangle_candidates.append(
                        (rhs - lhs, key, Or(Not(distinct_guard), clause))
                    )

        kalmanson_candidates = []
        for a, b, c, e in combinations(representatives, 4):
            rhs_value = rational(model, distance(a, c)) + rational(
                model, distance(b, e)
            )
            order_guard = And(ranks[a] < ranks[b], ranks[b] < ranks[c], ranks[c] < ranks[e])
            inequalities = (
                (
                    0,
                    rational(model, distance(b, c))
                    + rational(model, distance(a, e)),
                    distance(b, c) + distance(a, e)
                    < distance(a, c) + distance(b, e),
                ),
                (
                    1,
                    rational(model, distance(a, b))
                    + rational(model, distance(c, e)),
                    distance(a, b) + distance(c, e)
                    < distance(a, c) + distance(b, e),
                ),
            )
            for side, lhs_value, clause in inequalities:
                key = (a, b, c, e, side)
                if lhs_value >= rhs_value and key not in added_kalmanson:
                    kalmanson_candidates.append(
                        (lhs_value - rhs_value, key, Or(Not(order_guard), clause))
                    )

        triangle_candidates.sort(key=lambda candidate: candidate[0], reverse=True)
        kalmanson_candidates.sort(key=lambda candidate: candidate[0], reverse=True)
        selected_triangles = triangle_candidates[:128]
        selected_kalmanson = kalmanson_candidates[:512]
        triangle_cuts = [candidate[2] for candidate in selected_triangles]
        kalmanson_cuts = [candidate[2] for candidate in selected_kalmanson]
        added_triangles.update(candidate[1] for candidate in selected_triangles)
        added_kalmanson.update(candidate[1] for candidate in selected_kalmanson)

        if not triangle_cuts and not kalmanson_cuts:
            status = "sat_complete_rank_geometry"
            break
        round_trace.append(
            f"r{rounds}:occupied={len(occupied)},triangle={len(triangle_cuts)},kalmanson={len(kalmanson_cuts)}"
        )
        solver.add(*triangle_cuts, *kalmanson_cuts)

    elapsed = monotonic() - started
    lines = [
        "arm=outside_fresh_between_source_canonical/offEndpoint",
        f"status={status}",
        f"solver_result={result_name}",
        f"rounds={rounds}",
        f"elapsed_seconds={elapsed:.3f}",
        f"triangle_cuts={len(added_triangles)}",
        f"kalmanson_cuts={len(added_kalmanson)}",
        f"base_assertions={stats['assertions']}",
        f"final_assertions={len(solver.assertions())}",
        f"rank_bound={rank_bound}",
        f"round_trace={';'.join(round_trace)}",
        "scope=one order arm/offEndpoint; exact rational SMT; complete only for the encoded rank abstraction when status=sat_complete_rank_geometry or unsat",
    ]
    print("\n".join(lines))
    Path(__file__).with_suffix(".results.txt").write_text(
        "\n".join(lines) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
