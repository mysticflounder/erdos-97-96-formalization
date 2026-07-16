#!/usr/bin/env python3
"""Audit all strict-pair continuation grids in the synchronized checkpoint."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path
from types import SimpleNamespace


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import cap_bound_core  # noqa: E402
import refresh  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


SCHEMA = "p97-atail-biapex-current-producer-bank-grid-audit-v1"
SOURCE = HERE / "current_producer_bank_refresh_100k_checkpoint.json"
DEFAULT_OUTPUT = HERE / "current_producer_bank_grid_analysis.json"
EXPECTED_SOURCE_SHA256 = (
    "02a3a92b6241d42841bdbbacfe35005e55b0cd609ce981ab381945c98eba8a66"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def classify_two_by_two(matrix: list[list[int]]) -> str:
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
        return (
            "alternating-identity-permutation"
            if matrix == [[1, 0], [0, 1]]
            else "alternating-swap-permutation"
        )
    if 2 in row_sums:
        return "two-same-row"
    if 2 in column_sums:
        return "two-same-column"
    raise AssertionError(f"unclassified 2x2 matrix: {matrix}")


def pair_grid(
    rows: dict[int, frozenset[int]],
    first_pair: tuple[int, int],
    second_pair: tuple[int, int],
) -> dict[str, object]:
    a, b = first_pair
    z1, z2 = second_pair
    forward = [
        [int(a in rows[z1]), int(b in rows[z1])],
        [int(a in rows[z2]), int(b in rows[z2])],
    ]
    reverse = [
        [int(z1 in rows[a]), int(z2 in rows[a])],
        [int(z1 in rows[b]), int(z2 in rows[b])],
    ]
    deficits = [2 - sum(forward[0]), 2 - sum(forward[1])]
    z_cross_count = int(z2 in rows[z1]) + int(z1 in rows[z2])
    return {
        "first_strict_pair": list(first_pair),
        "second_strict_pair": list(second_pair),
        "forward_rows_z1_z2_columns_a_b": forward,
        "reverse_rows_a_b_columns_z1_z2": reverse,
        "forward_pattern": classify_two_by_two(forward),
        "reverse_pattern": classify_two_by_two(reverse),
        "z_cross_pattern": ("zero", "one", "mutual")[z_cross_count],
        "continuation_rows": [
            {
                "center": z,
                "support": sorted(rows[z]),
                "first_pair_hits": sorted(rows[z] & frozenset(first_pair)),
                "missing_memberships": deficit,
            }
            for z, deficit in zip(second_pair, deficits, strict=True)
        ],
        "minimum_pair_membership_extensions": min(deficits),
        "direct_outside_pair_terminal": min(deficits) == 0,
    }


def analyze_case(case: dict) -> dict[str, object]:
    survivor = case["survivor"]
    if tuple(survivor["profile"]) != (5, 5, 5):
        raise AssertionError("unexpected survivor profile")
    frame = mc.build_frame((5, 5, 5))
    rows = {
        int(row["center"]): frozenset(int(point) for point in row["support"])
        for row in survivor["distinct_metric_rows"]
    }
    if set(rows) != set(range(frame.n)):
        raise AssertionError("survivor lacks a global selected row")
    first_candidates = sorted(rows[1] & frame.caps_int["O1"])
    second_candidates = sorted(rows[2] & frame.caps_int["O2"])
    if len(first_candidates) < 2 or len(second_candidates) < 2:
        raise AssertionError("survivor lacks the bi-apex strict-pair packet")
    grids = [
        pair_grid(rows, first_pair, second_pair)
        for first_pair in combinations(first_candidates, 2)
        for second_pair in combinations(second_candidates, 2)
    ]
    return {
        "shard_index": int(case["partition"]["shard_index"]),
        "witness_sha256": survivor["witness_sha256"],
        "first_strict_candidates": first_candidates,
        "second_strict_candidates": second_candidates,
        "strict_pair_grid_count": len(grids),
        "existential_best_deficit": min(
            int(grid["minimum_pair_membership_extensions"]) for grid in grids
        ),
        "universal_worst_deficit": max(
            int(grid["minimum_pair_membership_extensions"]) for grid in grids
        ),
        "strict_pair_grids": grids,
    }


def cap_mutation_detected(case: dict) -> bool:
    """Mutation test: inject a proved own-cap violation into a copied witness."""

    survivor = case["survivor"]
    frame = mc.build_frame((5, 5, 5))
    rows = [
        SimpleNamespace(
            center=int(row["center"]),
            support=tuple(int(point) for point in row["support"]),
        )
        for row in survivor["distinct_metric_rows"]
    ]
    interior = min(frame.cap_of_int)
    cap_name = frame.cap_of_int[interior]
    own_cap = sorted(getattr(frame, cap_name) - {interior})
    outside = min(set(range(frame.n)) - set(getattr(frame, cap_name)) - {interior})
    replacement = tuple(own_cap[:3] + [outside])
    mutated = [
        SimpleNamespace(center=row.center, support=replacement)
        if row.center == interior
        else row
        for row in rows
    ]
    return cap_bound_core.selected_row_own_cap_detection(
        mutated, (5, 5, 5)
    ) is not None


def validate_pins(source: dict, digest: str) -> None:
    if digest != EXPECTED_SOURCE_SHA256:
        raise AssertionError(
            f"checkpoint drift: expected {EXPECTED_SOURCE_SHA256}, got {digest}"
        )
    if source["schema"] != refresh.SCHEMA:
        raise AssertionError("unexpected refresh schema")
    if source["source_checkpoint_sha256"] != refresh.EXPECTED_SOURCE_SHA256:
        raise AssertionError("refresh ancestry drift")
    for relative, expected in source["input_file_sha256"].items():
        actual = sha256(ROOT / relative)
        if actual != expected:
            raise AssertionError(
                f"input digest drift for {relative}: expected {expected}, got {actual}"
            )
    if source["refresh"]["reused_shard_count"] != 0:
        raise AssertionError("a saved survivor was reused")
    if source["refresh"]["rerun_shard_indices"] != list(range(23)):
        raise AssertionError("not every shard was independently rerun")
    if source["solver"]["max_nodes_per_shard"] != 100_000:
        raise AssertionError("unexpected per-shard node budget")
    if source["source_gate_smoke"]["current_gate_rejected_indices"] != list(
        refresh.EXPECTED_SOURCE_DIRTY_INDICES
    ):
        raise AssertionError("known dirty-shard mutation smoke drift")
    if source["source_gate_smoke"]["current_gate_accepted_indices"] != list(
        refresh.EXPECTED_SOURCE_CLEAN_INDICES
    ):
        raise AssertionError("known clean-shard smoke drift")
    indices = [int(case["partition"]["shard_index"]) for case in source["cases"]]
    if indices != list(range(23)):
        raise AssertionError("checkpoint does not contain all ordered shards")


def analyze(source: dict, digest: str) -> dict[str, object]:
    statuses = Counter(
        str(case["solver"]["raw_status"])
        for case in source["cases"]
        if "error" not in case
    )
    sat_cases = [case for case in source["cases"] if case.get("survivor") is not None]
    freshness_violations = [
        {
            "shard_index": int(case["partition"]["shard_index"]),
            "detections": refresh.survivor_detections(case),
        }
        for case in sat_cases
        if refresh.survivor_detections(case)
    ]
    mutation_failures = [
        int(case["partition"]["shard_index"])
        for case in sat_cases
        if not cap_mutation_detected(case)
    ]
    cases = [analyze_case(case) for case in sat_cases]
    all_grids = [grid for case in cases for grid in case["strict_pair_grids"]]
    deficits = Counter(
        int(grid["minimum_pair_membership_extensions"]) for grid in all_grids
    )
    forward = Counter(str(grid["forward_pattern"]) for grid in all_grids)
    reverse = Counter(str(grid["reverse_pattern"]) for grid in all_grids)
    z_cross = Counter(str(grid["z_cross_pattern"]) for grid in all_grids)
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "rigor": (
            "EMPIRICALLY VERIFIED by exact bounded DFS within one fixed-label "
            "card-12 (5,5,5) finite-incidence shadow; node-capped shards are "
            "indeterminate; SAT shadows are not Euclidean realizations and do "
            "not prove or refute the live K-A producer"
        ),
        "source_sha256": digest,
        "source_aggregate_status": source["aggregate_status"],
        "source_status_counts": dict(sorted(statuses.items())),
        "sat_survivor_count": len(sat_cases),
        "fresh_sat_survivor_gate_violation_count": len(freshness_violations),
        "fresh_sat_survivor_gate_violations": freshness_violations,
        "cap_mutation_test_count": len(sat_cases),
        "cap_mutation_failure_indices": mutation_failures,
        "strict_pair_grid_count": len(all_grids),
        "all_pair_grid_deficit_histogram": {
            str(key): value for key, value in sorted(deficits.items())
        },
        "direct_terminal_grid_count": sum(
            bool(grid["direct_outside_pair_terminal"]) for grid in all_grids
        ),
        "incidence_grid_pattern_histograms": {
            "forward": dict(sorted(forward.items())),
            "reverse": dict(sorted(reverse.items())),
            "z_cross": dict(sorted(z_cross.items())),
        },
        "source_gate_smoke": source["source_gate_smoke"],
        "cases": cases,
    }


def summary(result: dict[str, object]) -> dict[str, object]:
    return {key: value for key, value in result.items() if key != "cases"}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE)
    parser.add_argument(
        "--output",
        type=Path,
        nargs="?",
        const=DEFAULT_OUTPUT,
        help="write the full all-grid analysis (default path when omitted)",
    )
    parser.add_argument("--summary", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    raw = args.source.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    source = json.loads(raw)
    if args.check:
        validate_pins(source, digest)
    result = analyze(source, digest)
    if args.output is not None:
        rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered)
        temporary.replace(args.output)
    if args.check:
        if result["fresh_sat_survivor_gate_violation_count"] != 0:
            raise AssertionError("a fresh SAT survivor violates the current gate")
        if result["cap_mutation_failure_indices"]:
            raise AssertionError("cap mutation detector failed")
        print("PASS: pinned current-bank refresh and all strict-pair grids")
        if args.output is not None:
            print(f"wrote {args.output}")
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
