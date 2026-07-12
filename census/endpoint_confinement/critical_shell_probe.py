#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Add a source-indexed critical-shell layer to admitted packet rows.

For each source point, a shell row chooses both a blocker center and an exact
four-point support containing that source.  Every other selected K4 row at a
chosen blocker center must also contain that source, encoding the retained
no-q-free conclusion.  Point-pair counts are by distinct center, matching the
geometric theorem.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Callable, Mapping, Sequence

from census.endpoint_confinement.probe import PIN_CENTER, _fixed_rows, packet_labels
from census.endpoint_confinement.shadow import (
    ChoiceRow,
    ClassRow,
    RowChoice,
    full_center_extension_rows,
    solve_choice_rows,
)
from census.multi_center import multi_center_census as mc


STATUSES = ("SAT", "UNSAT", "INDETERMINATE")


def no_qfree_compatibility(
    source_by_row: Mapping[str, int],
) -> Callable[[ClassRow, ClassRow], bool]:
    """Require every selected K4 at a blocker center to contain its source."""

    def compatible(left: ClassRow, right: ClassRow) -> bool:
        for blocker, other in ((left, right), (right, left)):
            source = source_by_row.get(blocker.name)
            if (
                source is not None
                and blocker.center == other.center
                and source not in other.support
            ):
                return False
        return True

    return compatible


def critical_shell_choices(
    frame: mc.Frame,
    candidates: dict[int, list[frozenset[int]]],
    source: int,
) -> tuple[RowChoice, ...]:
    """All locally admissible exact four-shell choices through ``source``."""

    return tuple(
        RowChoice(center, support)
        for center in range(frame.n)
        if center != source
        for support in candidates[center]
        if source in support
    )


def source_shell_rows(
    frame: mc.Frame,
    candidates: dict[int, list[frozenset[int]]],
    *,
    fixed_sources: set[int],
) -> tuple[ChoiceRow, ...]:
    """One exact center/support choice for every nonfixed source point."""

    return tuple(
        ChoiceRow(
            f"shell:{source}",
            critical_shell_choices(frame, candidates, source),
            exact=True,
        )
        for source in range(frame.n)
        if source not in fixed_sources
    )


def _compact(result: dict) -> dict:
    return {
        key: result[key]
        for key in ("status", "nodes", "assignment")
        if key in result
    }


def _packet_job(args: tuple) -> dict:
    (
        n,
        pin_source_index,
        deleted_index,
        blocker,
        dangerous_tuple,
        row_type,
        max_nodes,
    ) = args
    labels = packet_labels(
        n,
        pin_source_index=pin_source_index,
        deleted_index=deleted_index,
    )
    frame, candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert candidates is not None
    dangerous = frozenset(dangerous_tuple)
    fixed_rows = _fixed_rows(labels, blocker, dangerous)
    shell_rows = source_shell_rows(
        frame,
        candidates,
        fixed_sources={labels.deleted},
    )
    source_by_row = {
        "dangerous": labels.deleted,
        **{
            shell_row.name: int(shell_row.name.split(":", maxsplit=1)[1])
            for shell_row in shell_rows
        },
    }
    no_qfree = no_qfree_compatibility(source_by_row)

    individual = {}
    individual_counts = Counter()
    started = time.perf_counter()
    for shell_row in shell_rows:
        result = solve_choice_rows(
            frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=fixed_rows,
            choice_rows=(shell_row,),
            max_nodes=max_nodes,
            extra_compatible=no_qfree,
        )
        source = int(shell_row.name.split(":", maxsplit=1)[1])
        individual[str(source)] = _compact(result)
        individual_counts[result["status"]] += 1

    if individual_counts["UNSAT"]:
        joint = {"status": "UNSAT", "nodes": 0, "decided_at": "individual"}
    else:
        joint = solve_choice_rows(
            frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=fixed_rows,
            choice_rows=shell_rows,
            max_nodes=max_nodes,
            extra_compatible=no_qfree,
        )
        joint["decided_at"] = "joint_shells"

    if joint["status"] == "UNSAT":
        joint_global = {
            "status": "UNSAT",
            "nodes": joint["nodes"],
            "decided_at": joint["decided_at"],
        }
    else:
        occupied = {row.center for row in fixed_rows}
        global_rows = full_center_extension_rows(frame, candidates, occupied)
        global_choices = tuple(
            ChoiceRow(
                row.name,
                tuple(RowChoice(row.center, support) for support in row.candidates),
                exact=row.exact,
            )
            for row in global_rows
        )
        joint_global = solve_choice_rows(
            frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=fixed_rows,
            choice_rows=(*shell_rows, *global_choices),
            max_nodes=max_nodes,
            want_assignment=True,
            extra_compatible=no_qfree,
        )
        joint_global["decided_at"] = "joint_shells_plus_global"

    return {
        "n": n,
        "profile": list(labels.profile),
        "pin_source_index": pin_source_index,
        "deleted_index": deleted_index,
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "blocker": blocker,
        "dangerous": sorted(dangerous),
        "type": row_type,
        "shell_sources": len(shell_rows) + 1,
        "choice_counts": {
            shell_row.name: len(shell_row.choices) for shell_row in shell_rows
        },
        "individual_counts": {
            status: individual_counts[status] for status in STATUSES
        },
        "individual": individual,
        "joint": _compact(joint) | {"decided_at": joint["decided_at"]},
        "joint_global": _compact(joint_global)
        | {"decided_at": joint_global["decided_at"]},
        "elapsed_sec": time.perf_counter() - started,
    }


