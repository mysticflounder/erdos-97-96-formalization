#!/usr/bin/env python3
"""Bound each normalized FreshThird residual arm separately.

This is a scratch-only external Z3 probe; no Lean claim is emitted.
"""
import argparse
import json
import time
from pathlib import Path

import z3
from n17_freshthird_incidence_probe import FreshThirdN17


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--timeout-ms", type=int, default=30_000)
    ap.add_argument("--cyclic-metric", action="store_true")
    ap.add_argument("--arm", choices=("firstNonHit", "secondNonHit", "equalCrossRowCenters"))
    ap.add_argument("--out", type=Path, default=Path("artifacts-n17-generic/arms"))
    args = ap.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)
    rows = []
    arms = (args.arm,) if args.arm else ("firstNonHit", "secondNonHit", "equalCrossRowCenters")
    for arm in arms:
        probe = FreshThirdN17(args.timeout_ms, cyclic_metric=args.cyclic_metric)
        probe.solver.add(probe.residual[arm])
        started = time.monotonic()
        status = probe.solver.check()
        status_name = "SAT" if status.r == 1 else "UNSAT" if status.r == -1 else "UNKNOWN"
        row = {
            "arm": arm,
            "status": status_name,
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "cyclic_metric": args.cyclic_metric,
            "timeout_ms": args.timeout_ms,
            "trust_boundary": "external Z3 only; bounded n=17 lane; no Lean/universal claim",
        }
        if status.r == 1:
            model = probe.solver.model()
            row["C_sources"] = [
                next(s for s in range(17) if z3.is_true(model.eval(probe.c_source_is[slot, s], model_completion=True)))
                for slot in (0, 1)
            ]
            row["Q_sources"] = [
                next(s for s in range(17) if z3.is_true(model.eval(selector[s], model_completion=True)))
                for selector in (probe.q1_is, probe.q2_is)
            ]
            row["C_rows"] = [
                [p for p in range(17) if z3.is_true(model.eval(probe.c_source_row[slot, p], model_completion=True))]
                for slot in (0, 1)
            ]
            row["C_survives"] = [
                {pair: z3.is_true(model.eval(probe.c_survives[slot, pair], model_completion=True))
                 for pair in ("P", "R")}
                for slot in (0, 1)
            ]
            row["interaction"] = [
                next(tag for tag in probe.TAGS
                     if z3.is_true(model.eval(probe.interaction[source, tag], model_completion=True)))
                for source in (10, 11)
            ]
        rows.append(row)
    suffix = (args.arm or "all") + ("-cyclic" if args.cyclic_metric else "")
    output = args.out / f"{suffix}.json"
    output.write_text(json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"artifact": str(output), "rows": rows}, sort_keys=True))


if __name__ == "__main__":
    main()
