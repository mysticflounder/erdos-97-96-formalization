"""M1 pre-stage main run: the ERASE card-11 seed domain (DESIGN.md 1.2).

EMPIRICAL ONLY -- licenses no Lean claim.  Enumerates every seed placement
(c0, support, deleted) of the three ERASE families and runs the parametric
replica DFS (`erased_placement_check`) on each:

  P2    c0 in {7,8} (intO1) and {9,10} (intO2); support: localCandidateOK
        4-mask with a surplus-interior member (the pin, s & intS != 0);
        deleted in intS (4 choices).                       764 x 4 = 3056
  P4-U  c0 = 0 (surplus-opposite apex); support: localCandidateOK 4-mask
        (which forces >= 2 intS members); deleted in s & intS (the center-0
        localCandidateOK gate requires deleted in support).   sum <= 316
  P4-S  c0 in intS = {3,4,5,6}; support: localCandidateOK 4-mask with an
        intS member != c0; deleted in intS (4 choices).      360 x 4 = 1440

This is the superset domain of DESIGN.md (<= 4812 searches); no per-row
signature dispatch is applied, so any landed row subset is covered.  The
parametric seed center c0 is threaded through the detector fork (R4): the
off-circle detector and the find? key both use c0, never the committed
center-1 literal.

Output: cells.jsonl, one record per search, appended incrementally
(resumable -- reruns skip already-recorded (family,c0,mask,deleted) keys).

Usage: uv run python run_main.py [--workers N] [--node-cap N]
                                 [--budget-secs S] [--families P4U,P4S,P2]
"""

from __future__ import annotations

import argparse
import json
import multiprocessing as mp
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import replica as R

HERE = Path(__file__).resolve().parent
CELLS = HERE / "cells.jsonl"

INTS = (3, 4, 5, 6)
INTO1 = (7, 8)
INTO2 = (9, 10)
MOSER_MASK = 0b111


def buckets(support: int):
    """Generic bucket counts (m, intS, intO1, intO2) -- diagnostic only."""
    return [
        (support & MOSER_MASK).bit_count(),
        (support & R.INTS_MASK).bit_count(),
        R.count_points(support, INTO1),
        R.count_points(support, INTO2),
    ]


def p2_sig(c0: int, support: int):
    """ep3map.py sig convention for P2 rows (diagnostic only):
    (m, own-int minus center, leftAdj, rightAdj)."""
    m = (support & MOSER_MASK).bit_count()
    if c0 in INTO1:
        own = sum(1 for p in INTO1 if p != c0 and R.has(support, p))
        return [m, own, R.count_points(support, INTO2), (support & R.INTS_MASK).bit_count()]
    own = sum(1 for p in INTO2 if p != c0 and R.has(support, p))
    return [m, own, (support & R.INTS_MASK).bit_count(), R.count_points(support, INTO1)]


def four_masks():
    for s in range(2048):
        if s.bit_count() == 4:
            yield s


def enumerate_specs(families):
    specs = []
    if "P4U" in families:
        # center-0 localCandidateOK sans the deleted clause (count-4 and
        # 0-not-in-support are the mask conditions; the center<=6 clauses are
        # inactive at 0); every such mask has >= 2 intS members, and the
        # deleted clause is restored by iterating deleted over s & intS.
        for s in four_masks():
            if not R.has(s, 0) and R.moser_one_hit_ok(0, s):
                for d in INTS:
                    if R.has(s, d):
                        specs.append(
                            {"family": "P4U", "c0": 0, "mask": s, "deleted": d}
                        )
    if "P4S" in families:
        for c0 in INTS:
            pin_mask = R.INTS_MASK & ~(1 << c0)
            for s in four_masks():
                if R.local_candidate_ok(c0, 3, s) and (s & pin_mask):
                    for d in INTS:
                        specs.append(
                            {"family": "P4S", "c0": c0, "mask": s, "deleted": d}
                        )
    if "P2" in families:
        for c0 in INTO1 + INTO2:
            for s in four_masks():
                if R.local_candidate_ok(c0, 3, s) and (s & R.INTS_MASK):
                    for d in INTS:
                        specs.append(
                            {"family": "P2", "c0": c0, "mask": s, "deleted": d}
                        )
    return specs


