#!/usr/bin/env python3
"""Audit strict-oppCap2 pair equalities at the second opposite apex.

This is the exact mirror of ``apex-strict-pair-completion/analyze.py`` on the
pinned current-bank-clean fixed-(5,5,5) stream.  It checks every pair in the
strict interior of O2 at center 2, distinguishing equalities already in the
row closure from one-equality extensions rejected by a formalized Lean metric
core family.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY_DIR = HERE.parent / "second_center_query"
SOURCE = QUERY_DIR / "formalized_core_shards_after_current_bank_checkpoint.json"
QUERY = QUERY_DIR / "query.py"
MATCHER = ROOT / "census/global_confinement/metric_realizability_probe.py"
EQUALITY_CORE = ROOT / "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean"
GENERAL_BRIDGE = ROOT / "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean"
OUTPUT = HERE / "second_apex_completion_checkpoint.json"

PINS = {
    SOURCE: "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
    QUERY: "f0a90838a7cbd5166e58c78ac1c0c7252fb1fbd7c744dce575820e24b92dee52",
    MATCHER: "f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373",
    EQUALITY_CORE: "d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82",
    GENERAL_BRIDGE: "10f14c3a11267585448fd3b4b2ecf1b82225deddf7c245c91de800a315d50729",
}

for path in (ROOT, QUERY_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import query  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _closure_circle_index,
    _formalized_metric_core,
    _row_equality_closure,
)
from census.multi_center import multi_center_census as mc  # noqa: E402


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def relative(path: Path) -> str:
    return str(path.relative_to(ROOT))


def verify_pins() -> None:
    for path, expected in PINS.items():
        actual = digest(path)
        if actual != expected:
            raise RuntimeError(
                f"pinned source drift at {path}: expected {expected}, found {actual}"
            )


def rows_of(survivor: dict[str, Any]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )


def build() -> dict[str, Any]:
    verify_pins()
    seed = query.CASE_SEEDS[1]
    if tuple(seed["profile"]) != (5, 5, 5):
        raise RuntimeError("query profile-index 1 is no longer (5,5,5)")
    if seed["surplus_cap"] != "S" or seed["second_large_cap"] != "O1":
        raise RuntimeError("query cap roles drifted")
    frame = mc.build_frame((5, 5, 5))
    second_apex = 2
    strict_opp_cap_2 = tuple(frame.ints["O2"])
    if strict_opp_cap_2 != (9, 10, 11):
        raise RuntimeError(f"frame-label drift: {strict_opp_cap_2}")

    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    cases = []
    status_histogram: Counter[str] = Counter()
    stage_histogram: Counter[str] = Counter()
    uncovered = []
    for source_case in source["cases"]:
        survivor = source_case.get("survivor")
        if survivor is None:
            raise RuntimeError("current checkpoint contains a non-survivor shard")
        shard = int(source_case["partition"]["shard_index"])
        rows = rows_of(survivor)
        n = int(survivor["frame"]["n"])
        order = tuple(int(point) for point in survivor["frame"]["cyclic_order"])
        base_detection = _formalized_metric_core(rows, n, order)
        if base_detection is not None:
            raise RuntimeError(
                f"shard {shard} is not current-bank clean: {base_detection}"
            )
        roots, _ = _closure_circle_index(_row_equality_closure(n, rows), n)
        pair_results = []
        for left, right in itertools.combinations(strict_opp_cap_2, 2):
            if roots[second_apex][left] == roots[second_apex][right]:
                status = "ALREADY_IN_EQUALITY_CLOSURE"
                stage = None
                witness = None
            else:
                detection = _formalized_metric_core(
                    rows + (MetricRow(second_apex, (left, right), False),),
                    n,
                    order,
                )
                if detection is None:
                    status = "ONE_EQUALITY_REMAINS_BANK_CLEAN"
                    stage = None
                    witness = None
                    uncovered.append((shard, left, right))
                else:
                    stage = str(detection["stage"])
                    status = "ONE_EQUALITY_HITS_EXISTING_LEAN_CORE"
                    witness = detection
                    stage_histogram[stage] += 1
            status_histogram[status] += 1
            pair_results.append(
                {
                    "left": left,
                    "right": right,
                    "status": status,
                    "first_existing_metric_core_stage": stage,
                    "classifier_witness": witness,
                }
            )
        cases.append({"shard_index": shard, "pairs": pair_results})

    cases.sort(key=lambda case: int(case["shard_index"]))
    if len(cases) != 23:
        raise RuntimeError(f"expected 23 shards, found {len(cases)}")
    if sum(status_histogram.values()) != 69:
        raise RuntimeError(f"expected 69 pair tests, found {status_histogram}")

    return {
        "schema": "p97-atail-current-second-apex-strict-pair-completion-v1",
        "scope": {
            "fixed_card_12_555_placement_only": True,
            "finite_shadow_only": True,
            "base_survivors_current_bank_clean": True,
            "existing_lean_consumer_families": True,
            "live_pair_extraction_proved": False,
            "live_k_a_pair_closed": False,
        },
        "pinned_inputs": [
            {"path": relative(path), "sha256": expected}
            for path, expected in PINS.items()
        ],
        "frame": {
            "profile": [5, 5, 5],
            "surplus_cap": "S",
            "second_opposite_apex": second_apex,
            "second_opposite_cap": "O2",
            "strict_second_opposite_cap": list(strict_opp_cap_2),
        },
        "case_count": len(cases),
        "pair_test_count": sum(len(case["pairs"]) for case in cases),
        "status_histogram": dict(sorted(status_histogram.items())),
        "stage_histogram": dict(sorted(stage_histogram.items())),
        "all_nonexisting_strict_pair_equalities_hit_existing_core": not uncovered,
        "uncovered": [
            {"shard_index": shard, "left": left, "right": right}
            for shard, left, right in uncovered
        ],
        "replay": (
            "UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python "
            "scratch/atail-force/alternate-apex-descent/audit_second_apex.py --check"
        ),
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    rendered = json.dumps(build(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists():
            raise SystemExit(f"missing checkpoint: {args.output}")
        if args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
