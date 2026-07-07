#!/usr/bin/env python3
"""U1.2 two-large-cap metric-realizability driver.

Reuses (imports, does not copy) the AUDITED Singular equidistance-ideal
pipeline from scratch/u2b_ssel_fragment/comp_g_m6_metric/comp_g_m.py -- the
same engine COMP-U3S-M6 used to certify all 6299 U3 shadow survivors C_EMPTY.

Purpose: correct two artifacts in the 2026-07-03 shadow_space_measurements:
  finding_2  ("15/24 C-infeasible, 9/24 C-FEASIBLE") was produced by a
             separate certify pass; re-run under the audited engine.
  finding_3  (distinctness NOT ESTABLISHED) used a single degree-110 product
             Rabinowitsch saturation (OOM).  comp_g_m.sat_all_pairs_dim uses
             one Rabinowitsch var PER PAIR (t_k*d2_k-1=0) -- the standard,
             tractable saturation.  So the C-feasible cubes get a proper
             NO_VALID_REAL check here.

Gauge = points 0,1 -> (0,0),(1,0), matching the banked codex cert's x0,x1
(shadow_certificate_20260703.summary.json).  So CODEX_SHADOW must reproduce
base_dim -1 / C_EMPTY -- that is the cross-engine smoke gate.

Usage:
  uv run python u12_metric.py smoke
  uv run python u12_metric.py sample [start] [end]
"""
import importlib.util
import json
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = "/Users/adam/projects/math-projects/p97-rvol"
CGM_PATH = f"{REPO}/scratch/u2b_ssel_fragment/comp_g_m6_metric/comp_g_m.py"

_spec = importlib.util.spec_from_file_location("comp_g_m", CGM_PATH)
comp_g_m = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(comp_g_m)

# 11-point name map: gauge on points 0,1 (= codex cert's x0,x1).
NAMES = {0: "v", 1: "w", 2: "p2", 3: "p3", 4: "p4", 5: "p5",
         6: "p6", 7: "p7", 8: "p8", 9: "p9", 10: "p10"}
PTS = [NAMES[i] for i in range(11)]

# codex's PROVEN-C_EMPTY center-K4 shadow (gen_singular_shadow.py CODEX_SHADOW)
CODEX_SHADOW = {
    0: [1, 2, 7, 8], 1: [4, 5, 7, 10], 2: [0, 3, 7, 9],
    3: [2, 5, 6, 9], 4: [1, 6, 8, 10], 5: [3, 4, 6, 7],
    6: [0, 2, 5, 8], 7: [3, 5, 9, 10], 8: [2, 4, 6, 10],
    9: [0, 1, 3, 6], 10: [0, 4, 8, 9],
}
SAMPLE_FILE = f"{HERE}/_sample24.jsonl"
OUT_FILE = f"{HERE}/u12_metric_sample_verdicts.jsonl"


def to_named(shadow):
    return {NAMES[int(c)]: [NAMES[int(x)] for x in members]
            for c, members in shadow.items()}


def run_one(C, vars_, pairs, pair_polys, shadow, tag):
    t0 = time.time()
    model = to_named(shadow)
    eqs = comp_g_m.model_eqs(C, model)
    r = {"n_eqs": len(eqs)}
    dim, mems = comp_g_m.sing_dim_and_membership(vars_, eqs, pair_polys, tag)
    r["base_dim"] = dim
    if dim == comp_g_m.TIMEOUT_DIM:
        r["verdict"] = "TIMEOUT"
    elif dim == -1:
        r["verdict"] = "C_EMPTY"
    else:
        forced = [f"{a}={b}" for (a, b), m in zip(pairs, mems) if m]
        r["forced_pairs"] = forced
        if forced:
            # SOUND short-circuit: some pair is forced equal on ALL of V(I)
            # (its d² is in the ideal), so no ℂ point has all points distinct
            # ⟹ sat_all_pairs_dim would be -1. 1 = t·d²(pair) − (t·d²(pair)−1)
            # ∈ the saturated ideal. Skip the heavy 73-var Gröbner.
            r["sat_dim"] = -1
            r["sat_shortcircuit"] = "forced_pair"
            r["verdict"] = "NO_VALID_REAL"
        else:
            sdim = comp_g_m.sat_all_pairs_dim(C, PTS, vars_, eqs, tag + "s")
            r["sat_dim"] = sdim
            r["verdict"] = ("NO_VALID_REAL" if sdim == -1
                            else "TIMEOUT" if sdim == comp_g_m.TIMEOUT_DIM
                            else "UNDECIDED_OR_CANDIDATE")
    r["wall_s"] = round(time.time() - t0, 2)
    return r


def _ctx():
    C = comp_g_m.coords(PTS)
    vars_ = comp_g_m.varnames(PTS)
    pairs = comp_g_m.all_pairs(PTS)
    pair_polys = [comp_g_m.d2(C, a, b) for a, b in pairs]
    return C, vars_, pairs, pair_polys


def smoke():
    print("[smoke] comp_g_m audited S0 controls ...")
    comp_g_m.s0_controls()
    C, vars_, pairs, pair_polys = _ctx()
    print("[smoke] cross-engine check: codex shadow must be C_EMPTY "
          "(banked cert: std(I)=<1>, dim=-1) ...")
    r = run_one(C, vars_, pairs, pair_polys, CODEX_SHADOW, "codex")
    print("   codex verdict:", r["verdict"], "base_dim", r["base_dim"],
          f"{r['wall_s']}s")
    assert r["verdict"] == "C_EMPTY", (
        f"codex shadow did NOT reproduce C_EMPTY: {r} -- engine/gauge mismatch")
    print("ALL SMOKE GATES PASS")


def sample(start=0, end=None, path=None, out=None):
    path = path or SAMPLE_FILE
    shadows = [json.loads(ln) for ln in open(path)]
    end = len(shadows) if end is None else end
    C, vars_, pairs, pair_polys = _ctx()
    counts = {}
    mode = "a" if start > 0 else "w"
    with open(out or OUT_FILE, mode) as fo:
        for i in range(start, end):
            r = run_one(C, vars_, pairs, pair_polys, shadows[i], f"s{i}")
            r["idx"] = i
            fo.write(json.dumps(r) + "\n")
            fo.flush()
            counts[r["verdict"]] = counts.get(r["verdict"], 0) + 1
            print(i, r["verdict"], "base_dim", r["base_dim"],
                  r.get("sat_dim", ""), f"{r['wall_s']}s", flush=True)
    print("verdict counts:", counts)
    return counts


if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "smoke"
    if cmd == "smoke":
        smoke()
    elif cmd == "sample":
        s = int(sys.argv[2]) if len(sys.argv) > 2 else 0
        e = int(sys.argv[3]) if len(sys.argv) > 3 else None
        p = sys.argv[4] if len(sys.argv) > 4 else None
        o = sys.argv[5] if len(sys.argv) > 5 else None
        sample(s, e, p, o)
    else:
        raise SystemExit(f"unknown subcommand {cmd}")
