#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Search the complete PIN-GENERAL audit frame for a metric-core escape.

This probe combines the strongest theorem-facing incidence data currently
available in the repository:

* the exact pinned and dangerous rows;
* one source-indexed exact critical shell through every carrier source;
* a selected surplus-apex row containing the deleted surplus point;
* six simultaneous q-deleted audit rows; and
* one selected K4 row at every otherwise unrepresented center.

Every search also enforces the no-q-free linkage from ``CriticalShellSystem``
and rejects assignments containing any formalized metric core.  It remains a
bounded incidence model: SAT is not a Euclidean realization and UNSAT is not a
general-cardinality theorem.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime, timezone
from functools import lru_cache
from pathlib import Path
from typing import Sequence

from census.global_confinement.metric_realizability_probe import (
    _formalized_metric_core,
)
from census.global_confinement.shadow import (
    ChoiceRow,
    ClassRow,
    RowChoice,
    full_center_extension_rows,
    hull_order,
    solve_choice_rows,
)
from census.global_confinement.shell_audit_probe import _packet_context
from census.global_confinement.surplus_source_metric_core_probe import (
    SURPLUS_CENTER,
    _metric_rows,
)
from census.multi_center import multi_center_census as mc


HERE = Path(__file__).resolve().parent
DEFAULT_INPUT = HERE / "shell_audit_results_all_frames_n11_12.json"
DEFAULT_OUT = HERE / "full_audit_metric_core_results_n11_12.json"
SCHEMA = "p97-global-confinement-full-audit-metric-core-v2"
STATUSES = ("SAT", "UNSAT", "INDETERMINATE")


@dataclass(frozen=True)
class Scenario:
    """One weaker-SAT six-row audit frame to strengthen and re-solve."""

    packet_index: int
    frame_index: int
    packet: dict
    aux: tuple[int, int, int]
    audit_centers: tuple[int, ...]

    @property
    def key(self) -> tuple[int, int]:
        return self.packet_index, self.frame_index


def select_scenarios(
    source: dict,
    *,
    packet_indices: tuple[int, ...] | None,
    packet_limit: int | None,
    frames_per_packet: int | None,
    scenario_limit: int | None,
) -> tuple[list[Scenario], int, int]:
    """Select weaker-SAT frames and count all selected weaker verdicts.

    Weaker-UNSAT frames are omitted from the expensive search because every
    added surplus/core constraint is monotone.  ``frames_per_packet`` counts
    only weaker-SAT frames, which makes a one-frame falsifier sweep useful.
    """

    allowed = None if packet_indices is None else set(packet_indices)
    packets = list(enumerate(source["packets"]))
    if allowed is not None:
        missing = allowed - {index for index, _ in packets}
        if missing:
            raise ValueError(f"packet index outside input scope: {min(missing)}")
        packets = [(index, packet) for index, packet in packets if index in allowed]
    if packet_limit is not None:
        packets = packets[:packet_limit]

    scenarios: list[Scenario] = []
    weaker_unsat = 0
    weaker_indeterminate = 0
    for packet_index, packet in packets:
        packet_sat = 0
        for frame_index, raw in enumerate(packet["survival_results"]):
            status = raw["result"]["status"]
            if status == "UNSAT":
                weaker_unsat += 1
                continue
            if status == "INDETERMINATE":
                weaker_indeterminate += 1
                continue
            if frames_per_packet is not None and packet_sat >= frames_per_packet:
                continue
            packet_sat += 1
            scenarios.append(
                Scenario(
                    packet_index=packet_index,
                    frame_index=frame_index,
                    packet=packet,
                    aux=tuple(raw["aux"]),
                    audit_centers=tuple(raw["audit_centers"]),
                )
            )
    if scenario_limit is not None:
        scenarios = scenarios[:scenario_limit]
    return scenarios, weaker_unsat, weaker_indeterminate


