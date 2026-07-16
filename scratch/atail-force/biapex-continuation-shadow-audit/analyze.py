#!/usr/bin/env python3
"""Audit the bi-apex continuation pattern after the own-cap-bound refresh.

This is theorem-discovery evidence only.  The rows are from one pinned,
fixed-label card-12 ``(5,5,5)`` finite-incidence search.  They are not
Euclidean realizations and do not cover arbitrary carrier cardinality.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import refresh as refresh_driver  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


SOURCE = HERE / "selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json"
EXPECTED_SOURCE_SHA256 = (
    "ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9"
)
EXPECTED_ORIGINAL_SOURCE_SHA256 = (
    "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def classify_two_by_two(matrix: list[list[int]]) -> str:
    """Classify a Boolean 2x2 matrix without discarding orientation."""

    entries = sum(sum(row) for row in matrix)
    if entries == 0:
        return "zero"
    if entries == 1:
        return "one"
    if entries == 3:
        return "three"
    if entries == 4:
        return "full"
    row_sums = [sum(row) for row in matrix]
    column_sums = [matrix[0][j] + matrix[1][j] for j in range(2)]
    if row_sums == [1, 1] and column_sums == [1, 1]:
        if matrix == [[1, 0], [0, 1]]:
            return "alternating-identity-permutation"
        return "alternating-swap-permutation"
    if 2 in row_sums:
        return "two-same-row"
    if 2 in column_sums:
        return "two-same-column"
    raise AssertionError(f"unclassified 2x2 matrix: {matrix}")


def cap_role(frame: mc.Frame, point: int) -> dict[str, object]:
    if point in mc.MOSER_SET:
        opposite = {0: "S", 1: "O1", 2: "O2"}[point]
        return {
            "kind": "Moser-apex",
            "opposite_cap": opposite,
            "incident_caps": list(mc.VERT_CAPS[point]),
        }
    return {
        "kind": "strict-cap-interior",
        "cap": frame.cap_of_int[point],
    }


def pair_grid(
    rows: dict[int, frozenset[int]],
    frame: mc.Frame,
    first_pair: tuple[int, int],
    second_pair: tuple[int, int],
) -> dict:
    a, b = first_pair
    z1, z2 = second_pair
    first_pair_set = frozenset(first_pair)
    continuation_rows = []
    extensions = []
    for z in second_pair:
        own_cap_hits = rows[z] & frame.O2
        extension = {
            "center": z,
            "missing_memberships": len(first_pair_set - rows[z]),
            "present_members": sorted(first_pair_set & rows[z]),
        }
        extensions.append(extension)
        continuation_rows.append(
            {
                "center": z,
                "support": sorted(rows[z]),
                "outside_o2": sorted(rows[z] - frame.O2),
                "own_o2_hits": sorted(own_cap_hits),
                "own_o2_hit_count": len(own_cap_hits),
                "passes_selected_row_own_cap_bound": len(own_cap_hits) <= 2,
                "first_strict_pair_hits": sorted(rows[z] & first_pair_set),
                "first_strict_pair_hit_count": len(rows[z] & first_pair_set),
            }
        )

    common_outside = sorted(
        (rows[z1] - frame.O2) & (rows[z2] - frame.O2)
    )
    if len(common_outside) > 1:
        raise AssertionError("two continuation rows share two outside points")
    forward = [
        [int(a in rows[z1]), int(b in rows[z1])],
        [int(a in rows[z2]), int(b in rows[z2])],
    ]
    reverse = [
        [int(z1 in rows[a]), int(z2 in rows[a])],
        [int(z1 in rows[b]), int(z2 in rows[b])],
    ]
    z_cross = {
        "z2_in_row_z1": z2 in rows[z1],
        "z1_in_row_z2": z1 in rows[z2],
    }
    z_cross_count = sum(int(value) for value in z_cross.values())
    z_cross_pattern = ("zero", "one", "mutual")[z_cross_count]
    forward_pattern = classify_two_by_two(forward)
    reverse_pattern = classify_two_by_two(reverse)
    missing_ledger = []
    for row_index, z in enumerate(second_pair):
        missing_count = 2 - sum(forward[row_index])
        for column_index, source in enumerate(first_pair):
            if forward[row_index][column_index]:
                continue
            missing_ledger.append(
                {
                    "continuation_center": z,
                    "first_strict_source": source,
                    "source_absent_from_center_row": True,
                    "finite_shadow_deletion_status": (
                        "SURVIVING_SELECTED_FOUR_ROW_PRESENT"
                    ),
                    "center_is_css_blocker_eligible_for_source": False,
                    "center_is_chosen_css_blocker_for_source": False,
                    "css_reason": (
                        "the fixed-shadow query only chooses a source blocker "
                        "from global rows containing that source"
                    ),
                    "one_edge_completion_of_this_center_row": (
                        missing_count == 1
                    ),
                    "h4_h5_comparison": (
                        "NOT_EVALUATED_ROLE_MAP_NOT_RETAINED"
                    ),
                }
            )
    best_extension = min(
        extensions,
        key=lambda item: (item["missing_memberships"], item["center"]),
    )
    return {
        "first_strict_pair": list(first_pair),
        "second_strict_pair": list(second_pair),
        "continuation_rows": continuation_rows,
        "continuation_common_outside_o2": common_outside,
        "forward_rows_z1_z2_columns_a_b": forward,
        "forward_pattern": forward_pattern,
        "reverse_rows_a_b_columns_z1_z2": reverse,
        "reverse_pattern": reverse_pattern,
        "z_cross_memberships": z_cross,
        "z_cross_pattern": z_cross_pattern,
        "combined_pattern": (
            f"{forward_pattern}/{reverse_pattern}/{z_cross_pattern}"
        ),
        "named_point_cap_roles": {
            str(point): cap_role(frame, point)
            for point in (1, 2, a, b, z1, z2)
        },
        "missing_forward_incidence_ledger": missing_ledger,
        "one_edge_completion_candidates": [
            entry
            for entry in missing_ledger
            if entry["one_edge_completion_of_this_center_row"]
        ],
        "minimum_pair_membership_extensions": best_extension[
            "missing_memberships"
        ],
        "preferred_extension": best_extension,
    }


def analyze_case(case: dict) -> dict:
    survivor = case["survivor"]
    profile = tuple(survivor["profile"])
    if profile != (5, 5, 5):
        raise AssertionError(f"unexpected profile: {profile}")
    frame = mc.build_frame(profile)
    rows = {
        int(row["center"]): frozenset(int(x) for x in row["support"])
        for row in survivor["distinct_metric_rows"]
    }
    if any(
        not bool(row["exact"])
        for row in survivor["distinct_metric_rows"]
    ):
        raise AssertionError("survivor contains a non-exact selected row")
    if set(rows) != set(range(frame.n)):
        raise AssertionError("survivor lacks a global row at some center")

    # Canonically, O1 and O2 have opposite Moser apices 1 and 2.
    first_apex = 1
    second_apex = 2
    first_strict_candidates = rows[first_apex] & frame.caps_int["O1"]
    second_strict_candidates = rows[second_apex] & frame.caps_int["O2"]
    if len(first_strict_candidates) < 2 or len(second_strict_candidates) < 2:
        raise AssertionError("survivor lacks the proved bi-apex packet")
    first_pairs = tuple(combinations(sorted(first_strict_candidates), 2))
    second_pairs = tuple(combinations(sorted(second_strict_candidates), 2))
    grids = [
        pair_grid(rows, frame, first_pair, second_pair)
        for first_pair in first_pairs
        for second_pair in second_pairs
    ]
    canonical_grid = grids[0]
    existential_best = min(
        grids,
        key=lambda grid: (
            grid["minimum_pair_membership_extensions"],
            grid["first_strict_pair"],
            grid["second_strict_pair"],
        ),
    )
    universal_worst = max(
        grids,
        key=lambda grid: (
            grid["minimum_pair_membership_extensions"],
            grid["first_strict_pair"],
            grid["second_strict_pair"],
        ),
    )
    forward_patterns = Counter(grid["forward_pattern"] for grid in grids)
    reverse_patterns = Counter(grid["reverse_pattern"] for grid in grids)
    z_cross_patterns = Counter(grid["z_cross_pattern"] for grid in grids)
    combined_patterns = Counter(grid["combined_pattern"] for grid in grids)
    return {
        "shard_index": case["partition"]["shard_index"],
        "witness_sha256": survivor["witness_sha256"],
        "first_apex": first_apex,
        "first_apex_support": sorted(rows[first_apex]),
        "first_strict_o1_candidates": sorted(first_strict_candidates),
        "first_strict_pair_count": len(first_pairs),
        "second_apex": second_apex,
        "second_apex_support": sorted(rows[second_apex]),
        "second_strict_o2_candidates": sorted(second_strict_candidates),
        "second_strict_pair_count": len(second_pairs),
        "pair_grid_count": len(grids),
        "canonical_grid_for_display": canonical_grid,
        "existential_best_deficit": existential_best[
            "minimum_pair_membership_extensions"
        ],
        "existential_best_grid": existential_best,
        "universal_worst_deficit": universal_worst[
            "minimum_pair_membership_extensions"
        ],
        "universal_worst_grid": universal_worst,
        "direct_terminal_grid_count": sum(
            grid["minimum_pair_membership_extensions"] == 0 for grid in grids
        ),
        "incidence_grid_pattern_histograms": {
            "forward": dict(sorted(forward_patterns.items())),
            "reverse": dict(sorted(reverse_patterns.items())),
            "z_cross": dict(sorted(z_cross_patterns.items())),
            "combined": dict(sorted(combined_patterns.items())),
        },
        "pair_grid_summaries": grids,
    }


def analyze(source: dict, digest: str) -> dict:
    if source["schema"] != "p97-atail-selected-row-own-cap-bound-refresh-v1":
        raise AssertionError("unexpected refresh schema")
    if source["source_checkpoint_sha256"] != EXPECTED_ORIGINAL_SOURCE_SHA256:
        raise AssertionError("refresh does not descend from the pinned checkpoint")

    statuses = Counter(
        str(case["solver"]["raw_status"])
        for case in source["cases"]
        if "error" not in case
    )
    cases = [
        analyze_case(case)
        for case in source["cases"]
        if case.get("survivor") is not None
    ]
    freshness_violations = []
    for case in source["cases"]:
        if case.get("survivor") is None:
            continue
        violations = refresh_driver.survivor_detections(case)
        if violations:
            freshness_violations.append(
                {
                    "shard_index": case["partition"]["shard_index"],
                    "violations": violations,
                }
            )

    existential_deficit_counts = Counter(
        case["existential_best_deficit"] for case in cases
    )
    universal_deficit_counts = Counter(
        case["universal_worst_deficit"] for case in cases
    )
    all_grid_deficits: Counter[int] = Counter()
    forward_patterns: Counter[str] = Counter()
    reverse_patterns: Counter[str] = Counter()
    z_cross_patterns: Counter[str] = Counter()
    combined_patterns: Counter[str] = Counter()
    missing_forward_incidences = []
    one_edge_completion_candidates = []
    for case in cases:
        for grid in case["pair_grid_summaries"]:
            all_grid_deficits[grid["minimum_pair_membership_extensions"]] += 1
            missing_forward_incidences.extend(
                grid["missing_forward_incidence_ledger"]
            )
            one_edge_completion_candidates.extend(
                grid["one_edge_completion_candidates"]
            )
        histograms = case["incidence_grid_pattern_histograms"]
        forward_patterns.update(histograms["forward"])
        reverse_patterns.update(histograms["reverse"])
        z_cross_patterns.update(histograms["z_cross"])
        combined_patterns.update(histograms["combined"])
    direct_terminal_cases = sum(
        case["existential_best_deficit"] == 0 for case in cases
    )
    existential_one_extra = bool(cases) and all(
        case["existential_best_deficit"] == 1 for case in cases
    )
    universal_one_extra = bool(cases) and all(
        case["universal_worst_deficit"] == 1 for case in cases
    )
    bounded_scope = (
        "one or more node-capped shards remain indeterminate"
        if statuses["INDETERMINATE"]
        else "every shard reached SAT or exhaustive UNSAT"
    )

    return {
        "status": "PASS",
        "scope": (
            "exact bounded search over an exhaustive domain partition of one "
            "pinned fixed-label card-12 (5,5,5) finite-incidence placement; "
            f"{bounded_scope}; no SAT shadow is a Euclidean realization or "
            "live K-A-PAIR producer"
        ),
        "source_sha256": digest,
        "source_aggregate_status": source["aggregate_status"],
        "source_status_counts": dict(sorted(statuses.items())),
        "source_case_count": len(source["cases"]),
        "sat_survivor_count": len(cases),
        "current_bank_or_cap_bound_violating_survivor_count": len(
            freshness_violations
        ),
        "current_bank_or_cap_bound_violations": freshness_violations,
        "sat_survivors_with_some_direct_repeated_strict_pair": (
            direct_terminal_cases
        ),
        "existential_best_one_extra_membership_pattern": (
            "PERSISTS_IN_ALL_SAT_SURVIVORS"
            if existential_one_extra
            else "DOES_NOT_PERSIST_IN_ALL_SAT_SURVIVORS"
        ),
        "universal_worst_one_extra_membership_pattern": (
            "PERSISTS_ACROSS_EVERY_PAIR_GRID_IN_ALL_SAT_SURVIVORS"
            if universal_one_extra
            else "DOES_NOT_PERSIST_ACROSS_EVERY_PAIR_GRID"
        ),
        "existential_best_deficit_histogram": {
            str(key): value
            for key, value in sorted(existential_deficit_counts.items())
        },
        "universal_worst_deficit_histogram": {
            str(key): value
            for key, value in sorted(universal_deficit_counts.items())
        },
        "all_pair_grid_deficit_histogram": {
            str(key): value for key, value in sorted(all_grid_deficits.items())
        },
        "missing_incidence_ledger_summary": {
            "missing_forward_incidence_count": len(missing_forward_incidences),
            "one_edge_completion_candidate_count": len(
                one_edge_completion_candidates
            ),
            "all_missing_edges_have_surviving_deletion_row": all(
                entry["finite_shadow_deletion_status"]
                == "SURVIVING_SELECTED_FOUR_ROW_PRESENT"
                for entry in missing_forward_incidences
            ),
            "missing_edge_centers_chosen_as_css_blocker_count": sum(
                bool(entry["center_is_chosen_css_blocker_for_source"])
                for entry in missing_forward_incidences
            ),
            "producer_target_cap_roles": (
                "strict-O2 continuation center row gains one strict-O1 source"
            ),
            "h4_h5_comparison": (
                "NOT_EVALUATED: compact refreshed witnesses do not retain an "
                "exact U1 (a,c,d,e,f) role map"
            ),
        },
        "incidence_grid_pattern_histograms": {
            "forward": dict(sorted(forward_patterns.items())),
            "reverse": dict(sorted(reverse_patterns.items())),
            "z_cross": dict(sorted(z_cross_patterns.items())),
            "combined": dict(sorted(combined_patterns.items())),
        },
        "refresh": source["refresh"],
        "cases": cases,
    }


def validate_pins(source: dict, digest: str) -> None:
    if digest != EXPECTED_SOURCE_SHA256:
        raise AssertionError(
            f"refresh digest drift: expected {EXPECTED_SOURCE_SHA256}, got {digest}"
        )
    for relative, expected in source["input_file_sha256"].items():
        actual = sha256(ROOT / relative)
        if actual != expected:
            raise AssertionError(
                f"input digest drift for {relative}: expected {expected}, got {actual}"
            )
    retry = source.get("high_budget_retry")
    if retry is not None:
        actual = sha256(ROOT / retry["driver"])
        if actual != retry["driver_sha256"]:
            raise AssertionError(
                "high-budget retry driver digest drift: "
                f"expected {retry['driver_sha256']}, got {actual}"
            )


def summary(result: dict) -> dict:
    return {key: value for key, value in result.items() if key != "cases"}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE)
    parser.add_argument("--summary", action="store_true")
    parser.add_argument(
        "--check",
        action="store_true",
        help="enforce pinned source/input digests and all audit assertions",
    )
    args = parser.parse_args()
    raw = args.source.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    source = json.loads(raw)
    if args.check:
        validate_pins(source, digest)
    result = analyze(source, digest)
    if args.check:
        if result["current_bank_or_cap_bound_violating_survivor_count"] != 0:
            raise AssertionError("a refreshed survivor violates the current bank")
        if result["source_case_count"] != 23:
            raise AssertionError("refresh no longer contains all 23 shards")
        print("PASS: pinned cap-bound refresh and continuation audit")
        print(json.dumps(summary(result), indent=2, sort_keys=True))
    else:
        print(
            json.dumps(
                summary(result) if args.summary else result,
                indent=2,
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
