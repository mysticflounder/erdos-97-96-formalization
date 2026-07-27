#!/usr/bin/env python3
"""Generate a staged exact-five source-core coordinator.

The existing coordinator expands every chunk with one monolithic ``unfold``
before ``bv_decide`` starts.  This experimental coordinator instead unfolds
each chunk in its own hypothesis, keeping the local proof transformations
bounded before handing the resulting hypotheses to the bitblaster.

It does not modify or regenerate any source-core chunk.
"""

from __future__ import annotations

import argparse
from pathlib import Path


ARGS = (
    "(rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) "
    "(q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)"
)
CALL_ARGS = "rows blockers shell q w b1 ranks"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--chunks", type=int, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--trace", action="store_true")
    args = parser.parse_args()
    if args.chunks < 1:
        raise ValueError("--chunks must be positive")

    names = [f"direct{index:03d}" for index in range(args.chunks)]
    imports = "\n".join(
        f"import ExactFiveCard13BVSourceCoreChunks.Direct{index:03d}"
        for index in range(args.chunks)
    )
    hypotheses = "\n".join(
        f"    (h{index:03d} : {name} {CALL_ARGS} = true)"
        for index, name in enumerate(names)
    )
    unfolds = "\n".join(
        f"  simp only [{name}] at h{index:03d}"
        for index, name in enumerate(names)
    )
    trace_options = ""
    if args.trace:
        trace_options = (
            "set_option trace.Meta.Tactic.bv true in\n"
            "set_option trace.Meta.Tactic.sat true in\n"
        )
    text = f"""/- Staged source-core replay experiment; does not regenerate chunks. -/
{imports}
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVStaged

open Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0

{trace_options}theorem directChunks_false {ARGS}
{hypotheses} : False := by
{unfolds}
  bv_decide (config := {{ maxSteps := 100000000, timeout := 600 }})

#print axioms directChunks_false

end Problem97.ATailExactFiveCard13BVStaged
"""
    args.output.write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()
