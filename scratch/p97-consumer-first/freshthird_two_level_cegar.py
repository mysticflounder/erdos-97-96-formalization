#!/usr/bin/env python3
"""Two-level structural/metric CEGAR probe for the FreshThird residual.

The first solver is deliberately structural: it reuses the source-faithful
rank/alias, shell, cap-incidence, and deletion clauses from
``freshthird_rank_kalmanson_probe`` with metric triangle/Kalmanson packets
disabled.  A model's complete role-to-rank/equality and incidence signature is
then frozen.  The second solver is a fresh exact-rational LRA instance over
the occupied representatives.  It replays the metric-sensitive shell and
center equalities and checks every strict triangle and both Kalmanson
inequalities directly, with no guarded rank formulas.

This is a diagnostic CEGAR run only.  A SAT result is a valid survivor of the
encoded fixed structure; an UNSAT result blocks that exact structural
signature and tries a bounded number of alternatives.  Neither result is a
universal Lean closure without a source-level ingress and lift.
"""

from __future__ import annotations

import sys
from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import And, Bool, Not, Or, Real, SolverFor, sat, unknown

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_rank_kalmanson_probe import (  # noqa: E402
    DROW,
    ORDER_ARMS,
    ROW,
    SEED,
    build_arm,
)


MAX_STRUCTURES = 4
STRUCTURAL_TIMEOUT_MS = 7000
METRIC_TIMEOUT_MS = 4000
WITNESS_BOOL_NAMES = tuple(
    [f"shell_{z}_contains_w{j}" for z in range(4) for j in range(4)]
    + [f"blocker{z}_interior_cap{k}" for z in range(4) for k in range(3)]
    + [f"w{z}_in_closed_cap{k}" for z in range(4) for k in range(3)]
)


def _bool_value(model, name: str) -> bool:
    return bool(model.eval(Bool(name), model_completion=True))


def structural_signature(model, context):
    """Return the complete finite signature used for structural blocking."""

    ranks = context["ranks"]
    role_values = tuple((role, model.eval(ranks[role]).as_long()) for role in ranks)
    bool_values = tuple((name, _bool_value(model, name)) for name in WITNESS_BOOL_NAMES)
    return role_values + bool_values


def _signature_block(signature, context):
    ranks = context["ranks"]
    rank_terms = [ranks[role] != value for role, value in signature[: len(ranks)]]
    bool_terms = [Bool(name) != value for name, value in signature[len(ranks) :]]
    return Or(*(rank_terms + bool_terms))


def _occupied_representatives(model, context):
    ranks = context["ranks"]
    role_order = sorted(ranks, key=lambda role: model.eval(ranks[role]).as_long())
    representatives = []
    rank_of = {}
    for role in role_order:
        rank = model.eval(ranks[role]).as_long()
        rank_of[role] = rank
        if not representatives or rank_of[representatives[-1]] != rank:
            representatives.append(role)
    return representatives, rank_of


