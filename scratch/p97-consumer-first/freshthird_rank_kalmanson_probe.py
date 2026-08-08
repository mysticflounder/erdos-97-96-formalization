#!/usr/bin/env python3
"""Symbolic FreshThird rank/distance probe (design + bounded smoke test).

Blocker equality partitions and row aliases are selected by the rank/zero-
distance relation inside one SMT instance per genuine top-level arm.  No
244-million alias expansion or 778-way blocker fan is constructed.  This file
intentionally does not claim a theorem or start a long search.
"""

from __future__ import annotations

from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import (
    And,
    Bool,
    Function,
    If,
    Int,
    IntSort,
    Not,
    Or,
    Real,
    RealSort,
    SolverFor,
    Sum,
    sat,
    unknown,
)


SEED = ("qOutside", "qBetween", "canonicalSource", "c2", "f1", "f2")
ROW = ("w0", "w1", "w2", "w3")
DROW = ("e0", "e1", "e2", "e3")
ORDER_ARMS = {
    "outside_fresh_between_source_canonical":
    ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
    "outside_fresh_between_canonical_source":
    ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
    "canonical_source_between_fresh_outside":
    ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
    "source_canonical_between_fresh_outside":
    ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
}
ROLES = (
    *SEED,
    "sourceCenter", "freshCenter", "pinnedCenter", "drowCenter",
    *ROW, *DROW,
    "b0", "b1", "b2", "b3",
)


