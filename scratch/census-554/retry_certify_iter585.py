#!/usr/bin/env python3
"""Retry the iter-585 certify-timeout pattern with a long timeout.

Pattern {"1":[4,8,9],"2":[1,9,10],"4":[1,10],"8":[2,9,10],"9":[2,4]} is a
minimal dead pattern (exact oracle, k=6) mined at the iter-585 frontier cube;
its two siblings banked (pat_05400/05401) so the cube is excluded, but this
motif is unbanked.  Certify it here (timeout 7200s) and write a
frontier_add-ready row to retry_iter585_certified.json.  Do NOT auto-bank —
bank manually at a safe moment to avoid racing the loop's frontier_add.
"""
import json
import sys
import time

sys.path.insert(0, ".")
import intracap  # noqa: E402
import miner  # noqa: E402


def _exact_dead(pat, timeout=30):
    v = intracap.pattern_dead3(pat, max(timeout, 60))
    return bool(v)


miner.pattern_dead_fast = _exact_dead

PJ = {"1": [4, 8, 9], "2": [1, 9, 10], "4": [1, 10],
      "8": [2, 9, 10], "9": [2, 4]}
CUBE = {"0": [3, 4, 5, 10], "1": [4, 6, 8, 9], "2": [1, 7, 9, 10],
        "3": [2, 6, 7, 8], "4": [1, 2, 5, 10], "5": [2, 3, 6, 9],
        "6": [0, 1, 7, 8], "7": [1, 4, 5, 8], "8": [0, 2, 9, 10],
        "9": [0, 2, 3, 4], "10": [0, 5, 6, 7]}


def main():
    pat = {int(c): frozenset(M) for c, M in PJ.items()}
    print("deadness recheck (exact oracle):", flush=True)
    d = intracap.pattern_dead3(pat, 300)
    print("  pattern_dead3 ->", d, flush=True)
    t0 = time.time()
    cert = miner.certify_pattern(pat, timeout=7200)
    dt = time.time() - t0
    if cert is not None and "kill" in cert:
        print(f"CERTIFIED kill={cert['kill']} ({dt:.0f}s)", flush=True)
        with open("retry_iter585_certified.json", "w") as f:
            json.dump([{"pattern": PJ, "cert": cert, "cube": CUBE}], f)
        print("wrote retry_iter585_certified.json — bank via "
              "frontier_add.py at a safe moment", flush=True)
    else:
        print(f"CERTIFY FAILED again ({dt:.0f}s) — needs a different "
              "lift strategy (CERT_ALL_PAIRS_FALLBACK?)", flush=True)


if __name__ == "__main__":
    main()
