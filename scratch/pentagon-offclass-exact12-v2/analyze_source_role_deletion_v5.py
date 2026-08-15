#!/usr/bin/env python3
"""Stream and summarize the six exact-12 source/deletion v5 journals.

This is a read-only empirical analyzer.  It reports finite observations from
the recorded ``source_model`` objects; it does not infer theorem truth,
Euclidean realizability, or proof closure.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
JOURNAL_GLOB = "cegar-d0-v2-source-role-deletion-v5-*/journal.jsonl"
EXPECTED_JOURNAL_COUNT = 6

# These labels are the frozen labels used by probe.py and by the v5 branch
# manifests.  They are data-label conventions, not mathematical conclusions.
C_LABEL = 7
PHYSICAL_APEX_LABEL = 1
FIRST_APEX_LABEL = 2
U_LABEL = 6
XU_LABEL = 9
DELETED_LABEL = 0
V_LABEL = 2
XV_LABEL = 8
PHYSICAL_LABELS = frozenset((6, 7, 8, 9))
DELETION_LABELS = frozenset((10, 11))
SOURCE_ROLE_LABELS = {"u": 6, "xv": 8, "xu": 9}
DELETION_ROLE_LABELS = {"q": 10, "w": 11}
BLOCKER_DOMAIN = frozenset(range(12))
U_DELETION_PHYSICAL_CLASS = frozenset(
    (XU_LABEL, DELETED_LABEL, V_LABEL, XV_LABEL)
)
TETRAHEDRON_INCIDENCE_NAMES = (
    "center_xu_in_physical_class_after_u_deletion",
    "physical_apex_in_xu_row",
    "center_deleted_in_xu_row",
    "physical_apex_in_deleted_row",
    "center_xu_in_deleted_row",
)

HISTOGRAM_NAMES = (
    "stage",
    "selected_source_blocker",
    "selected_source_fiber_size",
    "c_blocker",
    "c_fiber_size",
    "max_fiber_size",
    "b_source_equals_b_c",
    "blocker_orbit_one_step",
    "blocker_orbit_two_step",
    "blocker_orbit_path",
    "selected_blocker_row_physical_intersection",
    "selected_blocker_row_qw_intersection",
    "selected_blocker_row_first_apex_intersection",
    "u_deletion_tetrahedron_incidence_count",
    "u_deletion_tetrahedron_incidence_mask",
    "u_deletion_tetrahedron_missing_mask",
    "source_role",
    "deletion_role",
)

INVARIANT_NAMES = (
    "source_model_present",
    "stage_present",
    "blocker_domain_is_0_to_11",
    "blocker_values_are_in_domain",
    "blocker_fibers_partition_domain",
    "max_fiber_size_matches_fibers",
    "selected_source_actual_blocker_matches_map",
    "c_actual_blocker_matches_map",
    "selected_source_fiber_contains_source",
    "selected_blocker_row_matches_cube",
    "source_role_label_matches_fixed_map",
    "deletion_role_label_matches_fixed_map",
    "source_radius_is_physical",
    "outside_first_apex_fiber",
    "deleted_point_absent_from_selected_blocker_row",
)


def _counter_json(counter: Counter[str]) -> dict[str, int]:
    """Convert a Counter to a stable JSON object with string keys."""

    return {key: counter[key] for key in sorted(counter)}


def _intersection_key(values: set[int], labels: frozenset[int]) -> str:
    intersection = sorted(values & labels)
    return ",".join(str(value) for value in intersection) or "none"


def _as_int_map(value: object, field: str) -> dict[int, int]:
    if not isinstance(value, dict):
        raise ValueError(f"{field} is not an object")
    try:
        return {int(key): int(item) for key, item in value.items()}
    except (TypeError, ValueError) as error:
        raise ValueError(f"{field} has a non-integer key or value") from error


def _as_int_sets(value: object, field: str) -> dict[int, set[int]]:
    if not isinstance(value, dict):
        raise ValueError(f"{field} is not an object")
    result: dict[int, set[int]] = {}
    try:
        for key, items in value.items():
            if not isinstance(items, list):
                raise ValueError(f"{field}[{key!r}] is not a list")
            result[int(key)] = {int(item) for item in items}
    except (TypeError, ValueError) as error:
        raise ValueError(f"{field} has a non-integer key or item") from error
    return result


def _extract(record: dict[str, object]) -> tuple[dict[str, str], dict[str, bool]]:
    """Extract one record's requested features and its structural checks."""

    source_model = record.get("source_model")
    if not isinstance(source_model, dict):
        raise ValueError("record has no object-valued source_model")
    predicates = source_model.get("source_predicates")
    if not isinstance(predicates, dict):
        raise ValueError("source_model has no object-valued source_predicates")

    blockers = _as_int_map(source_model.get("blockers"), "blockers")
    fibers = _as_int_sets(source_model.get("blocker_fibers"), "blocker_fibers")
    cube = _as_int_sets(source_model.get("cube"), "cube")

    try:
        stage = str(record["stage"])
        source_role = str(predicates["selected_source_role"])
        deletion_role = str(predicates["selected_deletion_role"])
        source_label = int(predicates["selected_source_label"])
        selected_source_blocker = int(predicates["selected_source_actual_blocker"])
        c_blocker = int(predicates["c_actual_blocker"])
        selected_row = {int(item) for item in predicates["selected_blocker_row"]}
        deletion_label = int(predicates["selected_deletion_label"])
        source_radius = str(predicates["selected_source_radius"])
        outside_first_apex = bool(predicates["outside_first_apex_fiber"])
        deleted_absent = bool(
            predicates["deleted_point_absent_from_selected_blocker_row"]
        )
    except (KeyError, TypeError, ValueError) as error:
        raise ValueError("source_model has a malformed source_predicates field") from error

    if selected_source_blocker not in fibers:
        raise ValueError("selected source blocker has no blocker fiber")
    if c_blocker not in fibers:
        raise ValueError("C blocker has no blocker fiber")
    if selected_source_blocker not in cube:
        raise ValueError("selected source blocker has no cube row")

    one_step = blockers.get(source_label)
    two_step = blockers.get(one_step) if one_step is not None else None
    if one_step is None or two_step is None:
        raise ValueError("selected source has an incomplete blocker orbit")

    center_xu = blockers[XU_LABEL]
    center_deleted = blockers[DELETED_LABEL]
    tetrahedron_incidences = {
        "center_xu_in_physical_class_after_u_deletion":
            center_xu in U_DELETION_PHYSICAL_CLASS,
        "physical_apex_in_xu_row": PHYSICAL_APEX_LABEL in cube[center_xu],
        "center_deleted_in_xu_row": center_deleted in cube[center_xu],
        "physical_apex_in_deleted_row":
            PHYSICAL_APEX_LABEL in cube[center_deleted],
        "center_xu_in_deleted_row": center_xu in cube[center_deleted],
    }
    incidence_mask = ",".join(
        name for name in TETRAHEDRON_INCIDENCE_NAMES
        if tetrahedron_incidences[name]
    ) or "none"
    missing_mask = ",".join(
        name for name in TETRAHEDRON_INCIDENCE_NAMES
        if not tetrahedron_incidences[name]
    ) or "none"

    features = {
        "stage": stage,
        "selected_source_blocker": str(selected_source_blocker),
        "selected_source_fiber_size": str(len(fibers[selected_source_blocker])),
        "c_blocker": str(c_blocker),
        "c_fiber_size": str(len(fibers[c_blocker])),
        "max_fiber_size": str(max(len(items) for items in fibers.values())),
        "b_source_equals_b_c": str(selected_source_blocker == c_blocker).lower(),
        "blocker_orbit_one_step": str(one_step),
        "blocker_orbit_two_step": str(two_step),
        "blocker_orbit_path": f"{source_label}->{one_step}->{two_step}",
        "selected_blocker_row_physical_intersection": _intersection_key(
            selected_row, PHYSICAL_LABELS
        ),
        "selected_blocker_row_qw_intersection": _intersection_key(
            selected_row, DELETION_LABELS
        ),
        "selected_blocker_row_first_apex_intersection": _intersection_key(
            selected_row, frozenset((FIRST_APEX_LABEL,))
        ),
        "u_deletion_tetrahedron_incidence_count": str(
            sum(tetrahedron_incidences.values())
        ),
        "u_deletion_tetrahedron_incidence_mask": incidence_mask,
        "u_deletion_tetrahedron_missing_mask": missing_mask,
        "source_role": source_role,
        "deletion_role": deletion_role,
    }

    domain = set(blockers)
    flattened = [source for fiber in fibers.values() for source in fiber]
    checks = {
        "source_model_present": True,
        "stage_present": bool(stage),
        "blocker_domain_is_0_to_11": domain == BLOCKER_DOMAIN,
        "blocker_values_are_in_domain": set(blockers.values()) <= BLOCKER_DOMAIN,
        "blocker_fibers_partition_domain": (
            set(flattened) == BLOCKER_DOMAIN
            and len(flattened) == len(set(flattened))
            and set(fibers) == set(blockers.values())
        ),
        "max_fiber_size_matches_fibers": features["max_fiber_size"]
        == str(max(len(items) for items in fibers.values())),
        "selected_source_actual_blocker_matches_map": (
            blockers.get(source_label) == selected_source_blocker
        ),
        "c_actual_blocker_matches_map": blockers.get(C_LABEL) == c_blocker,
        "selected_source_fiber_contains_source": (
            source_label in fibers[selected_source_blocker]
        ),
        "selected_blocker_row_matches_cube": selected_row == cube[selected_source_blocker],
        "source_role_label_matches_fixed_map": SOURCE_ROLE_LABELS.get(source_role)
        == source_label,
        "deletion_role_label_matches_fixed_map": DELETION_ROLE_LABELS.get(deletion_role)
        == deletion_label,
        "source_radius_is_physical": source_radius == "physical",
        "outside_first_apex_fiber": outside_first_apex,
        "deleted_point_absent_from_selected_blocker_row": deleted_absent
        and deletion_label not in selected_row,
    }
    return features, checks


