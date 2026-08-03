#!/usr/bin/env python3
"""CRT/rational-reconstruct the best-order localized certificate."""
from pathlib import Path
import re
import sympy as sp
from sympy.polys.domains import ZZ
from sympy.polys.modulargcd import _integer_rational_reconstruction

ROOT = Path(__file__).resolve().parent
VARS = sp.symbols("t bv bs bw x y")
NAMES = tuple(str(v) for v in VARS)
FILES = tuple(sorted(ROOT.glob("localized-g3-product-unit-certificate-mod*.singexpr")))
PRIMES = tuple(int(re.search(r"mod(\d+)", path.name).group(1)) for path in FILES)


def load(path, prime):
    result = []
    for row in path.read_text().splitlines():
        if "=" not in row:
            continue
        _, expression = row.rstrip(";").split("=", 1)
        terms = {}
        for raw in expression.replace("-", "+-").split("+"):
            if not raw:
                continue
            sign = -1 if raw.startswith("-") else 1
            raw = raw.lstrip("-")
            coefficient = sign
            exponents = [0] * len(VARS)
            for factor in raw.split("*"):
                if factor.isdigit():
                    coefficient *= int(factor)
                    continue
                name, _, exponent = factor.partition("^")
                exponents[NAMES.index(name)] += int(exponent or "1")
            terms[tuple(exponents)] = coefficient % prime
        result.append(terms)
    return result


def main():
    candidates = [(prime, load(path, prime)) for path, prime in zip(FILES, PRIMES)]
    base_support = [set(row) for row in candidates[0][1]]
    compatible = [(prime, data) for prime, data in candidates
                  if [set(row) for row in data] == base_support]
    excluded = [prime for prime, _ in candidates if prime not in {p for p, _ in compatible}]
    primes = tuple(prime for prime, _ in compatible)
    modular = [data for _, data in compatible]
    modulus = 1
    for prime in primes:
        modulus *= prime
    reconstructed = []
    failures = []
    for i in range(1, 8):
        rows = [data[i - 1] for data in modular]
        support = set(rows[0])
        if any(set(row) != support for row in rows[1:]):
            raise RuntimeError(f"support mismatch C{i}")
        coeffs = {}
        for monomial in support:
            residue = rows[0][monomial]
            partial_modulus = primes[0]
            for prime, row in zip(primes[1:], rows[1:]):
                residue += partial_modulus * (((row[monomial] - residue)
                                               * pow(partial_modulus, -1, prime)) % prime)
                partial_modulus *= prime
            value = _integer_rational_reconstruction(residue, modulus, ZZ)
            if value is None:
                failures.append((i, monomial, residue))
            else:
                coeffs[monomial] = sp.Rational(int(value.numerator), int(value.denominator))
        reconstructed.append(sp.Poly.from_dict(coeffs, VARS, domain=sp.QQ))
    print(f"primes={len(primes)} excluded={excluded} modulus_digits={len(str(modulus))} failures={len(failures)} terms={sum(len(p.terms()) for p in reconstructed)}")
    if failures:
        print("first_failure", failures[0])
        raise SystemExit(1)
    out = ROOT / "localized-g3-product-unit-certificate-reconstructed.singexpr"
    with out.open("w") as handle:
        for i, poly in enumerate(reconstructed, 1):
            expression = str(poly.as_expr()).replace("**", "^")
            handle.write(f"C{i}={expression};\n")
    print(out)


if __name__ == "__main__":
    main()
