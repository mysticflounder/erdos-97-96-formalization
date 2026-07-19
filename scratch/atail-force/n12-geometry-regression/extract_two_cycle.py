#!/usr/bin/env python3
"""Emit the two-Kalmanson exact certificate found in the n=12 carrier."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


ORIGINAL_ROLES = [0, 1, 2, 3, 5, 6, 7, 8]
REQUIRED_MEMBERSHIPS = [
    [5, 0], [5, 8],
    [0, 7], [0, 2],
    [2, 0], [2, 3],
    [7, 8], [7, 6],
    [6, 7], [6, 2],
    [1, 3], [1, 6],
]


def canonical_schema() -> list[list[int]]:
    relabel = {old: new for new, old in enumerate(ORIGINAL_ROLES)}
    schema = tuple(sorted((relabel[c], relabel[p]) for c, p in REQUIRED_MEMBERSHIPS))
    reflected = tuple(sorted((7 - c, 7 - p) for c, p in schema))
    return [list(edge) for edge in min(schema, reflected)]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--carrier", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    rows = {int(k): set(int(v) for v in values) for k, values in carrier["rows"].items()}
    missing = [[center, point] for center, point in REQUIRED_MEMBERSHIPS if point not in rows[center]]
    if missing:
        raise AssertionError(f"carrier misses required row memberships: {missing}")

    payload = {
        "schema": "p97-n12-two-kalmanson-cycle-certificate-v1",
        "status": "EXACT_FARKAS_VERIFIED",
        "source_carrier": str(args.carrier),
        "cyclic_roles_original": ORIGINAL_ROLES,
        "required_memberships_original": REQUIRED_MEMBERSHIPS,
        "reflection_canonical_order_schema": canonical_schema(),
        "core_vertex_count": 8,
        "row_equalities": [
            {"center": 5, "terms": [[0, 5], [5, 8]], "class": "middle"},
            {"center": 0, "terms": [[0, 7], [0, 2]], "class": "left"},
            {"center": 2, "terms": [[0, 2], [2, 3]], "class": "left"},
            {"center": 7, "terms": [[7, 8], [6, 7]], "class": "right"},
            {"center": 6, "terms": [[6, 7], [2, 6]], "class": "right"},
            {"center": 1, "terms": [[1, 3], [1, 6]], "class": "middle"},
        ],
        "strict_inequalities": [
            {
                "ordered_quadruple": [0, 5, 7, 8],
                "kind": "complementary_kalmanson",
                "raw": "d_0_7 + d_5_8 >= d_0_5 + d_7_8 + 1",
                "after_row_equalities": "left - right >= 1",
                "coefficients": {"left": 1, "right": -1},
                "rhs": 1,
            },
            {
                "ordered_quadruple": [1, 2, 3, 6],
                "kind": "kalmanson",
                "raw": "d_1_3 + d_2_6 >= d_1_6 + d_2_3 + 1",
                "after_row_equalities": "right - left >= 1",
                "coefficients": {"left": -1, "right": 1},
                "rhs": 1,
            },
        ],
        "farkas_certificate": {
            "multipliers": [1, 1],
            "summed_left_coefficients": {"left": 0, "right": 0},
            "summed_rhs": 2,
            "contradiction": "0 >= 2",
        },
        "existing_lean_consumers": [
            "Problem97.ATailOrdinalKalmansonCycle.false_of_two_cycle",
            "Problem97.CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw",
            "Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw",
        ],
        "scope_warning": (
            "This eliminates this eight-role carrier schema in strict convex cyclic geometry. "
            "It is not a proof that every live carrier contains the schema."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "schema": payload["reflection_canonical_order_schema"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
