#!/usr/bin/env python3
"""Replay the arc-overtake check on the saved `(4,5,6)` one-way shadow.

This is a finite-shadow diagnostic only.  It does not construct a Euclidean
or live `CriticalPairFrontier` model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (
    ROOT / "scratch/atail-force",
    ROOT / "scratch/atail-force/second_center_metric_cegar",
    ROOT / "scratch/atail-force/second_center_query",
    ROOT / "scratch/atail-force/second_center_metric_oracle",
):
    sys.path.insert(0, str(path))

import common_system_metric_probe as probe  # noqa: E402


SHADOWS = ROOT / "scratch/atail-force/global_count_boundary/shadows.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def build() -> dict[str, object]:
    document = json.loads(SHADOWS.read_text())
    case = next(
        case for case in document["cases"] if tuple(case["profile"]) == (4, 5, 6)
    )
    rows_by_center = {
        int(center): frozenset(int(label) for label in support)
        for center, support in case["rows"].items()
    }
    blockers = {
        int(source): int(center)
        for source, center in case["critical_shell_blocker_map"].items()
    }

    # This is the unique saved one-way endpoint packet recorded by the robust
    # two-blocker census for this shadow and this endpoint orientation.
    q, w = 0, 10
    q_blocker, w_blocker = blockers[q], blockers[w]
    q_row_contains_w = w in rows_by_center[q_blocker]
    w_row_contains_q = q in rows_by_center[w_blocker]
    assert (q_blocker, w_blocker) == (1, 3)
    assert not q_row_contains_w and w_row_contains_q

    metric_row = probe.metric_structure.MetricRow
    rows = tuple(
        metric_row(center, tuple(sorted(support)), exact=True)
        for center, support in sorted(rows_by_center.items())
    )
    order = tuple(int(label) for label in case["cyclic_order"])
    forward = probe.six_point_two_circle_arc_overtake_order_core(
        rows, len(order), order
    )
    reverse = probe.six_point_two_circle_arc_overtake_order_core(
        rows, len(order), tuple(reversed(order))
    )
    assert forward is None
    assert reverse is None

    return {
        "status": "PASS",
        "epistemic_status": "FINITE_SHADOW_DIAGNOSTIC_ONLY",
        "shadows_sha256": sha256(SHADOWS),
        "profile": case["profile"],
        "pair": [q, w],
        "blockers": [q_blocker, w_blocker],
        "q_row_contains_w": q_row_contains_w,
        "w_row_contains_q": w_row_contains_q,
        "arc_overtake_match_forward": forward,
        "arc_overtake_match_reverse": reverse,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = build()
    print(json.dumps(result, sort_keys=args.check, indent=None if args.check else 2))


if __name__ == "__main__":
    main()
