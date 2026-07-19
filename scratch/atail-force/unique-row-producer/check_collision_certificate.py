#!/usr/bin/env python3
"""Independent exact replay of a saved forced-collision ideal lift."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path
from typing import Sequence

import sympy as sp


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
    points.extend(
        (symbols[2 * (label - 2)], symbols[2 * (label - 2) + 1])
        for label in range(2, 12)
    )
    result: list[sp.Poly] = []
    for row in rows:
        center = int(row["center"])
        support = tuple(int(point) for point in row["support"])
        if center in support or len(support) < 2 or len(set(support)) != len(support):
            raise ValueError(f"malformed row: {row}")
        reference = support[0]
        base = squared_distance(points, center, reference)
        for member in support[1:]:
            result.append(
                sp.Poly(
                    base - squared_distance(points, center, member),
                    *symbols,
                    domain=sp.QQ,
                )
            )
    return result


def smoke_gates() -> dict[str, bool]:
    z = sp.Symbol("z")
    generators = [sp.Poly(z, z), sp.Poly(z - 1, z)]
    accepted = generators[0] - generators[1] == sp.Poly(1, z)
    wrong_target_rejected = generators[0] - generators[1] != sp.Poly(z, z)
    wrong_multiplier_rejected = generators[0] + generators[1] != sp.Poly(1, z)
    if not accepted or not wrong_target_rejected or not wrong_multiplier_rejected:
        raise RuntimeError("collision checker smoke gate failed")
    return {
        "known_membership_identity_accepted": accepted,
        "wrong_target_rejected": wrong_target_rejected,
        "wrong_multiplier_rejected": wrong_multiplier_rejected,
    }


def check(path: Path) -> dict[str, object]:
    certificate = json.loads(path.read_text(encoding="utf-8"))
    if certificate["schema"] != "p97-source-indexed-saved-pattern-exact-probe-v1":
        raise ValueError("unexpected certificate schema")
    if certificate["coordinate_model"] != "p0_zero_p1_e1":
        raise ValueError("unexpected coordinate model")
    singular = certificate["singular"]
    if singular["status"] != "NONUNIT":
        raise ValueError("collision lift must come from a proper equality ideal")
    lift = singular["lift"]
    variables_raw = sp.symbols(" ".join(
        f"x{label}{coordinate}"
        for label in range(2, 12)
        for coordinate in ("x", "y")
    ))
    variables = (
        (variables_raw,) if isinstance(variables_raw, sp.Symbol) else variables_raw
    )
    recorded = [parse_polynomial(text, variables) for text in lift["generators"]]
    rebuilt = reconstructed_generators(certificate["rows"], variables)
    if recorded != rebuilt:
        raise ValueError("independently reconstructed generators disagree")
    coefficients = [
        parse_polynomial(text, variables) for text in lift["coefficients"]
    ]
    if len(coefficients) != len(recorded):
        raise ValueError("coefficient/generator count mismatch")
    points: list[tuple[sp.Expr, sp.Expr]] = [
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
    ]
    points.extend(
        (variables[2 * (label - 2)], variables[2 * (label - 2) + 1])
        for label in range(2, 12)
    )
    pair = tuple(int(point) for point in lift["pair"])
    target = sp.Poly(squared_distance(points, *pair), *variables, domain=sp.QQ)
    if parse_polynomial(lift["target"], variables) != target:
        raise ValueError("recorded target disagrees with the declared collision pair")
    total = sp.Poly(0, *variables, domain=sp.QQ)
    for coefficient, generator in zip(coefficients, recorded, strict=True):
        total += coefficient * generator
    if total != target:
        raise ValueError(f"collision lift did not replay ({len((total-target).terms())} terms)")
    coefficient_stream = "\n".join(lift["coefficients"])
    if hashlib.sha256(coefficient_stream.encode("utf-8")).hexdigest() != lift[
        "coefficient_stream_sha256"
    ]:
        raise ValueError("coefficient stream hash mismatch")
    nonzero = [coefficient for coefficient in coefficients if coefficient]
    return {
        "schema": "p97-atail-forced-collision-verification-v1",
        "verified_exact_membership_identity": True,
        "independently_reconstructed_generators": True,
        "collision_pair": list(pair),
        "certificate_file_sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "coefficient_stream_sha256": lift["coefficient_stream_sha256"],
        "statistics": {
            "generator_count": len(recorded),
            "nonzero_coefficient_count": len(nonzero),
            "total_multiplier_terms": sum(len(poly.terms()) for poly in nonzero),
            "max_multiplier_terms": max(len(poly.terms()) for poly in nonzero),
            "max_multiplier_degree": max(poly.total_degree() for poly in nonzero),
            "expanded_residual_term_count": 0,
        },
        "smoke_gates": smoke_gates(),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("certificate", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    report = check(args.certificate)
    payload = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(payload, encoding="utf-8")
    print(payload, end="")


if __name__ == "__main__":
    main()
