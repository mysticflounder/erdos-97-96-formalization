#!/usr/bin/env python3
"""Generate source-core assertions as individual Lean hypotheses.

This avoids the expensive proof-producing expansion of one giant conjunction.
The saved Z3 assertion core is first checked against a fresh reconstruction,
then each source assertion becomes one Boolean hypothesis for ``bv_decide``.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
SOURCE_LANE = HERE.parent / "exact5-card13-same-radius-terminal"
ARGS = (
    "(rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) "
    "(q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)"
)


def load_source_generator():
    sys.path.insert(0, str(SOURCE_LANE))
    path = SOURCE_LANE / "generate_source_core_bv.py"
    spec = importlib.util.spec_from_file_location("exact5_source_generator", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--trace", action="store_true")
    args = parser.parse_args()

    source = load_source_generator()
    payload = json.loads(args.core.read_text(encoding="utf-8"))
    outer, _ranks, _counts = source.ordinal.build(payload["orbit"], 0)
    assertions = list(outer.solver.assertions())
    terms: list[str] = []
    for saved in payload["core"]:
        assertion = assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at index {saved['index']}")
        terms.append(source.emit_bool(assertion))

    hypotheses = "\n".join(
        f"    (h{index:04d} : ({term}) = true)"
        for index, term in enumerate(terms)
    )
    trace_options = ""
    if args.trace:
        trace_options = (
            "set_option trace.Meta.Tactic.bv true in\n"
            "set_option trace.Meta.Tactic.sat true in\n"
        )
    text = f"""/- Generated from a checked Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVFlat

open Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0

{trace_options}theorem directSourceAssertions_false {ARGS}
{hypotheses} : False := by
  bv_decide (config := {{ maxSteps := 100000000, timeout := 600 }})

#print axioms directSourceAssertions_false

end Problem97.ATailExactFiveCard13BVFlat
"""
    args.output.write_text(text, encoding="utf-8")
    print(
        json.dumps(
            {
                "core": str(args.core),
                "assertions": len(terms),
                "output": str(args.output),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
