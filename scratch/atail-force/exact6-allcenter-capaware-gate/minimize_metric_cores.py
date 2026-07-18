#!/usr/bin/env python3
"""Exact parallel deletion minimization and canonical grouping of metric cores."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import random
from pathlib import Path

import z3

from verify import (
    VERTICES,
    canonical_core_schema,
    generalized_application_count,
    named_formula,
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def exact_unsat(core: tuple[str, ...]) -> bool:
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(VERTICES, 2)
    }
    solver = z3.Solver()
    solver.add(*(named_formula(name, table) for name in core))
    status = solver.check()
    if status == z3.unknown:
        raise AssertionError(f"exact LRA replay returned unknown: {solver.reason_unknown()}")
    return status == z3.unsat


def deletion_minimize(core: tuple[str, ...], order: tuple[str, ...]) -> tuple[str, ...]:
    active = list(core)
    for name in order:
        if name not in active:
            continue
        trial = tuple(candidate for candidate in active if candidate != name)
        if exact_unsat(trial):
            active = list(trial)
    minimized = tuple(sorted(active))
    if not exact_unsat(minimized):
        raise AssertionError("deletion minimization lost UNSAT")
    for name in minimized:
        if exact_unsat(tuple(candidate for candidate in minimized if candidate != name)):
            raise AssertionError("reported core is not deletion-minimal")
    return minimized


def minimize_task(task: tuple[int, tuple[str, ...], int]) -> dict[str, object]:
    index, core, order_count = task
    orders = [tuple(core), tuple(reversed(core))]
    for seed in range(max(0, order_count - 2)):
        order = list(core)
        random.Random(1_000_003 * index + seed).shuffle(order)
        orders.append(tuple(order))
    minimized = sorted({deletion_minimize(core, order) for order in orders})
    return {
        "input_index": index,
        "input_core_size": len(core),
        "minimal_cores": minimized,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("results", type=Path, nargs="+")
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--orders", type=int, default=4)
    parser.add_argument("--shard-index", type=int, default=0)
    parser.add_argument("--shard-count", type=int, default=1)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source_records = []
    tasks = []
    global_index = 0
    for result_path in args.results:
        payload = json.loads(result_path.read_text(encoding="utf-8"))
        for record in payload["metric_core_cuts"]:
            if global_index % args.shard_count != args.shard_index:
                global_index += 1
                continue
            global_index += 1
            core = tuple(record["core"])
            if any(name.startswith("apex_shell_") for name in core):
                continue
            task_index = len(tasks)
            tasks.append((task_index, core, args.orders))
            source_records.append({
                "result": str(result_path),
                "orbit": payload["orbit"],
                "attempt": record["attempt"],
                "source_core": list(core),
            })

    if args.workers == 1:
        minimized_results = [minimize_task(task) for task in tasks]
    else:
        with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as executor:
            minimized_results = list(executor.map(minimize_task, tasks))

    schemas: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, object]] = {}
    minimal_core_count = 0
    for minimized_result in minimized_results:
        source = source_records[minimized_result["input_index"]]
        for order_index, core in enumerate(minimized_result["minimal_cores"]):
            canonical = canonical_core_schema(tuple(core))
            if canonical is None:
                raise AssertionError("shell-free row core was not transportable")
            key = (
                int(canonical["core_vertex_count"]),
                tuple(canonical["order_schema"]),
            )
            output = schemas.setdefault(key, {
                "core_vertex_count": key[0],
                "order_schema": [list(item) for item in key[1]],
                "complete_application_count": generalized_application_count(canonical),
                "provenance": [],
            })
            output["provenance"].append({
                **source,
                "order_index": order_index,
                "input_core_size": minimized_result["input_core_size"],
                "minimal_core_size": len(core),
                "minimal_core": list(core),
                "exact_lra_unsat_replayed": True,
                "deletion_minimal_replayed": True,
            })
            minimal_core_count += 1

    ordered = [schemas[key] for key in sorted(schemas)]
    payload = {
        "schema": "p97-exact6-allcenter-minimized-metric-schema-bank-v1",
        "epistemic_status": "EXACT_RATIONAL_LRA_CORE_BANK_NOT_LEAN_PROOF",
        "sources": [
            {"path": str(path), "sha256": sha256(path)} for path in args.results
        ],
        "worker_count": args.workers,
        "shard_index": args.shard_index,
        "shard_count": args.shard_count,
        "deletion_orders_per_input": args.orders,
        "input_core_count": len(tasks),
        "minimal_core_count": minimal_core_count,
        "unique_schema_count": len(ordered),
        "compact_schema_count_k_le_8": sum(
            int(record["core_vertex_count"]) <= 8 for record in ordered
        ),
        "schemas": ordered,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "input_core_count": payload["input_core_count"],
        "minimal_core_count": payload["minimal_core_count"],
        "unique_schema_count": payload["unique_schema_count"],
        "compact_schema_count_k_le_8": payload["compact_schema_count_k_le_8"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
