#!/usr/bin/env python3
"""Emit Lean SparsePoly data from a Phase-3 exact QQ certificate.

The input format is the checked Singular/SymPy certificate JSON produced by
``phase3_survivor_singular_cert_2_20260729/extract_and_replay.py``.  Emission
fails closed unless the artifact hashes, generator metadata and orientation,
and exact unit-ideal identity all replay over ``QQ``.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import io
import json
import os
import re
import tempfile
import tokenize
import unicodedata
from collections.abc import Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

import sympy as sp

SCHEMA = "p97-phase3-survivor-qq-nullstellensatz-certificate-v1"
IDENTITY = "1 = sum_i cofactor_i * generator_i"
GENERATOR_ORDER = "row index, then support positions 1,2,3"
GENERIC_SCHEMA = "p97-generic-metric-qq-nullstellensatz-certificate-v1"
GENERIC_GENERATOR_ORDER = "certificate entry order"
EXPECTED_VARIABLES = tuple(
    coordinate
    for point in range(2, 10)
    for coordinate in (f"x{point}x", f"x{point}y")
)
EXPECTED_GAUGE = {"0": ["0", "0"], "1": ["1", "0"]}
EXPECTED_GENERATOR_POSITIONS = tuple(
    (row_index, support_position)
    for row_index in range(10)
    for support_position in range(1, 4)
)
LEAN_NAMESPACE_RE = re.compile(r"[A-Za-z][A-Za-z0-9_']*(?:\.[A-Za-z][A-Za-z0-9_']*)*")
SHA256_RE = re.compile(r"[0-9a-f]{64}")
DECIMAL_INTEGER_RE = re.compile(r"[0-9]+")
MAX_POLYNOMIAL_TEXT_LENGTH = 2_000_000
MAX_POLYNOMIAL_AST_NODES = 200_000
MAX_INTEGER_DIGITS = 4_096
MAX_EXPONENT = 4_096
MAX_COEFFICIENT_BITS = 12_000
MAX_POLYNOMIAL_TERM_BOUND = 200_000
MAX_CERTIFICATE_JSON_BYTES = 256 * 1024 * 1024
MAX_GENERIC_POINT_COUNT = 1_000
MAX_GENERATOR_COUNT = 20_000
MAX_HEADER_TEXT_LENGTH = 16_384
MAX_ENTRY_NAME_LENGTH = 1_024
MAX_REPLAY_TEXT_CHARACTERS = 50_000_000
MAX_REPLAY_WORK_UNITS = 100_000_000
MAX_REPLAY_ALGEBRA_WORK_UNITS = 10_000_000
REPLAY_ENTRY_WORK_UNITS = 1_000
MAX_ARTIFACT_LABEL_LENGTH = 4_096
_ALLOWED_POLYNOMIAL_OPERATORS = frozenset({"+", "-", "*", "**", "/", "(", ")"})

_COMMON_PAYLOAD_FIELDS = frozenset(
    {
        "certificate_payload_sha256",
        "coefficient_field",
        "cofactor_stream_sha256",
        "coordinate_gauge",
        "entries",
        "generator_order",
        "identity",
        "schema",
        "scope",
        "source_metric_rows_sha256",
        "source_system",
        "source_system_sha256",
        "variables",
    }
)
_V1_PAYLOAD_FIELDS = _COMMON_PAYLOAD_FIELDS
_GENERIC_PAYLOAD_FIELDS = _COMMON_PAYLOAD_FIELDS | {"point_count"}
_V1_ENTRY_FIELDS = frozenset(
    {
        "center",
        "cofactor",
        "index",
        "name",
        "pivot",
        "polynomial",
        "row_index",
        "singular_index",
        "support_position",
        "target",
    }
)
_GENERIC_ENTRY_FIELDS = frozenset(
    {
        "center",
        "cofactor",
        "index",
        "name",
        "pivot",
        "polynomial",
        "singular_index",
        "target",
    }
)
_CONSTANT_POLY_SYMBOL = sp.Symbol("__p97_constant_poly")

Monomial = tuple[int, ...]
Term = tuple[Monomial, Fraction]
Polynomial = tuple[Term, ...]


class CertificateEmissionError(ValueError):
    """The certificate cannot be safely translated to Lean data."""


@dataclass(frozen=True)
class LeanCertificate:
    """Validated exact data ready for deterministic Lean rendering."""

    source_path: Path
    payload_sha256: str
    source_system_sha256: str
    source_metric_rows_sha256: str
    variables: tuple[str, ...]
    facts: tuple[Polynomial, ...]
    cofactors: tuple[tuple[int, Polynomial], ...]
    schema: str = SCHEMA
    point_count: int = 10
    generator_order: str = GENERATOR_ORDER

    @property
    def variable_count(self) -> int:
        """Number of gauge-free coordinate variables in every polynomial."""

        return len(self.variables)


@dataclass(frozen=True)
class _CertificateHeader:
    schema: str
    point_count: int
    generator_order: str
    variables: tuple[str, ...]


def _object_without_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise CertificateEmissionError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _reject_nonfinite_json_constant(value: str) -> Any:
    raise CertificateEmissionError(f"non-finite JSON constant {value!r} is not allowed")


def _reject_json_float(value: str) -> Any:
    raise CertificateEmissionError(f"JSON floating-point literal {value!r} is not allowed")


def _canonical_bytes(value: Any) -> bytes:
    return (
        json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        )
        + "\n"
    ).encode("utf-8")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def trim_exponent_tail(exponents: Sequence[int]) -> Monomial:
    """Canonicalize a monomial for the checker's syntactic list equality."""

    result = list(exponents)
    while result and result[-1] == 0:
        result.pop()
    return tuple(result)


