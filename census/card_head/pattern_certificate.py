"""Exact verifier for AHEAD equality-only pattern certificates.

The external algebra engines are proposal generators.  A pattern is usable by
the permanent CEGAR layer only after this module reconstructs every expected
equidistance and Rabinowitsch generator from the pattern, parses the proposed
cofactors, and checks the Nullstellensatz identity in exact ``Fraction``
arithmetic.

This verifier is cardinality-generic for every authorized card-12--14 profile.
Its result is externally exact certificate evidence, not a Lean kernel proof or
the missing geometric profile-to-cube bridge.
"""

from __future__ import annotations

import hashlib
import json
import re
from collections.abc import Collection, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from typing import Any, TypeAlias

from .candidate_surface import CapHeadModel, cube_ok
from .historical_bank import (
    normalize_pattern,
    pattern_key,
    pattern_points,
    window_shape_canon,
)


CERTIFICATE_SCHEMA = "p97_ahead_pattern_certificate.v1"
LEGACY_CERTIFICATE_SCHEMA = "census12_pattern_certificate.v1"
VERIFICATION_SCHEMA = "p97_ahead_pattern_certificate_verification.v1"
IDENTITY = "sum_i coefficients[i]*generators[i] = 1"
GAUGE = "pt0=(0,0), pt1=(1,0)"
VERIFICATION_SCOPE = (
    "Externally exact rational verification of one finite pattern identity; "
    "not a Lean kernel proof or geometric closure theorem"
)

Monomial: TypeAlias = tuple[tuple[int, int], ...]
Polynomial: TypeAlias = dict[Monomial, Fraction]

_VARIABLE = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)(?:\^(\d+))?$")


class CertificateError(ValueError):
    """A proposed certificate is malformed or fails exact replay."""


def _canonical_bytes(value: Any) -> bytes:
    try:
        encoded = json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        )
    except (TypeError, ValueError) as exc:
        raise CertificateError("certificate is not finite JSON data") from exc
    return encoded.encode("utf-8")


def _constant(value: int | Fraction) -> Polynomial:
    coefficient = Fraction(value)
    return {(): coefficient} if coefficient else {}


def _variable(index: int) -> Polynomial:
    return {((index, 1),): Fraction(1)}


def polynomial_add(first: Polynomial, second: Polynomial) -> Polynomial:
    result = dict(first)
    for monomial, coefficient in second.items():
        updated = result.get(monomial, Fraction(0)) + coefficient
        if updated:
            result[monomial] = updated
        else:
            result.pop(monomial, None)
    return result


def polynomial_negate(value: Polynomial) -> Polynomial:
    return {monomial: -coefficient for monomial, coefficient in value.items()}


def polynomial_subtract(first: Polynomial, second: Polynomial) -> Polynomial:
    return polynomial_add(first, polynomial_negate(second))


def _multiply_monomials(first: Monomial, second: Monomial) -> Monomial:
    exponents: dict[int, int] = {}
    for index, exponent in (*first, *second):
        exponents[index] = exponents.get(index, 0) + exponent
    return tuple(sorted(exponents.items()))


def polynomial_multiply(first: Polynomial, second: Polynomial) -> Polynomial:
    result: Polynomial = {}
    for first_monomial, first_coefficient in first.items():
        for second_monomial, second_coefficient in second.items():
            monomial = _multiply_monomials(first_monomial, second_monomial)
            updated = (
                result.get(monomial, Fraction(0))
                + first_coefficient * second_coefficient
            )
            if updated:
                result[monomial] = updated
            else:
                result.pop(monomial, None)
    return result


@dataclass(frozen=True, slots=True)
class PolynomialContext:
    """Gauge-fixed coordinate-polynomial context for one cardinality."""

    cardinality: int
    coordinate_variables: tuple[str, ...]

    @classmethod
    def build(cls, cardinality: int) -> "PolynomialContext":
        if cardinality < 3:
            raise CertificateError("cardinality must be at least three")
        variables = tuple(
            f"x{point}{axis}"
            for point in range(2, cardinality)
            for axis in ("x", "y")
        )
        return cls(cardinality, variables)

    def coordinate(self, point: int) -> tuple[Polynomial, Polynomial]:
        if not 0 <= point < self.cardinality:
            raise CertificateError("point is outside the polynomial context")
        if point == 0:
            return _constant(0), _constant(0)
        if point == 1:
            return _constant(1), _constant(0)
        offset = 2 * (point - 2)
        return _variable(offset), _variable(offset + 1)

    def squared_distance(self, first: int, second: int) -> Polynomial:
        first_coordinate = self.coordinate(first)
        second_coordinate = self.coordinate(second)
        dx = polynomial_subtract(first_coordinate[0], second_coordinate[0])
        dy = polynomial_subtract(first_coordinate[1], second_coordinate[1])
        return polynomial_add(
            polynomial_multiply(dx, dx),
            polynomial_multiply(dy, dy),
        )

    def variable_name(self, index: int) -> str:
        if index < len(self.coordinate_variables):
            return self.coordinate_variables[index]
        return f"t{index - len(self.coordinate_variables)}"