def build_arm(
    order: tuple[str, ...], timeout_ms: int = 5000, *, eager_geometry: bool = True,
    rank_indexed_metric: bool = True,
):
    assert len(SEED) == 6
    assert len(ROW) == len(DROW) == 4
    assert len(ROLES) == 22
    solver = SolverFor("QF_UFLIRA")
    solver.set(timeout=timeout_ms)
    rank_bound = len(ROLES)
    ranks = {r: Int(f"rank_{r}") for r in ROLES}
    # A finite rank-indexed distance function replaces one metric variable per
    # role pair.  All rank arguments are bounded below, so these cells cover
    # every value used by a carrier role.
    rank_cells = rank_bound * (rank_bound - 1) // 2

    if rank_indexed_metric:
        distance = Function("Dist", IntSort(), IntSort(), RealSort())

        def d(a, b):
            return 0 if a == b else distance(ranks[a], ranks[b])

        def dr(i, j):
            return distance(i, j)
    else:
        distance = None
        role_index = {role: i for i, role in enumerate(ROLES)}
        role_distance = {
            (a, b): Real(f"d_{a}_{b}")
            for a, b in combinations(ROLES, 2)
        }

        def d(a, b):
            if a == b:
                return 0
            return role_distance[(a, b)] if role_index[a] < role_index[b] else role_distance[(b, a)]

        def dr(_i, _j):
            raise ValueError("rank-indexed distance unavailable in role-metric mode")

    for r in ROLES:
        solver.add(0 <= ranks[r], ranks[r] < rank_bound)
    # Occupancy is true exactly for rank indices represented by at least one
    # carrier; geometric axioms below are guarded by these booleans.
    occupied = [Or(*[ranks[r] == i for r in ROLES]) for i in range(rank_bound)]
    if rank_indexed_metric:
        for i in range(rank_bound):
            solver.add(dr(i, i) == 0)
        for i, j in combinations(range(rank_bound), 2):
            solver.add(dr(i, j) == dr(j, i))
            occupied_pair = And(occupied[i], occupied[j])
            solver.add(Or(Not(occupied_pair), dr(i, j) >= 0))
            solver.add(Or(Not(occupied_pair), dr(i, j) > 0))
    else:
        for a, b in combinations(ROLES, 2):
            solver.add(d(a, b) >= 0)
    assert rank_cells == 231  # C(22,2) rank-indexed off-diagonal cells.
    # Physical identity is exactly compressed-rank equality and zero metric.
    for a, b in combinations(ROLES, 2):
        solver.add((ranks[a] == ranks[b]) == (d(a, b) == 0))
    if not rank_indexed_metric:
        # Explicit role metrics must respect physical aliases.  This is the
        # finite congruence packet supplied automatically by the rank-indexed
        # function in the eager model.
        for a, b in combinations(ROLES, 2):
            for c in ROLES:
                if c == a or c == b:
                    continue
                solver.add(Or(ranks[a] != ranks[b], d(a, c) == d(b, c)))

    def positive_pairs(points):
        for a, b in combinations(points, 2):
            solver.add(d(a, b) > 0)

    source_shell = ("qOutside", "qBetween", "canonicalSource", "c2")
    fresh_shell = ("qOutside", "qBetween", "f1", "f2")
    positive_pairs(source_shell)
    positive_pairs(fresh_shell)
    positive_pairs(ROW)
    positive_pairs(DROW)
    solver.add(d("sourceCenter", "qOutside") > 0)
    solver.add(d("freshCenter", "qOutside") > 0)
    for support, center in ((source_shell, "sourceCenter"), (fresh_shell, "freshCenter")):
        for point in support[1:]:
            solver.add(d(center, point) == d(center, support[0]))
        solver.add(d(center, support[0]) > 0)

    # Outside witnesses are external to the six-point seed.
    for outside in ("w0", "e0"):
        for seed in SEED:
            solver.add(d(outside, seed) > 0)

    # Symbolic row aliases: rank equality/d=0 itself is the selector.  Each
    # row point may alias zero or one seed role, and at most three positions
    # may alias the six-point seed.  Cross-row aliases remain permitted.
    for prefix in ("w", "e"):
        aliases = {
            (i, seed): d(f"{prefix}{i}", seed) == 0
            for i in range(1, 4)
            for seed in SEED
        }
        for i in range(1, 4):
            solver.add(Sum([If(aliases[i, seed], 1, 0) for seed in SEED]) <= 1)
        solver.add(
            Sum([If(aliases[i, seed], 1, 0) for i in range(1, 4) for seed in SEED]) <= 3
        )
        for seed in SEED:
            solver.add(Sum([If(aliases[i, seed], 1, 0) for i in range(1, 4)]) <= 1)

    # Pinned center is exactly one of the six seed points and is excluded
    # from the K row support.
    solver.add(Sum([If(d("pinnedCenter", seed) == 0, 1, 0) for seed in SEED]) == 1)
    for point in ROW:
        solver.add(d("pinnedCenter", point) > 0)
    solver.add(d("pinnedCenter", "sourceCenter") > 0)
    solver.add(d("pinnedCenter", "freshCenter") > 0)
    solver.add(Sum([If(d("drowCenter", seed) == 0, 1, 0) for seed in ("qOutside", "qBetween")]) == 1)
    for seed in SEED:
        if seed not in ("qOutside", "qBetween"):
            solver.add(d("drowCenter", seed) > 0)
    for point in DROW:
        solver.add(d("drowCenter", point) > 0)

    # Every occupied rank triple gets the conditional strict triangle packet;
    # role triples with tied ranks are intentionally outside this guard.
    if eager_geometry and not rank_indexed_metric:
        raise ValueError("eager geometry requires rank_indexed_metric=True")
    if eager_geometry:
        for i, j, k in combinations(range(rank_bound), 3):
            guard = And(occupied[i], occupied[j], occupied[k])
            solver.add(Or(Not(guard), dr(i, j) + dr(j, k) > dr(i, k)))
            solver.add(Or(Not(guard), dr(i, j) + dr(i, k) > dr(j, k)))
            solver.add(Or(Not(guard), dr(i, k) + dr(j, k) > dr(i, j)))

    # Fix the source arm as a compressed cyclic rank order.
    for a, b in zip(order, order[1:]):
        solver.add(ranks[a] < ranks[b])

    # Both cyclic Kalmanson inequalities once for each increasing occupied
    # rank quadruple.  Gaps are harmless: an unoccupied index disables the
    # packet, while role metrics always select the same rank-indexed cells.
    rank_quadruples = 0
    for i, j, k, e in combinations(range(rank_bound), 4):
        rank_quadruples += 1
        if eager_geometry:
            guard = And(occupied[i], occupied[j], occupied[k], occupied[e])
            rhs = dr(i, k) + dr(j, e)
            solver.add(Or(Not(guard), dr(j, k) + dr(i, e) < rhs))
            solver.add(Or(Not(guard), dr(i, j) + dr(k, e) < rhs))

    # Symbolic blocker shells.  ``contains[z,j]`` means W-point j lies in
    # blocker z's exact shell support; no partition/intersection fan is
    # expanded.  The rank identity relation chooses equal centres directly.
    contains = {(z, j): Bool(f"shell_{z}_contains_w{j}") for z in range(4) for j in range(4)}
    assert len(contains) == 16  # Four symbolic blocker shells, four W positions each.
    radii = {z: Real(f"blocker_radius_{z}") for z in range(4)}
    for z in range(4):
        solver.add(radii[z] > 0)
        solver.add(contains[z, z])  # each blocker contains its named wi
        for j, point in enumerate(ROW):
            # All W roles are carrier points, so membership in the exact
            # critical shell is equivalent to equality with its radius.
            solver.add(contains[z, j] == (d(f"b{z}", point) == radii[z]))
        collision = d(f"b{z}", "pinnedCenter") == 0
        # Collision arm: exact K support.  Noncollision arm: at most two W
        # points in the shell.
        solver.add(Or(Not(collision), And(*[contains[z, j] for j in range(4)])))
        solver.add(Or(collision, Sum([If(contains[z, j], 1, 0) for j in range(4)]) <= 2))
        # Source no-qfree consequence: every represented row centered at b_z
        # contains its own z-indexed point.
        solver.add(Or(d(f"b{z}", "pinnedCenter") != 0, contains[z, z]))
        solver.add(Or(d(f"b{z}", "drowCenter") != 0, contains[z, z]))
    # Equal non-pinned blocker centres give reciprocal containment only; they
    # do not force full canonical support equality.
    for z, w in combinations(range(4), 2):
        equal_nonpinned = And(d(f"b{z}", f"b{w}") == 0, d(f"b{z}", "pinnedCenter") > 0)
        solver.add(Or(Not(equal_nonpinned), And(contains[z, w], contains[w, z])))

    # Source-faithful indexed-cap abstraction.  Every canonical blocker lies
    # in exactly one strict cap interior.  An arbitrary carrier point belongs
    # to one closed cap (a non-Moser point) or two (a Moser vertex).
    blocker_cap = {
        (z, k): Bool(f"blocker{z}_interior_cap{k}")
        for z in range(4) for k in range(3)
    }
    source_cap = {
        (z, k): Bool(f"w{z}_in_closed_cap{k}")
        for z in range(4) for k in range(3)
    }
    for z in range(4):
        solver.add(Sum([If(blocker_cap[z, k], 1, 0) for k in range(3)]) == 1)
        source_cap_count = Sum([If(source_cap[z, k], 1, 0) for k in range(3)])
        solver.add(1 <= source_cap_count, source_cap_count <= 2)
    # Equal physical blockers have the same unique interior-cap label.
    for z, w in combinations(range(4), 2):
        for k in range(3):
            solver.add(
                Or(
                    d(f"b{z}", f"b{w}") > 0,
                    blocker_cap[z, k] == blocker_cap[w, k],
                )
            )
    # `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair`,
    # with survival rewritten by
    # `cross_deletion_survives_iff_not_mem_selected_support`.
    cross_deletion_clauses = 0
    for z, w in combinations(range(4), 2):
        for k in range(3):
            cross_deletion_clauses += 1
            solver.add(
                Or(
                    d(f"b{z}", f"b{w}") == 0,
                    Not(blocker_cap[z, k]),
                    Not(blocker_cap[w, k]),
                    source_cap[z, k],
                    source_cap[w, k],
                    Not(contains[z, w]),
                    Not(contains[w, z]),
                )
            )
    cross_deletion_status = f"encoded_exactly:{cross_deletion_clauses}_clauses"
    stats = {
        "roles": len(ROLES),
        "distance_cells": rank_cells,
        "role_pair_metric_ties": len(ROLES) * (len(ROLES) - 1) // 2,
        "rank_vars": len(ranks),
        "branch_count": 0,
        "shell_boolean_count": len(contains),
        "cap_boolean_count": len(blocker_cap) + len(source_cap),
        "triangle_rank_triples": rank_bound * (rank_bound - 1) * (rank_bound - 2) // 6,
        "kalmanson_rank_quadruples": rank_quadruples,
        "kalmanson_inequalities": 2 * rank_quadruples,
        "cross_deletion_clause": cross_deletion_status,
        "assertions": len(solver.assertions()),
    }
    context = {
        "ranks": ranks,
        "distance": distance,
        "role_distance": None if rank_indexed_metric else role_distance,
        "metric": d,
        "contains": contains,
        "blocker_radii": radii,
        "blocker_cap": blocker_cap,
        "source_cap": source_cap,
        "metric_mode": "rank_indexed" if rank_indexed_metric else "role_pair",
        "occupied": occupied,
        "rank_bound": rank_bound,
    }
    return solver, stats, context


