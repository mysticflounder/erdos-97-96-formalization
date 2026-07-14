#!/usr/bin/env python3
"""Profile every normalization pair for one minimized equality core."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
PROFILER = HERE / "profile_shard_equality_certificate.py"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--shard-index", type=int, required=True)
    parser.add_argument("--workers", type=int, default=21)
    parser.add_argument("--timeout-seconds", type=float, default=60.0)
    parser.add_argument("--summary-only", action="store_true")
    parser.add_argument("--compact-json", action="store_true")
    parser.add_argument("--ordered", action="store_true")
    parser.add_argument(
        "--output",
        type=Path,
        help="atomically write the profile here instead of stdout",
    )
    args = parser.parse_args()

    raw = args.checkpoint.read_bytes()
    checkpoint = json.loads(raw)
    case = next(
        case
        for case in checkpoint["cases"]
        if int(case["shard_index"]) == args.shard_index
    )
    records = case["minimization"]["retained_equalities"]
    points = sorted(
        {
            int(record[key])
            for record in records
            for key in ("center", "left", "right")
        }
    )
    pairs = tuple(
        itertools.permutations(points, 2)
        if args.ordered
        else itertools.combinations(points, 2)
    )

    def profile(pair: tuple[int, int]) -> dict[str, Any]:
        command = (
            sys.executable,
            str(PROFILER),
            str(args.checkpoint),
            "--shard-index",
            str(args.shard_index),
            "--anchor-left",
            str(pair[0]),
            "--anchor-right",
            str(pair[1]),
            "--order",
            "dp",
            "--timeout-seconds",
            str(args.timeout_seconds),
        )
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=False,
        )
        if completed.returncode != 0:
            return {
                "normalization_anchors": list(pair),
                "status": "DRIVER_ERROR",
                "returncode": completed.returncode,
                "stderr": completed.stderr,
            }
        return json.loads(completed.stdout)

    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=min(args.workers, len(pairs))) as executor:
        futures = {executor.submit(profile, pair): pair for pair in pairs}
        for future in as_completed(futures):
            pair = futures[future]
            try:
                result = future.result()
            except Exception as error:  # fail closed and retain the pair
                result = {
                    "normalization_anchors": list(pair),
                    "status": "DRIVER_EXCEPTION",
                    "detail": f"{type(error).__name__}: {error}",
                }
            results.append(result)
            singular = result.get("singular", {})
            print(
                f"anchors {pair}: {singular.get('status', result.get('status'))}"
                f" unit={singular.get('basis_is_unit', False)}"
                f" lift={singular.get('lift_total_char_count', '?')}",
                file=sys.stderr,
                flush=True,
            )

    results.sort(key=lambda result: tuple(result["normalization_anchors"]))
    completed_unit = [
        result
        for result in results
        if result.get("singular", {}).get("basis_is_unit")
    ]
    completed_unit.sort(
        key=lambda result: result["singular"]["lift_total_char_count"]
    )
    document = {
        "schema": "p97-atail-shard-anchor-pair-certificate-profile-v1",
        "scope": {
            "trusted_singular_computation": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
            "target_faithful": False,
            "fixed_placement_only": True,
        },
        "source_checkpoint": str(args.checkpoint),
        "source_checkpoint_sha256": hashlib.sha256(raw).hexdigest(),
        "shard_index": args.shard_index,
        "active_points": points,
        "pair_count": len(pairs),
        "completed_unit_count": len(completed_unit),
        "best_unit_pairs": [
            {
                "normalization_anchors": result["normalization_anchors"],
                "lift_total_char_count": result["singular"][
                    "lift_total_char_count"
                ],
                "lift_max_coefficient_char_count": result["singular"][
                    "lift_max_coefficient_char_count"
                ],
                "elapsed_seconds": result["singular"]["elapsed_seconds"],
            }
            for result in completed_unit
        ],
        "results": (
            [
                {
                    "normalization_anchors": result["normalization_anchors"],
                    "status": result.get("singular", {}).get(
                        "status", result.get("status")
                    ),
                    "basis_is_unit": result.get("singular", {}).get(
                        "basis_is_unit", False
                    ),
                    "elapsed_seconds": result.get("singular", {}).get(
                        "elapsed_seconds"
                    ),
                    "lift_total_char_count": (
                        result.get("singular", {}).get("lift_total_char_count")
                        if result.get("singular", {}).get("basis_is_unit")
                        else None
                    ),
                    "lift_max_coefficient_char_count": (
                        result.get("singular", {}).get(
                            "lift_max_coefficient_char_count"
                        )
                        if result.get("singular", {}).get("basis_is_unit")
                        else None
                    ),
                }
                for result in results
            ]
            if args.summary_only
            else results
        ),
    }
    rendered = json.dumps(
        document,
        indent=None if args.compact_json else 2,
        separators=(",", ":") if args.compact_json else None,
        sort_keys=True,
    )
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