def _symbols(variable_names: Sequence[str]) -> tuple[sp.Symbol, ...]:
    return tuple(sp.Symbol(name) for name in variable_names)


def _polynomial_symbols(
    symbols: tuple[sp.Symbol, ...],
) -> tuple[sp.Symbol, ...]:
    """Give SymPy a private generator for the zero-variable constant case."""

    return symbols or (_CONSTANT_POLY_SYMBOL,)


def _polynomial_text_label(value: object) -> str:
    if not isinstance(value, str) or len(value) <= 200:
        return repr(value)
    return f"{value[:200]!r}... (length {len(value)})"


def _tokenize_polynomial_source(
    text: str,
    variable_names: Sequence[str],
) -> str:
    if not isinstance(text, str):
        raise TypeError("polynomial is not text")
    if not text or not text.strip():
        raise ValueError("polynomial is empty")
    if len(text) > MAX_POLYNOMIAL_TEXT_LENGTH:
        raise ValueError(
            f"polynomial text exceeds {MAX_POLYNOMIAL_TEXT_LENGTH} characters"
        )

    variables = set(variable_names)
    if len(variables) != len(variable_names):
        raise ValueError("declared variable names are not unique")
    normalized = text.strip().replace("^", "**")
    try:
        tokens = tokenize.generate_tokens(io.StringIO(normalized).readline)
        for token_info in tokens:
            token_type = token_info.type
            token_text = token_info.string
            if token_type in {tokenize.ENDMARKER, tokenize.NEWLINE, tokenize.NL}:
                continue
            if token_type == tokenize.NAME:
                if token_text not in variables:
                    raise ValueError(f"undeclared name {token_text!r}")
                continue
            if token_type == tokenize.NUMBER:
                if DECIMAL_INTEGER_RE.fullmatch(token_text) is None:
                    raise ValueError(
                        f"numeric literal {token_text!r} is not a decimal integer"
                    )
                if len(token_text) > MAX_INTEGER_DIGITS:
                    raise ValueError(
                        f"integer literal exceeds {MAX_INTEGER_DIGITS} digits"
                    )
                continue
            if token_type == tokenize.OP:
                if token_text not in _ALLOWED_POLYNOMIAL_OPERATORS:
                    raise ValueError(f"operator {token_text!r} is not allowed")
                continue
            raise ValueError(f"token {token_text!r} is not allowed")
    except (IndentationError, SyntaxError, tokenize.TokenError) as error:
        raise ValueError(f"invalid polynomial token stream: {error}") from error
    return normalized


def _ast_integer_literal(node: ast.AST) -> int | None:
    sign = 1
    while isinstance(node, ast.UnaryOp) and isinstance(
        node.op,
        (ast.UAdd, ast.USub),
    ):
        if isinstance(node.op, ast.USub):
            sign = -sign
        node = node.operand
    if isinstance(node, ast.Constant) and type(node.value) is int:
        return sign * node.value
    return None


def _bounded_power(base: int, exponent: int, limit: int) -> int:
    result = 1
    factor = base
    remaining = exponent
    while remaining:
        if remaining & 1:
            if factor and result > limit // factor:
                return limit + 1
            result *= factor
        remaining >>= 1
        if remaining:
            if factor and factor > limit // factor:
                factor = limit + 1
            else:
                factor *= factor
    return result


def _validate_polynomial_growth(
    *,
    term_bound: int,
    coefficient_bit_bound: int,
) -> None:
    if term_bound > MAX_POLYNOMIAL_TERM_BOUND:
        raise ValueError(
            f"polynomial expansion exceeds {MAX_POLYNOMIAL_TERM_BOUND} terms"
        )
    if coefficient_bit_bound > MAX_COEFFICIENT_BITS:
        raise ValueError(
            "polynomial coefficient growth exceeds "
            f"{MAX_COEFFICIENT_BITS} bits"
        )


