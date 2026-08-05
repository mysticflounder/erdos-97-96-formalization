from __future__ import annotations

import json
import sys
from pathlib import Path

from census.p97_search.benchmarks import phase3_cegar_benchmark as bench


def main() -> None:
    root = (
        Path(sys.argv[1])
        if len(sys.argv) > 1
        else Path(
            "scratch/p97-distinct-distance-lane/"
            "p0-p5-compiled-loader-derived-index-probe-20260803"
        )
    )
    fixtures = root / "fixtures"
    workers = root / "workers"
    workers.mkdir(parents=True, exist_ok=True)
    report = {
        "schema": "p97-phase3-compiled-loader-record-table-gate-v1",
        "repetitions": 3,
        "banks": [],
    }
    for bank_name in ("bank-00", "bank-01"):
        fixture = fixtures / bank_name
        arms = {"full": [], "cache": []}
        for mode in ("full", "cache"):
            arm_dir = workers / bank_name / mode
            arm_dir.mkdir(parents=True, exist_ok=True)
            for repetition in range(3):
                result_path = arm_dir / f"worker-{repetition:03d}.json"
                result, samples, process, wall = bench._spawn_worker_with_wall(
                    bench._compiled_loader_process_worker,
                    (fixture, mode, result_path),
                    result_path,
                    join_timeout_s=1800,
                )
                arms[mode].append(
                    {
                        "repetition": repetition,
                        "worker_wall_ns": wall,
                        "max_rss_kib": process.get("max_rss_kib"),
                        "result": result,
                        "timing_summary": bench.timing.summarize(samples),
                    }
                )
        full = arms["full"]
        cached = arms["cache"]
        full_states = {item["result"].get("state_sha256") for item in full}
        cache_states = {item["result"].get("state_sha256") for item in cached}
        full_wall = [item["worker_wall_ns"] for item in full]
        cache_wall = [item["worker_wall_ns"] for item in cached]
        full_rss = [item["max_rss_kib"] for item in full]
        cache_rss = [item["max_rss_kib"] for item in cached]
        full_wall_p95 = bench._nearest_rank_p95(full_wall)
        cache_wall_p95 = bench._nearest_rank_p95(cache_wall)
        full_rss_p95 = bench._nearest_rank_p95(full_rss)
        cache_rss_p95 = bench._nearest_rank_p95(cache_rss)
        bank_report = {
            "bank": bank_name,
            "exact_state_agreement": (
                len(full_states) == 1 and full_states == cache_states
            ),
            "full_state_sha256": (
                next(iter(full_states)) if len(full_states) == 1 else None
            ),
            "full_wall_ns": full_wall,
            "cache_wall_ns": cache_wall,
            "full_rss_kib": full_rss,
            "cache_rss_kib": cache_rss,
            "wall_ratio_median": sorted(cache_wall)[1] / sorted(full_wall)[1],
            "rss_ratio_median": sorted(cache_rss)[1] / sorted(full_rss)[1],
            "full_wall_p95_ns": full_wall_p95,
            "cache_wall_p95_ns": cache_wall_p95,
            "full_rss_p95_kib": full_rss_p95,
            "cache_rss_p95_kib": cache_rss_p95,
            "wall_ratio_p95": cache_wall_p95 / full_wall_p95,
            "rss_ratio_p95": cache_rss_p95 / full_rss_p95,
            "arms": arms,
        }
        report["banks"].append(bank_report)
        print(
            json.dumps(
                {
                    key: bank_report[key]
                    for key in (
                        "bank",
                        "exact_state_agreement",
                        "wall_ratio_median",
                        "rss_ratio_median",
                        "wall_ratio_p95",
                        "rss_ratio_p95",
                    )
                },
                sort_keys=True,
            )
        )
    report_path = root / "report.json"
    report_path.write_text(json.dumps(report, sort_keys=True, separators=(",", ":")) + "\n")
    print(f"report={report_path}")


if __name__ == "__main__":
    main()
