#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Couple source-indexed critical shells to PIN-GENERAL audit rows.

The input packets are the placement/type representatives admitted by the
critical-shell checkpoint.  For each packet, this probe separately tests:

* every possible exact q-critical audit row; and
* simultaneous q-deleted K4 rows on six-center audit frames.

Every scenario also chooses the full source-indexed shell system and one K4 at
every otherwise unrepresented center.  This remains an incidence shadow, not
a Euclidean realization test.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path
from typing import Callable, Sequence

from census.global_confinement.critical_shell_probe import (
    STATUSES,
    no_qfree_compatibility,
    source_shell_rows,
)
from census.global_confinement.probe import (
    PacketLabels,
    _fixed_rows,
    packet_labels,
)
from census.global_confinement.shadow import (
    ChoiceRow,
    ClassRow,
    RowChoice,
    full_center_extension_rows,
    solve_choice_rows,
)
from census.multi_center import multi_center_census as mc


@dataclass(frozen=True)
class PacketContext:
    labels: PacketLabels
    frame: mc.Frame
    candidates: dict[int, list[frozenset[int]]]
    dangerous: frozenset[int]
    fixed_rows: tuple[ClassRow, ...]
    shell_rows: tuple[ChoiceRow, ...]
    no_qfree: Callable[[ClassRow, ClassRow], bool]


def _global_choice_rows(
    frame: mc.Frame,
    candidates: dict[int, list[frozenset[int]]],
    occupied_centers: set[int],
) -> tuple[ChoiceRow, ...]:
    return tuple(
        ChoiceRow(
            row.name,
            tuple(RowChoice(row.center, support) for support in row.candidates),
            exact=row.exact,
        )
        for row in full_center_extension_rows(
            frame, candidates, occupied_centers
        )
    )


def _compact(result: dict, *, keep_assignment: bool = False) -> dict:
    keys = ("status", "nodes", "assignment") if keep_assignment else (
        "status",
        "nodes",
    )
    return {key: result[key] for key in keys if key in result}


def _solve_scenario(
    frame: mc.Frame,
    candidates: dict[int, list[frozenset[int]]],
    fixed_rows: tuple[ClassRow, ...],
    shell_rows: tuple[ChoiceRow, ...],
    no_qfree: Callable[[ClassRow, ClassRow], bool],
    audit_rows: tuple[ChoiceRow, ...],
    audit_centers: set[int],
    *,
    max_nodes: int,
) -> dict:
    occupied = {row.center for row in fixed_rows} | audit_centers
    global_rows = _global_choice_rows(frame, candidates, occupied)
    return solve_choice_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        choice_rows=(*shell_rows, *audit_rows, *global_rows),
        max_nodes=max_nodes,
        want_assignment=True,
        extra_compatible=no_qfree,
    )


def _packet_context(packet: dict) -> PacketContext:
    labels = packet_labels(
        packet["n"],
        pin_source_index=packet["pin_source_index"],
        deleted_index=packet["deleted_index"],
    )
    frame, candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert candidates is not None
    dangerous = frozenset(packet["dangerous"])
    fixed_rows = _fixed_rows(labels, packet["blocker"], dangerous)
    shell_rows = source_shell_rows(
        frame,
        candidates,
        fixed_sources={labels.deleted},
    )
    source_by_row = {
        "dangerous": labels.deleted,
        **{
            row.name: int(row.name.split(":", maxsplit=1)[1])
            for row in shell_rows
        },
    }
    return PacketContext(
        labels,
        frame,
        candidates,
        dangerous,
        fixed_rows,
        shell_rows,
        no_qfree_compatibility(source_by_row),
    )


def _critical_result(
    context: PacketContext, center: int, *, max_nodes: int
) -> dict:
    choices = tuple(
        RowChoice(center, support)
        for support in context.candidates[center]
        if context.labels.deleted in support
    )
    return _solve_scenario(
        context.frame,
        context.candidates,
        context.fixed_rows,
        context.shell_rows,
        context.no_qfree,
        (ChoiceRow(f"audit-critical:{center}", choices, exact=True),),
        {center},
        max_nodes=max_nodes,
    )


def _survival_result(
    context: PacketContext, aux: tuple[int, int, int], *, max_nodes: int
) -> tuple[tuple[int, ...], dict]:
    triple = tuple(sorted(
        context.dangerous - {context.labels.deleted}
    ))
    audit_centers = tuple(sorted((*triple, *aux)))
    if len(audit_centers) != 6:
        raise AssertionError("audit-center labels are not distinct")
    audit_rows = tuple(
        ChoiceRow(
            f"audit-qfree:{center}",
            tuple(
                RowChoice(center, support)
                for support in context.candidates[center]
                if context.labels.deleted not in support
            ),
        )
        for center in audit_centers
    )
    result = _solve_scenario(
        context.frame,
        context.candidates,
        context.fixed_rows,
        context.shell_rows,
        context.no_qfree,
        audit_rows,
        set(audit_centers),
        max_nodes=max_nodes,
    )
    return audit_centers, result


