#!/usr/bin/env python3
"""Independent exact verification of the extracted axis-homogeneous certificate."""

from fractions import Fraction
from pathlib import Path
import re

import sympy as sp


NAMES = (
    "x_r2", "x_s3", "x_t1", "x_t2", "x_t4",
    "y_r2", "y_s3", "y_t1", "y_t2", "y_t4", "u",
)
INDEX = {name: i for i, name in enumerate(NAMES)}
ZERO_EXP = (0,) * len(NAMES)


def parse_poly(source: str) -> dict[tuple[int, ...], Fraction]:
    source = source.strip()
    if source == "0":
        return {}
    out: dict[tuple[int, ...], Fraction] = {}
    for raw in re.findall(r"[+-]?[^+-]+", source):
        sign = -1 if raw[0] == "-" else 1
        term = raw[1:] if raw[0] in "+-" else raw
        coeff = Fraction(sign)
        exps = [0] * len(NAMES)
        for factor in term.split("*"):
            if re.fullmatch(r"\d+(?:/\d+)?", factor):
                coeff *= Fraction(factor)
                continue
            if "^" in factor:
                name, power = factor.split("^", 1)
                exps[INDEX[name]] += int(power)
            else:
                exps[INDEX[factor]] += 1
        key = tuple(exps)
        out[key] = out.get(key, Fraction(0)) + coeff
        if out[key] == 0:
            del out[key]
    return out


def add_product(
    accumulator: dict[tuple[int, ...], Fraction],
    left: dict[tuple[int, ...], Fraction],
    right: dict[tuple[int, ...], Fraction],
) -> None:
    for left_exp, left_coeff in left.items():
        for right_exp, right_coeff in right.items():
            exp = tuple(a + b for a, b in zip(left_exp, right_exp, strict=True))
            accumulator[exp] = accumulator.get(exp, Fraction(0)) + left_coeff * right_coeff
            if accumulator[exp] == 0:
                del accumulator[exp]


def specialize_u_one(poly: dict[tuple[int, ...], Fraction]) -> dict[tuple[int, ...], Fraction]:
    out: dict[tuple[int, ...], Fraction] = {}
    for exp, coeff in poly.items():
        specialized = exp[:-1] + (0,)
        out[specialized] = out.get(specialized, Fraction(0)) + coeff
        if out[specialized] == 0:
            del out[specialized]
    return out


GENERATOR_TEXT = (
    "x_r2^2-2*x_r2*x_t4-x_s3^2+2*x_s3*x_t4+y_r2^2-2*y_r2*y_t4-y_s3^2+2*y_s3*y_t4",
    "x_r2^2-2*x_r2*x_t4-x_t1^2+2*x_t1*x_t4+y_r2^2-2*y_r2*y_t4-y_t1^2+2*y_t1*y_t4",
    "u^2-x_s3^2-y_s3^2",
    "u^2-x_t4^2-y_t4^2",
    "u^2-x_s3^2+2*x_s3*x_t1-x_t1^2-y_s3^2+2*y_s3*y_t1-y_t1^2",
    "u^2-x_s3^2+2*x_s3*x_t2-x_t2^2-y_s3^2+2*y_s3*y_t2-y_t2^2",
    "x_r2^2-x_t2^2+y_r2^2-y_t2^2",
    "x_t2^2-x_t4^2+y_t2^2-y_t4^2-2*u*x_t2+2*u*x_t4",
    "u^2-x_r2^2-y_r2^2-2*u*x_t2+2*x_r2*x_t2+2*y_r2*y_t2",
    "u^2-2*u*x_r2+2*x_r2*x_t1+2*y_r2*y_t1-x_t1^2-y_t1^2",
    "u^2-2*u*x_t1+2*x_t1*x_t2+2*y_t1*y_t2-x_t2^2-y_t2^2",
)


