#!/usr/bin/env python3
"""Full-carrier QF_NRA model for sameBlockerCommonOmission at n = 17.

The cheap gate is deliberately solver-free:

    model.py --self-check --branch-count-only

Actual solving is opt-in, bounded, and diagnostic-only.  The discrete branch
space records both geometric choices and proof-witness choices whose formulas
coincide once the exact common support is fixed.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Iterator


APICES = ("a1", "a2", "a3")
FIRST_INTERIOR = ("p1", "p2", "r1", "r2", "q1", "q2")
SECOND_INTERIOR = ("s1", "s2", "s3", "s4")
THIRD_INTERIOR = ("t1", "t2", "t3", "t4")
CARRIER = (*APICES, *FIRST_INTERIOR, *SECOND_INTERIOR, *THIRD_INTERIOR)

# Closed cap opposite a1 and its carrier complement.  In a cyclic branch the
# other two caps are {a3, s*, a1} and {a1, t*, a2}.
FIRST_CAP = ("a2", *FIRST_INTERIOR, "a3")
OUTSIDE_FIRST_CAP = ("a1", *SECOND_INTERIOR, *THIRD_INTERIOR)
P_ENDPOINTS = ("p1", "p2")
R_ENDPOINTS = ("r1", "r2")
COLLISION_ENDPOINTS = (*P_ENDPOINTS, *R_ENDPOINTS)

# Exact source-permitted aliases after the n=17 profile exhausts the six-point
# first strict interior.  The three blocker values must be pairwise distinct.
BLOCKER_OPTIONS = {
    "bp": ("r1", "r2", "q1", "q2"),
    "br": ("p1", "p2", "q1", "q2"),
    "bq": ("p1", "p2", "r1", "r2"),
}


@dataclass(frozen=True)
class Branch:
    blocker_aliases: tuple[tuple[str, str], ...]
    common_outside_support: tuple[str, str]
    first_order: tuple[str, ...]
    second_order: tuple[str, ...]
    third_order: tuple[str, ...]

    @property
    def aliases(self) -> dict[str, str]:
        return dict(self.blocker_aliases)

    @property
    def cyclic_order(self) -> tuple[str, ...]:
        # Counterclockwise anchor: a1 -- third cap -- a2 -- first cap -- a3
        # -- second cap -- back to a1.
        return (
            "a1",
            *self.third_order,
            "a2",
            *self.first_order,
            "a3",
            *self.second_order,
        )

    @property
    def common_support(self) -> tuple[str, ...]:
        return ("q1", "q2", *self.common_outside_support)


def blocker_alias_maps() -> Iterator[dict[str, str]]:
    for bp, br, bq in itertools.product(
        BLOCKER_OPTIONS["bp"],
        BLOCKER_OPTIONS["br"],
        BLOCKER_OPTIONS["bq"],
    ):
        aliases = {"bp": bp, "br": br, "bq": bq}
        if len(set(aliases.values())) == 3:
            yield aliases


def branch_factors() -> dict[str, int]:
    aliases = sum(1 for _ in blocker_alias_maps())
    support_pairs = math.comb(len(OUTSIDE_FIRST_CAP), 2)
    cyclic_orders = (
        math.factorial(len(FIRST_INTERIOR))
        * math.factorial(len(SECOND_INTERIOR))
        * math.factorial(len(THIRD_INTERIOR))
    )
    geometric = aliases * support_pairs * cyclic_orders
    # The exact support excludes all four collision endpoints.  Lean's packets
    # nevertheless retain one chosen omission in each of four cross-pair views,
    # plus a chosen common omitted endpoint.  These labels do not change QF_NRA.
    source_view_witnesses = 2**4
    common_omission_witnesses = len(COLLISION_ENDPOINTS)
    provenance = geometric * source_view_witnesses * common_omission_witnesses
    return {
        "blocker_alias_maps": aliases,
        "common_outside_support_pairs": support_pairs,
        "cap_compatible_cyclic_orders": cyclic_orders,
        "geometric_qf_nra_branches": geometric,
        "source_view_witness_labels_per_geometric_branch": source_view_witnesses,
        "common_omission_witness_labels_per_geometric_branch": common_omission_witnesses,
        "provenance_labeled_branches": provenance,
    }


def structural_self_check() -> dict[str, object]:
    assert len(CARRIER) == 17 and len(set(CARRIER)) == 17
    assert len(FIRST_CAP) == 8 and len(set(FIRST_CAP)) == 8
    assert len(SECOND_INTERIOR) + 2 == 6
    assert len(THIRD_INTERIOR) + 2 == 6
    assert set(FIRST_INTERIOR).isdisjoint(OUTSIDE_FIRST_CAP)
    assert set(FIRST_CAP).isdisjoint(OUTSIDE_FIRST_CAP)
    assert set(FIRST_CAP) | set(OUTSIDE_FIRST_CAP) == set(CARRIER)

    aliases = list(blocker_alias_maps())
    assert aliases
    for alias in aliases:
        assert alias["bq"] in ("p1", "p2", "r1", "r2")
        assert all(value in FIRST_INTERIOR for value in alias.values())
        assert len(set(alias.values())) == 3
        assert alias["bp"] not in P_ENDPOINTS
        assert alias["br"] not in R_ENDPOINTS
        assert alias["bq"] not in ("q1", "q2")

    pairs = list(itertools.combinations(OUTSIDE_FIRST_CAP, 2))
    assert len(pairs) == math.comb(9, 2)
    for pair in pairs:
        support = {"q1", "q2", *pair}
        assert len(support) == 4
        assert support & set(FIRST_CAP) == {"q1", "q2"}
        assert set(COLLISION_ENDPOINTS).isdisjoint(support)

    factors = branch_factors()
    assert factors["blocker_alias_maps"] == len(aliases)
    assert factors["common_outside_support_pairs"] == len(pairs)
    return {
        "status": "SELF_CHECK_OK",
        "mode": "branch-count-only",
        "solver_imported": False,
        "solver_invoked": False,
        "common_support_omits_all_collision_endpoints": True,
        "common_omission_existential_redundant": True,
        "carrier_card": len(CARRIER),
        "closed_cap_profile": [6, 8, 6],
        "strict_interior_profile": [4, 6, 4],
        "first_strict_interior": list(FIRST_INTERIOR),
        "outside_first_closed_cap": list(OUTSIDE_FIRST_CAP),
        "branch_factors": factors,
    }


def priority_branches() -> Iterable[Branch]:
    """Yield a deterministic bounded prefix; never materialize the branch space."""
    first_orders = (
        FIRST_INTERIOR,
        ("p1", "q1", "p2", "r1", "q2", "r2"),
    )
    second_orders = (SECOND_INTERIOR,)
    third_orders = (THIRD_INTERIOR,)
    for aliases in blocker_alias_maps():
        for outside_pair in itertools.combinations(OUTSIDE_FIRST_CAP, 2):
            for first_order, second_order, third_order in itertools.product(
                first_orders, second_orders, third_orders
            ):
                yield Branch(
                    tuple(aliases.items()),
                    outside_pair,
                    tuple(first_order),
                    tuple(second_order),
                    tuple(third_order),
                )


def all_branches() -> Iterable[Branch]:
    for aliases in blocker_alias_maps():
        for outside_pair in itertools.combinations(OUTSIDE_FIRST_CAP, 2):
            for first_order, second_order, third_order in itertools.product(
                itertools.permutations(FIRST_INTERIOR),
                itertools.permutations(SECOND_INTERIOR),
                itertools.permutations(THIRD_INTERIOR),
            ):
                yield Branch(
                    tuple(aliases.items()),
                    outside_pair,
                    first_order,
                    second_order,
                    third_order,
                )


def build_case(branch: Branch, timeout_ms: int):
    # Lazy import is part of the non-solving gate: self-check does not load Z3.
    import z3

    raw = {name: z3.Reals(f"{name}_x {name}_y") for name in CARRIER}
    aliases = branch.aliases
    points = {**raw, **{name: raw[value] for name, value in aliases.items()}}
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)

    def sqdist(u: str, v: str):
        ux, uy = points[u]
        vx, vy = points[v]
        return (ux - vx) ** 2 + (uy - vy) ** 2

    def orient(a: str, b: str, c: str):
        ax, ay = points[a]
        bx, by = points[b]
        cx, cy = points[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    # Similarity gauge and exact full-carrier strict convex order.
    solver.add(raw["a1"][0] == 0, raw["a1"][1] == 0)
    solver.add(raw["a2"][0] == 1, raw["a2"][1] == 0)
    order = branch.cyclic_order
    assert len(order) == 17 and set(order) == set(CARRIER)
    for i, j, k in itertools.combinations(range(len(order)), 3):
        solver.add(orient(order[i], order[j], order[k]) > 0)

    # Promoted non-obtuse Moser triangle and common MEC disk.
    d12, d13, d23 = sqdist("a1", "a2"), sqdist("a1", "a3"), sqdist("a2", "a3")
    solver.add(d12 + d13 >= d23, d12 + d23 >= d13, d13 + d23 >= d12)
    mec_x, mec_y, mec_r2 = z3.Reals("mec_x mec_y mec_r2")

    def mec_sq(name: str):
        x, y = raw[name]
        return (x - mec_x) ** 2 + (y - mec_y) ** 2

    solver.add(mec_r2 > 0)
    for apex in APICES:
        solver.add(mec_sq(apex) == mec_r2)
    for name in CARRIER:
        solver.add(mec_sq(name) <= mec_r2)

    # The three strict-first-cap source pairs lie on three distinct positive
    # first-apex radii.  At the exact six-point interior this realizes the two
    # retained collision pairs and the fresh common-radius pair.
    dp, dr, dq = sqdist("a1", "p1"), sqdist("a1", "r1"), sqdist("a1", "q1")
    solver.add(dp > 0, dr > 0, dq > 0)
    solver.add(dp == sqdist("a1", "p2"))
    solver.add(dr == sqdist("a1", "r2"))
    solver.add(dq == sqdist("a1", "q2"))
    solver.add(dp != dr, dp != dq, dr != dq)

    # Both q-source rows have the same actual blocker.  Mutual cross-membership
    # forces the same radius; exact critical shells therefore have one common
    # carrier-wide distance class {q1,q2,u,v}.  Equalities and all complementary
    # disequalities encode CriticalFourShell.support_eq, not a chosen subset.
    support = set(branch.common_support)
    row_r2 = sqdist("bq", "q1")
    solver.add(row_r2 > 0)
    for name in CARRIER:
        if name in support:
            solver.add(sqdist("bq", name) == row_r2)
        else:
            solver.add(sqdist("bq", name) != row_r2)

    metadata = {
        "blocker_aliases": aliases,
        "cyclic_order": list(order),
        "common_support": list(branch.common_support),
        "support_inter_first_closed_cap": ["q1", "q2"],
        "canonical_common_omission_witness": "p1",
        "canonical_source_view_witnesses": {
            "q1": {"p_pair": "p1", "r_pair": "r1"},
            "q2": {"p_pair": "p1", "r_pair": "r1"},
        },
    }
    return solver, raw, metadata, z3


def solve_bounded(max_cases: int, timeout_ms: int, exhaustive: bool) -> dict[str, object]:
    if max_cases <= 0:
        raise ValueError("--solve requires a positive --max-cases bound")
    if timeout_ms <= 0 or timeout_ms > 10_000:
        raise ValueError("--timeout-ms must be in 1..10000")
    branches = all_branches() if exhaustive else priority_branches()
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    unknown_reasons: dict[str, int] = {}
    first_sat = None
    checked = 0
    solver_version = None
    for branch in itertools.islice(branches, max_cases):
        solver, raw, metadata, z3 = build_case(branch, timeout_ms)
        solver_version = z3.get_version_string()
        status = solver.check()
        checked += 1
        counts[str(status)] += 1
        if status == z3.unknown:
            reason = solver.reason_unknown()
            unknown_reasons[reason] = unknown_reasons.get(reason, 0) + 1
        if status == z3.sat:
            model = solver.model()
            metadata["coordinates"] = {
                name: [
                    str(model.eval(raw[name][0], model_completion=True)),
                    str(model.eval(raw[name][1], model_completion=True)),
                ]
                for name in CARRIER
            }
            first_sat = metadata
            break
    return {
        "verdict": "SAT" if first_sat else "UNKNOWN",
        "classification": "bounded external diagnostic; never theorem closure",
        "logic": "QF_NRA",
        "solver": f"Z3 {solver_version}" if solver_version else None,
        "timeout_ms_per_case": timeout_ms,
        "requested_case_bound": max_cases,
        "branches_checked": checked,
        "complete_geometric_branch_exhaustion": False,
        "branch_factors": branch_factors(),
        "counts": counts,
        "unknown_reasons": unknown_reasons,
        "first_sat_model": first_sat,
    }


def render(data: dict[str, object], output: Path | None) -> None:
    text = json.dumps(data, indent=2, sort_keys=True)
    if output is not None:
        output.write_text(text + "\n")
    print(text)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--branch-count-only", action="store_true")
    parser.add_argument("--solve", action="store_true")
    parser.add_argument("--max-cases", type=int, default=0)
    parser.add_argument("--timeout-ms", type=int, default=250)
    parser.add_argument("--all-branches", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.self_check or args.branch_count_only:
        if not (args.self_check and args.branch_count_only) or args.solve:
            parser.error("the non-solving gate is exactly --self-check --branch-count-only")
        render(structural_self_check(), args.output)
        return 0
    if not args.solve:
        parser.error("choose --self-check --branch-count-only or explicit --solve")
    render(
        solve_bounded(args.max_cases, args.timeout_ms, args.all_branches),
        args.output,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