def pattern_polynomials(
    context: PolynomialContext,
    pattern: Mapping[int, Collection[int]],
) -> tuple[list[Polynomial], list[list[int]]]:
    """Return the exact equidistance generators and their structural tags."""

    polynomials: list[Polynomial] = []
    tags: list[list[int]] = []
    for center in sorted(pattern):
        members = sorted(pattern[center])
        base_member = members[0]
        base_distance = context.squared_distance(center, base_member)
        for member in members[1:]:
            polynomial = polynomial_subtract(
                base_distance,
                context.squared_distance(center, member),
            )
            if polynomial:
                polynomials.append(polynomial)
                tags.append([center, base_member, member])
    return polynomials, tags


def rabinowitsch_polynomials(
    context: PolynomialContext,
    pairs: Sequence[tuple[int, int]],
) -> list[Polynomial]:
    """Return ``t*d2(a,b)-1`` for the declared distinctness pairs."""

    result: list[Polynomial] = []
    first_slack = len(context.coordinate_variables)
    for offset, (first, second) in enumerate(pairs):
        slack = _variable(first_slack + offset)
        distance = context.squared_distance(first, second)
        result.append(
            polynomial_add(
                polynomial_multiply(slack, distance),
                _constant(-1),
            )
        )
    return result


def _used_variable_indices(polynomials: Sequence[Polynomial]) -> list[int]:
    return sorted(
        {
            index
            for polynomial in polynomials
            for monomial in polynomial
            for index, _exponent in monomial
        }
    )


def _remap_polynomial(
    polynomial: Polynomial, remapping: Mapping[int, int]
) -> Polynomial:
    return {
        tuple(sorted((remapping[index], exponent) for index, exponent in monomial)):
        coefficient
        for monomial, coefficient in polynomial.items()
    }


def expected_generators(
    context: PolynomialContext,
    pattern: Mapping[int, Collection[int]],
    rab_pairs: Sequence[tuple[int, int]],
) -> tuple[list[str], list[Polynomial], list[list[Any]]]:
    """Reconstruct the compact variable list and every expected generator."""

    equidistance, tags = pattern_polynomials(context, pattern)
    rabinowitsch = rabinowitsch_polynomials(context, rab_pairs)
    generators = equidistance + rabinowitsch
    used = _used_variable_indices(generators)
    remapping = {old: new for new, old in enumerate(used)}
    variables = [context.variable_name(index) for index in used]
    generator_tags: list[list[Any]] = [*tags]
    generator_tags.extend(["rab", first, second] for first, second in rab_pairs)
    return (
        variables,
        [_remap_polynomial(polynomial, remapping) for polynomial in generators],
        generator_tags,
    )


def _strip_outer_parentheses(value: str) -> str:
    while value.startswith("(") and value.endswith(")"):
        depth = 0
        encloses_all = True
        for index, character in enumerate(value):
            if character == "(":
                depth += 1
            elif character == ")":
                depth -= 1
                if depth < 0:
                    raise CertificateError("unbalanced polynomial parentheses")
            if depth == 0 and index != len(value) - 1:
                encloses_all = False
                break
        if depth != 0:
            raise CertificateError("unbalanced polynomial parentheses")
        if not encloses_all:
            break
        value = value[1:-1]
    return value


def _split_terms(value: str) -> list[str]:
    terms: list[str] = []
    start = 0
    depth = 0
    for index, character in enumerate(value):
        if character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
            if depth < 0:
                raise CertificateError("unbalanced polynomial parentheses")
        elif character in "+-" and depth == 0 and index > start:
            terms.append(value[start:index])
            start = index
    if depth != 0:
        raise CertificateError("unbalanced polynomial parentheses")
    terms.append(value[start:])
    return terms


def _split_factors(value: str) -> list[str]:
    factors: list[str] = []
    start = 0
    depth = 0
    for index, character in enumerate(value):
        if character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
            if depth < 0:
                raise CertificateError("unbalanced polynomial parentheses")
        elif character == "*" and depth == 0:
            factors.append(value[start:index])
            start = index + 1
    if depth != 0:
        raise CertificateError("unbalanced polynomial parentheses")
    factors.append(value[start:])
    return factors


