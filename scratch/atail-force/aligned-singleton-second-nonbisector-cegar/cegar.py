#!/usr/bin/env python3
"""CEGAR loop from exact equality partitions to strict Kalmanson metrics."""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path

import z3

import metric_check
import model as outer


def bounded_timeout_ms(requested: int, deadline: float) -> int:
    remaining = max(0.0, deadline - time.monotonic())
    return max(1, min(requested, int(remaining * 1000)))


def write_checkpoint(
    path: Path,
    *,
    started: float,
    refinements: list[dict[str, object]],
    status: str,
) -> None:
    payload = {
        "schema": "p97-aligned-singleton-second-nonbisector-cegar-checkpoint-v1",
        "status": status,
        "elapsed_seconds": time.monotonic() - started,
        "refinement_count": len(refinements),
        "refinements": refinements,
    }
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    encoding = outer.Encoding(
        timeout_ms=args.outer_timeout_ms,
        random_seed=args.random_seed,
        nonbisector=True,
        full_circle_intersections=False,
    )
    refinements: list[dict[str, object]] = []
    connectivity_refinements = 0

    if args.resume and args.checkpoint.exists():
        checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
        if (
            checkpoint.get("schema")
            != "p97-aligned-singleton-second-nonbisector-cegar-checkpoint-v1"
        ):
            raise ValueError("unexpected checkpoint schema")
        saved = checkpoint.get("refinements")
        if not isinstance(saved, list):
            raise ValueError("checkpoint refinements are malformed")
        for item in saved:
            if item["kind"] == "CONNECTIVITY":
                for component in item["sink_components"]:
                    encoding.add_connectivity_cut(frozenset(int(v) for v in component))
                connectivity_refinements += 1
            elif item["kind"] == "METRIC_UNSAT_CORE":
                flip_literals: list[z3.BoolRef] = []
                for core_item in item["core"]:
                    atom = encoding.same(
                        int(core_item["center"]),
                        int(core_item["left"]),
                        int(core_item["right"]),
                    )
                    flip_literals.append(
                        z3.Not(atom) if core_item["equal"] else atom
                    )
                encoding.add("metric_cegar_cut", z3.Or(*flip_literals))
            else:
                raise ValueError(f"unknown checkpoint refinement kind {item['kind']!r}")
        refinements = saved

    for _local_attempt in range(1, args.max_refinements + 1):
        attempt = len(refinements) + 1
        if time.monotonic() >= deadline:
            break
        encoding.solver.set(
            timeout=bounded_timeout_ms(args.outer_timeout_ms, deadline)
        )
        outer_started = time.monotonic()
        status = encoding.solver.check()
        outer_elapsed = time.monotonic() - outer_started
        if status != z3.sat:
            result_status = str(status).upper()
            return {
                "schema": "p97-aligned-singleton-second-nonbisector-cegar-v1",
                "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
                "status": result_status,
                "reason_unknown": (
                    encoding.solver.reason_unknown() if status == z3.unknown else None
                ),
                "n": outer.N,
                "refinement_count": len(refinements),
                "connectivity_refinements": connectivity_refinements,
                "constraint_counts": dict(sorted(encoding.counts.items())),
                "refinements": refinements,
                "elapsed_seconds": time.monotonic() - started,
            }

        witness = encoding.solver.model()
        rows = {
            center: tuple(
                point
                for point in range(outer.N)
                if outer.eval_bool(witness, encoding.member(center, point))
            )
            for center in range(outer.N)
        }
        components = outer.strongly_connected_components(rows)
        if len(components) != 1:
            sinks = outer.sink_components(rows, components)
            if not sinks:
                raise RuntimeError("non-strong graph has no sink component")
            for component in sinks:
                encoding.add_connectivity_cut(component)
            connectivity_refinements += 1
            refinements.append(
                {
                    "attempt": attempt,
                    "kind": "CONNECTIVITY",
                    "outer_elapsed_seconds": outer_elapsed,
                    "sink_components": [sorted(component) for component in sinks],
                }
            )
            write_checkpoint(
                args.checkpoint,
                started=started,
                refinements=refinements,
                status="RUNNING",
            )
            continue

        raw_classes = {
            center: [
                frozenset(block)
                for block in outer.equivalence_classes(encoding, witness, center)
            ]
            for center in range(outer.N)
        }
        metric_timeout = bounded_timeout_ms(args.metric_timeout_ms, deadline)
        metric_result = metric_check.check_partition(
            n=outer.N,
            raw_classes=raw_classes,
            timeout_ms=metric_timeout,
        )
        metric_status = metric_result["status"]
        if metric_status == "SAT":
            payload = outer.extract_payload(
                encoding,
                witness,
                status="SAT",
                elapsed_seconds=time.monotonic() - started,
                refinements=connectivity_refinements,
            )
            payload.update(
                {
                    "epistemic_status": (
                        "BOUNDED_RATIONAL_KALMANSON_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN"
                    ),
                    "metric_gate": metric_result,
                    "metric_refinement_count": sum(
                        item["kind"] == "METRIC_UNSAT_CORE"
                        for item in refinements
                    ),
                    "refinements": refinements,
                }
            )
            write_checkpoint(
                args.checkpoint,
                started=started,
                refinements=refinements,
                status="SAT",
            )
            return payload
        if metric_status == "UNKNOWN":
            return {
                "schema": "p97-aligned-singleton-second-nonbisector-cegar-v1",
                "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
                "status": "UNKNOWN",
                "reason_unknown": "metric gate: "
                + str(metric_result.get("reason_unknown")),
                "n": outer.N,
                "refinement_count": len(refinements),
                "connectivity_refinements": connectivity_refinements,
                "constraint_counts": dict(sorted(encoding.counts.items())),
                "refinements": refinements,
                "elapsed_seconds": time.monotonic() - started,
            }

        core = metric_result.get("unsat_core")
        if not isinstance(core, list) or not core:
            raise RuntimeError("metric UNSAT result has no nonempty core")
        flip_literals: list[z3.BoolRef] = []
        for item in core:
            atom = encoding.same(
                int(item["center"]),
                int(item["left"]),
                int(item["right"]),
            )
            flip_literals.append(z3.Not(atom) if item["equal"] else atom)
        encoding.add("metric_cegar_cut", z3.Or(*flip_literals))
        refinements.append(
            {
                "attempt": attempt,
                "kind": "METRIC_UNSAT_CORE",
                "outer_elapsed_seconds": outer_elapsed,
                "metric_elapsed_seconds": metric_result["elapsed_seconds"],
                "core_size": len(core),
                "core": core,
            }
        )
        write_checkpoint(
            args.checkpoint,
            started=started,
            refinements=refinements,
            status="RUNNING",
        )

    return {
        "schema": "p97-aligned-singleton-second-nonbisector-cegar-v1",
        "epistemic_status": "BOUNDED_UNCERTIFIED_RESULT",
        "status": "UNKNOWN",
        "reason_unknown": (
            "wall-clock budget exhausted"
            if time.monotonic() >= deadline
            else "refinement budget exhausted"
        ),
        "n": outer.N,
        "refinement_count": len(refinements),
        "connectivity_refinements": connectivity_refinements,
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "refinements": refinements,
        "elapsed_seconds": time.monotonic() - started,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, required=True)
    parser.add_argument("--wall-seconds", type=int, default=600)
    parser.add_argument("--outer-timeout-ms", type=int, default=300_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=300_000)
    parser.add_argument("--max-refinements", type=int, default=100)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument(
        "--resume",
        action="store_true",
        help="reload and reapply all cuts from the checkpoint before continuing",
    )
    args = parser.parse_args()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    result = run(args)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "checkpoint": str(args.checkpoint),
                "status": result["status"],
                "reason_unknown": result.get("reason_unknown"),
                "refinement_count": result.get("refinement_count"),
                "elapsed_seconds": result.get("elapsed_seconds"),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
