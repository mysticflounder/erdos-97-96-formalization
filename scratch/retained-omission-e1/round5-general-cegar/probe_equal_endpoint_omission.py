#!/usr/bin/env python3
"""Scratch-only test of the equal-center endpoint-omission invariant."""
import json
import argparse
import time
from pathlib import Path

import z3

from n17_freshthird_incidence_probe import FreshThirdN17, ENDPOINTS, NAMES


ROOT = Path(__file__).resolve().parent
OUT = ROOT / "artifacts-n17-generic" / "equal-center-endpoint-omission"


def run(timeout_ms: int = 30_000, cyclic_metric: bool = False) -> dict[str, object]:
    probe = FreshThirdN17(timeout_ms, cyclic_metric=cyclic_metric)
    probe.solver.add(probe.residual["equalCrossRowCenters"])
    # Source-faithful consequence of
    # allCollisionEndpointsOmitted_of_equalCenterHits: every retained
    # collision endpoint is absent from each cap-source row.
    for slot in (0, 1):
        for endpoint in ENDPOINTS:
            probe.solver.add(z3.Not(probe.c_source_row[slot, endpoint]))
        # Exact support packet from FreshThirdEqualCenterExactFourRow:
        # each C row is precisely the four selected source vertices.
        for p in range(17):
            named = z3.Or(
                probe.c_source_is[0, p], probe.c_source_is[1, p],
                probe.q1_is[p], probe.q2_is[p],
            )
            probe.solver.add(probe.c_source_row[slot, p] == named)
    started = time.monotonic()
    status = probe.solver.check()
    status_name = "SAT" if status == z3.sat else "UNSAT" if status == z3.unsat else "UNKNOWN"
    result: dict[str, object] = {
        "schema": "p97-freshthird-n17-equal-center-all-endpoint-omission-v1",
        "status": status_name,
        "timeout_ms": timeout_ms,
        "elapsed_ms": int((time.monotonic() - started) * 1000),
        "arm": "equalCrossRowCenters",
        "cut": "C1/C2 rows omit p1,p2,r1,r2",
        "cyclic_metric": cyclic_metric,
        "trust_boundary": {
            "external_solver_only": True,
            "bounded_n17_fixed_cap_profile": True,
            "lean_kernel_proof": False,
            "full_euclidean_coordinates": False,
            "universal_n_claim": False,
        },
    }
    if status == z3.sat:
        model = probe.solver.model()
        result["C_sources"] = [
            NAMES[next(s for s in range(17) if z3.is_true(model.eval(probe.c_source_is[slot, s], model_completion=True)))]
            for slot in (0, 1)
        ]
        result["Q_sources"] = [
            NAMES[next(s for s in range(17) if z3.is_true(model.eval(sel[s], model_completion=True)))]
            for sel in (probe.q1_is, probe.q2_is)
        ]
        result["C_rows"] = [
            [NAMES[p] for p in range(17) if z3.is_true(model.eval(probe.c_source_row[slot, p], model_completion=True))]
            for slot in (0, 1)
        ]
    OUT.mkdir(parents=True, exist_ok=True)
    path = OUT / ("result-cyclic.json" if cyclic_metric else "result.json")
    path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    result["artifact"] = str(path)
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--timeout-ms", type=int, default=30_000)
    ap.add_argument("--cyclic-metric", action="store_true")
    args = ap.parse_args()
    print(json.dumps(run(args.timeout_ms, args.cyclic_metric), sort_keys=True))
