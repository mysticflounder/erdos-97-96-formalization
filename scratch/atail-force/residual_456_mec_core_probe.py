#!/usr/bin/env python3
"""QF_NRA discovery probe for the five-label `(4,5,6)` MEC residual core.

This is an analysis tool, not a proof.  It normalizes labels 0 and 1 to
``(0, 0)`` and ``(1, 0)`` and retains only labels 2, 3, and 7.  The four
residual rows then give the unit edges

``0-1-2-7-3-0``.

The saved strict-convex order restricts to ``0,1,3,2,7``.  The probe asks
whether label 7 can lie in the circumdisk through 0, 1, and 2, and reports a
solver unsat core when it cannot.  Any UNSAT result is solver evidence only;
the intended endpoint is a small Lean theorem over the extracted identities.
"""

from __future__ import annotations

import itertools

import z3


TIMEOUT_MS = 30_000


def sq(value: z3.ArithRef) -> z3.ArithRef:
    return value * value


def cross(
    a: tuple[z3.ArithRef | int, z3.ArithRef | int],
    b: tuple[z3.ArithRef | int, z3.ArithRef | int],
    c: tuple[z3.ArithRef | int, z3.ArithRef | int],
) -> z3.ArithRef:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def system(include_disk: bool = True) -> tuple[z3.Solver, dict[str, z3.BoolRef]]:
    x2, y2, x3, y3, x7, y7 = z3.Reals("x2 y2 x3 y3 x7 y7")
    points = {
        0: (z3.RealVal(0), z3.RealVal(0)),
        1: (z3.RealVal(1), z3.RealVal(0)),
        2: (x2, y2),
        3: (x3, y3),
        7: (x7, y7),
    }
    assertions: dict[str, z3.BoolRef] = {
        "unit_12": sq(x2 - 1) + sq(y2) == 1,
        "unit_30": sq(x3) + sq(y3) == 1,
        "unit_27": sq(x7 - x2) + sq(y7 - y2) == 1,
        "unit_37": sq(x7 - x3) + sq(y7 - y3) == 1,
    }
    order = (0, 1, 3, 2, 7)
    for left_index in range(len(order)):
        for middle_index in range(left_index + 1, len(order)):
            for right_index in range(middle_index + 1, len(order)):
                left = order[left_index]
                middle = order[middle_index]
                right = order[right_index]
                assertions[f"ccw_{left}_{middle}_{right}"] = (
                    cross(points[left], points[middle], points[right]) > 0
                )
    if include_disk:
        # The circle through (0,0), (1,0), and (x2,y2) has equation
        # y2*(x^2+y^2-x) - x2*y = 0, using unit_12.  For y2>0,
        # its closed interior is the nonpositive side.
        assertions["disk_7"] = y2 * (sq(x7) + sq(y7) - x7) - x2 * y7 <= 0

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=TIMEOUT_MS)
    names: dict[str, z3.BoolRef] = {}
    for name, assertion in assertions.items():
        tracker = z3.Bool(name)
        names[name] = tracker
        solver.assert_and_track(assertion, tracker)
    return solver, names


def main() -> int:
    # Encoding smoke gate: without the disk inequality, the checked exact
    # residual witness guarantees satisfiability of this five-label subset.
    relaxed, _ = system(include_disk=False)
    relaxed_result = relaxed.check()
    if relaxed_result != z3.sat:
        raise AssertionError(f"relaxed smoke gate is not SAT: {relaxed_result}")

    full, _ = system(include_disk=True)
    full_result = full.check()
    print(f"relaxed={relaxed_result}")
    print(f"with_disk={full_result}")
    if full_result == z3.unsat:
        core = sorted(str(name) for name in full.unsat_core())
        print("unsat_core=" + ",".join(core))
        return 0
    if full_result == z3.sat:
        print(full.model())
        return 1
    print(full.reason_unknown())
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