class Aggregate:
    def __init__(self) -> None:
        self.record_count = 0
        self.source_model_count = 0
        self.histograms = {name: Counter() for name in HISTOGRAM_NAMES}
        self.invariant_failures = Counter({name: 0 for name in INVARIANT_NAMES})

    def add(self, record: dict[str, object]) -> tuple[str, dict[str, str]]:
        self.record_count += 1
        if not isinstance(record.get("source_model"), dict):
            self.invariant_failures["source_model_present"] += 1
            return "unknown", {}
        features, checks = _extract(record)
        self.source_model_count += 1
        for name, value in features.items():
            self.histograms[name][value] += 1
        for name, holds in checks.items():
            if not holds:
                self.invariant_failures[name] += 1
        branch = f"{features['source_role']}-{features['deletion_role']}"
        return branch, features

    def summary(self) -> dict[str, object]:
        return {
            "record_count": self.record_count,
            "source_model_count": self.source_model_count,
            "histograms": {
                name: _counter_json(self.histograms[name])
                for name in HISTOGRAM_NAMES
            },
            "invariants": {
                "checked_record_count": self.source_model_count,
                "all_hold": not any(self.invariant_failures.values()),
                "checks": {
                    name: {
                        "holds": self.invariant_failures[name] == 0,
                        "violations": self.invariant_failures[name],
                    }
                    for name in INVARIANT_NAMES
                },
            },
        }