def _translate_polynomial_ast(
    root: ast.AST,
    symbol_table: dict[str, sp.Symbol],
) -> sp.Expr:
    values: dict[int, sp.Expr] = {}
    term_bounds: dict[int, int] = {}
    coefficient_bit_bounds: dict[int, int] = {}
    stack: list[tuple[ast.AST, bool]] = [(root, False)]
    node_count = 0

    while stack:
        node, expanded = stack.pop()
        node_id = id(node)
        if not expanded:
            node_count += 1
            if node_count > MAX_POLYNOMIAL_AST_NODES:
                raise ValueError(
                    f"polynomial exceeds {MAX_POLYNOMIAL_AST_NODES} AST nodes"
                )
            if isinstance(node, ast.Constant):
                if type(node.value) is not int:
                    raise TypeError("only integer constants are allowed")
                coefficient_bits = max(1, abs(node.value).bit_length())
                if coefficient_bits > MAX_COEFFICIENT_BITS:
                    raise ValueError(
                        f"integer constant exceeds {MAX_COEFFICIENT_BITS} bits"
                    )
                values[node_id] = sp.Integer(node.value)
                term_bounds[node_id] = 1
                coefficient_bit_bounds[node_id] = coefficient_bits
                continue
            if isinstance(node, ast.Name):
                try:
                    values[node_id] = symbol_table[node.id]
                except KeyError as error:
                    raise ValueError(f"undeclared name {node.id!r}") from error
                term_bounds[node_id] = 1
                coefficient_bit_bounds[node_id] = 1
                continue
            if isinstance(node, ast.UnaryOp):
                if not isinstance(node.op, (ast.UAdd, ast.USub)):
                    raise TypeError("only unary + and - are allowed")
                stack.append((node, True))
                stack.append((node.operand, False))
                continue
            if isinstance(node, ast.BinOp):
                if not isinstance(
                    node.op,
                    (ast.Add, ast.Sub, ast.Mult, ast.Div, ast.Pow),
                ):
                    raise TypeError("binary operator is not allowed")
                stack.append((node, True))
                stack.append((node.right, False))
                stack.append((node.left, False))
                continue
            raise ValueError(f"syntax node {type(node).__name__} is not allowed")

        if isinstance(node, ast.UnaryOp):
            operand = values[id(node.operand)]
            values[node_id] = -operand if isinstance(node.op, ast.USub) else operand
            term_bounds[node_id] = term_bounds[id(node.operand)]
            coefficient_bit_bounds[node_id] = coefficient_bit_bounds[
                id(node.operand)
            ]
            continue

        if not isinstance(node, ast.BinOp):
            raise TypeError("expanded polynomial node is not an operation")
        left = values[id(node.left)]
        right = values[id(node.right)]
        left_terms = term_bounds[id(node.left)]
        right_terms = term_bounds[id(node.right)]
        left_bits = coefficient_bit_bounds[id(node.left)]
        right_bits = coefficient_bit_bounds[id(node.right)]
        if isinstance(node.op, ast.Add):
            term_bound = left_terms + right_terms
            coefficient_bit_bound = left_bits + right_bits + 1
            _validate_polynomial_growth(
                term_bound=term_bound,
                coefficient_bit_bound=coefficient_bit_bound,
            )
            values[node_id] = left + right
        elif isinstance(node.op, ast.Sub):
            term_bound = left_terms + right_terms
            coefficient_bit_bound = left_bits + right_bits + 1
            _validate_polynomial_growth(
                term_bound=term_bound,
                coefficient_bit_bound=coefficient_bit_bound,
            )
            values[node_id] = left - right
        elif isinstance(node.op, ast.Mult):
            term_bound = (
                MAX_POLYNOMIAL_TERM_BOUND + 1
                if left_terms > MAX_POLYNOMIAL_TERM_BOUND // right_terms
                else left_terms * right_terms
            )
            coefficient_bit_bound = left_bits + right_bits
            _validate_polynomial_growth(
                term_bound=term_bound,
                coefficient_bit_bound=coefficient_bit_bound,
            )
            values[node_id] = left * right
        elif isinstance(node.op, ast.Div):
            numerator = _ast_integer_literal(node.left)
            denominator = _ast_integer_literal(node.right)
            if numerator is None or denominator is None:
                raise ValueError("division is allowed only in rational literals")
            if denominator == 0:
                raise ValueError("rational literal has zero denominator")
            term_bound = 1
            coefficient_bit_bound = max(
                1,
                abs(numerator).bit_length(),
                abs(denominator).bit_length(),
            )
            _validate_polynomial_growth(
                term_bound=term_bound,
                coefficient_bit_bound=coefficient_bit_bound,
            )
            values[node_id] = sp.Rational(numerator, denominator)
        else:
            exponent = _ast_integer_literal(node.right)
            if exponent is None or not 0 <= exponent <= MAX_EXPONENT:
                raise ValueError(
                    f"exponent is not an integer in 0..{MAX_EXPONENT}"
                )
            term_bound = _bounded_power(
                left_terms,
                exponent,
                MAX_POLYNOMIAL_TERM_BOUND,
            )
            coefficient_bit_bound = (
                1
                if exponent == 0
                else left_bits * exponent
                + exponent * max(1, left_terms.bit_length())
            )
            _validate_polynomial_growth(
                term_bound=term_bound,
                coefficient_bit_bound=coefficient_bit_bound,
            )
            values[node_id] = left**exponent

        term_bounds[node_id] = term_bound
        coefficient_bit_bounds[node_id] = coefficient_bit_bound

    return values[id(root)]


def _validate_total_ast_nodes(root: ast.AST) -> None:
    for node_count, _node in enumerate(ast.walk(root), start=1):
        if node_count > MAX_POLYNOMIAL_AST_NODES:
            raise ValueError(
                f"polynomial exceeds {MAX_POLYNOMIAL_AST_NODES} AST nodes"
            )


def _flatten_additive_terms(root: ast.AST) -> list[tuple[int, ast.AST]]:
    terms: list[tuple[int, ast.AST]] = []
    stack: list[tuple[int, ast.AST]] = [(1, root)]
    while stack:
        sign, node = stack.pop()
        if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.UAdd):
            stack.append((sign, node.operand))
        elif isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub):
            stack.append((-sign, node.operand))
        elif isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
            stack.append((sign, node.right))
            stack.append((sign, node.left))
        elif isinstance(node, ast.BinOp) and isinstance(node.op, ast.Sub):
            stack.append((-sign, node.right))
            stack.append((sign, node.left))
        else:
            terms.append((sign, node))
    return terms


def _rational_coefficient_bits(value: sp.Rational) -> int:
    return max(
        1,
        abs(int(value.p)).bit_length(),
        int(value.q).bit_length(),
    )


