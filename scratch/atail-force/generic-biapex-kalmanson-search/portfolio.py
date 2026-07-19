#!/usr/bin/env python3
"""Run the live whole-carrier full-linear CEGAR portfolio in parallel."""

from __future__ import annotations

import argparse
import concurrent.futures
import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
SEARCH = HERE / "global_equality_quotient_cegar.py"


def live24_cases(seed_offset: int) -> list[tuple[int, int, int]]:
    cases = [
        (11, apex, seed)
        for apex in range(1, 6)
        for seed in range(seed_offset, seed_offset + 4)
    ]
    cases.extend((12, apex, seed_offset) for apex in (1, 2, 3, 6))
    return cases


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--seed-offset", type=int, default=0)
    parser.add_argument("--outer-timeout-ms", type=int, default=30_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=15_000)
    args = parser.parse_args()

    cases = live24_cases(args.seed_offset)
    args.output_dir.mkdir(parents=True, exist_ok=True)

    def run_case(case: tuple[int, int, int]) -> dict[str, object]:
        n, apex, seed = case
        stem = f"n{n}_a{apex}_seed{seed}"
        output = args.output_dir / f"{stem}.json"
        summary = args.output_dir / f"{stem}.summary.json"
        stderr = args.output_dir / f"{stem}.stderr.log"
        command = [
            sys.executable,
            str(SEARCH),
            "--n",
            str(n),
            "--second-apex",
            str(apex),
            "--random-seed",
            str(seed),
            "--full-linear",
            "--preload-bank",
            str(args.bank),
            "--wall-seconds",
            str(args.wall_seconds),
            "--outer-timeout-ms",
            str(args.outer_timeout_ms),
            "--metric-timeout-ms",
            str(args.metric_timeout_ms),
            "--output",
            str(output),
            "--summary-only",
        ]
        completed = subprocess.run(command, capture_output=True, text=True, check=False)
        summary.write_text(completed.stdout, encoding="utf-8")
        stderr.write_text(completed.stderr, encoding="utf-8")
        return {
            "n": n,
            "second_apex": apex,
            "random_seed": seed,
            "returncode": completed.returncode,
            "output": str(output),
        }

    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(run_case, cases))
    manifest = {
        "schema": "p97-whole-carrier-live24-portfolio-v1",
        "bank": str(args.bank),
        "wall_seconds_per_case": args.wall_seconds,
        "workers": args.workers,
        "results": results,
    }
    manifest_path = args.output_dir / "manifest.json"
    manifest_path.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({"manifest": str(manifest_path), "cases": len(results)}))
    return 0 if all(item["returncode"] == 0 for item in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
