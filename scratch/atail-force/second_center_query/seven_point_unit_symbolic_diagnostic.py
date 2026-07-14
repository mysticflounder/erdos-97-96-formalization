#!/usr/bin/env python3
"""Inspect the normalized seven-point five-circle ideal with Singular.

This is theorem-discovery support.  It fixes ``A=(0,0)`` and ``B=(1,0)``,
expands the eleven squared-distance equalities over QQ, and asks Singular for
the reduced standard basis.  ``--lift`` additionally requests coefficients
expressing ``1`` in the input ideal; those coefficients are a trusted-CAS
diagnostic until replayed in Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess

import sympy as sp


SCHEMA = "p97-atail-seven-point-unit-symbolic-diagnostic-v1"


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def squared_distance(
    left: tuple[sp.Expr, sp.Expr], right: tuple[sp.Expr, sp.Expr]
) -> sp.Expr:
    return sp.expand(
        (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2
    )


def singular_polynomial(polynomial: sp.Expr) -> str:
    return str(sp.expand(polynomial)).replace("**", "^")


def normalized_system() -> tuple[
    tuple[sp.Symbol, ...], list[tuple[str, sp.Expr]]
]:
    """Return the normalized variables and named squared-distance equations."""
    variables = sp.symbols("cx cy dx dy ex ey fx fy gx gy")
    cx, cy, dx, dy, ex, ey, fx, fy, gx, gy = variables
    points = {
        "A": (sp.Integer(0), sp.Integer(0)),
        "B": (sp.Integer(1), sp.Integer(0)),
        "C": (cx, cy),
        "D": (dx, dy),
        "E": (ex, ey),
        "F": (fx, fy),
        "G": (gx, gy),
    }

    def d(left: str, right: str) -> sp.Expr:
        return squared_distance(points[left], points[right])

    named_equalities = [
        ("BA=BC", d("B", "A") - d("B", "C")),
        ("BA=BD", d("B", "A") - d("B", "D")),
        ("CA=CB", d("C", "A") - d("C", "B")),
        ("CA=CE", d("C", "A") - d("C", "E")),
        ("CA=CF", d("C", "A") - d("C", "F")),
        ("DC=DG", d("D", "C") - d("D", "G")),
        ("DC=DF", d("D", "C") - d("D", "F")),
        ("EA=EG", d("E", "A") - d("E", "G")),
        ("EA=EF", d("E", "A") - d("E", "F")),
        ("FB=FD", d("F", "B") - d("F", "D")),
        ("FB=FG", d("F", "B") - d("F", "G")),
    ]
    return variables, named_equalities


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lift", action="store_true")
    parser.add_argument("--timeout", type=float, default=120.0)
    parser.add_argument("--omit", type=int, choices=tuple(range(11)))
    parser.add_argument(
        "--retain",
        help="comma-separated equality indices; mutually exclusive with --omit",
    )
    parser.add_argument("--order", choices=("dp", "lp"), default="dp")
    parser.add_argument("--summary-only", action="store_true")
    args = parser.parse_args()

    variables, named_equalities = normalized_system()
    if args.omit is not None and args.retain is not None:
        parser.error("--omit and --retain are mutually exclusive")
    retained_indices = (
        set(range(len(named_equalities)))
        if args.retain is None
        else {int(index) for index in args.retain.split(",")}
    )
    if not retained_indices <= set(range(len(named_equalities))):
        parser.error("--retain contains an index outside 0..10")
    retained_equalities = [
        item
        for index, item in enumerate(named_equalities)
        if index in retained_indices and index != args.omit
    ]
    polynomials = [singular_polynomial(poly) for _, poly in retained_equalities]
    commands = [
        f"ring r=0,({','.join(str(variable) for variable in variables)}),{args.order};",
        f"ideal I={','.join(polynomials)};",
        "option(redSB);",
        "ideal G=std(I);",
        'print("P97_BASIS_BEGIN");',
        "print(G);",
        'print("P97_BASIS_END");',
    ]
    if args.lift:
        commands.extend(
            [
                "matrix L=lift(I,ideal(1));",
                'print("P97_LIFT_BEGIN");',
                *(
                    f'print("L[{index},1]="+string(L[{index},1]));'
                    for index in range(1, len(polynomials) + 1)
                ),
                'print("P97_LIFT_END");',
            ]
        )
    commands.append("exit;")
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout,
            check=False,
        )
        stdout = completed.stdout
        outcome = {
            "returncode": completed.returncode,
            "stderr": completed.stderr,
        }
        if args.summary_only:
            basis = stdout.split("P97_BASIS_BEGIN\n", 1)[1].split(
                "\nP97_BASIS_END", 1
            )[0]
            basis_entries = basis.split(",\n") if basis else []
            outcome.update(
                {
                    "stdout_sha256": hashlib.sha256(stdout.encode()).hexdigest(),
                    "stdout_char_count": len(stdout),
                    "basis_entry_count": len(basis_entries),
                    "basis_first_entries": basis_entries[:20],
                }
            )
        else:
            outcome["stdout"] = stdout
    except subprocess.TimeoutExpired as error:
        outcome = {
            "timeout": True,
            "stdout": error.stdout or "",
            "stderr": error.stderr or "",
        }

    document = {
        "schema": SCHEMA,
        "scope": {
            "translation_fixed": True,
            "rotation_and_scale_fixed_when_A_ne_B": True,
            "trusted_singular_computation": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
        },
        "equalities": [name for name, _ in retained_equalities],
        "omitted_equality": (
            None if args.omit is None else named_equalities[args.omit][0]
        ),
        "expanded_equalities": polynomials,
        "expanded_equalities_sha256": canonical_sha256(polynomials),
        "variable_order": [str(variable) for variable in variables],
        "monomial_order": args.order,
        "lift_requested": args.lift,
        "singular": outcome,
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
