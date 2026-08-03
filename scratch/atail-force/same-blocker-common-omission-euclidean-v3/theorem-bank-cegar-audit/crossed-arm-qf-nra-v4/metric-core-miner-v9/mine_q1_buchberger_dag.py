#!/usr/bin/env python3
"""Mine a non-flattened exact Buchberger proof DAG for G3/G7/G39."""
from __future__ import annotations

import heapq
import json
import re
try:
    from gmpy2 import mpq as Fraction
except ImportError:
    from fractions import Fraction
from pathlib import Path

import sympy as sp

ROOT = Path(__file__).resolve().parent
VARS = sp.symbols("br bs bu bv bw")
N = len(VARS)
Poly = dict[tuple[int, ...], Fraction]


def key(m):
    return (sum(m),) + tuple(-m[i] for i in range(N - 1, -1, -1))


def lt(p: Poly):
    m = max(p, key=key)
    return m, p[m]


def add(a: Poly, b: Poly, scale=Fraction(1)) -> Poly:
    out = dict(a)
    for m, c in b.items():
        v = out.get(m, Fraction(0)) + scale * c
        if v:
            out[m] = v
        else:
            out.pop(m, None)
    return out


def mul_term(p: Poly, m, c=Fraction(1)) -> Poly:
    return {tuple(x + y for x, y in zip(k, m)): c * v for k, v in p.items() if c * v}


def divides(a, b):
    return all(x <= y for x, y in zip(a, b))


def quotient_monom(b, a):
    return tuple(x - y for x, y in zip(b, a))


def lcm(a, b):
    return tuple(max(x, y) for x, y in zip(a, b))


def gcd_is_one(a, b):
    return all(min(x, y) == 0 for x, y in zip(a, b))


def normal_form(f: Poly, basis: list[Poly]):
    p = dict(f)
    rem: Poly = {}
    qs: list[Poly] = [{} for _ in basis]
    leads = [lt(g) for g in basis]
    while p:
        m, c = lt(p)
        used = False
        for i, g in enumerate(basis):
            gm, gc = leads[i]
            if divides(gm, m):
                qm = quotient_monom(m, gm)
                qc = c / gc
                qs[i][qm] = qs[i].get(qm, Fraction(0)) + qc
                p = add(p, mul_term(g, qm, qc), Fraction(-1))
                used = True
                break
        if not used:
            rem[m] = c
            p.pop(m)
    return rem, qs


def parse_poly(s: str) -> Poly:
    e = sp.sympify(s.replace("^", "**"), locals={str(v): v for v in VARS})
    p = sp.Poly(e, *VARS, domain=sp.QQ)
    return {m: Fraction(int(c.p), int(c.q)) for m, c in p.terms()}


def poly_text(p: Poly) -> str:
    terms = []
    for m in sorted(p, key=key, reverse=True):
        c = p[m]
        mon = "*".join(str(VARS[i]) + (f"^{e}" if e != 1 else "") for i, e in enumerate(m) if e)
        if not mon:
            mon = "1"
        terms.append(f"{c}*{mon}")
    return "+".join(terms).replace("+-", "-") or "0"


def encoded_poly(p: Poly):
    return [[list(m), int(c.numerator), int(c.denominator)] for m, c in p.items()]


def load_generators():
    txt = (ROOT / "mine-q1-low-term-consequences-q.out").read_text()
    block = txt.split("Q1_GENERATOR_FACTORIZATIONS", 1)[1].split("BR_EQ_BW_GB_SIZE", 1)[0]
    found = re.findall(r"H([1-6])\n.*?_\[2\]=(.*?)\n\[2\]:", block, flags=re.S)
    assert len(found) == 6, len(found)
    return [parse_poly(s.strip()) for _, s in found]


def main():
    basis = load_generators()
    proofs = [{"kind": "input", "input": i + 1} for i in range(len(basis))]
    targets = {
        "G3": parse_poly("br*bs*bv*bw-br*bu*bv*bw-bs*bv^2*bw+bu*bv^2*bw"),
        "G7": parse_poly("br^2*bs*bv-br*bs*bv^2+bs*bv^3-br*bs*bv"),
        "G39": parse_poly("br^2*bu^2*bw-br^2*bs*bw^2-br*bu^2*bw+br*bs*bw^2"),
    }
    queue = []
    serial = 0
    for i in range(len(basis)):
        for j in range(i):
            a, b = lt(basis[i])[0], lt(basis[j])[0]
            if not gcd_is_one(a, b):
                heapq.heappush(queue, (sum(lcm(a, b)), serial, j, i))
                serial += 1
    solved = {}
    pairs = 0
    while queue and len(solved) < len(targets):
        _, _, i, j = heapq.heappop(queue)
        pairs += 1
        mi, ci = lt(basis[i]); mj, cj = lt(basis[j]); lm = lcm(mi, mj)
        ai = quotient_monom(lm, mi); aj = quotient_monom(lm, mj)
        s = add(mul_term(basis[i], ai, Fraction(1, 1) / ci),
                mul_term(basis[j], aj, Fraction(1, 1) / cj), Fraction(-1))
        r, qs = normal_form(s, basis)
        if not r:
            continue
        rm, rc = lt(r)
        r = {m: c / rc for m, c in r.items()}
        proof = {
            "kind": "spoly",
            "parents": [i, j],
            "parent_terms": [[list(ai), [1, 1] if ci == 1 else [ci.denominator, ci.numerator]],
                              [list(aj), [-1, 1] if cj == 1 else [-cj.denominator, cj.numerator]]],
            "reduction": [[k, encoded_poly(q)] for k, q in enumerate(qs) if q],
            "normalizer": [rc.numerator, rc.denominator],
        }
        new_idx = len(basis)
        basis.append(r); proofs.append(proof)
        for k in range(new_idx):
            a, b = lt(basis[k])[0], rm
            if not gcd_is_one(a, b):
                heapq.heappush(queue, (sum(lcm(a, b)), serial, k, new_idx)); serial += 1
        local_terms = 2 + sum(len(q) for q in qs)
        print(f"B{new_idx+1} support={len(r)} degree={sum(rm)} localterms={local_terms} pairs={pairs}", flush=True)
        for name, target in targets.items():
            if name in solved:
                continue
            rr, tqs = normal_form(target, basis)
            if not rr:
                solved[name] = {"basis_size": len(basis), "reduction": [[k, encoded_poly(q)] for k, q in enumerate(tqs) if q]}
                print(f"SOLVED {name} basis={len(basis)} terms={sum(len(q) for q in tqs)}", flush=True)
    payload = {
        "variables": [str(v) for v in VARS],
        "basis": [encoded_poly(p) for p in basis],
        "basis_text": [poly_text(p) for p in basis],
        "proofs": proofs,
        "targets": {k: {"poly": encoded_poly(v), **solved.get(k, {})} for k, v in targets.items()},
        "pair_count": pairs,
    }
    (ROOT / "q1-buchberger-proof-dag.json").write_text(json.dumps(payload, separators=(",", ":")))
    print(f"DONE basis={len(basis)} pairs={pairs} solved={sorted(solved)}", flush=True)


if __name__ == "__main__":
    main()
