#!/usr/bin/env python3
"""Scaled empirical validation of the motif-transfer claim.

Claim under test (candidate theorem, 2026-07-08): the deadness of a
pattern {center: mask} depends only on its UNLABELED incidence motif —
in particular it is invariant under any injective relabeling of the
support into {0..10}, INCLUDING relabelings that change how many of the
gauge points {0,1} lie in the support and where they sit.

Why this is the only nontrivial direction: points other than 0,1 are
free coordinate pairs, so a gauge-preserving relabeling is literally a
ring isomorphism (variable renaming) — no test needed.  The substance
is gauge-crossing: 0↦(0,0), 1↦(1,0) are constants, so moving gauge
points in/out of the support changes the ideal non-trivially.  The
prose justification is similarity-WLOG over ℂ with the non-isotropic
caveat; this script measures whether any counterexample exists in the
banked corpus.

Tests:
  DEAD side: sample banked minimal dead patterns stratified by gauge
    count g = |support ∩ {0,1}| ∈ {0,1,2}; for each, random transfers
    to every gauge class (0,1,2).  Expect dead everywhere.
  ALIVE side (control, catches an oracle that just says "dead"): for
    each sampled pattern, one single-step shrink (alive by minimality)
    transferred the same way.  Expect alive everywhere.

Oracle: intracap.pattern_dead3 (iterated pairwise saturation, exact,
with the adversarial msolve cross-check on alive verdicts).
"""
import json
import random
import sys
from concurrent.futures import ThreadPoolExecutor

sys.path.insert(0, ".")
import census554_lib as L  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402

SEED = 20260708
TIMEOUT = 300
N_PER_GROUP = 5          # dead patterns sampled per gauge class
TRANSFERS_PER_TARGET = 2  # random transfers per (pattern, target gauge class)


def load_bank():
    rows = []
    with open("bank.jsonl") as f:
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            try:
                r = json.loads(ln)
            except json.JSONDecodeError:
                continue  # racing the live appender on the last line
            rows.append({int(c): frozenset(M) for c, M in r["pattern"].items()})
    return rows


def support(pat):
    return miner.pattern_points(pat)


def gauge_count(pat):
    return len(set(support(pat)) & {0, 1})


def transfer(pat, target_g, rng):
    """Random injective relabeling of support into {0..10} with exactly
    target_g gauge points in the image.  None if impossible (support too
    large for the non-gauge pool)."""
    pts = support(pat)
    n = len(pts)
    if n - target_g > 9:
        return None
    gauge_imgs = rng.sample([0, 1], target_g)
    other_imgs = rng.sample(range(2, 11), n - target_g)
    imgs = gauge_imgs + other_imgs
    rng.shuffle(imgs)
    m = dict(zip(pts, imgs))
    return {m[c]: frozenset(m[p] for p in M) for c, M in pat.items()}


def shrink_one(pat, rng):
    """One single-step shrink (drop one mask element, keeping |mask|>=2,
    else drop the center) — alive by mining minimality."""
    opts = []
    for c in sorted(pat):
        if len(pat[c]) > 2:
            for p in sorted(pat[c]):
                opts.append((c, p))
        else:
            opts.append((c, None))
    c, p = rng.choice(opts)
    q = {a: M for a, M in pat.items()}
    if p is None:
        del q[c]
    else:
        q[c] = q[c] - {p}
    return q if q else None


def main():
    rng = random.Random(SEED)
    bank = load_bank()
    by_g = {0: [], 1: [], 2: []}
    for pat in bank:
        by_g[gauge_count(pat)].append(pat)
    print(f"bank rows parsed: {len(bank)}; by gauge count: "
          f"{ {g: len(v) for g, v in by_g.items()} }", flush=True)

    jobs = []  # (label, pat, expect_dead)
    for g, pool in sorted(by_g.items()):
        if not pool:
            continue
        for pat in rng.sample(pool, min(N_PER_GROUP, len(pool))):
            sh = shrink_one(pat, rng)
            for tg in (0, 1, 2):
                for k in range(TRANSFERS_PER_TARGET):
                    tp = transfer(pat, tg, rng)
                    if tp is not None:
                        jobs.append((f"dead g{g}->g{tg}#{k}", tp, True))
                if sh:
                    ap = transfer(sh, tg, rng)
                    if ap is not None:
                        jobs.append((f"alive g{g}->g{tg}", ap, False))
    print(f"{len(jobs)} transfer tests queued", flush=True)

    def run(job):
        label, pat, expect = job
        try:
            v = intracap.pattern_dead3(pat, TIMEOUT)
        except RuntimeError as e:
            return (label, pat, expect, f"CONFLICT: {e}")
        return (label, pat, expect, v)

    ok = bad = und = 0
    with ThreadPoolExecutor(max_workers=4) as ex:
        for label, pat, expect, v in ex.map(run, jobs):
            if v is None:
                und += 1
                tag = "TIMEOUT"
            elif isinstance(v, str):
                bad += 1
                tag = v
            elif v == expect:
                ok += 1
                tag = "OK"
            else:
                bad += 1
                tag = f"MISMATCH got dead={v}"
            print(f"{label:20s} expect_dead={expect} {tag}"
                  + ("" if tag == "OK" else f"  pat={dict(sorted((c, sorted(M)) for c, M in pat.items()))}"),
                  flush=True)
    print(f"RESULT: {ok} OK / {bad} FAIL / {und} undecided of {len(jobs)}",
          flush=True)
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
