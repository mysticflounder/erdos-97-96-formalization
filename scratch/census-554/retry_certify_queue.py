#!/usr/bin/env python3
"""Serial long-timeout retry of frontier_loop CERTIFY FAILED patterns.

Single pass: scan frontier_loop.log for `CERTIFY FAILED` lines (each dropped
pattern is a mined minimal dead pattern whose 900s certificate lift timed
out), pair each with its iteration's FRONTIER cube, dedupe against bank
motifs and already-retried rows, re-check deadness (exact oracle), then
certify serially with RETRY_TIMEOUT (default 7200s).

Successful rows are APPENDED to retry_certified_pending.json in
frontier_add.py format.  This script never banks — bank the pending file
manually at a safe moment (frontier_add.py is guarded but not locked against
the loop's own frontier_add invocations).

Usage: uv run python retry_certify_queue.py   (from scratch/census-554)
"""
import json
import os
import sys
import time

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402


def _exact_dead(pat, timeout=30):
    v = intracap.pattern_dead3(pat, max(timeout, 60))
    return bool(v)


miner.pattern_dead_fast = _exact_dead

LOG = "frontier_loop.log"
PENDING = "retry_certified_pending.json"
RETRY_TIMEOUT = int(os.environ.get("RETRY_TIMEOUT", "7200"))


def scan_failures():
    cubes, fails = {}, []
    with open(LOG) as f:
        for ln in f:
            ln = ln.strip()
            if "] FRONTIER cube: " in ln:
                it = ln.split("]")[0].lstrip("[iter ")
                cubes[it] = json.loads(ln.split("FRONTIER cube: ", 1)[1])
            elif "] CERTIFY FAILED " in ln:
                it = ln.split("]")[0].lstrip("[iter ")
                body = ln.split("CERTIFY FAILED ", 1)[1].rsplit(" (", 1)[0]
                fails.append((it, json.loads(body)))
    return [(pj, cubes.get(it)) for it, pj in fails]


def load_done():
    done = set()
    for fn in (PENDING, "retry_iter585_certified.json"):
        if os.path.exists(fn):
            for row in json.load(open(fn)):
                pat = {int(c): frozenset(M) for c, M in row["pattern"].items()}
                done.add(cp.unlabeled_key(pat))
    return done


def main():
    fails = scan_failures()
    bank_motifs = {cp.unlabeled_key(p) for p in cp.load_bank()}
    done = load_done()
    queue, seen = [], set()
    for pj, cube in fails:
        pat = {int(c): frozenset(M) for c, M in pj.items()}
        key = cp.unlabeled_key(pat)
        if key in bank_motifs or key in done or key in seen:
            continue
        seen.add(key)
        queue.append((pj, pat, cube))
    print(f"{len(fails)} failures in log, {len(queue)} to retry "
          f"(timeout {RETRY_TIMEOUT}s each)", flush=True)

    rows = json.load(open(PENDING)) if os.path.exists(PENDING) else []
    for i, (pj, pat, cube) in enumerate(queue):
        print(f"[{i}] deadness recheck: ", end="", flush=True)
        d = intracap.pattern_dead3(pat, 300)
        print(d, flush=True)
        if d is not True:
            print(f"[{i}] SKIP (not confirmed dead): {json.dumps(pj)}",
                  flush=True)
            continue
        t0 = time.time()
        cert = miner.certify_pattern(pat, timeout=RETRY_TIMEOUT)
        dt = time.time() - t0
        if cert is not None and "kill" in cert:
            print(f"[{i}] CERTIFIED kill={cert['kill']} ({dt:.0f}s) "
                  f"{json.dumps(pj)}", flush=True)
            rows.append({"pattern": pj, "cert": cert, "cube": cube})
            with open(PENDING, "w") as f:
                json.dump(rows, f)
        else:
            print(f"[{i}] FAILED again ({dt:.0f}s) {json.dumps(pj)}",
                  flush=True)
    print(f"done: {len(rows)} pending row(s) in {PENDING}", flush=True)


if __name__ == "__main__":
    main()
