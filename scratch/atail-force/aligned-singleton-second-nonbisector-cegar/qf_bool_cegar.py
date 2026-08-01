#!/usr/bin/env python3
"""Fail-closed CEGAR driver for the ground-Boolean n=17 performance port."""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from pathlib import Path

import z3

import duplicate_center_cegar
import metric_check
import qf_bool_model as outer


LEGACY_CEGAR_SHA256 = "d9b019e98323f4cfb420db96e9cfd2120e00985f55bc0e0e751ef1a2b9a3b6a7"
METRIC_CHECK_SHA256 = "cff5feb1d5cec07f6342c5304494c12494c9c622e322005077e29ede0368b46a"
DUPLICATE_CENTER_CEGAR_SHA256 = (
    "36f344c98ea3a88bc4056deeb9a048023f967bbfb70d6e80a52b4ab6831d89eb"
)
HERE = Path(__file__).resolve().parent
SOURCE_HASHES = {
    "model.py": outer.LEGACY_MODEL_SHA256,
    "cegar.py": LEGACY_CEGAR_SHA256,
    "metric_check.py": METRIC_CHECK_SHA256,
    "duplicate_center_cegar.py": DUPLICATE_CENTER_CEGAR_SHA256,
}
for filename, expected in SOURCE_HASHES.items():
    actual = hashlib.sha256((HERE / filename).read_bytes()).hexdigest()
    if actual != expected:
        raise RuntimeError(
            f"FAIL_CLOSED_SOURCE_HASH_MISMATCH: {filename} is {actual}, expected {expected}"
        )

CHECKPOINT_SCHEMA = (
    "p97-aligned-singleton-second-nonbisector-qf-bool-cegar-checkpoint-v2"
)


def bounded_timeout_ms(requested: int, deadline: float) -> int:
    remaining = max(0.0, deadline - time.monotonic())
    return max(1, min(requested, int(remaining * 1000)))


def implementation_hashes() -> dict[str, str]:
    answer = dict(SOURCE_HASHES)
    for filename in ("qf_bool_model.py", "qf_bool_cegar.py"):
        answer[filename] = hashlib.sha256((HERE / filename).read_bytes()).hexdigest()
    return answer


def write_checkpoint(
    path: Path,
    *,
    started: float,
    refinements: list[dict[str, object]],
    status: str,
) -> None:
    payload = {
        "schema": CHECKPOINT_SCHEMA,
        "status": status,
        "n": outer.N,
        "source_hashes": SOURCE_HASHES,
        "elapsed_seconds": time.monotonic() - started,
        "refinement_count": len(refinements),
        "refinements": refinements,
    }
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def apply_refinement(
    encoding: outer.Encoding,
    item: dict[str, object],
) -> bool:
    kind = item.get("kind")
    if kind == "CONNECTIVITY":
        components = item.get("sink_components")
        if not isinstance(components, list):
            raise ValueError("malformed connectivity refinement")
        for component in components:
            if not isinstance(component, list):
                raise ValueError("malformed sink component")
            encoding.add_connectivity_cut(frozenset(int(v) for v in component))
        return True
    if kind == "METRIC_UNSAT_CORE":
        core = item.get("core")
        if not isinstance(core, list) or not core:
            raise ValueError("malformed or empty metric core")
        flips: list[z3.BoolRef] = []
        for core_item in core:
            if not isinstance(core_item, dict):
                raise ValueError("malformed metric core item")
            atom = encoding.same(
                int(core_item["center"]),
                int(core_item["left"]),
                int(core_item["right"]),
            )
            flips.append(z3.Not(atom) if bool(core_item["equal"]) else atom)
        encoding.add("metric_cegar_cut", z3.Or(*flips))
        return False
    if kind == duplicate_center_cegar.KIND:
        antecedents = duplicate_center_cegar.validate_refinement(item, outer.N)
        encoding.add(
            "duplicate_center_equality_core_cegar_cut",
            z3.Or(
                *(
                    z3.Not(encoding.member(center, point))
                    for center, point in antecedents
                )
            ),
        )
        return False
    raise ValueError(f"unknown checkpoint refinement kind {kind!r}")


