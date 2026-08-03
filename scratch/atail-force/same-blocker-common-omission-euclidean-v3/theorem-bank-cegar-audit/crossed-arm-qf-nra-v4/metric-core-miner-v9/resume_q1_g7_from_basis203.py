#!/usr/bin/env python3
"""Resume the exact Buchberger DAG checkpoint and stop when G7 reduces to zero."""
from __future__ import annotations

import json
import sys
from pathlib import Path

try:
    from gmpy2 import mpq as Fraction
except ImportError:
    from fractions import Fraction

from mine_q1_buchberger_dag import (
    add, divides, encoded_poly, gcd_is_one, key, lcm, lt, mul_term,
    normal_form, parse_poly, poly_text, quotient_monom,
)

sys.set_int_max_str_digits(0)
ROOT = Path(__file__).resolve().parent


def decode(rows):
    return {tuple(m): Fraction(n, d) for m, n, d in rows}


def main():
    source = ROOT / "q1-buchberger-proof-dag-better-basis203.json"
    state = json.loads(source.read_text())
    basis = [decode(p) for p in state["basis"]]
    proofs = state["proofs"]
    active = set(state["active_state"])
    pairs = {tuple(p) for p in state["pairs_state"]}
    pair_count = state["pair_count"]
    target = parse_poly("br^2*bs*bv-br*bs*bv^2+bs*bv^3-br*bs*bv")

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
            mg = lm(ig)
            big = lcm(mh, mg)
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
            if (not divides(mh, lij)
                    or lcm(lm(i), mh) == lij
                    or lcm(lm(j), mh) == lij):
                kept.add((i, j))
        pairs = kept | newpairs
        active = {i for i in active if not divides(mh, lm(i))}
        active.add(ih)

    while pairs:
        i, j = min(pairs, key=lambda ij: key(lcm(lm(ij[0]), lm(ij[1]))))
        pairs.remove((i, j))
        pair_count += 1
        mi, ci = lt(basis[i])
        mj, cj = lt(basis[j])
        common = lcm(mi, mj)
        ai = quotient_monom(common, mi)
        aj = quotient_monom(common, mj)
        s = add(mul_term(basis[i], ai, Fraction(1) / ci),
                mul_term(basis[j], aj, Fraction(1) / cj), Fraction(-1))
        reducers = sorted(active, key=lambda x: key(lm(x)))
        r, compact_qs = normal_form(s, [basis[x] for x in reducers])
        if not r:
            continue
        _, rc = lt(r)
        r = {m: c / rc for m, c in r.items()}
        proof = {
            "kind": "spoly",
            "parents": [i, j],
            "parent_monomials": [list(ai), list(aj)],
            "parent_coefficients": [[int(ci.denominator), int(ci.numerator)],
                                    [int(-cj.denominator), int(cj.numerator)]],
            "reduction": [[reducers[k], encoded_poly(q)]
                          for k, q in enumerate(compact_qs) if q],
            "normalizer": [int(rc.numerator), int(rc.denominator)],
        }
        new_idx = len(basis)
        basis.append(r)
        proofs.append(proof)
        update(new_idx)
        local_terms = 2 + sum(len(q) for q in compact_qs)
        print(f"B{new_idx + 1} support={len(r)} degree={sum(lt(r)[0])} "
              f"localterms={local_terms} active={len(active)} pairs={pair_count}", flush=True)

        reducers = sorted(active, key=lambda x: key(lm(x)))
        residual, qs = normal_form(target, [basis[x] for x in reducers])
        if residual:
            continue
        target_proof = [[reducers[k], encoded_poly(q)]
                        for k, q in enumerate(qs) if q]
        payload = {
            "variables": ["br", "bs", "bu", "bv", "bw"],
            "basis": [encoded_poly(p) for p in basis],
            "basis_text": [poly_text(p) for p in basis],
            "proofs": proofs,
            "targets": {"G7": {"poly": encoded_poly(target),
                                  "basis_size": len(basis),
                                  "active": reducers,
                                  "reduction": target_proof}},
            "pair_count": pair_count,
        }
        output = ROOT / "q1-buchberger-proof-dag-g7-resumed.json"
        output.write_text(json.dumps(payload, separators=(",", ":")))
        print(f"SOLVED G7 basis={len(basis)} target_terms="
              f"{sum(len(q) for _, q in target_proof)} output={output.name}", flush=True)
        return
    print(f"EXHAUSTED basis={len(basis)} pair_count={pair_count}", flush=True)


if __name__ == "__main__":
    main()
