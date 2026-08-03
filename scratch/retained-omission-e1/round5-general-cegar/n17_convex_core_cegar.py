#!/usr/bin/env python3
"""Lazy bounded replay of the banked ConvexFivePointCore consumer.

This is an external CEGAR diagnostic.  It imports the repaired n=17 probe,
detects realized four-edge equality cores in each SAT model, and adds the
orientation-complete cyclic-order exclusion corresponding to
``Census554.ConvexFivePointCore.false_of_core_of_common_orientation``.
It does not claim Euclidean realizability, Lean ingress, or universal-n
closure; every result remains external solver evidence.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import time
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parent
BASE_PATH = ROOT / "n17_freshthird_incidence_probe.py"
OUT = ROOT / "artifacts-n17-convex-core-cegar"


def load_base():
    spec = importlib.util.spec_from_file_location("freshthird_probe", BASE_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {BASE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def ccw_between(position, a: int, b: int, x: int):
    """x lies on the increasing cyclic arc from a to b."""
    return z3.Or(
        z3.And(position[a] < position[x], position[x] < position[b]),
        z3.And(position[b] < position[a], position[a] < position[x]),
        z3.And(position[x] < position[b], position[b] < position[a]),
    )


def eval_bool(model, term) -> bool:
    return z3.is_true(model.eval(term, model_completion=True))


def violating_cuts(probe, model, module, limit: int):
    """Return observed core cuts, capped to keep one CEGAR step bounded.

    The model is converted to plain Python truth tables before enumeration;
    constructing millions of temporary Z3 expressions while scanning candidate
    five-tuples can otherwise exhaust the process before the first cut is
    learned.
    """
    position = probe.position
    positions = {
        v: model.eval(position[v], model_completion=True).as_long()
        for v in module.ALL
    }
    eq_true = {
        (c, x, y): eval_bool(model, probe.eq[c, x, y])
        for c in module.ALL
        for x, y in itertools.combinations((p for p in module.ALL if p != c), 2)
    }

    def edge_value(c: int, x: int, y: int) -> bool:
        if x == y:
            return True
        if c in (x, y):
            return False
        return eq_true[c, min(x, y), max(x, y)]

    def ccw_value(a: int, b: int, x: int) -> bool:
        pa, pb, px = positions[a], positions[b], positions[x]
        return (pa < px < pb) or (pb < pa < px) or (px < pb < pa)

    cuts = []
    observed = 0
    for a, x, b, c, y in itertools.permutations(module.ALL, 5):
        if not edge_value(x, a, b):
            continue
        if not edge_value(y, a, b):
            continue
        if not edge_value(c, b, x):
            continue
        if not edge_value(c, b, y):
            continue
        first_value = ccw_value(a, b, x)
        second_value = ccw_value(b, y, c)
        if first_value != second_value:
            continue
        observed += 1
        if len(cuts) < limit:
            first = ccw_between(position, a, b, x)
            second = ccw_between(position, b, y, c)
            cuts.append(z3.Or(
                z3.Not(probe.E(x, a, b)),
                z3.Not(probe.E(y, a, b)),
                z3.Not(probe.E(c, b, x)),
                z3.Not(probe.E(c, b, y)),
                z3.Not(first == second),
            ))
        if len(cuts) >= limit:
            break
    return cuts, observed


def run(timeout_ms: int, max_rounds: int, cut_limit: int) -> dict[str, object]:
    module = load_base()
    probe = module.FreshThirdN17(timeout_ms=timeout_ms, cyclic_metric=True)
    started = time.monotonic()
    rounds = []
    total_cuts = 0
    final_status = "UNKNOWN"
    remaining = None
    for round_index in range(max_rounds):
        status = probe.solver.check()
        status_name = "SAT" if status == z3.sat else "UNSAT" if status == z3.unsat else "UNKNOWN"
        entry: dict[str, object] = {"round": round_index, "status": status_name}
        rounds.append(entry)
        if status != z3.sat:
            final_status = status_name
            break
        cuts, observed = violating_cuts(probe, probe.solver.model(), module, cut_limit)
        entry["observed_violations"] = observed
        entry["cuts_added"] = len(cuts)
        if not cuts:
            final_status = "SAT"
            remaining = 0
            break
        probe.solver.add(*cuts)
        total_cuts += len(cuts)
    else:
        final_status = "UNKNOWN_FAIL_CLOSED"

    result = {
        "schema": "p97-freshthird-n17-convex-five-point-core-cegar-v1",
        "status": final_status,
        "n": module.N,
        "cap_profile": list(module.PROFILE),
        "cyclic_metric": True,
        "rounds": rounds,
        "total_cuts": total_cuts,
        "remaining_observed_violations": remaining,
        "elapsed_ms": int((time.monotonic() - started) * 1000),
        "trust_boundary": {
            "external_solver_only": True,
            "lean_kernel_proof": False,
            "universal_n_claim": False,
            "qf_nra_coordinates": False,
        },
    }
    out = OUT / time.strftime("%Y%m%dT%H%M%SZ")
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    return {"artifact": str(out), **result}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-rounds", type=int, default=12)
    parser.add_argument("--cut-limit", type=int, default=2000)
    args = parser.parse_args()
    result = run(args.timeout_ms, args.max_rounds, args.cut_limit)
    print(json.dumps({
        "artifact": result["artifact"],
        "status": result["status"],
        "rounds": len(result["rounds"]),
        "total_cuts": result["total_cuts"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
