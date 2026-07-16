#!/usr/bin/env python3
"""Reconstruct a rational Nullstellensatz lift from modular Singular lifts."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
ANALYSIS = HERE / "analyze.py"
CHECKPOINT = HERE / "checkpoint.json"
OUTPUT = HERE / "unit_certificate_modular.json"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    for divisor in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37):
        if n % divisor == 0:
            return n == divisor
    d = n - 1
    s = 0
    while d % 2 == 0:
        d //= 2
        s += 1
    for base in (2, 3, 5, 7, 11, 13, 17):
        x = pow(base, d, n)
        if x in (1, n - 1):
            continue
        for _ in range(s - 1):
            x = x * x % n
            if x == n - 1:
                break
        else:
            return False
    return True


def primes_below(start: int, count: int) -> list[int]:
    answer = []
    candidate = start
    while len(answer) < count:
        if is_prime(candidate):
            answer.append(candidate)
        candidate -= 1
    return answer


def ratrec(a: int, modulus: int) -> Fraction | None:
    a %= modulus
    if a == 0:
        return Fraction(0)
    bound = math.isqrt(modulus // 2)
    r0, r1, t0, t1 = modulus, a, 0, 1
    while r1 > bound:
        quotient = r0 // r1
        r0, r1, t0, t1 = r1, r0 - quotient * r1, t1, t0 - quotient * t1
    if t1 == 0 or abs(t1) > bound:
        return None
    divisor = math.gcd(r1, t1)
    numerator, denominator = r1 // divisor, t1 // divisor
    if denominator < 0:
        numerator, denominator = -numerator, -denominator
    if math.gcd(denominator, modulus) != 1:
        return None
    if (numerator - a * denominator) % modulus != 0:
        return None
    return Fraction(numerator, denominator)


def crt(residues: list[int], moduli: list[int]) -> tuple[int, int]:
    value = 0
    modulus = 1
    for residue, prime in zip(residues, moduli, strict=True):
        adjustment = ((residue - value) * pow(modulus % prime, -1, prime)) % prime
        value += modulus * adjustment
        modulus *= prime
    return value % modulus, modulus


def parse_modular_poly(
    source: str, variables: tuple[sp.Symbol, ...], prime: int
) -> dict[tuple[int, ...], int]:
    local = {str(variable): variable for variable in variables}
    expression = sp.sympify(source.replace("^", "**"), locals=local)
    polynomial = sp.Poly(expression, *variables, modulus=prime)
    return {
        exponents: int(coefficient) % prime
        for exponents, coefficient in polynomial.terms()
        if coefficient
    }


def modular_lift(
    variables: tuple[sp.Symbol, ...],
    polynomials: list[str],
    prime: int,
    timeout: float,
) -> tuple[dict[tuple[int, ...], int], ...] | None:
    commands = [
        f"ring r={prime},({','.join(str(variable) for variable in variables)}),dp;",
        f"ideal I={','.join(polynomials)};",
        "matrix T;",
        'ideal G=liftstd(I,T,"slimgb");',
        "poly unit=G[1];",
        "poly scale=1/unit;",
        "poly chk=0;",
        "for (int i=1;i<=size(I);i=i+1){chk=chk+I[i]*T[i,1]*scale;}",
        'print("P97_CHECK="+string(chk));',
    ]
    commands.extend(
        f'print("P97_C_{index}="+string(T[{index},1]*scale));'
        for index in range(1, len(polynomials) + 1)
    )
    commands.append("exit;")
    try:
        process = subprocess.run(
            ["Singular", "-q"],
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return None
    if process.returncode != 0 or "P97_CHECK=1" not in process.stdout:
        return None
    coefficients: dict[int, str] = {}
    for line in process.stdout.splitlines():
        if line.startswith("P97_C_"):
            prefix, value = line.split("=", 1)
            coefficients[int(prefix.removeprefix("P97_C_"))] = value.strip()
    if set(coefficients) != set(range(1, len(polynomials) + 1)):
        return None
    return tuple(
        parse_modular_poly(coefficients[index], variables, prime)
        for index in range(1, len(polynomials) + 1)
    )


def reconstruct(
    primes: list[int],
    lifts: list[tuple[dict[tuple[int, ...], int], ...]],
) -> tuple[dict[tuple[int, ...], Fraction], ...] | None:
    answer = []
    for generator_index in range(len(lifts[0])):
        support = set().union(*(lift[generator_index] for lift in lifts))
        polynomial = {}
        for monomial in support:
            residues = [lift[generator_index].get(monomial, 0) for lift in lifts]
            value, modulus = crt(residues, primes)
            coefficient = ratrec(value, modulus)
            if coefficient is None:
                return None
            if coefficient:
                polynomial[monomial] = coefficient
        answer.append(polynomial)
    return tuple(answer)


def as_poly(
    sparse: dict[tuple[int, ...], Fraction], variables: tuple[sp.Symbol, ...]
) -> sp.Poly:
    return sp.Poly.from_dict(
        {
            exponents: sp.Rational(coefficient.numerator, coefficient.denominator)
            for exponents, coefficient in sparse.items()
        },
        variables,
        domain=sp.QQ,
    )


def serialize(poly: sp.Poly) -> str:
    terms = []
    for exponents, coefficient in poly.terms():
        factors = [
            str(variable) if exponent == 1 else f"{variable}^{exponent}"
            for variable, exponent in zip(poly.gens, exponents, strict=True)
            if exponent
        ]
        monomial = "*".join(factors)
        magnitude = abs(coefficient)
        body = (
            (("" if magnitude == 1 else f"{magnitude}*") + monomial)
            if monomial
            else str(magnitude)
        )
        terms.append(("-" if coefficient < 0 else "+") + body)
    return "".join(terms).lstrip("+") or "0"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--max-primes", type=int, default=32)
    parser.add_argument("--prime-start", type=int, default=2**31 - 1)
    parser.add_argument("--timeout", type=float, default=120.0)
    parser.add_argument(
        "--exclude",
        action="append",
        default=[],
        help="generator name to omit (repeatable; used for audited subcores)",
    )
    args = parser.parse_args()

    analysis = load_module(ANALYSIS, "p97_bank_clean_modular_analysis")
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    records = checkpoint["equality_core"]["generators"]
    unknown = set(args.exclude) - {record["name"] for record in records}
    if unknown:
        raise RuntimeError(f"unknown excluded generators: {sorted(unknown)}")
    records = [record for record in records if record["name"] not in args.exclude]
    names = [record["name"] for record in records]
    polynomial_text = [record["polynomial"] for record in records]
    source_polynomial_sha256 = analysis.canonical_sha256(polynomial_text)
    if not args.exclude and source_polynomial_sha256 != (
        analysis.EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256
    ):
        raise RuntimeError("checkpoint polynomial stream drift")
    variables = tuple(analysis.oracle.variable_symbols(14))
    local = {str(variable): variable for variable in variables}
    generators = [
        sp.Poly(
            sp.sympify(source.replace("^", "**"), locals=local),
            *variables,
            domain=sp.QQ,
        )
        for source in polynomial_text
    ]

    good_primes: list[int] = []
    lifts = []
    started = time.monotonic()
    for prime in primes_below(args.prime_start, args.max_primes * 2):
        if len(good_primes) >= args.max_primes:
            break
        lift = modular_lift(variables, polynomial_text, prime, args.timeout)
        if lift is None:
            print(f"skipped prime {prime}", flush=True)
            continue
        good_primes.append(prime)
        lifts.append(lift)
        print(
            f"prime {prime}: good lift {len(good_primes)} "
            f"({time.monotonic() - started:.1f}s)",
            flush=True,
        )
        reconstructed = reconstruct(good_primes, lifts)
        if reconstructed is None:
            continue
        coefficient_polys = [as_poly(poly, variables) for poly in reconstructed]
        total = sp.Poly(0, *variables, domain=sp.QQ)
        for coefficient, generator in zip(
            coefficient_polys, generators, strict=True
        ):
            total += coefficient * generator
        if total != sp.Poly(1, *variables, domain=sp.QQ):
            continue
        multipliers = [serialize(poly) for poly in coefficient_polys]
        identity_text = "+".join(
            f"({multiplier})*({generator})"
            for multiplier, generator in zip(
                multipliers, polynomial_text, strict=True
            )
            if multiplier != "0"
        )
        document = {
            "schema": "p97-atail-bank-clean-unit-certificate-v1",
            "target": "normalized_bank_clean_anchor_collision",
            "analysis_checkpoint_sha256": analysis.file_sha256(CHECKPOINT),
            "source_polynomial_sha256": source_polynomial_sha256,
            "excluded_generators": args.exclude,
            "variables": [str(variable) for variable in variables],
            "generator_names": names,
            "generators": polynomial_text,
            "multipliers": multipliers,
            "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
            "multiplier_term_count": sum(
                len(poly.terms()) for poly in coefficient_polys
            ),
            "raw_identity_sha256": hashlib.sha256(identity_text.encode()).hexdigest(),
            "producer": {
                "tool": "Singular modular lift plus CRT rational reconstruction",
                "primes": good_primes,
                "exact_sympy_qq_identity_check": True,
            },
        }
        args.output.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print(
            json.dumps(
                {
                    "output": str(args.output),
                    "bytes": args.output.stat().st_size,
                    "primes": len(good_primes),
                    "nonzero_multiplier_count": document[
                        "nonzero_multiplier_count"
                    ],
                    "multiplier_term_count": document["multiplier_term_count"],
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0
    raise SystemExit("no exact rational reconstruction within the prime budget")


if __name__ == "__main__":
    raise SystemExit(main())