def _journal_paths(root: Path) -> list[Path]:
    paths = sorted(root.glob(JOURNAL_GLOB))
    if len(paths) != EXPECTED_JOURNAL_COUNT:
        raise RuntimeError(
            f"expected {EXPECTED_JOURNAL_COUNT} v5 journals under {root}, found {len(paths)}"
        )
    return paths


def _iter_records(path: Path):
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            if not line.strip():
                continue
            try:
                record = json.loads(line)
            except json.JSONDecodeError as error:
                raise RuntimeError(f"invalid JSON at {path}:{line_number}") from error
            if not isinstance(record, dict):
                raise RuntimeError(f"JSON record is not an object at {path}:{line_number}")
            yield line_number, record


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=HERE)
    args = parser.parse_args()

    paths = _journal_paths(args.root)
    total = Aggregate()
    branches: dict[str, Aggregate] = {}
    input_paths: list[str] = []

    for path in paths:
        input_paths.append(str(path.relative_to(args.root)))
        for line_number, record in _iter_records(path):
            try:
                branch, _features = total.add(record)
                if branch == "unknown":
                    continue
                branch_aggregate = branches.setdefault(branch, Aggregate())
                branch_aggregate.add(record)
            except ValueError as error:
                raise RuntimeError(f"malformed source_model at {path}:{line_number}: {error}") from error

    output = {
        "schema": "p97_pentagon_offclass_exact12_source_role_deletion_v5_analysis.v2",
        "classification": "empirical_observation_only",
        "scope": (
            "streamed source_model statistics from six v5 journals; no theorem-truth, "
            "Euclidean-realizability, or proof-closure inference"
        ),
        "labels": {
            "C": C_LABEL,
            "physical_apex": PHYSICAL_APEX_LABEL,
            "first_apex": FIRST_APEX_LABEL,
            "physical": sorted(PHYSICAL_LABELS),
            "q_w": sorted(DELETION_LABELS),
            "source_roles": SOURCE_ROLE_LABELS,
            "deletion_roles": DELETION_ROLE_LABELS,
        },
        "consumer_probe": {
            "classification": "cross-stratum empirical diagnostic only",
            "journal_stratum": "D.A.card = 12",
            "consumer_live_stratum": "13 <= D.A.card",
            "lean_consumer": (
                "pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_"
                "false_of_tetrahedron_incidences"
            ),
            "incidences": list(TETRAHEDRON_INCIDENCE_NAMES),
            "warning": (
                "these exact-12 observations do not prioritize or refute the "
                "cardinality-at-least-13 missing-incidence leaf; no incidence "
                "is admitted as a learned clause without a separate checked "
                "source producer"
            ),
        },
        "inputs": input_paths,
        "aggregate": total.summary(),
        "per_branch": {
            branch: branches[branch].summary() for branch in sorted(branches)
        },
    }
    print(json.dumps(output, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (RuntimeError, ValueError) as error:
        print(f"analyze_source_role_deletion_v5.py: {error}", file=sys.stderr)
        raise SystemExit(1)
