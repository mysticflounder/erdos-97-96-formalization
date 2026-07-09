#!/usr/bin/env python3
"""Generalized-cover probe (motif-level exclusion), conditional on the
motif-transfer claim (scaled validation: motif_transfer.py).

Question: if every banked dead pattern excludes not just its AUTOS orbit
(role-respecting, order 72) but EVERY candidate-feasible injective
embedding of its unlabeled motif into the 11 points, does the (5,5,4)
cube space go UNSAT?

  UNSAT  -> a coverage theorem whose only unproven hypothesis is
            motif-transfer (a variable-renaming/similarity argument),
            instead of an open-ended CEGAR row race.
  SAT    -> the printed witness cube admits NO embedding of ANY known
            dead motif — the residual frontier is genuinely new
            structure, and motif generalization alone cannot close it.

Method is lazy clause generation (eager enumeration measured at 40k-200k
embeddings per motif x ~1322 motifs — infeasible): solve the banked
instance, take the witness cube, embed every dead motif into that cube
(pure combinatorics: image(M_c) ⊆ K_{image(c)}), add each embedded
pattern + its AUTOS orbit as exclusion clauses, iterate.

Smoke gates (cover_probe_smoke.py, 2026-07-08): unlabeled_key invariant
under 75 random relabelings; distinct structures distinct keys; AUTOS
orbits contained in motif embedding sets (5/5).

Read-only wrt bank.jsonl; independent of the running CEGAR driver.
"""
import json
import sys
import time
from itertools import permutations

sys.path.insert(0, ".")
import miner  # noqa: E402
import sat_cover  # noqa: E402

CNF_PATH = ("/private/tmp/claude-501/-Users-adam-projects-math-projects-"
            "erdos-97-96-formalization/fe6e52a9-1de1-4034-b676-5c7e83aecbac/"
            "scratchpad/cover_probe.cnf")


def load_bank():
    pats = []
    with open("bank.jsonl") as f:
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            try:
                r = json.loads(ln)
            except json.JSONDecodeError:
                continue  # racing the live appender on the last line
            pats.append({int(c): frozenset(M) for c, M in r["pattern"].items()})
    return pats


def support(pat):
    s = set(pat)
    for M in pat.values():
        s |= M
    return sorted(s)


def _invariant(pat, p):
    out_deg = len(pat.get(p, ()))
    in_deg = sum(1 for M in pat.values() if p in M)
    memb = tuple(sorted(len(M) for c, M in pat.items() if p in M))
    return (out_deg, in_deg, memb)


def unlabeled_key(pat):
    """Canonical serialized form under all support bijections consistent
    with the invariant partition (min over consistent relabelings)."""
    sup = support(pat)
    inv = {p: _invariant(pat, p) for p in sup}
    blocks = {}
    for p in sup:
        blocks.setdefault(inv[p], []).append(p)
    keys = sorted(blocks)
    best = None

    def rec(bi, label_of, next_label):
        nonlocal best
        if bi == len(keys):
            ser = tuple(sorted(
                (label_of[c], tuple(sorted(label_of[p] for p in M)))
                for c, M in pat.items()))
            if best is None or ser < best:
                best = ser
            return
        for perm in permutations(blocks[keys[bi]]):
            lo = dict(label_of)
            nl = next_label
            for p in perm:
                lo[p] = nl
                nl += 1
            rec(bi + 1, lo, nl)

    rec(0, {}, 0)
    return best


def embed_into_cube(key, cube):
    """All injective embeddings of canonical motif `key` into the fixed
    cube {c: frozenset K_c}: image(M_c) ⊆ K_{image(c)} for every center.
    Returns a set of serialized embedded patterns."""
    centers = {c: frozenset(M) for c, M in key}
    nodes = sorted({c for c, _ in key} | {p for _, M in key for p in M})
    order = sorted(nodes,
                   key=lambda n: -(len(centers.get(n, ())) +
                                   (100 if n in centers else 0)))

    def ok(assign):
        for c, M in centers.items():
            if c not in assign:
                continue
            K = cube[assign[c]]
            for m in M:
                if m in assign and assign[m] not in K:
                    return False
        return True

    out = set()
    assign = {}
    used = set()

    def rec(i):
        if i == len(order):
            out.add(tuple(sorted((assign[c], tuple(sorted(assign[p] for p in M)))
                                 for c, M in centers.items())))
            return
        n = order[i]
        for t in range(11):
            if t in used:
                continue
            assign[n] = t
            used.add(t)
            if ok(assign):
                rec(i + 1)
            del assign[n]
            used.discard(t)

    rec(0)
    return out


def ser(pat):
    return tuple(sorted((c, tuple(sorted(M))) for c, M in pat.items()))


def main():
    max_iters = int(sys.argv[1]) if len(sys.argv) > 1 else 20000
    wall = int(sys.argv[2]) if len(sys.argv) > 2 else 14400
    t0 = time.time()

    pats = load_bank()
    print(f"[A] bank rows parsed: {len(pats)}", flush=True)
    motifs = {}
    for pat in pats:
        motifs.setdefault(unlabeled_key(pat), True)
    motif_keys = sorted(motifs)
    print(f"[A] unlabeled motif classes: {len(motif_keys)} "
          f"({time.time()-t0:.0f}s)", flush=True)

    inst = sat_cover.CoverInstance()
    added = set()
    for pat in pats:
        for img in miner.orbit(pat):
            s = ser(img)
            if s not in added:
                added.add(s)
                inst.add_pattern_instance(img)
    print(f"[B] seeded {len(added)} banked orbit instances "
          f"({time.time()-t0:.0f}s)", flush=True)

    it = 0
    while it < max_iters and time.time() - t0 < wall:
        it += 1
        res, cube = inst.solve(CNF_PATH, timeout=3600)
        if res == "UNSAT":
            print(f"[C] iter {it}: UNSAT — coverage closes modulo the "
                  f"motif-transfer lemma ({time.time()-t0:.0f}s, "
                  f"{len(added)} instances total)", flush=True)
            return
        if res != "SAT":
            print(f"[C] iter {it}: solver {res} — abort", flush=True)
            return
        fcube = {c: frozenset(K) for c, K in cube.items()}
        found = set()
        for key in motif_keys:
            found |= embed_into_cube(key, fcube)
        found = {s for s in found if s not in added}
        if not found:
            print(f"[C] iter {it}: FRONTIER CUBE — no known dead motif "
                  f"embeds. cube="
                  f"{json.dumps({str(c): cube[c] for c in sorted(cube)})}",
                  flush=True)
            print(f"[C] probe verdict: SAT after {len(added)} instances "
                  f"({time.time()-t0:.0f}s) — motif generalization does "
                  f"not close coverage by itself", flush=True)
            return
        n_new = 0
        for s in found:
            pat = {c: frozenset(M) for c, M in s}
            for img in miner.orbit(pat):
                si = ser(img)
                if si not in added:
                    added.add(si)
                    inst.add_pattern_instance(img)
                    n_new += 1
        print(f"[C] iter {it}: +{len(found)} embeddings "
              f"(+{n_new} orbit instances, total {len(added)}) "
              f"({time.time()-t0:.0f}s)", flush=True)
    print(f"[C] budget exhausted at iter {it} ({time.time()-t0:.0f}s, "
          f"{len(added)} instances) — INCONCLUSIVE", flush=True)


if __name__ == "__main__":
    main()
