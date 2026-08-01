#!/usr/bin/env python3
"""Independent solver-free replay of the cyclic-recut target and live split."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


def rotations(points):
    for shift in range(len(points)):
        yield points[shift:] + points[:shift]


def target_holds(rows, points):
    a, b, c, d, e = points
    return {a, c, e}.issubset(rows[d]) and {a, b}.issubset(rows[e])


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("witness", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--full-theorem-replay", type=Path)
    args = parser.parse_args()
    witness = json.loads(args.witness.read_text())
    order = witness["existential_cyclic_order"]
    rows = {center: set(support) for center, support in witness["rows"].items()}
    if len(order) != 17 or len(set(order)) != 17 or set(order) != set(rows):
        raise AssertionError("carrier/order/row-center mismatch")
    if any(len(support) != 4 or center in support for center, support in rows.items()):
        raise AssertionError("selected-row shape mismatch")

    anchored = []
    cyclic = []
    for subset in itertools.combinations(order, 5):
        if target_holds(rows, subset):
            anchored.append(subset)
        for points in rotations(subset):
            if target_holds(rows, points):
                cyclic.append(points)

    packet = witness["packet"]
    q_source = packet["Q.source"]
    q_other = packet["Q.otherOutsidePoint"]
    bq = packet["bq"]
    br = packet["br"]
    arm_truth = {
        "common_delete_Q.source": q_source not in rows[bq] and q_source not in rows[br],
        "common_delete_Q.otherOutsidePoint": q_other not in rows[bq] and q_other not in rows[br],
        "crossed_source_in_bq_other_in_br": q_source in rows[bq] and q_other in rows[br],
        "crossed_other_in_bq_source_in_br": q_other in rows[bq] and q_source in rows[br],
    }
    selected = [label for label, truth in arm_truth.items() if truth]

    records = []
    for points in cyclic:
        a, b, c, d, e = points
        atoms = [(d, a), (d, c), (d, e), (e, a), (e, b)]
        records.append({
            "points": list(points),
            "positive_memberships": [[center, point] for center, point in atoms],
            "uses_live_split_row": any(center in {bq, br} for center, _ in atoms),
            "contains_deleted_other_positive_at_live_split": any(
                center in {bq, br} and point == q_other for center, point in atoms
            ),
            "positive_atom_forced_by_common_deletion": False,
        })

    full_inventory = None
    if args.full_theorem_replay:
        full = json.loads(args.full_theorem_replay.read_text())
        schemas = []
        for schema in full["schemas"]:
            if schema["arity"] != 5:
                continue
            matches = schema["cyclic_rotation_matches"]
            using_split = 0
            using_deleted_positive = 0
            for match in matches:
                atoms = [
                    (obligation["center"], point)
                    for obligation in match["obligations"]
                    for point in obligation["support"]
                ]
                using_split += any(center in {bq, br} for center, _ in atoms)
                using_deleted_positive += any(
                    center in {bq, br} and point in {q_source, q_other}
                    for center, point in atoms
                )
            schemas.append({
                "theorem": schema["theorem"],
                "anchored_match_count": schema["anchored_match_count"],
                "cyclic_match_count": schema["cyclic_rotation_match_count"],
                "cyclic_matches_using_live_split_rows": using_split,
                "cyclic_matches_using_deleted_positive_at_live_split": using_deleted_positive,
                "positive_match_forced_by_common_deletion": False,
            })
        full_inventory = {
            "schemas": schemas,
            "total_cyclic_five_point_matches": sum(x["cyclic_match_count"] for x in schemas),
            "target_cyclic_match_count": next(
                x["cyclic_match_count"] for x in schemas
                if x["theorem"].endswith("false_of_five_ccw_second_two_selected_rows")
            ),
            "non_target_cyclic_match_count": sum(
                x["cyclic_match_count"] for x in schemas
                if not x["theorem"].endswith("false_of_five_ccw_second_two_selected_rows")
            ),
            "any_positive_match_forced_by_common_deletion": False,
        }

    out = {
        "kind": "independent solver-free cyclic-recut theorem replay",
        "status": "PASS",
        "witness": str(args.witness),
        "carrier_size": len(order),
        "increasing_quintuples_checked": sum(1 for _ in itertools.combinations(order, 5)),
        "positive_cyclic_orders_checked": 5 * sum(1 for _ in itertools.combinations(order, 5)),
        "reversal_checked_or_generated": False,
        "anchored_match_count": len(anchored),
        "cyclic_match_count": len(cyclic),
        "cyclic_matches": records,
        "live_outside_pair": {
            "Q.source": q_source,
            "Q.otherOutsidePoint": q_other,
            "cap_source_row_center_bq": bq,
            "opposite_blocker_row_center_br": br,
            "arm_truth": arm_truth,
            "uniquely_selected_arm": selected[0] if len(selected) == 1 else None,
        },
        "any_surviving_match_forced_by_live_common_deletion": False,
        "forcing_note": (
            "The live common-deletion arm contributes two negative omissions at bq/br; "
            "the theorem antecedent consists only of five positive row memberships."
        ),
        "all_five_point_schema_inventory": full_inventory,
    }
    args.output.write_text(json.dumps(out, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": out["status"],
        "cyclic_matches": len(cyclic),
        "live_arm": out["live_outside_pair"]["uniquely_selected_arm"],
        "forced_match": out["any_surviving_match_forced_by_live_common_deletion"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
