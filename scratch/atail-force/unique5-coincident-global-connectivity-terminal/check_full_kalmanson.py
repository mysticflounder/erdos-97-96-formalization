#!/usr/bin/env python3
"""Exact QF_LRA audit of the finite coincident-connectivity scope guard.

The distance variables are abstract symmetric metrics in the fixed cyclic
boundary order.  Every selected-row equality is imposed, together with
positivity, all triangle inequalities, and both strict Kalmanson inequalities
for every cyclic quadruple.  Strict homogeneous slacks are normalized to one.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from fractions import Fraction
from itertools import combinations
from pathlib import Path

import z3


ROWS = (
    (1, 2, 3, 4),
    (0, 4, 7, 8),
    (0, 3, 9, 10),
    (1, 4, 7, 11),
    (1, 2, 3, 6),
    (0, 3, 8, 11),
    (2, 7, 8, 10),
    (4, 6, 9, 11),
    (3, 5, 7, 9),
    (0, 4, 5, 10),
    (2, 5, 8, 11),
    (1, 6, 8, 9),
)

# Counterclockwise order, cut at the represented first apex 4.
BOUNDARY = (4, 8, 9, 10, 7, 1, 0, 2, 6, 11, 5, 3)
FIRST_APEX = 4
FIRST_CLASS = (1, 2, 3, 5, 6)


def pair(a: int, b: int) -> tuple[int, int]:
    assert a != b
    return (a, b) if a < b else (b, a)


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def build_constraints(
    n: int,
    boundary: tuple[int, ...],
    rows: tuple[tuple[int, ...], ...],
) -> tuple[dict[tuple[int, int], z3.ArithRef], list[tuple[str, z3.BoolRef]]]:
    assert sorted(boundary) == list(range(n))
    assert len(rows) == n
    distance = {
        (a, b): z3.Real(f"d_{a}_{b}") for a, b in combinations(range(n), 2)
    }

    def d(a: int, b: int) -> z3.ArithRef:
        return distance[pair(a, b)]

    constraints: list[tuple[str, z3.BoolRef]] = []
    for a, b in combinations(range(n), 2):
        constraints.append((f"positive:{a}:{b}", d(a, b) >= 1))

    for a, b, c in combinations(range(n), 3):
        constraints.extend(
            (
                (f"triangle:{a}:{b}:{c}:ab_ac", d(a, b) + d(a, c) >= d(b, c)),
                (f"triangle:{a}:{b}:{c}:ab_bc", d(a, b) + d(b, c) >= d(a, c)),
                (f"triangle:{a}:{b}:{c}:ac_bc", d(a, c) + d(b, c) >= d(a, b)),
            )
        )

    for center, support in enumerate(rows):
        if not support:
            continue
        assert len(set(support)) == 4
        assert center not in support
        base = support[0]
        for target in support[1:]:
            constraints.append(
                (
                    f"row:{center}:{base}:{target}",
                    d(center, base) == d(center, target),
                )
            )

    for i, j, k, ell in combinations(range(n), 4):
        a, b, c, d_point = (
            boundary[i],
            boundary[j],
            boundary[k],
            boundary[ell],
        )
        diagonal_sum = d(a, c) + d(b, d_point)
        constraints.extend(
            (
                (
                    f"kalmanson:{a}:{b}:{c}:{d_point}:adjacent",
                    diagonal_sum >= d(a, b) + d(c, d_point) + 1,
                ),
                (
                    f"kalmanson:{a}:{b}:{c}:{d_point}:outer",
                    diagonal_sum >= d(a, d_point) + d(b, c) + 1,
                ),
            )
        )
    return distance, constraints


def solve_with_core(
    constraints: list[tuple[str, z3.BoolRef]],
) -> tuple[z3.CheckSatResult, z3.ModelRef | None, list[int]]:
    solver = z3.Solver()
    assumptions = [z3.Bool(f"assumption_{i}") for i in range(len(constraints))]
    for assumption, (_, constraint) in zip(assumptions, constraints, strict=True):
        solver.add(z3.Implies(assumption, constraint))
    verdict = solver.check(*assumptions)
    if verdict == z3.sat:
        return verdict, solver.model(), []
    if verdict != z3.unsat:
        return verdict, None, []
    index_of = {assumption.decl().name(): i for i, assumption in enumerate(assumptions)}
    core = [index_of[item.decl().name()] for item in solver.unsat_core()]
    # Deletion-minimize the solver core.  Every retained atom is an
    # extension-stable metric, row-equality, or cyclic-quadruple condition.
    changed = True
    while changed:
        changed = False
        for index in tuple(core):
            trial = [assumptions[i] for i in core if i != index]
            if solver.check(*trial) == z3.unsat:
                core.remove(index)
                changed = True
    assert solver.check(*(assumptions[i] for i in core)) == z3.unsat
    for index in tuple(core):
        trial = [assumptions[i] for i in core if i != index]
        assert solver.check(*trial) == z3.sat
    return verdict, None, sorted(core)


def replay_model(
    distance: dict[tuple[int, int], z3.ArithRef],
    constraints: list[tuple[str, z3.BoolRef]],
    model: z3.ModelRef,
) -> dict[str, str]:
    values = {
        key: rational(model.eval(variable, model_completion=True))
        for key, variable in distance.items()
    }
    substitution = [
        (variable, z3.Q(value.numerator, value.denominator))
        for key, variable in distance.items()
        for value in [values[key]]
    ]
    failures = []
    for name, constraint in constraints:
        reduced = z3.simplify(z3.substitute(constraint, *substitution))
        if not z3.is_true(reduced):
            failures.append(name)
    assert not failures, failures[:10]
    return {f"{a},{b}": str(value) for (a, b), value in sorted(values.items())}


def smoke_test() -> None:
    _, base = build_constraints(4, (0, 1, 2, 3), ((), (), (), ()))
    # Drop row construction requirements for this tiny hand-audited smoke.
    base = [item for item in base if not item[0].startswith("row:")]
    solver = z3.Solver()
    solver.add(*(constraint for _, constraint in base))
    assert solver.check() == z3.sat

    distance, contradictory = build_constraints(4, (0, 1, 2, 3), ((), (), (), ()))
    contradictory = [item for item in contradictory if not item[0].startswith("row:")]
    d = lambda a, b: distance[pair(a, b)]
    solver = z3.Solver()
    solver.add(*(constraint for _, constraint in contradictory))
    solver.add(d(0, 2) == d(0, 1), d(1, 3) == d(2, 3))
    assert solver.check() == z3.unsat


def audit() -> dict[str, object]:
    smoke_test()
    distance, constraints = build_constraints(12, BOUNDARY, ROWS)

    def d(a: int, b: int) -> z3.ArithRef:
        return distance[pair(a, b)]

    # The live exact-five residual supplies the complete first-apex class,
    # not merely the selected four-point row at that apex.
    base = FIRST_CLASS[0]
    for target in FIRST_CLASS[1:]:
        constraints.append(
            (
                f"first_class:{FIRST_APEX}:{base}:{target}",
                d(FIRST_APEX, base) == d(FIRST_APEX, target),
            )
        )
    verdict, model, core_indices = solve_with_core(constraints)
    result: dict[str, object] = {
        "schema": 1,
        "status": str(verdict).upper(),
        "boundary": list(BOUNDARY),
        "rows": [list(row) for row in ROWS],
        "constraint_counts": {
            "positive": sum(name.startswith("positive:") for name, _ in constraints),
            "triangle": sum(name.startswith("triangle:") for name, _ in constraints),
            "row": sum(name.startswith("row:") for name, _ in constraints),
            "first_class": sum(
                name.startswith("first_class:") for name, _ in constraints
            ),
            "kalmanson": sum(name.startswith("kalmanson:") for name, _ in constraints),
            "total": len(constraints),
        },
        "strict_slack_normalization": 1,
        "smoke": {"unconstrained_four_cycle": "SAT", "forced_tight_kalmanson": "UNSAT"},
    }
    if verdict == z3.sat:
        assert model is not None
        result["distance_model"] = replay_model(distance, constraints, model)
        result["model_replay"] = "PASS"
    elif verdict == z3.unsat:
        result["minimal_extension_stable_core"] = [constraints[i][0] for i in core_indices]
        result["minimal_core_size"] = len(core_indices)
        result["minimal_core_deletion_check"] = "PASS"
    else:
        raise RuntimeError(f"unexpected solver verdict: {verdict}")
    canonical = json.dumps(result, sort_keys=True, separators=(",", ":"))
    result["audit_sha256"] = hashlib.sha256(canonical.encode()).hexdigest()
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", type=Path)
    args = parser.parse_args()
    result = audit()
    encoded = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.check is not None:
        assert json.loads(args.check.read_text()) == result
    if args.output is not None:
        args.output.write_text(encoded)
    print(encoded, end="")


if __name__ == "__main__":
    main()
