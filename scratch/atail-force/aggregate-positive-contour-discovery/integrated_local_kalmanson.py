#!/usr/bin/env python3
"""Exact all-center decision using only the local Kalmanson cell basis.

The global K1/K2 system is the nonnegative rectangle closure of
``n * (n - 3) / 2`` local interior/seam cells.  This script reuses the prior
all-row and strong-connectivity encoding but asserts only those equivalent
local strict inequalities.  Any SAT model is still replayed against every
global K1/K2 inequality by the imported independent checker.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOURCE = (
    HERE.parent
    / "variable-card-positive-dual-proof-audit"
    / "integrated_bare_kalmanson.py"
)
SPEC = importlib.util.spec_from_file_location("integrated_bare_kalmanson", SOURCE)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot load {SOURCE}")
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)


class LocalKalmansonDecision(BASE.BareKalmansonDecision):
    def add_metric(self) -> None:
        for variable in self.distances.values():
            self.solver.add(variable >= 1)
        for left in range(self.n):
            for right in range(left + 2, self.n):
                if left == 0 and right == self.n - 1:
                    continue
                if right < self.n - 1:
                    local_cell = (
                        self.dist(left, right)
                        + self.dist(left + 1, right + 1)
                        - self.dist(left, right + 1)
                        - self.dist(left + 1, right)
                    )
                else:
                    local_cell = (
                        self.dist(left, right)
                        + self.dist(0, left + 1)
                        - self.dist(0, left)
                        - self.dist(left + 1, right)
                    )
                self.solver.add(local_cell >= 1)
        if self.triangle:
            for a, b, c in itertools.combinations(range(self.n), 3):
                self.solver.add(
                    self.dist(a, b) + self.dist(b, c) >= self.dist(a, c),
                    self.dist(a, b) + self.dist(a, c) >= self.dist(b, c),
                    self.dist(a, c) + self.dist(b, c) >= self.dist(a, b),
                )

    def add_strong_connectivity_reachability(self) -> None:
        previous = {
            (source, target): (
                BASE.z3.BoolVal(True)
                if source == target
                else self.member[source, target]
            )
            for source in range(self.n)
            for target in range(self.n)
        }
        for via in range(self.n):
            current = {}
            for source in range(self.n):
                for target in range(self.n):
                    reachable = BASE.z3.Bool(f"reach_{via}_{source}_{target}")
                    self.solver.add(
                        reachable
                        == BASE.z3.Or(
                            previous[source, target],
                            BASE.z3.And(
                                previous[source, via], previous[via, target]
                            ),
                        )
                    )
                    current[source, target] = reachable
            previous = current
        self.solver.add(
            *(
                previous[source, target]
                for source in range(self.n)
                for target in range(self.n)
            )
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--triangle", action="store_true")
    parser.add_argument("--no-connectivity", action="store_true")
    parser.add_argument(
        "--connectivity-encoding",
        choices=("reachability", "cuts"),
        default="reachability",
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--run-log", type=Path)
    args = parser.parse_args()
    if args.n < 5:
        raise ValueError("four-member non-self rows require n >= 5")

    started = time.monotonic()
    if args.run_log is not None:
        args.run_log.parent.mkdir(parents=True, exist_ok=True)
        args.run_log.write_text(
            json.dumps(
                {
                    "event": "started",
                    "n": args.n,
                    "random_seed": args.seed,
                    "timeout_ms": args.timeout_ms,
                    "strong_connectivity": not args.no_connectivity,
                    "connectivity_encoding": args.connectivity_encoding,
                },
                sort_keys=True,
            )
            + "\n",
            encoding="utf-8",
        )
    decision = LocalKalmansonDecision(args.n, args.timeout_ms, args.triangle)
    decision.solver.set(random_seed=args.seed)
    decision.add_metric()
    decision.add_all_rows()
    if not args.no_connectivity:
        if args.connectivity_encoding == "reachability":
            decision.add_strong_connectivity_reachability()
        else:
            decision.add_strong_connectivity()
    status = decision.solver.check()
    payload: dict[str, object] = {
        "schema": "p97-bare-all-center-local-kalmanson-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_IF_UNSAT_OR_UNKNOWN",
        "n": args.n,
        "triangle": args.triangle,
        "strong_connectivity": not args.no_connectivity,
        "connectivity_encoding": args.connectivity_encoding,
        "random_seed": args.seed,
        "local_kalmanson_cell_count": args.n * (args.n - 3) // 2,
        "status": str(status).upper(),
        "elapsed_seconds": time.monotonic() - started,
        "solver_statistics": str(decision.solver.statistics()),
    }
    if status == BASE.z3.sat:
        payload["verified_model"] = decision.replay(decision.solver.model())
    elif status == BASE.z3.unknown:
        payload["reason"] = decision.solver.reason_unknown()
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    if args.run_log is not None:
        with args.run_log.open("a", encoding="utf-8") as stream:
            stream.write(
                json.dumps(
                    {
                        "event": "terminal",
                        "status": payload["status"],
                        "elapsed_seconds": payload["elapsed_seconds"],
                        "reason": payload.get("reason"),
                    },
                    sort_keys=True,
                )
                + "\n"
            )
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