def _packet_job(args: tuple) -> dict:
    packet, max_nodes, survival_frame_limit, skip_critical = args
    context = _packet_context(packet)
    labels = context.labels
    frame = context.frame
    dangerous = context.dangerous
    started = time.perf_counter()

    critical_counts = Counter()
    critical_results = {}
    first_critical_witness = None
    if not skip_critical:
        for center in range(frame.n):
            if center in {packet["blocker"], labels.deleted}:
                continue
            result = _critical_result(context, center, max_nodes=max_nodes)
            critical_counts[result["status"]] += 1
            critical_results[str(center)] = _compact(result)
            if result["status"] == "SAT" and first_critical_witness is None:
                first_critical_witness = {
                    "center": center,
                    "result": _compact(result, keep_assignment=True),
                }

    available_aux = tuple(
        point
        for point in range(frame.n)
        if point != packet["blocker"] and point not in dangerous
    )
    frames = tuple(combinations(available_aux, 3))
    if survival_frame_limit is not None:
        frames = frames[:survival_frame_limit]

    survival_counts = Counter()
    survival_results = []
    first_survival_witness = None
    for aux in frames:
        audit_centers, result = _survival_result(
            context, aux, max_nodes=max_nodes
        )
        survival_counts[result["status"]] += 1
        survival_results.append({
            "aux": list(aux),
            "audit_centers": list(audit_centers),
            "result": _compact(result),
        })
        if result["status"] == "SAT" and first_survival_witness is None:
            first_survival_witness = {
                "aux": list(aux),
                "audit_centers": list(audit_centers),
                "result": _compact(result, keep_assignment=True),
            }

    return {
        "n": packet["n"],
        "profile": list(labels.profile),
        "pin_source_index": packet["pin_source_index"],
        "deleted_index": packet["deleted_index"],
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "blocker": packet["blocker"],
        "dangerous": sorted(dangerous),
        "type": packet["type"],
        "critical_counts": {
            status: critical_counts[status] for status in STATUSES
        },
        "critical_results": critical_results,
        "first_critical_witness": first_critical_witness,
        "survival_frame_count": len(frames),
        "survival_counts": {
            status: survival_counts[status] for status in STATUSES
        },
        "survival_results": survival_results,
        "first_survival_witness": first_survival_witness,
        "elapsed_sec": time.perf_counter() - started,
    }


def select_packets(
    shell_artifact: dict,
    *,
    n_min: int,
    n_max: int,
    limit: int | None,
) -> list[dict]:
    packets = [
        packet
        for packet in shell_artifact["packets"]
        if n_min <= packet["n"] <= n_max
        and packet["joint_global"]["status"] == "SAT"
    ]
    return packets if limit is None else packets[:limit]


def run_packets(
    packets: Sequence[dict],
    *,
    max_nodes: int,
    survival_frame_limit: int | None,
    skip_critical: bool,
    workers: int,
) -> list[dict]:
    jobs = [
        (packet, max_nodes, survival_frame_limit, skip_critical)
        for packet in packets
    ]
    results = []
    if workers == 1:
        for index, job in enumerate(jobs, start=1):
            results.append(_packet_job(job))
            print(
                f"[shell-audit] packet {index}/{len(jobs)} n={job[0]['n']} "
                f"type={job[0]['type']}",
                file=sys.stderr,
                flush=True,
            )
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            futures = {pool.submit(_packet_job, job): job for job in jobs}
            for index, future in enumerate(as_completed(futures), start=1):
                job = futures[future]
                results.append(future.result())
                print(
                    f"[shell-audit] packet {index}/{len(jobs)} "
                    f"n={job[0]['n']} type={job[0]['type']}",
                    file=sys.stderr,
                    flush=True,
                )
    results.sort(key=lambda row: (
        row["n"],
        row["pin_source_index"],
        row["deleted_index"],
        row["type"],
        row["blocker"],
        row["dangerous"],
    ))
    return results


def _sum_counts(results: Sequence[dict], key: str) -> dict[str, int]:
    return {
        status: sum(row[key][status] for row in results)
        for status in STATUSES
    }


