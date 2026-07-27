#!/usr/bin/env python3
"""Shrink a DRAT-mapped source packet with a checked source-level replay."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import time

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SURFACE_PATH = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)


def load_surface():
    spec = importlib.util.spec_from_file_location(
        "exact5_external_core_reduction_surface", SURFACE_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SURFACE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def assertion_fingerprint(assertions: list[z3.BoolRef]) -> str:
    digest = hashlib.sha256()
    for assertion in assertions:
        encoded = assertion.sexpr().encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--seconds", type=float, default=120.0)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--core-minimize", action="store_true")
    args = parser.parse_args()
    if args.seconds <= 0:
        raise ValueError("--seconds must be positive")
    return args


def main() -> None:
    args = parse_args()
    started = time.monotonic()
    payload = json.loads(args.input.read_text(encoding="utf-8"))
    if (
        payload.get("epistemic_status")
        != "DRAT_VERIFIED_EXTERNAL_CORE_MAPPED_TO_SOURCE_ASSERTIONS"
    ):
        raise ValueError("input is not a DRAT-verified mapped source core")

    surface = load_surface()
    outer, _rank, counts = surface.build(payload["orbit"], args.seed)
    assertions = list(outer.solver.assertions())
    fingerprint = assertion_fingerprint(assertions)
    if fingerprint != payload["source_assertions_sha256"]:
        raise AssertionError("source assertion fingerprint drift")
    source_indices: list[int] = []
    for item in payload["core"]:
        index = int(item["index"])
        if assertions[index].sexpr() != item["assertion"]:
            raise AssertionError(f"source assertion drift at index {index}")
        source_indices.append(index)
    if len(source_indices) != len(set(source_indices)):
        raise AssertionError("duplicate source assertion indices")

    cube = [z3.parse_smt2_string(
        f"(assert {sexpr})", decls={
            name: z3.Bool(name)
            for name in (
                "shell_5",
                "g1_2_5",
                "g1_2_6",
                "g1_2_7",
                "g1_2_8",
                "g1_2_9",
                "g1_2_10",
                "g1_2_11",
                "g1_2_12",
            )
        }
    )[0] for sexpr in payload["core_cube_literals"]]

    solver = z3.Solver()
    options: dict[str, object] = {
        "timeout": max(1, int(1000 * args.seconds)),
        "random_seed": args.seed,
    }
    if args.core_minimize:
        options["core.minimize"] = True
    solver.set(**options)
    markers = [
        z3.Bool(f"reduction_source_{position}")
        for position in range(len(source_indices))
    ]
    solver.add(*(
        z3.Implies(marker, assertions[index])
        for marker, index in zip(markers, source_indices, strict=True)
    ))
    status = solver.check(*markers, *cube)
    extracted = time.monotonic()
    result: dict[str, object] = {
        "schema": "p97-exact5-card13-external-source-core-reduction-v1",
        "epistemic_status": "EXTERNAL_SOURCE_CORE_REDUCTION_INCOMPLETE",
        "orbit": payload["orbit"],
        "leaf": payload["leaf"],
        "source_assertions_sha256": fingerprint,
        "source_counts": counts,
        "input": str(args.input),
        "input_external_source_core_size": len(source_indices),
        "input_external_cube_core_size": len(cube),
        "core_minimize": args.core_minimize,
        "extraction_status": str(status).upper(),
        "extraction_reason_unknown": (
            solver.reason_unknown() if status == z3.unknown else None
        ),
        "extraction_seconds": extracted - started,
    }
    if status == z3.unsat:
        marker_positions = {
            marker.decl().name(): position
            for position, marker in enumerate(markers)
        }
        cube_by_sexpr = {literal.sexpr(): literal for literal in cube}
        reduced_positions: list[int] = []
        selected_cube_by_sexpr: dict[str, z3.BoolRef] = {}
        for item in solver.unsat_core():
            if z3.is_const(item) and item.decl().name() in marker_positions:
                reduced_positions.append(marker_positions[item.decl().name()])
            elif item.sexpr() in cube_by_sexpr:
                selected_cube_by_sexpr[item.sexpr()] = cube_by_sexpr[item.sexpr()]
            else:
                raise AssertionError(f"unexpected core item: {item.sexpr()}")
        reduced_indices = sorted({source_indices[pos] for pos in reduced_positions})
        selected_cube = [
            literal for literal in cube if literal.sexpr() in selected_cube_by_sexpr
        ]

        replay = z3.Solver()
        replay.set(
            timeout=max(1, int(1000 * args.seconds)), random_seed=args.seed
        )
        replay.add(*(assertions[index] for index in reduced_indices))
        replay.add(*selected_cube)
        replay_status = replay.check()
        result.update({
            "core_size": len(reduced_indices),
            "core": [
                {"index": index, "assertion": assertions[index].sexpr()}
                for index in reduced_indices
            ],
            "core_cube_size": len(selected_cube),
            "core_cube_literals": [literal.sexpr() for literal in selected_cube],
            "core_recheck_status": str(replay_status).upper(),
            "core_recheck_reason_unknown": (
                replay.reason_unknown() if replay_status == z3.unknown else None
            ),
            "epistemic_status": (
                "CHECKED_REDUCED_SOURCE_CORE_FROM_EXTERNAL_DRAT_CORE"
                if replay_status == z3.unsat
                else "UNCHECKED_REDUCED_SOURCE_CORE_FROM_EXTERNAL_DRAT_CORE"
            ),
            "verified_bvexpr_contract": {
                "core_entries": (
                    "zero-based indices and exact sexprs in the original "
                    "surface.build(...).solver.assertions() list"
                ),
                "additional_branch_hypotheses": (
                    "the selected exact source literals in core_cube_literals"
                ),
            },
        })
    result["total_seconds"] = time.monotonic() - started
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "status": result["epistemic_status"],
        "input_source_core_size": len(source_indices),
        "source_core_size": result.get("core_size"),
        "cube_core_size": result.get("core_cube_size"),
        "output": str(args.output),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
