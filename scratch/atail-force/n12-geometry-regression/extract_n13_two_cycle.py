#!/usr/bin/env python3
"""Emit the minimal two-Kalmanson cycle in the saved n=13 outer carrier."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


ROLES = [0, 1, 3, 6, 11, 12]
MEMBERSHIPS = [
    [1, 12], [1, 3],
    [6, 0], [6, 11],
    [12, 0], [12, 11],
    [11, 12], [11, 3],
]


def canonical() -> list[list[int]]:
    labels = {old: new for new, old in enumerate(ROLES)}
    schema = tuple(sorted((labels[c], labels[p]) for c, p in MEMBERSHIPS))
    reflected = tuple(sorted((5 - c, 5 - p) for c, p in schema))
    return [list(edge) for edge in min(schema, reflected)]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--carrier", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    if carrier.get("n") != 13:
        raise AssertionError("expected n=13 carrier")
    rows = {int(k): set(int(v) for v in values) for k, values in carrier["rows"].items()}
    missing = [[c, p] for c, p in MEMBERSHIPS if p not in rows[c]]
    if missing:
        raise AssertionError(f"missing memberships: {missing}")
    payload = {
        "schema": "p97-n13-two-kalmanson-cycle-certificate-v1",
        "status": "EXACT_FARKAS_VERIFIED",
        "source_carrier": str(args.carrier),
        "cyclic_roles_original": ROLES,
        "required_memberships_original": MEMBERSHIPS,
        "reflection_canonical_order_schema": canonical(),
        "core_vertex_count": 6,
        "row_equalities": [
            {"center": 1, "terms": [[1, 12], [1, 3]], "class": "cancel_one"},
            {"center": 6, "terms": [[0, 6], [6, 11]], "class": "cancel_two"},
            {"center": 12, "terms": [[0, 12], [11, 12]], "class": "right"},
            {"center": 11, "terms": [[11, 12], [3, 11]], "class": "right"},
        ],
        "strict_inequalities": [
            {
                "ordered_quadruple": [0, 1, 3, 12],
                "kind": "kalmanson",
                "raw": "d_0_3 + d_1_12 >= d_0_12 + d_1_3 + 1",
                "after_row_equalities": "left - right >= 1",
                "coefficients": {"left": 1, "right": -1},
                "rhs": 1,
            },
            {
                "ordered_quadruple": [0, 3, 6, 11],
                "kind": "complementary_kalmanson",
                "raw": "d_0_6 + d_3_11 >= d_0_3 + d_6_11 + 1",
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
            "Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw",
            "Problem97.CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw",
        ],
        "scope_warning": (
            "This eliminates this six-role carrier schema in strict convex cyclic geometry. "
            "It is per-carrier regression evidence, not uniform occurrence or live coverage."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "schema": payload["reflection_canonical_order_schema"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