def artifact_for(results: list[dict], *, args: argparse.Namespace) -> dict:
    return {
        "schema": "p97-shell-coupled-audit-incidence-probe-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "scope": {
            "n_min": args.n_min,
            "n_max": args.n_max,
            "packet_limit": args.limit,
            "skip_critical": args.skip_critical,
            "survival_frames_per_packet": (
                None
                if args.all_survival_frames
                else args.survival_frames_per_packet
            ),
            "max_nodes_per_search": args.max_nodes,
            "workers": args.workers,
            "selection": (
                "one admitted packet per ordered placement and dangerous-row "
                "type from the source-indexed shell checkpoint"
            ),
        },
        "packet_count": len(results),
        "critical_counts": _sum_counts(results, "critical_counts"),
        "survival_frame_count": sum(
            row["survival_frame_count"] for row in results
        ),
        "survival_counts": _sum_counts(results, "survival_counts"),
        "packets": results,
    }


def _status_text(counts: dict[str, int]) -> str:
    return (
        f"SAT {counts['SAT']} / UNSAT {counts['UNSAT']} / "
        f"INDETERMINATE {counts['INDETERMINATE']}"
    )


def _markdown(artifact: dict) -> str:
    scope = artifact["scope"]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Shell-coupled PIN-GENERAL audit probe",
        "",
        f"Generated `{artifact['generated_at']}`.",
        "",
        "Every scenario includes the fixed pin and dangerous exact row, one ",
        "source-indexed blocker shell per carrier point, the selected-row ",
        "consequence of no-q-free at every blocker center, and one K4 at every ",
        "otherwise unrepresented center. It then adds either one exact ",
        "q-critical audit row or six simultaneous q-deleted audit rows.",
        "",
        "There are no coordinates or distance equations. SAT is only an ",
        "incidence witness; a capped search is INDETERMINATE, not UNSAT.",
        "",
        "## Summary",
        "",
        f"- Packets: `{artifact['packet_count']}`",
        f"- Q-critical scenarios: `{_status_text(artifact['critical_counts'])}`",
        f"- Q-deleted frames: `{artifact['survival_frame_count']}`",
        f"- Q-deleted survival: `{_status_text(artifact['survival_counts'])}`",
        f"- Survival frames per packet: "
        f"`{scope['survival_frames_per_packet']}`",
        "",
        "## Packets",
        "",
        "| n | source -> q | type | blocker | critical S/U/I | survival S/U/I |",
        "|---:|---|---|---:|---:|---:|",
    ]
    for row in artifact["packets"]:
        critical = row["critical_counts"]
        survival = row["survival_counts"]
        lines.append(
            f"| {row['n']} | {row['pin_source']} -> {row['deleted']} | "
            f"`{row['type']}` | {row['blocker']} | "
            f"{critical['SAT']}/{critical['UNSAT']}/"
            f"{critical['INDETERMINATE']} | "
            f"{survival['SAT']}/{survival['UNSAT']}/"
            f"{survival['INDETERMINATE']} |"
        )
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--shell-results",
        type=Path,
        default=Path(
            "census/global_confinement/"
            "critical_shell_results_all_placements_n11_12.json"
        ),
    )
    parser.add_argument("--n-min", type=int, default=11)
    parser.add_argument("--n-max", type=int, default=12)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--skip-critical", action="store_true")
    parser.add_argument("--survival-frames-per-packet", type=int, default=1)
    parser.add_argument("--all-survival-frames", action="store_true")
    parser.add_argument("--max-nodes", type=int, default=300_000)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.n_min < 11 or args.n_min > args.n_max:
        parser.error("require 11 <= --n-min <= --n-max")
    if args.limit is not None and args.limit < 1:
        parser.error("--limit must be positive")
    if args.survival_frames_per_packet < 0:
        parser.error("--survival-frames-per-packet must be nonnegative")
    if not 1 <= args.workers <= 8:
        parser.error("--workers must be between 1 and 8")

    shell_artifact = json.loads(args.shell_results.read_text())
    packets = select_packets(
        shell_artifact,
        n_min=args.n_min,
        n_max=args.n_max,
        limit=args.limit,
    )
    survival_limit = (
        None if args.all_survival_frames else args.survival_frames_per_packet
    )
    results = run_packets(
        packets,
        max_nodes=args.max_nodes,
        survival_frame_limit=survival_limit,
        skip_critical=args.skip_critical,
        workers=args.workers,
    )
    artifact = artifact_for(results, args=args)
    encoded = json.dumps(artifact, indent=2, sort_keys=True) + "\n"
    if args.out:
        args.out.write_text(encoded)
    else:
        print(encoded, end="")
    if args.markdown:
        args.markdown.write_text(_markdown(artifact))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
