#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Exact finite CEGAR coverage audit for the direct selected-row terminal.

This driver reuses the corrected fixed fourteen-role map and independent
structural verifier from ``robust-all-center-marco/bank_cegar.py``.  Unlike the
all-bank continuation, every cut here is justified specifically by the new
forward-CCW, direct-support Kalmanson matcher.  It neither uses the reversed
order nor accepts a match obtained only from transitive metric equality.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BANK_CEGAR = HERE.parent / "robust-all-center-marco" / "bank_cegar.py"
DEFAULT_OUTPUT = HERE / "direct_schema_coverage_checkpoint.json"
SCHEMA = "p97-atail-direct-kalmanson-schema-coverage-v1"
STAGE = "equality-convex-five-point-three-selected-row-kalmanson"

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


bank = load_module(BANK_CEGAR, "p97_direct_kalmanson_coverage_bank")


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        BANK_CEGAR,
        bank.ROBUST_SEARCH,
        ROOT / "census/atail_force/producer_bank.py",
        ROOT / "census/global_confinement/shadow.py",
        ROOT / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
    )
    return {
        str(path.relative_to(ROOT)): file_sha256(path)
        for path in paths
    }


def atomic_write(path: Path, value: Mapping[str, object]) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def direct_matches(surface: Any, rows: tuple[Any, ...]) -> tuple[dict[str, object], ...]:
    return tuple(
        match
        for match in bank.scan(surface, rows, exact_centers=frozenset())
        if match["stage"] == STAGE
    )


def row_pattern_for_match(
    surface: Any,
    choices: Mapping[int, int],
    match: Mapping[str, object],
) -> dict[str, int]:
    core = {str(role): int(label) for role, label in match["core"].items()}
    first_apex = surface.by_name[bank.robust.FIRST_APEX]
    centers = {core["O"], core["A"], core["Y"]} - {first_apex}
    return {str(center): int(choices[center]) for center in sorted(centers)}


def exact_cut(
    surface: Any,
    rows: tuple[Any, ...],
    choices: Mapping[int, int],
    match: Mapping[str, object],
    iteration: int,
) -> dict[str, object]:
    pattern = row_pattern_for_match(surface, choices, match)
    centers = frozenset(int(center) for center in pattern)
    subset_matches = direct_matches(
        surface,
        tuple(row for row in rows if row.center in centers),
    )
    if not subset_matches:
        raise RuntimeError("direct Kalmanson match did not survive dependency projection")
    return {
        "iteration": iteration,
        "row_pattern": pattern,
        "row_pattern_named": [
            {
                "center": surface.by_label[center],
                "support": sorted(
                    surface.by_label[point]
                    for point in next(
                        row.support for row in rows if row.center == center
                    )
                ),
            }
            for center in sorted(centers)
        ],
        "required_exact_centers": [],
        "required_exact_center_names": [],
        "matches": list(subset_matches),
    }


def initial_state(args: argparse.Namespace) -> dict[str, object]:
    return {
        "schema": SCHEMA,
        "status": "RUNNING_FAIL_CLOSED",
        "source_sha256": source_hashes(),
        "budgets": {
            "max_iterations": args.max_iterations,
            "wall_seconds": args.wall_seconds,
            "max_nodes_per_iteration": args.max_nodes_per_iteration,
        },
        "iterations": 0,
        "direct_schema_cuts": [],
        "verified_witnesses": [],
        "last_event": "initialized",
        "epistemic_status": (
            "EXACT_FINITE_FIXED_PROFILE_ONLY; NO LIVE_PARENT_EXTRACTION"
        ),
    }


def load_or_initialize(args: argparse.Namespace) -> dict[str, object]:
    expected = initial_state(args)
    if not args.resume or not args.output.exists():
        return expected
    state = json.loads(args.output.read_text(encoding="utf-8"))
    if state.get("schema") != SCHEMA:
        raise RuntimeError("checkpoint schema mismatch")
    if state.get("source_sha256") != source_hashes():
        raise RuntimeError("checkpoint source drift")
    if state.get("budgets") != expected["budgets"]:
        raise RuntimeError("checkpoint budget drift")
    if state.get("status") != "RUNNING_FAIL_CLOSED":
        return state
    return state


