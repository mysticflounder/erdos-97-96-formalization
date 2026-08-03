"""Find affine multiplier identities among selected staged G3 polynomials.

This uses only small exact/modular linear algebra from the Python standard
library.  It intentionally does not invoke Singular or another CAS.
"""

from __future__ import annotations

import re
from pathlib import Path
import argparse


VARS = ("br", "bs", "bu", "bv", "bw")
P = 1_000_003


def add(a, b, scale=1):
    out = dict(a)
    for mon, coeff in b.items():
        out[mon] = out.get(mon, 0) + scale * coeff
        if out[mon] == 0:
            del out[mon]
    return out


def mul(a, b):
    out = {}
    for ma, ca in a.items():
        for mb, cb in b.items():
            mon = tuple(x + y for x, y in zip(ma, mb))
            out[mon] = out.get(mon, 0) + ca * cb
    return {m: c for m, c in out.items() if c}


def power(a, n):
    out = {(0,) * len(VARS): 1}
    while n:
        if n & 1:
            out = mul(out, a)
        a = mul(a, a)
        n //= 2
    return out


class Parser:
    def __init__(self, text):
        self.tokens = re.findall(r"[A-Za-z][A-Za-z0-9_]*|\d+|[-+*^()]", text)
        self.i = 0

    def peek(self):
        return self.tokens[self.i] if self.i < len(self.tokens) else None

    def pop(self, expected=None):
        tok = self.peek()
        if expected is not None and tok != expected:
            raise ValueError((expected, tok, self.tokens[max(0, self.i - 3):self.i + 4]))
        self.i += 1
        return tok

    def expr(self):
        out = self.term()
        while self.peek() in ("+", "-"):
            op = self.pop()
            out = add(out, self.term(), 1 if op == "+" else -1)
        return out

    def term(self):
        out = self.factor()
        while self.peek() == "*":
            self.pop("*")
            out = mul(out, self.factor())
        return out

    def factor(self):
        if self.peek() == "-":
            self.pop("-")
            out = {m: -c for m, c in self.factor().items()}
        elif self.peek() == "(":
            self.pop("(")
            out = self.expr()
            self.pop(")")
        else:
            tok = self.pop()
            if tok.isdigit():
                out = {(0,) * len(VARS): int(tok)}
            else:
                mon = [0] * len(VARS)
                mon[VARS.index(tok)] = 1
                out = {tuple(mon): 1}
        if self.peek() == "^":
            self.pop("^")
            out = power(out, int(self.pop()))
        return out


def parse(text):
    parser = Parser(text)
    out = parser.expr()
    if parser.peek() is not None:
        raise ValueError(parser.tokens[parser.i:])
    return out


