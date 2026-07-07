#!/usr/bin/env python3
"""Verdict engine for (5,5,4) census cubes.  Independent implementation of the
audited comp_g_m verdict semantics (Singular char-0):

  stage 1: G = std(I) over QQ[x2x..x10y] (dp).  dim(G) == -1  ->  C_EMPTY.
  stage 2: else forced pairs: reduce(d2(a,b), G) == 0 for the 55 point pairs.
           any forced pair  ->  NO_VALID_REAL (sound shortcut: that pair is
           equal on ALL of V(I), so no all-distinct point exists; the
           all-pairs Rabinowitsch saturation would be empty).
  stage 3: else full saturation: I + { t_k * d2(pair_k) - 1 : all 55 pairs }
           over 18+55 vars.  dim == -1  ->  NO_VALID_REAL
           else              ->  UNDECIDED_OR_CANDIDATE  (ALIVE).

Every polynomial is exact rational (integer coefficients); no floats anywhere.
"""

import subprocess
import time

import census554_lib as L

NAMES = {0: "v", 1: "w", **{i: f"p{i}" for i in range(2, L.N)}}
SINGULAR = "Singular"
TIMEOUT_DIM = -999


def pair_name(a, b):
    return (NAMES[a], NAMES[b])


def run_singular(script, timeout):
    try:
        pr = subprocess.run([SINGULAR, "-q"], input=script, capture_output=True,
                            text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return None
    return pr.stdout


def stage1_script(polys):
    body = ",\n  ".join(L.poly_str(p) for p in polys)
    lines = [f"ring r = 0, ({','.join(L.VARS)}), dp;",
             f"ideal I = {body};",
             "ideal G = std(I);",
             'string("DIM:", dim(G));']
    for k, (a, b) in enumerate(L.ALL_PAIRS):
        lines.append(f"poly pr{k} = {L.poly_str(L.d2poly(a, b))};")
        lines.append(f'string("MEM{k}:", (reduce(pr{k}, G) == 0));')
    lines.append("exit;")
    return "\n".join(lines)


def stage3_script(polys):
    tvars = [f"t{k}" for k in range(len(L.ALL_PAIRS))]
    allvars = L.VARS + tvars
    body = [L.poly_str(p) for p in polys]
    for k, (a, b) in enumerate(L.ALL_PAIRS):
        body.append(f"t{k}*({L.poly_str(L.d2poly(a, b))})-1")
    lines = [f"ring r = 0, ({','.join(allvars)}), dp;",
             "ideal I = " + ",\n  ".join(body) + ";",
             "ideal G = std(I);",
             'string("SDIM:", dim(G));',
             "exit;"]
    return "\n".join(lines)


def verdict_one(cube, timeout=900):
    """Return a result dict mirroring the sample100 schema."""
    t0 = time.time()
    polys = L.cube_eq_polys(cube)
    r = {"n_eqs": len(polys)}
    out = run_singular(stage1_script(polys), timeout)
    if out is None:
        r["base_dim"] = TIMEOUT_DIM
        r["verdict"] = "TIMEOUT"
        r["wall_s"] = round(time.time() - t0, 2)
        return r
    dim, mems = None, {}
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith("DIM:"):
            dim = int(ln[4:])
        elif ln.startswith("MEM"):
            k, val = ln[3:].split(":")
            mems[int(k)] = (val == "1")
    assert dim is not None and len(mems) == len(L.ALL_PAIRS), out[-2000:]
    r["base_dim"] = dim
    if dim == -1:
        r["verdict"] = "C_EMPTY"
        r["wall_s"] = round(time.time() - t0, 2)
        return r
    forced = [f"{NAMES[a]}={NAMES[b]}" for (a, b), k in zip(L.ALL_PAIRS,
              range(len(L.ALL_PAIRS))) if mems[k]]
    if forced:
        r["forced_pairs"] = forced
        r["sat_dim"] = -1
        r["sat_shortcircuit"] = "forced_pair"
        r["verdict"] = "NO_VALID_REAL"
        r["wall_s"] = round(time.time() - t0, 2)
        return r
    left = timeout - (time.time() - t0)
    out3 = run_singular(stage3_script(polys), max(5.0, left))
    if out3 is None:
        r["sat_dim"] = TIMEOUT_DIM
        r["verdict"] = "TIMEOUT"
        r["wall_s"] = round(time.time() - t0, 2)
        return r
    sdim = None
    for ln in out3.splitlines():
        ln = ln.strip()
        if ln.startswith("SDIM:"):
            sdim = int(ln[5:])
    assert sdim is not None, out3[-2000:]
    r["sat_dim"] = sdim
    r["verdict"] = "NO_VALID_REAL" if sdim == -1 else "UNDECIDED_OR_CANDIDATE"
    r["wall_s"] = round(time.time() - t0, 2)
    return r


def smoke_controls():
    """Known-result gates for the engine itself (encoding validation)."""
    # 1) three circles equidistance forcing a unique center: C-empty control
    #    x^2-1 & x^2-2 style: use ring with our vars but tiny custom ideals.
    s = ("ring r = 0, (x,y), dp;\n"
         "ideal I = x2-1, x2-2;\nideal G = std(I);\n"
         'string("DIM:", dim(G));\nexit;\n')
    out = run_singular(s, 30)
    assert out and "DIM:-1" in out, f"control-1 failed: {out}"
    s = ("ring r = 0, (x,y), dp;\n"
         "ideal I = x2-1;\nideal G = std(I);\n"
         'string("DIM:", dim(G));\nexit;\n')
    out = run_singular(s, 30)
    assert out and "DIM:1" in out, f"control-2 failed: {out}"
    # 2) the codex |A|=11 shadow must be C_EMPTY through the FULL cube path
    codex = {0: [1, 2, 7, 8], 1: [4, 5, 7, 10], 2: [0, 3, 7, 9],
             3: [2, 5, 6, 9], 4: [1, 6, 8, 10], 5: [3, 4, 6, 7],
             6: [0, 2, 5, 8], 7: [3, 5, 9, 10], 8: [2, 4, 6, 10],
             9: [0, 1, 3, 6], 10: [0, 4, 8, 9]}
    r = verdict_one(codex, timeout=300)
    assert r["verdict"] == "C_EMPTY", f"codex control failed: {r}"
    print("[engine] smoke controls PASS (dim gates + codex C_EMPTY,"
          f" codex n_eqs={r['n_eqs']} wall={r['wall_s']}s)")


if __name__ == "__main__":
    smoke_controls()
