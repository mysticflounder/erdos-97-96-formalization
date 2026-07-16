#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Reconstruct and shrink the normalized seven-row equality system.

This is theorem-discovery support.  It independently expands the exact seven
selected rows after fixing point 0 to `(0,0)` and point 1 to `(1,0)`, checks
the pinned 21-polynomial hash, and greedily deletes individual equalities only
when msolve over QQ reports UNIT in both variable orders.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import tempfile
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
EXPECTED_POLYNOMIAL_SHA256 = (
    "1efeea69810bbff6fa00ab5719b620a4bde75b11dd91dad5c9791cec54737d4e"
)
ROWS = (
    (1, (0, 2, 6, 7)),
    (2, (0, 1, 9, 10)),
    (7, (2, 5, 9, 11)),
    (8, (0, 3, 5, 7)),
    (9, (3, 6, 8, 11)),
    (10, (1, 7, 8, 9)),
    (11, (1, 5, 6, 10)),
)
VARIABLES = sp.symbols(" ".join(
    f"x{label}{coordinate}"
    for label in range(2, 12)
    for coordinate in ("x", "y")
))


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def points() -> tuple[tuple[sp.Expr, sp.Expr], ...]:
    result: list[tuple[sp.Expr, sp.Expr]] = [
        (sp.Integer(0), sp.Integer(0)),
        (sp.Integer(1), sp.Integer(0)),
    ]
    result.extend(
        (VARIABLES[2 * (label - 2)], VARIABLES[2 * (label - 2) + 1])
        for label in range(2, 12)
    )
    return tuple(result)


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
            for variable, exponent in zip(poly.gens, exponents)
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


def generators() -> tuple[tuple[str, str], ...]:
    output: list[tuple[str, str]] = []
    for center, support in ROWS:
        pivot = support[0]
        base = squared_distance(center, pivot)
        for member in support[1:]:
            polynomial = sp.Poly(
                base - squared_distance(center, member),
                *VARIABLES,
                domain=sp.QQ,
            )
            output.append((f"ROW_{center}_{pivot}_{member}", serialize(polynomial)))
    return tuple(output)


def msolve_unit(polynomials: list[str], variables: tuple[str, ...]) -> bool:
    content = ",".join(variables) + "\n0\n" + ",\n".join(polynomials) + "\n"
    with tempfile.TemporaryDirectory(prefix="p97-seven-row-msolve-") as tmp:
        input_path = Path(tmp) / "input.ms"
        output_path = Path(tmp) / "output.txt"
        input_path.write_text(content, encoding="utf-8")
        process = subprocess.run(
            ["msolve", "-f", str(input_path), "-o", str(output_path), "-t", "1"],
            capture_output=True,
            text=True,
            timeout=60,
            check=False,
        )
        if process.returncode != 0:
            raise RuntimeError(process.stderr or process.stdout)
        output = output_path.read_text(encoding="utf-8").strip()
    return output.startswith("[-1]:") or output == "[-1]"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=HERE / "equality_analysis.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    named = generators()
    polynomial_text = [polynomial for _, polynomial in named]
    digest = canonical_sha256(polynomial_text)
    if digest != EXPECTED_POLYNOMIAL_SHA256:
        raise AssertionError(f"expected {EXPECTED_POLYNOMIAL_SHA256}, found {digest}")

    variable_names = tuple(str(variable) for variable in VARIABLES)
    retained = list(range(len(named)))
    for index in tuple(retained):
        proposal = [item for item in retained if item != index]
        polynomials = [named[item][1] for item in proposal]
        if (
            msolve_unit(polynomials, variable_names)
            and msolve_unit(polynomials, tuple(reversed(variable_names)))
        ):
            retained = proposal

    deletion_results = []
    for index in retained:
        proposal = [item for item in retained if item != index]
        polynomials = [named[item][1] for item in proposal]
        deletion_results.append({
            "deleted": named[index][0],
            "forward_unit": msolve_unit(polynomials, variable_names),
            "reverse_unit": msolve_unit(polynomials, tuple(reversed(variable_names))),
        })
    document = {
        "schema": "p97-atail-seven-row-equality-analysis-v1",
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in ROWS
        ],
        "expanded_polynomial_count": len(named),
        "expanded_polynomial_sha256": digest,
        "generator_names": [name for name, _ in named],
        "retained_generator_names": [named[index][0] for index in retained],
        "retained_generator_count": len(retained),
        "retained_polynomials": [named[index][1] for index in retained],
        "retained_polynomial_sha256": canonical_sha256(
            [named[index][1] for index in retained]
        ),
        "single_deletion_results": deletion_results,
        "scope": {
            "normalized_complex_equality_ideal_only": True,
            "msolve_forward_reverse_qq": True,
            "lean_proof": False,
        },
    }
    if args.check:
        if json.loads(args.output.read_text(encoding="utf-8")) != document:
            raise AssertionError("saved equality analysis drift")
    else:
        args.output.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps({
        "retained_generator_count": len(retained),
        "retained_generator_names": document["retained_generator_names"],
        "expanded_polynomial_sha256": digest,
    }, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
