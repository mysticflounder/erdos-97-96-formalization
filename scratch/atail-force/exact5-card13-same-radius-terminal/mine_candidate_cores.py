#!/usr/bin/env python3
"""Mine named LRA cores without the integrated ordinal prefilter.

This produces concrete candidate cores for theorem discovery.  It does not
claim coverage; the separate integrated gate supplies the finite-surface
UNSAT verdict.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

import run_asymmetric_same as runner


class NoPrefilterOuter(runner.gate.FocusOuter):
    def __init__(self, orbit: str, radius_arm: str,
                 timeout_ms: int, seed: int) -> None:
        if orbit not in {"asymmetricSourceLeft", "asymmetricSourceRight"}:
            raise ValueError(orbit)
        if radius_arm != "same":
            raise ValueError(radius_arm)
        self.radius_arm = radius_arm
        runner.gate.BaseOuter.__init__(self, orbit, timeout_ms, seed)
        finite_assertions = self.solver.assertions()
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.solver.add(*finite_assertions)
        self.parent_first = [
            z3.Bool(f"parent_first_{point}")
            for point in runner.gate.VERTICES
        ]
        self.parent_second = [
            z3.Bool(f"parent_second_{point}")
            for point in runner.gate.VERTICES
        ]
        self._add_focused_contract()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit",
        choices=("asymmetricSourceLeft", "asymmetricSourceRight"),
        default="asymmetricSourceLeft",
    )
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--max-candidates", type=int, default=100)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    runner.gate.FocusOuter = NoPrefilterOuter
    result = {
        "schema": "p97-exact5-card13-asymmetric-same-core-mining-v1",
        "orbit": args.orbit,
        "radius_arm": "same",
        **runner.gate.solve(
            args.orbit,
            "same",
            args.seconds,
            args.seed,
            args.max_candidates,
        ),
    }
    output = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(output + "\n")
    print(output)


if __name__ == "__main__":
    main()
