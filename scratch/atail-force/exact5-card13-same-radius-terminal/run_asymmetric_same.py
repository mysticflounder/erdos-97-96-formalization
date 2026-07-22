#!/usr/bin/env python3
"""Run the full retained-row card-13 gate on an asymmetric same-radius arm.

The shared focused gate currently exposes only the all-one orbit names at its
CLI boundary.  Its actual contract is orbit-generic, so this thin scratch
driver reuses that exact encoder with the source-faithful asymmetric orbit.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
GATE = ROOT / "scratch/atail-force/exact5-full-role-retained-gate/decision.py"

spec = importlib.util.spec_from_file_location("exact5_full_role_gate", GATE)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {GATE}")
gate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gate)


class AsymmetricFocusOuter(gate.FocusOuter):
    """The existing focused encoder with its CLI-only orbit guard removed."""

    def __init__(self, orbit: str, radius_arm: str,
                 timeout_ms: int, seed: int) -> None:
        if orbit not in {"asymmetricSourceLeft", "asymmetricSourceRight"}:
            raise ValueError(orbit)
        if radius_arm != "same":
            raise ValueError(radius_arm)
        self.radius_arm = radius_arm
        gate.BaseOuter.__init__(self, orbit, timeout_ms, seed)
        finite_assertions = self.solver.assertions()
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.solver.add(*finite_assertions)
        self.parent_first = [
            z3.Bool(f"parent_first_{point}") for point in gate.VERTICES
        ]
        self.parent_second = [
            z3.Bool(f"parent_second_{point}") for point in gate.VERTICES
        ]
        self._add_focused_contract()
        self._add_ordinal_prefilter()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit",
        choices=("asymmetricSourceLeft", "asymmetricSourceRight"),
        default="asymmetricSourceLeft",
    )
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--max-candidates", type=int, default=1000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    gate.FocusOuter = AsymmetricFocusOuter
    result = {
        "schema": "p97-exact5-card13-asymmetric-same-radius-v1",
        "profile": "5,6,5",
        "orbit": args.orbit,
        "radius_arm": "same",
        **gate.solve(
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