def solve_mod(columns, rhs, prime=P):
    mons = sorted(set(rhs).union(*(set(c) for c in columns)))
    rows = [[c.get(m, 0) % prime for c in columns] + [rhs.get(m, 0) % prime] for m in mons]
    rank = 0
    pivots = []
    for col in range(len(columns)):
        pivot = next((i for i in range(rank, len(rows)) if rows[i][col]), None)
        if pivot is None:
            continue
        rows[rank], rows[pivot] = rows[pivot], rows[rank]
        inv = pow(rows[rank][col], -1, prime)
        rows[rank] = [(x * inv) % prime for x in rows[rank]]
        for i, row in enumerate(rows):
            if i != rank and row[col]:
                q = row[col]
                rows[i] = [(x - q * y) % prime for x, y in zip(row, rows[rank])]
        pivots.append(col)
        rank += 1
    inconsistent = any(not any(row[:-1]) and row[-1] for row in rows)
    if inconsistent:
        return None, rank, len(mons)
    sol = [0] * len(columns)
    for i, col in enumerate(pivots):
        sol[col] = rows[i][-1]
    return sol, rank, len(mons)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", default="br*bs*bv*bw-br*bu*bv*bw-bs*bv^2*bw+bu*bv^2*bw")
    parser.add_argument("--max-degree", type=int, default=1)
    args = parser.parse_args()
    src = Path("scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra-v4/metric-core-miner-v9/mine-q1-staged-lifts.out")
    selected = {8, 24, 30, 32, 34, 37}
    polys = {}
    for line in src.read_text().splitlines():
        match = re.match(r"U(\d+).* poly=(.*)", line)
        if match and int(match.group(1)) in selected:
            polys[int(match.group(1))] = parse(match.group(2))
    one = {(0,) * len(VARS): 1}
    vars_as_poly = [one]
    for i in range(len(VARS)):
        mon = [0] * len(VARS)
        mon[i] = 1
        vars_as_poly.append({tuple(mon): 1})
    labels = []
    columns = []
    def monomials_of_degree_at_most(bound):
        out = []
        def rec(pos, left, exps):
            if pos == len(VARS):
                out.append(tuple(exps))
                return
            for e in range(left + 1):
                rec(pos + 1, left - e, exps + [e])
        for total in range(bound + 1):
            rec(0, total, [])
        return out
    factors = [{(0,) * len(VARS): 1}]
    for mon in monomials_of_degree_at_most(args.max_degree):
        factors.append({mon: 1})
    factors = factors[:1] + factors[1:]
    labels = []
    columns = []
    for idx in sorted(polys):
        for factor in factors:
            name = "1" if next(iter(factor)) == (0,) * len(VARS) else "*".join(
                f"{v}^{e}" if e > 1 else v for v, e in zip(VARS, next(iter(factor))) if e
            )
            labels.append(f"U{idx}*{name or '1'}")
            columns.append(mul(polys[idx], factor))
    target = parse(args.target)
    sol, rank, nrows = solve_mod(columns, target)
    print(f"target={args.target} max_degree={args.max_degree} polys={len(polys)} columns={len(columns)} equations={nrows} rank={rank}")
    if sol is None:
        print("no affine identity modulo", P)
    else:
        support = [(label, value if value <= P // 2 else value - P) for label, value in zip(labels, sol) if value]
        print("affine identity exists modulo", P, "support", len(support))
        for item in support:
            print(*item)


def lead(poly):
    """Degree-reverse-lex leading term, with br > bs > bu > bv > bw."""
    return max(poly, key=lambda m: (sum(m), tuple(-e for e in reversed(m))))


def mon_divides(a, b):
    return all(x <= y for x, y in zip(a, b))


def mon_sub(a, b):
    return tuple(x - y for x, y in zip(a, b))


def mon_lcm(a, b):
    return tuple(max(x, y) for x, y in zip(a, b))


def monomial_mul(poly, mon, coeff, prime=P):
    return {
        tuple(x + y for x, y in zip(m, mon)): (c * coeff) % prime
        for m, c in poly.items()
        if (c * coeff) % prime
    }


def mod_normalize(poly, prime=P):
    return {m: c % prime for m, c in poly.items() if c % prime}


def reduce_mod(poly, basis, prime=P):
    poly = mod_normalize(poly, prime)
    remainder = {}
    while poly:
        lm = lead(poly)
        lc = poly[lm]
        reducer = next((g for g in basis if mon_divides(lead(g), lm)), None)
        if reducer is None:
            remainder[lm] = lc
            del poly[lm]
            continue
        gm = lead(reducer)
        gc = reducer[gm]
        qmon = mon_sub(lm, gm)
        qcoeff = lc * pow(gc, -1, prime) % prime
        poly = mod_normalize(add(poly, monomial_mul(reducer, qmon, qcoeff, prime), -1), prime)
    return remainder


def buchberger_mod(generators, prime=P, pair_cap=10000):
    basis = []
    for poly in generators:
        red = reduce_mod(poly, basis, prime)
        if red:
            lc = red[lead(red)]
            basis.append(monomial_mul(red, (0,) * len(VARS), pow(lc, -1, prime), prime))
    pairs = [(i, j) for i in range(len(basis)) for j in range(i)]
    done = 0
    while pairs:
        i, j = pairs.pop(0)
        done += 1
        if done > pair_cap:
            raise RuntimeError(("pair cap", len(basis), len(pairs)))
        fi, fj = basis[i], basis[j]
        mi, mj = lead(fi), lead(fj)
        common = mon_lcm(mi, mj)
        sp = add(
            monomial_mul(fi, mon_sub(common, mi), pow(fi[mi], -1, prime), prime),
            monomial_mul(fj, mon_sub(common, mj), pow(fj[mj], -1, prime), prime),
            -1,
        )
        red = reduce_mod(sp, basis, prime)
        if red:
            lc = red[lead(red)]
            red = monomial_mul(red, (0,) * len(VARS), pow(lc, -1, prime), prime)
            k = len(basis)
            basis.append(red)
            pairs.extend((k, old) for old in range(k))
            if k % 10 == 0:
                print("basis", k + 1, "pending", len(pairs), "terms", len(red), "degree", sum(lead(red)))
    return basis, done


def modular_groebner_check():
    raw = [
        "br^2*bs^3-br^2*bs^2*bu-br^2*bs^2*bv+br^2*bs*bu*bv-br*bs^3*bu+br*bs^2*bu^2+br*bs^2*bu*bv-br*bs*bu^2*bv-br*bs*bu^2*bw+br*bs*bu*bw^2+br*bs*bv^2*bw+br*bu^2*bv*bw-br*bu*bv^2*bw-br*bu*bv*bw^2-bs*bv^2*bw^2+bu*bv^2*bw^2",
        "br^2*bs^3-br^2*bs^2*bu-br^2*bs^2*bv+br^2*bs*bu*bv+br^2*bs*bu-br^2*bu*bv-br*bs^3+br*bs^2*bu+br*bs^2*bv-br*bs*bu^2-br*bs*bu*bv+br*bu^2*bv+bs*bu*bv^2-bs*bv^2-bu^2*bv^2+bu*bv^2",
        "bs^3*bu-bs^3-bs^2*bu^2-bs^2*bu*bv+bs^2*bu+bs^2*bv+bs*bu^2*bv+bs*bu*bv-bs*bu-bs*bv^2-bu^2*bv+bu*bv",
        "bs^2*bv*bw-bs^2*bw^2+bs^2*bw-bs^2-bs*bv^2*bw+bs*bv*bw^2-bs*bv*bw+bs*bv+bv^2*bw-bv*bw",
        "br^2*bv+br*bs^2*bv-br*bs^2-br*bs*bv^2+br*bs*bv-br*bv^2-br*bv+bv^3",
        "bs^3-2*bs^2*bu-bs^2*bw+bs*bu^2+bs*bu*bw+bs*bw^2-bu^2*bw",
    ]
    generators = [parse(x) for x in raw]
    target = parse("br*bs*bv*bw-br*bu*bv*bw-bs*bv^2*bw+bu*bv^2*bw")
    basis, pairs = buchberger_mod(generators)
    rem = reduce_mod(target, basis)
    print("groebner basis", len(basis), "pairs", pairs, "target remainder terms", len(rem))


if __name__ == "__main__" and False:
    modular_groebner_check()


if __name__ == "__main__":
    main()