def _translate_polynomial_ast_to_poly(
    root: ast.AST,
    symbols: tuple[sp.Symbol, ...],
    symbol_table: dict[str, sp.Symbol],
) -> sp.Poly:
    _validate_total_ast_nodes(root)
    polynomial_symbols = _polynomial_symbols(symbols)
    coefficients: dict[tuple[int, ...], sp.Rational] = {}

    for sign, term_node in _flatten_additive_terms(root):
        expression = _translate_polynomial_ast(term_node, symbol_table)
        term_poly = sp.Poly(expression, *polynomial_symbols, domain=sp.QQ)
        for exponents, coefficient in term_poly.terms():
            signed_coefficient = coefficient if sign > 0 else -coefficient
            coefficient_bits = _rational_coefficient_bits(signed_coefficient)
            if coefficient_bits > MAX_COEFFICIENT_BITS:
                raise ValueError(
                    f"polynomial coefficient exceeds {MAX_COEFFICIENT_BITS} bits"
                )
            previous = coefficients.get(exponents)
            if previous is None:
                if len(coefficients) >= MAX_POLYNOMIAL_TERM_BOUND:
                    raise ValueError(
                        "polynomial expansion exceeds "
                        f"{MAX_POLYNOMIAL_TERM_BOUND} terms"
                    )
                if signed_coefficient:
                    coefficients[exponents] = signed_coefficient
                continue

            _validate_polynomial_growth(
                term_bound=max(1, len(coefficients)),
                coefficient_bit_bound=(
                    _rational_coefficient_bits(previous)
                    + coefficient_bits
                    + 1
                ),
            )
            combined = previous + signed_coefficient
            if _rational_coefficient_bits(combined) > MAX_COEFFICIENT_BITS:
                raise ValueError(
                    f"polynomial coefficient exceeds {MAX_COEFFICIENT_BITS} bits"
                )
            if combined:
                coefficients[exponents] = combined
            else:
                del coefficients[exponents]

    return sp.Poly.from_dict(coefficients, polynomial_symbols, domain=sp.QQ)


def parse_qq_polynomial(
    text: str,
    variable_names: Sequence[str],
) -> tuple[sp.Poly, Polynomial]:
    """Parse one polynomial exactly over QQ and return canonical Lean terms."""

    try:
        normalized = _tokenize_polynomial_source(text, variable_names)
        parsed = ast.parse(normalized, mode="eval")
        symbols = _symbols(variable_names)
        symbol_table = dict(zip(variable_names, symbols, strict=True))
        polynomial = _translate_polynomial_ast_to_poly(
            parsed.body,
            symbols,
            symbol_table,
        )
        terms: list[Term] = []
        for exponents, coefficient in polynomial.terms():
            numerator = int(coefficient.p)
            denominator = int(coefficient.q)
            if max(
                1,
                abs(numerator).bit_length(),
                denominator.bit_length(),
            ) > MAX_COEFFICIENT_BITS:
                raise ValueError(
                    f"polynomial coefficient exceeds {MAX_COEFFICIENT_BITS} bits"
                )
            rational = Fraction(numerator, denominator)
            if rational:
                terms.append((trim_exponent_tail(exponents), rational))
        return polynomial, tuple(terms)
    except Exception as error:
        raise CertificateEmissionError(
            "cannot parse exact QQ polynomial "
            f"{_polynomial_text_label(text)}: {error}"
        ) from error


def _point_coordinates(
    point: int,
    symbols: Sequence[sp.Symbol],
    *,
    point_count: int | None = None,
) -> tuple[sp.Expr, sp.Expr]:
    if point_count is None:
        point_count = len(symbols) // 2 + 2
    if len(symbols) != 2 * (point_count - 2):
        raise CertificateEmissionError(
            "coordinate symbol count disagrees with point count"
        )
    if point == 0:
        return sp.Integer(0), sp.Integer(0)
    if point == 1:
        return sp.Integer(1), sp.Integer(0)
    if 2 <= point < point_count:
        offset = 2 * (point - 2)
        return symbols[offset], symbols[offset + 1]
    raise CertificateEmissionError(
        f"point index {point} is outside the gauge 0..{point_count - 1}"
    )


def _sq_dist(
    left: int,
    right: int,
    symbols: Sequence[sp.Symbol],
    *,
    point_count: int | None = None,
) -> sp.Expr:
    left_x, left_y = _point_coordinates(
        left,
        symbols,
        point_count=point_count,
    )
    right_x, right_y = _point_coordinates(
        right,
        symbols,
        point_count=point_count,
    )
    return (left_x - right_x) ** 2 + (left_y - right_y) ** 2


def _expected_variables(point_count: int) -> tuple[str, ...]:
    return tuple(
        coordinate
        for point in range(2, point_count)
        for coordinate in (f"x{point}x", f"x{point}y")
    )


def _require_exact_fields(
    value: dict[str, Any],
    expected: frozenset[str],
    *,
    label: str,
) -> None:
    actual = set(value)
    if actual == expected:
        return
    missing = sorted(expected - actual)
    unexpected = sorted(actual - expected)
    raise CertificateEmissionError(
        f"{label} fields are not exact: missing={missing}, "
        f"unexpected={unexpected}"
    )


def _require_sha256(value: Any, *, label: str) -> str:
    if not isinstance(value, str) or SHA256_RE.fullmatch(value) is None:
        raise CertificateEmissionError(
            f"{label} is not a lowercase 64-hex SHA-256 digest"
        )
    return value


def _require_bounded_text(
    value: Any,
    *,
    label: str,
    maximum_length: int,
) -> str:
    if not isinstance(value, str) or not value:
        raise CertificateEmissionError(f"{label} is not nonempty text")
    if len(value) > maximum_length:
        raise CertificateEmissionError(
            f"{label} exceeds {maximum_length} characters"
        )
    return value


def _validate_payload_fields(payload: dict[str, Any]) -> str:
    schema = payload.get("schema")
    if schema == SCHEMA:
        expected = _V1_PAYLOAD_FIELDS
    elif schema == GENERIC_SCHEMA:
        expected = _GENERIC_PAYLOAD_FIELDS
    else:
        raise CertificateEmissionError("unexpected certificate schema")
    _require_exact_fields(payload, expected, label="certificate payload")
    return schema