def load_certificate(path: Path) -> list[dict[tuple[int, ...], Fraction]]:
    rows = []
    for line in path.read_text().splitlines():
        if not line:
            continue
        label, expression = line.removesuffix(";").split("=", 1)
        if label != f"C{len(rows) + 1}":
            raise ValueError(f"unexpected certificate row {label}")
        rows.append(parse_poly(expression))
    if len(rows) != 11:
        raise ValueError(f"expected 11 certificate rows, found {len(rows)}")
    return rows


def verify_sparse_identity(certificate_path: Path) -> tuple[int, int]:
    coefficients = load_certificate(certificate_path)
    generators = [parse_poly(text) for text in GENERATOR_TEXT]
    result: dict[tuple[int, ...], Fraction] = {}
    for coefficient, generator in zip(coefficients, generators, strict=True):
        add_product(result, coefficient, generator)
    expected_exp = list(ZERO_EXP)
    expected_exp[INDEX["u"]] = 8
    assert result == {tuple(expected_exp): Fraction(1)}

    normalized: dict[tuple[int, ...], Fraction] = {}
    for coefficient, generator in zip(coefficients, generators, strict=True):
        add_product(normalized, specialize_u_one(coefficient), specialize_u_one(generator))
    assert normalized == {ZERO_EXP: Fraction(1)}
    return sum(map(len, coefficients)), max(sum(exp) for poly in coefficients for exp in poly)


def verify_coordinate_free_lift() -> None:
    px, py = sp.symbols("p_x p_y")
    coords = {}
    for point in ("r2", "s3", "t1", "t2", "t4"):
        coords[point] = sp.symbols(f"X_{point} Y_{point}")
    q = px**2 + py**2

    def dot(a: str, b: str) -> sp.Expr:
        ax, ay = coords[a]
        bx, by = coords[b]
        return ax * bx + ay * by

    def norm2(a: str) -> sp.Expr:
        return dot(a, a)

    def dist2(a: str, b: str) -> sp.Expr:
        return norm2(a) + norm2(b) - 2 * dot(a, b)

    p_dot = {name: px * xy[0] + py * xy[1] for name, xy in coords.items()}
    full = (
        dist2("r2", "t4") - dist2("s3", "t4"),
        dist2("r2", "t4") - dist2("t1", "t4"),
        q - norm2("s3"),
        q - norm2("t4"),
        q - dist2("s3", "t1"),
        q - dist2("s3", "t2"),
        norm2("r2") - norm2("t2"),
        q + norm2("t2") - 2 * p_dot["t2"] - (q + norm2("t4") - 2 * p_dot["t4"]),
        q + norm2("t2") - 2 * p_dot["t2"] - dist2("r2", "t2"),
        q + norm2("r2") - 2 * p_dot["r2"] - dist2("r2", "t1"),
        q + norm2("t1") - 2 * p_dot["t1"] - dist2("t1", "t2"),
    )

    axis_symbols = {name: sp.Symbol(name) for name in NAMES}
    substitution = {axis_symbols["u"]: q}
    for point, (x, y) in coords.items():
        substitution[axis_symbols[f"x_{point}"]] = px * x + py * y
        substitution[axis_symbols[f"y_{point}"]] = -py * x + px * y
    axis_generators = [sp.sympify(text.replace("^", "**"), locals=axis_symbols) for text in GENERATOR_TEXT]
    for axis_generator, full_generator in zip(axis_generators, full, strict=True):
        assert sp.expand(axis_generator.subs(substitution) - q * full_generator) == 0


if __name__ == "__main__":
    here = Path(__file__).resolve().parent
    terms, degree = verify_sparse_identity(here / "axis-u8-certificate.singexpr")
    verify_coordinate_free_lift()
    print("AXIS_IDENTITY_VERIFIED: sum(C_i*f_i) = u^8")
    print("NORMALIZED_SUBSTITUTION_VERIFIED: sum(C_i|u=1 * f_i|u=1) = 1")
    print("COORDINATE_FREE_COVARIANCE_VERIFIED: Phi(f_i_axis) = q*f_i_full for i=1..11")
    print(f"CERTIFICATE_TERMS={terms}")
    print(f"MAX_MULTIPLIER_DEGREE={degree}")
