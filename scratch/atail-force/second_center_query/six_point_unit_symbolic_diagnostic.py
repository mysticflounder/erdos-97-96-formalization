#!/usr/bin/env python3
"""Diagnose the six-point equality core behind the (5,5,5) UNIT result.

The equality minimizer leaves the following metric pattern on six labels
``A,B,C,D,E,F``.  This script fixes only translation and rotation,

    A = (0, 0),  B = (s, 0),

keeps the scale ``s`` symbolic, computes a lexicographic Groebner basis over
QQ, and reports the pure-scale consequences.  A power of ``s`` in the ideal
is evidence that the invariant theorem should conclude ``A = B`` rather than
state a normalized coordinate contradiction.

This is a theorem-discovery diagnostic, not a replayed proof certificate.
"""

from __future__ import annotations

import hashlib
import json

import sympy as sp


SCHEMA = "p97-atail-six-point-unit-symbolic-diagnostic-v1"


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def squared_distance(
    left: tuple[sp.Expr, sp.Expr], right: tuple[sp.Expr, sp.Expr]
) -> sp.Expr:
    return sp.expand(
        (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2
    )


def main() -> int:
    s, cx, cy, dx, dy, ex, ey, fx, fy = sp.symbols(
        "s cx cy dx dy ex ey fx fy"
    )
    points = {
        "A": (sp.Integer(0), sp.Integer(0)),
        "B": (s, sp.Integer(0)),
        "C": (cx, cy),
        "D": (dx, dy),
        "E": (ex, ey),
        "F": (fx, fy),
    }

    def d(left: str, right: str) -> sp.Expr:
        return squared_distance(points[left], points[right])

    named_equalities = [
        ("BA=BC", d("B", "A") - d("B", "C")),
        ("BA=BD", d("B", "A") - d("B", "D")),
        ("CA=CB", d("C", "A") - d("C", "B")),
        ("CA=CE", d("C", "A") - d("C", "E")),
        ("CA=CF", d("C", "A") - d("C", "F")),
        ("DC=DE", d("D", "C") - d("D", "E")),
        ("EA=EF", d("E", "A") - d("E", "F")),
        ("FB=FD", d("F", "B") - d("F", "D")),
        ("FB=FE", d("F", "B") - d("F", "E")),
    ]
    # Put s last so lexicographic elimination exposes polynomials in s alone.
    variables = (cx, cy, dx, dy, ex, ey, fx, fy, s)
    basis = sp.groebner(
        [polynomial for _, polynomial in named_equalities],
        *variables,
        order="lex",
        domain=sp.QQ,
    )
    serialized_basis = [
        str(sp.expand(polynomial.as_expr())) for polynomial in basis.polys
    ]
    pure_scale = [
        polynomial
        for polynomial in serialized_basis
        if sp.sympify(polynomial).free_symbols <= {s}
    ]
    document = {
        "schema": SCHEMA,
        "scope": {
            "translation_fixed": True,
            "rotation_fixed_when_A_ne_B": True,
            "scale_normalized": False,
            "trusted_sympy_groebner_computation": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
        },
        "equalities": [name for name, _ in named_equalities],
        "expanded_equalities_sha256": canonical_sha256(
            [str(sp.expand(polynomial)) for _, polynomial in named_equalities]
        ),
        "variable_order": [str(variable) for variable in variables],
        "basis_length": len(serialized_basis),
        "basis_sha256": canonical_sha256(serialized_basis),
        "pure_scale_consequences": pure_scale,
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
