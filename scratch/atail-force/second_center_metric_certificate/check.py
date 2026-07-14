#!/usr/bin/env python3
"""Independent exact checker for extracted Nullstellensatz certificates.

The checker does not import the extraction driver or its target encoder.  It
reconstructs the squared-distance generators directly from the pinned row
strings, checks source provenance, parses every multiplier over QQ, and expands
the complete identity as a SymPy polynomial.  A certificate is accepted only
when that expansion is exactly the constant polynomial 1.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any, Iterable, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
CEGAR_DIR = HERE.parent / "second_center_metric_cegar"

SOURCE_PATHS = {
    "metric_oracle_checkpoint_sha256": ORACLE_DIR / "checkpoint.json",
    "metric_oracle_manifest_sha256": ORACLE_DIR / "manifest.json",
    "metric_cegar_checkpoint_sha256": CEGAR_DIR / "checkpoint.json",
    "metric_cegar_manifest_sha256": CEGAR_DIR / "manifest.json",
}


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def parse_row(text: str) -> tuple[int, tuple[int, ...]]:
    center_text, support_text = text.split(":", maxsplit=1)
    return int(center_text), tuple(int(x) for x in support_text.split(","))


def serialize(expr: sp.Expr, variables: Sequence[sp.Symbol]) -> str:
    poly = sp.Poly(sp.expand(expr), *variables, domain=sp.QQ)
    terms: list[str] = []
    for exponents, coefficient in poly.terms():
        monomial = "*".join(
            str(variable) if exponent == 1 else f"{variable}^{exponent}"
            for variable, exponent in zip(poly.gens, exponents)
            if exponent
        )
        magnitude = abs(coefficient)
        body = (
            ("" if magnitude == 1 else f"{magnitude}*") + monomial
            if monomial
            else str(magnitude)
        )
        terms.append(
            (("-" if coefficient < 0 else "+") if terms else ("-" if coefficient < 0 else ""))
            + body
        )
    return "".join(terms) or "0"


def distance(points: Sequence[tuple[sp.Expr, sp.Expr]], i: int, j: int) -> sp.Expr:
    return sp.expand(
        (points[i][0] - points[j][0]) ** 2
        + (points[i][1] - points[j][1]) ** 2
    )


def reconstruct_generators(
    coordinate_model: str,
    row_texts: Sequence[str],
) -> tuple[tuple[str, ...], tuple[str, ...]]:
    if coordinate_model == "normalized_p0_zero_p1_e1":
        points: list[tuple[sp.Expr, sp.Expr]] = [
            (sp.Integer(0), sp.Integer(0)),
            (sp.Integer(1), sp.Integer(0)),
        ]
        points.extend(sp.symbols(f"x{i}x x{i}y") for i in range(2, 12))
        coordinate_symbols = tuple(x for point in points[2:] for x in point)
        rabinowitsch = False
    elif coordinate_model == "ungauged_relative_coordinates_translation_eliminated":
        points = [(sp.Integer(0), sp.Integer(0))]
        points.extend(sp.symbols(f"u{i}x u{i}y") for i in range(1, 12))
        coordinate_symbols = tuple(x for point in points[1:] for x in point)
        rabinowitsch = True
    elif coordinate_model == "ungauged_absolute_coordinates":
        points = [sp.symbols(f"x{i}x x{i}y") for i in range(12)]
        coordinate_symbols = tuple(x for point in points for x in point)
        rabinowitsch = True
    else:
        raise ValueError(f"unknown coordinate model {coordinate_model}")
    s = sp.Symbol("s")
    variables = (*coordinate_symbols, s) if rabinowitsch else coordinate_symbols
    generators: list[str] = []
    for text in row_texts:
        center, support = parse_row(text)
        if len(support) != 4:
            raise ValueError(f"expected four support points in {text}")
        pivot = support[0]
        pivot_distance = distance(points, center, pivot)
        for other in support[1:]:
            generators.append(
                serialize(pivot_distance - distance(points, center, other), variables)
            )
    if rabinowitsch:
        generators.append(serialize(s * distance(points, 0, 1) - 1, variables))
    return tuple(str(x) for x in variables), tuple(generators)


def parse_polynomial(text: str, symbols: Sequence[sp.Symbol]) -> sp.Poly:
    locals_map = {str(symbol): symbol for symbol in symbols}
    expression = sp.sympify(text.replace("^", "**"), locals=locals_map)
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def exact_identity(
    variables: Sequence[str], generators: Sequence[str], multipliers: Sequence[str]
) -> tuple[bool, list[sp.Poly], list[sp.Poly], sp.Poly]:
    if len(generators) != len(multipliers):
        raise ValueError("generator/multiplier length mismatch")
    symbols = sp.symbols(" ".join(variables))
    if isinstance(symbols, sp.Symbol):
        symbols = (symbols,)
    generator_polys = [parse_polynomial(text, symbols) for text in generators]
    multiplier_polys = [parse_polynomial(text, symbols) for text in multipliers]
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    for generator, multiplier in zip(generator_polys, multiplier_polys):
        total += generator * multiplier
    one = sp.Poly(1, *symbols, domain=sp.QQ)
    return total == one, generator_polys, multiplier_polys, total


def coefficient_stats(polys: Iterable[sp.Poly]) -> dict[str, int]:
    max_numerator = 0
    max_denominator = 0
    max_numerator_bits = 0
    max_denominator_bits = 0
    for poly in polys:
        for coefficient in poly.coeffs():
            rational = sp.Rational(coefficient)
            numerator = abs(int(rational.p))
            denominator = abs(int(rational.q))
            max_numerator = max(max_numerator, numerator)
            max_denominator = max(max_denominator, denominator)
            max_numerator_bits = max(max_numerator_bits, numerator.bit_length())
            max_denominator_bits = max(max_denominator_bits, denominator.bit_length())
    return {
        "max_abs_numerator": max_numerator,
        "max_denominator": max_denominator,
        "max_numerator_bits": max_numerator_bits,
        "max_denominator_bits": max_denominator_bits,
    }


def lean_assessment(stats: dict[str, Any]) -> dict[str, str]:
    terms = stats["total_multiplier_terms"]
    max_degree = stats["max_multiplier_degree"]
    if terms <= 250 and max_degree <= 4:
        ring = "REALISTIC_DIRECT"
    elif terms <= 2500 and stats["certificate_file_bytes"] <= 500_000:
        ring = "POSSIBLE_BUT_LARGE"
    else:
        ring = "UNREALISTIC_VERBATIM"
    nlinarith = (
        "NOT_DIRECT: the certificate uses nonconstant polynomial multipliers; "
        "nlinarith does not synthesize this ideal-membership identity"
    )
    return {"lean_ring_translation": ring, "lean_nlinarith_translation": nlinarith}


def validate_provenance(certificate: dict[str, Any]) -> dict[str, str]:
    observed = {name: file_sha256(path) for name, path in SOURCE_PATHS.items()}
    provenance = certificate["provenance"]
    for name, digest in observed.items():
        if provenance.get(name) != digest:
            raise ValueError(f"source hash mismatch for {name}")
    if canonical_sha256(certificate["rows"]) != certificate["row_set_sha256"]:
        raise ValueError("row-set hash mismatch")
    if canonical_sha256(certificate["generators"]) != certificate["generator_sha256"]:
        raise ValueError("generator hash mismatch")
    return observed


def check_certificate(path: Path) -> dict[str, Any]:
    certificate = json.loads(path.read_text(encoding="utf-8"))
    if certificate["schema"] != "p97-atail-nullstellensatz-certificate-v1":
        raise ValueError("unknown certificate schema")
    source_hashes = validate_provenance(certificate)
    variables, generators = reconstruct_generators(
        certificate["coordinate_model"], certificate["rows"]
    )
    if list(variables) != certificate["variables"]:
        raise ValueError("independently reconstructed variable list disagrees")
    if list(generators) != certificate["generators"]:
        raise ValueError("independently reconstructed generators disagree")
    verified, generator_polys, multiplier_polys, total = exact_identity(
        certificate["variables"], certificate["generators"], certificate["multipliers"]
    )
    multiplier_degrees = [poly.total_degree() for poly in multiplier_polys if poly]
    stats: dict[str, Any] = {
        "certificate_file_bytes": path.stat().st_size,
        "generator_count": len(generator_polys),
        "total_generator_terms": sum(len(poly.terms()) for poly in generator_polys),
        "nonzero_multiplier_count": sum(1 for poly in multiplier_polys if poly),
        "total_multiplier_terms": sum(len(poly.terms()) for poly in multiplier_polys),
        "max_multiplier_terms": max((len(poly.terms()) for poly in multiplier_polys), default=0),
        "max_multiplier_degree": max(multiplier_degrees, default=-1),
        "max_product_degree": max(
            (g.total_degree() + h.total_degree()
             for g, h in zip(generator_polys, multiplier_polys) if h),
            default=-1,
        ),
        "expanded_identity_term_count": len(total.terms()),
        **coefficient_stats(multiplier_polys),
    }
    report = {
        "schema": "p97-atail-nullstellensatz-verification-v1",
        "target": certificate["target"],
        "verified_exact_identity": verified,
        "independently_reconstructed_generators": True,
        "source_hashes": source_hashes,
        "generator_sha256": certificate["generator_sha256"],
        "row_set_sha256": certificate["row_set_sha256"],
        "certificate_file_sha256": file_sha256(path),
        "statistics": stats,
        "lean_translation": lean_assessment(stats),
    }
    if not verified:
        raise ValueError(f"certificate identity is not 1 (terms={len(total.terms())})")
    return report


def smoke_gates() -> dict[str, bool]:
    unit, *_ = exact_identity(("z",), ("z", "z-1"), ("1", "-1"))
    mutated, *_ = exact_identity(("z",), ("z", "z-1"), ("1", "0"))
    nonunit_false_claim, *_ = exact_identity(("z",), ("z^2-1",), ("1",))
    if not unit or mutated or nonunit_false_claim:
        raise RuntimeError("independent checker smoke gate failed")
    return {
        "known_unit_identity_accepted": unit,
        "mutated_unit_identity_rejected": not mutated,
        "known_nonunit_false_identity_rejected": not nonunit_false_claim,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("certificate", type=Path, nargs="?")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    smoke = smoke_gates()
    if args.smoke_only:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        return
    if args.certificate is None:
        parser.error("certificate path required unless --smoke-only")
    report = check_certificate(args.certificate)
    report["smoke_gates"] = smoke
    if args.output:
        args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