def exact_metric_check(model, context, timeout_ms: int):
    """Check one frozen structure in a direct, unguarded exact LRA model."""

    representatives, rank_of = _occupied_representatives(model, context)
    occupied_ranks = sorted({rank_of[role] for role in rank_of})
    rank_position = {rank: i for i, rank in enumerate(occupied_ranks)}
    rank_index = {role: rank_position[rank] for role, rank in rank_of.items()}
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    distances = {
        (i, j): Real(f"fixed_d_{i}_{j}")
        for i, j in combinations(range(len(representatives)), 2)
    }

    def d_role(a: str, b: str):
        ia, ib = rank_index[a], rank_index[b]
        if ia == ib:
            return 0
        key = (ia, ib) if ia < ib else (ib, ia)
        return distances[key]

    # All distinct occupied points have positive distance.  This is an
    # unguarded fixed-structure packet: rank tests have already happened in
    # the structural solver and are represented by the representatives.
    for variable in distances.values():
        solver.add(variable > 0)

    # Replay the metric-sensitive source packet for the frozen incidence
    # assignment.  Boolean shell values are constants, not solver choices.
    def fixed_bool(name: str) -> bool:
        return _bool_value(model, name)

    source_shell = ("qOutside", "qBetween", "canonicalSource", "c2")
    fresh_shell = ("qOutside", "qBetween", "f1", "f2")
    for points in (source_shell, fresh_shell, ROW, DROW):
        for a, b in combinations(points, 2):
            solver.add(d_role(a, b) > 0)
    for outside in ("w0", "e0"):
        for seed in SEED:
            solver.add(d_role(outside, seed) > 0)
    solver.add(d_role("sourceCenter", "qOutside") > 0)
    solver.add(d_role("freshCenter", "qOutside") > 0)
    for support, center in ((source_shell, "sourceCenter"), (fresh_shell, "freshCenter")):
        for point in support[1:]:
            solver.add(d_role(center, point) == d_role(center, support[0]))

    radii = [Real(f"fixed_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        solver.add(radius > 0)
        for j, point in enumerate(ROW):
            contains = fixed_bool(f"shell_{z}_contains_w{j}")
            # Exact shell membership is retained as equality/disequality to
            # the same radius, rather than weakened to a positive-distance
            # approximation.
            solver.add(d_role(f"b{z}", point) == radius if contains else d_role(f"b{z}", point) != radius)

    for z, w in combinations(range(4), 2):
        equal_nonpinned = rank_of[f"b{z}"] == rank_of[f"b{w}"] and rank_of[f"b{z}"] != rank_of["pinnedCenter"]
        if equal_nonpinned:
            solver.add(d_role(f"b{z}", ROW[w]) == radii[z])
            solver.add(d_role(f"b{w}", ROW[z]) == radii[w])

    # Every strict triangle on the occupied representatives.
    triangle_count = 0
    for a, b, c in combinations(representatives, 3):
        dab, dac, dbc = d_role(a, b), d_role(a, c), d_role(b, c)
        solver.add(dab + dbc > dac)
        solver.add(dab + dac > dbc)
        solver.add(dac + dbc > dab)
        triangle_count += 3

    # Both Kalmanson inequalities for every increasing occupied quadruple.
    kalmanson_count = 0
    for a, b, c, e in combinations(representatives, 4):
        rhs = d_role(a, c) + d_role(b, e)
        solver.add(d_role(b, c) + d_role(a, e) < rhs)
        solver.add(d_role(a, b) + d_role(c, e) < rhs)
        kalmanson_count += 2

    result = solver.check()
    return result, {
        "occupied": len(representatives),
        "triangle_inequalities": triangle_count,
        "kalmanson_inequalities": kalmanson_count,
        "metric_assertions": len(solver.assertions()),
    }


def run(order, deadline_seconds: float = 55.0):
    started = monotonic()
    structural, stats, context = build_arm(
        order,
        timeout_ms=STRUCTURAL_TIMEOUT_MS,
        eager_geometry=False,
        rank_indexed_metric=False,
    )
    structures = 0
    blocked = 0
    trace = []
    status = "timeout"
    metric_stats = {}
    while structures < MAX_STRUCTURES and monotonic() - started < deadline_seconds:
        structural_result = structural.check()
        if structural_result == unknown:
            status = "timeout"
            trace.append(f"s{structures + 1}:structural-unknown")
            break
        if structural_result != sat:
            status = "fixed_structures_unsat"
            break
        structures += 1
        model = structural.model()
        signature = structural_signature(model, context)
        metric_result, metric_stats = exact_metric_check(model, context, METRIC_TIMEOUT_MS)
        if metric_result == sat:
            status = "sat_valid_survivor"
            trace.append(f"s{structures}:metric-sat/occupied={metric_stats['occupied']}")
            break
        if metric_result == unknown:
            status = "timeout"
            trace.append(f"s{structures}:metric-unknown")
            break
        blocked += 1
        structural.add(_signature_block(signature, context))
        trace.append(f"s{structures}:fixed-structure-unsat/blocked={blocked}")
    else:
        status = "timeout" if structures < MAX_STRUCTURES else "bounded_exhaustion"
    elapsed = monotonic() - started
    return status, {
        "arm": "outside_fresh_between_source_canonical/offEndpoint",
        "status": status,
        "structures_checked": structures,
        "structures_blocked": blocked,
        "elapsed_seconds": round(elapsed, 3),
        "structural_assertions": stats["assertions"],
        "structural_roles": stats["roles"],
        "structural_cap_booleans": stats["cap_boolean_count"],
        "last_metric": metric_stats,
        "trace": ";".join(trace),
        "fidelity": "exact role-rank/equality plus shell/cap incidence frozen; metric replay uses direct unguarded rational LRA triangles and Kalmanson clauses",
        "scope": "one offEndpoint order arm; bounded diagnostic only; no universal closure claim",
    }


def main():
    status, report = run(next(iter(ORDER_ARMS.values())))
    lines = [f"{key}={value}" for key, value in report.items()]
    print("\n".join(lines))
    Path(__file__).with_suffix(".results.txt").write_text("\n".join(lines) + "\n", encoding="utf-8")
    if status not in {"sat_valid_survivor", "fixed_structures_unsat", "bounded_exhaustion", "timeout"}:
        raise SystemExit(f"unexpected status {status}")


if __name__ == "__main__":
    main()
