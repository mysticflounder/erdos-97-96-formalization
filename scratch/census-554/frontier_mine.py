#!/usr/bin/env python3
"""Extract + certify the minimal dead pattern(s) of the cover_probe frontier
cube, using the EXACT iterated-pairwise-saturation oracle (intracap.pattern_
dead3) in place of the miner's msolve oracle — which stalls on this cube's
positive-dimensional / forced-pair collapse.

Read-only wrt bank.jsonl (a census driver may be appending): this script
mines, certifies, and checks motif novelty, but does NOT write the bank.
Adding the row is a separate, serialized step done only when no driver is
writing.

Steps:
  1. monkeypatch miner.pattern_dead_fast -> intracap.pattern_dead3 (exact,
     fast, no msolve stall)
  2. miner.mine_all_patterns(FRONTIER) -> minimal dead patterns (AUTOS-deduped)
  3. certify each via miner.certify_pattern
  4. novelty: is each pattern's unlabeled motif absent from the current bank?
  5. demonstrate the frontier-driven cycle in memory: does adding these rows'
     orbits let cover_probe find a DIFFERENT next frontier (or UNSAT)?  Uses a
     scratch instance; never touches bank.jsonl.
"""
import json
import sys
import time

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402
import sat_cover  # noqa: E402

FRONTIER = {
    0: [2, 3, 7, 10], 1: [5, 7, 8, 9], 2: [0, 1, 9, 10], 3: [1, 5, 8, 10],
    4: [0, 2, 5, 9], 5: [0, 2, 6, 7], 6: [1, 3, 4, 5], 7: [2, 6, 9, 10],
    8: [0, 3, 4, 7], 9: [0, 3, 6, 8], 10: [1, 4, 6, 8],
}

# --- step 1: swap the deadness oracle to the exact itersat one ---
_orig = miner.pattern_dead_fast


def _exact_dead(pat, timeout=30):
    v = intracap.pattern_dead3(pat, max(timeout, 60))
    return bool(v)  # None (timeout) -> conservative not-dead


miner.pattern_dead_fast = _exact_dead


def main():
    cube = {c: sorted(ks) for c, ks in FRONTIER.items()}
    t0 = time.time()
    print("[2] mining minimal dead patterns (exact oracle) ...", flush=True)
    pats, k = miner.mine_all_patterns(cube, log=lambda m: print("   ", m, flush=True))
    print(f"[2] {len(pats)} minimal pattern(s) at min-support k={k} "
          f"({time.time()-t0:.0f}s)", flush=True)
    # dump mined patterns immediately (before the slow certify loop) so a
    # kill mid-certify does not lose the 58-min mining result
    with open("frontier_mined_patterns.json", "w") as f:
        json.dump([{str(c): sorted(M) for c, M in p.items()} for p in pats], f)
    print(f"[2] dumped {len(pats)} patterns -> frontier_mined_patterns.json",
          flush=True)
    if not pats:
        print("[2] NO dead induced pattern found — unexpected (cube verdicts "
              "NO_VALID_REAL). Investigate.", flush=True)
        return

    bank = cp.load_bank()
    bank_motifs = {cp.unlabeled_key(p) for p in bank}
    results = []
    for i, pat in enumerate(pats):
        pj = {str(c): sorted(M) for c, M in pat.items()}
        key = cp.unlabeled_key(pat)
        is_new = key not in bank_motifs
        print(f"[3] pattern {i}: {json.dumps(pj)}  gens={miner.n_gens(pat)} "
              f"orbit={len(miner.orbit(pat))} motif={'NEW' if is_new else 'BANKED'}",
              flush=True)
        print(f"[4] certifying pattern {i} ...", flush=True)
        cert = miner.certify_pattern(pat, timeout=600)
        ok = cert is not None
        print(f"[4] pattern {i} certify: {'OK ('+cert.get('kill','?')+')' if ok else 'FAILED'}",
              flush=True)
        results.append((pat, key, is_new, cert))

    new = [r for r in results if r[2]]
    print(f"[4] summary: {len(pats)} minimal, "
          f"{sum(1 for r in results if r[3])} certified, "
          f"{len(new)} new motifs", flush=True)

    # --- step 5: in-memory frontier-cycle demo (scratch instance) ---
    print("[5] in-memory cycle demo: seed bank + new rows, re-probe ...",
          flush=True)
    inst = sat_cover.CoverInstance()
    added = set()
    for pat in bank:
        for img in miner.orbit(pat):
            s = cp.ser(img)
            if s not in added:
                added.add(s)
                inst.add_pattern_instance(img)
    for pat, key, is_new, cert in results:
        for img in miner.orbit(pat):
            s = cp.ser(img)
            if s not in added:
                added.add(s)
                inst.add_pattern_instance(img)
    # verify the old frontier is now excluded
    res, cube2 = inst.solve(cp.CNF_PATH, timeout=1200)
    print(f"[5] re-solve with +{len(new)} new motif rows: {res} "
          f"({len(added)} instances)", flush=True)
    if res == "SAT":
        motif_keys = sorted(bank_motifs | {r[1] for r in results})
        fcube = {c: frozenset(K) for c, K in cube2.items()}
        hit = any(cp.embed_into_cube(mk, fcube) - added for mk in motif_keys)
        print(f"[5] new witness cube: "
              f"{json.dumps({str(c): cube2[c] for c in sorted(cube2)})}",
              flush=True)
        print(f"[5] old frontier excluded: "
              f"{'YES (different cube)' if cube2 != cube else 'NO — same cube!'}",
              flush=True)


if __name__ == "__main__":
    main()
