#!/usr/bin/env python3
"""Frontier-driven cover loop: run the (5,5,4) |A|=11 census to UNSAT.

Combines cover_probe's lazy motif-embedding exclusion with CEGAR mining at
genuine frontiers.  Each iteration:

  1. solve the cover CNF
     UNSAT -> DONE: coverage closes, conditional ONLY on the motif-transfer
              lemma (deadness is similarity-invariant; validated 135/135 by
              motif_transfer.py; single Lean obligation for the transfer).
     SAT   -> witness cube.
  2. embed every known dead motif into the cube (all candidate-feasible
     injective embeddings).  New embeddings -> add them + their AUTOS orbits
     as exclusion clauses; next iteration.  (No mining, no certificates —
     these clauses are what the motif-transfer lemma licenses.)
  3. no embedding -> GENUINE frontier: mine the cube's minimal dead patterns
     (exact itersat oracle).  All mined patterns are new motifs by step 2.
     Certify in parallel (block-order lift + exact Fraction recheck), bank
     via frontier_add.py, add orbits; next iteration.

Any banked mined pattern lies inside its cube, so every mining step strictly
excludes the current cube — the loop cannot spin.

Hard stops (review): solver error; frontier cube with no minimal dead
pattern (cube genuinely ALIVE — real finding); 0/N certified.

Usage: uv run python frontier_loop.py   (from scratch/census-554)
Env: CERT_WORKERS (default 8), CERT_TIMEOUT (default 900), MAX_ITERS (5000)
"""
import json
import os
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402
import sat_cover  # noqa: E402


def _exact_dead(pat, timeout=30):
    v = intracap.pattern_dead3(pat, max(timeout, 60))
    return bool(v)  # None (timeout) -> conservative not-dead


miner.pattern_dead_fast = _exact_dead

WORKERS = int(os.environ.get("CERT_WORKERS", "8"))
CERT_TIMEOUT = int(os.environ.get("CERT_TIMEOUT", "900"))
MAX_ITERS = int(os.environ.get("MAX_ITERS", "5000"))


def certify_one(pj):
    pat = {int(c): frozenset(M) for c, M in pj.items()}
    t0 = time.time()
    cert = miner.certify_pattern(pat, timeout=CERT_TIMEOUT)
    return pj, cert, time.time() - t0


def main():
    t0 = time.time()
    pats = cp.load_bank()
    motif_keys = sorted({cp.unlabeled_key(p) for p in pats})
    print(f"[seed] {len(pats)} bank rows, {len(motif_keys)} motifs", flush=True)

    inst = sat_cover.CoverInstance()
    added = set()
    for pat in pats:
        for img in miner.orbit(pat):
            s = cp.ser(img)
            if s not in added:
                added.add(s)
                inst.add_pattern_instance(img)
    print(f"[seed] {len(added)} orbit instances ({time.time()-t0:.0f}s)",
          flush=True)

    n_mined_cycles = 0
    for it in range(1, MAX_ITERS + 1):
        res, cube = inst.solve(cp.CNF_PATH, timeout=3600)
        if res == "UNSAT":
            print(f"[iter {it}] UNSAT — COVERAGE COMPLETE modulo the "
                  f"motif-transfer lemma ({len(added)} instances, "
                  f"{n_mined_cycles} mining cycles, {time.time()-t0:.0f}s). "
                  "DONE.", flush=True)
            return
        if res != "SAT":
            print(f"[iter {it}] solver returned {res} — STOP", flush=True)
            return

        fcube = {c: frozenset(K) for c, K in cube.items()}
        found = set()
        for key in motif_keys:
            found |= cp.embed_into_cube(key, fcube)
        found = {s for s in found if s not in added}

        if found:
            n_new = 0
            for s in found:
                pat = {c: frozenset(M) for c, M in s}
                for img in miner.orbit(pat):
                    si = cp.ser(img)
                    if si not in added:
                        added.add(si)
                        inst.add_pattern_instance(img)
                        n_new += 1
            print(f"[iter {it}] +{len(found)} embeddings "
                  f"(+{n_new} instances, total {len(added)}) "
                  f"({time.time()-t0:.0f}s)", flush=True)
            continue

        # genuine frontier — no known motif embeds
        cube_s = {c: sorted(cube[c]) for c in sorted(cube)}
        print(f"[iter {it}] FRONTIER cube: "
              f"{json.dumps({str(c): cube_s[c] for c in cube_s})}", flush=True)
        tm = time.time()
        mined, k = miner.mine_all_patterns(
            {c: sorted(ks) for c, ks in cube_s.items()},
            log=lambda m: print("   ", m, flush=True))
        print(f"[iter {it}] {len(mined)} minimal pattern(s) at k={k} "
              f"({time.time()-tm:.0f}s)", flush=True)
        if not mined:
            print(f"[iter {it}] frontier cube has NO minimal dead pattern — "
                  "cube may be genuinely ALIVE. STOP for review.", flush=True)
            return

        new = [{str(c): sorted(M) for c, M in p.items()} for p in mined]
        print(f"[iter {it}] certifying {len(new)} new motif(s) "
              f"({WORKERS} workers, timeout {CERT_TIMEOUT}s)", flush=True)
        rows, nfail = [], 0
        with ProcessPoolExecutor(max_workers=WORKERS) as ex:
            for pj, cert, dt in ex.map(certify_one, new):
                if cert is not None and "kill" in cert:
                    print(f"[iter {it}] certified {json.dumps(pj)} "
                          f"kill={cert['kill']} ({dt:.0f}s)", flush=True)
                    rows.append({"pattern": pj, "cert": cert, "cube": cube_s})
                else:
                    nfail += 1
                    print(f"[iter {it}] CERTIFY FAILED {json.dumps(pj)} "
                          f"({dt:.0f}s)", flush=True)
        if not rows:
            print(f"[iter {it}] 0/{len(new)} certified — STOP for review.",
                  flush=True)
            return

        fn = f"frontier_iter_{it:04d}.json"
        with open(fn, "w") as f:
            json.dump(rows, f)
        r = subprocess.run([sys.executable, "frontier_add.py", fn])
        if r.returncode != 0:
            print(f"[iter {it}] frontier_add FAILED — STOP", flush=True)
            return
        n_mined_cycles += 1

        n_new = 0
        for row in rows:
            pat = {int(c): frozenset(M) for c, M in row["pattern"].items()}
            motif_keys.append(cp.unlabeled_key(pat))
            for img in miner.orbit(pat):
                si = cp.ser(img)
                if si not in added:
                    added.add(si)
                    inst.add_pattern_instance(img)
                    n_new += 1
        motif_keys = sorted(set(motif_keys))
        print(f"[iter {it}] banked {len(rows)} new motif(s) "
              f"({nfail} certify-failed dropped), +{n_new} instances",
              flush=True)

    print(f"MAX_ITERS reached ({len(added)} instances) — INCONCLUSIVE",
          flush=True)


if __name__ == "__main__":
    main()
