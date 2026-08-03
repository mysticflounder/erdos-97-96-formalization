#!/usr/bin/env python3
"""Exact Buchberger proof DAG for the one-variable product localization."""
from __future__ import annotations

import json
import pickle
import sys
import sympy as sp
from gmpy2 import mpq as Fraction
import mine_q1_buchberger_dag as base

sys.set_int_max_str_digits(0)
ROOT = base.ROOT
bs, bv, bw, x, y, t = sp.symbols("bs bv bw x y t")
br, bu = sp.symbols("br bu")
base.VARS = (bs, bv, bw, x, y, t)
base.N = 6

add = base.add
divides = base.divides
encoded_poly = base.encoded_poly
gcd_is_one = base.gcd_is_one
key = base.key
lcm = base.lcm
lt = base.lt
mul_term = base.mul_term
normal_form = base.normal_form
parse_poly = base.parse_poly
quotient_monom = base.quotient_monom


def inputs():
    rows = (ROOT / "verify-generic-factor-branches-q.out").read_text().splitlines()
    found = {}
    for row in rows[:6]:
        name, value = row.split("=", 1)
        found[name] = sp.expand(sp.sympify(value.replace("^", "**"))
                                .subs({bu: bs + x, br: bv + y}))
    ordered = [found[name] for name in ("e2", "e5", "e7", "e8", "e9", "q1")]
    ordered.append(x * y * bv * bw * t - 1)
    return [parse_poly(str(p)) for p in ordered]


def main():
    original = inputs()
    basis = list(original)
    proofs = [{"kind": "input", "input": i + 1} for i in range(len(basis))]
    seeds = []
    for input_idx, p in enumerate(original):
        r, qs = normal_form(p, [basis[i] for i in seeds])
        if not r:
            continue
        _, rc = lt(r)
        monic = {m: c / rc for m, c in r.items()}
        if monic == p:
            seeds.append(input_idx)
        else:
            idx = len(basis)
            basis.append(monic)
            proofs.append({
                "kind": "seed_reduction", "source": input_idx,
                "reduction": [[seeds[k], encoded_poly(q)] for k, q in enumerate(qs) if q],
                "normalizer": [int(rc.numerator), int(rc.denominator)],
            })
            seeds.append(idx)

    active = set()
    pairs = set()

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
            big = lcm(mh, lm(ig))
            def smaller(ip):
                return divides(lcm(mh, lm(ip)), big)
            if (gcd_is_one(mh, lm(ig)) or
                    (not any(smaller(k) for k in candidates)
                     and not any(smaller(pair[1]) for pair in proposed))):
                proposed.add((ih, ig))
        newpairs = {tuple(sorted((a, b))) for a, b in proposed
                    if not gcd_is_one(mh, lm(b))}
        kept = set()
        for i, j in pairs:
            lij = lcm(lm(i), lm(j))
            if (not divides(mh, lij) or lcm(lm(i), mh) == lij
                    or lcm(lm(j), mh) == lij):
                kept.add((i, j))
        pairs = kept | newpairs
        active = {i for i in active if not divides(mh, lm(i))}
        active.add(ih)

    todo = set(seeds)
    while todo:
        i = min(todo, key=lambda j: key(lm(j)))
        todo.remove(i)
        update(i)

    pair_count = 0
    solution = None
    checkpoint_path = ROOT / "localized-g3-product-unit-proof-dag.checkpoint.pkl"

    def checkpoint():
        temporary = checkpoint_path.with_suffix(".pkl.new")
        with temporary.open("wb") as out:
            pickle.dump({"basis": basis, "proofs": proofs, "active": active,
                         "pairs": pairs, "pair_count": pair_count}, out,
                        protocol=pickle.HIGHEST_PROTOCOL)
        temporary.replace(checkpoint_path)
        print(f"CHECKPOINT B{len(basis)} pending={len(pairs)} file={checkpoint_path.name}", flush=True)

    while pairs:
        i, j = min(pairs, key=lambda ij: key(lcm(lm(ij[0]), lm(ij[1]))))
        pairs.remove((i, j))
        pair_count += 1
        print(f"PAIR {pair_count} nodes=({i},{j}) lcm={lcm(lm(i),lm(j))}", flush=True)
        mi, ci = lt(basis[i]); mj, cj = lt(basis[j]); common = lcm(mi, mj)
        ai = quotient_monom(common, mi); aj = quotient_monom(common, mj)
        s = add(mul_term(basis[i], ai, Fraction(1) / ci),
                mul_term(basis[j], aj, Fraction(1) / cj), Fraction(-1))
        reducers = sorted(active, key=lambda k: key(lm(k)))
        r, qs = normal_form(s, [basis[k] for k in reducers])
        if not r:
            continue
        _, rc = lt(r)
        r = {m: c / rc for m, c in r.items()}
        proof = {
            "kind": "spoly", "parents": [i, j],
            "parent_monomials": [list(ai), list(aj)],
            "parent_coefficients": [[int(ci.denominator), int(ci.numerator)],
                                    [int(-cj.denominator), int(cj.numerator)]],
            "reduction": [[reducers[k], encoded_poly(q)] for k, q in enumerate(qs) if q],
            "normalizer": [int(rc.numerator), int(rc.denominator)],
        }
        idx = len(basis)
        basis.append(r); proofs.append(proof); update(idx)
        local_terms = 2 + sum(len(q) for q in qs)
        print(f"B{idx+1} support={len(r)} degree={sum(lt(r)[0])} localterms={local_terms} active={len(active)} pairs={pair_count}", flush=True)
        checkpoint()
        if len(r) == 1 and next(iter(r)) == (0,) * 6:
            solution = idx
            break

    payload = {
        "variables": [str(v) for v in base.VARS],
        "basis": [encoded_poly(p) for p in basis],
        "proofs": proofs,
        "solution": solution,
        "pair_count": pair_count,
        "active": sorted(active),
    }
    path = ROOT / "localized-g3-product-unit-proof-dag.json"
    path.write_text(json.dumps(payload, separators=(",", ":")))
    print(f"DONE basis={len(basis)} pairs={pair_count} solution={solution} file={path.name}", flush=True)


if __name__ == "__main__":
    main()