def _validate_payload_hash(payload: dict[str, Any]) -> str:
    claimed = _require_sha256(
        payload.get("certificate_payload_sha256"),
        label="certificate_payload_sha256",
    )
    unsigned = dict(payload)
    unsigned.pop("certificate_payload_sha256")
    actual = _sha256_value(unsigned)
    if claimed != actual:
        raise CertificateEmissionError(
            "certificate payload hash mismatch: "
            f"claimed {claimed}, computed {actual}"
        )
    return actual


def _validate_header(
    payload: dict[str, Any],
    schema: str,
) -> _CertificateHeader:
    _require_bounded_text(
        payload.get("source_system"),
        label="source_system",
        maximum_length=MAX_HEADER_TEXT_LENGTH,
    )
    _require_bounded_text(
        payload.get("scope"),
        label="scope",
        maximum_length=MAX_HEADER_TEXT_LENGTH,
    )
    _require_sha256(
        payload.get("source_system_sha256"),
        label="source_system_sha256",
    )
    _require_sha256(
        payload.get("source_metric_rows_sha256"),
        label="source_metric_rows_sha256",
    )
    if payload.get("coefficient_field") != "QQ":
        raise CertificateEmissionError("certificate coefficient field is not QQ")
    if payload.get("identity") != IDENTITY:
        raise CertificateEmissionError("unexpected certificate identity orientation")

    if schema == SCHEMA:
        point_count = 10
        generator_order = GENERATOR_ORDER
        expected_variables = EXPECTED_VARIABLES
        variable_order_description = "x2x,x2y,...,x9x,x9y"
    else:
        point_count_value = payload.get("point_count")
        if (
            type(point_count_value) is not int
            or not 2 <= point_count_value <= MAX_GENERIC_POINT_COUNT
        ):
            raise CertificateEmissionError(
                "point_count is not an integer in "
                f"2..{MAX_GENERIC_POINT_COUNT}"
            )
        point_count = point_count_value
        generator_order = GENERIC_GENERATOR_ORDER
        expected_variables = _expected_variables(point_count)
        variable_order_description = (
            f"x2x,x2y,...,x{point_count - 1}x,x{point_count - 1}y"
            if point_count > 2
            else "the empty order for the two gauge points"
        )

    if payload.get("generator_order") != generator_order:
        raise CertificateEmissionError("unexpected certificate generator order")
    if payload.get("coordinate_gauge") != EXPECTED_GAUGE:
        raise CertificateEmissionError("coordinate gauge is not P0=(0,0), P1=(1,0)")

    variables = payload.get("variables")
    if (
        not isinstance(variables, list)
        or len(variables) != len(expected_variables)
        or any(
            actual != expected
            for actual, expected in zip(
                variables,
                expected_variables,
                strict=True,
            )
        )
    ):
        raise CertificateEmissionError(
            f"variable order is not {variable_order_description}"
        )
    return _CertificateHeader(
        schema=schema,
        point_count=point_count,
        generator_order=generator_order,
        variables=expected_variables,
    )


def _validate_entries(
    payload: dict[str, Any],
    header: _CertificateHeader,
) -> list[dict[str, Any]]:
    entries = payload.get("entries")
    if not isinstance(entries, list):
        raise CertificateEmissionError("generator entries are not a list")
    entry_count = len(entries)
    if entry_count > MAX_GENERATOR_COUNT:
        raise CertificateEmissionError(
            f"generator entry count exceeds {MAX_GENERATOR_COUNT}"
        )
    if header.schema == SCHEMA and entry_count != 30:
        raise CertificateEmissionError(
            f"expected 30 generator entries, got {entry_count}"
        )
    if header.schema == GENERIC_SCHEMA and entry_count == 0:
        raise CertificateEmissionError(
            "generic certificate must contain at least one generator entry"
        )

    expected_fields = (
        _V1_ENTRY_FIELDS if header.schema == SCHEMA else _GENERIC_ENTRY_FIELDS
    )
    for position, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise CertificateEmissionError(
                f"generator entry {position} is not an object"
            )
        _require_exact_fields(
            entry,
            expected_fields,
            label=f"generator entry {position}",
        )

    indices = [entry["index"] for entry in entries]
    if any(type(index) is not int for index in indices) or indices != list(
        range(entry_count)
    ):
        raise CertificateEmissionError(
            f"generator indices are not exactly 0..{entry_count - 1}"
        )
    singular_indices = [entry["singular_index"] for entry in entries]
    if any(type(index) is not int for index in singular_indices) or singular_indices != list(
        range(1, entry_count + 1)
    ):
        raise CertificateEmissionError(
            f"Singular indices are not exactly 1..{entry_count}"
        )

    if header.schema == SCHEMA:
        positions = [
            (entry["row_index"], entry["support_position"]) for entry in entries
        ]
        if any(
            type(value) is not int for position in positions for value in position
        ) or positions != list(EXPECTED_GENERATOR_POSITIONS):
            raise CertificateEmissionError(
                "generator stream is not row index then support positions 1,2,3"
            )

    names = [entry.get("name") for entry in entries]
    if (
        any(
            not isinstance(name, str)
            or not name
            or len(name) > MAX_ENTRY_NAME_LENGTH
            for name in names
        )
        or len(set(names)) != entry_count
    ):
        raise CertificateEmissionError(
            "generator names are missing, too long, or not unique"
        )

    for entry in entries:
        for field in ("center", "pivot", "target"):
            point = entry[field]
            if type(point) is not int:
                raise CertificateEmissionError(
                    f"generator {entry['index']} {field} is not integral"
                )
            if not 0 <= point < header.point_count:
                raise CertificateEmissionError(
                    f"generator {entry['index']} {field} point index {point} "
                    f"is outside 0..{header.point_count - 1}"
                )
    return entries


