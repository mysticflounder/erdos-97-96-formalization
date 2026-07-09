#!/usr/bin/env python3
"""Soundness audit of frontier pattern 0, which itersat called DEAD but
certify_pattern FAILED.  Determine independently whether it is dead or
alive, to decide if pattern_dead3 has a wrong-DEAD bug (which would also
threaten the 107-pattern intracap classification).

Pattern 0 = {0:[2,10], 2:[0,9,10], 4:[2,5,9], 5:[0,2,7], 7:[2,9,10]}

Oracles (independent):
  A. itersat (pattern_dead3)             — claims DEAD; recompute + report.
  B. msolve all-pairs Rabinowitsch       — the census's PRIMARY definition
     (miner.pattern_dead_fast). Empty => dead; a real solution => ALIVE.
  C. Singular Gröbner with t-vars, dim   — SDIM==-1 => empty => dead.
  D. certify_pattern with long timeout   — does it succeed given more time?

A wrong-DEAD from B or C (they say ALIVE / non-empty) means itersat is
unsound in the dead direction.  Agreement (all DEAD) means the pattern is
genuinely dead and only the CERTIFICATE is hard (a CERTFAIL, like the gate).
"""
import json
import sys
import time
from itertools import combinations

sys.path.insert(0, ".")
import census554_lib as L  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402

PAT = {0: frozenset({2, 10}), 2: frozenset({0, 9, 10}),
       4: frozenset({2, 5, 9}), 5: frozenset({0, 2, 7}),
       7: frozenset({2, 9, 10})}


def render_for_ring(polys, extra_pairs):
    vs = miner.used_vars(polys + [L.d2poly(a, b) for a, b in extra_pairs])
    names = [L.VARS[i] for i in vs]
    remap = {i: k for k, i in enumerate(vs)}

    def render(p):
        q = {tuple(sorted((remap[i], e) for i, e in m)): c for m, c in p.items()}
        return L.poly_str(q, varnames=names)
    return names, render


def main():
    pts = miner.pattern_points(PAT)
    print(f"support points: {pts} (gauge in support: {sorted(set(pts) & {0,1})})",
          flush=True)
    polys, tags = miner.pattern_polys(PAT)
    print(f"equidistance generators: {len(polys)}", flush=True)

    # --- A. itersat ---
    t0 = time.time()
    a = intracap.pattern_dead3(PAT, 120)
    print(f"[A] itersat pattern_dead3: {a}  ({time.time()-t0:.1f}s)", flush=True)

    # --- B. msolve all-pairs Rabinowitsch (census primary definition) ---
    t0 = time.time()
    rabs = miner.rabinowitsch_polys(PAT)
    b = miner.msolve_empty(polys + [r[0] for r in rabs], timeout=300)
    print(f"[B] msolve all-pairs empty (dead iff True): {b}  "
          f"({time.time()-t0:.1f}s)", flush=True)

    # --- C. Singular GB with t-vars, dimension of the Rabinowitsch ideal ---
    pairs = [e for e in combinations(pts, 2) if e != (0, 1)]
    names, render = render_for_ring(polys, pairs)
    tvars = [f"t{j}" for j in range(len(pairs))]
    lines = [f"ring r = 0, ({','.join(names + tvars)}), dp;"]
    body = [render(p) for p in polys]
    for j, (aa, bb) in enumerate(pairs):
        body.append(f"t{j}*({render(L.d2poly(aa, bb))})-1")
    lines.append("ideal I = " + ",\n  ".join(body) + ";")
    lines.append("ideal G = std(I);")
    lines.append('string("SDIM:", dim(G));')
    lines.append('string("RED1:", reduce(1, G));')
    lines.append("exit;")
    t0 = time.time()
    out = miner.sing_run("\n".join(lines), 300)
    sdim = red1 = None
    if out:
        for ln in out.splitlines():
            ln = ln.strip()
            if ln.startswith("SDIM:"):
                sdim = int(ln[5:])
            elif ln.startswith("RED1:"):
                red1 = ln[5:].strip()
    print(f"[C] Singular t-var ideal: SDIM={sdim} (empty/dead iff -1), "
          f"reduce(1)={red1} (dead iff 0)  ({time.time()-t0:.1f}s)", flush=True)

    # --- D. certify with long timeout ---
    t0 = time.time()
    cert = miner.certify_pattern(PAT, timeout=1800)
    print(f"[D] certify_pattern(1800s): "
          f"{'OK kill='+cert['kill'] if cert else 'FAILED'}  "
          f"({time.time()-t0:.1f}s)", flush=True)

    print("\nVERDICT:", flush=True)
    if b is False or (sdim is not None and sdim != -1) or red1 not in (None, "0"):
        print("  *** ITERSAT WRONG-DEAD: independent oracle says ALIVE. "
              "pattern_dead3 is UNSOUND in the dead direction — this "
              "threatens the 107-pattern intracap classification. ***",
              flush=True)
    elif b is True and (sdim == -1 or red1 == "0"):
        print("  Pattern is GENUINELY DEAD (msolve + Singular agree). "
              "certify_pattern FAILED = a hard CERTFAIL (needs more "
              "rabinowitsch pairs or timeout), NOT an oracle bug.", flush=True)
    else:
        print(f"  INCONCLUSIVE: itersat={a} msolve={b} sdim={sdim} red1={red1} "
              f"certD={'OK' if cert else 'FAIL'} — investigate.", flush=True)


if __name__ == "__main__":
    main()
