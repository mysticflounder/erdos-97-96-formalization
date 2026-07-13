#!/usr/bin/env python3
"""Bounded edge-fan precheck on the seven immutable ATAIL pilot strata."""

from __future__ import annotations

import json
import time

import z3

from census.atail_force import inequality_pilot as pilot


TIMEOUT_SECONDS = 5


def main() -> int:
    manifest = pilot._read_manifest(pilot.DEFAULT_MANIFEST)
    results = []
    for case in manifest["cases"]:
        system = pilot._validated_case_system(case)
        interior = int(case["interior_points"])
        base_strict = 4 + 3 * interior
        edge_fan = interior + 1
        system.gt = system.gt[: base_strict + edge_fan]
        old_timeout = pilot.TIMEOUT_SECONDS
        pilot.TIMEOUT_SECONDS = TIMEOUT_SECONDS
        try:
            solver, _variables = pilot._build_z3_solver(system)
            started = time.monotonic()
            answer = solver.check()
            elapsed = round(time.monotonic() - started, 3)
        finally:
            pilot.TIMEOUT_SECONDS = old_timeout
        results.append(
            {
                "case_id": case["case_id"],
                "system_input_sha256": case["system_input_sha256"],
                "interior_points": interior,
                "edge_fan_inequalities": edge_fan,
                "total_constraints": len(system.eqs) + len(system.ge) + len(system.gt),
                "verdict": str(answer).upper(),
                "elapsed_seconds": elapsed,
                "reason_unknown": (
                    solver.reason_unknown() if answer == z3.unknown else ""
                ),
            }
        )
    print(
        json.dumps(
            {
                "schema": "p97_atail_force_edge_fan_strata.v1",
                "timeout_seconds_per_case": TIMEOUT_SECONDS,
                "results": results,
                "scope": {
                    "same_seven_frozen_strata": True,
                    "full_order_surface_included": False,
                    "solver_proposal_only": True,
                    "lean_claim": False,
                },
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