def main():
    started = monotonic()
    order = next(iter(ORDER_ARMS.values()))
    solver, stats, _context = build_arm(order, timeout_ms=5000)
    build_seconds = monotonic() - started
    result = solver.check()
    lines = [
        "arm=outside_fresh_between_source_canonical/offEndpoint",
        f"result={result}",
        f"build_seconds={build_seconds:.3f}",
        f"stats={stats}",
        "self_checks=6 seed roles; 22 carriers; 231 rank-distance cells and role-pair ties; symbolic <=3 alias counters; 16 exact-shell booleans; 24 source-faithful cap booleans; rank<->identity<->d0; occupancy-guarded triangles; 2*C(22,4) Kalmanson inequalities; 18 cross-deletion clauses",
        "omissions=cap incidence tying W roles to aliased named seed roles; row-cap inside/outside cardinalities; source Lean ingress/lift; remaining three order arms; no universal theorem claim",
        "model_gaps=smoke checks one arm with a 5s solver timeout; unknown is not UNSAT; closed-cap memberships are a sound 1-or-2 membership abstraction, not a full cyclic-cap realization",
    ]
    print("\n".join(lines))
    result_path = Path(__file__).with_suffix(".results.txt")
    result_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    if result not in (sat, unknown):
        raise SystemExit("unexpected solver result")


if __name__ == "__main__":
    main()
