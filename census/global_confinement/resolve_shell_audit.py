#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Resolve only capped scenarios in a shell-coupled audit artifact."""
from __future__ import annotations

import argparse
import json
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Sequence

from census.global_confinement.critical_shell_probe import STATUSES
from census.global_confinement.shell_audit_probe import (
    _compact,
    _critical_result,
    _markdown,
    _packet_context,
    _sum_counts,
    _survival_result,
)


def _scenario_job(args: tuple) -> dict:
    packet_index, packet, family, payload, max_nodes = args
    context = _packet_context(packet)
    started = time.perf_counter()

    if family == "critical":
        result = _critical_result(
            context,
            int(payload),
            max_nodes=max_nodes,
        )
    elif family == "survival":
        _audit_centers, result = _survival_result(
            context,
            tuple(payload),
            max_nodes=max_nodes,
        )
    else:
        raise ValueError(f"unknown scenario family: {family}")
    return {
        "packet_index": packet_index,
        "family": family,
        "payload": payload,
        "result": result,
        "elapsed_sec": time.perf_counter() - started,
    }


def _indeterminate_jobs(artifact: dict, max_nodes: int) -> list[tuple]:
    jobs = []
    for packet_index, packet in enumerate(artifact["packets"]):
        for center, result in packet["critical_results"].items():
            if result["status"] == "INDETERMINATE":
                jobs.append(
                    (packet_index, packet, "critical", int(center), max_nodes)
                )
        for frame in packet["survival_results"]:
            if frame["result"]["status"] == "INDETERMINATE":
                jobs.append(
                    (packet_index, packet, "survival", frame["aux"], max_nodes)
                )
    return jobs


def _run_jobs(jobs: Sequence[tuple], *, workers: int) -> list[dict]:
    results = []
    if workers == 1:
        for index, job in enumerate(jobs, start=1):
            results.append(_scenario_job(job))
            print(
                f"[shell-audit-resolve] scenario {index}/{len(jobs)} "
                f"family={job[2]}",
                file=sys.stderr,
                flush=True,
            )
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            futures = {pool.submit(_scenario_job, job): job for job in jobs}
            for index, future in enumerate(as_completed(futures), start=1):
                job = futures[future]
                results.append(future.result())
                print(
                    f"[shell-audit-resolve] scenario {index}/{len(jobs)} "
                    f"family={job[2]}",
                    file=sys.stderr,
                    flush=True,
                )
    return results


def _apply_results(
    artifact: dict,
    resolutions: Sequence[dict],
    *,
    max_nodes: int,
) -> dict:
    for resolution in resolutions:
        packet = artifact["packets"][resolution["packet_index"]]
        family = resolution["family"]
        result = resolution["result"]
        if family == "critical":
            center = str(resolution["payload"])
            previous = packet["critical_results"][center]
            if previous["status"] != "INDETERMINATE":
                raise AssertionError("resolver attempted to replace a settled result")
            packet["critical_results"][center] = _compact(result)
            if result["status"] == "SAT" and packet["first_critical_witness"] is None:
                packet["first_critical_witness"] = {
                    "center": int(center),
                    "result": _compact(result, keep_assignment=True),
                }
        else:
            aux = list(resolution["payload"])
            matches = [
                frame
                for frame in packet["survival_results"]
                if frame["aux"] == aux
            ]
            if len(matches) != 1:
                raise AssertionError("survival frame key is not unique")
            frame = matches[0]
            if frame["result"]["status"] != "INDETERMINATE":
                raise AssertionError("resolver attempted to replace a settled result")
            frame["result"] = _compact(result)
            if result["status"] == "SAT" and packet["first_survival_witness"] is None:
                packet["first_survival_witness"] = {
                    "aux": aux,
                    "audit_centers": frame["audit_centers"],
                    "result": _compact(result, keep_assignment=True),
                }

    for packet in artifact["packets"]:
        critical = {
            status: sum(
                result["status"] == status
                for result in packet["critical_results"].values()
            )
            for status in STATUSES
        }
        survival = {
            status: sum(
                frame["result"]["status"] == status
                for frame in packet["survival_results"]
            )
            for status in STATUSES
        }
        packet["critical_counts"] = critical
        packet["survival_counts"] = survival

    artifact["critical_counts"] = _sum_counts(
        artifact["packets"], "critical_counts"
    )
    artifact["survival_counts"] = _sum_counts(
        artifact["packets"], "survival_counts"
    )
    artifact["generated_at"] = datetime.now(timezone.utc).isoformat()
    artifact["scope"].setdefault("resolution_passes", []).append({
        "input_indeterminate_scenarios": len(resolutions),
        "max_nodes_per_search": max_nodes,
        "remaining_indeterminate_scenarios": (
            artifact["critical_counts"]["INDETERMINATE"]
            + artifact["survival_counts"]["INDETERMINATE"]
        ),
    })
    return artifact


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--max-nodes", type=int, default=1_000_000)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")
    if not 1 <= args.workers <= 8:
        parser.error("--workers must be between 1 and 8")

    artifact = json.loads(args.input.read_text())
    jobs = _indeterminate_jobs(artifact, args.max_nodes)
    resolutions = _run_jobs(jobs, workers=args.workers)
    artifact = _apply_results(
        artifact,
        resolutions,
        max_nodes=args.max_nodes,
    )
    args.out.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")
    if args.markdown:
        args.markdown.write_text(_markdown(artifact))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
