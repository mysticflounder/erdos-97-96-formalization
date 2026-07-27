#!/usr/bin/env python3
"""Find the first checked-leaf prefix whose source-core union is UNSAT.

The search uses one incremental plain Z3 solver.  It checks coarse leaf
batches first, then replays only the first UNSAT batch one leaf at a time.
The result is a smaller source-index candidate for tracked-core extraction;
it is discovery evidence until regenerated and LRAT-certified through Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import time

import z3


HERE = Path(__file__).resolve().parent
GENERATOR = HERE / "generate_verified_reduced_union_split.py"
spec = importlib.util.spec_from_file_location(
    "verified_distinct_reduced_union_generator", GENERATOR
)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {GENERATOR}")
generator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(generator)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def log(stage: str, **fields: object) -> None:
    print(json.dumps({"stage": stage, **fields}, sort_keys=True), flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=tuple(generator.ORBIT), required=True)
    parser.add_argument("--union-map", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--batch-size", type=int, default=16)
    args = parser.parse_args()
    if args.batch_size < 1:
        raise ValueError("batch size must be positive")

    mapping = json.loads(args.union_map.read_text(encoding="utf-8"))
    if not isinstance(mapping, dict):
        raise ValueError("union map is not a JSON object")
    generator.require_equal("orientation", mapping.get("orientation"), args.orientation)
    generator.require_equal("orbit", mapping.get("orbit"), generator.ORBIT[args.orientation])
    leaves = mapping.get("leaves")
    if not isinstance(leaves, list) or len(leaves) != 512:
        raise ValueError("union map does not contain exactly 512 leaves")
    leaf_indices: list[list[int]] = []
    for expected, record in enumerate(leaves):
        if not isinstance(record, dict) or record.get("leaf") != expected:
            raise ValueError(f"malformed leaf record {expected}")
        indices = record.get("source_assertion_indices")
        if not isinstance(indices, list) or not all(isinstance(item, int) for item in indices):
            raise ValueError(f"malformed source indices for leaf {expected}")
        leaf_indices.append(indices)

    outer, _rank, counts = generator.shared.surface.build(
        generator.ORBIT[args.orientation], 0
    )
    assertions = list(outer.solver.assertions())
    generator.require_equal(
        "source assertion count", len(assertions), mapping.get("source_assertion_count")
    )
    generator.require_equal(
        "surface source count", counts["total_source_assertions"], len(assertions)
    )
    fingerprint = generator.length_delimited_fingerprint(
        [assertion.sexpr() for assertion in assertions]
    )
    generator.require_equal(
        "source fingerprint",
        fingerprint,
        mapping.get("source_assertions_length_delimited_sha256"),
    )

    solver = z3.Solver()
    committed: set[int] = set()
    first_unsat_leaf: int | None = None
    started = time.monotonic()
    for batch_start in range(0, len(leaf_indices), args.batch_size):
        batch_stop = min(batch_start + args.batch_size, len(leaf_indices))
        batch_new = sorted(
            {
                index
                for leaf in leaf_indices[batch_start:batch_stop]
                for index in leaf
                if index not in committed
            }
        )
        solver.push()
        solver.add(*(assertions[index] for index in batch_new))
        result = solver.check()
        log(
            "batch_checked",
            batch_start=batch_start,
            batch_stop=batch_stop,
            candidate_assertions=len(committed | set(batch_new)),
            result=str(result),
            elapsed_seconds=time.monotonic() - started,
        )
        solver.pop()
        if result == z3.sat:
            solver.add(*(assertions[index] for index in batch_new))
            committed.update(batch_new)
            continue
        if result != z3.unsat:
            raise RuntimeError(f"batch {batch_start}:{batch_stop} returned {result}")

        for leaf in range(batch_start, batch_stop):
            leaf_new = sorted(set(leaf_indices[leaf]) - committed)
            solver.push()
            solver.add(*(assertions[index] for index in leaf_new))
            leaf_result = solver.check()
            log(
                "leaf_checked",
                leaf=leaf,
                candidate_assertions=len(committed | set(leaf_new)),
                result=str(leaf_result),
                elapsed_seconds=time.monotonic() - started,
            )
            solver.pop()
            if leaf_result == z3.sat:
                solver.add(*(assertions[index] for index in leaf_new))
                committed.update(leaf_new)
                continue
            if leaf_result != z3.unsat:
                raise RuntimeError(f"leaf {leaf} returned {leaf_result}")
            committed.update(leaf_new)
            first_unsat_leaf = leaf
            break
        break

    if first_unsat_leaf is None:
        raise RuntimeError("all 512 checked leaf-core unions remained SAT")
    final_indices = sorted(committed)
    final_check = z3.Solver()
    final_check.add(*(assertions[index] for index in final_indices))
    recheck_started = time.monotonic()
    final_result = final_check.check()
    recheck_seconds = time.monotonic() - recheck_started
    if final_result != z3.unsat:
        raise RuntimeError(f"final prefix rechecked as {final_result}")

    payload = {
        "schema": "p97-exact5-distinct-first-unsat-leaf-core-prefix-v1",
        "epistemic_status": "Z3_RECHECKED_UNSAT_SOURCE_ASSERTION_PREFIX_UNION",
        "orientation": args.orientation,
        "orbit": generator.ORBIT[args.orientation],
        "union_map_sha256": sha256(args.union_map),
        "source_assertion_count": len(assertions),
        "source_assertions_length_delimited_sha256": fingerprint,
        "first_unsat_leaf": first_unsat_leaf,
        "leaf_prefix_count": first_unsat_leaf + 1,
        "source_core_size": len(final_indices),
        "source_assertion_indices": final_indices,
        "reduced_union_source_indices": final_indices,
        "z3_recheck_seconds": recheck_seconds,
        "generator_sha256": sha256(Path(__file__)),
        "union_generator_sha256": sha256(GENERATOR),
        "aggregate_surface_sha256": sha256(Path(generator.shared.surface.__file__)),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    log(
        "finished",
        output=str(args.output),
        first_unsat_leaf=first_unsat_leaf,
        source_core_size=len(final_indices),
        elapsed_seconds=time.monotonic() - started,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
