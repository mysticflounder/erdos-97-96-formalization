"""Exact collision witness for the adaptive equality-only core.

This checker authenticates and reconstructs both completed characteristic-zero
target inputs, then evaluates their 26 generator strings in
``Q[z]/(4*z^2-3)``.  It does not invoke a solver and it makes no source,
distinctness, convexity, Lean, or promotion claim.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import json
import os
import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from types import ModuleType
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_adaptive_equality_core_piqd as equality_core,
)


class CollisionWitnessError(RuntimeError):
    """The exact witness or its authenticated input failed closed."""


REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
PRODUCER_PATH = (
    REPOSITORY_ROOT
    / "census"
    / "card_head"
    / "exactfive_hard_source_swap_adaptive_equality_core_piqd.py"
)
EXPECTED_PRODUCER_SHA256 = (
    "a4d910cda4f43b26e726f2a7a10e16fbe4e0f5965f4abdccc7b147961d99585e"
)
EXPECTED_TERMINAL_SHA256 = (
    "faf1ecce822e88542413e0717fc6ff9d0d4ab4610ac492a1edb070d30eed578b"
)
EXPECTED_TERMINAL_FILE_SHA256 = (
    "0ee31efc5b4cbce0dcaf45e12a2ca9f0acc26d92498b4b998f0ff0669a18ecda"
)
EXPECTED_TERMINAL_STATUS = "TARGET_INCONCLUSIVE"
EXPECTED_TARGET_HASHES = {
    "target-gauge-z3": (
        "ee542a9066f8367de4aa877d3464925afdbe988ebee00ee0b7e41a502ec1c7bf"
    ),
    "target-gauge-cvc5": (
        "1f6d2bead88912f000514f1100988e0e9cca38613ff4e56c8da348ffc944b4e1"
    ),
}
EXPECTED_SOURCE_CONTEXT_HASHES = {
    "target-gauge-z3": (
        "d3c69f2e093200415ab4838d3f0cda24f17d2a3df25d8445921650d4a24d9028"
    ),
    "target-gauge-cvc5": (
        "2ca4bd7b064e3219588faac858c20ab0756bfdbfbc6dd1ced560302e9f6e7c20"
    ),
}
EXPECTED_REQUEST_IDS = {
    "target-gauge-z3": "2ad02fef-18b5-5137-b820-2267b37cdf69",
    "target-gauge-cvc5": "0365cb61-ce50-5038-97dc-0b176a1f4349",
}
EXPECTED_ANCHORS = {
    "target-gauge-z3": ("c000", "c010"),
    "target-gauge-cvc5": ("c000", "c008"),
}
MODULUS_COEFFICIENTS = (Fraction(-3), Fraction(0), Fraction(4))
SCHEMA = "p97-exactfive-adaptive-equality-core-collision-witness/v1"
_NAME = re.compile(r"^[A-Za-z][A-Za-z0-9_]*$")
_MAX_EXPRESSION_BYTES = 16_384
_MAX_EXPONENT = 64


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical_json(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def _read_regular(path: Path, *, limit: int = 2 * 1024 * 1024) -> bytes:
    try:
        metadata = path.lstat()
        payload = path.read_bytes()
    except OSError as exc:
        raise CollisionWitnessError(f"cannot read required artifact: {path}") from exc
    if path.is_symlink() or not path.is_file() or metadata.st_nlink != 1:
        raise CollisionWitnessError(f"required artifact is not a regular file: {path}")
    if len(payload) > limit:
        raise CollisionWitnessError(f"required artifact exceeds byte cap: {path}")
    return payload


def _strict_json_object(payload: bytes, where: str) -> dict[str, Any]:
    def no_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        answer: dict[str, Any] = {}
        for key, value in pairs:
            if key in answer:
                raise CollisionWitnessError(f"{where} repeats key {key!r}")
            answer[key] = value
        return answer

    try:
        value = json.loads(
            payload.decode("utf-8", errors="strict"),
            object_pairs_hook=no_duplicates,
            parse_constant=lambda token: (_ for _ in ()).throw(
                CollisionWitnessError(f"{where} contains {token}")
            ),
        )
    except (RecursionError, UnicodeDecodeError, ValueError) as exc:
        raise CollisionWitnessError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise CollisionWitnessError(f"{where} is not an object")
    return value


def _fraction_text(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


@dataclass(frozen=True)
class QuotientElement:
    """The exact pair ``a + b*z`` with the relation ``z^2 = 3/4``."""

    rational: Fraction = Fraction(0)
    z_coefficient: Fraction = Fraction(0)

    def __post_init__(self) -> None:
        object.__setattr__(self, "rational", Fraction(self.rational))
        object.__setattr__(self, "z_coefficient", Fraction(self.z_coefficient))

    def __add__(self, other: object) -> QuotientElement:
        right = _coerce_element(other)
        return QuotientElement(
            self.rational + right.rational,
            self.z_coefficient + right.z_coefficient,
        )

    def __radd__(self, other: object) -> QuotientElement:
        return self + other

    def __neg__(self) -> QuotientElement:
        return QuotientElement(-self.rational, -self.z_coefficient)

    def __sub__(self, other: object) -> QuotientElement:
        return self + (-_coerce_element(other))

    def __rsub__(self, other: object) -> QuotientElement:
        return _coerce_element(other) - self

    def __mul__(self, other: object) -> QuotientElement:
        right = _coerce_element(other)
        return QuotientElement(
            self.rational * right.rational
            + Fraction(3, 4) * self.z_coefficient * right.z_coefficient,
            self.rational * right.z_coefficient
            + self.z_coefficient * right.rational,
        )

    def __rmul__(self, other: object) -> QuotientElement:
        return self * other

    def __pow__(self, exponent: int) -> QuotientElement:
        if (
            type(exponent) is not int
            or exponent < 0
            or exponent > _MAX_EXPONENT
        ):
            raise CollisionWitnessError(
                f"power must be an integer in 0..{_MAX_EXPONENT}"
            )
        answer = ONE
        factor = self
        remaining = exponent
        while remaining:
            if remaining & 1:
                answer = answer * factor
            factor = factor * factor
            remaining >>= 1
        return answer

    def payload(self) -> dict[str, str]:
        return {
            "rational": _fraction_text(self.rational),
            "z_coefficient": _fraction_text(self.z_coefficient),
        }


def _coerce_element(value: object) -> QuotientElement:
    if isinstance(value, QuotientElement):
        return value
    if type(value) is int or isinstance(value, Fraction):
        return QuotientElement(Fraction(value))
    raise TypeError(f"cannot coerce {type(value).__name__} into the quotient")


ZERO = QuotientElement()
ONE = QuotientElement(Fraction(1))
Z = QuotientElement(Fraction(0), Fraction(1))


def verify_modulus() -> dict[str, Any]:
    """Check that the declared nonconstant modulus vanishes at ``Z``."""

    coefficients = MODULUS_COEFFICIENTS
    if not coefficients or any(not isinstance(item, Fraction) for item in coefficients):
        raise CollisionWitnessError("quotient modulus coefficients drifted")
    nonzero_degrees = [index for index, value in enumerate(coefficients) if value]
    if not nonzero_degrees or max(nonzero_degrees) == 0:
        raise CollisionWitnessError("quotient modulus must be nonconstant")
    value = sum(
        (QuotientElement(coefficient) * (Z**degree)
         for degree, coefficient in enumerate(coefficients)),
        ZERO,
    )
    if value != ZERO:
        raise CollisionWitnessError("quotient relation does not kill its modulus")
    return {
        "polynomial": "4*z^2-3",
        "degree": max(nonzero_degrees),
        "coefficients_low_to_high": [
            _fraction_text(item) for item in coefficients
        ],
        "remainder": value.payload(),
    }


def _evaluate_node(
    node: ast.AST, assignment: Mapping[str, QuotientElement]
) -> QuotientElement:
    if isinstance(node, ast.Expression):
        return _evaluate_node(node.body, assignment)
    if isinstance(node, ast.Constant):
        if type(node.value) is not int:
            raise CollisionWitnessError("only integer literals are allowed")
        return QuotientElement(Fraction(node.value))
    if isinstance(node, ast.Name):
        if not _NAME.fullmatch(node.id) or node.id not in assignment:
            raise CollisionWitnessError(f"unknown or unsafe name: {node.id!r}")
        value = assignment[node.id]
        if not isinstance(value, QuotientElement):
            raise CollisionWitnessError(f"assignment value for {node.id} is not exact")
        return value
    if isinstance(node, ast.UnaryOp) and type(node.op) in {ast.UAdd, ast.USub}:
        value = _evaluate_node(node.operand, assignment)
        return value if isinstance(node.op, ast.UAdd) else -value
    if isinstance(node, ast.BinOp):
        if isinstance(node.op, ast.Pow):
            if not isinstance(node.right, ast.Constant) or type(node.right.value) is not int:
                raise CollisionWitnessError("power exponent must be a literal integer")
            return _evaluate_node(node.left, assignment) ** node.right.value
        if type(node.op) not in {ast.Add, ast.Sub, ast.Mult}:
            raise CollisionWitnessError(
                f"binary operator {type(node.op).__name__} is not allowed"
            )
        left = _evaluate_node(node.left, assignment)
        right = _evaluate_node(node.right, assignment)
        if isinstance(node.op, ast.Add):
            return left + right
        if isinstance(node.op, ast.Sub):
            return left - right
        return left * right
    raise CollisionWitnessError(f"AST node {type(node).__name__} is not allowed")


def evaluate_polynomial(
    expression: str, assignment: Mapping[str, QuotientElement]
) -> QuotientElement:
    """Parse one Singular polynomial with a closed AST whitelist."""

    if type(expression) is not str or not expression:
        raise CollisionWitnessError("polynomial must be a nonempty string")
    try:
        encoded = expression.encode("ascii", errors="strict")
    except UnicodeEncodeError as exc:
        raise CollisionWitnessError("polynomial must be ASCII") from exc
    if len(encoded) > _MAX_EXPRESSION_BYTES:
        raise CollisionWitnessError("polynomial exceeds the parser byte cap")
    if "**" in expression:
        raise CollisionWitnessError("input must use Singular's ^ power spelling")
    try:
        tree = ast.parse(expression.replace("^", "**"), mode="eval")
        return _evaluate_node(tree, assignment)
    except (RecursionError, SyntaxError, ValueError) as exc:
        raise CollisionWitnessError("polynomial is not valid restricted syntax") from exc


_CLASS_COORDINATES = {
    "c000": (ZERO, ZERO),
    "c001": (ONE, ZERO),
    "c002": (ZERO, ZERO),
    "c003": (QuotientElement(Fraction(1, 2)), Z),
    "c004": (QuotientElement(Fraction(1, 2)), Z),
    "c005": (QuotientElement(Fraction(1, 2)), Z),
    "c006": (QuotientElement(Fraction(1, 2)), Z),
    "c007": (ONE, ZERO),
    "c008": (ONE, ZERO),
    "c009": (QuotientElement(Fraction(1, 2)), Z),
    "c010": (ONE, ZERO),
}
WITNESS_LABEL_TO_CLASS = {
    "B": "c000",
    "O": "c001",
    "Q": "c002",
    "A": "c003",
    "D": "c004",
    "S": "c005",
    "E": "c006",
    "U": "c007",
    "V": "c008",
    "X": "c009",
    "Y": "c010",
}


def witness_assignment() -> dict[str, QuotientElement]:
    return {
        f"{axis}_{class_id}": point[index]
        for class_id, point in _CLASS_COORDINATES.items()
        for index, axis in enumerate(("x", "y"))
    }


@dataclass(frozen=True)
class AuthenticatedTargets:
    producer_sha256: str
    terminal_sha256: str
    queries: tuple[equality_core.PreparedQuery, equality_core.PreparedQuery]


def _producer_source_sha256(module: ModuleType = equality_core) -> str:
    module_path = Path(module.__file__ or "")
    if module_path.resolve() != PRODUCER_PATH.resolve():
        raise CollisionWitnessError("characteristic-zero producer path drifted")
    try:
        metadata = module_path.lstat()
        payload = _read_regular(module_path)
    except OSError as exc:
        raise CollisionWitnessError("cannot read characteristic-zero producer") from exc
    if module_path.is_symlink() or not module_path.is_file() or metadata.st_nlink != 1:
        raise CollisionWitnessError("characteristic-zero producer is not a regular file")
    digest = _sha256(payload)
    if digest != EXPECTED_PRODUCER_SHA256:
        raise CollisionWitnessError("characteristic-zero producer source drifted")
    return digest


def _validate_target_queries(
    queries: Sequence[equality_core.PreparedQuery], terminal: Mapping[str, Any]
) -> tuple[equality_core.PreparedQuery, equality_core.PreparedQuery]:
    if len(queries) != 2 or tuple(query.key for query in queries) != tuple(
        EXPECTED_TARGET_HASHES
    ):
        raise CollisionWitnessError("authenticated target inventory drifted")
    terminal_targets = terminal.get("targets")
    if type(terminal_targets) is not list or len(terminal_targets) != 2:
        raise CollisionWitnessError("completed terminal target inventory drifted")
    terminal_by_key = {
        entry.get("key"): entry for entry in terminal_targets if type(entry) is dict
    }
    if set(terminal_by_key) != set(EXPECTED_TARGET_HASHES):
        raise CollisionWitnessError("completed terminal target keys drifted")
    for query in queries:
        context = query.source_context
        ordered = context.get("ordered_polynomials")
        digest = _sha256(_canonical_json(list(query.polynomials)))
        context_digest = _sha256(_canonical_json(context))
        expected_anchor_ids = EXPECTED_ANCHORS[query.key]
        anchors = context.get("anchors")
        if type(anchors) is not dict:
            raise CollisionWitnessError(f"{query.key} anchors drifted")
        rank_zero = anchors.get("rank_zero")
        rank_one = anchors.get("rank_one")
        if (
            query.kind != "target"
            or len(query.variables) != 18
            or len(query.polynomials) != 13
            or context.get("variables") != list(query.variables)
            or context.get("variable_count") != 18
            or ordered != list(query.polynomials)
            or context.get("polynomial_count") != 13
            or context.get("ordered_polynomials_sha256") != digest
            or digest != EXPECTED_TARGET_HASHES[query.key]
            or context_digest != EXPECTED_SOURCE_CONTEXT_HASHES[query.key]
            or type(rank_zero) is not dict
            or type(rank_one) is not dict
            or rank_zero.get("class_id") != expected_anchor_ids[0]
            or rank_one.get("class_id") != expected_anchor_ids[1]
            or rank_zero.get("coordinate") != [0, 0]
            or rank_one.get("coordinate") != [1, 0]
            or query.request_id != EXPECTED_REQUEST_IDS[query.key]
            or terminal_by_key[query.key].get("request_id")
            != EXPECTED_REQUEST_IDS[query.key]
        ):
            raise CollisionWitnessError(f"{query.key} polynomial or source context drifted")
    return queries[0], queries[1]


def reconstruct_authenticated_targets() -> AuthenticatedTargets:
    """Read completed custody and rebuild both target lists without transport."""

    producer_sha256 = _producer_source_sha256()
    root = equality_core.RUN_ROOT
    terminal_path = root / "events" / "terminal.json"
    terminal_payload = _read_regular(terminal_path)
    if _sha256(terminal_payload) != EXPECTED_TERMINAL_FILE_SHA256:
        raise CollisionWitnessError("completed terminal file drifted")
    try:
        terminal = equality_core._validate_terminal(
            _strict_json_object(terminal_payload, "completed terminal")
        )
    except Exception as exc:
        raise CollisionWitnessError(
            f"completed characteristic-zero terminal failed validation: {exc}"
        ) from exc
    if (
        terminal.get("terminal_sha256") != EXPECTED_TERMINAL_SHA256
        or terminal.get("status") != EXPECTED_TERMINAL_STATUS
    ):
        raise CollisionWitnessError("completed characteristic-zero terminal drifted")

    contexts: list[dict[str, Any]] = []
    target_directories: list[Path] = []
    for key in EXPECTED_TARGET_HASHES:
        directory = root / "artifacts" / key
        manifest_path = directory / "manifest.json"
        manifest = _strict_json_object(
            _read_regular(manifest_path), f"{key} backend manifest"
        )
        context = manifest.get("source_context")
        if type(context) is not dict:
            raise CollisionWitnessError(f"{key} source context is missing")
        if (
            _sha256(_canonical_json(context))
            != EXPECTED_SOURCE_CONTEXT_HASHES[key]
        ):
            raise CollisionWitnessError(f"{key} authenticated source context drifted")
        contexts.append(context)
        target_directories.append(directory)
    priors = [context.get("prior_adaptive") for context in contexts]
    if type(priors[0]) is not dict or priors[0] != priors[1]:
        raise CollisionWitnessError("target prior snapshots are missing or disagree")
    try:
        rebuilt = tuple(
            equality_core.build_target_query(priors[0], index, timeout_s=900)
            for index in range(2)
        )
        replayed_records = tuple(
            equality_core._validate_query_artifact(query, directory)
            for query, directory in zip(rebuilt, target_directories, strict=True)
        )
    except Exception as exc:
        raise CollisionWitnessError(
            f"read-only target artifact replay failed: {exc}"
        ) from exc
    targets = _validate_target_queries(rebuilt, terminal)
    if terminal.get("targets") != list(replayed_records):
        raise CollisionWitnessError("completed terminal differs from target replay")
    return AuthenticatedTargets(
        producer_sha256=producer_sha256,
        terminal_sha256=EXPECTED_TERMINAL_SHA256,
        queries=targets,
    )


def _validate_assignment(assignment: Mapping[str, QuotientElement]) -> None:
    expected = set(witness_assignment())
    if set(assignment) != expected:
        raise CollisionWitnessError("witness assignment coordinate inventory drifted")
    if any(not isinstance(value, QuotientElement) for value in assignment.values()):
        raise CollisionWitnessError("witness assignment contains an inexact value")


def _point(
    assignment: Mapping[str, QuotientElement], class_id: str
) -> tuple[QuotientElement, QuotientElement]:
    return assignment[f"x_{class_id}"], assignment[f"y_{class_id}"]


def verify_authenticated_witness(
    authenticated: AuthenticatedTargets,
    assignment: Mapping[str, QuotientElement] | None = None,
) -> dict[str, Any]:
    """Verify the exact assignment against already-authenticated target inputs."""

    if (
        authenticated.producer_sha256 != EXPECTED_PRODUCER_SHA256
        or authenticated.terminal_sha256 != EXPECTED_TERMINAL_SHA256
    ):
        raise CollisionWitnessError("authenticated source identity drifted")
    terminal_stub = {
        "targets": [
            {"key": query.key, "request_id": query.request_id}
            for query in authenticated.queries
        ]
    }
    targets = _validate_target_queries(authenticated.queries, terminal_stub)
    values = witness_assignment() if assignment is None else dict(assignment)
    _validate_assignment(values)
    modulus = verify_modulus()
    gauges: list[dict[str, Any]] = []
    checked = 0
    for query in targets:
        rank_zero, rank_one = EXPECTED_ANCHORS[query.key]
        if _point(values, rank_zero) != (ZERO, ZERO):
            raise CollisionWitnessError(f"{query.key} rank-zero anchor failed")
        if _point(values, rank_one) != (ONE, ZERO):
            raise CollisionWitnessError(f"{query.key} rank-one anchor failed")
        remainders: list[dict[str, str]] = []
        for index, polynomial in enumerate(query.polynomials):
            remainder = evaluate_polynomial(polynomial, values)
            remainders.append(remainder.payload())
            checked += 1
            if remainder != ZERO:
                raise CollisionWitnessError(
                    f"{query.key} generator {index + 1} has nonzero remainder "
                    f"{remainder.payload()}"
                )
        gauges.append(
            {
                "key": query.key,
                "anchors": {"rank_zero": rank_zero, "rank_one": rank_one},
                "ordered_polynomials_sha256": EXPECTED_TARGET_HASHES[query.key],
                "generator_remainders": remainders,
            }
        )
    if checked != 26:
        raise CollisionWitnessError("exact generator coverage is not 26")
    return {
        "schema": SCHEMA,
        "producer_sha256": authenticated.producer_sha256,
        "terminal_sha256": authenticated.terminal_sha256,
        "quotient": modulus,
        "assignment": {
            class_id: [coordinate.payload() for coordinate in point]
            for class_id, point in _CLASS_COORDINATES.items()
        },
        "witness_label_to_class": dict(WITNESS_LABEL_TO_CLASS),
        "gauges": gauges,
        "generator_checks": checked,
        "claims": {
            "equality_core_proper": True,
            "equality_core_real_feasible": True,
            "source_realization": False,
            "distinctness": False,
            "convexity": False,
            "lean_statement": False,
            "lean_proof": False,
            "promotion": False,
        },
    }


def verify_collision_witness() -> dict[str, Any]:
    return verify_authenticated_witness(reconstruct_authenticated_targets())


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = verify_collision_witness()
    except CollisionWitnessError as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "EXPECTED_ANCHORS",
    "EXPECTED_PRODUCER_SHA256",
    "EXPECTED_REQUEST_IDS",
    "EXPECTED_SOURCE_CONTEXT_HASHES",
    "EXPECTED_TARGET_HASHES",
    "EXPECTED_TERMINAL_FILE_SHA256",
    "MODULUS_COEFFICIENTS",
    "ONE",
    "WITNESS_LABEL_TO_CLASS",
    "ZERO",
    "AuthenticatedTargets",
    "CollisionWitnessError",
    "QuotientElement",
    "Z",
    "evaluate_polynomial",
    "main",
    "reconstruct_authenticated_targets",
    "verify_authenticated_witness",
    "verify_collision_witness",
    "verify_modulus",
    "witness_assignment",
]