def unknown_payload(
    encoding: outer.Encoding,
    *,
    started: float,
    reason: str,
    refinements: list[dict[str, object]],
    connectivity_refinements: int,
) -> dict[str, object]:
    return {
        "schema": "p97-aligned-singleton-second-nonbisector-cegar-v1",
        "encoder": "ground-bool-one-hot-v1",
        "implementation_hashes": implementation_hashes(),
        "epistemic_status": "UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT",
        "status": "UNKNOWN",
        "reason_unknown": reason,
        "n": outer.N,
        "refinement_count": len(refinements),
        "connectivity_refinements": connectivity_refinements,
        "duplicate_center_refinements": sum(
            item.get("kind") == duplicate_center_cegar.KIND
            for item in refinements
        ),
        "constraint_counts": dict(sorted(encoding.counts.items())),
        "refinements": refinements,
        "elapsed_seconds": time.monotonic() - started,
        "scope": "exact bounded n=17 outer; no z/escape constraints",
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    encoding = outer.Encoding(
        timeout_ms=bounded_timeout_ms(args.outer_timeout_ms, deadline),
        random_seed=args.random_seed,
        nonbisector=True,
        full_circle_intersections=False,
    )
    ground_ok, ground_detail = outer.formula_is_ground_bool(encoding)
    if not ground_ok:
        raise RuntimeError("FAIL_CLOSED_NON_GROUND_FORMULA: " + ground_detail)

    refinements: list[dict[str, object]] = []
    connectivity_refinements = 0
    if args.resume and args.checkpoint.exists():
        checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
        if checkpoint.get("schema") != CHECKPOINT_SCHEMA:
            raise ValueError("unexpected checkpoint schema")
        if checkpoint.get("n") != outer.N:
            raise ValueError("checkpoint carrier mismatch")
        if checkpoint.get("source_hashes") != SOURCE_HASHES:
            raise ValueError("checkpoint source hash mismatch")
        saved = checkpoint.get("refinements")
        if not isinstance(saved, list):
            raise ValueError("checkpoint refinements are malformed")
        for raw_item in saved:
            if not isinstance(raw_item, dict):
                raise ValueError("malformed checkpoint refinement")
            connectivity_refinements += int(apply_refinement(encoding, raw_item))
        refinements = saved

    build_elapsed = time.monotonic() - started
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
            if status == z3.unknown:
                return unknown_payload(
                    encoding,
                    started=started,
                    reason="outer solver: " + encoding.solver.reason_unknown(),
                    refinements=refinements,
                    connectivity_refinements=connectivity_refinements,
                )
            return {
                "schema": "p97-aligned-singleton-second-nonbisector-cegar-v1",
                "encoder": "ground-bool-one-hot-v1",
                "implementation_hashes": implementation_hashes(),
                "epistemic_status": (
                    "BOUNDED_N17_SOLVER_UNSAT_EVIDENCE_ONLY_NO_PROOF_ARTIFACT"
                ),
                "status": "UNSAT",
                "reason_unknown": None,
                "n": outer.N,
                "refinement_count": len(refinements),
                "connectivity_refinements": connectivity_refinements,
                "duplicate_center_refinements": sum(
                    item.get("kind") == duplicate_center_cegar.KIND
                    for item in refinements
                ),
                "constraint_counts": dict(sorted(encoding.counts.items())),
                "refinements": refinements,
                "build_elapsed_seconds": build_elapsed,
                "elapsed_seconds": time.monotonic() - started,
                "scope": "exact bounded n=17 outer; no z/escape constraints",
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
        duplicate_cores = duplicate_center_cegar.find_duplicate_center_cores(
            rows,
            outer.N,
            limit=args.duplicate_center_cuts_per_witness,
        )
        if duplicate_cores:
            for core in duplicate_cores:
                refinement = {
                    "attempt": attempt,
                    "outer_elapsed_seconds": outer_elapsed,
                    **core,
                }
                apply_refinement(encoding, refinement)
                refinements.append(refinement)
            write_checkpoint(
                args.checkpoint,
                started=started,
                refinements=refinements,
                status="RUNNING",
            )
            continue

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
        metric_result = metric_check.check_partition(
            n=outer.N,
            raw_classes=raw_classes,
            timeout_ms=bounded_timeout_ms(args.metric_timeout_ms, deadline),
        )
        metric_status = metric_result.get("status")
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
                    "implementation_hashes": implementation_hashes(),
                    "epistemic_status": (
                        "BOUNDED_RATIONAL_KALMANSON_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN"
                    ),
                    "metric_gate": metric_result,
                    "metric_refinement_count": sum(
                        item["kind"] == "METRIC_UNSAT_CORE"
                        for item in refinements
                    ),
                    "duplicate_center_refinements": sum(
                        item.get("kind") == duplicate_center_cegar.KIND
                        for item in refinements
                    ),
                    "refinements": refinements,
                    "build_elapsed_seconds": build_elapsed,
                    "scope": "exact bounded n=17 outer; no z/escape constraints",
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
            return unknown_payload(
                encoding,
                started=started,
                reason="metric gate: " + str(metric_result.get("reason_unknown")),
                refinements=refinements,
                connectivity_refinements=connectivity_refinements,
            )
        if metric_status != "UNSAT":
            raise RuntimeError(f"FAIL_CLOSED_METRIC_STATUS: {metric_status!r}")

        core = metric_result.get("unsat_core")
        if not isinstance(core, list) or not core:
            raise RuntimeError("metric UNSAT result has no nonempty core")
        refinement: dict[str, object] = {
            "attempt": attempt,
            "kind": "METRIC_UNSAT_CORE",
            "outer_elapsed_seconds": outer_elapsed,
            "metric_elapsed_seconds": metric_result["elapsed_seconds"],
            "core_size": len(core),
            "core": core,
        }
        apply_refinement(encoding, refinement)
        refinements.append(refinement)
        write_checkpoint(
            args.checkpoint,
            started=started,
            refinements=refinements,
            status="RUNNING",
        )

    return unknown_payload(
        encoding,
        started=started,
        reason=(
            "wall-clock budget exhausted"
            if time.monotonic() >= deadline
            else "refinement budget exhausted"
        ),
        refinements=refinements,
        connectivity_refinements=connectivity_refinements,
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, required=True)
    parser.add_argument("--wall-seconds", type=int, default=900)
    parser.add_argument("--outer-timeout-ms", type=int, default=300_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=300_000)
    parser.add_argument("--max-refinements", type=int, default=1000)
    parser.add_argument(
        "--duplicate-center-cuts-per-witness", type=int, default=32
    )
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    if args.duplicate_center_cuts_per_witness < 0:
        parser.error("--duplicate-center-cuts-per-witness must be nonnegative")
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
