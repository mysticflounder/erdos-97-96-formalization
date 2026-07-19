#!/usr/bin/env python3
"""Independent exact replay of the owned five-row QQ certificate."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path
from typing import Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
DEFAULT_CERTIFICATE = HERE / "unit_core_654_05_certificate.json"


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def parse_polynomial(text: str, symbols: Sequence[sp.Symbol]) -> sp.Poly:
    compact = text.replace(" ", "")
    if compact == "0":
        return sp.Poly(0, *symbols, domain=sp.QQ)
    if "(" in compact or ")" in compact:
        raise ValueError("streaming polynomial parser requires expanded terms")
    symbol_index = {str(symbol): index for index, symbol in enumerate(symbols)}
    coefficients: dict[tuple[int, ...], sp.Rational] = {}
    for raw_term in re.findall(r"[+-]?[^+-]+", compact):
        sign = -1 if raw_term.startswith("-") else 1
        body = raw_term[1:] if raw_term[:1] in "+-" else raw_term
        coefficient = sp.Rational(sign)
        exponents = [0] * len(symbols)
        for factor in body.split("*"):
            base, separator, exponent_text = factor.partition("^")
            if base in symbol_index:
                exponent = int(exponent_text) if separator else 1
                exponents[symbol_index[base]] += exponent
            else:
                if separator:
                    raise ValueError(f"unexpected powered scalar factor: {factor}")
                coefficient *= sp.Rational(base)
        key = tuple(exponents)
        coefficients[key] = coefficients.get(key, sp.Rational(0)) + coefficient
    return sp.Poly.from_dict(coefficients, symbols, domain=sp.QQ)


def squared_distance(
    points: Sequence[tuple[sp.Expr, sp.Expr]], left: int, right: int
) -> sp.Expr:
    return sp.expand(
        (points[left][0] - points[right][0]) ** 2
        + (points[left][1] - points[right][1]) ** 2
    )


def reconstructed_generators(
    rows: Sequence[dict[str, object]], symbols: Sequence[sp.Symbol]
) -> list[sp.Poly]:
    points: list[tuple[sp.Expr, sp.Expr]] = [
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
    ]
    points.extend((symbols[2 * (i - 2)], symbols[2 * (i - 2) + 1])
                  for i in range(2, 12))
    result: list[sp.Poly] = []
    for row in rows:
        center = int(row["center"])
        support = tuple(int(x) for x in row["support"])
        if len(support) < 2 or center in support or len(set(support)) != len(support):
            raise ValueError(f"malformed row {row}")
        pivot = support[0]
        base = squared_distance(points, center, pivot)
        for member in support[1:]:
            result.append(sp.Poly(
                base - squared_distance(points, center, member),
                *symbols,
                domain=sp.QQ,
            ))
    return result


def smoke_gates() -> dict[str, bool]:
    z = sp.Symbol("z")
    unit = sp.Poly(z, z) - sp.Poly(z - 1, z) == sp.Poly(1, z)
    mutated = sp.Poly(z, z) == sp.Poly(1, z)
    false_nonunit = sp.Poly(z * z - 1, z) == sp.Poly(1, z)
    if not unit or mutated or false_nonunit:
        raise RuntimeError("independent checker smoke gate failed")
    return {
        "known_unit_identity_accepted": unit,
        "mutated_unit_identity_rejected": not mutated,
        "known_nonunit_false_identity_rejected": not false_nonunit,
    }


def check(path: Path) -> dict[str, object]:
    certificate = json.loads(path.read_text(encoding="utf-8"))
    if certificate["schema"] != "p97-atail-qq-change-matrix-certificate-v1":
        raise ValueError("unexpected certificate schema")
    if certificate["coordinate_model"] != "p0_zero_p1_e1":
        raise ValueError("unexpected coordinate model")
    symbols_raw = sp.symbols(" ".join(certificate["variables"]))
    symbols = (symbols_raw,) if isinstance(symbols_raw, sp.Symbol) else symbols_raw
    if tuple(str(x) for x in symbols) != tuple(
        f"x{i}{c}" for i in range(2, 12) for c in ("x", "y")
    ):
        raise ValueError("variable order drifted")
    recorded_generators = [
        parse_polynomial(text, symbols) for text in certificate["generators"]
    ]
    rebuilt_generators = reconstructed_generators(certificate["rows"], symbols)
    if recorded_generators != rebuilt_generators:
        raise ValueError("independently reconstructed generator stream disagrees")
    if sha256_text("\n".join(certificate["generators"])) != certificate[
        "generator_stream_sha256"
    ]:
        raise ValueError("generator stream hash mismatch")
    multipliers = [
        parse_polynomial(text, symbols) for text in certificate["multipliers"]
    ]
    if len(multipliers) != len(recorded_generators):
        raise ValueError("generator/multiplier length mismatch")
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    for generator, multiplier in zip(recorded_generators, multipliers):
        total += generator * multiplier
    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise ValueError(f"certificate did not replay to one ({len(total.terms())} terms)")
    nonzero = [multiplier for multiplier in multipliers if multiplier]
    return {
        "schema": "p97-atail-qq-change-matrix-verification-v1",
        "verified_exact_identity": True,
        "independently_reconstructed_generators": True,
        "certificate_file_sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "generator_stream_sha256": certificate["generator_stream_sha256"],
        "statistics": {
            "generator_count": len(recorded_generators),
            "nonzero_multiplier_count": len(nonzero),
            "total_multiplier_terms": sum(len(poly.terms()) for poly in nonzero),
            "max_multiplier_terms": max(len(poly.terms()) for poly in nonzero),
            "max_multiplier_degree": max(poly.total_degree() for poly in nonzero),
            "expanded_identity_term_count": len(total.terms()),
        },
        "smoke_gates": smoke_gates(),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("certificate", type=Path, nargs="?", default=DEFAULT_CERTIFICATE)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    report = check(args.certificate)
    if args.output is not None:
        args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                               encoding="utf-8")
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
