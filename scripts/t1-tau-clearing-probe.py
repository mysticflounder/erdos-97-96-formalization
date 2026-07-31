"""Measure the payload effect of the T1 tau-clearing on real certificates.

For a certificate with identity  sum_i C_i G_i = 1  and a Rabinowitsch
generator  R = t*D - 1, the T1 restatement substitutes t := 1/D (which zeros R)
and clears D^N:

    sum_{i != R} Chat_i G_i = D^N,    Chat_i = sum_k c_{i,k} * D^(N-k)

where c_{i,k} is the t^k slice of C_i and N = max_i deg_t(C_i) over i != R.

The question this script answers: is sum |Chat_i| (monomial count) smaller or
larger than sum |C_i|?  Multiplying a t-free slice by D^N ADDS degree, so the
direction is not obvious a priori.

Result over `certificates/endpoint/` on 2026-07-30 (all 115 tau-carrying rows;
`ep_Q2_000`/`ep_Q2_001` have no tau column and are skipped): every reconstructed
identity verifies, and the payload grows 692,276 -> 1,895,938 product monomials
(2.74x).  This is the measurement that retired T1; see
`docs/p97-certificate-bank-lift-analysis-2026-07-30.md`, "Negative result: the
T1 tau-clearing enlarges the payload".

Usage:

    ls certificates/endpoint/*.json | xargs -P 8 -n 1 \\
        uv run python scripts/t1-tau-clearing-probe.py

One line per certificate: N, generator count, coefficient and product monomial
counts before and after, and whether the cleared identity checks out.
"""

import json
import sys
import time
from pathlib import Path

import sympy
from sympy.parsing.sympy_parser import parse_expr, standard_transformations, convert_xor

TRANSFORMS = standard_transformations + (convert_xor,)


def load(path: Path):
    data = json.loads(path.read_text())
    return data["variables"], data["generators"], data["coefficients"]


def nterms(expr) -> int:
    """Monomial count of the expanded polynomial."""
    e = sympy.expand(expr)
    return len(e.as_ordered_terms()) if e != 0 else 0


def main() -> None:
    for arg in sys.argv[1:]:
        path = Path(arg)
        variables, generators, coefficients = load(path)
        syms = {v: sympy.Symbol(v) for v in variables}
        if "t" not in syms:
            print(f"{path.name}: no tau column, skipping")
            continue
        t = syms["t"]

        t0 = time.time()
        gens = [parse_expr(g, local_dict=syms, transformations=TRANSFORMS) for g in generators]
        coefs = [parse_expr(c, local_dict=syms, transformations=TRANSFORMS) for c in coefficients]

        # Locate the Rabinowitsch generator: the unique one containing t.
        rabin = [i for i, g in enumerate(gens) if g.has(t)]
        if len(rabin) != 1:
            print(f"{path.name}: {len(rabin)} t-carrying generators, skipping")
            continue
        r = rabin[0]

        # R = t*D - 1  =>  D = (R + 1)/t; recover D as the t^1 slice of R.
        D = sympy.expand(gens[r]).coeff(t, 1)

        keep = [i for i in range(len(gens)) if i != r]
        slices = {}
        for i in keep:
            p = sympy.Poly(coefs[i], t)
            deg = p.degree()
            if deg < 0:  # identically zero coefficient
                slices[i] = {0: sympy.Integer(0)}
                continue
            slices[i] = {k: p.coeff_monomial(t**k) for k in range(deg + 1)}
        N = max(max(s) for s in slices.values())

        before_c = sum(nterms(coefs[i]) for i in range(len(coefs)))
        before_prod = sum(nterms(coefs[i] * gens[i]) for i in range(len(coefs)))

        after_c = 0
        after_prod = 0
        for i in keep:
            chat = sum(c * D ** (N - k) for k, c in slices[i].items())
            after_c += nterms(chat)
            after_prod += nterms(chat * gens[i])

        # Sanity: the cleared identity must actually hold.
        lhs = sum(
            sum(c * D ** (N - k) for k, c in slices[i].items()) * gens[i] for i in keep
        )
        ok = sympy.simplify(sympy.expand(lhs - D**N)) == 0

        print(
            f"{path.name}: N={N} gens {len(gens)}->{len(keep)} "
            f"coef-terms {before_c}->{after_c} ({after_c / before_c:.2f}x) "
            f"prod-terms {before_prod}->{after_prod} ({after_prod / before_prod:.2f}x) "
            f"identity_ok={ok} [{time.time() - t0:.1f}s]"
        )


if __name__ == "__main__":
    main()
