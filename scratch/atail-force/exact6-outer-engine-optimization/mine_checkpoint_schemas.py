#!/usr/bin/env python3
"""Mine deletion-minimal transported schemas from a direct-CNF CEGAR bank.

This is a theorem-discovery tool, not a closure certificate.  It independently
replays each shell-free exact metric cut as rational LRA, runs several deletion
orders, canonicalizes the surviving row-incidence schemas under boundary-order
compression and reflection, and compares them with a previously transported
schema bank.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import importlib.util
import itertools
import json
import random
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
VERIFY_PATH = HERE.parent / "exact6-allcenter-capaware-gate" / "verify.py"
ENCODER_PATH = HERE.parent / "exact6-allcenter-coverage-certificate" / "encode.py"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


verify = load_module("exact6_checkpoint_schema_verify", VERIFY_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_jsonl(path: Path) -> list[dict[str, object]]:
    return [
        json.loads(line)
        for line in path.read_text(encoding="utf-8").splitlines()
        if line
    ]


def exact_unsat(core: tuple[str, ...]) -> bool:
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(verify.VERTICES, 2)
    }
    solver = z3.Solver()
    solver.add(*(verify.named_formula(name, table) for name in core))
    status = solver.check()
    if status == z3.unknown:
        raise AssertionError(
            f"exact LRA replay returned unknown: {solver.reason_unknown()}"
        )
    return status == z3.unsat


def deletion_minimize(
    core: tuple[str, ...],
    order: tuple[str, ...],
) -> tuple[str, ...]:
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
        trial = tuple(candidate for candidate in minimized if candidate != name)
        if exact_unsat(trial):
            raise AssertionError("reported core is not deletion-minimal")
    return minimized


def minimize_task(task: tuple[int, tuple[str, ...], int]) -> dict[str, object]:
    index, core, order_count = task
    orders = [tuple(core), tuple(reversed(core))]
    for seed in range(max(0, order_count - len(orders))):
        order = list(core)
        random.Random(1_000_003 * index + seed).shuffle(order)
        orders.append(tuple(order))
    minimized = sorted({deletion_minimize(core, order) for order in orders})
    return {
        "input_index": index,
        "input_core_size": len(core),
        "minimal_cores": minimized,
    }


def semantic_schema_key(record: dict[str, object]) -> tuple[
    int,
    tuple[tuple[int, int], ...],
]:
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(pair) for pair in record["order_schema"]),
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--prior-bank", type=Path, required=True)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--orders", type=int, default=8)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    cuts = read_jsonl(args.checkpoint)
    sources: list[dict[str, object]] = []
    tasks: list[tuple[int, tuple[str, ...], int]] = []
    skipped_shell = 0
    for cut in cuts:
        names = tuple(sorted({
            str(constraint["name"])
            for constraint in cut["constraints"]  # type: ignore[union-attr]
        }))
        conditioned = cut.get("conditioned_shell") is not None
        has_shell_formula = any(
            name.startswith(("apex_shell_", "shell_")) for name in names
        )
        if conditioned != has_shell_formula:
            raise AssertionError(f"shell-conditioning drift in {cut['id']}")
        if conditioned:
            skipped_shell += 1
            continue
        if not exact_unsat(names):
            raise AssertionError(f"source cut does not replay exact UNSAT: {cut['id']}")
        task_index = len(tasks)
        tasks.append((task_index, names, args.orders))
        sources.append({
            "source_cut_id": cut["id"],
            "source_constraints": names,
            "source_required_memberships": cut["required_memberships"],
        })

    if args.workers == 1:
        minimized_results = [minimize_task(task) for task in tasks]
    else:
        with concurrent.futures.ProcessPoolExecutor(
            max_workers=args.workers
        ) as executor:
            minimized_results = list(executor.map(minimize_task, tasks))

    prior = json.loads(args.prior_bank.read_text(encoding="utf-8"))
    prior_keys = {semantic_schema_key(record) for record in prior["schemas"]}
    encoder = load_module("exact6_checkpoint_schema_encoder", ENCODER_PATH)
    _, prior_compact = encoder.load_learned_schema_bank(args.prior_bank, 8)
    prior_applications = set(
        encoder.transported_applications(encoder.N, prior_compact)
    )

    schemas: dict[
        tuple[int, tuple[tuple[int, int], ...]],
        dict[str, object],
    ] = {}
    minimal_core_count = 0
    for result in minimized_results:
        source = sources[int(result["input_index"])]
        for order_index, core_raw in enumerate(result["minimal_cores"]):
            core = tuple(core_raw)
            canonical = verify.canonical_core_schema(core)
            if canonical is None:
                raise AssertionError("shell-free row core was not transportable")
            key = (
                int(canonical["core_vertex_count"]),
                tuple(canonical["order_schema"]),
            )
            record = schemas.setdefault(key, {
                "core_vertex_count": key[0],
                "order_schema": [list(pair) for pair in key[1]],
                "complete_application_count": verify.generalized_application_count(
                    canonical
                ),
                "already_in_prior_bank": key in prior_keys,
                "provenance": [],
            })
            record["provenance"].append({  # type: ignore[union-attr]
                **source,
                "deletion_order_index": order_index,
                "input_core_size": result["input_core_size"],
                "minimal_core_size": len(core),
                "minimal_core": list(core),
                "exact_lra_unsat_replayed": True,
                "deletion_minimal_replayed": True,
            })
            minimal_core_count += 1

    ordered = [schemas[key] for key in sorted(schemas)]
    for record in ordered:
        key = semantic_schema_key(record)
        if key[0] <= 8:
            applications = set(
                encoder.transported_applications(encoder.N, [key])
            )
            record["new_application_count_over_prior_compact_bank"] = len(
                applications - prior_applications
            )
        else:
            record["new_application_count_over_prior_compact_bank"] = None

    new_schemas = [
        record for record in ordered if not record["already_in_prior_bank"]
    ]
    compact_new = [
        record
        for record in new_schemas
        if int(record["core_vertex_count"]) <= 8
    ]
    compact_new.sort(key=lambda record: (
        int(record["core_vertex_count"]),
        min(
            int(provenance["minimal_core_size"])
            for provenance in record["provenance"]
        ),
        -int(record["new_application_count_over_prior_compact_bank"]),
    ))

    payload = {
        "schema": "p97-exact6-direct-cnf-checkpoint-schema-mining-v1",
        "epistemic_status": (
            "EXACT_RATIONAL_LRA_THEOREM_DISCOVERY_NOT_LIVE_LEAN_CLOSURE"
        ),
        "checkpoint": {
            "path": str(args.checkpoint),
            "sha256": sha256(args.checkpoint),
            "cut_count": len(cuts),
            "shell_free_cut_count": len(tasks),
            "shell_conditioned_cut_count_skipped": skipped_shell,
        },
        "prior_bank": {
            "path": str(args.prior_bank),
            "sha256": sha256(args.prior_bank),
            "schema_count": len(prior["schemas"]),
        },
        "worker_count": args.workers,
        "deletion_orders_per_input": args.orders,
        "minimal_core_count": minimal_core_count,
        "unique_schema_count": len(ordered),
        "new_schema_count": len(new_schemas),
        "new_compact_schema_count_k_le_8": len(compact_new),
        "new_compact_schemas_k_le_8": compact_new,
        "schemas": ordered,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "status": "CHECKPOINT_SCHEMA_MINING_COMPLETE",
        "input_shell_free_cuts": len(tasks),
        "input_shell_conditioned_cuts_skipped": skipped_shell,
        "minimal_core_count": minimal_core_count,
        "unique_schema_count": len(ordered),
        "new_schema_count": len(new_schemas),
        "new_compact_schema_count_k_le_8": len(compact_new),
        "output": str(args.output),
        "output_sha256": sha256(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
