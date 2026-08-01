#!/usr/bin/env python3
"""Emit Lean SparsePoly data from a Phase-3 exact QQ certificate.

The input format is the checked Singular/SymPy certificate JSON produced by
``phase3_survivor_singular_cert_2_20260729/extract_and_replay.py``.  Emission
fails closed unless the artifact hashes, generator metadata and orientation,
and exact unit-ideal identity all replay over ``QQ``.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import tempfile
from collections.abc import Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

import sympy as sp

SCHEMA = "p97-phase3-survivor-qq-nullstellensatz-certificate-v1"
IDENTITY = "1 = sum_i cofactor_i * generator_i"
GENERATOR_ORDER = "row index, then support positions 1,2,3"
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


def parse_qq_polynomial(
    text: str,
    variable_names: Sequence[str],
) -> tuple[sp.Poly, Polynomial]:
    """Parse one polynomial exactly over QQ and return canonical Lean terms."""

    symbols = _symbols(variable_names)
    try:
        expression = sp.sympify(
            text.replace("^", "**"),
            locals={str(symbol): symbol for symbol in symbols},
            evaluate=True,
        )
        polynomial = sp.Poly(expression, *symbols, domain=sp.QQ)
    except (sp.SympifyError, sp.PolynomialError, ValueError, TypeError) as error:
        raise CertificateEmissionError(
            f"cannot parse exact QQ polynomial {text!r}: {error}"
        ) from error

    terms: list[Term] = []
    for exponents, coefficient in polynomial.terms():
        rational = Fraction(int(coefficient.p), int(coefficient.q))
        if rational:
            terms.append((trim_exponent_tail(exponents), rational))
    return polynomial, tuple(terms)


def _point_coordinates(
    point: int,
    symbols: Sequence[sp.Symbol],
) -> tuple[sp.Expr, sp.Expr]:
    if point == 0:
        return sp.Integer(0), sp.Integer(0)
    if point == 1:
        return sp.Integer(1), sp.Integer(0)
    if 2 <= point <= 9:
        offset = 2 * (point - 2)
        return symbols[offset], symbols[offset + 1]
    raise CertificateEmissionError(f"point index {point} is outside the gauge 0..9")


def _sq_dist(
    left: int,
    right: int,
    symbols: Sequence[sp.Symbol],
) -> sp.Expr:
    left_x, left_y = _point_coordinates(left, symbols)
    right_x, right_y = _point_coordinates(right, symbols)
    return (left_x - right_x) ** 2 + (left_y - right_y) ** 2


def _validate_payload_hash(payload: dict[str, Any]) -> str:
    claimed = payload.get("certificate_payload_sha256")
    if not isinstance(claimed, str):
        raise CertificateEmissionError("certificate_payload_sha256 is missing")
    unsigned = dict(payload)
    unsigned.pop("certificate_payload_sha256")
    actual = _sha256_value(unsigned)
    if claimed != actual:
        raise CertificateEmissionError(
            "certificate payload hash mismatch: "
            f"claimed {claimed}, computed {actual}"
        )
    return actual


def _validate_header(payload: dict[str, Any]) -> tuple[str, ...]:
    if payload.get("schema") != SCHEMA:
        raise CertificateEmissionError("unexpected certificate schema")
    if payload.get("coefficient_field") != "QQ":
        raise CertificateEmissionError("certificate coefficient field is not QQ")
    if payload.get("identity") != IDENTITY:
        raise CertificateEmissionError("unexpected certificate identity orientation")
    if payload.get("generator_order") != GENERATOR_ORDER:
        raise CertificateEmissionError("unexpected certificate generator order")
    if payload.get("coordinate_gauge") != EXPECTED_GAUGE:
        raise CertificateEmissionError("coordinate gauge is not P0=(0,0), P1=(1,0)")

    variables = payload.get("variables")
    if not isinstance(variables, list) or tuple(variables) != EXPECTED_VARIABLES:
        raise CertificateEmissionError(
            "variable order is not x2x,x2y,...,x9x,x9y"
        )
    return tuple(variables)


def _validate_entries(payload: dict[str, Any]) -> list[dict[str, Any]]:
    entries = payload.get("entries")
    if not isinstance(entries, list) or len(entries) != 30:
        count = len(entries) if isinstance(entries, list) else "non-list"
        raise CertificateEmissionError(f"expected 30 generator entries, got {count}")
    if [entry.get("index") for entry in entries] != list(range(30)):
        raise CertificateEmissionError("generator indices are not exactly 0..29")
    if [entry.get("singular_index") for entry in entries] != list(range(1, 31)):
        raise CertificateEmissionError("Singular indices are not exactly 1..30")
    if [
        (entry.get("row_index"), entry.get("support_position")) for entry in entries
    ] != list(EXPECTED_GENERATOR_POSITIONS):
        raise CertificateEmissionError(
            "generator stream is not row index then support positions 1,2,3"
        )
    names = [entry.get("name") for entry in entries]
    if any(not isinstance(name, str) for name in names) or len(set(names)) != 30:
        raise CertificateEmissionError("generator names are missing or not unique")
    return entries


def _validate_cofactor_stream_hash(
    payload: dict[str, Any],
    entries: Sequence[dict[str, Any]],
) -> None:
    claimed = payload.get("cofactor_stream_sha256")
    cofactors = [entry.get("cofactor") for entry in entries]
    if any(not isinstance(cofactor, str) for cofactor in cofactors):
        raise CertificateEmissionError("a cofactor is missing or not text")
    actual = _sha256_value(cofactors)
    if claimed != actual:
        raise CertificateEmissionError(
            "cofactor stream hash mismatch: "
            f"claimed {claimed!r}, computed {actual}"
        )


def load_certificate(path: Path) -> LeanCertificate:
    """Load, exact-replay, and canonicalize one certificate artifact."""

    try:
        payload = json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as error:
        raise CertificateEmissionError(f"cannot read certificate {path}: {error}") from error
    if not isinstance(payload, dict):
        raise CertificateEmissionError("certificate JSON root is not an object")

    payload_sha256 = _validate_payload_hash(payload)
    variables = _validate_header(payload)
    entries = _validate_entries(payload)
    _validate_cofactor_stream_hash(payload, entries)

    symbols = _symbols(variables)
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    facts: list[Polynomial] = []
    cofactors: list[tuple[int, Polynomial]] = []
    for entry in entries:
        polynomial_text = entry.get("polynomial")
        cofactor_text = entry.get("cofactor")
        if not isinstance(polynomial_text, str) or not isinstance(cofactor_text, str):
            raise CertificateEmissionError("generator polynomial or cofactor is missing")

        fact_poly, fact_terms = parse_qq_polynomial(polynomial_text, variables)
        cofactor_poly, cofactor_terms = parse_qq_polynomial(cofactor_text, variables)

        center = entry.get("center")
        pivot = entry.get("pivot")
        target = entry.get("target")
        if not all(isinstance(point, int) and not isinstance(point, bool) for point in (center, pivot, target)):
            raise CertificateEmissionError("generator point metadata is not integral")
        expected = sp.Poly(
            _sq_dist(center, pivot, symbols) - _sq_dist(center, target, symbols),
            *symbols,
            domain=sp.QQ,
        )
        if fact_poly != expected:
            raise CertificateEmissionError(
                f"generator {entry['index']} has wrong metric orientation"
            )

        facts.append(fact_terms)
        total += cofactor_poly * fact_poly
        if cofactor_terms:
            cofactors.append((entry["index"], cofactor_terms))

    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise CertificateEmissionError(
            f"exact QQ replay is not one: {sp.sstr(total.as_expr())}"
        )

    source_system_sha256 = payload.get("source_system_sha256")
    source_metric_rows_sha256 = payload.get("source_metric_rows_sha256")
    if not isinstance(source_system_sha256, str) or not isinstance(
        source_metric_rows_sha256, str
    ):
        raise CertificateEmissionError("source artifact hashes are missing")

    return LeanCertificate(
        source_path=path,
        payload_sha256=payload_sha256,
        source_system_sha256=source_system_sha256,
        source_metric_rows_sha256=source_metric_rows_sha256,
        variables=variables,
        facts=tuple(facts),
        cofactors=tuple(cofactors),
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


def render_module(
    certificate: LeanCertificate,
    *,
    namespace: str,
    artifact_label: str,
) -> str:
    """Render a standalone generated Lean checker module."""

    if LEAN_NAMESPACE_RE.fullmatch(namespace) is None:
        raise CertificateEmissionError(f"invalid Lean namespace {namespace!r}")
    namespace_parts = namespace.split(".")
    if namespace_parts[0] != "Problem97":
        raise CertificateEmissionError("generated namespace must be under Problem97")
    if not artifact_label or "\n" in artifact_label:
        raise CertificateEmissionError("artifact label must be nonempty and single-line")

    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "import Erdos9796Proof.P97.U5GramCertPoly",
        "",
        "/-!",
        f"# Generated Phase-3 QQ unit checker: {artifact_label}",
        "",
        "Generated by",
        "`census/p97_search/phase3_qq_certificate_lean_emitter.py`; do not edit",
        "this module directly.",
        "",
        "This file contains only exact generated SparsePoly data, a Boolean",
        "unit-ideal check, an index-bound audit, and the theorem-facing",
        "`false_of_facts_eval_zero` handoff. It proves no Phase-3 coverage or",
        "P97 closure theorem.",
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
            "set_option maxHeartbeats 0 in",
            "-- Generated exact polynomial data can exceed the default heartbeat budget.",
            "/-- The 30 facts in exact artifact generator order. -/",
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
            "/-- Any valuation satisfying all 30 artifact facts is contradictory. -/",
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
