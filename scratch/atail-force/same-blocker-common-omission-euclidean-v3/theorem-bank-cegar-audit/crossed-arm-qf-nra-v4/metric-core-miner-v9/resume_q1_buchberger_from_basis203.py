#!/usr/bin/env python3
"""Resume the exact q1 DAG, postponing the pathological first post-B203 pair."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import ijson
from gmpy2 import mpq as Fraction

from mine_q1_buchberger_dag import (
    ROOT, add, divides, encoded_poly, gcd_is_one, key, lcm, lt, mul_term,
    normal_form, quotient_monom,
)

sys.set_int_max_str_digits(0)
SOURCE = ROOT / "q1-buchberger-proof-dag-better-basis203.json"
STALLED = (173, 202)


def one(prefix):
    with SOURCE.open("rb") as f:
        return next(ijson.items(f, prefix))


def decode(rows):
    return {tuple(m): Fraction(n, d) for m, n, d in rows if n}


def main():
    basis = []
    with SOURCE.open("rb") as f:
        for rows in ijson.items(f, "basis.item"):
            basis.append(decode(rows))
    active = set(one("active_state"))
    pairs = {tuple(x) for x in one("pairs_state")}
    pair_count = int(one("pair_count"))
    target = decode(one("targets.G3.poly"))
    new_basis = []
    new_proofs = []

    def lm(i):
        return lt(basis[i])[0]

    def update(ih):
        nonlocal active, pairs
        mh = lm(ih)
        candidates = set(active)
        proposed = set()
        while candidates:
            ig = min(candidates)
            candidates.remove(ig)
            mg = lm(ig); big = lcm(mh, mg)
            product = gcd_is_one(mh, mg)
            def smaller_divisor(ip):
                return divides(lcm(mh, lm(ip)), big)
            if product or (not any(smaller_divisor(x) for x in candidates)
                           and not any(smaller_divisor(pr[1]) for pr in proposed)):
                proposed.add((ih, ig))
        newpairs = set()
        for ih2, ig in proposed:
            if not gcd_is_one(mh, lm(ig)):
                newpairs.add(tuple(sorted((ih2, ig))))
        kept = set()
        for i, j in pairs:
            lij = lcm(lm(i), lm(j))
            if (not divides(mh, lij) or lcm(lm(i), mh) == lij
                    or lcm(lm(j), mh) == lij):
                kept.add((i, j))
        pairs = kept | newpairs
        active = {i for i in active if not divides(mh, lm(i))}
        active.add(ih)

    def write_checkpoint(label, reduction=None):
        payload = {
            "source": SOURCE.name, "variables": ["br", "bs", "bu", "bv", "bw"],
            "new_basis_start": 203, "new_basis": [encoded_poly(p) for p in new_basis],
            "new_proofs": new_proofs, "active_state": sorted(active),
            "pairs_state": [list(p) for p in sorted(pairs)], "pair_count": pair_count,
            "target_poly": encoded_poly(target), "target_reduction": reduction,
            "checkpoint": label,
        }
        path = ROOT / f"q1-buchberger-proof-dag-resume-{label}.json"
        path.write_text(json.dumps(payload, separators=(",", ":")))
        print("CHECKPOINT", path.name, flush=True)

    while pairs:
        # Valid arbitrary critical-pair order: try every other pair before the
        # empirically pathological first post-B203 pair.
        i, j = min(pairs, key=lambda ij: (ij == STALLED,
                         key(lcm(lm(ij[0]), lm(ij[1])))))
        pairs.remove((i, j)); pair_count += 1
        mi, ci = lt(basis[i]); mj, cj = lt(basis[j]); common = lcm(mi, mj)
        ai = quotient_monom(common, mi); aj = quotient_monom(common, mj)
        s = add(mul_term(basis[i], ai, Fraction(1) / ci),
                mul_term(basis[j], aj, Fraction(1) / cj), Fraction(-1))
        reducers = sorted(active, key=lambda x: key(lm(x)))
        r, qs = normal_form(s, [basis[x] for x in reducers])
        if not r:
            print("ZERO", (i, j), "pair", pair_count, flush=True)
            continue
        _, rc = lt(r)
        r = {m: c / rc for m, c in r.items()}
        idx = len(basis)
        proof = {
            "index": idx, "kind": "spoly", "parents": [i, j],
            "parent_monomials": [list(ai), list(aj)],
            "parent_coefficients": [[int(ci.denominator), int(ci.numerator)],
                                    [int(-cj.denominator), int(cj.numerator)]],
            "reduction": [[reducers[k], encoded_poly(q)] for k, q in enumerate(qs) if q],
            "normalizer": [int(rc.numerator), int(rc.denominator)],
        }
        basis.append(r); new_basis.append(r); new_proofs.append(proof); update(idx)
        print(f"B{idx+1} pair={(i,j)} support={len(r)} localterms={2+sum(len(q) for q in qs)} active={len(active)}", flush=True)
        reducers = sorted(active, key=lambda x: key(lm(x)))
        rr, tqs = normal_form(target, [basis[x] for x in reducers])
        reduction = [[reducers[k], encoded_poly(q)] for k, q in enumerate(tqs) if q]
        write_checkpoint(f"B{idx+1}", reduction if not rr else None)
        if not rr:
            print("SOLVED G3", "basis", len(basis), "terms", sum(len(q) for q in tqs), flush=True)
            return


if __name__ == "__main__":
    main()
