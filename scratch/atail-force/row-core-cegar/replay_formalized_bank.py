#!/usr/bin/env python3
"""Replay the current formalized metric-core bank on the two saved shadows."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement import metric_realizability_probe as metric  # noqa: E402


SHADOWS = HERE.parent / "global_count_boundary" / "shadows.json"
PINNED_SHA256 = "e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    digest = hashlib.sha256(SHADOWS.read_bytes()).hexdigest()
    if digest != PINNED_SHA256:
        raise AssertionError(f"saved-shadow digest drift: {digest}")
    document = json.loads(SHADOWS.read_text(encoding="utf-8"))
    reports = []
    for case in document["cases"]:
        rows = tuple(
            metric.MetricRow(int(center), tuple(support), exact=True)
            for center, support in case["rows"].items()
        )
        detection = metric._formalized_metric_core(
            rows,
            12,
            tuple(case["cyclic_order"]),
            include_extended=True,
            include_ordered=True,
        )
        reports.append(
            {
                "name": case["name"],
                "profile": case["profile"],
                "formalized_metric_core": detection,
            }
        )
    if args.check:
        by_profile = {tuple(item["profile"]): item for item in reports}
        detection_555 = by_profile[(5, 5, 5)]["formalized_metric_core"]
        if detection_555 is None or detection_555["stage"] != (
            "equality-convex-five-point-reverse"
        ):
            raise AssertionError("555 formalized-bank detection drift")
        if by_profile[(4, 5, 6)]["formalized_metric_core"] is not None:
            raise AssertionError("456 formalized-bank survivor status drift")
    print(json.dumps({
        "schema": "p97-atail-row-core-formalized-bank-replay-v1",
        "shadow_sha256": digest,
        "reports": reports,
        "scope": "CURRENT_FORMALIZED_METRIC_CORE_SCANNER_ON_TWO_PINNED_SHADOWS",
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
