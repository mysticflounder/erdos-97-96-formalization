#!/usr/bin/env python3
"""Buchberger DAG with the Becker-Weispfenning critical-pair criteria."""
from __future__ import annotations

import json
import os
import sys
try:
    from gmpy2 import mpq as Fraction
except ImportError:
    from fractions import Fraction

from mine_q1_buchberger_dag import (
    ROOT, add, divides, encoded_poly, gcd_is_one, key, lcm, load_generators,
    lt, mul_term, normal_form, parse_poly, poly_text, quotient_monom,
)

sys.set_int_max_str_digits(0)


def main():
    inputs = load_generators()
    basis = list(inputs)
    proofs = [{"kind": "input", "input": i + 1} for i in range(len(basis))]
    targets = {
        "G3": parse_poly("br*bs*bv*bw-br*bu*bv*bw-bs*bv^2*bw+bu*bv^2*bw"),
        "G7": parse_poly("br^2*bs*bv-br*bs*bv^2+bs*bv^3-br*bs*bv"),
        "G39": parse_poly("br^2*bu^2*bw-br^2*bs*bw^2-br*bu^2*bw+br*bs*bw^2"),
    }
    requested = set(sys.argv[1:])
    if requested:
        unknown = requested - targets.keys()
        assert not unknown, unknown
        targets = {name: poly for name, poly in targets.items() if name in requested}

    # The reference Buchberger algorithm first autoreduces the ordered input.
    # Keep both the six original nodes and explicit local proofs of changed
    # monic/reduced seed nodes.
    seeds: list[int] = []
    for input_idx, p in enumerate(inputs):
        r, qs = normal_form(p, [basis[x] for x in seeds])
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

    active: set[int] = set()
    pairs: set[tuple[int, int]] = set()

    def lm(i):
        return lt(basis[i])[0]

    def update(ih: int):
        nonlocal active, pairs
        mh = lm(ih)
        candidates = set(active)
        proposed: set[tuple[int, int]] = set()
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
            if (not divides(mh, lij)
                    or lcm(lm(i), mh) == lij
                    or lcm(lm(j), mh) == lij):
                kept.add((i, j))
        pairs = kept | newpairs
        active = {i for i in active if not divides(mh, lm(i))}
        active.add(ih)

    # Seed in ascending leading-monomial order, matching GROEBNERNEWS2.
    todo = set(seeds)
    while todo:
        i = min(todo, key=lambda x: key(lm(x)))
        todo.remove(i)
        update(i)

    solved = {}

    def checkpoint(label: str, pair_count: int):
        reducers = sorted(active, key=lambda x: key(lm(x)))
        target_rows = {}
        for name, target in targets.items():
            rr, qs = normal_form(target, [basis[x] for x in reducers])
            target_rows[name] = {
                "poly": encoded_poly(target), **solved.get(name, {}),
                "checkpoint_residual": encoded_poly(rr),
                "checkpoint_reduction": [[reducers[k], encoded_poly(q)]
                                         for k, q in enumerate(qs) if q],
            }
        payload = {
            "variables": ["br", "bs", "bu", "bv", "bw"],
            "basis": [encoded_poly(p) for p in basis],
            "basis_text": [poly_text(p) for p in basis],
            "proofs": proofs,
            "targets": target_rows,
            "pair_count": pair_count,
            "checkpoint": label,
            "active_state": sorted(active),
            "pairs_state": [list(pair) for pair in sorted(pairs)],
        }
        path = ROOT / f"q1-buchberger-proof-dag-better-{label}.json"
        path.write_text(json.dumps(payload, separators=(",", ":")))
        print(f"CHECKPOINT {path.name}", flush=True)

    pair_count = 0
    stop_at_basis = int(os.environ.get("STOP_AT_BASIS", "0"))
    while pairs and len(solved) < len(targets):
        i, j = min(pairs, key=lambda ij: key(lcm(lm(ij[0]), lm(ij[1]))))
        pairs.remove((i, j)); pair_count += 1
        mi, ci = lt(basis[i]); mj, cj = lt(basis[j]); common = lcm(mi, mj)
        ai = quotient_monom(common, mi); aj = quotient_monom(common, mj)
        s = add(mul_term(basis[i], ai, Fraction(1) / ci),
                mul_term(basis[j], aj, Fraction(1) / cj), Fraction(-1))
        reducers = sorted(active, key=lambda x: key(lm(x)))
        r, compact_qs = normal_form(s, [basis[x] for x in reducers])
        if not r:
            continue
        _, rc = lt(r)
        r = {m: c / rc for m, c in r.items()}
        proof = {
            "kind": "spoly", "parents": [i, j],
            "parent_monomials": [list(ai), list(aj)],
            "parent_coefficients": [[int(ci.denominator), int(ci.numerator)],
                                    [int(-cj.denominator), int(cj.numerator)]],
            "reduction": [[reducers[k], encoded_poly(q)] for k, q in enumerate(compact_qs) if q],
            "normalizer": [int(rc.numerator), int(rc.denominator)],
        }
        new_idx = len(basis); basis.append(r); proofs.append(proof); update(new_idx)
        local_terms = 2 + sum(len(q) for q in compact_qs)
        print(f"B{new_idx+1} support={len(r)} degree={sum(lt(r)[0])} localterms={local_terms} active={len(active)} pairs={pair_count}", flush=True)
        if len(basis) == 203:
            checkpoint("basis203", pair_count)
        if stop_at_basis and len(basis) >= stop_at_basis:
            break
        reducers = sorted(active, key=lambda x: key(lm(x)))
        for name, target in targets.items():
            if name in solved:
                continue
            rr, tqs = normal_form(target, [basis[x] for x in reducers])
            if not rr:
                solved[name] = {
                    "basis_size": len(basis),
                    "active": reducers,
                    "reduction": [[reducers[k], encoded_poly(q)] for k, q in enumerate(tqs) if q],
                }
                print(f"SOLVED {name} basis={len(basis)} active={len(active)} terms={sum(len(q) for q in tqs)}", flush=True)
                checkpoint(name, pair_count)
    payload = {
        "variables": ["br", "bs", "bu", "bv", "bw"],
        "basis": [encoded_poly(p) for p in basis],
        "basis_text": [poly_text(p) for p in basis],
        "proofs": proofs,
        "targets": {k: {"poly": encoded_poly(v), **solved.get(k, {})} for k, v in targets.items()},
        "pair_count": pair_count,
    }
    (ROOT / "q1-buchberger-proof-dag-better.json").write_text(json.dumps(payload, separators=(",", ":")))
    print(f"DONE basis={len(basis)} active={len(active)} pairs={pair_count} solved={sorted(solved)}", flush=True)


if __name__ == "__main__":
    main()
