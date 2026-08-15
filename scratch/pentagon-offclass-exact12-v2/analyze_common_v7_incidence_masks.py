#!/usr/bin/env python3
"""Summarize the checked five-incidence consumer mask in v7 journals.

This is theorem-mining analysis, not a proof artifact.  It identifies which
positive hypotheses of the checked tetrahedron consumer are absent from SAT
survivors before the ordinary certificate cascade eliminates them.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from itertools import permutations
from pathlib import Path

from probe import CARDINALITY, C, PHYSICAL_APEX


BITS = ("d_in_BO", "O_in_Kc", "u_in_Kc", "O_in_Kxv", "d_in_Kxv")


def tetrahedron_orientations(predicates):
    rows = {
        "Kxv": (C, set(predicates["Kxv"])),
        "Kc": (predicates["c_actual_blocker"], set(predicates["Kc"])),
        "BO": (PHYSICAL_APEX, set(predicates["BO"])),
    }
    results = []
    for x_name, y_name, b_name in permutations(rows):
        x, bx = rows[x_name]
        y, by = rows[y_name]
        b, bb = rows[b_name]
        common_points = sorted(bx & by & bb)
        facts = {
            "common_point": bool(common_points),
            "y_in_Bx": y in bx,
            "x_in_By": x in by,
            "b_in_By": b in by,
            "x_in_Bb": x in bb,
            "y_in_Bb": y in bb,
        }
        results.append(
            {
                "roles": {"Kx": x_name, "Ky": y_name, "Kb": b_name},
                "common_points": common_points,
                "facts": facts,
                "missing": sorted(key for key, value in facts.items() if not value),
                "deficit": sum(not value for value in facts.values()),
            }
        )
    return sorted(results, key=lambda item: (item["deficit"], tuple(item["roles"].values())))


def summarize(records):
    masks: Counter[str] = Counter()
    true_counts: Counter[str] = Counter()
    stages: dict[str, Counter[str]] = defaultdict(Counter)
    examples = {}
    orientation_deficits: Counter[int] = Counter()
    best_orientation_missing: Counter[str] = Counter()
    orientation_examples = {}
    orientation_stats = defaultdict(
        lambda: {
            "deficits": Counter(),
            "missing": Counter(),
            "missing_patterns": Counter(),
            "common_points": Counter(),
        }
    )
    row_membership_counts = {
        row: Counter() for row in ("Kxv", "Kc", "BO")
    }
    blocker_counts: Counter[int] = Counter()
    total = 0
    for origin, line_number, record in records:
        predicates = record["source_model"]["source_predicates"]
        status = predicates["tetrahedron_consumer_incidence_predicate"]
        mask = "".join("1" if status[bit] else "0" for bit in BITS)
        if status["all_five"] != (mask == "11111"):
            raise RuntimeError(f"{origin}:{line_number}: all_five mask drift")
        total += 1
        masks[mask] += 1
        for bit in BITS:
            true_counts[bit] += bool(status[bit])
        stage = record["stage"]
        stages[mask][stage] += 1
        blocker_counts[predicates["c_actual_blocker"]] += 1
        for row in row_membership_counts:
            row_membership_counts[row].update(predicates[row])
        examples.setdefault(
            mask,
            {
                "journal": str(origin),
                "line": line_number,
                "iteration": record["iteration"],
                "stage": stage,
                "c_actual_blocker": predicates["c_actual_blocker"],
                "Kxv": predicates["Kxv"],
                "Kc": predicates["Kc"],
                "BO": predicates["BO"],
            },
        )
        orientations = tetrahedron_orientations(predicates)
        for orientation in orientations:
            roles = orientation["roles"]
            role_key = ",".join(
                f"{role}={roles[role]}" for role in ("Kx", "Ky", "Kb")
            )
            stats = orientation_stats[role_key]
            stats["deficits"][orientation["deficit"]] += 1
            stats["missing"].update(orientation["missing"])
            stats["missing_patterns"]["+".join(orientation["missing"])] += 1
            stats["common_points"].update(orientation["common_points"])
        best = orientations[0]
        orientation_deficits[best["deficit"]] += 1
        best_orientation_missing.update(best["missing"])
        orientation_examples.setdefault(
            str(best["deficit"]),
            {
                "journal": str(origin),
                "line": line_number,
                "iteration": record["iteration"],
                "stage": stage,
                "best_orientation": best,
            },
        )
    return {
        "schema": "p97_common_v7_tetrahedron_incidence_mask_census.v1",
        "bit_order": list(BITS),
        "records": total,
        "all_five_records": masks["11111"],
        "mask_counts": dict(sorted(masks.items())),
        "true_counts": {bit: true_counts[bit] for bit in BITS},
        "missing_counts": {bit: total - true_counts[bit] for bit in BITS},
        "stage_counts_by_mask": {
            mask: dict(sorted(counter.items()))
            for mask, counter in sorted(stages.items())
        },
        "blocker_counts": {
            str(point): blocker_counts[point] for point in range(CARDINALITY)
        },
        "row_membership_counts": {
            row: {
                str(point): row_membership_counts[row][point]
                for point in range(CARDINALITY)
            }
            for row in row_membership_counts
        },
        "first_example_by_mask": dict(sorted(examples.items())),
        "general_tetrahedron_orientation_audit": {
            "exact_match_records": orientation_deficits[0],
            "minimum_deficit_counts": {
                str(key): value for key, value in sorted(orientation_deficits.items())
            },
            "missing_fact_counts_in_first_best_orientation": dict(
                sorted(best_orientation_missing.items())
            ),
            "first_example_by_minimum_deficit": dict(
                sorted(orientation_examples.items())
            ),
            "by_role_orientation": {
                role_key: {
                    "minimum_deficit_counts": {
                        str(deficit): count
                        for deficit, count in sorted(stats["deficits"].items())
                    },
                    "missing_fact_counts": dict(sorted(stats["missing"].items())),
                    "missing_pattern_counts": dict(
                        sorted(stats["missing_patterns"].items())
                    ),
                    "common_point_counts": {
                        str(point): count
                        for point, count in sorted(stats["common_points"].items())
                    },
                }
                for role_key, stats in sorted(orientation_stats.items())
            },
        },
        "status": "PASS" if masks["11111"] == 0 else "FAIL_ALL_FIVE_SURVIVED",
    }


def journal_records(paths):
    for path in paths:
        with path.open(encoding="utf-8") as stream:
            for line_number, line in enumerate(stream, start=1):
                if line.strip():
                    yield path, line_number, json.loads(line)


def self_test() -> None:
    def record(mask: str, iteration: int):
        status = {bit: digit == "1" for bit, digit in zip(BITS, mask)}
        status["all_five"] = mask == "11111"
        return {
            "iteration": iteration,
            "stage": "test-stage",
            "source_model": {
                "source_predicates": {
                    "tetrahedron_consumer_incidence_predicate": status,
                    "c_actual_blocker": 0,
                    "Kxv": [],
                    "Kc": [],
                    "BO": [],
                }
            },
        }

    summary = summarize(
        [
            (Path("self-test"), 1, record("10000", 0)),
            (Path("self-test"), 2, record("10101", 1)),
        ]
    )
    if summary["mask_counts"] != {"10000": 1, "10101": 1}:
        raise RuntimeError("mask aggregation self-test failed")
    if summary["missing_counts"]["d_in_BO"] != 0:
        raise RuntimeError("missing-bit aggregation self-test failed")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("journals", nargs="*", type=Path)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        if not args.journals:
            print('{"schema":"p97_common_v7_mask_census.self_test.v1","status":"PASS"}')
            return 0
    if not args.journals:
        parser.error("at least one journal is required unless --self-test is used")
    summary = summarize(journal_records(args.journals))
    rendered = json.dumps(summary, indent=2, sort_keys=True) + "\n"
    if args.out is None:
        print(rendered, end="")
    else:
        args.out.write_text(rendered, encoding="utf-8")
    return 0 if summary["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