def _validate_replay_budget(
    entries: Sequence[dict[str, Any]],
    *,
    variable_count: int,
) -> None:
    total_text_characters = 0
    for entry in entries:
        for field in ("polynomial", "cofactor"):
            value = entry[field]
            if not isinstance(value, str):
                raise CertificateEmissionError(
                    f"generator {entry['index']} {field} is not text"
                )
            if not value:
                raise CertificateEmissionError(
                    f"generator {entry['index']} {field} is empty"
                )
            if len(value) > MAX_POLYNOMIAL_TEXT_LENGTH:
                raise CertificateEmissionError(
                    f"generator {entry['index']} {field} exceeds "
                    f"{MAX_POLYNOMIAL_TEXT_LENGTH} characters"
                )
            total_text_characters += len(value)
            if total_text_characters > MAX_REPLAY_TEXT_CHARACTERS:
                raise CertificateEmissionError(
                    "certificate polynomial text exceeds replay budget"
                )

    work_units = (
        total_text_characters * (variable_count + 1)
        + len(entries) * REPLAY_ENTRY_WORK_UNITS
    )
    if work_units > MAX_REPLAY_WORK_UNITS:
        raise CertificateEmissionError(
            f"certificate replay work {work_units} exceeds "
            f"{MAX_REPLAY_WORK_UNITS} units"
        )


def _validate_cofactor_stream_hash(
    payload: dict[str, Any],
    entries: Sequence[dict[str, Any]],
) -> None:
    claimed = _require_sha256(
        payload.get("cofactor_stream_sha256"),
        label="cofactor_stream_sha256",
    )
    cofactors = [entry.get("cofactor") for entry in entries]
    if any(not isinstance(cofactor, str) for cofactor in cofactors):
        raise CertificateEmissionError("a cofactor is missing or not text")
    actual = _sha256_value(cofactors)
    if claimed != actual:
        raise CertificateEmissionError(
            "cofactor stream hash mismatch: "
            f"claimed {claimed!r}, computed {actual}"
        )


def _read_certificate_json(path: Path) -> Any:
    try:
        with path.open("rb") as stream:
            raw = stream.read(MAX_CERTIFICATE_JSON_BYTES + 1)
    except (OSError, MemoryError) as error:
        raise CertificateEmissionError(f"cannot read certificate {path}: {error}") from error
    if len(raw) > MAX_CERTIFICATE_JSON_BYTES:
        raise CertificateEmissionError(
            f"certificate JSON exceeds {MAX_CERTIFICATE_JSON_BYTES} bytes"
        )
    try:
        text = raw.decode("utf-8")
    except UnicodeError as error:
        raise CertificateEmissionError(
            f"certificate {path} is not valid UTF-8: {error}"
        ) from error
    try:
        return json.loads(
            text,
            object_pairs_hook=_object_without_duplicate_keys,
            parse_constant=_reject_nonfinite_json_constant,
            parse_float=_reject_json_float,
        )
    except CertificateEmissionError:
        raise
    except (MemoryError, RecursionError, ValueError) as error:
        raise CertificateEmissionError(
            f"cannot parse certificate JSON {path}: {error}"
        ) from error


def load_certificate(path: Path) -> LeanCertificate:
    """Load, exact-replay, and canonicalize one certificate artifact."""

    payload = _read_certificate_json(path)
    if not isinstance(payload, dict):
        raise CertificateEmissionError("certificate JSON root is not an object")

    schema = _validate_payload_fields(payload)
    header = _validate_header(payload, schema)
    variables = header.variables
    entries = _validate_entries(payload, header)
    _validate_replay_budget(entries, variable_count=len(variables))
    payload_sha256 = _validate_payload_hash(payload)
    _validate_cofactor_stream_hash(payload, entries)

    symbols = _symbols(variables)
    polynomial_symbols = _polynomial_symbols(symbols)
    total = sp.Poly(0, *polynomial_symbols, domain=sp.QQ)
    facts: list[Polynomial] = []
    cofactors: list[tuple[int, Polynomial]] = []
    algebra_work_units = 0
    for entry in entries:
        polynomial_text = entry.get("polynomial")
        cofactor_text = entry.get("cofactor")
        if not isinstance(polynomial_text, str) or not isinstance(cofactor_text, str):
            raise CertificateEmissionError("generator polynomial or cofactor is missing")

        fact_poly, fact_terms = parse_qq_polynomial(polynomial_text, variables)
        cofactor_poly, cofactor_terms = parse_qq_polynomial(cofactor_text, variables)

        center = entry["center"]
        pivot = entry["pivot"]
        target = entry["target"]
        expected = sp.Poly(
            _sq_dist(
                center,
                pivot,
                symbols,
                point_count=header.point_count,
            )
            - _sq_dist(
                center,
                target,
                symbols,
                point_count=header.point_count,
            ),
            *polynomial_symbols,
            domain=sp.QQ,
        )
        if fact_poly != expected:
            raise CertificateEmissionError(
                f"generator {entry['index']} has wrong metric orientation"
            )

        facts.append(fact_terms)
        product_term_bound = len(cofactor_terms) * len(fact_terms)
        algebra_work_units += (
            len(fact_terms) + len(cofactor_terms) + product_term_bound
        )
        if algebra_work_units > MAX_REPLAY_ALGEBRA_WORK_UNITS:
            raise CertificateEmissionError(
                "certificate algebra replay exceeds "
                f"{MAX_REPLAY_ALGEBRA_WORK_UNITS} work units"
            )
        if cofactor_terms and fact_terms:
            try:
                total += cofactor_poly * fact_poly
            except Exception as error:
                raise CertificateEmissionError(
                    "exact QQ replay failed while multiplying generator "
                    f"{entry['index']}: {type(error).__name__}"
                ) from error
        if cofactor_terms:
            cofactors.append((entry["index"], cofactor_terms))

    try:
        replay_is_one = total == sp.Poly(1, *polynomial_symbols, domain=sp.QQ)
    except Exception as error:
        raise CertificateEmissionError(
            f"exact QQ replay comparison failed: {type(error).__name__}"
        ) from error
    if not replay_is_one:
        raise CertificateEmissionError("exact QQ replay is not one")

    source_system_sha256 = payload["source_system_sha256"]
    source_metric_rows_sha256 = payload["source_metric_rows_sha256"]

    return LeanCertificate(
        source_path=path,
        payload_sha256=payload_sha256,
        source_system_sha256=source_system_sha256,
        source_metric_rows_sha256=source_metric_rows_sha256,
        variables=variables,
        facts=tuple(facts),
        cofactors=tuple(cofactors),
        schema=header.schema,
        point_count=header.point_count,
        generator_order=header.generator_order,
    )