def _choice_rows(scenario: Scenario):
    context = _packet_context(scenario.packet)
    deleted = context.labels.deleted
    surplus_choices = tuple(
        RowChoice(SURPLUS_CENTER, support)
        for support in context.candidates[SURPLUS_CENTER]
        if deleted in support
    )
    audit_rows = tuple(
        ChoiceRow(
            f"audit-qfree:{center}",
            tuple(
                RowChoice(center, support)
                for support in context.candidates[center]
                if deleted not in support
            ),
        )
        for center in scenario.audit_centers
    )
    occupied = (
        {row.center for row in context.fixed_rows}
        | set(scenario.audit_centers)
        | {SURPLUS_CENTER}
    )
    global_rows = tuple(
        ChoiceRow(
            row.name,
            tuple(RowChoice(row.center, support) for support in row.candidates),
            exact=row.exact,
        )
        for row in full_center_extension_rows(
            context.frame, context.candidates, occupied
        )
    )
    return context, (
        *context.shell_rows,
        ChoiceRow("surplus-source", surplus_choices),
        *audit_rows,
        *global_rows,
    )


def _compact(result: dict, *, keep_assignment: bool = False) -> dict:
    keys = ("status", "nodes", "assignment") if keep_assignment else (
        "status",
        "nodes",
    )
    return {key: result[key] for key in keys if key in result}


def _scenario_job(args: tuple[Scenario, int]) -> dict:
    scenario, max_nodes = args
    started = time.perf_counter()
    context, choice_rows = _choice_rows(scenario)
    order = hull_order(context.frame)

    incidence = solve_choice_rows(
        context.frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=context.fixed_rows,
        choice_rows=choice_rows,
        max_nodes=max_nodes,
        want_assignment=True,
        extra_compatible=context.no_qfree,
    )
    first_core = None
    if incidence["status"] == "SAT":
        rows = tuple(
            ClassRow(
                name,
                raw["center"],
                frozenset(raw["support"]),
                exact=raw["exact"],
            )
            for name, raw in incidence["assignment"].items()
        )
        first_core = _formalized_metric_core(
            _metric_rows(rows), context.frame.n, order
        )

    prefix_cache_misses = 0
    complete_cache_misses = 0

    @lru_cache(maxsize=None)
    def prefix_core_free(rows) -> bool:
        nonlocal prefix_cache_misses
        prefix_cache_misses += 1
        return _formalized_metric_core(
            rows,
            context.frame.n,
            order,
            include_extended=False,
            include_ordered=False,
        ) is None

    @lru_cache(maxsize=None)
    def complete_core_free(rows) -> bool:
        nonlocal complete_cache_misses
        complete_cache_misses += 1
        return _formalized_metric_core(rows, context.frame.n, order) is None

    if incidence["status"] != "SAT":
        core_free = {
            "status": incidence["status"],
            "nodes": incidence["nodes"],
        }
    else:
        core_free = solve_choice_rows(
            context.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=context.fixed_rows,
            choice_rows=choice_rows,
            max_nodes=max_nodes,
            want_assignment=True,
            extra_compatible=context.no_qfree,
            prefix_compatible=lambda rows: prefix_core_free(_metric_rows(rows)),
            complete_compatible=lambda rows: complete_core_free(
                _metric_rows(rows)
            ),
        )

    prefix_info = prefix_core_free.cache_info()
    complete_info = complete_core_free.cache_info()
    packet = scenario.packet
    return {
        "packet_index": scenario.packet_index,
        "frame_index": scenario.frame_index,
        "n": packet["n"],
        "profile": packet["profile"],
        "pin_source": packet["pin_source"],
        "deleted": packet["deleted"],
        "blocker": packet["blocker"],
        "dangerous": packet["dangerous"],
        "type": packet["type"],
        "aux": list(scenario.aux),
        "audit_centers": list(scenario.audit_centers),
        "surplus_choice_count": sum(
            1
            for support in context.candidates[SURPLUS_CENTER]
            if context.labels.deleted in support
        ),
        "incidence": _compact(incidence, keep_assignment=False),
        "first_incidence_core": first_core,
        "core_free": _compact(core_free, keep_assignment=True),
        "core_cache": {
            "prefix": {
                "hits": prefix_info.hits,
                "misses": prefix_cache_misses,
            },
            "complete": {
                "hits": complete_info.hits,
                "misses": complete_cache_misses,
            },
        },
        "elapsed_sec": time.perf_counter() - started,
    }


def _selection_scope(
    *,
    packet_indices: tuple[int, ...] | None,
    packet_limit: int | None,
    frames_per_packet: int | None,
    scenario_limit: int | None,
) -> dict:
    return {
        "packet_indices": None if packet_indices is None else list(packet_indices),
        "packet_limit": packet_limit,
        "frames_per_packet": frames_per_packet,
        "scenario_limit": scenario_limit,
    }


