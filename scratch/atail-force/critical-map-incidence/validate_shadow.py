#!/usr/bin/env python3
"""Replay a robust cross-nonmembership packet in the saved card-12 shadow.

The underlying shadow is independently revalidated by the existing
``global_count_boundary`` checker before this focused packet is inspected.
The verdict is deliberately limited to the strengthened finite abstraction.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
from types import ModuleType
from typing import Mapping


HERE = Path(__file__).resolve().parent
GLOBAL = HERE.parent / "global_count_boundary"
EXPECTED = {
    "status": "VALIDATED_ROBUST_CRITICAL_MAP_SHADOW_ONLY",
    "target_faithful": False,
    "source_case_sha256":
        "0f3d1cf14f1ada1f782f8da5ad550b0aa997fc4b6a932de43b9e137efbcfee6f",
    "profile": [5, 5, 5],
    "surplus_cap": [0, 1, 2, 3, 4],
    "first_apex": 4,
    "second_apex": 0,
    "pair": [10, 11],
    "first_apex_distance_labels": [["radius", 4], ["radius", 4]],
    "second_apex_distance_labels": [["radius", 10], ["edge", 0, 11]],
    "blocker_centers": [1, 3],
    "selected_supports": [[0, 3, 8, 10], [2, 4, 6, 11]],
    "selected_support_intersection": [],
    "blockers_in_surplus_cap": True,
    "single_deletion_survival_at_second_apex": [True, True],
    "cross_deletion_survival_at_actual_blockers": [True, True],
    "reciprocal_cross_nonmembership": [True, True],
    "bank_positive_antecedents": {
        "common_blocker": False,
        "reciprocal_cross_membership": False,
        "selected_support_shared_pair": False,
        "two_apex_joint_radius_pair": False,
    },
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def load_global_validator() -> ModuleType:
    path = GLOBAL / "validator.py"
    spec = importlib.util.spec_from_file_location("atail_global_validator", path)
    require(spec is not None and spec.loader is not None, "validator import failed")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def k4_survives_at(
    validator: ModuleType,
    rows: Mapping[int, frozenset[int]],
    center: int,
    deleted: int,
    cardinality: int,
) -> bool:
    classes = validator.classes_at(rows, center, set(range(cardinality)) - {deleted})
    return max(
        (len(points) for label, points in classes.items() if label != ("zero",)),
        default=0,
    ) >= 4


def validate() -> dict[str, object]:
    validator = load_global_validator()
    shadows = validator.load_json(GLOBAL / "shadows.json")
    case = next(case for case in shadows["cases"] if case["profile"] == [5, 5, 5])
    source_report = validator.validate_case(case)

    n = len(case["cyclic_order"])
    rows = validator.parse_rows(case["rows"], n)
    blocker = {int(source): int(center) for source, center in
               case["critical_shell_blocker_map"].items()}
    surplus_cap = tuple(case["caps"][case["surplus_cap_index"]])
    first_apex, second_apex = 4, 0
    q, w = 10, 11
    cq, cw = blocker[q], blocker[w]
    sq, sw = rows[cq], rows[cw]

    require(q != w, "the robust pair collapsed")
    require(q not in surplus_cap and w not in surplus_cap, "the pair is not off surplus")
    require(
        validator.distance_label(rows, first_apex, q)
        == validator.distance_label(rows, first_apex, w),
        "the pair is not first-apex co-radial",
    )
    require(
        validator.distance_label(rows, second_apex, q)
        != validator.distance_label(rows, second_apex, w),
        "the forbidden two-apex joint pair survives",
    )
    require(q in sq and w in sw, "the critical map omits a source from its shell")
    require(w not in sq and q not in sw, "a reciprocal cross hit survives")
    require(cq != cw, "the two blockers coincide")
    require(not (sq & sw), "the two exact selected supports are not disjoint")

    second_survival = [
        k4_survives_at(validator, rows, second_apex, q, n),
        k4_survives_at(validator, rows, second_apex, w, n),
    ]
    cross_survival = [
        k4_survives_at(validator, rows, cq, w, n),
        k4_survives_at(validator, rows, cw, q, n),
    ]
    require(all(second_survival), "a survivor deletion fails at the second apex")
    require(all(cross_survival), "a robust cross deletion fails at an actual blocker")

    return {
        "status": "VALIDATED_ROBUST_CRITICAL_MAP_SHADOW_ONLY",
        "target_faithful": False,
        "source_case_sha256": source_report["case_sha256"],
        "profile": list(case["profile"]),
        "surplus_cap": list(surplus_cap),
        "first_apex": first_apex,
        "second_apex": second_apex,
        "pair": [q, w],
        "first_apex_distance_labels": [
            list(validator.distance_label(rows, first_apex, q)),
            list(validator.distance_label(rows, first_apex, w)),
        ],
        "second_apex_distance_labels": [
            list(validator.distance_label(rows, second_apex, q)),
            list(validator.distance_label(rows, second_apex, w)),
        ],
        "blocker_centers": [cq, cw],
        "selected_supports": [sorted(sq), sorted(sw)],
        "selected_support_intersection": sorted(sq & sw),
        "blockers_in_surplus_cap": cq in surplus_cap and cw in surplus_cap,
        "single_deletion_survival_at_second_apex": second_survival,
        "cross_deletion_survival_at_actual_blockers": cross_survival,
        "reciprocal_cross_nonmembership": [w not in sq, q not in sw],
        "bank_positive_antecedents": {
            "common_blocker": cq == cw,
            "reciprocal_cross_membership": w in sq and q in sw,
            "selected_support_shared_pair": len(sq & sw) >= 2,
            "two_apex_joint_radius_pair":
                validator.distance_label(rows, second_apex, q)
                == validator.distance_label(rows, second_apex, w),
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    report = validate()
    if args.check:
        require(report == EXPECTED, "focused robust checkpoint drifted")
    if args.json:
        print(json.dumps(report, indent=2, sort_keys=True))
        return
    print(f"status: {report['status']}")
    print(f"checkpoint: {'MATCH' if report == EXPECTED else 'DRIFT'}")
    print(
        "pair/blockers/support-overlap: "
        f"{report['pair']} / {report['blocker_centers']} / "
        f"{report['selected_support_intersection']}"
    )


if __name__ == "__main__":
    main()
