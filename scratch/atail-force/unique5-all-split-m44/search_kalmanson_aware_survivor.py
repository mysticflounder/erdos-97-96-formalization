#!/usr/bin/env python3
"""Search a fixed-card-15 closed-subcarrier abstraction with Kalmanson.

This is a theorem-discovery regression, not a Euclidean realization.  It keeps
the complete finite radius-partition semantics used by the predecessor model,
adds the source-valid cap row bounds and shared-pair alternation, and asks for
one exact rational strict Kalmanson metric for all represented radius classes.

This is not a source-valid coverage model of the live residual: it identifies
the 15 roles with the entire carrier and keeps every selected row inside that
set.  Use it only as a fixed-card theorem-discovery regression.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


N = 15
V = tuple(range(N))
FIRST_APEX = 0
PHYSICAL_APEX = 1
THIRD_APEX = 2

SURPLUS_CAP = frozenset({0, 1, 5, 6, 7})
FIRST_OPP_CAP = frozenset({1, 2, 3, 8, 9, 10})
PHYSICAL_CAP = frozenset({2, 0, 4, 11, 12, 13, 14})
CAPS = (SURPLUS_CAP, FIRST_OPP_CAP, PHYSICAL_CAP)
CAP_ENDPOINTS = ({0, 1}, {1, 2}, {2, 0})

# This is one of the cap-compatible orders on which the predecessor's fixed
# row table fails shared-pair alternation.  Finding one different model here
# is enough to show that failure is not forced by the source abstraction.
ORDER = (0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 11, 14, 12, 4, 13)
POS = {point: index for index, point in enumerate(ORDER)}

EXACT_FIVE = frozenset({5, 8, 11, 12, 13})
PHYSICAL_SOURCES = (11, 12, 13)
SUCCESSOR = {11: 12, 12: 13, 13: 11}
ELIGIBLE_OUTSIDE = tuple(sorted(set(V) - PHYSICAL_CAP - EXACT_FIVE))


def cyclic_between(left: int, point: int, right: int) -> bool:
    return 0 < (POS[point] - POS[left]) % N < (POS[right] - POS[left]) % N


def alternates(c: int, d: int, a: int, b: int) -> bool:
    return cyclic_between(c, a, d) != cyclic_between(c, b, d)


def strict_between_on_physical(left: int, middle: int, right: int) -> bool:
    physical_order = tuple(x for x in ORDER if x in PHYSICAL_CAP)
    position = {x: i for i, x in enumerate(physical_order)}
    lo, hi = sorted((position[left], position[right]))
    return lo < position[middle] < hi


def pair_key(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def build(
    timeout_ms: int,
    seed: int,
    *,
    with_metric: bool = True,
    first_apex_mode: str = "two-exact-four",
):
    if first_apex_mode not in {"two-exact-four", "one-large"}:
        raise ValueError(f"unknown first-apex mode: {first_apex_mode}")
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=seed)

    member = {(c, p): z3.Bool(f"m_{c}_{p}") for c in V for p in V}
    blocker = {(s, c): z3.Bool(f"b_{s}_{c}") for s in V for c in V}
    class0a = {p: z3.Bool(f"a0_{p}") for p in V}
    class0b = {p: z3.Bool(f"b0_{p}") for p in V}

    # One selected exact four-class at every non-physical-apex center.  At the
    # first apex, robustness is represented by either two disjoint exact
    # four-classes or one complete class of cardinality at least five.  At the
    # physical apex the row is a selected four-subset of the complete exact
    # five-class.
    for c in V:
        solver.add(z3.Not(member[c, c]))
        solver.add(z3.PbEq([(member[c, p], 1) for p in V], 4))
    for p in V:
        if first_apex_mode == "two-exact-four":
            solver.add(member[FIRST_APEX, p] == class0a[p])
        else:
            solver.add(z3.Implies(member[FIRST_APEX, p], class0a[p]))
            solver.add(z3.Not(class0b[p]))
        solver.add(z3.Not(z3.And(class0a[p], class0b[p])))
        if p == FIRST_APEX:
            solver.add(z3.Not(class0a[p]), z3.Not(class0b[p]))
        solver.add(member[PHYSICAL_APEX, p] == (p in EXACT_FIVE and p != 5))
    if first_apex_mode == "two-exact-four":
        solver.add(z3.PbEq([(class0a[p], 1) for p in V], 4))
        solver.add(z3.PbEq([(class0b[p], 1) for p in V], 4))
    else:
        solver.add(z3.PbGe([(class0a[p], 1) for p in V], 5))

    # Circle intersections and cap-local selected-class bounds.
    def in_same_class(center: int, a: int, b: int):
        if center == FIRST_APEX:
            return z3.Or(
                z3.And(class0a[a], class0a[b]),
                z3.And(class0b[a], class0b[b]),
            )
        if center == PHYSICAL_APEX:
            return z3.BoolVal(a in EXACT_FIVE and b in EXACT_FIVE)
        return z3.And(member[center, a], member[center, b])

    def center_classes(center: int):
        if center == FIRST_APEX:
            classes = [tuple(class0a[p] for p in V)]
            if first_apex_mode == "two-exact-four":
                classes.append(tuple(class0b[p] for p in V))
            return tuple(classes)
        if center == PHYSICAL_APEX:
            return (tuple(z3.BoolVal(p in EXACT_FIVE) for p in V),)
        return (tuple(member[center, p] for p in V),)

    for c, d in itertools.combinations(V, 2):
        for c_class in center_classes(c):
            for d_class in center_classes(d):
                solver.add(
                    z3.PbLe(
                        [(z3.And(c_class[p], d_class[p]), 1) for p in V],
                        2,
                    )
                )

    for a, b in itertools.combinations(V, 2):
        hits = [in_same_class(c, a, b) for c in V]
        solver.add(z3.PbLe([(hit, 1) for hit in hits], 2))
        for c, d in itertools.combinations(V, 2):
            if not alternates(c, d, a, b):
                solver.add(z3.Not(z3.And(hits[c], hits[d])))

    for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
        for c in cap:
            bound = 1 if c in endpoints else 2
            solver.add(z3.PbLe([(member[c, p], 1) for p in cap], bound))
            if c == FIRST_APEX:
                solver.add(z3.PbLe([(class0a[p], 1) for p in cap], bound))
                solver.add(z3.PbLe([(class0b[p], 1) for p in cap], bound))

    # Total source-faithful blocker map, omitting both robust apices.
    for source in V:
        allowed = tuple(c for c in V if c not in {source, 0, 1})
        solver.add(z3.PbEq([(blocker[source, c], 1) for c in allowed], 1))
        for c in V:
            if c not in allowed:
                solver.add(z3.Not(blocker[source, c]))
            else:
                solver.add(z3.Implies(blocker[source, c], member[c, source]))

    # Exact-five global all-reverse transition.  The successor blocker lies
    # between the adjacent physical sources, its row has the exact 2+2 split,
    # and each source's own row omits its successor.
    for source in PHYSICAL_SOURCES:
        successor = SUCCESSOR[source]
        allowed_centers = tuple(
            c for c in PHYSICAL_CAP - {source, successor}
            if strict_between_on_physical(source, c, successor)
        )
        solver.add(z3.Or(*(blocker[successor, c] for c in allowed_centers)))
        for c in V:
            if c not in allowed_centers:
                solver.add(z3.Not(blocker[successor, c]))
            else:
                solver.add(z3.Implies(blocker[successor, c], member[c, source]))
                for p in PHYSICAL_CAP:
                    solver.add(
                        z3.Implies(
                            blocker[successor, c],
                            member[c, p] == z3.BoolVal(p in {source, successor}),
                        )
                    )
                for p in EXACT_FIVE - PHYSICAL_CAP:
                    solver.add(z3.Implies(blocker[successor, c], z3.Not(member[c, p])))
                solver.add(
                    z3.Implies(blocker[successor, c], member[c, source])
                )
        for c in V:
            solver.add(
                z3.Implies(blocker[source, c], z3.Not(member[c, successor]))
            )

    # Every reverse outside pair is split across the first-apex radius colors.
    for source in PHYSICAL_SOURCES:
        successor = SUCCESSOR[source]
        for c in V:
            solver.add(
                z3.Implies(
                    blocker[successor, c],
                    z3.PbLe(
                        [(z3.And(member[c, p], class0a[p]), 1)
                         for p in ELIGIBLE_OUTSIDE],
                        1,
                    ),
                )
            )
            if first_apex_mode == "two-exact-four":
                solver.add(
                    z3.Implies(
                        blocker[successor, c],
                        z3.PbLe(
                            [(z3.And(member[c, p], class0b[p]), 1)
                             for p in ELIGIBLE_OUTSIDE],
                            1,
                        ),
                    )
                )

    # Strong connectivity of the chosen row graph, the exact production
    # consequence of cardinal minimality used by the predecessor audit.
    for size in range(1, N):
        for subset_tuple in itertools.combinations(V, size):
            subset = frozenset(subset_tuple)
            complement = tuple(p for p in V if p not in subset)
            solver.add(z3.Or(*(member[c, p] for c in subset for p in complement)))

    if not with_metric:
        return solver, member, blocker, class0a, class0b, {}

    # One common exact rational strict-Kalmanson metric for every represented
    # complete class.  All unlisted radii are forced singleton, matching the
    # predecessor's complete-partition semantics.
    distance = {pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
                for pair in itertools.combinations(V, 2)}
    radius = {c: z3.Real(f"r_{c}") for c in V if c not in {0, 1}}
    r0a, r0b, r1 = z3.Reals("r0a r0b r1")

    def dist(a: int, b: int):
        return z3.RealVal(0) if a == b else distance[pair_key(a, b)]

    def apart(x, y):
        return z3.Or(x >= y + 1, y >= x + 1)

    for value in distance.values():
        solver.add(value >= 1)
    for a, b, c in itertools.combinations(V, 3):
        solver.add(dist(a, b) + dist(b, c) >= dist(a, c) + 1)
        solver.add(dist(a, b) + dist(a, c) >= dist(b, c) + 1)
        solver.add(dist(a, c) + dist(b, c) >= dist(a, b) + 1)
    for ia, ib, ic, id_ in itertools.combinations(range(N), 4):
        a, b, c, d = (ORDER[i] for i in (ia, ib, ic, id_))
        diagonal = dist(a, c) + dist(b, d)
        solver.add(diagonal >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonal >= dist(a, d) + dist(b, c) + 1)

    solver.add(r0a >= 1, r0b >= 1, r1 >= 1, apart(r0a, r0b))
    for c in radius:
        solver.add(radius[c] >= 1)

    for p in V:
        if p != FIRST_APEX:
            solver.add(z3.Implies(class0a[p], dist(0, p) == r0a))
            solver.add(z3.Implies(class0b[p], dist(0, p) == r0b))
            solver.add(
                z3.Implies(
                    z3.And(z3.Not(class0a[p]), z3.Not(class0b[p])),
                    z3.And(apart(dist(0, p), r0a), apart(dist(0, p), r0b)),
                )
            )
        if p != PHYSICAL_APEX:
            solver.add(dist(1, p) == r1 if p in EXACT_FIVE else apart(dist(1, p), r1))
        for c in radius:
            if p == c:
                continue
            solver.add(z3.Implies(member[c, p], dist(c, p) == radius[c]))
            solver.add(z3.Implies(z3.Not(member[c, p]), apart(dist(c, p), radius[c])))

    # Make every unrepresented class a singleton.  This ensures blocker-row
    # exactness really gives deletion criticality, rather than merely naming
    # one selected four-subset while another K4 class survives.
    for c in V:
        points = tuple(p for p in V if p != c)
        for p, q in itertools.combinations(points, 2):
            if c == 0:
                outside = z3.And(
                    z3.Not(class0a[p]), z3.Not(class0b[p]),
                    z3.Not(class0a[q]), z3.Not(class0b[q]),
                )
            elif c == 1:
                if p in EXACT_FIVE or q in EXACT_FIVE:
                    continue
                outside = z3.BoolVal(True)
            else:
                outside = z3.And(z3.Not(member[c, p]), z3.Not(member[c, q]))
            solver.add(z3.Implies(outside, apart(dist(c, p), dist(c, q))))

    return solver, member, blocker, class0a, class0b, distance


def decode(
    model,
    member,
    blocker,
    class0a,
    class0b,
    distance,
    *,
    first_apex_mode: str,
):
    rows = {
        str(c): [p for p in V if z3.is_true(model.eval(member[c, p], model_completion=True))]
        for c in V
    }
    blockers = {
        str(s): next(c for c in V if z3.is_true(model.eval(blocker[s, c], model_completion=True)))
        for s in V
    }
    return {
        "status": "SAT_VERIFIED_STRICT_KALMANSON_SHADOW",
        "epistemic_status": "EXACT_QF_LRA_FIXED_CARD_15_CLOSED_CARRIER_NOT_LIVE_COVERAGE_NOT_EUCLIDEAN_NOT_LEAN",
        "order": list(ORDER),
        "caps": [sorted(cap) for cap in CAPS],
        "exact_five": sorted(EXACT_FIVE),
        "first_apex_mode": first_apex_mode,
        "first_apex_classes": [
            [p for p in V if z3.is_true(model.eval(class0a[p], model_completion=True))],
            [p for p in V if z3.is_true(model.eval(class0b[p], model_completion=True))],
        ],
        "rows": rows,
        "blockers": blockers,
        "distances": {
            f"{a},{b}": str(model.eval(value, model_completion=True))
            for (a, b), value in distance.items()
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--structural-only", action="store_true")
    parser.add_argument("--fixed-structure", type=Path)
    parser.add_argument(
        "--first-apex-mode",
        choices=("two-exact-four", "one-large"),
        default="two-exact-four",
    )
    args = parser.parse_args()
    solver, member, blocker, class0a, class0b, distance = build(
        args.timeout_ms,
        args.seed,
        with_metric=not args.structural_only,
        first_apex_mode=args.first_apex_mode,
    )
    if args.fixed_structure is not None:
        fixed = json.loads(args.fixed_structure.read_text(encoding="utf-8"))
        fixed_rows = {int(c): set(row) for c, row in fixed["rows"].items()}
        fixed_blockers = {int(s): c for s, c in fixed["blockers"].items()}
        fixed_a, fixed_b = map(set, fixed["first_apex_classes"])
        for c in V:
            for p in V:
                solver.add(member[c, p] == z3.BoolVal(p in fixed_rows[c]))
                solver.add(blocker[c, p] == z3.BoolVal(fixed_blockers[c] == p))
            solver.add(class0a[c] == z3.BoolVal(c in fixed_a))
            solver.add(class0b[c] == z3.BoolVal(c in fixed_b))
    verdict = solver.check()
    if verdict == z3.sat:
        payload = decode(
            solver.model(),
            member,
            blocker,
            class0a,
            class0b,
            distance,
            first_apex_mode=args.first_apex_mode,
        )
        if args.structural_only:
            payload["status"] = "SAT_VERIFIED_STRUCTURAL_SHADOW"
            payload["epistemic_status"] = (
                "EXACT_FIXED_CARD_15_CLOSED_CARRIER_INCIDENCE_NOT_LIVE_COVERAGE_NOT_METRIC"
            )
    else:
        payload = {
            "status": str(verdict).upper(),
            "reason": solver.reason_unknown() if verdict == z3.unknown else None,
            "epistemic_status": "FIXED_CARD_15_CLOSED_CARRIER_DECISION_NOT_LIVE_COVERAGE_NOT_LEAN",
            "order": list(ORDER),
        }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
