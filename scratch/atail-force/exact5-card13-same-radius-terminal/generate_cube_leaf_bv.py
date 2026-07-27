#!/usr/bin/env python3
"""Emit one direct Lean BitVec theorem for a saved cube-source-core leaf."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import asymmetric_ordinal_rank as ordinal
from generate_source_core_bv import ARGS, atom, emit_bool


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--leaf", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--theorem", default="cubeLeaf_false")
    args = parser.parse_args()

    payload = json.loads(args.leaf.read_text(encoding="utf-8"))
    outer, _ranks, _counts = ordinal.build(payload["orbit"], payload["seed"])
    assertions = list(outer.solver.assertions())
    terms: list[str] = []
    for item in payload["cube"]:
        term = atom(item["atom"])
        terms.append(term if item["value"] else f"!({term})")
    for saved in payload["core"]:
        assertion = assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at {saved['index']}")
        terms.append(emit_bool(assertion))
    body = " &&\n    ".join(terms)
    args.output.write_text(f"""/-
Generated directly from one exact source-level cube core.  There are no
aggregate helper definitions to unfold before bit-vector preprocessing.
-/
import ExactFiveCard13BVCircuitChunks.Base
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVCubeLeaf

set_option maxRecDepth 100000
set_option linter.unusedVariables false

set_option trace.Meta.Tactic.bv true in
set_option trace.Meta.Tactic.sat true in
set_option maxHeartbeats 0 in
theorem {args.theorem} {ARGS} :
    ({body}) = false := by
  bv_decide? (config := {{ maxSteps := 100000000, timeout := 600 }})

end Problem97.ATailExactFiveCard13BVCubeLeaf
""", encoding="utf-8")
    print(json.dumps({
        "leaf": str(args.leaf),
        "output": str(args.output),
        "cube_width": len(payload["cube"]),
        "core_size": len(payload["core"]),
        "terms": len(terms),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
