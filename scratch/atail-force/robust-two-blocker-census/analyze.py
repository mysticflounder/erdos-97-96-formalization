#!/usr/bin/env python3
"""Bounded audit of the ATAIL card-five two-blocker branch.

This joins no data that the saved artifacts do not actually share.  It counts
the source pairs certified by the two stored apex classes in every one of the
930 post-one-hit residues, then separately classifies the eligible endpoint
pairs in the two saved total-critical-map shadows.  The latter are diagnostic
card-four shadows, not realizations of the 930 card-five surface.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from types import ModuleType

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_surface as surface


HERE = Path(__file__).resolve().parent
REMAINING = ROOT / "scratch/atail-force/remaining-pattern-map/analyze.py"
GLOBAL = ROOT / "scratch/atail-force/global_count_boundary"
COVERAGE = ROOT / "census/atail_force/producer_coverage_census_checkpoint.json"
ROUND2 = ROOT / "census/atail_force/producer_pattern_census_round2_checkpoint.json"
LEAN_FRONTIER = ROOT / "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean"

EXPECTED_RESIDUES = {
    "card11_profile_554": 96,
    "card12_profile_654": 150,
    "card12_profile_555": 684,
}
EXPECTED = {
    "residue_count": 930,
    "all_off_surplus_first_row_pairs": 5580,
    "second_row_certified_source_pairs": 3318,
    "round2_queries": 36,
    "round2_statuses": {"TIMEOUT": 36},
    "shadow_branch_counts": {
        "mutual_membership_common_blocker": 1,
        "one_way_membership_distinct_blockers": 1,
        "reciprocal_nonmembership_distinct_blockers": 2,
    },
}


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def residue_counts() -> tuple[list[dict[str, object]], int, int]:
    remaining = load_module("atail_remaining_pattern_map", REMAINING)
    records: list[dict[str, object]] = []
    total_residues = 0
    total_all_pairs = 0
    total_certified_pairs = 0
    for case in surface.PRODUCER_CASES:
        # The new Lean theorem applies uniformly to this entire surface.
        if case.opp_apex1_exact_sizes != (5,):
            raise AssertionError(f"{case.case_id}: first class is not exactly card five")
        surplus = set(surface.frame_for_case(case).S)
        strata: Counter[tuple[int, int, int]] = Counter()
        residues = all_pairs = certified_pairs = 0
        for first, second in remaining.survivor_pairs(case):
            if "adjacent_cap_one_hit_violation:any" in remaining.motifs(
                case, first, second
            ):
                continue
            residues += 1
            off_first = set(first.support) - surplus
            if len(off_first) != 4:
                raise AssertionError(f"{case.case_id}: first off-surplus size drift")
            all_pairs += len(tuple(itertools.combinations(off_first, 2)))

            # A card-five second row survives every single deletion.  A
            # card-four row certifies precisely the sources outside its row.
            certified_sources = sorted(
                x
                for x in off_first
                if len(second.support) == 5 or x not in second.support
            )
            certified = len(tuple(itertools.combinations(certified_sources, 2)))
            certified_pairs += certified
            intersection = len(off_first & set(second.support))
            strata[(len(second.support), intersection, certified)] += 1

        if residues != EXPECTED_RESIDUES[case.case_id]:
            raise AssertionError(f"{case.case_id}: residue count drift")
        records.append(
            {
                "case_id": case.case_id,
                "residues": residues,
                "first_exact_class_cardinality": 5,
                "off_surplus_first_row_points_per_residue": 4,
                "all_off_surplus_first_row_pairs": all_pairs,
                "second_row_certified_source_pairs": certified_pairs,
                "strata": [
                    {
                        "second_exact_class_cardinality": key[0],
                        "off_surplus_row_intersection": key[1],
                        "certified_pairs_per_residue": key[2],
                        "residues": count,
                    }
                    for key, count in sorted(strata.items())
                ],
            }
        )
        total_residues += residues
        total_all_pairs += all_pairs
        total_certified_pairs += certified_pairs
    return records, total_all_pairs, total_certified_pairs


def survives_at(validator: ModuleType, rows, center: int, deleted: int, n: int) -> bool:
    classes = validator.classes_at(rows, center, set(range(n)) - {deleted})
    return max(
        (len(points) for label, points in classes.items() if label != ("zero",)),
        default=0,
    ) >= 4


def classify_shadow_pair(rows, blocker, q: int, w: int) -> str:
    q_to_w = w in rows[blocker[q]]
    w_to_q = q in rows[blocker[w]]
    same = blocker[q] == blocker[w]
    if q_to_w and w_to_q and same:
        return "mutual_membership_common_blocker"
    if q_to_w != w_to_q and not same:
        return "one_way_membership_distinct_blockers"
    if not q_to_w and not w_to_q and not same:
        return "reciprocal_nonmembership_distinct_blockers"
    return "other"


def shadow_diagnostics() -> tuple[list[dict[str, object]], Counter[str]]:
    validator = load_module("atail_global_validator", GLOBAL / "validator.py")
    shadows = json.loads((GLOBAL / "shadows.json").read_text())
    records: list[dict[str, object]] = []
    totals: Counter[str] = Counter()
    for case_index, case in enumerate(shadows["cases"]):
        n = len(case["cyclic_order"])
        rows = validator.parse_rows(case["rows"], n)
        blocker = {
            int(source): int(center)
            for source, center in case["critical_shell_blocker_map"].items()
        }
        surplus = tuple(case["caps"][case["surplus_cap_index"]])
        off_surplus = set(range(n)) - set(surplus)
        for first_apex, second_apex in (
            (surplus[0], surplus[-1]),
            (surplus[-1], surplus[0]),
        ):
            eligible = []
            for q, w in itertools.combinations(sorted(off_surplus), 2):
                if validator.distance_label(rows, first_apex, q) != validator.distance_label(
                    rows, first_apex, w
                ):
                    continue
                if not survives_at(validator, rows, second_apex, q, n):
                    continue
                if not survives_at(validator, rows, second_apex, w, n):
                    continue
                if blocker[q] == second_apex or blocker[w] == second_apex:
                    continue
                branch = classify_shadow_pair(rows, blocker, q, w)
                totals[branch] += 1
                eligible.append(
                    {
                        "pair": [q, w],
                        "blockers": [blocker[q], blocker[w]],
                        "q_row_contains_w": w in rows[blocker[q]],
                        "w_row_contains_q": q in rows[blocker[w]],
                        "branch": branch,
                    }
                )
            records.append(
                {
                    "shadow_case_index": case_index,
                    "profile": case["profile"],
                    "first_apex": first_apex,
                    "second_apex": second_apex,
                    "first_exact_row_cardinality": len(rows[first_apex]),
                    "eligible_pairs": eligible,
                    "card_five_theorem_applicable": len(rows[first_apex]) >= 5,
                }
            )
    return records, totals


def build() -> dict[str, object]:
    cases, all_pairs, certified_pairs = residue_counts()
    shadow_records, shadow_counts = shadow_diagnostics()
    round2 = json.loads(ROUND2.read_text())
    statuses = Counter(row["status"] for row in round2["results"])
    document = {
        "epistemic_status": "EXHAUSTIVE_FOR_STATED_FINITE_ARTIFACTS_ONLY",
        "inputs_sha256": {
            "coverage_checkpoint": sha256(COVERAGE),
            "round2_checkpoint": sha256(ROUND2),
            "critical_map_shadows": sha256(GLOBAL / "shadows.json"),
            "critical_pair_frontier_lean": sha256(LEAN_FRONTIER),
        },
        "residue_surface": {
            "residue_count": sum(record["residues"] for record in cases),
            "all_off_surplus_first_row_pairs": all_pairs,
            "second_row_certified_source_pairs": certified_pairs,
            "cases": cases,
            "critical_map_fields_present": False,
            "branch_counts_available": False,
        },
        "round2": {
            "queries": len(round2["results"]),
            "statuses": dict(sorted(statuses.items())),
            "critical_map_fields_present": False,
        },
        "card_five_logical_partition": {
            "common_blocker_iff_mutual_cross_membership": True,
            "distinct_blocker_branches": [
                "exactly one directed cross membership",
                "reciprocal cross nonmembership",
            ],
            "basis": [
                "blocker_centers_eq_of_five_le_of_mutual_cross_membership",
                "blocker_centers_ne_of_not_mem_other_selected_support in both source orders",
            ],
            "computational_branch_counts_claimed": False,
        },
        "saved_total_critical_map_shadows": {
            "target_faithful": False,
            "records": shadow_records,
            "branch_counts": dict(sorted(shadow_counts.items())),
            "warning": "all four oriented packets have first-apex row cardinality four",
        },
    }
    observed = {
        "residue_count": document["residue_surface"]["residue_count"],
        "all_off_surplus_first_row_pairs": all_pairs,
        "second_row_certified_source_pairs": certified_pairs,
        "round2_queries": document["round2"]["queries"],
        "round2_statuses": document["round2"]["statuses"],
        "shadow_branch_counts": document["saved_total_critical_map_shadows"][
            "branch_counts"
        ],
    }
    if observed != EXPECTED:
        raise AssertionError(
            "robust two-blocker census drift:\n"
            + json.dumps({"expected": EXPECTED, "observed": observed}, indent=2)
        )
    return document


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build()
    if args.check:
        print(
            json.dumps(
                {
                    "status": "PASS",
                    "residues": document["residue_surface"]["residue_count"],
                    "certified_source_pairs": document["residue_surface"][
                        "second_row_certified_source_pairs"
                    ],
                    "critical_branch_counts_available_for_930": False,
                },
                sort_keys=True,
            )
        )
    else:
        print(json.dumps(document, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
