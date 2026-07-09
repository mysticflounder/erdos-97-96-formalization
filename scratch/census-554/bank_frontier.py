#!/usr/bin/env python3
"""Certify + bank the frontier-mined k=7 patterns.

Waits for frontier_mined_patterns.json (dumped by frontier_mine.py right
after its mining phase), kills the redundant frontier_mine.py certify loop
(its cert dicts are not persisted), then:

  1. novelty-filters the mined patterns against bank.jsonl motifs
  2. certifies each NEW pattern in parallel (block-order lift path in
     miner.certify_pattern; exact Fraction identity recheck inside)
  3. writes frontier_certified.json rows for frontier_add.py
  4. invokes frontier_add.py (guarded: refuses if a census driver is alive)
  5. re-solves the cover with the updated bank to check the old frontier
     cube is now excluded

Usage: uv run python bank_frontier.py   (from scratch/census-554)
"""
import json
import os
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import miner  # noqa: E402
import sat_cover  # noqa: E402

PATS = "frontier_mined_patterns.json"
OUT = "frontier_certified.json"
FRONTIER = {
    0: [2, 3, 7, 10], 1: [5, 7, 8, 9], 2: [0, 1, 9, 10], 3: [1, 5, 8, 10],
    4: [0, 2, 5, 9], 5: [0, 2, 6, 7], 6: [1, 3, 4, 5], 7: [2, 6, 9, 10],
    8: [0, 3, 4, 7], 9: [0, 3, 6, 8], 10: [1, 4, 6, 8],
}
WORKERS = int(os.environ.get("CERT_WORKERS", "8"))


def certify_one(pj):
    pat = {int(c): frozenset(M) for c, M in pj.items()}
    t0 = time.time()
    cert = miner.certify_pattern(pat, timeout=600)
    return pj, cert, time.time() - t0


def main():
    while not os.path.exists(PATS):
        print("waiting for", PATS, "...", flush=True)
        time.sleep(120)

    # the miner's own certify loop is redundant (results not persisted)
    subprocess.run(["pkill", "-f", "frontier_mine.py"], capture_output=True)

    pats = json.load(open(PATS))
    bank = cp.load_bank()
    bank_motifs = {cp.unlabeled_key(p) for p in bank}
    new = []
    for pj in pats:
        pat = {int(c): frozenset(M) for c, M in pj.items()}
        if cp.unlabeled_key(pat) not in bank_motifs:
            new.append(pj)
    print(f"{len(pats)} mined, {len(new)} NEW motifs to certify "
          f"({WORKERS} workers)", flush=True)

    rows, failed = [], []
    with ProcessPoolExecutor(max_workers=WORKERS) as ex:
        for pj, cert, dt in ex.map(certify_one, new):
            if cert is not None and "kill" in cert:
                print(f"certified {json.dumps(pj)} kill={cert['kill']} "
                      f"({dt:.0f}s)", flush=True)
                rows.append({"pattern": pj, "cert": cert,
                             "cube": {str(c): v for c, v in FRONTIER.items()}})
            else:
                print(f"CERTIFY FAILED {json.dumps(pj)} ({dt:.0f}s)",
                      flush=True)
                failed.append(pj)

    with open(OUT, "w") as f:
        json.dump(rows, f)
    print(f"certified {len(rows)}/{len(new)}; {len(failed)} failed -> {OUT}",
          flush=True)
    if failed:
        with open("frontier_certify_failed.json", "w") as f:
            json.dump(failed, f)
    if not rows:
        print("nothing to bank", flush=True)
        return

    r = subprocess.run([sys.executable, "frontier_add.py", OUT])
    if r.returncode != 0:
        print("frontier_add.py FAILED — bank untouched", flush=True)
        sys.exit(r.returncode)

    # frontier-cycle check: is the old frontier cube now excluded?
    inst = sat_cover.CoverInstance()
    added = set()
    for pat in cp.load_bank():
        for img in miner.orbit(pat):
            s = cp.ser(img)
            if s not in added:
                added.add(s)
                inst.add_pattern_instance(img)
    res, cube2 = inst.solve(cp.CNF_PATH, timeout=1200)
    print(f"re-solve with updated bank: {res} ({len(added)} instances)",
          flush=True)
    if res == "SAT":
        old = {c: sorted(v) for c, v in FRONTIER.items()}
        got = {c: sorted(cube2[c]) for c in sorted(cube2)}
        print("new witness cube:", json.dumps({str(c): got[c] for c in got}),
              flush=True)
        print("old frontier excluded:",
              "YES (different cube)" if got != old else "NO — same cube!",
              flush=True)


if __name__ == "__main__":
    main()