_NODE_CAP = 3_000_000


def _init_worker(node_cap: int):
    global _NODE_CAP
    _NODE_CAP = node_cap


def run_one(spec: dict) -> dict:
    c0, mask, deleted = spec["c0"], spec["mask"], spec["deleted"]
    verdict, stats, secs = R.erased_placement_check(
        c0, mask, deleted, node_cap=_NODE_CAP
    )
    rec = {
        "family": spec["family"],
        "c0": c0,
        "support": R.support_points(mask),
        "mask": mask,
        "deleted": deleted,
        "buckets": buckets(mask),
        "verdict": verdict,
        "nodes": stats.nodes,
        "max_depth": stats.max_depth,
        "kills_by_detector": stats.kills_by_detector,
        "kills_by_depth": {str(k): v for k, v in sorted(stats.kills_by_depth.items())},
        "empty_prunes": stats.empty_prunes,
        "secs": round(secs, 3),
    }
    if spec["family"] == "P2":
        rec["sig"] = p2_sig(c0, mask)
    if verdict == "survived" and stats.survivor is not None:
        rec["survivor"] = R.survivor_payload(stats.survivor)
    return rec


def key_of(d: dict) -> str:
    return f"{d['family']}|{d['c0']}|{d['mask']}|{d['deleted']}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--workers", type=int, default=24)
    ap.add_argument("--node-cap", type=int, default=3_000_000)
    ap.add_argument("--budget-secs", type=int, default=6 * 3600)
    ap.add_argument("--families", type=str, default="P4U,P4S,P2")
    args = ap.parse_args()

    families = [f.strip() for f in args.families.split(",")]
    specs = enumerate_specs(families)
    done = set()
    if CELLS.exists():
        with CELLS.open() as fh:
            for line in fh:
                line = line.strip()
                if line:
                    try:
                        done.add(key_of(json.loads(line)))
                    except (json.JSONDecodeError, KeyError):
                        print(f"skipping malformed line (will re-run): {line[:80]}")
    todo = [s for s in specs if key_of(s) not in done]
    print(
        f"domain: {len(specs)} searches ({', '.join(families)}); "
        f"{len(done)} already recorded; {len(todo)} to run; "
        f"workers={args.workers} node_cap={args.node_cap} budget={args.budget_secs}s",
        flush=True,
    )

    t0 = time.monotonic()
    n_done = n_survived = n_capped = 0
    stop = False
    with CELLS.open("a") as out, mp.Pool(
        args.workers, initializer=_init_worker, initargs=(args.node_cap,)
    ) as pool:
        for rec in pool.imap_unordered(run_one, todo, chunksize=2):
            out.write(json.dumps(rec) + "\n")
            out.flush()
            n_done += 1
            if rec["verdict"] == "survived":
                n_survived += 1
                print(f"SURVIVOR: {key_of(rec)} support={rec['support']}", flush=True)
            elif rec["verdict"] == "capped":
                n_capped += 1
                print(f"CAPPED (UNDECIDED): {key_of(rec)}", flush=True)
            if n_done % 200 == 0:
                el = time.monotonic() - t0
                print(
                    f"  {n_done}/{len(todo)} done in {el:.0f}s "
                    f"({n_survived} survived, {n_capped} capped)",
                    flush=True,
                )
            if time.monotonic() - t0 > args.budget_secs:
                print("BUDGET EXCEEDED -- stopping after current results", flush=True)
                stop = True
                break
        if stop:
            pool.terminate()
    el = time.monotonic() - t0
    print(
        f"finished: {n_done}/{len(todo)} new searches in {el:.0f}s; "
        f"survived={n_survived} capped={n_capped}",
        flush=True,
    )


if __name__ == "__main__":
    main()