def _artifact(
    input_path: Path,
    *,
    workers: int,
    max_nodes: int,
    selection_scope: dict,
    expected_scenarios: int,
    weaker_unsat: int,
    weaker_indeterminate: int,
    results: Sequence[dict],
    complete: bool,
) -> dict:
    ordered = sorted(results, key=lambda row: (row["packet_index"], row["frame_index"]))
    incidence_counts = Counter(row["incidence"]["status"] for row in ordered)
    core_counts = Counter(row["core_free"]["status"] for row in ordered)
    first_core_counts = Counter(
        row["first_incidence_core"]["stage"]
        for row in ordered
        if row["first_incidence_core"] is not None
    )
    terminal = complete and core_counts["INDETERMINATE"] == 0
    all_excluded = terminal and core_counts["SAT"] == 0
    return {
        "schema": SCHEMA,
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "input": os.path.relpath(input_path, HERE.parents[1]),
        "input_sha256": hashlib.sha256(input_path.read_bytes()).hexdigest(),
        "complete": complete,
        "scope": {
            **selection_scope,
            "workers": workers,
            "max_nodes": max_nodes,
            "expected_scenarios": expected_scenarios,
            "completed_scenarios": len(ordered),
            "weaker_unsat_frames_skipped": weaker_unsat,
            "weaker_indeterminate_frames_skipped": weaker_indeterminate,
        },
        "summary": {
            "incidence": {status: incidence_counts[status] for status in STATUSES},
            "core_free": {status: core_counts[status] for status in STATUSES},
            "first_incidence_core": dict(sorted(first_core_counts.items())),
            "all_selected_frames_excluded": all_excluded,
        },
        "results": ordered,
    }


def _result_matches_scenario(result: dict, scenario: Scenario) -> bool:
    packet = scenario.packet
    expected = {
        "packet_index": scenario.packet_index,
        "frame_index": scenario.frame_index,
        "n": packet["n"],
        "profile": packet["profile"],
        "pin_source": packet["pin_source"],
        "deleted": packet["deleted"],
        "blocker": packet["blocker"],
        "dangerous": packet["dangerous"],
        "type": packet["type"],
        "aux": list(scenario.aux),
        "audit_centers": list(scenario.audit_centers),
    }
    return all(result.get(key) == value for key, value in expected.items())


def _validated_resume_results(
    resume: dict,
    input_path: Path,
    *,
    scenarios: Sequence[Scenario],
    selection_scope: dict,
) -> tuple[dict, ...]:
    if resume.get("schema") != SCHEMA:
        raise ValueError("--resume artifact has the wrong schema")
    expected_input = os.path.relpath(input_path, HERE.parents[1])
    if resume.get("input") != expected_input:
        raise ValueError("--resume artifact names a different input")
    digest = hashlib.sha256(input_path.read_bytes()).hexdigest()
    if resume.get("input_sha256") != digest:
        raise ValueError("--resume input content has changed")
    scope = resume.get("scope", {})
    for key, value in selection_scope.items():
        if scope.get(key) != value:
            raise ValueError("--resume artifact has a different scenario scope")
    if scope.get("expected_scenarios") != len(scenarios):
        raise ValueError("--resume artifact has a different scenario scope")

    by_key = {scenario.key: scenario for scenario in scenarios}
    reusable = []
    seen = set()
    for result in resume.get("results", ()):
        key = result.get("packet_index"), result.get("frame_index")
        if key in seen:
            raise ValueError("--resume artifact contains a duplicate scenario")
        seen.add(key)
        scenario = by_key.get(key)
        if scenario is None or not _result_matches_scenario(result, scenario):
            raise ValueError("--resume artifact contains a mismatched scenario")
        if result.get("core_free", {}).get("status") in {"SAT", "UNSAT"}:
            reusable.append(result)
    return tuple(reusable)


