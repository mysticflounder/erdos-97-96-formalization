#!/usr/bin/env python3
"""Extract source-level UNSAT cores under an exhaustive Boolean cube split.

The cube literals are asserted as fixed background facts.  Only the saved
source assertions are guarded by assumption markers, so an extracted leaf core
must exploit the cube rather than falling back to a cube-independent global
core.  The manifest records the complete truth table, making coverage explicit.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
from pathlib import Path
import time

import z3

import asymmetric_ordinal_rank as ordinal


DEFAULT_BITS = ("m_4_9", "m_4_10", "m_4_11", "m_4_12")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def extract_leaf(
    orbit: str,
    seed: int,
    timeout_seconds: float,
    source_indices: tuple[int, ...],
    source_sexprs: tuple[str, ...],
    bit_names: tuple[str, ...],
    values: tuple[bool, ...],
    minimize: bool,
) -> dict[str, object]:
    started = time.monotonic()
    outer, _ranks, counts = ordinal.build(orbit, seed)
    assertions = list(outer.solver.assertions())
    for index, expected in zip(source_indices, source_sexprs, strict=True):
        if assertions[index].sexpr() != expected:
            raise AssertionError(f"source assertion drift at index {index}")

    solver = z3.Solver()
    options: dict[str, object] = {
        "timeout": max(1, int(1000 * timeout_seconds)),
        "random_seed": seed,
    }
    if minimize:
        options["core.minimize"] = True
    solver.set(**options)
    cube = [
        z3.Bool(name) if value else z3.Not(z3.Bool(name))
        for name, value in zip(bit_names, values, strict=True)
    ]
    solver.add(*cube)
    markers = [z3.Bool(f"leaf_source_{index}") for index in source_indices]
    solver.add(*(
        z3.Implies(marker, assertions[index])
        for marker, index in zip(markers, source_indices, strict=True)
    ))
    status = solver.check(*markers)
    result: dict[str, object] = {
        "schema": "p97-exact5-card13-cube-source-core-leaf-v1",
        "orbit": orbit,
        "seed": seed,
        "cube": [
            {"atom": name, "value": value}
            for name, value in zip(bit_names, values, strict=True)
        ],
        "source_counts": counts,
        "input_core_size": len(source_indices),
        "status": str(status).upper(),
    }
    if status == z3.unsat:
        by_name = {
            str(marker): index
            for marker, index in zip(markers, source_indices, strict=True)
        }
        core = sorted(by_name[str(marker)] for marker in solver.unsat_core())
        result.update({
            "core_size": len(core),
            "core": [
                {"index": index, "assertion": assertions[index].sexpr()}
                for index in core
            ],
        })
    elif status == z3.unknown:
        result["reason"] = solver.reason_unknown()
    result["elapsed_seconds"] = time.monotonic() - started
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--bits", nargs="+", default=list(DEFAULT_BITS))
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--seconds", type=float, default=120.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--minimize", action="store_true")
    args = parser.parse_args()
    if not 1 <= len(args.bits) <= 10:
        raise ValueError("cube width must lie in [1, 10]")
    if not 1 <= args.jobs <= 24:
        raise ValueError("jobs must lie in [1, 24]")

    source = json.loads(args.input.read_text(encoding="utf-8"))
    source_indices = tuple(item["index"] for item in source["core"])
    source_sexprs = tuple(item["assertion"] for item in source["core"])
    bit_names = tuple(args.bits)
    assignments = tuple(itertools.product((False, True), repeat=len(bit_names)))
    args.output_dir.mkdir(parents=True, exist_ok=True)

    leaves: list[dict[str, object] | None] = [None] * len(assignments)
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.jobs) as pool:
        futures = {
            pool.submit(
                extract_leaf,
                source["orbit"],
                args.seed + leaf,
                args.seconds,
                source_indices,
                source_sexprs,
                bit_names,
                values,
                args.minimize,
            ): leaf
            for leaf, values in enumerate(assignments)
        }
        for future in concurrent.futures.as_completed(futures):
            leaf = futures[future]
            result = future.result()
            leaves[leaf] = result
            path = args.output_dir / f"leaf-{leaf:03d}.json"
            path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
            print(json.dumps({
                "leaf": leaf,
                "cube": result["cube"],
                "status": result["status"],
                "core_size": result.get("core_size"),
                "elapsed_seconds": result["elapsed_seconds"],
            }, sort_keys=True), flush=True)

    completed = [leaf for leaf in leaves if leaf is not None]
    if len(completed) != len(assignments):
        raise AssertionError("missing cube leaves")
    statuses = {str(leaf["status"]) for leaf in completed}
    sizes = [int(leaf["core_size"]) for leaf in completed if "core_size" in leaf]
    manifest = {
        "schema": "p97-exact5-card13-cube-source-core-manifest-v1",
        "epistemic_status": (
            "EXACT_SOURCE_ASSERTION_UNSAT_UNDER_EXHAUSTIVE_BOOLEAN_CUBES"
            if statuses == {"UNSAT"}
            else "INCOMPLETE_CUBE_SOURCE_CORE_EXTRACTION"
        ),
        "orbit": source["orbit"],
        "input": str(args.input),
        "input_sha256": sha256(args.input),
        "input_core_size": len(source_indices),
        "cube_bits": list(bit_names),
        "cube_width": len(bit_names),
        "leaf_count": len(assignments),
        "coverage": "all Boolean assignments in lexicographic False/True order",
        "statuses": sorted(statuses),
        "min_core_size": min(sizes) if sizes else None,
        "max_core_size": max(sizes) if sizes else None,
        "mean_core_size": (sum(sizes) / len(sizes)) if sizes else None,
        "minimize": args.minimize,
        "leaves": [
            {
                "leaf": leaf,
                "path": f"leaf-{leaf:03d}.json",
                "cube": completed[leaf]["cube"],
                "status": completed[leaf]["status"],
                "core_size": completed[leaf].get("core_size"),
                "elapsed_seconds": completed[leaf]["elapsed_seconds"],
            }
            for leaf in range(len(completed))
        ],
    }
    manifest_path = args.output_dir / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "manifest": str(manifest_path),
        "status": manifest["epistemic_status"],
        "min_core_size": manifest["min_core_size"],
        "max_core_size": manifest["max_core_size"],
        "mean_core_size": manifest["mean_core_size"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