def select_packets(
    placement_artifact: dict,
    *,
    n_min: int,
    n_max: int,
    all_placements: bool,
    per_type: int,
    limit: int | None,
) -> list[tuple]:
    """Select admitted packets deterministically, stratified by row type."""

    selected = []
    seen = Counter()
    for placement in placement_artifact["placements"]:
        n = placement["n"]
        if not n_min <= n <= n_max:
            continue
        if not all_placements and (
            placement["pin_source_index"], placement["deleted_index"]
        ) != (0, 1):
            continue
        for row in placement["rows"]:
            if row["status"] != "SAT":
                continue
            key = (
                n,
                placement["pin_source_index"] if all_placements else 0,
                placement["deleted_index"] if all_placements else 1,
                row["type"],
            )
            if seen[key] >= per_type:
                continue
            seen[key] += 1
            selected.append(
                (
                    n,
                    placement["pin_source_index"],
                    placement["deleted_index"],
                    row["blocker"],
                    tuple(row["dangerous"]),
                    row["type"],
                )
            )
            if limit is not None and len(selected) >= limit:
                return selected
    return selected


def run_packets(
    packets: Sequence[tuple], *, max_nodes: int, workers: int
) -> list[dict]:
    jobs = [(*packet, max_nodes) for packet in packets]
    results = []
    if workers == 1:
        for index, job in enumerate(jobs, start=1):
            results.append(_packet_job(job))
            print(
                f"[critical-shell] packet {index}/{len(jobs)} n={job[0]} "
                f"type={job[5]}",
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
                    f"[critical-shell] packet {index}/{len(jobs)} n={job[0]} "
                    f"type={job[5]}",
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


def artifact_for(results: list[dict], *, args: argparse.Namespace) -> dict:
    joint = Counter(row["joint"]["status"] for row in results)
    joint_global = Counter(row["joint_global"]["status"] for row in results)
    return {
        "schema": "p97-critical-shell-incidence-probe-v2",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "scope": {
            "n_min": args.n_min,
            "n_max": args.n_max,
            "all_placements": args.all_placements,
            "per_type": args.per_type,
            "limit": args.limit,
            "max_nodes_per_search": args.max_nodes,
            "workers": args.workers,
            "selection": "admitted packet rows stratified by dangerous-row type",
        },
        "packet_count": len(results),
        "joint_counts": {status: joint[status] for status in STATUSES},
        "joint_global_counts": {
            status: joint_global[status] for status in STATUSES
        },
        "packets": results,
    }


def _markdown(artifact: dict) -> str:
    scope = artifact["scope"]
    joint = artifact["joint_counts"]
    joint_global = artifact["joint_global_counts"]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Source-indexed critical-shell incidence probe",
        "",
        f"Generated `{artifact['generated_at']}`.",
        "",
        "Each source other than the deleted point chooses a blocker center and a ",
        "declared exact four-shell containing that source. The deleted source uses ",
        "the marked dangerous shell; the pinned source independently chooses a ",
        "blocker shell. Every selected K4 at a chosen blocker center must contain ",
        "that blocker row's source, encoding the no-q-free condition. Exact rows at ",
        "one center must be equal or disjoint; point-pair counts use distinct ",
        "centers. The final stage also selects one K4 row at every ambient center.",
        "",
        "This is still an incidence shadow with no coordinates or distance ",
        "equations. SAT is not Euclidean realizability, and a capped search is ",
        "INDETERMINATE rather than UNSAT.",
        "",
        f"Selection: `n = {scope['n_min']}..{scope['n_max']}`, "
        f"all placements `{scope['all_placements']}`, one packet per type "
        f"`{scope['per_type']}`, packet limit `{scope['limit']}`.",
        "",
        "## Summary",
        "",
        f"- Packets: `{artifact['packet_count']}`",
        f"- Joint shells: `SAT {joint['SAT']} / UNSAT {joint['UNSAT']} / "
        f"INDETERMINATE {joint['INDETERMINATE']}`",
        f"- Joint shells plus global K4: `SAT {joint_global['SAT']} / "
        f"UNSAT {joint_global['UNSAT']} / "
        f"INDETERMINATE {joint_global['INDETERMINATE']}`",
        "",
        "## Packets",
        "",
        "| n | source -> q | type | blocker | individual S/U/I | joint | joint+global |",
        "|---:|---|---|---:|---:|---|---|",
    ]
    for row in artifact["packets"]:
        counts = row["individual_counts"]
        lines.append(
            f"| {row['n']} | {row['pin_source']} -> {row['deleted']} | "
            f"`{row['type']}` | {row['blocker']} | "
            f"{counts['SAT']}/{counts['UNSAT']}/{counts['INDETERMINATE']} | "
            f"{row['joint']['status']} ({row['joint']['nodes']}) | "
            f"{row['joint_global']['status']} "
            f"({row['joint_global']['nodes']}) |"
        )
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--placement-results",
        type=Path,
        default=Path("census/global_confinement/placement_results_n11_12.json"),
    )
    parser.add_argument("--n-min", type=int, default=11)
    parser.add_argument("--n-max", type=int, default=12)
    parser.add_argument("--all-placements", action="store_true")
    parser.add_argument("--per-type", type=int, default=1)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--max-nodes", type=int, default=200_000)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.n_min < 11 or args.n_min > args.n_max:
        parser.error("require 11 <= --n-min <= --n-max")
    if args.per_type < 1:
        parser.error("--per-type must be positive")
    if not 1 <= args.workers <= 8:
        parser.error("--workers must be between 1 and 8")

    placement_artifact = json.loads(args.placement_results.read_text())
    packets = select_packets(
        placement_artifact,
        n_min=args.n_min,
        n_max=args.n_max,
        all_placements=args.all_placements,
        per_type=args.per_type,
        limit=args.limit,
    )
    results = run_packets(packets, max_nodes=args.max_nodes, workers=args.workers)
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
