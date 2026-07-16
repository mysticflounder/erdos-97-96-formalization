#!/usr/bin/env python3
"""Independently reconstruct and replay the five-row QQ identity."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
SOURCE_CHECKPOINT = HERE.parent / "global-k4-extension" / "checkpoint.json"
DEFAULT_CERTIFICATE = HERE / "five_row_unit_certificate.json"
DEFAULT_OUTPUT = HERE / "five_row_unit_verification.json"
EXPECTED_SOURCE_SHA256 = (
    "d367dac91f6517e3576e730ca2702500a34ef163385af1f44fc34b2ff6c80e13"
)
EXPECTED_POLYNOMIAL_SHA256 = (
    "2a2968b306d27ed9f8b6f8be3b4ee19d7b438713456fa7949dcaa15131a1b5b0"
)
ROWS = (
    (0, (1, 2, 6, 7, 8)),
    (6, (1, 8, 12, 13)),
    (8, (0, 4, 7, 13)),
    (12, (0, 3, 7, 8)),
    (13, (1, 3, 9, 12)),
)
ALL_SYMBOLS = tuple(sp.symbols(" ".join(
    f"x{label}{coordinate}"
    for label in range(2, 14)
    for coordinate in ("x", "y")
)))


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def points() -> tuple[tuple[sp.Expr, sp.Expr], ...]:
    return (
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
        *((ALL_SYMBOLS[2 * (label - 2)], ALL_SYMBOLS[2 * (label - 2) + 1])
          for label in range(2, 14)),
    )


def squared_distance(left: int, right: int) -> sp.Expr:
    pts = points()
    return sp.expand(
        (pts[left][0] - pts[right][0]) ** 2
        + (pts[left][1] - pts[right][1]) ** 2
    )


def serialize(poly: sp.Poly) -> str:
    terms: list[str] = []
    for exponents, coefficient in poly.terms():
        if coefficient == 0:
            continue
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


def reconstructed_generators() -> tuple[str, ...]:
    output: list[str] = []
    for center, support in ROWS:
        pivot = support[0]
        base = squared_distance(center, pivot)
        for member in support[1:]:
            output.append(serialize(sp.Poly(
                base - squared_distance(center, member),
                *ALL_SYMBOLS,
                domain=sp.QQ,
            )))
    return tuple(output)


def parse(text: str, symbols: tuple[sp.Symbol, ...]) -> sp.Poly:
    expression = sp.sympify(
        text.replace("^", "**"),
        locals={str(symbol): symbol for symbol in symbols},
    )
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def smoke_gates() -> dict[str, bool]:
    z = sp.Symbol("z")
    accepted = parse("z", (z,)) - parse("z-1", (z,)) == parse("1", (z,))
    mutated = parse("z", (z,)) - parse("z-2", (z,)) == parse("1", (z,))
    nonunit = parse("z^2-1", (z,)) == parse("1", (z,))
    if not accepted or mutated or nonunit:
        raise RuntimeError("independent identity-checker smoke gate failed")
    return {
        "known_unit_identity_accepted": accepted,
        "mutated_identity_rejected": not mutated,
        "known_nonunit_false_identity_rejected": not nonunit,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path, nargs="?", default=DEFAULT_CERTIFICATE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    if hashlib.sha256(SOURCE_CHECKPOINT.read_bytes()).hexdigest() != EXPECTED_SOURCE_SHA256:
        raise RuntimeError("source checkpoint drift")
    source = json.loads(SOURCE_CHECKPOINT.read_text(encoding="utf-8"))
    retained = source["metric_realizability_of_one_completion"][
        "retained_unit_subsystem"
    ]
    source_rows = tuple(
        (int(row["center"]), tuple(int(x) for x in row["support"]))
        for row in retained["rows"]
    )
    if source_rows != ROWS or retained["expanded_polynomial_sha256"] != (
        EXPECTED_POLYNOMIAL_SHA256
    ):
        raise RuntimeError("source checkpoint retained subsystem drift")

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    if certificate["schema"] != "p97-atail-global-k4-five-row-unit-certificate-v1":
        raise ValueError("unexpected certificate schema")
    if certificate["coordinate_model"] != "p0_zero_p1_e1":
        raise ValueError("unexpected coordinate model")
    if certificate["source_full_equality_sha256"] != EXPECTED_POLYNOMIAL_SHA256:
        raise ValueError("certificate source hash drift")

    rebuilt_text = list(reconstructed_generators())
    if len(rebuilt_text) != 16:
        raise RuntimeError("independent reconstruction did not yield sixteen equalities")
    if canonical_sha256(rebuilt_text) != EXPECTED_POLYNOMIAL_SHA256:
        raise RuntimeError("independently reconstructed generator hash drift")
    if certificate["generators"] != rebuilt_text:
        raise ValueError("certificate generators disagree with independent reconstruction")

    variable_names = tuple(str(name) for name in certificate["variables"])
    symbol_by_name = {str(symbol): symbol for symbol in ALL_SYMBOLS}
    symbols = tuple(symbol_by_name[name] for name in variable_names)
    recorded = [parse(text, symbols) for text in certificate["generators"]]
    multipliers = [parse(text, symbols) for text in certificate["multipliers"]]
    if len(recorded) != len(multipliers):
        raise ValueError("generator/multiplier length mismatch")
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    for generator, multiplier in zip(recorded, multipliers, strict=True):
        total += generator * multiplier
    one = sp.Poly(1, *symbols, domain=sp.QQ)
    if total != one:
        raise ValueError(
            f"change-matrix identity did not replay to one; residual terms={len((total-one).terms())}"
        )

    first_nonzero = next(index for index, value in enumerate(multipliers) if value)
    mutated = multipliers.copy()
    mutated[first_nonzero] += one
    mutated_total = sp.Poly(0, *symbols, domain=sp.QQ)
    for generator, multiplier in zip(recorded, mutated, strict=True):
        mutated_total += generator * multiplier
    if mutated_total == one:
        raise RuntimeError("mutated certificate was unexpectedly accepted")

    active = [multiplier for multiplier in multipliers if multiplier]
    report = {
        "schema": "p97-atail-global-k4-five-row-unit-verification-v1",
        "verified_exact_identity": True,
        "independently_reconstructed_generators": True,
        "mutated_certificate_rejected": True,
        "source_full_equality_sha256": EXPECTED_POLYNOMIAL_SHA256,
        "certificate_file_sha256": hashlib.sha256(
            args.certificate.read_bytes()
        ).hexdigest(),
        "statistics": {
            "generator_count": len(recorded),
            "active_variable_count": len(symbols),
            "nonzero_multiplier_count": len(active),
            "total_multiplier_terms": sum(len(poly.terms()) for poly in active),
            "max_multiplier_terms": max(len(poly.terms()) for poly in active),
            "max_multiplier_degree": max(poly.total_degree() for poly in active),
            "expanded_identity_term_count": len(total.terms()),
        },
        "smoke_gates": smoke_gates(),
    }
    args.output.write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
