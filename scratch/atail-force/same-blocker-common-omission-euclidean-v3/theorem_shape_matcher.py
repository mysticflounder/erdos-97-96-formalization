#!/usr/bin/env python3
"""Match chosen witness rows against production ordered incidence schemas.

This is a finite, solver-free combinatorial check.  It treats each witness
row as a same-radius support and tests every cyclic rotation of every ordered
4/5/6-point subset of the recorded existential boundary order.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


SCHEMAS = [
    # Four-point Kalmanson consumers (included as a sanity check for the full
    # shared-pair-separation replay, although the requested audit is 5/6 point).
    ("CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair", 4,
     {0: (2, 3), 1: (2, 3)}),
    ("CapCrossingKalmanson.false_of_four_ccw_endpoint_centers_bisect_middle_pair", 4,
     {0: (1, 2), 3: (1, 2)}),
    ("CapCrossingKalmanson.false_of_two_selected_middle_rows_shared_endpoint_pair", 4,
     {1: (0, 3), 2: (0, 3)}),

    ("FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows", 5,
     {1: (0, 4), 2: (0, 1, 3)}),
    ("FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows", 5,
     {3: (0, 2, 4), 4: (0, 1)}),
    ("FivePointEuclideanObstruction.false_of_five_ccw_reversed_second_two_selected_rows", 5,
     {1: (0, 2, 4), 0: (3, 4)}),
    ("Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw", 5,
     {0: (1, 3, 4), 4: (2, 3)}),
    ("CapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order", 5,
     {2: (0, 3), 0: (3, 4), 1: (4, 0)}),
    ("KalmansonThreeEqualitySchemas.false_of_five_ccw_three_shell_equalities_012_124_314", 5,
     {0: (1, 2), 1: (2, 4), 3: (1, 4)}),

    ("SixPointEuclideanObstruction.false_of_six_ccw_three_selected_rows", 6,
     {0: (1, 3, 5), 2: (1, 3, 4), 3: (0, 1)}),
    ("SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows", 6,
     {0: (1, 3, 5), 2: (1, 3, 4)}),
    # There is no selected-row adapter for this theorem; these memberships
    # are the minimal witness-row facts that produce its five equalities.
    ("SixPointEuclideanObstruction.false_of_six_ccw_mirror_interleaving_row_equalities", 6,
     {0: (1, 5, 2, 4), 3: (0, 2, 4), 4: (1, 5)}),
    ("TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities", 6,
     {1: (0, 2, 3), 5: (0, 3, 4)}),
    ("KalmansonThreeEqualitySchemas.false_of_six_ccw_three_shell_equalities_013_412_523", 6,
     {0: (1, 3), 4: (1, 2), 5: (2, 3)}),
    ("KalmansonThreeEqualitySchemas.false_of_six_ccw_three_shell_equalities_012_325_415", 6,
     {0: (1, 2), 3: (2, 5), 4: (1, 5)}),
    ("KalmansonThreeEqualitySchemas.false_of_six_ccw_three_shell_equalities_013_235_415", 6,
     {0: (1, 3), 2: (3, 5), 4: (1, 5)}),
]


def cyclic_ordered_tuples(order: list[str], arity: int):
    """Yield each cyclically ordered labelled tuple, allowing rotation."""
    seen: set[tuple[str, ...]] = set()
    for shift in range(len(order)):
        rotated = order[shift:] + order[:shift]
        for indices in itertools.combinations(range(len(order)), arity):
            points = tuple(rotated[i] for i in indices)
            if points not in seen:
                seen.add(points)
                yield points


def anchored_ordered_tuples(order: list[str], arity: int):
    """Yield tuples increasing in the recorded, a1-anchored linear order."""
    for indices in itertools.combinations(range(len(order)), arity):
        yield tuple(order[i] for i in indices)


def matches_for(points_iter, rows, requirements):
    matches = []
    for points in points_iter:
        obligations = []
        ok = True
        for center_pos, support_positions in requirements.items():
            center = points[center_pos]
            support = [points[i] for i in support_positions]
            missing = sorted(set(support) - rows[center])
            obligations.append({
                "center_position": center_pos,
                "center": center,
                "support_positions": list(support_positions),
                "support": support,
                "missing": missing,
            })
            ok = ok and not missing
        if ok:
            matches.append({"points": list(points), "obligations": obligations})
    return matches


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("witness", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    data = json.loads(args.witness.read_text())
    order = data["existential_cyclic_order"]
    positions = {point: index for index, point in enumerate(order)}
    rows = {center: set(support) for center, support in data["rows"].items()}

    results = []
    for theorem, arity, requirements in SCHEMAS:
        matches = matches_for(
            anchored_ordered_tuples(order, arity), rows, requirements)
        cyclic_matches = matches_for(
            cyclic_ordered_tuples(order, arity), rows, requirements)
        results.append({"theorem": theorem, "arity": arity,
                        "anchored_match_count": len(matches),
                        "anchored_matches": matches,
                        "cyclic_rotation_match_count": len(cyclic_matches),
                        "cyclic_rotation_matches": cyclic_matches})

    shared_pair_cases = []
    for first_center, second_center in itertools.combinations(order, 2):
        common = sorted(rows[first_center] & rows[second_center])
        for first_point, second_point in itertools.combinations(common, 2):
            first_between = (
                positions[first_center] < positions[first_point] < positions[second_center]
                or positions[second_center] < positions[first_point] < positions[first_center])
            second_between = (
                positions[first_center] < positions[second_point] < positions[second_center]
                or positions[second_center] < positions[second_point] < positions[first_center])
            shared_pair_cases.append({
                "centers": [first_center, second_center],
                "points": [first_point, second_point],
                "first_between": first_between,
                "second_between": second_between,
                "separated": first_between != second_between,
            })

    out = {
        "kind": "solver-free ordered incidence theorem-shape audit",
        "witness": str(args.witness),
        "cyclic_order": order,
        "schemas": results,
        "total_anchored_matches_by_arity": {
            str(arity): sum(r["anchored_match_count"] for r in results if r["arity"] == arity)
            for arity in (4, 5, 6)
        },
        "total_cyclic_rotation_matches_by_arity": {
            str(arity): sum(r["cyclic_rotation_match_count"] for r in results if r["arity"] == arity)
            for arity in (4, 5, 6)
        },
        "phase3_shared_pair_separation": {
            "active_case_count": len(shared_pair_cases),
            "all_separated": all(case["separated"] for case in shared_pair_cases),
            "cases": shared_pair_cases,
        },
    }
    rendered = json.dumps(out, indent=2) + "\n"
    if args.output:
        args.output.write_text(rendered)
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()
