#!/usr/bin/env python3
"""Extract and recheck one global Z3 core from a verified reduced union.

This is a discovery/size-reduction pass, not the proof endpoint.  The output
contains original source-assertion indices.  A later invocation of
``generate_verified_reduced_union_split.py`` rebuilds those exact assertions
as Lean ``BVLogicalExpr`` terms, after which Lean's verified compiler and an
LRAT certificate establish the final theorem.
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
    parser.add_argument(
        "--minimize",
        action="store_true",
        help="ask Z3 to minimize the returned assumption core",
    )
    args = parser.parse_args()

    mapping = json.loads(args.union_map.read_text(encoding="utf-8"))
    if not isinstance(mapping, dict):
        raise ValueError("union map is not a JSON object")
    generator.require_equal("orientation", mapping.get("orientation"), args.orientation)
    generator.require_equal("orbit", mapping.get("orbit"), generator.ORBIT[args.orientation])
    source_indices = mapping.get("reduced_union_source_indices")
    if not isinstance(source_indices, list) or not all(
        isinstance(index, int) for index in source_indices
    ):
        raise ValueError("union map has malformed reduced source indices")
    if source_indices != sorted(set(source_indices)):
        raise ValueError("union source indices are not sorted and unique")

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
    sexprs = [assertion.sexpr() for assertion in assertions]
    fingerprint = generator.length_delimited_fingerprint(sexprs)
    generator.require_equal(
        "source fingerprint",
        fingerprint,
        mapping.get("source_assertions_length_delimited_sha256"),
    )
    if any(not 0 <= index < len(assertions) for index in source_indices):
        raise ValueError("union source index outside rebuilt stream")

    solver = z3.Solver()
    if args.minimize:
        solver.set("core.minimize", True)
    tag_to_index: dict[str, int] = {}
    for index in source_indices:
        name = f"source_assertion_{index}"
        tag = z3.Bool(name)
        tag_to_index[name] = index
        solver.assert_and_track(assertions[index], tag)
    log(
        "check_started",
        orientation=args.orientation,
        union_size=len(source_indices),
        minimize=args.minimize,
    )
    started = time.monotonic()
    result = solver.check()
    elapsed = time.monotonic() - started
    log("check_finished", result=str(result), elapsed_seconds=elapsed)
    if result != z3.unsat:
        raise RuntimeError(f"tracked reduced union returned {result}, expected unsat")

    core_indices = sorted(tag_to_index[str(tag)] for tag in solver.unsat_core())
    if not core_indices:
        raise RuntimeError("Z3 returned an empty core")
    if len(core_indices) != len(set(core_indices)):
        raise RuntimeError("Z3 returned duplicate tracked assertions")
    if not set(core_indices).issubset(source_indices):
        raise RuntimeError("Z3 core is not a subset of the reduced union")
    log("core_extracted", core_size=len(core_indices))

    recheck = z3.Solver()
    recheck.add(*(assertions[index] for index in core_indices))
    recheck_started = time.monotonic()
    recheck_result = recheck.check()
    recheck_elapsed = time.monotonic() - recheck_started
    log(
        "core_recheck_finished",
        result=str(recheck_result),
        elapsed_seconds=recheck_elapsed,
    )
    if recheck_result != z3.unsat:
        raise RuntimeError(f"extracted core rechecked as {recheck_result}")

    payload = {
        "schema": "p97-exact5-distinct-global-source-core-v1",
        "epistemic_status": "Z3_EXTRACTED_AND_Z3_RECHECKED_SOURCE_CORE",
        "orientation": args.orientation,
        "orbit": generator.ORBIT[args.orientation],
        "union_map_sha256": sha256(args.union_map),
        "source_assertion_count": len(assertions),
        "source_assertions_length_delimited_sha256": fingerprint,
        "input_union_size": len(source_indices),
        "source_core_size": len(core_indices),
        "source_assertion_indices": core_indices,
        "z3_core_minimize": args.minimize,
        "z3_check_seconds": elapsed,
        "z3_recheck_seconds": recheck_elapsed,
        "generator_sha256": sha256(Path(__file__)),
        "union_generator_sha256": sha256(GENERATOR),
        "aggregate_surface_sha256": sha256(Path(generator.shared.surface.__file__)),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    log("finished", output=str(args.output), core_size=len(core_indices))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
