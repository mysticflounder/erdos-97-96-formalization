#!/usr/bin/env python3
"""Characterize the cover_probe frontier cube: run the algebraic oracle,
and if DEAD, mine its minimal pattern and check whether that pattern's
unlabeled motif is genuinely NEW (absent from the banked motif set).

Interpretation:
  ALIVE (UNDECIDED_OR_CANDIDATE / positive sat_dim) -> a real witness
    cube; census is incomplete (expected) and this is the next cube CEGAR
    would examine.  Motif generalization did not exclude it because no
    dead motif embeds — consistent with a live region.
  DEAD (NO_VALID_REAL / C_EMPTY) with a NEW motif -> the bank is missing
    a motif; the probe's "no known motif embeds" was true only because
    that motif isn't banked yet.  Adding it would let the probe continue.
  DEAD with a motif already in the bank -> would contradict the frontier
    finding (embedding check missed it) -> investigate.
"""
import json
import sys

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import engine  # noqa: E402
import miner  # noqa: E402

FRONTIER = {
    0: [2, 3, 7, 10], 1: [5, 7, 8, 9], 2: [0, 1, 9, 10], 3: [1, 5, 8, 10],
    4: [0, 2, 5, 9], 5: [0, 2, 6, 7], 6: [1, 3, 4, 5], 7: [2, 6, 9, 10],
    8: [0, 3, 4, 7], 9: [0, 3, 6, 8], 10: [1, 4, 6, 8],
}


def main():
    cube = {c: sorted(ks) for c, ks in FRONTIER.items()}
    print("[1] engine verdict on frontier cube ...", flush=True)
    r = engine.verdict_one(cube, timeout=900)
    print(f"[1] verdict: {json.dumps(r)}", flush=True)

    dead = r["verdict"] in ("NO_VALID_REAL", "C_EMPTY")
    if not dead:
        print("[2] frontier cube is ALIVE/candidate — a genuine witness. "
              "Census incomplete (expected); motif generalization cannot "
              "exclude a live cube.  No new motif to add.", flush=True)
        return

    print("[2] frontier cube is DEAD — mining minimal pattern ...", flush=True)
    pat = miner.greedy_shrink(cube, timeout=60)
    if pat is None:
        print("[2] greedy_shrink returned None (timeout) — retry longer",
              flush=True)
        pat = miner.greedy_shrink(cube, timeout=300)
    print(f"[2] minimal pattern: "
          f"{json.dumps({str(c): sorted(M) for c, M in pat.items()})}",
          flush=True)

    bank = cp.load_bank()
    bank_motifs = {cp.unlabeled_key(p) for p in bank}
    key = cp.unlabeled_key({c: frozenset(M) for c, M in pat.items()})
    is_new = key not in bank_motifs
    print(f"[3] pattern motif is {'NEW (not in bank)' if is_new else 'ALREADY BANKED'}",
          flush=True)
    if is_new:
        print("[3] => the bank is missing this motif; the frontier finding "
              "is a genuine coverage gap, not closure.  Motif generalization "
              "of the CURRENT bank does not close coverage.", flush=True)
    else:
        print("[3] => CONTRADICTION: motif is banked but no embedding was "
              "found into the frontier cube.  embed_into_cube bug — "
              "investigate.", flush=True)
        # dump the embedding attempt for this motif
        emb = cp.embed_into_cube(key, {c: frozenset(ks) for c, ks in cube.items()})
        print(f"[3] embeddings of this motif into the frontier cube: {len(emb)}",
              flush=True)


if __name__ == "__main__":
    main()
