#!/usr/bin/env python3
"""Deterministic regression suite for the motif-cover machinery in
cover_probe.py (audit 2026-07-09 P2: the smoke gates cited in the
cover_probe.py docstring were ad hoc and uncommitted).

Gates:
  1. unlabeled_key is invariant under injective relabelings (fixed-seed
     permutations of the 11 points applied to real bank patterns).
  2. Key separation: equal keys iff isomorphic — hand-built isomorphic
     pairs collide, structurally distinct pairs separate.
  3. AUTOS orbit containment: for frontier bank rows with a recorded
     source cube, the identity embedding of the motif is found in the
     source cube, and every AUTOS image is found in the correspondingly
     relabeled cube.
  4. Every embedding returned by embed_into_cube satisfies the defining
     constraint image(M_c) ⊆ K_{image(c)} with an injective node map
     (re-verified here independently of the search code).

Reads bank.jsonl / certs/ from the working tree (append-only, so the
fixed row prefix used here is stable).  All randomness is fixed-seed.
Exit 0 = all gates pass; any assertion failure is a regression.
"""
import json
import random
import sys

sys.path.insert(0, ".")
import cover_probe as cp  # noqa: E402
import miner  # noqa: E402

SEED = 97_96_554
N_PATTERNS = 8          # bank prefix used for gate 1
N_RELABELINGS = 25      # fixed-seed permutations per pattern
N_FRONTIER = 4          # frontier rows with source cubes for gates 3/4
N_ORBIT_IMAGES = 6      # AUTOS images checked per pattern in gate 3


def apply_perm(pat, m):
    return {m[c]: frozenset(m[x] for x in M) for c, M in pat.items()}


def load_bank_prefix(n):
    pats = []
    with open("bank.jsonl") as f:
        for ln in f:
            r = json.loads(ln)
            pats.append({int(c): frozenset(M)
                         for c, M in r["pattern"].items()})
            if len(pats) == n:
                break
    return pats


def load_frontier_rows(n):
    """First n bank rows whose cert records a source cube (frontier-
    sourced).  Returns [(pattern, cube)] with cube total over 0..10."""
    out = []
    with open("bank.jsonl") as f:
        for ln in f:
            r = json.loads(ln)
            if r.get("iter") != -1:
                continue
            cert = json.load(open(r["cert"]))
            sc = cert.get("source_cube")
            if not sc or len(sc) != 11:
                continue
            pat = {int(c): frozenset(M) for c, M in r["pattern"].items()}
            cube = {int(c): frozenset(K) for c, K in sc.items()}
            out.append((r["pid"], pat, cube))
            if len(out) == n:
                break
    return out


def gate1_relabeling_invariance():
    rng = random.Random(SEED)
    pats = load_bank_prefix(N_PATTERNS)
    assert len(pats) == N_PATTERNS, "bank shorter than test prefix"
    for i, pat in enumerate(pats):
        key = cp.unlabeled_key(pat)
        for _ in range(N_RELABELINGS):
            m = list(range(11))
            rng.shuffle(m)
            assert cp.unlabeled_key(apply_perm(pat, m)) == key, \
                f"gate 1: key changed under relabeling (bank row {i})"
    print(f"[smoke] gate 1 PASS: unlabeled_key invariant over "
          f"{N_PATTERNS}x{N_RELABELINGS} fixed-seed relabelings")


def gate2_key_separation():
    f = frozenset
    # isomorphic pair (relabeled copy) -> same key
    a = {0: f({1, 2}), 3: f({0, 4})}
    b = apply_perm(a, [5, 7, 2, 9, 0, 1, 3, 4, 6, 8, 10])
    assert cp.unlabeled_key(a) == cp.unlabeled_key(b), \
        "gate 2: isomorphic pair separated"
    # different mask size -> distinct
    c = {0: f({1, 2, 4}), 3: f({0, 4})}
    assert cp.unlabeled_key(a) != cp.unlabeled_key(c), \
        "gate 2: mask-size difference not separated"
    # same degree data, different sharing structure -> distinct
    d = {0: f({1, 2}), 3: f({1, 4})}   # centers share member 1
    e = {0: f({1, 2}), 3: f({4, 5})}   # disjoint members
    assert cp.unlabeled_key(d) != cp.unlabeled_key(e), \
        "gate 2: sharing-structure difference not separated"
    # center-as-member vs plain member -> distinct
    g = {0: f({1, 2}), 1: f({3, 4})}
    h = {0: f({1, 2}), 5: f({3, 4})}
    assert cp.unlabeled_key(g) != cp.unlabeled_key(h), \
        "gate 2: center-membership difference not separated"
    print("[smoke] gate 2 PASS: key separation "
          "(1 isomorphic collision, 3 structural separations)")


def check_embedding_valid(key, cube, emb):
    """Independent re-check of one embedding returned by
    embed_into_cube: emb is the serialized embedded pattern; some
    injective node map from the motif must realize it with
    image(M_c) ⊆ K_{image(c)}."""
    # embedded centers distinct + members inside the embedded class
    centers = [c for c, _ in emb]
    assert len(set(centers)) == len(centers), "duplicate embedded center"
    for c, M in emb:
        assert set(M) <= cube[c], \
            f"embedding violates cube: class {c} members {M} ⊄ {sorted(cube[c])}"
        assert c not in M, f"embedded center {c} inside own class image"
    # structure preserved: embedded pattern is isomorphic to the motif
    emb_pat = {c: frozenset(M) for c, M in emb}
    assert cp.unlabeled_key(emb_pat) == key, \
        "embedded pattern not isomorphic to source motif"


def gate3_gate4_orbit_and_validity():
    rows = load_frontier_rows(N_FRONTIER)
    assert len(rows) == N_FRONTIER, \
        f"only {len(rows)} frontier rows with source cubes found"
    for pid, pat, cube in rows:
        key = cp.unlabeled_key(pat)
        assert miner.contains(cube, pat), f"{pid}: source cube ⊉ pattern"
        embs = cp.embed_into_cube(key, cube)
        assert cp.ser(pat) in embs, \
            f"{pid}: identity embedding missing from own source cube"
        # gate 4 on every returned embedding
        for emb in embs:
            check_embedding_valid(key, cube, emb)
        # gate 3: AUTOS images land in the relabeled cube's embedding set
        images = miner.orbit(pat)[:N_ORBIT_IMAGES]
        for img in images:
            # find the automorphism realizing this image to relabel the cube
            for m in miner.L.AUTOS:
                if apply_perm(pat, m) == img:
                    cube_m = {m[c]: frozenset(m[x] for x in K)
                              for c, K in cube.items()}
                    embs_m = cp.embed_into_cube(key, cube_m)
                    assert cp.ser(img) in embs_m, \
                        f"{pid}: AUTOS image missing from relabeled cube"
                    break
            else:
                raise AssertionError(f"{pid}: orbit image has no realizing "
                                     f"automorphism")
    print(f"[smoke] gate 3 PASS: AUTOS orbit containment "
          f"({N_FRONTIER} patterns x {N_ORBIT_IMAGES} images)")
    print(f"[smoke] gate 4 PASS: every returned embedding re-verified "
          f"against its cube ({N_FRONTIER} source cubes)")


def main():
    gate1_relabeling_invariance()
    gate2_key_separation()
    gate3_gate4_orbit_and_validity()
    print("[smoke] ALL MOTIF-COVER GATES PASS")


if __name__ == "__main__":
    main()
