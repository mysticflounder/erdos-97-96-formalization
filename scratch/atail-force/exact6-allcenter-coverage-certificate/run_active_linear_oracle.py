#!/usr/bin/env python3
"""Feed one exported finite model to the active gate's linear metric oracle."""

from __future__ import annotations

import argparse
import importlib.util
import json
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
ACTIVE_GATE = HERE.parent / "exact6-allcenter-capaware-gate" / "allcenter_gate.py"


def load_active_gate():
    spec = importlib.util.spec_from_file_location("p97_exact6_active_allcenter_gate", ACTIVE_GATE)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load active all-center gate")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--random-seed", type=int, default=0)
    args = parser.parse_args()
    exported = json.loads(args.input.read_text(encoding="utf-8"))
    if exported.get("schema") != "p97-exact6-allcenter-active-decoded-export-v1":
        raise ValueError("active decoded export schema drift")
    encoded = exported["decoded"]
    decoded = {
        "rows": {int(center): tuple(support) for center, support in encoded["rows"].items()},
        "blockers": tuple(encoded["blockers"]),
        "shell": tuple(encoded["shell"]),
        "roles": dict(encoded["roles"]),
    }
    active = load_active_gate()

    # First prove that the exported assignment is accepted by the current
    # source outer, with every source variable pinned to the exported value.
    outer = active.Outer(exported["orbit"], args.timeout_ms, args.random_seed, "smt")
    solver = outer.solver
    for center, support in decoded["rows"].items():
        support_set = set(support)
        for point in range(active.N):
            solver.add(outer.member[center, point] == (point in support_set))
    for source, center in enumerate(decoded["blockers"]):
        solver.add(outer.blocker[source] == center)
    shell_set = set(decoded["shell"])
    for point in range(active.N):
        solver.add(outer.shell[point] == (point in shell_set))
    solver.add(outer.first == decoded["roles"]["first"])
    solver.add(outer.second == decoded["roles"]["second"])
    solver.add(outer.source == decoded["roles"]["source"])
    solver.add(outer.target == decoded["roles"]["target"])
    solver.add(outer.unused == decoded["roles"]["unused"])
    outer_status = str(solver.check())
    if outer_status != "sat":
        raise ValueError(f"export is rejected by active source outer: {outer_status}")

    deadline = time.monotonic() + args.wall_seconds
    linear = active.linear_metric_check(
        decoded, args.timeout_ms, deadline, args.random_seed
    )
    serializable = {
        key: value for key, value in linear.items()
        if key not in {"table", "base_formulas"}
    }
    payload = {
        "schema": "p97-exact6-allcenter-active-linear-oracle-result-v1",
        "epistemic_status": "ACTIVE_SOURCE_ORACLE_VERDICT_NOT_LIVE_LEAN_CLOSURE",
        "orbit": exported["orbit"],
        "source_cnf_sha256": exported["source_cnf_sha256"],
        "active_outer_pinned_status": "SAT",
        "linear_metric_check": serializable,
        "live_closure": False,
        "scope_warning": (
            "UNSAT here is one finite row-table metric core, not coverage; SAT here still omits "
            "exact deleted-source radius semantics, Euclidean realization, MEC, and minimality."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "ACTIVE_LINEAR_ORACLE_COMPLETE",
        "orbit": exported["orbit"],
        "outer": "SAT",
        "linear": serializable["status"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
