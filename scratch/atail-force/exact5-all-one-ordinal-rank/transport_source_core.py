#!/usr/bin/env python3
"""Rebuild a source-index core at another all-one hub orbit.

The three orbit encoders append assertions in the same deterministic order,
but assertions mentioning the distinguished hub and spokes are not textually
identical.  This script transports only the source *indices* and records the
fresh target-orbit expressions.  The resulting candidate must still be
bit-blasted, solved, and proof-checked independently.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import all_one_ordinal_rank as ordinal


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--orbit", choices=ordinal.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source = json.loads(args.input.read_text(encoding="utf-8"))
    indices = [int(item["index"]) for item in source["core"]]
    if len(indices) != len(set(indices)):
        raise ValueError("source core contains duplicate assertion indices")

    outer, _rank, counts = ordinal.build(args.orbit, args.seed, 0)
    assertions = list(outer.solver.assertions())
    if indices and max(indices) >= len(assertions):
        raise ValueError(
            f"source index {max(indices)} exceeds target assertion count "
            f"{len(assertions)}"
        )

    payload = {
        "schema": "p97-exact5-card13-all-one-transported-source-core-v1",
        "epistemic_status": "CANDIDATE_SOURCE_INDEX_TRANSPORT",
        "orbit": args.orbit,
        "seed": args.seed,
        "source_counts": counts,
        "input_orbit": source["orbit"],
        "input_core_size": len(indices),
        "core_size": len(indices),
        "core": [
            {"index": index, "assertion": assertions[index].sexpr()}
            for index in indices
        ],
        "not_a_formal_proof": True,
        "validation_required": (
            "Regenerate the unguarded target-orbit CNF, solve it, and verify "
            "any UNSAT proof. Source-index transport alone preserves no verdict."
        ),
    }
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "input_orbit": payload["input_orbit"],
        "orbit": payload["orbit"],
        "core_size": payload["core_size"],
        "output": str(args.output),
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
