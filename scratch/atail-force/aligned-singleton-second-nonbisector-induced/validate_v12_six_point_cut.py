#!/usr/bin/env python3
"""Validate the v13 six-point cut against the saved v12 survivor."""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE / "cegar.py"
SURVIVOR_PATH = HERE / "cegar-v12-local-critical-reuse-second.json"


def load_cegar():
    spec = importlib.util.spec_from_file_location("cegar_validation_target", CEGAR_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def make_outer(cegar):
    return cegar.OuterMap(
        timeout_ms=60_000,
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="local",
    )


def main() -> None:
    cegar = load_cegar()
    saved = json.loads(SURVIVOR_PATH.read_text())
    outer = make_outer(cegar)

    for rank_value, names in enumerate(
        saved["survivor"]["alias_classes_in_order"]
    ):
        for name in names:
            outer.solver.add(
                outer.rank[outer.ix(name)]
                == z3.BitVecVal(rank_value, outer.rank_width)
            )
    for raw_literal in saved["survivor"]["required_row_assignment"]:
        outer.solver.add(
            outer.literal_expr(cegar.Literal.from_json(raw_literal))
        )

    pre_cut = outer.solver.check()
    if pre_cut != z3.sat:
        raise RuntimeError(f"saved v12 survivor did not replay SAT: {pre_cut}")
    model = outer.solver.model()
    detected = outer.direct_six_point_euclidean_cores(model)

    forced = []
    for core in detected:
        core_is_forced = True
        for literal in core:
            outer.solver.push()
            outer.solver.add(z3.Not(outer.literal_expr(literal)))
            core_is_forced &= outer.solver.check() == z3.unsat
            outer.solver.pop()
        if core_is_forced:
            forced.append(core)
    if not forced:
        raise RuntimeError("detector found no six-point core forced by the saved survivor")

    core = forced[0]
    round_tripped_reversed = [
        cegar.Literal.from_json(literal.to_json())
        for literal in reversed(core)
    ]
    recognized = cegar.six_point_euclidean_core_points(round_tripped_reversed)
    if recognized is None:
        raise RuntimeError("checkpoint recognizer rejected the detector-generated core")

    checkpoint_counts = cegar.revalidate_checkpoint_cuts(
        make_outer(cegar),
        [round_tripped_reversed],
        timeout_ms=60_000,
        deadline=time.monotonic() + 60,
    )
    if checkpoint_counts != (0, 0, 1, 0):
        raise RuntimeError(
            f"unexpected checkpoint revalidation counts: {checkpoint_counts}"
        )

    outer.add_cut(core)
    post_cut = outer.solver.check()
    if post_cut != z3.unsat:
        raise RuntimeError(f"six-point cut did not reject survivor: {post_cut}")

    print(
        json.dumps(
            {
                "saved_status": saved["status"],
                "frozen_survivor_pre_cut": str(pre_cut),
                "detected_six_point_cores": len(detected),
                "forced_six_point_cores": len(forced),
                "recognized_points": recognized,
                "checkpoint_revalidation_counts": checkpoint_counts,
                "cut": [literal.to_json() for literal in core],
                "frozen_survivor_post_cut": str(post_cut),
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
