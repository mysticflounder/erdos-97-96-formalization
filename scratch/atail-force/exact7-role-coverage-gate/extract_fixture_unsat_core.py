#!/usr/bin/env python3
"""Extract a labeled unsat core from the exact-seven fixed role fixture.

The fixture (``exact7-global-coradial-producer``) is exact-QF_LRA UNSAT.
Before building the source-faithful role-coverage enumerator, this script
answers one question: WHICH constraint families drive the contradiction.

Constraint families and their intended Lean provenance:

- ``lower``       normalization (homogeneous strict system, unit slack);
- ``tri``         strict triangle inequalities (convex position, no three
                  collinear points);
- ``cls_eq``      support-locked complete radius classes: equalities
                  (selectedFourClass_support_eq_shell + robust apex classes);
- ``cls_ne``      the same classes: completeness exclusions (no other carrier
                  point on that circle);
- ``row_eq``      first-apex four-row equalities (FirstApexShellRolePacket);
- ``rows_ne``     the distinct-radius arm split;
- ``k4``          existential K4 at the two otherwise-unlocked centers (H2);
- ``kal``         strict Kalmanson inequalities in the boundary order.

A core avoiding ``k4`` and using only named-role points ports directly to a
finite Lean certificate; a core through ``k4`` forces the enumerator to case
split on anonymous row membership at unlocked centers.
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path

import z3

sys.path.insert(
    0,
    str(Path(__file__).resolve().parent.parent / "exact7-global-coradial-producer"),
)

import verify_global_marginal_countermodel as fixture  # noqa: E402

BOUNDARY = [0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 11, 14, 12, 4, 13]


def pair(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def main() -> None:
    fixture.check()
    assert set(BOUNDARY) == fixture.A

    distances = {
        (a, b): z3.Real(f"d_{a}_{b}")
        for a, b in combinations(sorted(fixture.A), 2)
    }

    def dist(a: int, b: int) -> z3.ArithRef:
        if a == b:
            return z3.RealVal(0)
        return distances[pair(a, b)]

    solver = z3.Solver()
    solver.set(timeout=600_000)
    solver.set(unsat_core=True)
    solver.set("core.minimize", True)

    labels: dict[str, z3.BoolRef] = {}

    def track(name: str, constraint: z3.BoolRef) -> None:
        assert name not in labels, name
        marker = z3.Bool(name)
        labels[name] = constraint
        solver.assert_and_track(constraint, marker)

    for (a, b), value in distances.items():
        track(f"lower|{a},{b}", value >= 1)

    for a, b, c in combinations(sorted(fixture.A), 3):
        track(f"tri|{a},{b},{c}|ab+bc-ac", dist(a, b) + dist(b, c) - dist(a, c) >= 1)
        track(f"tri|{a},{b},{c}|ab+ac-bc", dist(a, b) + dist(a, c) - dist(b, c) >= 1)
        track(f"tri|{a},{b},{c}|ac+bc-ab", dist(a, c) + dist(b, c) - dist(a, b) >= 1)

    exact_classes: dict[int, list[frozenset[int]]] = {
        fixture.SECOND_APEX: [fixture.SECOND_APEX_EXACT_FIVE],
    }
    for center, support in fixture.CRITICAL_SUPPORT.items():
        exact_classes[center] = [support]

    for center, classes in exact_classes.items():
        for radius_class in classes:
            members = sorted(radius_class)
            radius = dist(center, members[0])
            for point in members[1:]:
                track(f"cls_eq|{center}|{point}", dist(center, point) == radius)
            for point in fixture.A - {center} - set(radius_class):
                track(f"cls_ne|{center}|{point}", dist(center, point) != radius)

    first_rows = list(fixture.FIRST_APEX_RADIUS_FIBERS)
    for index, row in enumerate(first_rows):
        members = sorted(row)
        for point in members[1:]:
            track(
                f"row_eq|{index}|{point}",
                dist(fixture.FIRST_APEX, point)
                == dist(fixture.FIRST_APEX, members[0]),
            )
    track(
        "rows_ne|0,1",
        dist(fixture.FIRST_APEX, min(first_rows[0]))
        != dist(fixture.FIRST_APEX, min(first_rows[1])),
    )

    unlocked_centers = fixture.A - set(exact_classes) - {fixture.FIRST_APEX}
    assert unlocked_centers == {11, 13}
    for center in unlocked_centers:
        witnesses = []
        for support in combinations(sorted(fixture.A - {center}), 4):
            radius = dist(center, support[0])
            witnesses.append(
                z3.And(*[dist(center, point) == radius for point in support[1:]])
            )
        track(f"k4|{center}", z3.Or(*witnesses))

    for i, j, k, ell in combinations(range(len(BOUNDARY)), 4):
        a, b, c, d = BOUNDARY[i], BOUNDARY[j], BOUNDARY[k], BOUNDARY[ell]
        diagonal_sum = dist(a, c) + dist(b, d)
        track(
            f"kal|{a},{b},{c},{d}|ac+bd-ab-cd",
            diagonal_sum - dist(a, b) - dist(c, d) >= 1,
        )
        track(
            f"kal|{a},{b},{c},{d}|ac+bd-ad-bc",
            diagonal_sum - dist(a, d) - dist(b, c) >= 1,
        )

    result = solver.check()
    print(f"solver_result={result}")
    if result != z3.unsat:
        raise SystemExit(f"expected unsat, got {result}")

    core = sorted(str(marker) for marker in solver.unsat_core())
    families = Counter(name.split("|", 1)[0] for name in core)
    points: Counter[str] = Counter()
    for name in core:
        parts = name.split("|")
        if len(parts) >= 2:
            for token in parts[1].split(","):
                points[token] += 1

    summary = {
        "core_size": len(core),
        "families": dict(sorted(families.items())),
        "point_occurrences": dict(
            sorted(points.items(), key=lambda item: -item[1])
        ),
        "core": core,
    }
    output = Path(__file__).resolve().parent / "fixture_unsat_core.json"
    output.write_text(json.dumps(summary, indent=2))

    print(f"core_size={len(core)}")
    print(f"families={dict(sorted(families.items()))}")
    print(f"k4_in_core={'k4' in families}")
    print(f"output={output}")


if __name__ == "__main__":
    main()
