#!/usr/bin/env python3
"""MANDATORY smoke gate: run the independent engine on the 100 sampled cubes
(sample100_s777_cubes.jsonl = byte copy of p97-rvol _sample100_s777.jsonl) and
compare against the recorded verdicts u12_metric_sample100_verdicts.jsonl
(in scratch/u12-census-port/).

Comparison per idx:
  verdict   must match exactly (C_EMPTY / NO_VALID_REAL);
            recorded TIMEOUT rows are re-decided here and REPORTED, not failed
            (a timeout is an engine resource artifact, not a semantic verdict).
  base_dim  must match on non-timeout rows.
  forced_pairs (when recorded): set equality.
Exit nonzero on ANY semantic mismatch.
"""

import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

import census554_lib as L
import engine

HERE = "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/census-554"
PORT = "/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/u12-census-port"


def main():
    cubes = L.load_cubes_jsonl(f"{HERE}/sample100_s777_cubes.jsonl")
    ref = {r["idx"]: r for r in
           (json.loads(ln) for ln in open(f"{PORT}/u12_metric_sample100_verdicts.jsonl"))}
    assert len(cubes) == 100 and len(ref) == 100

    # INFORMATIONAL: the sample100 cubes are C1/C2/C4-only shadows (the
    # shadow-space measurement family), NOT the one-hit-constrained census
    # family; the gate validates the ENCODING+verdict semantics, which is
    # family-independent.  Report how many satisfy the census constraints.
    nok = sum(1 for c in cubes if L.cube_ok(c))
    print(f"[gate] info: {nok}/100 sampled cubes also satisfy the full census "
          f"constraint set (one-hit included); constraint set NOT gated here",
          flush=True)

    results = {}
    with ThreadPoolExecutor(max_workers=8) as ex:
        futs = {ex.submit(engine.verdict_one, cubes[i], 900): i for i in range(100)}
        for fut in as_completed(futs):
            i = futs[fut]
            results[i] = fut.result()
            print(f"  idx {i:3d}: mine={results[i]['verdict']:24s} "
                  f"ref={ref[i]['verdict']}", flush=True)

    mism, resolved_timeouts = [], []
    for i in range(100):
        mine, r = results[i], ref[i]
        if r["verdict"] == "TIMEOUT":
            resolved_timeouts.append((i, mine["verdict"], mine.get("base_dim"),
                                      mine.get("sat_dim")))
            continue
        if mine["verdict"] != r["verdict"]:
            mism.append((i, "verdict", mine["verdict"], r["verdict"]))
            continue
        if mine.get("base_dim") != r.get("base_dim"):
            mism.append((i, "base_dim", mine.get("base_dim"), r.get("base_dim")))
        if "forced_pairs" in r:
            if set(mine.get("forced_pairs", [])) != set(r["forced_pairs"]):
                mism.append((i, "forced_pairs", mine.get("forced_pairs"),
                             r["forced_pairs"]))
        if mine.get("n_eqs") != r.get("n_eqs"):
            mism.append((i, "n_eqs", mine.get("n_eqs"), r.get("n_eqs")))

    with open(f"{HERE}/smoke_gate_results.jsonl", "w") as f:
        for i in range(100):
            row = dict(results[i])
            row["idx"] = i
            row["ref_verdict"] = ref[i]["verdict"]
            f.write(json.dumps(row) + "\n")

    ncmp = 100 - len(resolved_timeouts)
    print(f"\n[gate] semantic comparisons: {ncmp} rows "
          f"(ref TIMEOUT rows re-decided: {len(resolved_timeouts)})")
    for i, v, bd, sd in resolved_timeouts:
        print(f"[gate] ref-TIMEOUT idx {i}: engine verdict {v} "
              f"(base_dim={bd}, sat_dim={sd})")
    if mism:
        print(f"[gate] MISMATCHES ({len(mism)}):")
        for m in mism:
            print("   ", m)
        print("[gate] FAIL — STOP")
        return 1
    print(f"[gate] PASS {ncmp}/{ncmp} exact verdict+base_dim+forced_pairs matches")
    return 0


if __name__ == "__main__":
    sys.exit(main())
