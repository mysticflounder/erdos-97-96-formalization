#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Audit full deletion robustness at the physical second apex.

The corrected 101-shadow checkpoint has the fixed cap profile ``(8,4,5)``
in census roles, so the physical second apex is opposite a four-point closed
cap.  This audit checks the exact local radius normal forms of
``FullyDeletionRobustAt``:

* one radius class has at least five points; or
* two distinct K4 radii supply disjoint selected four-subsets.

The local admissibility test is only the proved Moser-endpoint one-hit bound.
It is therefore a necessary finite consequence of the Euclidean packet, not
a claim that a passing support has a simultaneous Euclidean realization.

The Kalmanson replay is deliberately reported separately.  It scans the full
stored all-center completions with the current formalized producer bank and
also checks whether the fixed parent-local rows already contain an ordinal
strict cycle.  No full-row match is promoted to a live coverage theorem.
"""

from __future__ import annotations

import argparse
from collections import Counter, deque
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CHECKPOINT = (
    ROOT / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
EXPECTED_CHECKPOINT_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
EXPECTED_CHECKPOINT_SCHEMA = "p97-atail-robust-all-center-bank-cegar-v1"
ROBUST_SEARCH = ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
RESULTS = HERE / "audit_results.json"
DIRECT_KALMANSON_STAGE = (
    "equality-convex-five-point-three-selected-row-kalmanson"
)

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


robust = load_module(ROBUST_SEARCH, "p97_robust_second_apex_bank_audit")


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        ROBUST_SEARCH,
        ROOT / "census/atail_force/producer_bank.py",
        ROOT / "census/global_confinement/shadow.py",
        ROOT / "census/multi_center/multi_center_census.py",
    )
    return {
        str(path.relative_to(ROOT)): file_sha256(path)
        for path in paths
    }


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def shortest_cycle_length(
    order: Sequence[int], rows: Iterable[tuple[int, Iterable[int]]]
) -> int | None:
    """Shortest ordinal strict-distance cycle induced by row equalities."""

    order = tuple(order)
    positions = {label: index for index, label in enumerate(order)}
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {
        frozenset(edge): index for index, edge in enumerate(edges)
    }

    def edge_id(left: int, right: int) -> int:
        return edge_index[frozenset((left, right))]

    parent = list(range(len(edges)))

    def find(value: int) -> int:
        if parent[value] != value:
            parent[value] = find(parent[value])
        return parent[value]

    def union(left: int, right: int) -> None:
        left = find(left)
        right = find(right)
        if left != right:
            parent[right] = left

    for center, support in rows:
        selected = [edge_id(center, point) for point in support]
        if len(selected) < 2:
            raise ValueError("radius class has fewer than two support points")
        for edge in selected[1:]:
            union(selected[0], edge)

    roots = sorted({find(index) for index in range(len(edges))})
    class_id = {root: index for index, root in enumerate(roots)}
    classes = [class_id[find(index)] for index in range(len(edges))]
    adjacency: dict[int, set[int]] = {}
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for terms in (
            ((a, c), (b, d), (a, b), (c, d)),
            ((a, c), (b, d), (a, d), (b, c)),
        ):
            values = [classes[edge_id(*edge)] for edge in terms]
            for left_index in (0, 1):
                for right_index in (0, 1):
                    if values[left_index] != values[2 + right_index]:
                        continue
                    smaller = values[2 + (1 - right_index)]
                    larger = values[1 - left_index]
                    if smaller == larger:
                        return 1
                    adjacency.setdefault(smaller, set()).add(larger)

    best: int | None = None
    for start in roots:
        start_class = class_id[start]
        distances = {start_class: 0}
        pending: deque[int] = deque([start_class])
        while pending:
            current = pending.popleft()
            for target in adjacency.get(current, ()):
                if target == start_class:
                    candidate = distances[current] + 1
                    best = candidate if best is None else min(best, candidate)
                    pending.clear()
                    break
                if target not in distances:
                    distances[target] = distances[current] + 1
                    pending.append(target)
    return best


def named_support(surface: Any, support: Iterable[int]) -> list[str]:
    return sorted(
        (surface.by_label[point] for point in support),
        key=robust.HULL_NAMES.index,
    )


def h1_radius_profiles(
    profile: tuple[int, int, int],
) -> dict[str, object]:
    """Enumerate endpoint-one-hit radius supports opposite ``O1``."""

    frame = mc.build_frame(profile)
    center = 1
    points = tuple(point for point in range(frame.n) if point != center)
    four_rows = tuple(
        frozenset(support)
        for support in itertools.combinations(points, 4)
        if mc.h1_moser_ok(frame, center, frozenset(support))
    )
    five_rows = tuple(
        frozenset(support)
        for support in itertools.combinations(points, 5)
        if mc.h1_moser_ok(frame, center, frozenset(support))
    )
    disjoint_pairs = tuple(
        (left, right)
        for index, left in enumerate(four_rows)
        for right in four_rows[index + 1 :]
        if left.isdisjoint(right)
    )
    strict_opposite = frame.O1 - (frame.S | frame.O2)
    return {
        "profile": list(profile),
        "carrier_card": frame.n,
        "opposite_closed_cap_card": profile[1],
        "strict_opposite_card": len(strict_opposite),
        "h1_admissible_four_support_count": len(four_rows),
        "h1_admissible_five_support_count": len(five_rows),
        "disjoint_four_support_pair_count": len(disjoint_pairs),
        "every_four_contains_strict_opposite": all(
            strict_opposite <= support for support in four_rows
        ),
        "first_five_support": sorted(five_rows[0]) if five_rows else None,
        "first_disjoint_four_support_pair": (
            [sorted(disjoint_pairs[0][0]), sorted(disjoint_pairs[0][1])]
            if disjoint_pairs
            else None
        ),
    }


def reconstruct_survivor(
    surface: Any, record: Mapping[str, object]
) -> tuple[tuple[Any, ...], dict[int, int]]:
    blockers = {
        surface.by_name[str(source)]: surface.by_name[str(center)]
        for source, center in record["blockers"].items()
    }
    exact_centers = set(blockers.values())
    rows = []
    for named in record["rows"]:
        center = surface.by_name[str(named["center"])]
        support = frozenset(
            surface.by_name[str(point)] for point in named["support"]
        )
        index = int(named["candidate_index"])
        if support != surface.candidates[center][index]:
            raise RuntimeError("stored candidate/support drift")
        rows.append(
            shadow.ClassRow(
                f"global:{center}",
                center,
                support,
                exact=center in exact_centers,
            )
        )
    ok, reason = surface.verify_model(tuple(rows), blockers)
    if not ok:
        raise RuntimeError(f"stored survivor failed verifier: {reason}")
    return tuple(rows), blockers


def scan_current_bank(surface: Any, rows: tuple[Any, ...]) -> tuple[dict, ...]:
    first_apex = surface.by_name[robust.FIRST_APEX]
    ambient = surface.ambient_first_apex_row()
    metric_rows = [
        producer_bank.MetricRow(
            ambient.center, tuple(sorted(ambient.support)), exact=True
        )
    ]
    metric_rows.extend(
        producer_bank.MetricRow(
            row.center, tuple(sorted(row.support)), exact=False
        )
        for row in rows
        if row.center != first_apex
    )
    return tuple(
        dict(match)
        for match in producer_bank.scan_all_formalized_cores(
            tuple(metric_rows),
            surface.frame.n,
            shadow.hull_order(surface.frame),
        )
    )


def audit() -> dict[str, object]:
    checkpoint_sha256 = file_sha256(CHECKPOINT)
    if checkpoint_sha256 != EXPECTED_CHECKPOINT_SHA256:
        raise RuntimeError("corrected 101-shadow checkpoint hash drift")
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    if checkpoint.get("schema") != EXPECTED_CHECKPOINT_SCHEMA:
        raise RuntimeError("corrected checkpoint schema drift")
    survivors = checkpoint.get("structural_survivors", [])
    if len(survivors) != 101:
        raise RuntimeError("corrected survivor count drift")

    surface = robust.Surface()
    if robust.PROFILE != (8, 4, 5):
        raise RuntimeError("corrected fixed profile drift")
    second_apex = surface.by_name[robust.SECOND_APEX]
    first_apex = surface.by_name[robust.FIRST_APEX]
    fixed_second_support = frozenset(
        surface.by_name[name] for name in robust.KNOWN_SUPPORTS[robust.SECOND_APEX]
    )
    strict_second_cap = frozenset(
        surface.by_name[name]
        for name in robust.OPP_CAP_2 - (robust.SURPLUS_CAP | robust.OPP_CAP_1)
    )
    candidates = tuple(surface.candidates[second_apex])
    if fixed_second_support != candidates[0]:
        raise RuntimeError("fixed second-apex support drift")
    if len(candidates) != 28:
        raise RuntimeError("second-apex candidate count drift")
    if not all(strict_second_cap <= support for support in candidates):
        raise RuntimeError("four-row strict-opposite coverage drift")

    disjoint_candidate_pairs = tuple(
        (left, right)
        for index, left in enumerate(candidates)
        for right in candidates[index + 1 :]
        if left.isdisjoint(right)
    )
    h1_five_supports = tuple(
        frozenset(support)
        for support in itertools.combinations(
            (point for point in range(surface.frame.n) if point != second_apex),
            5,
        )
        if mc.h1_moser_ok(
            surface.frame, second_apex, frozenset(support)
        )
    )
    if disjoint_candidate_pairs or h1_five_supports:
        raise RuntimeError("profile (8,4,5) unexpectedly admits robust radius mode")

    stage_histogram: Counter[str] = Counter()
    current_bank_matched = []
    direct_kalmanson_matched = []
    full_cycle_lengths: Counter[int] = Counter()
    local_cycle_lengths: Counter[int] = Counter()
    fixed_row_failures = []
    ambient = surface.ambient_first_apex_row()
    local_names = ("A", "D", "t1")
    survivor_hashes = []
    for ordinal, record in enumerate(survivors, start=1):
        rows, _blockers = reconstruct_survivor(surface, record)
        by_center = {row.center: row for row in rows}
        if by_center[second_apex].support != fixed_second_support:
            fixed_row_failures.append(ordinal)
        survivor_hashes.append(str(record["row_assignment_sha256"]))
        matches = scan_current_bank(surface, rows)
        stage_histogram.update(str(match["stage"]) for match in matches)
        if matches:
            current_bank_matched.append(ordinal)
        if any(
            match["stage"] == DIRECT_KALMANSON_STAGE for match in matches
        ):
            direct_kalmanson_matched.append(ordinal)

        full_rows = (
            (first_apex, ambient.support),
            *(
                (row.center, row.support)
                for row in rows
                if row.center != first_apex
            ),
        )
        full_cycle = shortest_cycle_length(
            shadow.hull_order(surface.frame), full_rows
        )
        if full_cycle is not None:
            full_cycle_lengths[full_cycle] += 1

        local_rows = (
            (first_apex, ambient.support),
            *(
                (
                    surface.by_name[name],
                    by_center[surface.by_name[name]].support,
                )
                for name in local_names
            ),
        )
        local_cycle = shortest_cycle_length(
            shadow.hull_order(surface.frame), local_rows
        )
        if local_cycle is not None:
            local_cycle_lengths[local_cycle] += 1

    if fixed_row_failures:
        raise RuntimeError("stored survivor second-apex fixed-row drift")

    threshold_profiles = [
        h1_radius_profiles((8, cap_card, 5)) for cap_card in range(4, 9)
    ]
    if threshold_profiles[0]["h1_admissible_five_support_count"] != 0:
        raise RuntimeError("cap-four five-radius smoke failed")
    if threshold_profiles[0]["disjoint_four_support_pair_count"] != 0:
        raise RuntimeError("cap-four distinct-radius smoke failed")
    if threshold_profiles[1]["h1_admissible_five_support_count"] == 0:
        raise RuntimeError("cap-five positive-control smoke failed")
    if threshold_profiles[2]["disjoint_four_support_pair_count"] == 0:
        raise RuntimeError("cap-six positive-control smoke failed")

    return {
        "schema": "p97-atail-robust-second-apex-bank-audit-v1",
        "epistemic_status": {
            "finite_endpoint": (
                "EXHAUSTIVE_EXACT_WITHIN_H1_CAP_PROFILE_(8,4,5)"
            ),
            "stored_shadow_replay": (
                "EXHAUSTIVE_OVER_PINNED_CORRECTED_101_SHADOWS"
            ),
            "kalmanson": (
                "CURRENT_FORMALIZED_MATCHER_AND_ORDINAL_CLOSURE_REPLAY;_"
                "NO_LIVE_COVERAGE_THEOREM"
            ),
            "not_claimed": (
                "EUCLIDEAN_REALIZABILITY_OR_GENERAL_CARDINALITY_CLOSURE"
            ),
        },
        "checkpoint": str(CHECKPOINT.relative_to(ROOT)),
        "checkpoint_sha256": checkpoint_sha256,
        "source_sha256": source_hashes(),
        "corrected_shadow_count": len(survivors),
        "corrected_survivor_row_hashes_sha256": canonical_sha256(
            survivor_hashes
        ),
        "fixed_surface": {
            "profile_in_census_roles": list(robust.PROFILE),
            "carrier_card": surface.frame.n,
            "hull_order": list(robust.HULL_NAMES),
            "physical_second_apex": robust.SECOND_APEX,
            "opposite_closed_cap": sorted(
                robust.OPP_CAP_2, key=robust.HULL_NAMES.index
            ),
            "strict_opposite_cap": named_support(
                surface, strict_second_cap
            ),
            "fixed_second_apex_support": named_support(
                surface, fixed_second_support
            ),
        },
        "robust_radius_normal_form_audit": {
            "admissible_second_apex_four_support_count": len(candidates),
            "every_admissible_four_support_contains_strict_opposite_cap": True,
            "admissible_five_support_count": len(h1_five_supports),
            "disjoint_admissible_four_support_pair_count": len(
                disjoint_candidate_pairs
            ),
            "stored_shadows_extendable_to_fully_deletion_robust": 0,
            "certificate_schema": (
                "every K4 radius contains both strict opposite-cap points G,K; "
                "an exact radius class has card at most four"
            ),
        },
        "cap_card_threshold_audit": threshold_profiles,
        "kalmanson_replay": {
            "full_shadow_current_bank_match_count": len(current_bank_matched),
            "full_shadow_direct_kalmanson_match_count": len(
                direct_kalmanson_matched
            ),
            "full_shadow_ordinal_cycle_count": sum(
                full_cycle_lengths.values()
            ),
            "full_shadow_shortest_cycle_length_histogram": dict(
                (str(length), count)
                for length, count in sorted(full_cycle_lengths.items())
            ),
            "fixed_parent_local_ordinal_cycle_count": sum(
                local_cycle_lengths.values()
            ),
            "fixed_parent_local_shortest_cycle_length_histogram": dict(
                (str(length), count)
                for length, count in sorted(local_cycle_lengths.items())
            ),
            "current_bank_stage_histogram": dict(
                sorted(stage_histogram.items())
            ),
        },
        "interpretation": {
            "decisive_profile_local_fact": (
                "the cap-one-hit constraints already exclude both exact causes "
                "of full deletion robustness when oppCap2.card=4"
            ),
            "kalmanson_role": (
                "all 101 stored full-row completions currently have an ordinal "
                "cycle, but the fixed parent-local rows have none; those sampled "
                "full-row hits are not a robust-endpoint coverage proof"
            ),
            "minimal_missing_antecedent_for_bank_lift": (
                "S.oppCap2.card=4, or a parent split that routes cap 5 to the "
                "unique-five consumer and cap >= 6 to a separate residual"
            ),
            "sharpness": (
                "the H1 abstraction admits a five-point radius starting at cap "
                "5 and two disjoint four-radii starting at cap 6"
            ),
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()
    result = audit()
    if args.check:
        expected = json.loads(RESULTS.read_text(encoding="utf-8"))
        if result != expected:
            raise SystemExit("audit result drift")
    if args.summary:
        summary = {
            "corrected_shadow_count": result["corrected_shadow_count"],
            "robust_radius_normal_form_audit": result[
                "robust_radius_normal_form_audit"
            ],
            "kalmanson_replay": {
                key: result["kalmanson_replay"][key]
                for key in (
                    "full_shadow_current_bank_match_count",
                    "full_shadow_direct_kalmanson_match_count",
                    "full_shadow_ordinal_cycle_count",
                    "fixed_parent_local_ordinal_cycle_count",
                )
            },
            "cap_card_threshold_audit": result["cap_card_threshold_audit"],
        }
        print(json.dumps(summary, indent=2, sort_keys=True))
    else:
        print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
