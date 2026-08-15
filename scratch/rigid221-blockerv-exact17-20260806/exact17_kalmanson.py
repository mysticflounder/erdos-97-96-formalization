"""Exact QF_LRA probe for the exact-17 BlockerV perfect-partition branch.

At second-cap size nine, failure of the exact-16 deletion reduction forces the
four source rows' two-point outside slices to partition the eight outside
points.  This script tests those four shell equalities against all strict
Kalmanson inequalities.  SAT is only a theorem-discovery witness; UNSAT must
be shrunk to a small schema and subsequently proved in Lean.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from itertools import combinations, permutations

import z3


CENTERS = (8, 9, 10, 11)
FIXED = ((6, 9), (6, 7), (8, 9), (8, 10))
OLD_TAILS = (
    (3, 4, 5, 1, 13, 14),
    (3, 4, 5, 1, 13, 14),
)
PREFIXES = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2),
    (0, 6, 8, 11, 10, 12, 9, 7, 2),
)
OUTSIDE = frozenset((1, 3, 4, 5, 13, 14, 15, 16))
PHYSICAL = frozenset((6, 7, 8, 9, 10))
SECOND_CAP = frozenset((0, 2, 6, 7, 8, 9, 10, 11, 12))
C = 11
POINTS = tuple(range(17))


def exact17_order(order_index: int, anonymous_positions: tuple[int, int]):
    tail: list[int] = []
    old = iter(OLD_TAILS[order_index])
    anonymous = iter((15, 16))
    for position in range(8):
        tail.append(next(anonymous) if position in anonymous_positions else next(old))
    return PREFIXES[order_index] + tuple(tail)


def pair_partitions(points: frozenset[int]):
    """Generate each unordered partition into pairs exactly once."""
    if not points:
        yield ()
        return
    anchor = min(points)
    rest = points - {anchor}
    for partner in sorted(rest):
        pair = (anchor, partner)
        for suffix in pair_partitions(rest - {partner}):
            yield (pair,) + suffix


def labeled_pair_partitions(points: frozenset[int]):
    """Generate each partition into four pairs, with the pairs row-labelled."""
    for unordered in pair_partitions(points):
        yield from permutations(unordered)


def dist(ds: dict[tuple[int, int], z3.ArithRef], a: int, b: int):
    return ds[tuple(sorted((a, b)))]


def build_solver(
    order: tuple[int, ...],
    with_squared_cnd: bool = False,
    polynomial: bool = False,
):
    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(17), 2)
    }
    solver = z3.SolverFor("QF_NRA") if polynomial else z3.Solver()
    solver.add(*(value > 0 for value in ds.values()))
    solver.add(dist(ds, 0, 1) == 1)
    for a, b, c in combinations(range(17), 3):
        solver.add(dist(ds, a, c) < dist(ds, a, b) + dist(ds, b, c))
        solver.add(dist(ds, a, b) < dist(ds, a, c) + dist(ds, b, c))
        solver.add(dist(ds, b, c) < dist(ds, a, b) + dist(ds, a, c))
    for i, j, k, ell in combinations(range(17), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal = dist(ds, a, c) + dist(ds, b, d)
        solver.add(dist(ds, a, b) + dist(ds, c, d) < diagonal)
        solver.add(dist(ds, a, d) + dist(ds, b, c) < diagonal)
    ss = {
        pair: z3.Real(f"s_{pair[0]}_{pair[1]}")
        for pair in combinations(range(17), 2)
    }
    if with_squared_cnd:
        solver.add(*(value > 0 for value in ss.values()))
        # Small-support conditional-negative-type inequalities.  For each
        # pairing of four labels, b=(1,1,-1,-1) gives this linear cut.
        for a, b, c, d in combinations(range(17), 4):
            solver.add(
                dist(ss, a, b) + dist(ss, c, d)
                <= dist(ss, a, c) + dist(ss, a, d)
                + dist(ss, b, c) + dist(ss, b, d)
            )
            solver.add(
                dist(ss, a, c) + dist(ss, b, d)
                <= dist(ss, a, b) + dist(ss, a, d)
                + dist(ss, b, c) + dist(ss, c, d)
            )
            solver.add(
                dist(ss, a, d) + dist(ss, b, c)
                <= dist(ss, a, b) + dist(ss, a, c)
                + dist(ss, b, d) + dist(ss, c, d)
            )
    return solver, ds, ss


def add_exact_row(
    solver,
    ds,
    ss,
    order: tuple[int, ...],
    center: int,
    row: tuple[int, ...],
    exact: bool,
    same_shell_sq: bool,
    ptolemy: bool,
):
    radius = dist(ds, center, row[0])
    solver.add(*(dist(ds, center, point) == radius for point in row[1:]))
    if exact:
        solver.add(*(
            dist(ds, center, point) != radius
            for point in POINTS
            if point != center and point not in row
        ))
    if same_shell_sq or ptolemy:
        pos = order.index(center)
        from_center = order[pos + 1 :] + order[:pos]
        shell_order = tuple(point for point in from_center if point in row)
    if same_shell_sq:
        squared_radius = dist(ss, center, row[0])
        solver.add(*(dist(ss, center, point) == squared_radius for point in row[1:]))
        for i, j, k in combinations(range(4), 3):
            x, y, z = shell_order[i], shell_order[j], shell_order[k]
            solver.add(dist(ss, x, z) > dist(ss, x, y) + dist(ss, y, z))
    if ptolemy:
        a, b, c, d = shell_order
        solver.add(
            dist(ds, a, c) * dist(ds, b, d)
            == dist(ds, a, b) * dist(ds, c, d)
            + dist(ds, a, d) * dist(ds, b, c)
        )


def add_rows(
    solver, ds, ss, order, pairs, exact: bool, same_shell_sq: bool, ptolemy: bool
):
    for center, fixed, pair in zip(CENTERS, FIXED, pairs, strict=True):
        row = fixed + pair
        add_exact_row(
            solver, ds, ss, order, center, row, exact, same_shell_sq, ptolemy
        )


def add_full_pinned_system(
    solver,
    ds,
    named_rows: tuple[tuple[int, frozenset[int]], ...],
    *,
    no_qfree: bool,
):
    """Add the carrier-wide K4 and critical-deletion shadow.

    ``selected[p,q]`` chooses four co-radial witnesses at every carrier
    centre.  ``blocker[q,p]`` chooses the critical-shell centre supplied by
    ``CriticalShellSystem`` for deletion of ``q``.  If ``no_qfree`` is set,
    no four remaining spokes at that centre may be co-radial.

    Named full four-shells pin the selected row at their centre: deletion of
    the named source forces every K4 witness there to meet that shell, hence
    exactness makes the two four-supports equal.
    """

    selected = {
        (center, point): z3.Bool(f"selected_{center}_{point}")
        for center in POINTS
        for point in POINTS
        if center != point
    }
    blockers = {
        (source, center): z3.Bool(f"blocker_{source}_{center}")
        for source in POINTS
        for center in POINTS
        if source != center
    }

    for center in POINTS:
        row = [selected[center, point] for point in POINTS if point != center]
        solver.add(z3.PbEq([(literal, 1) for literal in row], 4))
        radius = z3.Real(f"selected_radius_{center}")
        solver.add(radius > 0)
        for point in POINTS:
            if point != center:
                solver.add(
                    z3.Implies(
                        selected[center, point], dist(ds, center, point) == radius
                    )
                )

    # Two circles with distinct carrier centres have at most two common hits.
    for left, right in combinations(POINTS, 2):
        others = tuple(point for point in POINTS if point not in (left, right))
        for a, b, c in combinations(others, 3):
            solver.add(
                z3.Or(
                    z3.Not(selected[left, a]), z3.Not(selected[right, a]),
                    z3.Not(selected[left, b]), z3.Not(selected[right, b]),
                    z3.Not(selected[left, c]), z3.Not(selected[right, c]),
                )
            )

    for source in POINTS:
        choices = [
            blockers[source, center] for center in POINTS if center != source
        ]
        solver.add(z3.PbEq([(literal, 1) for literal in choices], 1))
        for center in POINTS:
            if center == source:
                continue
            blocker = blockers[source, center]
            solver.add(z3.Implies(blocker, selected[center, source]))
            if no_qfree:
                remaining = tuple(
                    point for point in POINTS if point not in (source, center)
                )
                for four in combinations(remaining, 4):
                    anchor = dist(ds, center, four[0])
                    solver.add(
                        z3.Implies(
                            blocker,
                            z3.Or(*(
                                dist(ds, center, point) != anchor
                                for point in four[1:]
                            )),
                        )
                    )

    for center, support in named_rows:
        for point in POINTS:
            if point != center:
                solver.add(selected[center, point] == (point in support))

    # The fifth row is H.selectedAt c, with c=11 and actual centre 0 in the
    # representative targeted survivor.
    if (0, frozenset((11, 1, 2, 15))) in named_rows:
        solver.add(blockers[11, 0])
    return selected, blockers


def render_full_pinned_model(model, selected, blockers):
    return {
        "selected_rows": {
            str(center): [
                point
                for point in POINTS
                if point != center and z3.is_true(model.eval(selected[center, point]))
            ]
            for center in POINTS
        },
        "blockers": {
            str(source): next(
                center
                for center in POINTS
                if center != source
                and z3.is_true(model.eval(blockers[source, center]))
            )
            for source in POINTS
        },
    }


def strictly_separated(
    order: tuple[int, ...],
    center: int,
    support: tuple[int, ...],
    source_rows: tuple[frozenset[int], ...],
) -> bool:
    pos = {point: index for index, point in enumerate(order)}
    support_set = frozenset(support)
    for old_center, row in zip(CENTERS, source_rows, strict=True):
        common = support_set & row
        if len(common) < 2:
            continue
        if len(common) != 2:
            return False
        between = sum(
            min(pos[old_center], pos[center]) < pos[point]
            < max(pos[old_center], pos[center])
            for point in common
        )
        if between != 1:
            return False
    return True


def fifth_rows(order: tuple[int, ...], source_rows):
    for center in POINTS:
        if center in CENTERS or center == C:
            continue
        for rest in combinations(
            tuple(point for point in POINTS if point not in (C, center)), 3
        ):
            support = (C,) + rest
            if len(PHYSICAL & frozenset(support)) > 1:
                continue
            if len(SECOND_CAP & frozenset(support)) > 2:
                continue
            if strictly_separated(order, center, support, source_rows):
                yield center, support


def smoke() -> dict[str, str]:
    order = exact17_order(0, (0, 1))
    solver, ds, _ss = build_solver(order)
    base = solver.check()
    chosen = order[:6]
    solver.push()
    solver.add(dist(ds, chosen[1], chosen[4]) == dist(ds, chosen[1], chosen[0]))
    solver.add(dist(ds, chosen[2], chosen[5]) == dist(ds, chosen[2], chosen[0]))
    solver.add(dist(ds, chosen[3], chosen[5]) == dist(ds, chosen[3], chosen[4]))
    schema = solver.check()
    solver.pop()
    return {"base": str(base), "known_schema": str(schema)}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), default=0)
    parser.add_argument("--positions", default="0,1")
    parser.add_argument("--limit", type=int, default=100)
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--with-fifth", action="store_true")
    parser.add_argument("--exact-rows", action="store_true")
    parser.add_argument("--stop-on-sat", action="store_true")
    parser.add_argument("--same-shell-sq", action="store_true")
    parser.add_argument("--ptolemy", action="store_true")
    parser.add_argument("--full-pinned", action="store_true")
    parser.add_argument("--no-qfree", action="store_true")
    parser.add_argument(
        "--fifth-spec", help="restrict to CENTER:SUPPORT, e.g. 0:11,1,2,15"
    )
    args = parser.parse_args()
    if args.smoke:
        result = smoke()
        print(json.dumps(result, sort_keys=True))
        return 0 if result == {"base": "sat", "known_schema": "unsat"} else 1

    positions = tuple(map(int, args.positions.split(",")))
    if len(positions) != 2 or positions[0] >= positions[1]:
        parser.error("--positions must be two increasing tail positions")
    order = exact17_order(args.order, positions)
    solver, ds, ss = build_solver(order, args.same_shell_sq, args.ptolemy)
    solver.set(timeout=args.timeout_ms)
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    examples = {key: [] for key in counts}
    fifth_totals = Counter()
    fifth_sat_centers = Counter()
    fifth_sat_examples = []
    for index, pairs in enumerate(labeled_pair_partitions(OUTSIDE)):
        if index < args.start:
            continue
        if index >= args.start + args.limit:
            break
        solver.push()
        add_rows(
            solver,
            ds,
            ss,
            order,
            pairs,
            args.exact_rows,
            args.same_shell_sq,
            args.ptolemy,
        )
        source_rows = tuple(
            frozenset(fixed + pair)
            for fixed, pair in zip(FIXED, pairs, strict=True)
        )
        if args.with_fifth:
            fifth_counts = {"sat": 0, "unsat": 0, "unknown": 0}
            fifth_examples = {key: [] for key in fifth_counts}
            candidates = fifth_rows(order, source_rows)
            if args.fifth_spec:
                center_text, support_text = args.fifth_spec.split(":", 1)
                candidates = ((
                    int(center_text), tuple(map(int, support_text.split(",")))
                ),)
            for center, support in candidates:
                solver.push()
                add_exact_row(
                    solver,
                    ds,
                    ss,
                    order,
                    center,
                    support,
                    args.exact_rows,
                    args.same_shell_sq,
                    args.ptolemy,
                )
                full_pinned = None
                if args.full_pinned:
                    named_rows = tuple(
                        (old_center, old_support)
                        for old_center, old_support in zip(
                            CENTERS, source_rows, strict=True
                        )
                    ) + ((center, frozenset(support)),)
                    full_pinned = add_full_pinned_system(
                        solver, ds, named_rows, no_qfree=args.no_qfree
                    )
                fifth_verdict = str(solver.check())
                pinned_model = None
                if fifth_verdict == "sat" and full_pinned is not None:
                    pinned_model = render_full_pinned_model(
                        solver.model(), *full_pinned
                    )
                solver.pop()
                fifth_counts[fifth_verdict] += 1
                fifth_totals[fifth_verdict] += 1
                if fifth_verdict == "sat":
                    fifth_sat_centers[center] += 1
                    if len(fifth_sat_examples) < 10:
                        fifth_sat_examples.append((index, pairs, center, support))
                if len(fifth_examples[fifth_verdict]) < 3:
                    fifth_examples[fifth_verdict].append((center, support))
                if args.stop_on_sat and fifth_verdict == "sat":
                    result = {
                        "order": args.order,
                        "positions": positions,
                        "cyclic_order": order,
                        "source_index": index,
                        "source_pairs": pairs,
                        "fifth_counts": fifth_counts,
                        "fifth_examples": fifth_examples,
                        "exact_rows": args.exact_rows,
                        "same_shell_sq": args.same_shell_sq,
                        "ptolemy": args.ptolemy,
                        "full_pinned": args.full_pinned,
                        "no_qfree": args.no_qfree,
                        "full_pinned_model": pinned_model,
                    }
                    print(json.dumps(result, sort_keys=True))
                    solver.pop()
                    return 0
            verdict = "sat" if fifth_counts["sat"] else (
                "unknown" if fifth_counts["unknown"] else "unsat"
            )
        else:
            verdict = str(solver.check())
        solver.pop()
        counts[verdict] += 1
        if len(examples[verdict]) < 3:
            examples[verdict].append(pairs)
    result = {
        "order": args.order,
        "positions": positions,
        "cyclic_order": order,
        "limit": args.limit,
        "counts": counts,
        "examples": examples,
        "fifth_totals": dict(fifth_totals),
        "fifth_sat_centers": dict(fifth_sat_centers),
        "fifth_sat_examples": fifth_sat_examples,
        "same_shell_sq": args.same_shell_sq,
        "ptolemy": args.ptolemy,
    }
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