def _lean_monomial(monomial: Monomial) -> str:
    return "[" + ", ".join(str(exponent) for exponent in monomial) + "]"


def _lean_rational(value: Fraction) -> str:
    numerator = value.numerator
    denominator = value.denominator
    if denominator == 1:
        return f"({numerator} : ℚ)"
    return f"(({numerator} : ℚ) / ({denominator} : ℚ))"


def _render_polynomial(polynomial: Polynomial, indent: int) -> list[str]:
    prefix = " " * indent
    if not polynomial:
        return [f"{prefix}[]"]
    lines = [f"{prefix}["]
    for index, (monomial, coefficient) in enumerate(polynomial):
        comma = "," if index + 1 < len(polynomial) else ""
        lines.append(
            f"{prefix}  ({_lean_monomial(monomial)}, "
            f"{_lean_rational(coefficient)}){comma}"
        )
    lines.append(f"{prefix}]")
    return lines


def _append_suffix(lines: list[str], suffix: str) -> None:
    lines[-1] += suffix


def _validate_render_certificate(certificate: LeanCertificate) -> None:
    if certificate.schema == SCHEMA:
        expected_point_count = 10
        expected_variables = EXPECTED_VARIABLES
        expected_generator_order = GENERATOR_ORDER
        expected_fact_count = 30
    elif certificate.schema == GENERIC_SCHEMA:
        expected_point_count = certificate.point_count
        if (
            type(expected_point_count) is not int
            or not 2 <= expected_point_count <= MAX_GENERIC_POINT_COUNT
        ):
            raise CertificateEmissionError(
                "generic certificate point count is not an integer in "
                f"2..{MAX_GENERIC_POINT_COUNT}"
            )
        expected_variables = _expected_variables(expected_point_count)
        expected_generator_order = GENERIC_GENERATOR_ORDER
        expected_fact_count = None
    else:
        raise CertificateEmissionError("unexpected certificate schema")

    if certificate.point_count != expected_point_count:
        raise CertificateEmissionError("certificate point count disagrees with schema")
    if certificate.variables != expected_variables:
        raise CertificateEmissionError("certificate variable order disagrees with schema")
    if certificate.generator_order != expected_generator_order:
        raise CertificateEmissionError("certificate generator order disagrees with schema")
    if expected_fact_count is not None and len(certificate.facts) != expected_fact_count:
        raise CertificateEmissionError("v1 certificate does not contain exactly 30 facts")
    if certificate.schema == GENERIC_SCHEMA and not certificate.facts:
        raise CertificateEmissionError("generic certificate does not contain any facts")
    if any(not 0 <= index < len(certificate.facts) for index, _ in certificate.cofactors):
        raise CertificateEmissionError("certificate contains an out-of-range cofactor index")
    _require_sha256(certificate.payload_sha256, label="certificate payload hash")
    _require_sha256(certificate.source_system_sha256, label="source system hash")
    _require_sha256(
        certificate.source_metric_rows_sha256,
        label="source metric rows hash",
    )


def _validate_artifact_label(artifact_label: str) -> None:
    if not isinstance(artifact_label, str) or not artifact_label:
        raise CertificateEmissionError("artifact label must be nonempty text")
    if len(artifact_label) > MAX_ARTIFACT_LABEL_LENGTH:
        raise CertificateEmissionError(
            f"artifact label exceeds {MAX_ARTIFACT_LABEL_LENGTH} characters"
        )
    if "/-" in artifact_label or "-/" in artifact_label:
        raise CertificateEmissionError(
            "artifact label must not contain a Lean block-comment delimiter"
        )
    if any(unicodedata.category(character).startswith("C") for character in artifact_label):
        raise CertificateEmissionError("artifact label must not contain control characters")


