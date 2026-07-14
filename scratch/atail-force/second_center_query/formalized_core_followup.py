#!/usr/bin/env python3
"""Rerun the Q-C preflight after pruning every formalized metric core.

The first two finite-shadow witnesses were intentionally incidence-only.  A
post-hoc equality-closure check shows that they already contain existing Lean
cores.  This follow-up leaves the original checkpoint immutable and composes
its Q-C prefix predicate with the repository's complete formalized-core
detector.  A detected core is monotone under adding rows, so prefix pruning is
sound within this finite shadow.

Any SAT result remains a non-Euclidean finite shadow.  UNSAT means only that
the searched placement is covered by Q-C or one of the already formalized
metric cores; it is not a proof of the geometric producer.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import query  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-pair-second-center-formalized-core-followup-v1"
ORIGINAL_SOLVER = shadow.solve_choice_rows


def metric_rows(rows: Sequence[shadow.ClassRow]) -> tuple[MetricRow, ...]:
    """Forget row names while preserving the exact equality interface."""

    return tuple(
        MetricRow(row.center, tuple(sorted(row.support)), row.exact)
        for row in rows
    )


def solve_seed(seed: Mapping[str, object]) -> dict[str, Any]:
    """Run one immutable seed with formalized equality-core prefix pruning."""

    detections: Counter[str] = Counter()

    def wrapped_solver(*args: Any, **kwargs: Any) -> dict[str, Any]:
        frame = args[0]
        original_prefix = kwargs.get("prefix_compatible")
        order = shadow.hull_order(frame)

        def prefix_compatible(rows: Sequence[shadow.ClassRow]) -> bool:
            if original_prefix is not None and not original_prefix(rows):
                return False
            detection = _formalized_metric_core(
                metric_rows(rows), frame.n, order
            )
            if detection is not None:
                detections[str(detection["stage"])] += 1
                return False
            return True

        kwargs["prefix_compatible"] = prefix_compatible
        return ORIGINAL_SOLVER(*args, **kwargs)

    if query.shadow.solve_choice_rows is not ORIGINAL_SOLVER:
        raise RuntimeError("query solver was already monkey-patched")
    query.shadow.solve_choice_rows = wrapped_solver
    try:
        result = query.solve_seed(seed)
    finally:
        query.shadow.solve_choice_rows = ORIGINAL_SOLVER

    return {
        "profile": list(seed["profile"]),
        "solver": result["solver"],
        "formalized_core_prefix_rejections": dict(sorted(detections.items())),
        "survivor": result if result["solver"]["raw_status"] == "SAT" else None,
    }


def document(profile_index: int | None) -> dict[str, Any]:
    seeds = query.CASE_SEEDS
    if profile_index is not None:
        seeds = (seeds[profile_index],)
    cases = [solve_seed(seed) for seed in seeds]
    return {
        "schema": SCHEMA,
        "scope": {
            "placements_per_profile": 1,
            "card_11_included": False,
            "formalized_metric_core_prefix_pruning": True,
            "target_faithful": False,
            "producer_proved": False,
        },
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile-index", type=int, choices=(0, 1))
    args = parser.parse_args()
    print(json.dumps(document(args.profile_index), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
