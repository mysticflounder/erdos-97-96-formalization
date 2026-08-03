#!/usr/bin/env python3
"""Mine a compact Buchberger DAG for the staged localized q1 branch."""
from __future__ import annotations

import json
import re
import sys
from fractions import Fraction
from pathlib import Path

import sympy as sp

ROOT = Path(__file__).resolve().parent
MINER = ROOT / "atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra-v4/metric-core-miner-v9"
sys.path.insert(0, str(MINER))
import mine_q1_buchberger_dag as base

base.VARS = sp.symbols("t br bs bu bv bw")
base.N = len(base.VARS)
divides, gcd_is_one, key, lcm, lt = base.divides, base.gcd_is_one, base.key, base.lcm, base.lt
parse_poly, quotient_monom = base.parse_poly, base.quotient_monom
MOD = 32003


def encoded_poly(p): return [[list(m), int(c), 1] for m, c in p.items()]


def modular(p):
    return {m: (int(c.numerator) * pow(int(c.denominator), -1, MOD)) % MOD for m, c in p.items()}


def add(a, b, scale=1):
    out = dict(a)
    for m, c in b.items():
        value = (out.get(m, 0) + scale * c) % MOD
        if value: out[m] = value
        else: out.pop(m, None)
    return out


def mul_term(p, m, c=1):
    return {tuple(x + y for x, y in zip(k, m)): (c * v) % MOD for k, v in p.items() if c * v % MOD}


def normal_form(f, basis):
    p = dict(f); rem = {}; qs = [{} for _ in basis]; leads = [lt(g) for g in basis]
    while p:
        m, c = lt(p); used = False
        for i, g in enumerate(basis):
            gm, gc = leads[i]
            if divides(gm, m):
                qm = quotient_monom(m, gm); qc = c * pow(gc, -1, MOD) % MOD
                qs[i][qm] = (qs[i].get(qm, 0) + qc) % MOD
                p = add(p, mul_term(g, qm, qc), -1); used = True; break
        if not used: rem[m] = c; p.pop(m)
    return rem, qs


def load_inputs():
    env = {str(v): v for v in base.VARS}
    text = (ROOT / "q1_g7_staged_localized_subsets_mod.sing").read_text()
    values = {}
    for name, rhs in re.findall(r"^poly (\w+)=(.*);$", text, flags=re.M):
        values[name] = sp.expand(sp.sympify(rhs.replace("^", "**"), locals=env | values))
    names = ("u8", "u24", "u30", "u32", "u34", "u37", "e2", "e5", "e9", "unit")
    return [modular(parse_poly(str(values[name]))) for name in names]


def main():
    basis = load_inputs()
    proofs = [{"kind": "input", "input": i + 1} for i in range(len(basis))]
    target = modular(parse_poly("br^2-br*bv+bv^2-br"))
    active = set()
    pairs = set()

    def lm(i): return lt(basis[i])[0]

    def update(ih):
        nonlocal active, pairs
        mh = lm(ih); candidates = set(active); proposed = set()
        while candidates:
            ig = min(candidates); candidates.remove(ig); big = lcm(mh, lm(ig))
            def smaller(ip): return divides(lcm(mh, lm(ip)), big)
            if (gcd_is_one(mh, lm(ig)) or
                    (not any(smaller(k) for k in candidates) and
                     not any(smaller(pair[1]) for pair in proposed))):
                proposed.add((ih, ig))
        newpairs = {tuple(sorted((a, b))) for a, b in proposed if not gcd_is_one(mh, lm(b))}
        kept = set()
        for i, j in pairs:
            lij = lcm(lm(i), lm(j))
            if not divides(mh, lij) or lcm(lm(i), mh) == lij or lcm(lm(j), mh) == lij:
                kept.add((i, j))
        pairs = kept | newpairs
        active = {i for i in active if not divides(mh, lm(i))}
        active.add(ih)

    for i in sorted(range(len(basis)), key=lambda j: key(lm(j))): update(i)
    pair_count = 0
    while pairs:
        reducers = sorted(active, key=lambda i: key(lm(i)))
        residual, qs = normal_form(target, [basis[i] for i in reducers])
        if not residual:
            target_proof = [[reducers[k], encoded_poly(q)] for k, q in enumerate(qs) if q]
            break
        i, j = min(pairs, key=lambda ij: key(lcm(lm(ij[0]), lm(ij[1]))))
        pairs.remove((i, j)); pair_count += 1
        mi, ci = lt(basis[i]); mj, cj = lt(basis[j]); common = lcm(mi, mj)
        ai, aj = quotient_monom(common, mi), quotient_monom(common, mj)
        ici, icj = pow(ci, -1, MOD), pow(cj, -1, MOD)
        s = add(mul_term(basis[i], ai, ici), mul_term(basis[j], aj, icj), -1)
        r, qs = normal_form(s, [basis[k] for k in reducers])
        if not r: continue
        _, rc = lt(r); irc = pow(rc, -1, MOD); r = {m: c * irc % MOD for m, c in r.items()}
        proofs.append({"kind": "spoly", "parents": [i, j],
            "parent_monomials": [list(ai), list(aj)],
            "parent_coefficients": [[1, ici], [1, (-icj) % MOD]],
            "reduction": [[reducers[k], encoded_poly(q)] for k, q in enumerate(qs) if q],
            "normalizer": [rc, 1]})
        basis.append(r); update(len(basis) - 1)
    else:
        raise RuntimeError("target did not reduce")
    payload = {"variables": [str(v) for v in base.VARS], "basis": [encoded_poly(p) for p in basis],
        "proofs": proofs, "target": {"poly": encoded_poly(target), "reduction": target_proof},
        "active": sorted(active), "pair_count": pair_count}
    out = ROOT / "q1-staged-localized-dag.json"
    out.write_text(json.dumps(payload, separators=(",", ":")))
    need = {i for i, _ in target_proof}; stack = list(need)
    while stack:
        i = stack.pop(); p = proofs[i]
        deps = p.get("parents", []) + [x[0] for x in p.get("reduction", [])]
        for d in deps:
            if d not in need: need.add(d); stack.append(d)
    local = [2 + sum(len(x[1]) for x in proofs[i].get("reduction", [])) for i in need if proofs[i]["kind"] == "spoly"]
    print(f"SOLVED basis={len(basis)} pairs={pair_count} target_terms={sum(len(q) for _, q in target_proof)} reachable={len(need)} helpers={len(local)} total_local={sum(local)} max_local={max(local, default=0)}")


if __name__ == "__main__": main()
