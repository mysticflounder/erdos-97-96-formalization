#!/usr/bin/env python3
"""Validate the static connectivity encoding and finite source projection."""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path

import z3

import surface


def connectivity_unit(disconnected: bool) -> str:
    vertices = surface.focus.VERTICES
    if disconnected:
        first = tuple(range(6))
        second = tuple(range(6, 13))
        successor = {
            **{point: first[(index + 1) % len(first)]
               for index, point in enumerate(first)},
            **{point: second[(index + 1) % len(second)]
               for index, point in enumerate(second)},
        }
    else:
        successor = {
            point: vertices[(index + 1) % len(vertices)]
            for index, point in enumerate(vertices)
        }
    family = {
        (center, point): z3.BoolVal(successor[center] == point)
        for center in vertices
        for point in vertices
    }
    solver = z3.Solver()
    surface.add_static_strong_connectivity(
        solver, family, "unit_disconnected" if disconnected else "unit_cycle"
    )
    return str(solver.check()).upper()


def source_orbit(orbit: str, timeout_seconds: int, seed: int) -> dict[str, object]:
    started = time.monotonic()
    outer = surface.DistinctAggregateOuter(orbit, seed)
    for name, family in (("m", outer.m), ("g0", outer.cover[0]),
                         ("g1", outer.cover[1])):
        surface.add_static_strong_connectivity(outer.solver, family, name)
    outer.solver.set(timeout=timeout_seconds * 1000, random_seed=seed)
    status = outer.solver.check()
    result: dict[str, object] = {
        "status": str(status).upper(),
        "elapsed_seconds": time.monotonic() - started,
        "assertion_count": len(outer.solver.assertions()),
    }
    if status == z3.sat:
        model = outer.solver.model()
        decoded = outer.decode(model)
        errors = surface.verify_decoded(outer, model)
        result["decoded_verification"] = "PASS" if not errors else "FAIL"
        result["verification_errors"] = errors
        result["decoded"] = decoded
    elif status == z3.unknown:
        result["reason"] = outer.solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=30)
    parser.add_argument("--seed", type=int, default=0)
    args = parser.parse_args()
    result = {
        "schema": "p97-exact5-card13-distinct-source-smoke-v1",
        "connectivity_unit": {
            "directed_cycle_expected_sat": connectivity_unit(False),
            "two_disjoint_cycles_expected_unsat": connectivity_unit(True),
        },
        "orbits": {
            orbit: source_orbit(orbit, args.timeout_seconds, args.seed)
            for orbit in surface.ORBITS
        },
    }
    unit = result["connectivity_unit"]
    if unit["directed_cycle_expected_sat"] != "SAT":
        raise AssertionError(unit)
    if unit["two_disjoint_cycles_expected_unsat"] != "UNSAT":
        raise AssertionError(unit)
    for orbit, orbit_result in result["orbits"].items():
        if (orbit_result["status"] == "SAT"
                and orbit_result["decoded_verification"] != "PASS"):
            raise AssertionError({orbit: orbit_result})
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
