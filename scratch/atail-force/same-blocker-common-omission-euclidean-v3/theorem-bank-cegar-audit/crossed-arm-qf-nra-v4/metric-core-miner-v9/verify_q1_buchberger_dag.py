#!/usr/bin/env python3
"""Independent exact replay and ancestry census for a q1 Buchberger DAG."""
from __future__ import annotations

import json
import sys
from fractions import Fraction
from pathlib import Path


def decode(rows):
    return {tuple(m): Fraction(n, d) for m, n, d in rows if n}


def add(a, b, scale=Fraction(1)):
    out = dict(a)
    for m, c in b.items():
        v = out.get(m, Fraction(0)) + scale * c
        if v:
            out[m] = v
        else:
            out.pop(m, None)
    return out


def mul(a, b):
    out = {}
    for ma, ca in a.items():
        for mb, cb in b.items():
            m = tuple(x + y for x, y in zip(ma, mb))
            out[m] = out.get(m, Fraction(0)) + ca * cb
            if not out[m]:
                out.pop(m)
    return out


def monomial(m, c):
    return {tuple(m): c}


def main():
    path = Path(sys.argv[1])
    data = json.loads(path.read_text())
    basis = [decode(p) for p in data["basis"]]
    assert len(basis) == len(data["proofs"])
    for k, proof in enumerate(data["proofs"]):
        kind = proof["kind"]
        if kind == "input":
            continue
        if kind == "seed_reduction":
            lhs = dict(basis[proof["source"]])
        elif kind == "spoly":
            i, j = proof["parents"]
            ai, aj = proof["parent_monomials"]
            ci, cj = (Fraction(*x) for x in proof["parent_coefficients"])
            lhs = add(mul(monomial(ai, ci), basis[i]),
                      mul(monomial(aj, cj), basis[j]))
        else:
            raise AssertionError((k, kind))
        for i, q in proof["reduction"]:
            assert i < k
            lhs = add(lhs, mul(decode(q), basis[i]), Fraction(-1))
        rc = Fraction(*proof["normalizer"])
        assert lhs == {m: rc * c for m, c in basis[k].items()}, (k, len(lhs))

    summaries = {}
    for name, target in data["targets"].items():
        if "reduction" not in target:
            continue
        lhs = decode(target["poly"])
        roots = set()
        for i, q in target["reduction"]:
            roots.add(i)
            lhs = add(lhs, mul(decode(q), basis[i]), Fraction(-1))
        assert not lhs, name
        ancestry = set()
        stack = list(roots)
        while stack:
            i = stack.pop()
            if i in ancestry:
                continue
            ancestry.add(i)
            p = data["proofs"][i]
            if p["kind"] == "seed_reduction":
                stack.append(p["source"])
            elif p["kind"] == "spoly":
                stack.extend(p["parents"])
            stack.extend(j for j, _ in p.get("reduction", []))
        local = []
        bits = []
        for i in ancestry:
            p = data["proofs"][i]
            local.append((2 if p["kind"] == "spoly" else 1) +
                         sum(len(q) for _, q in p.get("reduction", [])))
            for _, q in p.get("reduction", []):
                for _, n, d in q:
                    bits.extend((abs(n).bit_length(), d.bit_length()))
        summaries[name] = {
            "root_count": len(roots), "ancestry_nodes": len(ancestry),
            "derived_nodes": sum(data["proofs"][i]["kind"] != "input" for i in ancestry),
            "max_local_terms": max(local, default=0),
            "max_coefficient_bits": max(bits, default=1),
        }
    print(json.dumps({"verified": True, "basis_nodes": len(basis),
                      "targets": summaries}, sort_keys=True))


if __name__ == "__main__":
    main()
