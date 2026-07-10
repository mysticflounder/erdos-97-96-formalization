#!/usr/bin/env python3
"""Fix test for the hard CERTFAIL: Singular std(I) over Q blows up on rational
coefficient explosion (audit oracle C stalled >300s; msolve does the same
emptiness in 0.3s because it is modular).  Test modular Grobner routes on the
ALL-PAIRS system of frontier pattern 0, timing each risky Singular op.

T1: modStd(I) + reduce(1,G)     -- does the modular GB build + see 1?
T2: lift(I, ideal(1))            -- does the plain lift terminate on its own?
T3: liftstd(I,T) then lift(G,1)  -- GB-with-transform route; cofactors for the
    ORIGINAL generators recovered as T*d, exact-rechecked in Fractions.
"""
import sys
import time
from fractions import Fraction
from itertools import combinations

sys.path.insert(0, ".")
import census554_lib as L  # noqa: E402
import certify_probe as P  # noqa: E402  (reuse build())
import miner  # noqa: E402


def run(script, timeout, label):
    t0 = time.time()
    out = miner.sing_run(script, timeout)
    dt = time.time() - t0
    if out is None:
        print(f"[{label}] TIMEOUT at {timeout}s (wall {dt:.0f}s)", flush=True)
        return None, dt
    print(f"[{label}] returned {dt:.0f}s", flush=True)
    return out, dt


def extract(out, key):
    for ln in out.splitlines():
        ln = ln.strip()
        if ln.startswith(key):
            return ln[len(key):].strip()
    return None


def main():
    polys, tags = miner.pattern_polys(P.PAT)
    pts = miner.pattern_points(P.PAT)
    pairs = [e for e in combinations(pts, 2) if e != (0, 1)]
    gens = polys + [r[0] for r in miner.rabinowitsch_polys(P.PAT, pairs=pairs)]
    names, remap, gstrs = P.build(gens)
    ideal = "ideal I = " + ",\n  ".join(gstrs) + ";"
    ring = f"ring r = 0, ({','.join(names)}), dp;"
    print(f"all-pairs system: {len(names)} vars, {len(gens)} gens", flush=True)

    # --- T1: modStd + reduce(1) ---
    s1 = "\n".join(['LIB "modstd.lib";', ring, ideal,
                    "ideal G = modStd(I);",
                    'string("RED1:", reduce(1, G));', "exit;"])
    out, _ = run(s1, 600, "T1 modStd+reduce")
    if out is not None:
        print(f"     RED1 = {extract(out, 'RED1:')!r}  "
              f"(0 => 1 in ideal, modStd works)", flush=True)

    # --- T2: plain lift alone ---
    s2 = "\n".join([ring, ideal,
                    "matrix T = lift(I, ideal(1));",
                    "poly chk = 0; int i;",
                    "for (i=1;i<=size(I);i=i+1){chk=chk+I[i]*T[i,1];}",
                    'string("CHK:", chk);', "exit;"])
    out, _ = run(s2, 600, "T2 lift")
    if out is not None:
        print(f"     CHK = {extract(out, 'CHK:')!r}  (1 => plain lift works)",
              flush=True)

    print("DONE", flush=True)


if __name__ == "__main__":
    main()