def render_module(
    certificate: LeanCertificate,
    *,
    namespace: str,
    artifact_label: str,
) -> str:
    """Render a standalone generated Lean checker module."""

    _validate_render_certificate(certificate)
    if LEAN_NAMESPACE_RE.fullmatch(namespace) is None:
        raise CertificateEmissionError(f"invalid Lean namespace {namespace!r}")
    namespace_parts = namespace.split(".")
    if namespace_parts[0] != "Problem97":
        raise CertificateEmissionError("generated namespace must be under Problem97")
    _validate_artifact_label(artifact_label)

    is_generic = certificate.schema == GENERIC_SCHEMA
    if is_generic:
        heading = f"# Generated exact metric QQ unit checker: {artifact_label}"
        coverage_lines = (
            "`false_of_facts_eval_zero` handoff. It proves no coverage or",
            "P97 closure theorem.",
        )
        fact_count_text = str(len(certificate.facts))
    else:
        heading = f"# Generated Phase-3 QQ unit checker: {artifact_label}"
        coverage_lines = (
            "`false_of_facts_eval_zero` handoff. It proves no Phase-3 coverage or",
            "P97 closure theorem.",
        )
        fact_count_text = "30"

    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "import Erdos9796Proof.P97.U5GramCertPoly",
        "",
        "/-!",
        heading,
        "",
        "Generated by",
        "`census/p97_search/phase3_qq_certificate_lean_emitter.py`; do not edit",
        "this module directly.",
        "",
        "This file contains only exact generated SparsePoly data, a Boolean",
        "unit-ideal check, an index-bound audit, and the theorem-facing",
        *coverage_lines,
        "",
        f"Certificate payload SHA-256: `{certificate.payload_sha256}`.",
        f"Source system SHA-256: `{certificate.source_system_sha256}`.",
        f"Source metric rows SHA-256: `{certificate.source_metric_rows_sha256}`.",
        "-/",
        "",
        "set_option linter.style.longLine false",
        "set_option linter.style.nativeDecide false",
        "set_option maxRecDepth 100000",
        "",
    ]
    for part in namespace_parts:
        lines.append(f"namespace {part}")
    lines.extend(
        [
            "",
            "open U5GramCert",
            "",
        ]
    )
    if is_generic:
        lines.extend(
            [
                "/-- Number of gauge-free coordinate variables in every polynomial. -/",
                f"def variableCount : ℕ := {certificate.variable_count}",
                "",
            ]
        )
    lines.extend(
        [
            "set_option maxHeartbeats 0 in",
            "-- Generated exact polynomial data can exceed the default heartbeat budget.",
            f"/-- The {fact_count_text} facts in exact artifact generator order. -/",
            "def facts : List SparsePoly :=",
            "[",
        ]
    )
    for index, polynomial in enumerate(certificate.facts):
        polynomial_lines = _render_polynomial(polynomial, 2)
        if index + 1 < len(certificate.facts):
            _append_suffix(polynomial_lines, ",")
        lines.extend(polynomial_lines)
    lines.extend(
        [
            "]",
            "",
            "set_option maxHeartbeats 0 in",
            "-- Generated exact polynomial data can exceed the default heartbeat budget.",
            "/-- Nonzero cofactors paired with their original zero-based fact indices. -/",
            "def cofactors : List (ℕ × SparsePoly) :=",
            "[",
        ]
    )
    for pair_index, (fact_index, polynomial) in enumerate(certificate.cofactors):
        polynomial_lines = _render_polynomial(polynomial, 4)
        polynomial_lines[0] = f"  ({fact_index}, " + polynomial_lines[0].lstrip()
        _append_suffix(polynomial_lines, ")")
        if pair_index + 1 < len(certificate.cofactors):
            _append_suffix(polynomial_lines, ",")
        lines.extend(polynomial_lines)
    lines.extend(
        [
            "]",
            "",
            "set_option maxRecDepth 100000 in",
            "set_option maxHeartbeats 0 in",
            "-- Reduction over the generated certificate can exceed the default budget.",
            "/-- Every emitted cofactor retains an in-range artifact fact index. -/",
            "theorem cofactor_indices_lt :",
            "    ∀ ic ∈ cofactors, ic.1 < facts.length := by",
            "  native_decide",
            "",
            "set_option maxRecDepth 100000 in",
            "set_option maxHeartbeats 0 in",
            "-- Exact normalized certificate checking can exceed the default budget.",
            "/-- The normalized SparsePoly checker accepts the exact QQ identity. -/",
            "theorem checker :",
            "    unitIdealCertCheckerNormalized facts cofactors = true := by",
            "  native_decide",
            "",
            f"/-- Any valuation satisfying all {fact_count_text} artifact facts is contradictory. -/",
            "theorem false_of_facts_eval_zero (ν : ℕ → ℝ)",
            "    (hfacts : ∀ f ∈ facts, eval ν f = 0) : False := by",
            "  exact false_of_unitIdealCertCheckerNormalized",
            "    ν facts cofactors checker hfacts",
            "",
        ]
    )
    for part in reversed(namespace_parts):
        lines.append(f"end {part}")
    lines.append("")
    return "\n".join(lines)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--namespace", required=True)
    parser.add_argument("--artifact-label", required=True)
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail unless OUTPUT already equals the deterministic rendering",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    certificate = load_certificate(args.certificate.resolve())
    rendered = render_module(
        certificate,
        namespace=args.namespace,
        artifact_label=args.artifact_label,
    )
    output = args.output.resolve()
    if args.check:
        try:
            existing = output.read_text()
        except OSError as error:
            raise SystemExit(f"cannot read generated output {output}: {error}") from error
        if existing != rendered:
            raise SystemExit(f"generated output is stale: {output}")
        print(f"PASS {output}")
        return 0

    output.parent.mkdir(parents=True, exist_ok=True)
    temporary_path: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(
            "w",
            encoding="utf-8",
            dir=output.parent,
            prefix=f".{output.name}.",
            suffix=".tmp",
            delete=False,
        ) as temporary:
            temporary.write(rendered)
            temporary.flush()
            os.fsync(temporary.fileno())
            temporary_path = Path(temporary.name)
        temporary_path.replace(output)
    finally:
        if temporary_path is not None and temporary_path.exists():
            temporary_path.unlink()
    print(
        f"WROTE {output} "
        f"facts={len(certificate.facts)} "
        f"nonzero_cofactors={len(certificate.cofactors)}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
