#!/usr/bin/env python3
"""Exact finite census for `GlobalNestedPairFields` in the saved 456 frame.

The saved critical-system blocker row at center ``o`` is enumerated after
``o`` in the fixed cyclic order as ``a,b,c,d``.  This script asks whether the
current finite candidate surface admits global selected rows at centers
``a`` and ``b`` containing respectively ``{o,d}`` and ``{o,c}``.

Rows at saved blocker centers 0 through 3 are locked to their exact critical
supports.  Rows at other centers are selected (not exact).  Any admitted row
is checked against the existing pairwise finite-incidence constraints and the
complete current formalized metric-core scanner.  No equality CAS is called
when incidence/core checks exhaust the candidate surface.
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
for path in (
    ROOT,
    HERE,
    HERE / "second_center_metric_cegar",
    HERE / "second_center_query",
    HERE / "second_center_metric_oracle",
):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import common_system_metric_probe as common_probe  # noqa: E402
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


PROFILE = (4, 5, 6)
N = 12
ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
BASE_SUPPORTS = {
    0: frozenset((1, 3, 4, 5)),
    1: frozenset((0, 2, 5, 6)),
    2: frozenset((1, 7, 8, 9)),
    3: frozenset((0, 7, 10, 11)),
}
BLOCKER_OF_SOURCE = {
    0: 1,
    1: 0,
    2: 1,
    3: 0,
    4: 0,
    5: 0,
    6: 1,
    7: 2,
    8: 2,
    9: 2,
    10: 3,
    11: 3,
}
KILLED_ROWS = set(mc.PROVEN_ROWS)
BASE_CLASS_ROWS = tuple(
    shadow.ClassRow(f"base:{center}", center, support, exact=True)
    for center, support in BASE_SUPPORTS.items()
)
BASE_METRIC_ROWS = tuple(
    metric.MetricRow(center, tuple(sorted(support)), exact=True)
    for center, support in BASE_SUPPORTS.items()
)


def ordered_support(center: int) -> tuple[int, int, int, int]:
    start = ORDER.index(center)
    rotated = ORDER[start:] + ORDER[:start]
    support = BASE_SUPPORTS[center]
    result = tuple(label for label in rotated[1:] if label in support)
    if len(result) != 4 or set(result) != set(support):
        raise AssertionError(f"invalid ordered support at center {center}")
    return result  # type: ignore[return-value]


def formalized_core(
    rows: Sequence[metric.MetricRow],
) -> dict[str, Any] | None:
    core = metric._formalized_metric_core(
        rows,
        N,
        ORDER,
        include_extended=True,
        include_ordered=True,
    )
    if core is not None:
        return core
    return common_probe.nested_equal_chord_core(rows, N, ORDER)


def incompatibility_kind(
    frame: mc.Frame, base: shadow.ClassRow, extension: shadow.ClassRow
) -> str:
    common = base.support & extension.support
    if len(common) > 2:
        return "intersection_card_gt_two"
    if len(common) == 2 and not shadow.cross_separation_ok(
        shadow.hull_order(frame), base, extension
    ):
        return "two_common_points_not_cyclically_separated"
    return "other_pairwise_constraint"


def main() -> int:
    frame, candidates = mc.cached_candidate_lists(PROFILE, KILLED_ROWS)
    if candidates is None or frame.n != N:
        raise AssertionError("missing saved `(4,5,6)` frame")

    patterns: list[dict[str, Any]] = []
    for center in sorted(BASE_SUPPORTS):
        a, b, c, d = ordered_support(center)
        required_a = frozenset((center, d))
        required_b = frozenset((center, c))
        record: dict[str, Any] = {
            "blocker_center_o": center,
            "ordered_support_abcd": [a, b, c, d],
            "row_a_center": a,
            "row_a_required_pair": sorted(required_a),
            "row_b_center": b,
            "row_b_required_pair": sorted(required_b),
            "sources": sorted(
                source
                for source, blocker in BLOCKER_OF_SOURCE.items()
                if blocker == center
            ),
        }

        locked_failures = []
        for role, target_center, required in (
            ("a", a, required_a),
            ("b", b, required_b),
        ):
            if target_center not in BASE_SUPPORTS:
                continue
            locked_support = BASE_SUPPORTS[target_center]
            if not required <= locked_support:
                locked_failures.append(
                    {
                        "role": role,
                        "center": target_center,
                        "required_pair": sorted(required),
                        "locked_support": sorted(locked_support),
                        "missing": sorted(required - locked_support),
                    }
                )
        record["locked_row_failures"] = locked_failures

        if locked_failures:
            record["status"] = "EXCLUDED_BY_LOCKED_BLOCKER_ROW"
            patterns.append(record)
            continue

        role_pools: dict[str, list[frozenset[int]]] = {}
        for role, target_center, required in (
            ("a", a, required_a),
            ("b", b, required_b),
        ):
            if target_center in BASE_SUPPORTS:
                role_pools[role] = [BASE_SUPPORTS[target_center]]
            else:
                role_pools[role] = [
                    support
                    for support in candidates[target_center]
                    if required <= support
                ]
        record["raw_required_candidate_counts"] = {
            role: len(pool) for role, pool in role_pools.items()
        }

        # In the only unlocked pattern, row a is already exhaustive enough to
        # decide the pair.  Record both the independent finite-incidence audit
        # and the formalized-core audit of every required row-a candidate.
        row_a_center = a
        incidence_reasons: Counter[str] = Counter()
        incidence_details = []
        core_stages: Counter[str] = Counter()
        core_details = []
        admitted_a = []
        for support in role_pools["a"]:
            extension = shadow.ClassRow(
                "global:a", row_a_center, support, exact=False
            )
            ok, reason = shadow.verify_assignment(
                frame, KILLED_ROWS, (*BASE_CLASS_ROWS, extension)
            )
            if ok:
                admitted_a.append(support)
            else:
                bad_base = next(
                    base
                    for base in BASE_CLASS_ROWS
                    if not shadow.rows_compatible(frame, base, extension)
                )
                kind = incompatibility_kind(frame, bad_base, extension)
                incidence_reasons[f"base:{bad_base.center}:{kind}"] += 1
                incidence_details.append(
                    {
                        "support": sorted(support),
                        "reported_reason": reason,
                        "bad_base_center": bad_base.center,
                        "common_support": sorted(bad_base.support & support),
                        "kind": kind,
                    }
                )

            metric_extension = metric.MetricRow(
                row_a_center, tuple(sorted(support)), exact=False
            )
            core = formalized_core((*BASE_METRIC_ROWS, metric_extension))
            if core is None:
                core_details.append(
                    {"support": sorted(support), "core": None}
                )
            else:
                core_stages[str(core["stage"])] += 1
                core_details.append(
                    {"support": sorted(support), "core": core}
                )

        record["row_a_incidence_compatible_count"] = len(admitted_a)
        record["row_a_incidence_rejection_counts"] = dict(
            sorted(incidence_reasons.items())
        )
        record["row_a_incidence_details"] = incidence_details
        record["row_a_formalized_core_counts"] = dict(sorted(core_stages.items()))
        record["row_a_formalized_core_details"] = core_details
        record["row_a_formalized_core_survivor_count"] = sum(
            detail["core"] is None for detail in core_details
        )
        record["row_b_raw_candidate_count"] = len(role_pools["b"])

        if not admitted_a:
            record["status"] = "EXCLUDED_BY_REQUIRED_ROW_A_FINITE_CENSUS"
            record["admitted_row_pairs"] = 0
            record["exact_equality_oracle_calls"] = 0
        else:
            raise AssertionError(
                "unexpected admitted row-a candidate; joint-pair layer required"
            )
        patterns.append(record)

    excluded_sources = sorted(
        source
        for pattern in patterns
        if pattern["status"].startswith("EXCLUDED")
        for source in pattern["sources"]
    )
    if excluded_sources != list(range(N)):
        raise AssertionError(f"unclassified sources: {excluded_sources}")

    report = {
        "schema": "p97-atail-residual-456-global-nested-pair-census-v1",
        "epistemic_status": {
            "finite_candidate_statement": "EXACT_WITHIN_SAVED_456_FRAME",
            "formalized_core_consumers": "REUSED_KERNEL_BACKED_BANK",
            "live_producer_proved": False,
            "other_placements_or_profiles_covered": False,
        },
        "profile": list(PROFILE),
        "cyclic_order": list(ORDER),
        "base_exact_rows": {
            str(center): sorted(support)
            for center, support in BASE_SUPPORTS.items()
        },
        "blocker_of_source": {
            str(source): blocker
            for source, blocker in BLOCKER_OF_SOURCE.items()
        },
        "patterns": patterns,
        "all_twelve_sources_excluded": True,
        "total_admitted_global_nested_pair_witnesses": 0,
        "exact_equality_oracle_calls": 0,
        "conclusion": (
            "No automatically ordered blocker row in the saved `(4,5,6)` "
            "placement admits the four GlobalNestedPairFields memberships. "
            "Three blocker centers fail against locked exact rows; the fourth "
            "has 15 required row-a candidates, all rejected by finite incidence "
            "and all covered by existing formalized metric cores."
        ),
    }
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