def run(
    input_path: Path,
    *,
    workers: int,
    max_nodes: int,
    packet_indices: tuple[int, ...] | None,
    packet_limit: int | None,
    frames_per_packet: int | None,
    scenario_limit: int | None,
    checkpoint_path: Path | None = None,
    resume_results: Sequence[dict] = (),
) -> dict:
    source = json.loads(input_path.read_text())
    scenarios, weaker_unsat, weaker_indeterminate = select_scenarios(
        source,
        packet_indices=packet_indices,
        packet_limit=packet_limit,
        frames_per_packet=frames_per_packet,
        scenario_limit=scenario_limit,
    )
    selection_scope = _selection_scope(
        packet_indices=packet_indices,
        packet_limit=packet_limit,
        frames_per_packet=frames_per_packet,
        scenario_limit=scenario_limit,
    )
    completed_keys = {
        (result["packet_index"], result["frame_index"])
        for result in resume_results
    }
    jobs = [
        (scenario, max_nodes)
        for scenario in scenarios
        if scenario.key not in completed_keys
    ]
    results = list(resume_results)

    def checkpoint() -> None:
        if checkpoint_path is None:
            return
        artifact = _artifact(
            input_path,
            workers=workers,
            max_nodes=max_nodes,
            selection_scope=selection_scope,
            expected_scenarios=len(scenarios),
            weaker_unsat=weaker_unsat,
            weaker_indeterminate=weaker_indeterminate,
            results=results,
            complete=False,
        )
        checkpoint_path.parent.mkdir(parents=True, exist_ok=True)
        checkpoint_path.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")

    def receive(result: dict) -> None:
        results.append(result)
        print(
            f"[{len(results)}/{len(scenarios)}] "
            f"packet={result['packet_index']} frame={result['frame_index']} "
            f"incidence={result['incidence']['status']} "
            f"core-free={result['core_free']['status']} "
            f"nodes={result['core_free']['nodes']}",
            flush=True,
        )
        checkpoint()

    if workers == 1:
        for job in jobs:
            receive(_scenario_job(job))
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            futures = [pool.submit(_scenario_job, job) for job in jobs]
            for future in as_completed(futures):
                receive(future.result())

    return _artifact(
        input_path,
        workers=workers,
        max_nodes=max_nodes,
        selection_scope=selection_scope,
        expected_scenarios=len(scenarios),
        weaker_unsat=weaker_unsat,
        weaker_indeterminate=weaker_indeterminate,
        results=results,
        complete=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--workers", type=int, default=min(8, os.cpu_count() or 1))
    parser.add_argument("--max-nodes", type=int, default=300_000)
    parser.add_argument("--packet-index", type=int, action="append")
    parser.add_argument("--packet-limit", type=int)
    parser.add_argument("--frames-per-packet", type=int)
    parser.add_argument("--scenario-limit", type=int)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    if args.workers < 1:
        parser.error("--workers must be positive")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")
    for name in ("packet_limit", "frames_per_packet", "scenario_limit"):
        value = getattr(args, name)
        if value is not None and value < 1:
            parser.error(f"--{name.replace('_', '-')} must be positive")
    packet_indices = (
        None if args.packet_index is None else tuple(sorted(set(args.packet_index)))
    )
    input_path = args.input.resolve()
    source = json.loads(input_path.read_text())
    scenarios, _, _ = select_scenarios(
        source,
        packet_indices=packet_indices,
        packet_limit=args.packet_limit,
        frames_per_packet=args.frames_per_packet,
        scenario_limit=args.scenario_limit,
    )
    selection_scope = _selection_scope(
        packet_indices=packet_indices,
        packet_limit=args.packet_limit,
        frames_per_packet=args.frames_per_packet,
        scenario_limit=args.scenario_limit,
    )
    resume_results = ()
    if args.resume and args.out.exists():
        try:
            resume_results = _validated_resume_results(
                json.loads(args.out.read_text()),
                input_path,
                scenarios=scenarios,
                selection_scope=selection_scope,
            )
        except ValueError as error:
            parser.error(str(error))
        print(
            f"reusing {len(resume_results)} terminal scenarios; "
            "retrying all indeterminate scenarios",
            flush=True,
        )
    output = run(
        input_path,
        workers=args.workers,
        max_nodes=args.max_nodes,
        packet_indices=packet_indices,
        packet_limit=args.packet_limit,
        frames_per_packet=args.frames_per_packet,
        scenario_limit=args.scenario_limit,
        checkpoint_path=args.out.resolve(),
        resume_results=resume_results,
    )
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output["summary"], indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
