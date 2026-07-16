#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Independently replay the exact QQ seven-row change-matrix identity."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import sympy as sp

import analyze_equalities as system


HERE = Path(__file__).resolve().parent
DEFAULT_CERTIFICATE = HERE / "seven_row_unit_certificate.json"
DEFAULT_OUTPUT = HERE / "seven_row_unit_verification.json"


def parse_polynomial(text: str, symbols: tuple[sp.Symbol, ...]) -> sp.Poly:
    expression = sp.sympify(
        text.replace("^", "**"),
        locals={str(symbol): symbol for symbol in symbols},
    )
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def smoke_gates() -> dict[str, bool]:
    z = sp.Symbol("z")
    accepted = sp.Poly(z, z) - sp.Poly(z - 1, z) == sp.Poly(1, z)
    mutated = sp.Poly(z, z) == sp.Poly(1, z)
    nonunit = sp.Poly(z * z - 1, z) == sp.Poly(1, z)
    if not accepted or mutated or nonunit:
        raise RuntimeError("certificate checker smoke gate failed")
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

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    if certificate["schema"] != "p97-atail-qq-change-matrix-certificate-v1":
        raise ValueError("unexpected certificate schema")
    if certificate["coordinate_model"] != "p0_zero_p1_e1":
        raise ValueError("unexpected coordinate model")
    if certificate["source_full_equality_sha256"] != (
        system.EXPECTED_POLYNOMIAL_SHA256
    ):
        raise ValueError("certificate source hash drift")
    symbols_raw = sp.symbols(" ".join(certificate["variables"]))
    symbols = (
        (symbols_raw,) if isinstance(symbols_raw, sp.Symbol) else tuple(symbols_raw)
    )
    recorded = [
        parse_polynomial(polynomial, symbols)
        for polynomial in certificate["generators"]
    ]
    rebuilt_text = [polynomial for _, polynomial in system.generators()]
    rebuilt = [parse_polynomial(polynomial, symbols) for polynomial in rebuilt_text]
    if recorded != rebuilt:
        raise ValueError("independently reconstructed generators disagree")
    if system.canonical_sha256(rebuilt_text) != system.EXPECTED_POLYNOMIAL_SHA256:
        raise ValueError("rebuilt generator hash drift")
    multipliers = [
        parse_polynomial(multiplier, symbols)
        for multiplier in certificate["multipliers"]
    ]
    if len(multipliers) != len(recorded):
        raise ValueError("generator/multiplier length mismatch")
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    for generator, multiplier in zip(recorded, multipliers):
        total += generator * multiplier
    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise ValueError(
            f"change matrix did not replay to one ({len(total.terms())} terms)"
        )
    active = [multiplier for multiplier in multipliers if multiplier]
    report = {
        "schema": "p97-atail-seven-row-qq-certificate-verification-v1",
        "verified_exact_identity": True,
        "independently_reconstructed_generators": True,
        "source_full_equality_sha256": system.EXPECTED_POLYNOMIAL_SHA256,
        "certificate_file_sha256": hashlib.sha256(
            args.certificate.read_bytes()
        ).hexdigest(),
        "statistics": {
            "generator_count": len(recorded),
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
