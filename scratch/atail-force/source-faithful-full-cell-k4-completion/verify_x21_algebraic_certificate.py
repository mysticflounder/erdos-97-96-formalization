#!/usr/bin/env python3
"""Replay the exact algebraic x21 one-row completion certificate.

This verifier rebuilds the rational polynomial system and interval cell ledger
from ``x21-validation.json``.  It also reruns the generated system in Singular.
It is an exact external certificate audit, not a Lean proof.
"""

from __future__ import annotations

import argparse
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import subprocess

import mpmath as mp
import sympy as sp

import lift_x21_algebraic as lift


HERE = Path(__file__).resolve().parent


def parse_fraction(text: str) -> F:
    numerator, denominator = text.split("/", 1)
    return F(int(numerator), int(denominator))


def render_ledger(ledger: dict[str, object]) -> dict[str, object]:
    return {
        name: lift.render_fraction(value) if isinstance(value, F) else value
        for name, value in ledger.items()
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--certificate", type=Path,
        default=HERE / "x21-algebraic-certificate.json",
    )
    parser.add_argument(
        "--input", type=Path, default=HERE / "x21-validation.json",
    )
    parser.add_argument(
        "--output", type=Path,
        default=HERE / "x21-algebraic-verification.json",
    )
    args = parser.parse_args()

    certificate = json.loads(args.certificate.read_text())
    payload = json.loads(args.input.read_text())
    mp.mp.dps = 160
    denominator = int(certificate["fixed_parameter_denominator_bound"])
    parameters = lift.rationalize_parameters(
        payload["refined_parameters"], denominator
    )
    a, l, s = sp.symbols("a l s")
    parameters[0], parameters[5], parameters[22] = a, l, s
    variables = (a, l, s)
    points = lift.construct(parameters)
    if not lift.symbolic_parameterized_equalities(points):
        raise AssertionError("parameterized source rows are not identities")

    distances = [
        lift.sqdist(points["x21"], points[name])
        for name in lift.X21_SUPPORT
    ]
    polynomials = [
        lift.primitive_numerator(value - distances[0], variables)
        for value in distances[1:]
    ]
    polynomial_text = "\n".join(str(poly.as_expr()) for poly in polynomials)
    polynomial_sha256 = hashlib.sha256(polynomial_text.encode()).hexdigest()
    if polynomial_sha256 != certificate["polynomial_sha256"]:
        raise AssertionError("polynomial digest mismatch")

    groebner = sp.groebner(polynomials, *variables, order="lex")
    if not all(groebner.reduce(poly.as_expr())[1] == 0 for poly in polynomials):
        raise AssertionError("Groebner basis does not reduce its generators")
    groebner_text = "\n".join(str(poly) for poly in groebner.polys)
    groebner_sha256 = hashlib.sha256(groebner_text.encode()).hexdigest()
    if groebner_sha256 != certificate["groebner_sha256"]:
        raise AssertionError("Groebner digest mismatch")

    box = [
        lift.Interval(parse_fraction(item["lo"]), parse_fraction(item["hi"]))
        for item in certificate["root_box"]
    ]
    center = [
        sp.Rational(
            value.lo.numerator * value.hi.denominator +
            value.hi.numerator * value.lo.denominator,
            2 * value.lo.denominator * value.hi.denominator,
        )
        for value in box
    ]
    radii = [value.hi - F(int(mid.p), int(mid.q)) for value, mid in zip(box, center)]
    if len(set(radii)) != 1 or radii[0] <= 0:
        raise AssertionError("root box is not a positive uniform-radius box")
    contained, replay_box, image = lift.krawczyk(
        polynomials, variables, center, radii[0]
    )
    if not contained or replay_box != box:
        raise AssertionError("Krawczyk strict inclusion replay failed")
    rendered_image = [
        {"lo": lift.render_fraction(value.lo), "hi": lift.render_fraction(value.hi)}
        for value in image
    ]
    if rendered_image != certificate["krawczyk_image"]:
        raise AssertionError("Krawczyk image mismatch")

    variable_box = dict(zip(lift.VARIABLE_INDICES, box, strict=True))
    interval_parameters = [
        variable_box[index] if index in variable_box else lift.as_interval(value)
        for index, value in enumerate(parameters)
    ]
    interval_points = lift.construct(interval_parameters)
    ledger = lift.interval_cell_ledger(interval_points)
    if render_ledger(ledger) != certificate["interval_cell_ledger"]:
        raise AssertionError("interval cell ledger mismatch")
    required_positive = (
        "strict_hull_lower", "pairwise_sqdist_lower", "mec_containment_lower",
        "cap_role_lower", "nonobtuse_lower",
    )
    required_nonzero = (
        "exclusions_avoid_zero", "singleton_gaps_avoid_zero",
        "reverse_return_avoid_zero", "x21_row_exclusions_avoid_zero",
        "x21_deleted_alternative_gaps_avoid_zero",
    )
    if not all(ledger[name] > 0 for name in required_positive):
        raise AssertionError("an open cell inequality is not certified")
    if not all(ledger[name] for name in required_nonzero):
        raise AssertionError("an exact-class or blocker gap is not certified")

    manifest = certificate["source_oriented_blocker_manifest"]
    if manifest != {
        "critical_source": "uS1",
        "blocker_center": "x21",
        "exact_support": ["uS1", "t0s", "t1s", "o"],
        "retained_support_after_deletion": ["o", "t0s", "t1s"],
        "retained_support_cardinality": 3,
        "row_exclusions_certified": True,
        "all_alternative_deleted_radius_gaps_certified": True,
        "deletion_kills_every_radius_class_at_blocker": True,
    }:
        raise AssertionError("source-oriented blocker manifest mismatch")

    singular_script = Path(certificate["singular_script"])
    completed = subprocess.run(
        ["Singular", str(singular_script)], check=True, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    )
    singular = lift.parse_singular_cross_check(completed.stdout)
    if not singular["passed"] or singular != certificate["singular_cross_check"]:
        raise AssertionError("Singular cross-check mismatch")

    result = {
        "schema": "source-faithful-full-cell-x21-algebraic-verification-v1",
        "epistemic_status": "EXACT_RATIONAL_INTERVAL_REPLAY_NOT_LEAN",
        "status": "EXACT_ALGEBRAIC_ONE_ROW_CERTIFICATE_REPLAY_PASS",
        "polynomial_sha256": polynomial_sha256,
        "groebner_sha256": groebner_sha256,
        "krawczyk_strict_inclusion": True,
        "interval_cell_ledger_match": True,
        "existing_equalities_symbolically_zero": True,
        "source_oriented_blocker_manifest_match": True,
        "deletion_kills_every_radius_class_at_x21": True,
        "singular_cross_check": singular,
        "coverage_claim": False,
        "whole_carrier_k4_claim": False,
        "lean_kernel_checked": False,
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
