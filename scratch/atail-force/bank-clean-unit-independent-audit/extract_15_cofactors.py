#!/usr/bin/env python3
"""Extract and independently verify QQ cofactors for the 15-equality UNIT core."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path
from typing import Any

import sympy as sp

import audit
import confirm_17
import delete_17
import minimize_core as core


HERE = Path(__file__).resolve().parent
DELETED = {"ROW_K_O_I", "ROW_Y_O_E"}
EXPECTED_ROLE_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)
COFACTOR_RE = re.compile(r"^__COFACTOR_(\d+)__=(.*)$")


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def bit_length(integer: int) -> int:
    return abs(integer).bit_length()


def main() -> None:
    role_variables, all_generators = delete_17.reconstruct()
    generators = [g for g in all_generators if g["name"] not in DELETED]
    assert len(generators) == 15
    assert core.polynomial_hash(generators) == EXPECTED_ROLE_POLYNOMIAL_SHA256

    # Rename the independently reconstructed role variables to the numeric role
    # order used by the kernel-facing lane.  Keeping the four inactive role
    # pairs is deliberate: it is the exact monomial order under which slimgb is
    # fast and was independently crosschecked.
    numeric_symbols: dict[tuple[str, str], sp.Symbol] = {
        (role, axis): sp.Symbol(f"x{index}{axis}")
        for role, index in confirm_17.NUMERIC_ROLE_MAP.items()
        for axis in ("x", "y")
    }
    role_symbols = {
        sp.Symbol(f"{role}{axis}"): numeric_symbols[(role, axis)]
        for role in audit.ROLES
        for axis in ("x", "y")
    }
    variable_roles = [
        role
        for role, _index in sorted(
            confirm_17.NUMERIC_ROLE_MAP.items(), key=lambda item: item[1]
        )
        if role not in {"O", "A"}
    ]
    variables = [
        numeric_symbols[(role, axis)]
        for role in variable_roles
        for axis in ("x", "y")
    ]
    polynomials = [
        sp.Poly(
            sp.expand(generator["polynomial"].xreplace(role_symbols)),
            *variables,
            domain=sp.QQ,
        ).as_expr()
        for generator in generators
    ]

    names = ",".join(str(variable) for variable in variables)
    rows = ",\n  ".join(
        sp.sstr(polynomial).replace("**", "^") for polynomial in polynomials
    )
    singular_source = HERE / "unit_certificate_15.sing"
    singular_source.write_text(
        "\n".join(
            [
                f"ring R=0,({names}),dp;",
                f"ideal I={rows};",
                "ideal One=1;",
                "matrix U;",
                'matrix T=lift(I,One,U,"slimgb");',
                "poly identity=0;",
                "for (int i=1; i<=size(I); i++) { identity=identity+I[i]*T[i,1]; }",
                'if (identity==1) { print("__SINGULAR_IDENTITY_PASS__"); }',
                'else { print("__SINGULAR_IDENTITY_FAIL__"); }',
                "for (int i=1; i<=size(I); i++) {",
                '  print("__COFACTOR_"+string(i)+"__="+string(T[i,1]));',
                "}",
                "quit;",
                "",
            ]
        )
    )

    # The lift smoke is deliberately separate from the UNIT/NONUNIT oracle
    # smoke: it checks transformation-matrix orientation and parsing.
    lift_smoke = audit.run(
        ["Singular", "-q", str(HERE / "lift_smoke.sing")], timeout=30
    )
    if "IDENTITY_PASS" not in str(lift_smoke.get("stdout", "")):
        raise RuntimeError(f"lift smoke failed: {lift_smoke}")

    singular = audit.run(
        ["Singular", "-q", str(singular_source)], timeout=900
    )
    transcript = str(singular.get("stdout", ""))
    transcript_path = HERE / "unit_certificate_15.singular.out"
    transcript_path.write_text(transcript)
    if "__SINGULAR_IDENTITY_PASS__" not in transcript:
        raise RuntimeError(f"Singular did not emit a verified identity: {singular}")

    cofactor_text: dict[int, str] = {}
    for line in transcript.splitlines():
        match = COFACTOR_RE.fullmatch(line.strip())
        if match is not None:
            cofactor_text[int(match.group(1))] = match.group(2)
    if sorted(cofactor_text) != list(range(1, len(generators) + 1)):
        raise RuntimeError(
            f"cofactor parse incomplete: got {sorted(cofactor_text)}, expected 1..{len(generators)}"
        )

    locals_map = {str(variable): variable for variable in variables}
    cofactors: list[sp.Expr] = []
    for index in range(1, len(generators) + 1):
        expression = sp.sympify(
            cofactor_text[index].replace("^", "**"), locals=locals_map
        )
        cofactors.append(
            sp.Poly(sp.expand(expression), *variables, domain=sp.QQ).as_expr()
        )

    # Independent exact replay.  This does not invoke Singular and does not
    # trust its internal identity marker: sparse QQ polynomial arithmetic must
    # reduce the claimed linear combination to the constant one.
    total = sp.Poly(0, *variables, domain=sp.QQ)
    for cofactor, polynomial in zip(cofactors, polynomials, strict=True):
        total += sp.Poly(cofactor, *variables, domain=sp.QQ) * sp.Poly(
            polynomial, *variables, domain=sp.QQ
        )
    if total != sp.Poly(1, *variables, domain=sp.QQ):
        raise AssertionError("independent SymPy QQ identity replay failed")

    entries: list[dict[str, Any]] = []
    max_numerator_bits = 0
    max_denominator_bits = 0
    total_cofactor_terms = 0
    for generator, polynomial, cofactor in zip(
        generators, polynomials, cofactors, strict=True
    ):
        cofactor_poly = sp.Poly(cofactor, *variables, domain=sp.QQ)
        coefficients = cofactor_poly.coeffs()
        numerator_bits = max(
            (bit_length(int(coefficient.p)) for coefficient in coefficients),
            default=0,
        )
        denominator_bits = max(
            (bit_length(int(coefficient.q)) for coefficient in coefficients),
            default=0,
        )
        max_numerator_bits = max(max_numerator_bits, numerator_bits)
        max_denominator_bits = max(max_denominator_bits, denominator_bits)
        total_cofactor_terms += cofactor_poly.length()
        entries.append(
            {
                "name": str(generator["name"]),
                "center": str(generator["center"]),
                "left": str(generator["left"]),
                "right": str(generator["right"]),
                "generator": sp.sstr(polynomial),
                "cofactor": sp.sstr(cofactor),
                "cofactor_total_degree": cofactor_poly.total_degree(),
                "cofactor_term_count": cofactor_poly.length(),
                "cofactor_max_numerator_bits": numerator_bits,
                "cofactor_max_denominator_bits": denominator_bits,
            }
        )

    certificate_payload = {
        "schema": "p97-bank-clean-15-equality-unit-cofactors-v1",
        "checkpoint_row_sha256": audit.EXPECTED_ROW_HASH,
        "source_17_polynomial_sha256": confirm_17.EXPECTED_COMPARISON_HASH,
        "role_polynomial_sha256": EXPECTED_ROLE_POLYNOMIAL_SHA256,
        "deleted_from_17": sorted(DELETED),
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "numeric_role_map": confirm_17.NUMERIC_ROLE_MAP,
        "variables": [str(variable) for variable in variables],
        "identity": "sum_i cofactor_i * generator_i = 1 over QQ",
        "entries": entries,
    }
    canonical = json.dumps(
        certificate_payload, sort_keys=True, separators=(",", ":")
    ).encode()
    certificate_sha256 = hashlib.sha256(canonical).hexdigest()
    report = {
        **certificate_payload,
        "certificate_sha256": certificate_sha256,
        "verification": {
            "singular_version": "4.4.1",
            "singular_algorithm": "lift(I, ideal(1), U, slimgb) over QQ",
            "singular_identity_marker": "PASS",
            "singular_seconds": singular["seconds"],
            "sympy_version": sp.__version__,
            "sympy_sparse_QQ_identity": "PASS",
            "resulting_total_term_count": total.length(),
            "resulting_total": sp.sstr(total.as_expr()),
        },
        "size": {
            "generator_count": len(generators),
            "variable_count_including_inactive_padding": len(variables),
            "total_cofactor_terms": total_cofactor_terms,
            "max_numerator_bits": max_numerator_bits,
            "max_denominator_bits": max_denominator_bits,
        },
        "artifacts": {
            "singular_source": {
                "path": str(singular_source.relative_to(core.audit.REPO)),
                "sha256": sha256_file(singular_source),
                "bytes": singular_source.stat().st_size,
            },
            "singular_transcript": {
                "path": str(transcript_path.relative_to(core.audit.REPO)),
                "sha256": sha256_file(transcript_path),
                "bytes": transcript_path.stat().st_size,
            },
        },
        "trust_boundary": [
            "the squared-distance generators are reconstructed from the pinned terminal rows",
            "Singular computes the QQ lift but is not the only identity checker",
            "SymPy independently expands the complete identity in sparse QQ arithmetic",
            "this certifies one normalized 15-equality subsystem, not structural coverage or K-A closure",
        ],
    }
    output_path = HERE / "unit_certificate_15.json"
    output_path.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "certificate_path": str(output_path.relative_to(core.audit.REPO)),
                "certificate_sha256": certificate_sha256,
                "certificate_bytes": output_path.stat().st_size,
                "singular_seconds": singular["seconds"],
                "total_cofactor_terms": total_cofactor_terms,
                "max_numerator_bits": max_numerator_bits,
                "max_denominator_bits": max_denominator_bits,
                "sympy_QQ_identity": "PASS",
            },
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
