#!/usr/bin/env python3
"""Exact QF_NRA audit of the six-point serial two-circle core."""

from __future__ import annotations

import json

import z3


def smoke_gates() -> dict[str, str]:
    x = z3.Real("smoke_x")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.add(x * x == 1, x > 0)
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.add(x * x < 0)
    sat_status = sat_solver.check()
    unsat_status = unsat_solver.check()
    assert sat_status == z3.sat
    assert unsat_status == z3.unsat
    return {"known_sat": str(sat_status), "known_unsat": str(unsat_status)}


def main() -> None:
    t, h, u, v, w, z = z3.Reals("t h u v w z")
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=60_000)
    constraints = {
        "shared_upper": h > 0,
        "chord_between_centers_left": t > 0,
        "chord_between_centers_right": t < 1,
        "first_circle": u * u + v * v == t * t + h * h,
        "second_circle": (w - 1) * (w - 1) + z * z
        == (t - 1) * (t - 1) + h * h,
        "s1_A_s2_clockwise": -h * u + t * v < 0,
        "s1_A_y_clockwise": h * u + t * v < 0,
        "s2_B_f_clockwise": h * w - h - t * z + z < 0,
        "B_f_y_clockwise": -h * w + h - t * z + z < 0,
        "terminal_clockwise": h * u
        - h * w
        + t * v
        - t * z
        + u * z
        - v * w
        < 0,
    }
    solver.add(*constraints.values())
    status = solver.check()
    result: dict[str, object] = {
        "scope": "exact normalized six-point two-circle equations and cyclic signs",
        "status": str(status),
        "constraint_names": list(constraints),
        "smoke_gates": smoke_gates(),
    }
    if status == z3.sat:
        model = solver.model()
        result["model"] = {str(x): str(model.eval(x, model_completion=True)) for x in (t, h, u, v, w, z)}
    elif status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