def parse_polynomial(value: Any, variables: Sequence[str]) -> Polynomial:
    """Parse the restricted expanded polynomial syntax emitted by Singular."""

    if not isinstance(value, str):
        raise CertificateError("certificate polynomial must be a string")
    compact = value.replace(" ", "")
    if compact in ("", "0"):
        return {}
    if len(set(variables)) != len(variables):
        raise CertificateError("certificate variable list contains duplicates")
    name_to_index = {name: index for index, name in enumerate(variables)}
    result: Polynomial = {}
    for raw_term in _split_terms(compact):
        if not raw_term:
            raise CertificateError("certificate polynomial has an empty term")
        sign = Fraction(1)
        term = raw_term
        while term[:1] in ("+", "-"):
            if term[0] == "-":
                sign = -sign
            term = term[1:]
        if not term:
            raise CertificateError("certificate polynomial has a sign-only term")
        coefficient = sign
        exponents: dict[int, int] = {}
        for raw_factor in _split_factors(term):
            factor = _strip_outer_parentheses(raw_factor)
            if not factor:
                raise CertificateError("certificate polynomial has an empty factor")
            variable_match = _VARIABLE.fullmatch(factor)
            if variable_match is None:
                try:
                    coefficient *= Fraction(factor)
                except (ValueError, ZeroDivisionError) as exc:
                    raise CertificateError(
                        f"invalid polynomial factor: {raw_factor!r}"
                    ) from exc
                continue
            name = variable_match.group(1)
            if name not in name_to_index:
                raise CertificateError(f"unknown polynomial variable: {name}")
            exponent = int(variable_match.group(2) or "1")
            if exponent <= 0:
                raise CertificateError("variable exponents must be positive")
            variable_index = name_to_index[name]
            exponents[variable_index] = exponents.get(variable_index, 0) + exponent
        monomial = tuple(sorted(exponents.items()))
        updated = result.get(monomial, Fraction(0)) + coefficient
        if updated:
            result[monomial] = updated
        else:
            result.pop(monomial, None)
    return result


def _validate_rab_pairs(
    model: CapHeadModel,
    pattern: Mapping[int, Collection[int]],
    raw_pairs: Any,
) -> list[tuple[int, int]]:
    if not isinstance(raw_pairs, list):
        raise CertificateError("rab_pairs must be a JSON list")
    points = set(pattern_points(pattern))
    pairs: list[tuple[int, int]] = []
    for raw_pair in raw_pairs:
        if (
            not isinstance(raw_pair, list)
            or len(raw_pair) != 2
            or any(isinstance(value, bool) or not isinstance(value, int) for value in raw_pair)
        ):
            raise CertificateError("every Rabinowitsch pair must contain two integers")
        first, second = raw_pair
        if not (0 <= first < second < model.cardinality):
            raise CertificateError("Rabinowitsch pair must be ordered and in range")
        if first not in points or second not in points or (first, second) == (0, 1):
            raise CertificateError("Rabinowitsch pair is outside the pattern or gauge")
        pairs.append((first, second))
    if len(set(pairs)) != len(pairs):
        raise CertificateError("Rabinowitsch pairs must be distinct")
    return pairs


def _validate_kill(value: Any, rab_pairs: Sequence[tuple[int, int]]) -> str:
    if value == "base":
        if rab_pairs:
            raise CertificateError("base kill must not carry Rabinowitsch pairs")
        return value
    if isinstance(value, str) and value.startswith("pair:"):
        try:
            first, second = (int(part) for part in value[5:].split("-"))
        except (TypeError, ValueError) as exc:
            raise CertificateError("pair kill label is malformed") from exc
        if list(rab_pairs) != [(first, second)]:
            raise CertificateError("pair kill label differs from rab_pairs")
        return value
    if value == "multi_pair" and len(rab_pairs) >= 2:
        return value
    raise CertificateError("kill label is inconsistent with rab_pairs")


def _normalize_cube(value: Any) -> dict[int, list[int]]:
    if not isinstance(value, Mapping):
        raise CertificateError("source_cube must be a JSON object")
    try:
        return {
            int(center): [int(member) for member in members]
            for center, members in value.items()
        }
    except (TypeError, ValueError) as exc:
        raise CertificateError("source_cube contains noninteger labels") from exc


