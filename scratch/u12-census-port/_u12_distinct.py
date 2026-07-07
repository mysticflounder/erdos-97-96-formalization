#!/usr/bin/env python3
"""Distinctness (NO_VALID_REAL) adjudicator for 12-point cubes.

Wraps the AUDITED comp_g_m engine (COMP-U3S-M6, per-pair Rabinowitsch saturation
sat_all_pairs_dim -- tractable; the single-product saturation OOMs for N=12).
Gauge points 0,1 -> (0,0),(1,0), identical to _u12_census / gen_singular_shadow.

Verdicts per cube:
  C_EMPTY            base equidistance ideal dim -1 -> DEAD over ℂ
  NO_VALID_REAL      base dim>=0 but a pair is forced equal, or per-pair
                     saturation dim -1 -> no realization with all points distinct
  DISTINCT_ALIVE     saturation dim>=0 -> a realization with all points distinct
  TIMEOUT

Smoke: codex |A|=11 shadow must be C_EMPTY (cross-engine gate).
"""
import importlib.util
import itertools
import os
import threading

HERE = os.path.dirname(os.path.abspath(__file__))
_TAG_LOCK = threading.Lock()
_TAG_CTR = itertools.count()


def _uniq_tag(base):
    with _TAG_LOCK:
        return f"{base}_{os.getpid()}_{next(_TAG_CTR)}"  # PID-scoped: no cross-process file collision
REPO = "/Users/adam/projects/math-projects/p97-rvol"
CGM = f"{REPO}/scratch/u2b_ssel_fragment/comp_g_m6_metric/comp_g_m.py"

_spec = importlib.util.spec_from_file_location("comp_g_m", CGM)
comp_g_m = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(comp_g_m)

_gspec = importlib.util.spec_from_file_location("gss", f"{HERE}/gen_singular_shadow.py")
gss = importlib.util.module_from_spec(_gspec)
_gspec.loader.exec_module(gss)


def names(n):
    return {0: "v", 1: "w", **{i: f"p{i}" for i in range(2, n)}}


def to_named(cube, nm):
    return {nm[int(c)]: [nm[int(x)] for x in members] for c, members in cube.items()}


def adjudicate(cube, timeout=900):
    n = len(cube)
    nm = names(n)
    pts = [nm[i] for i in range(n)]
    C = comp_g_m.coords(pts)
    vars_ = comp_g_m.varnames(pts)
    pairs = comp_g_m.all_pairs(pts)
    pair_polys = [comp_g_m.d2(C, a, b) for a, b in pairs]
    model = to_named(cube, nm)
    eqs = comp_g_m.model_eqs(C, model)
    dim, mems = comp_g_m.sing_dim_and_membership(vars_, eqs, pair_polys, _uniq_tag("u12dist"), timeout)
    if dim == comp_g_m.TIMEOUT_DIM:
        return {"verdict": "TIMEOUT", "base_dim": None}
    if dim == -1:
        return {"verdict": "C_EMPTY", "base_dim": -1}
    forced = [f"{a}={b}" for (a, b), m in zip(pairs, mems) if m]
    if forced:
        return {"verdict": "NO_VALID_REAL", "base_dim": dim, "forced_pairs": forced,
                "sat_dim": -1, "sat_shortcircuit": "forced_pair"}
    sdim = comp_g_m.sat_all_pairs_dim(C, pts, vars_, eqs, _uniq_tag("u12dists"), timeout)
    if sdim == comp_g_m.TIMEOUT_DIM:
        return {"verdict": "TIMEOUT", "base_dim": dim, "sat_dim": None}
    if sdim == -1:
        return {"verdict": "NO_VALID_REAL", "base_dim": dim, "sat_dim": -1}
    return {"verdict": "DISTINCT_ALIVE", "base_dim": dim, "sat_dim": sdim}


def smoke():
    comp_g_m.s0_controls()
    codex = {c: sorted(ks) for c, ks in gss.CODEX_SHADOW.items()}
    r = adjudicate(codex)
    print(f"[smoke] codex |A|=11 distinctness verdict = {r['verdict']} "
          f"base_dim={r['base_dim']} (expect C_EMPTY)", flush=True)
    assert r["verdict"] == "C_EMPTY", f"codex not C_EMPTY: {r}"
    print("[smoke] OK", flush=True)


if __name__ == "__main__":
    smoke()