def run(args: argparse.Namespace) -> dict[str, object]:
    surface = bank.robust.Surface()
    state = load_or_initialize(args)
    if state["status"] != "RUNNING_FAIL_CLOSED":
        return state
    started = time.monotonic()
    start_iteration = int(state["iterations"]) + 1
    for iteration in range(start_iteration, args.max_iterations + 1):
        state["iterations"] = iteration
        if time.monotonic() - started > args.wall_seconds:
            state["status"] = "WALL_BUDGET_FAIL_CLOSED"
            state["last_event"] = "wall budget before corrected map call"
            atomic_write(args.output, state)
            return state
        candidate = bank.dfs_candidate(
            surface,
            state["direct_schema_cuts"],
            max_nodes=args.max_nodes_per_iteration,
        )
        if candidate["status"] != "SAT":
            state["status"] = candidate["status"]
            state["last_event"] = candidate
            atomic_write(args.output, state)
            return state

        rows = tuple(candidate["rows"])
        blockers = dict(candidate["blockers"])
        choices = dict(candidate["choices"])
        ok, reason = surface.verify_model(rows, blockers)
        if not ok:
            raise RuntimeError(f"corrected-map witness failed verifier: {reason}")
        matches = direct_matches(surface, rows)
        witness = {
            "iteration": iteration,
            "dfs_nodes": candidate["nodes"],
            "rows": bank.named_rows(surface, rows, choices),
            "blockers": bank.named_blockers(surface, blockers),
            "direct_matches": list(matches),
        }
        state["verified_witnesses"].append(witness)
        if not matches:
            state["status"] = "SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW"
            state["last_event"] = witness
            atomic_write(args.output, state)
            return state

        cut = exact_cut(surface, rows, choices, matches[0], iteration)
        cut_key = json.dumps(cut["row_pattern"], sort_keys=True)
        if any(
            json.dumps(old["row_pattern"], sort_keys=True) == cut_key
            for old in state["direct_schema_cuts"]
        ):
            raise RuntimeError("duplicate direct-schema cut did not prune")
        state["direct_schema_cuts"].append(cut)
        state["last_event"] = {
            "kind": "direct_schema_cut",
            "iteration": iteration,
            "row_pattern": cut["row_pattern"],
        }
        atomic_write(args.output, state)
        print(
            f"iteration {iteration}: direct schema cut "
            f"(nodes={candidate['nodes']}, rows={len(cut['row_pattern'])})",
            flush=True,
        )

    state["status"] = "ITERATION_BUDGET_FAIL_CLOSED"
    state["last_event"] = "iteration budget"
    atomic_write(args.output, state)
    return state


def check(path: Path, max_nodes: int) -> dict[str, object]:
    state = json.loads(path.read_text(encoding="utf-8"))
    if state.get("schema") != SCHEMA:
        raise RuntimeError("checkpoint schema mismatch")
    if state.get("source_sha256") != source_hashes():
        raise RuntimeError("checkpoint source drift")
    surface = bank.robust.Surface()
    checked_cuts = 0
    for cut in state["direct_schema_cuts"]:
        rows = []
        for named in cut["row_pattern_named"]:
            center = surface.by_name[named["center"]]
            support = frozenset(surface.by_name[label] for label in named["support"])
            index = int(cut["row_pattern"][str(center)])
            if support != surface.candidates[center][index]:
                raise RuntimeError("stored direct cut candidate/support drift")
            rows.append(
                bank.shadow.ClassRow(f"check:{center}", center, support, exact=False)
            )
        matches = direct_matches(surface, tuple(rows))
        if not matches:
            raise RuntimeError("stored direct cut no longer matches the consumer")
        checked_cuts += 1

    terminal = None
    if state["status"] == "UNSAT_EXHAUSTIVE_FINITE_DFS":
        terminal = bank.dfs_candidate(
            surface,
            state["direct_schema_cuts"],
            max_nodes=max_nodes,
        )
        if terminal["status"] != "UNSAT_EXHAUSTIVE_FINITE_DFS":
            raise RuntimeError("terminal exhaustive DFS replay drift")
    elif state["status"] == "SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW":
        witness = state["last_event"]
        if witness["direct_matches"]:
            raise RuntimeError("stored terminal witness is not schema-avoiding")
    return {
        "status": state["status"],
        "checked_direct_schema_cuts": checked_cuts,
        "verified_witnesses": len(state["verified_witnesses"]),
        "terminal_replay": terminal,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--max-iterations", type=int, default=4096)
    parser.add_argument("--wall-seconds", type=float, default=300.0)
    parser.add_argument("--max-nodes-per-iteration", type=int, default=5000000)
    args = parser.parse_args()
    if min(args.max_iterations, args.wall_seconds, args.max_nodes_per_iteration) <= 0:
        raise SystemExit("all budgets must be positive")
    if args.check:
        print(json.dumps(check(args.output, args.max_nodes_per_iteration), sort_keys=True))
        return 0
    state = run(args)
    print(
        f"{state['status']}: iterations={state['iterations']} "
        f"cuts={len(state['direct_schema_cuts'])}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
