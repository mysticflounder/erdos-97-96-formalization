#!/usr/bin/env python3
"""Audit cap/order/row roles of the nearest U1 obstruction matches."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path

from census.multi_center import multi_center_census as mc


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MATCH = HERE / "checkpoint.json"
SOURCE = (
    ROOT
    / "scratch/atail-force/second_center_query/"
    "formalized_core_shards_after_current_bank_checkpoint.json"
)
OUTPUT = HERE / "role_audit_checkpoint.json"


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def cap_role(frame: mc.Frame, point: int) -> str:
    if point == 0:
        return "moser:O1-O2"
    if point == 1:
        return "moser:S-O2"
    if point == 2:
        return "moser:S-O1"
    for name, points in frame.ints.items():
        if point in points:
            return f"strict:{name}"
    raise AssertionError(point)


def build() -> dict[str, object]:
    match = json.loads(MATCH.read_text(encoding="utf-8"))
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    source_by_shard = {
        int(case["partition"]["shard_index"]): case for case in source["cases"]
    }
    details = []
    grouped: dict[str, Counter[tuple[object, ...]]] = defaultdict(Counter)
    for nearest in match["cases"]:
        shard = int(nearest["shard_index"])
        survivor = source_by_shard[shard]["survivor"]
        frame = mc.build_frame(tuple(int(x) for x in survivor["profile"]))
        alternatives = {
            tuple(int(x) for x in row["missing_hypotheses"]): row
            for row in nearest["minimum_missing_set_counts"]
        }
        if int(nearest["minimum_missing_hypothesis_count"]) == 1 and (5,) in alternatives:
            preferred_missing = (5,)
        elif int(nearest["minimum_missing_hypothesis_count"]) == 1 and (4,) in alternatives:
            preferred_missing = (4,)
        elif int(nearest["minimum_missing_hypothesis_count"]) == 2 and (5, 7) in alternatives:
            preferred_missing = (5, 7)
        else:
            preferred_missing = tuple(
                int(x) for x in nearest["lexicographically_first_missing_hypotheses"]
            )
        preferred = alternatives[preferred_missing]
        roles = dict(zip(
            ("a", "c", "d", "e", "f"),
            preferred["first_assignment_a_c_d_e_f"],
            strict=True,
        ))
        rows = {
            int(row["center"]): {
                "support": tuple(int(x) for x in row["support"]),
                "exact": bool(row["exact"]),
            }
            for row in survivor["distinct_metric_rows"]
        }
        missing = preferred_missing
        missing_specs = {
            1: ("c", "a", "d"),
            2: ("c", "a", "f"),
            3: ("d", "c", "e"),
            4: ("d", "c", "f"),
            5: ("f", "a", "d"),
            6: ("f", "a", "e"),
            7: ("e", "a", "c"),
        }
        missing_rows = []
        for hypothesis in missing:
            center_role, left_role, right_role = missing_specs[hypothesis]
            center = roles[center_role]
            left = roles[left_role]
            right = roles[right_role]
            row = rows[center]
            missing_rows.append(
                {
                    "hypothesis": hypothesis,
                    "center_role": center_role,
                    "left_role": left_role,
                    "right_role": right_role,
                    "center": center,
                    "left": left,
                    "right": right,
                    "center_cap_role": cap_role(frame, center),
                    "left_cap_role": cap_role(frame, left),
                    "right_cap_role": cap_role(frame, right),
                    "selected_support_at_center": list(row["support"]),
                    "selected_row_exact": row["exact"],
                    "left_in_selected_support": left in row["support"],
                    "right_in_selected_support": right in row["support"],
                }
            )
            grouped[str(missing)][
                (
                    hypothesis,
                    cap_role(frame, center),
                    cap_role(frame, left),
                    cap_role(frame, right),
                    str(left in row["support"]),
                    str(right in row["support"]),
                )
            ] += 1
        order = tuple(int(x) for x in survivor["frame"]["cyclic_order"])
        position = {point: index for index, point in enumerate(order)}
        details.append(
            {
                "shard_index": shard,
                "lexicographically_first_missing_hypotheses": nearest[
                    "lexicographically_first_missing_hypotheses"
                ],
                "preferred_assignment_policy": "h5; else h4; two-edge h5+h7",
                "missing_hypotheses": list(missing),
                "roles": roles,
                "role_cap_positions": {
                    role: {
                        "cap_role": cap_role(frame, point),
                        "cyclic_index": position[point],
                    }
                    for role, point in roles.items()
                },
                "missing_rows": missing_rows,
            }
        )
    return {
        "schema": "p97-atail-current-u1-nearest-match-role-audit-v1",
        "scope": {
            "fixed_card_12_555_placement_only": True,
            "finite_shadow_only": True,
            "producer_proved": False,
        },
        "inputs": {
            "match": str(MATCH.relative_to(ROOT)),
            "match_sha256": digest(MATCH),
            "source": str(SOURCE.relative_to(ROOT)),
            "source_sha256": digest(SOURCE),
        },
        "case_count": len(details),
        "grouped_missing_edge_roles": {
            group: [
                {
                    "count": count,
                    "hypothesis": key[0],
                    "center_cap_role": key[1],
                    "left_cap_role": key[2],
                    "right_cap_role": key[3],
                    "left_in_selected_support": key[4] == "True",
                    "right_in_selected_support": key[5] == "True",
                }
                for key, count in sorted(counter.items(), key=lambda item: (-item[1], item[0]))
            ]
            for group, counter in sorted(grouped.items())
        },
        "cases": details,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    rendered = json.dumps(build(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