def verify_pattern_certificate(
    model: CapHeadModel,
    pattern_value: Mapping[Any, Collection[Any]],
    certificate: Mapping[str, Any],
) -> dict[str, Any]:
    """Verify generator fidelity and the exact rational identity."""

    if not isinstance(certificate, Mapping):
        raise CertificateError("certificate must be a JSON object")
    schema = certificate.get("schema")
    if schema not in (CERTIFICATE_SCHEMA, LEGACY_CERTIFICATE_SCHEMA):
        raise CertificateError("certificate schema is not supported")
    pattern = normalize_pattern(model, pattern_value)
    certificate_pattern = normalize_pattern(model, certificate.get("pattern", {}))
    if pattern_key(certificate_pattern) != pattern_key(pattern):
        raise CertificateError("certificate pattern differs from the proposed pattern")

    expected_profile: Any
    if schema == LEGACY_CERTIFICATE_SCHEMA:
        if model.cardinality != 12:
            raise CertificateError("legacy certificate schema is card-12 only")
        expected_profile = "".join(str(part) for part in model.profile)
    else:
        if certificate.get("cardinality") != model.cardinality:
            raise CertificateError("certificate cardinality differs from the model")
        expected_profile = list(model.profile)
    if certificate.get("profile") != expected_profile:
        raise CertificateError("certificate profile differs from the model")
    if certificate.get("gauge") != GAUGE:
        raise CertificateError("certificate gauge is not the frozen two-point gauge")
    if certificate.get("identity") != IDENTITY:
        raise CertificateError("certificate identity contract is not recognized")
    if certificate.get("python_exact_identity") is not True:
        raise CertificateError("certificate omits its exact-identity generation flag")

    rab_pairs = _validate_rab_pairs(model, pattern, certificate.get("rab_pairs"))
    kill = _validate_kill(certificate.get("kill"), rab_pairs)
    context = PolynomialContext.build(model.cardinality)
    variables, expected, expected_tags = expected_generators(
        context, pattern, rab_pairs
    )
    if certificate.get("variables") != variables:
        raise CertificateError("certificate variable list is not the reconstructed list")
    if certificate.get("generator_tags") != expected_tags:
        raise CertificateError("certificate generator tags fail structural replay")

    raw_generators = certificate.get("generators")
    raw_coefficients = certificate.get("coefficients")
    if not isinstance(raw_generators, list) or not isinstance(raw_coefficients, list):
        raise CertificateError("generators and coefficients must be JSON lists")
    if len(raw_generators) != len(expected):
        raise CertificateError("certificate generator count is wrong")
    if len(raw_coefficients) != len(expected):
        raise CertificateError("certificate coefficient count is wrong")
    parsed_generators = [
        parse_polynomial(raw_generator, variables)
        for raw_generator in raw_generators
    ]
    for index, (actual, reconstructed) in enumerate(
        zip(parsed_generators, expected, strict=True)
    ):
        if actual != reconstructed:
            raise CertificateError(
                f"certificate generator {index} differs from the pattern"
            )
    parsed_coefficients = [
        parse_polynomial(raw_coefficient, variables)
        for raw_coefficient in raw_coefficients
    ]
    identity: Polynomial = {}
    for coefficient, generator in zip(
        parsed_coefficients, parsed_generators, strict=True
    ):
        identity = polynomial_add(
            identity,
            polynomial_multiply(coefficient, generator),
        )
    if identity != {(): Fraction(1)}:
        raise CertificateError("exact certificate identity does not equal one")

    shape = json.dumps(window_shape_canon(pattern), separators=(",", ":"))
    if "shape" in certificate and certificate["shape"] != shape:
        raise CertificateError("certificate shape label fails structural replay")
    if "source_cube" in certificate:
        source_cube = _normalize_cube(certificate["source_cube"])
        if not cube_ok(model, source_cube):
            raise CertificateError("certificate source cube fails cube_ok")
        if not all(
            set(required) <= set(source_cube[center])
            for center, required in pattern.items()
        ):
            raise CertificateError("certificate pattern is absent from source_cube")

    return {
        "schema": VERIFICATION_SCHEMA,
        "status": "VERIFIED_EXACT_IDENTITY",
        "cardinality": model.cardinality,
        "profile": list(model.profile),
        "certificate_sha256": hashlib.sha256(
            _canonical_bytes(certificate)
        ).hexdigest(),
        "pattern": {
            str(center): sorted(members)
            for center, members in sorted(pattern.items())
        },
        "kill": kill,
        "generator_count": len(expected),
        "rab_pair_count": len(rab_pairs),
        "shape": shape,
        "scope": VERIFICATION_SCOPE,
    }


def all_distinctness_pairs(
    pattern: Mapping[int, Collection[int]],
) -> tuple[tuple[int, int], ...]:
    """Return the historical all-pairs separator set for a pattern."""

    return tuple(
        pair
        for pair in combinations(pattern_points(pattern), 2)
        if pair != (0, 1)
    )
