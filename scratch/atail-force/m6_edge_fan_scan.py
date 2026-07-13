#!/usr/bin/env python3
"""Bounded scan of all edge fans in the S3-representative m=6 surface.

This is theorem-discovery only.  It checks the seven canonical class-orbit
representatives (25 order decorations) and every oriented polygon edge.  A
reported UNSAT row is a solver proposal until a small scalar kernel receives
an independent proof.
"""

from __future__ import annotations

import argparse
import json
import time
from collections import Counter
from itertools import combinations
from typing import Iterable

import sympy as sp
import z3

from census.atail_force import inequality_pilot as pilot
from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


EXPECTED_CLASSES = 7
EXPECTED_DECORATIONS = 25
EXPECTED_FANS = 225


def _relation(expression: sp.Expr, kind: str, variables, z3_variables):
    polynomial = pilot._poly_to_z3(expression, variables, z3_variables)
    if kind == "eq":
        return polynomial == 0
    if kind == "ge":
        return polynomial >= 0
    if kind == "gt":
        return polynomial > 0
    raise AssertionError(kind)


def _check(
    system,
    strict: Iterable[sp.Expr],
    *,
    timeout_ms: int,
    seed: int = 0,
) -> tuple[str, float, str]:
    variables = list(system.vars)
    z3_variables = [z3.Real(str(variable)) for variable in variables]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=seed)
    for expression in system.eqs:
        solver.add(_relation(expression, "eq", variables, z3_variables))
    for expression in system.ge:
        solver.add(_relation(expression, "ge", variables, z3_variables))
    for expression in strict:
        solver.add(_relation(expression, "gt", variables, z3_variables))
    started = time.monotonic()
    answer = solver.check()
    elapsed = time.monotonic() - started
    reason = solver.reason_unknown() if answer == z3.unknown else ""
    return str(answer).upper(), round(elapsed, 3), reason


def _edge_fan_indices(point_count: int, edge: int) -> tuple[int, ...]:
    left = edge
    right = (edge + 1) % point_count
    return tuple(
        index
        for index, triple in enumerate(combinations(range(point_count), 3))
        if left in triple and right in triple
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=250)
    args = parser.parse_args()
    if args.timeout_ms <= 0:
        parser.error("--timeout-ms must be positive")

    _report, classes = surface.load_inventory()
    representatives = [
        joint
        for joint in classes
        if joint.interior_point_count == 6
        and reduction.class_signature(joint)
        == reduction.canonical_class_signature(reduction.class_signature(joint))
    ]
    if len(representatives) != EXPECTED_CLASSES:
        raise surface.SurfaceError(
            f"m=6 representative-count drift: {len(representatives)}"
        )

    base_histogram: Counter[str] = Counter()
    fan_histogram: Counter[str] = Counter()
    base_rows = []
    unsat_rows = []
    decoration_count = 0
    fan_count = 0
    for joint in representatives:
        for order in surface.iter_order_decorations(joint):
            decoration_count += 1
            system = surface.build_system(joint, order)
            interior = joint.interior_point_count
            base_strict_count = 4 + 3 * interior
            base_strict = system.gt[:base_strict_count]
            order_strict = system.gt[base_strict_count:]
            sigma = system.meta["sigma"]
            point_count = len(sigma)
            expected_order_count = len(tuple(combinations(range(point_count), 3)))
            if len(order_strict) != expected_order_count:
                raise surface.SurfaceError("order-constraint ledger drift")
            base_verdict, base_elapsed, base_reason = _check(
                system,
                base_strict,
                timeout_ms=max(1000, args.timeout_ms),
            )
            base_histogram[base_verdict] += 1
            if base_verdict != "SAT":
                base_rows.append(
                    {
                        "class_id": joint.class_id,
                        "order": order.as_json(),
                        "verdict": base_verdict,
                        "elapsed_seconds": base_elapsed,
                        "reason_unknown": base_reason,
                    }
                )
            for edge in range(point_count):
                fan_count += 1
                indices = _edge_fan_indices(point_count, edge)
                if len(indices) != point_count - 2:
                    raise surface.SurfaceError("edge-fan size drift")
                fan = [order_strict[index] for index in indices]
                verdict, elapsed, reason = _check(
                    system,
                    [*base_strict, *fan],
                    timeout_ms=args.timeout_ms,
                )
                fan_histogram[verdict] += 1
                if verdict == "UNSAT":
                    unsat_rows.append(
                        {
                            "class_id": joint.class_id,
                            "class_key_sha256": joint.class_key_sha256,
                            "order": order.as_json(),
                            "edge_index": edge,
                            "oriented_edge": [
                                sigma[edge], sigma[(edge + 1) % point_count]
                            ],
                            "fan_constraint_indices": list(indices),
                            "elapsed_seconds": elapsed,
                            "reason_unknown": reason,
                        }
                    )

    if decoration_count != EXPECTED_DECORATIONS:
        raise surface.SurfaceError(
            f"m=6 decoration-count drift: {decoration_count}"
        )
    if fan_count != EXPECTED_FANS:
        raise surface.SurfaceError(f"m=6 fan-count drift: {fan_count}")
    document = {
        "schema": "p97_atail_force_m6_edge_fan_scan.v1",
        "timeout_ms_per_fan": args.timeout_ms,
        "s3_representative_classes": len(representatives),
        "order_decorations": decoration_count,
        "edge_fans": fan_count,
        "base_status_histogram": dict(sorted(base_histogram.items())),
        "non_sat_base_rows": base_rows,
        "fan_status_histogram": dict(sorted(fan_histogram.items())),
        "unsat_rows": unsat_rows,
        "scope": {
            "solver_proposals_only": True,
            "independent_proof_required": True,
            "all_m6_class_orbits": True,
            "all_representative_orders": True,
            "all_oriented_polygon_edges": True,
            "larger_support_strata_claim": False,
            "live_leaf_inventory_coverage_claim": False,
        },
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
