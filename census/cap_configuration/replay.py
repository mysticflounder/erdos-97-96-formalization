"""Bounded exact-rational semantic replay for PIQD SMT SAT readbacks.

This module deliberately parses only the small SMT-LIB response fragment that
PIQD returns for ``(get-value ...)``.  It does not parse models, invoke a solver,
or delegate arithmetic interpretation to SymPy.  Accepted assignments are
replayed independently against every enabled polynomial atom.
"""

from __future__ import annotations

import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from math import gcd
from typing import Any, Literal, NoReturn

from .encode import POLYNOMIAL_SYSTEM_SCHEMA, NamedPolynomialAtom, PolynomialSystem
from .schema import canonical_json_bytes, raw_sha256, structured_hash

SEMANTIC_REPLAY_SCHEMA = "cap-configuration-semantic-replay/v1"
SEMANTIC_REPLAY_VERIFIER_ID = "cap-configuration-exact-rational-replay/v1"

ReplayOutcome = Literal["accepted", "rejected", "verifier_failure"]
AdapterClassification = Literal[
    "SAT_SEMANTICALLY_REPLAYED",
    "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
    "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
]

_CLASSIFICATION_BY_OUTCOME: dict[str, str] = {
    "accepted": "SAT_SEMANTICALLY_REPLAYED",
    "rejected": "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
    "verifier_failure": "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
}
_SAFE_IDENTIFIER = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
_SAFE_ISSUE_CODE = re.compile(r"[a-z][a-z0-9_]*")
_SHA256 = re.compile(r"[0-9a-f]{64}")
_UNSIGNED_INTEGER = re.compile(r"0|[1-9][0-9]*")
_APPROXIMATE_TOKEN = re.compile(
    r"(?:[0-9]+\.[0-9]*|[0-9]*\.[0-9]+)(?:[eE][+-]?[0-9]+)?|"
    r"[0-9]+[eE][+-]?[0-9]+|[+-]?(?:inf(?:inity)?|nan)",
    re.IGNORECASE,
)


class CapConfigurationReplayError(ValueError):
    """A fail-closed readback or replay-contract rejection."""

    def __init__(self, code: str, message: str) -> None:
        if _SAFE_ISSUE_CODE.fullmatch(code) is None:
            raise ValueError("replay error code is not canonical")
        super().__init__(message)
        self.code = code


def _fail(code: str, message: str) -> NoReturn:
    raise CapConfigurationReplayError(code, message)


def _exact_int(value: Any, path: str, *, minimum: int | None = None) -> int:
    if type(value) is not int:
        _fail("malformed_record", f"{path} must be an integer")
    if minimum is not None and value < minimum:
        _fail("malformed_record", f"{path} must be at least {minimum}")
    return value


def _exact_keys(value: Any, expected: set[str], path: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail("malformed_record", f"{path} must be an object")
    if any(type(key) is not str for key in value):
        _fail("malformed_record", f"{path} object keys must be strings")
    missing = sorted(expected - set(value))
    extra = sorted(set(value) - expected)
    if missing or extra:
        _fail(
            "malformed_record",
            f"{path} keys mismatch: missing={missing}, extra={extra}",
        )
    return value


def _identifier(value: Any, path: str) -> str:
    if type(value) is not str or _SAFE_IDENTIFIER.fullmatch(value) is None:
        _fail("malformed_identifier", f"{path} must be a safe identifier")
    return value


def _sha256(value: Any, path: str, *, optional: bool = False) -> str | None:
    if optional and value is None:
        return None
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail("malformed_record", f"{path} must be a lowercase SHA-256 digest")
    return value


_FROZEN_REPLAY_MAXIMA = {
    "max_payload_bytes": 1_048_576,
    "max_tokens": 100_000,
    "max_depth": 32,
    "max_integer_digits": 4096,
    "max_denominator_bits": 4096,
}


@dataclass(frozen=True, slots=True)
class ReplayLimits:
    """Resource bounds for the untrusted PIQD values payload."""

    max_payload_bytes: int = _FROZEN_REPLAY_MAXIMA["max_payload_bytes"]
    max_tokens: int = _FROZEN_REPLAY_MAXIMA["max_tokens"]
    max_depth: int = _FROZEN_REPLAY_MAXIMA["max_depth"]
    max_integer_digits: int = _FROZEN_REPLAY_MAXIMA["max_integer_digits"]
    max_denominator_bits: int = _FROZEN_REPLAY_MAXIMA["max_denominator_bits"]

    def __post_init__(self) -> None:
        for name in (
            "max_payload_bytes",
            "max_tokens",
            "max_depth",
            "max_integer_digits",
            "max_denominator_bits",
        ):
            value = getattr(self, name)
            if type(value) is not int or value <= 0:
                raise ValueError(f"{name} must be a positive integer")
            maximum = _FROZEN_REPLAY_MAXIMA[name]
            if value > maximum:
                raise ValueError(f"{name} cannot exceed frozen maximum {maximum}")


DEFAULT_REPLAY_LIMITS = ReplayLimits()


def _validated_limits(value: Any) -> ReplayLimits:
    if type(value) is not ReplayLimits:
        _fail("malformed_limits", "replay limits must be ReplayLimits")
    for name, maximum in _FROZEN_REPLAY_MAXIMA.items():
        field = getattr(value, name)
        if type(field) is not int or field <= 0 or field > maximum:
            _fail(
                "malformed_limits",
                f"{name} must be within the frozen replay boundary",
            )
    return value


@dataclass(frozen=True, slots=True)
class ExactRationalReadback:
    """One canonical declared-variable value in solver-returned order."""

    identifier: str
    numerator: int
    denominator: int

    def __post_init__(self) -> None:
        _identifier(self.identifier, "readback.identifier")
        _exact_int(self.numerator, "readback.numerator")
        _exact_int(self.denominator, "readback.denominator", minimum=1)
        if gcd(abs(self.numerator), self.denominator) != 1:
            _fail("unreduced_rational", "readback rational must be reduced")

    @property
    def value(self) -> Fraction:
        return Fraction(self.numerator, self.denominator)

    def to_record(self) -> dict[str, object]:
        return {
            "denominator": self.denominator,
            "id": self.identifier,
            "numerator": self.numerator,
        }

    @classmethod
    def from_record(
        cls, value: Any, *, path: str = "readback"
    ) -> ExactRationalReadback:
        record = _exact_keys(value, {"denominator", "id", "numerator"}, path)
        result = cls(
            identifier=_identifier(record["id"], f"{path}.id"),
            numerator=_exact_int(record["numerator"], f"{path}.numerator"),
            denominator=_exact_int(
                record["denominator"], f"{path}.denominator", minimum=1
            ),
        )
        if result.to_record() != value:
            _fail("malformed_record", f"{path} is not canonical")
        return result


@dataclass(frozen=True, slots=True)
class AtomReplayResult:
    """Exact polynomial values and truth value for one enabled atom."""

    atom_id: str
    relation: str
    polynomial_values: tuple[Fraction, ...]
    satisfied: bool

    def __post_init__(self) -> None:
        _identifier(self.atom_id, "atom_result.atom_id")
        if type(self.relation) is not str or self.relation not in {
            "eq",
            "ge",
            "gt",
            "ne",
            "or_ne",
        }:
            _fail("malformed_record", "atom_result.relation is unsupported")
        if type(self.polynomial_values) is not tuple or any(
            type(value) is not Fraction for value in self.polynomial_values
        ):
            _fail(
                "malformed_record",
                "atom_result.polynomial_values must be exact Fractions",
            )
        expected = 2 if self.relation == "or_ne" else 1
        if len(self.polynomial_values) != expected:
            _fail("malformed_record", "atom_result polynomial arity is invalid")
        if type(self.satisfied) is not bool:
            _fail("malformed_record", "atom_result.satisfied must be a boolean")

    def to_record(self) -> dict[str, object]:
        return {
            "atom_id": self.atom_id,
            "polynomial_values": [
                {
                    "denominator": value.denominator,
                    "numerator": value.numerator,
                }
                for value in self.polynomial_values
            ],
            "relation": self.relation,
            "satisfied": self.satisfied,
        }

    @classmethod
    def from_record(cls, value: Any, *, path: str) -> AtomReplayResult:
        record = _exact_keys(
            value,
            {"atom_id", "polynomial_values", "relation", "satisfied"},
            path,
        )
        raw_values = record["polynomial_values"]
        if type(raw_values) is not list:
            _fail("malformed_record", f"{path}.polynomial_values must be an array")
        values: list[Fraction] = []
        for index, raw_value in enumerate(raw_values):
            item_path = f"{path}.polynomial_values[{index}]"
            item = _exact_keys(raw_value, {"denominator", "numerator"}, item_path)
            numerator = _exact_int(item["numerator"], f"{item_path}.numerator")
            denominator = _exact_int(
                item["denominator"], f"{item_path}.denominator", minimum=1
            )
            if gcd(abs(numerator), denominator) != 1:
                _fail("unreduced_rational", f"{item_path} is not reduced")
            values.append(Fraction(numerator, denominator))
        result = cls(
            atom_id=_identifier(record["atom_id"], f"{path}.atom_id"),
            relation=record["relation"],
            polynomial_values=tuple(values),
            satisfied=record["satisfied"],
        )
        if result.to_record() != value:
            _fail("malformed_record", f"{path} is not canonical")
        return result


@dataclass(frozen=True, slots=True)
class ReplayIssue:
    code: str
    message: str

    def __post_init__(self) -> None:
        if type(self.code) is not str or _SAFE_ISSUE_CODE.fullmatch(self.code) is None:
            _fail("malformed_record", "issue.code is not canonical")
        if (
            type(self.message) is not str
            or not self.message
            or self.message != self.message.strip()
            or len(self.message) > 500
            or any(ord(character) < 32 for character in self.message)
        ):
            _fail("malformed_record", "issue.message is not canonical text")

    def to_record(self) -> dict[str, str]:
        return {"code": self.code, "message": self.message}

    @classmethod
    def from_record(cls, value: Any) -> ReplayIssue:
        record = _exact_keys(value, {"code", "message"}, "replay.issue")
        result = cls(code=record["code"], message=record["message"])
        if result.to_record() != value:
            _fail("malformed_record", "replay.issue is not canonical")
        return result


@dataclass(frozen=True, slots=True)
class SemanticReplayRecord:
    """Immutable, domain-separated result of one independent SAT replay."""

    outcome: ReplayOutcome
    adapter_classification: AdapterClassification
    system_sha256: str
    values_raw_sha256: str | None
    readback: tuple[ExactRationalReadback, ...]
    atom_results: tuple[AtomReplayResult, ...]
    issue: ReplayIssue | None
    replay_sha256: str

    def __post_init__(self) -> None:
        if (
            type(self.outcome) is not str
            or self.outcome not in _CLASSIFICATION_BY_OUTCOME
        ):
            _fail("malformed_record", "replay.outcome is unsupported")
        expected_classification = _CLASSIFICATION_BY_OUTCOME[self.outcome]
        if self.adapter_classification != expected_classification:
            _fail("malformed_record", "replay classification does not match outcome")
        _sha256(self.system_sha256, "replay.system_sha256")
        _sha256(
            self.values_raw_sha256,
            "replay.values_raw_sha256",
            optional=True,
        )
        if type(self.readback) is not tuple or any(
            type(item) is not ExactRationalReadback for item in self.readback
        ):
            _fail("malformed_record", "replay.readback is invalid")
        identifiers = tuple(item.identifier for item in self.readback)
        if len(identifiers) != len(set(identifiers)):
            _fail("malformed_record", "replay.readback contains duplicate identifiers")
        if type(self.atom_results) is not tuple or any(
            type(item) is not AtomReplayResult for item in self.atom_results
        ):
            _fail("malformed_record", "replay.atom_results is invalid")
        atom_ids = tuple(item.atom_id for item in self.atom_results)
        if len(atom_ids) != len(set(atom_ids)):
            _fail("malformed_record", "replay.atom_results contains duplicates")
        if self.outcome == "accepted":
            if self.issue is not None or not self.readback or not self.atom_results:
                _fail("malformed_record", "accepted replay lacks complete evidence")
            if not all(item.satisfied for item in self.atom_results):
                _fail("malformed_record", "accepted replay contains a failed atom")
        elif type(self.issue) is not ReplayIssue:
            _fail("malformed_record", "inconclusive replay lacks an issue")
        if (
            type(self.replay_sha256) is not str
            or _SHA256.fullmatch(self.replay_sha256) is None
        ):
            _fail("malformed_record", "replay.replay_sha256 is invalid")
        expected_hash = structured_hash(SEMANTIC_REPLAY_SCHEMA, self._hash_record())
        if self.replay_sha256 != expected_hash:
            _fail("self_hash_mismatch", "semantic replay self-hash mismatch")

    def _hash_record(self) -> dict[str, object]:
        return {
            "adapter_classification": self.adapter_classification,
            "atom_results": [item.to_record() for item in self.atom_results],
            "issue": None if self.issue is None else self.issue.to_record(),
            "outcome": self.outcome,
            "readback": [item.to_record() for item in self.readback],
            "schema": SEMANTIC_REPLAY_SCHEMA,
            "system_sha256": self.system_sha256,
            "values_raw_sha256": self.values_raw_sha256,
            "verifier_id": SEMANTIC_REPLAY_VERIFIER_ID,
        }

    def to_record(self) -> dict[str, object]:
        result = self._hash_record()
        result["replay_sha256"] = self.replay_sha256
        return result

    @classmethod
    def create(
        cls,
        *,
        outcome: ReplayOutcome,
        system_sha256: str,
        values_raw_sha256: str | None,
        readback: tuple[ExactRationalReadback, ...],
        atom_results: tuple[AtomReplayResult, ...],
        issue: ReplayIssue | None,
    ) -> SemanticReplayRecord:
        classification = _CLASSIFICATION_BY_OUTCOME[outcome]
        provisional = {
            "adapter_classification": classification,
            "atom_results": [item.to_record() for item in atom_results],
            "issue": None if issue is None else issue.to_record(),
            "outcome": outcome,
            "readback": [item.to_record() for item in readback],
            "schema": SEMANTIC_REPLAY_SCHEMA,
            "system_sha256": system_sha256,
            "values_raw_sha256": values_raw_sha256,
            "verifier_id": SEMANTIC_REPLAY_VERIFIER_ID,
        }
        return cls(
            outcome=outcome,
            adapter_classification=classification,
            system_sha256=system_sha256,
            values_raw_sha256=values_raw_sha256,
            readback=readback,
            atom_results=atom_results,
            issue=issue,
            replay_sha256=structured_hash(SEMANTIC_REPLAY_SCHEMA, provisional),
        )

    @classmethod
    def from_record(cls, value: Any) -> SemanticReplayRecord:
        record = _exact_keys(
            value,
            {
                "adapter_classification",
                "atom_results",
                "issue",
                "outcome",
                "readback",
                "replay_sha256",
                "schema",
                "system_sha256",
                "values_raw_sha256",
                "verifier_id",
            },
            "replay",
        )
        if record["schema"] != SEMANTIC_REPLAY_SCHEMA:
            _fail("malformed_record", "replay.schema is unsupported")
        if record["verifier_id"] != SEMANTIC_REPLAY_VERIFIER_ID:
            _fail("malformed_record", "replay.verifier_id is unsupported")
        raw_readback = record["readback"]
        raw_atoms = record["atom_results"]
        if type(raw_readback) is not list or type(raw_atoms) is not list:
            _fail("malformed_record", "replay evidence ledgers must be arrays")
        issue = record["issue"]
        result = cls(
            outcome=record["outcome"],
            adapter_classification=record["adapter_classification"],
            system_sha256=record["system_sha256"],
            values_raw_sha256=record["values_raw_sha256"],
            readback=tuple(
                ExactRationalReadback.from_record(
                    item, path=f"replay.readback[{index}]"
                )
                for index, item in enumerate(raw_readback)
            ),
            atom_results=tuple(
                AtomReplayResult.from_record(item, path=f"replay.atom_results[{index}]")
                for index, item in enumerate(raw_atoms)
            ),
            issue=None if issue is None else ReplayIssue.from_record(issue),
            replay_sha256=record["replay_sha256"],
        )
        if result.to_record() != value:
            _fail("malformed_record", "semantic replay record is not canonical")
        return result


SExpr = str | tuple["SExpr", ...]


def _tokenize(payload: str, limits: ReplayLimits) -> list[str]:
    if type(payload) is not str:
        _fail("malformed_payload", "PIQD values payload must be a string")
    try:
        encoded = payload.encode("ascii")
    except UnicodeEncodeError as exc:
        raise CapConfigurationReplayError(
            "non_ascii_payload", "PIQD values payload must be ASCII"
        ) from exc
    if len(encoded) > limits.max_payload_bytes:
        _fail("payload_budget_exceeded", "PIQD values payload exceeds byte budget")

    tokens: list[str] = []
    current: list[str] = []

    def emit(token: str) -> None:
        tokens.append(token)
        if len(tokens) > limits.max_tokens:
            _fail("token_budget_exceeded", "PIQD values payload exceeds token budget")

    for character in payload:
        if character in "()":
            if current:
                emit("".join(current))
                current.clear()
            emit(character)
        elif character in " \t\r\n":
            if current:
                emit("".join(current))
                current.clear()
        else:
            if ord(character) < 32 or ord(character) == 127:
                _fail("malformed_payload", "PIQD values payload has a control byte")
            current.append(character)
    if current:
        emit("".join(current))
    if not tokens:
        _fail("malformed_payload", "PIQD values payload is empty")
    return tokens


def _parse_sexpr(payload: str, limits: ReplayLimits) -> SExpr:
    tokens = _tokenize(payload, limits)
    index = 0

    def parse(depth: int) -> SExpr:
        nonlocal index
        if depth > limits.max_depth:
            _fail("depth_budget_exceeded", "PIQD values payload exceeds depth budget")
        if index >= len(tokens):
            _fail("malformed_payload", "PIQD values payload ends unexpectedly")
        token = tokens[index]
        index += 1
        if token == ")":
            _fail("malformed_payload", "PIQD values payload has an unexpected close")
        if token != "(":
            return token
        children: list[SExpr] = []
        while index < len(tokens) and tokens[index] != ")":
            children.append(parse(depth + 1))
        if index >= len(tokens):
            _fail("malformed_payload", "PIQD values payload has an unclosed list")
        index += 1
        return tuple(children)

    root = parse(0)
    if index != len(tokens):
        _fail("malformed_payload", "PIQD values payload has trailing tokens")
    return root


def _unsigned_integer(token: SExpr, limits: ReplayLimits, role: str) -> int:
    if type(token) is not str:
        _fail("malformed_rational", f"{role} must be an unsigned integer atom")
    if _APPROXIMATE_TOKEN.fullmatch(token):
        _fail("approximate_value", "floating, decimal, or nonfinite value rejected")
    if _UNSIGNED_INTEGER.fullmatch(token) is None:
        _fail("malformed_rational", f"{role} is not a canonical integer")
    if len(token) > limits.max_integer_digits:
        _fail("integer_budget_exceeded", "rational integer exceeds digit budget")
    try:
        return int(token)
    except ValueError as exc:
        raise CapConfigurationReplayError(
            "integer_budget_exceeded",
            "rational integer cannot be decoded within the runtime digit budget",
        ) from exc


def _integer_expression(value: SExpr, limits: ReplayLimits, role: str) -> int:
    if type(value) is str:
        return _unsigned_integer(value, limits, role)
    if len(value) == 2 and value[0] == "-":
        magnitude = _unsigned_integer(value[1], limits, role)
        if magnitude == 0:
            _fail("malformed_rational", "negative zero is not canonical")
        return -magnitude
    _fail("malformed_rational", f"{role} is not an exact integer")


def _rational(value: SExpr, limits: ReplayLimits) -> Fraction:
    if type(value) is str:
        return Fraction(_unsigned_integer(value, limits, "rational"), 1)
    if len(value) == 2 and value[0] == "-":
        operand = value[1]
        if type(operand) is tuple and len(operand) == 3 and operand[0] == "/":
            if (
                type(operand[1]) is tuple
                and len(operand[1]) == 2
                and operand[1][0] == "-"
            ):
                _fail("malformed_rational", "double-negative rational is not canonical")
            result = _division(operand, limits)
            if result == 0:
                _fail("malformed_rational", "negative zero is not canonical")
            return -result
        return Fraction(_integer_expression(value, limits, "rational"), 1)
    if len(value) == 3 and value[0] == "/":
        return _division(value, limits)
    _fail(
        "unsupported_value",
        "SAT readback contains an approximate, algebraic, or unsupported term",
    )


def _division(value: tuple[SExpr, ...], limits: ReplayLimits) -> Fraction:
    numerator = _integer_expression(value[1], limits, "rational numerator")
    denominator_expression = value[2]
    if (
        type(denominator_expression) is tuple
        and len(denominator_expression) == 2
        and denominator_expression[0] == "-"
    ):
        _fail("negative_denominator", "negative rational denominator rejected")
    denominator = _unsigned_integer(
        denominator_expression, limits, "rational denominator"
    )
    if denominator == 0:
        _fail("zero_denominator", "zero rational denominator rejected")
    if denominator.bit_length() > limits.max_denominator_bits:
        _fail(
            "denominator_budget_exceeded",
            "rational denominator exceeds bit budget",
        )
    if gcd(abs(numerator), denominator) != 1:
        _fail("unreduced_rational", "SAT readback rational is not reduced")
    return Fraction(numerator, denominator)


def _readback_identifier(value: SExpr) -> str:
    if type(value) is not str:
        _fail("malformed_identifier", "SAT readback identifier must be an atom")
    normalized = value
    if value.startswith("|") or value.endswith("|"):
        if len(value) < 3 or not (value.startswith("|") and value.endswith("|")):
            _fail("malformed_identifier", "SAT readback quoted identifier is invalid")
        normalized = value[1:-1]
    return _identifier(normalized, "SAT readback identifier")


def _declared_order(value: Sequence[str]) -> tuple[str, ...]:
    if isinstance(value, (str, bytes)) or not isinstance(value, Sequence):
        _fail("malformed_declaration", "declared variable order must be a sequence")
    order = tuple(
        _identifier(identifier, f"declared_variable_order[{index}]")
        for index, identifier in enumerate(value)
    )
    if not order or len(order) != len(set(order)):
        _fail(
            "malformed_declaration",
            "declared variable order must be nonempty and duplicate-free",
        )
    return order


def _parse_piqd_get_values_bounded(
    payload: str,
    declared_variable_order: Sequence[str],
    *,
    limits: ReplayLimits,
) -> tuple[ExactRationalReadback, ...]:
    order = _declared_order(declared_variable_order)
    root = _parse_sexpr(payload, limits)
    if type(root) is not tuple:
        _fail("malformed_payload", "PIQD values root must be a list")
    parsed: list[ExactRationalReadback] = []
    seen: set[str] = set()
    for pair in root:
        if type(pair) is not tuple or len(pair) != 2:
            _fail("malformed_payload", "PIQD value entry must be a pair")
        identifier = _readback_identifier(pair[0])
        if identifier in seen:
            _fail(
                "duplicate_identifier",
                f"duplicate SAT readback identifier {identifier}",
            )
        seen.add(identifier)
        rational = _rational(pair[1], limits)
        parsed.append(
            ExactRationalReadback(
                identifier=identifier,
                numerator=rational.numerator,
                denominator=rational.denominator,
            )
        )

    actual = tuple(item.identifier for item in parsed)
    missing = [identifier for identifier in order if identifier not in seen]
    extra = [identifier for identifier in actual if identifier not in set(order)]
    if missing or extra:
        _fail(
            "identifier_inventory_mismatch",
            f"SAT readback inventory mismatch: missing={len(missing)}, extra={len(extra)}",
        )
    if actual != order:
        _fail("identifier_order_mismatch", "SAT readback is not in declared order")
    return tuple(parsed)


def parse_piqd_get_values(
    payload: str,
    declared_variable_order: Sequence[str],
    *,
    limits: ReplayLimits = DEFAULT_REPLAY_LIMITS,
) -> tuple[ExactRationalReadback, ...]:
    """Parse a complete PIQD ``get-value`` payload in declared order.

    The accepted value grammar consists only of canonical integers, unary
    negative integers, reduced integer divisions with positive denominators,
    and unary negation of such a division.
    """

    bounded_limits = _validated_limits(limits)
    try:
        return _parse_piqd_get_values_bounded(
            payload,
            declared_variable_order,
            limits=bounded_limits,
        )
    except CapConfigurationReplayError:
        raise
    except RecursionError as exc:
        raise CapConfigurationReplayError(
            "depth_budget_exceeded",
            "PIQD values payload exceeded the safe parser recursion boundary",
        ) from exc
    except ValueError as exc:
        raise CapConfigurationReplayError(
            "malformed_payload",
            "PIQD values payload triggered an invalid numeric conversion",
        ) from exc


def _system_hash(system: PolynomialSystem) -> str:
    if type(system) is not PolynomialSystem:
        _fail("malformed_system", "semantic replay requires a PolynomialSystem")
    return structured_hash(POLYNOMIAL_SYSTEM_SCHEMA, system.to_record())


def _issue(code: str, message: object) -> ReplayIssue:
    try:
        raw_message = str(message)
    except Exception:  # noqa: BLE001 - evidence creation must survive broken __str__.
        raw_message = type(message).__name__
    if isinstance(message, BaseException):
        raw_message = f"{type(message).__name__}: {raw_message}"
    raw_message = raw_message.encode("utf-8", "replace").decode("utf-8")
    cleaned = "".join(
        " " if ord(character) < 32 or ord(character) == 127 else character
        for character in raw_message
    )
    cleaned = " ".join(cleaned.split())[:500].strip()
    return ReplayIssue(code=code, message=cleaned or code.replace("_", " "))


def _atom_satisfied(relation: str, values: tuple[Fraction, ...]) -> bool:
    if relation == "eq":
        return values[0] == 0
    if relation == "ge":
        return values[0] >= 0
    if relation == "gt":
        return values[0] > 0
    if relation == "ne":
        return values[0] != 0
    if relation == "or_ne":
        return values[0] != 0 or values[1] != 0
    raise RuntimeError(f"unsupported validated relation {relation!r}")


def _evaluate_atom(
    atom: NamedPolynomialAtom, values: tuple[Fraction, ...]
) -> AtomReplayResult:
    polynomial_values = tuple(
        polynomial.evaluate(values) for polynomial in atom.polynomials
    )
    return AtomReplayResult(
        atom_id=atom.atom_id,
        relation=atom.relation,
        polynomial_values=polynomial_values,
        satisfied=_atom_satisfied(atom.relation, polynomial_values),
    )


def _rejected(
    system_sha256: str,
    *,
    values_raw_sha256: str | None,
    readback: tuple[ExactRationalReadback, ...] = (),
    atom_results: tuple[AtomReplayResult, ...] = (),
    error: CapConfigurationReplayError,
) -> SemanticReplayRecord:
    return SemanticReplayRecord.create(
        outcome="rejected",
        system_sha256=system_sha256,
        values_raw_sha256=values_raw_sha256,
        readback=readback,
        atom_results=atom_results,
        issue=_issue(error.code, str(error)),
    )


def _replay_ordered_readback(
    system: PolynomialSystem,
    readback: Sequence[ExactRationalReadback],
    *,
    values_raw_sha256: str | None,
    limits: ReplayLimits = DEFAULT_REPLAY_LIMITS,
) -> SemanticReplayRecord:
    system_sha256 = _system_hash(system)
    try:
        bounded_limits = _validated_limits(limits)
    except CapConfigurationReplayError as exc:
        return _rejected(
            system_sha256,
            values_raw_sha256=values_raw_sha256,
            error=exc,
        )
    try:
        if isinstance(readback, (str, bytes)) or not isinstance(readback, Sequence):
            _fail("malformed_readback", "ordered readback must be a sequence")
        ordered = tuple(readback)
        if any(type(item) is not ExactRationalReadback for item in ordered):
            _fail(
                "malformed_readback",
                "ordered readback contains a noncanonical rational record",
            )
        for item in ordered:
            if item.denominator.bit_length() > bounded_limits.max_denominator_bits:
                _fail(
                    "denominator_budget_exceeded",
                    "rational denominator exceeds bit budget",
                )
        actual = tuple(item.identifier for item in ordered)
        if len(actual) != len(set(actual)):
            _fail("duplicate_identifier", "ordered readback contains a duplicate")
        expected = system.variable_order
        missing = set(expected) - set(actual)
        extra = set(actual) - set(expected)
        if missing or extra:
            _fail(
                "identifier_inventory_mismatch",
                f"SAT readback inventory mismatch: missing={len(missing)}, extra={len(extra)}",
            )
        if actual != expected:
            _fail("identifier_order_mismatch", "SAT readback is not in declared order")
    except CapConfigurationReplayError as exc:
        return _rejected(
            system_sha256,
            values_raw_sha256=values_raw_sha256,
            error=exc,
        )

    try:
        values = tuple(item.value for item in ordered)
        by_id = {atom.atom_id: atom for atom in system.atoms}
        atom_results = tuple(
            _evaluate_atom(by_id[atom_id], values)
            for atom_id in system.enabled_atom_order
        )
    # This is the semantic-verifier trust boundary: an unexpected evaluator
    # defect must become retained verifier-failure evidence, never a lost SAT.
    except Exception as exc:  # noqa: BLE001
        return SemanticReplayRecord.create(
            outcome="verifier_failure",
            system_sha256=system_sha256,
            values_raw_sha256=values_raw_sha256,
            readback=ordered,
            atom_results=(),
            issue=_issue(
                "semantic_verifier_failure",
                exc,
            ),
        )

    failed = tuple(item.atom_id for item in atom_results if not item.satisfied)
    if failed:
        return _rejected(
            system_sha256,
            values_raw_sha256=values_raw_sha256,
            readback=ordered,
            atom_results=atom_results,
            error=CapConfigurationReplayError(
                "retained_atom_failure",
                f"{len(failed)} retained atom(s) failed; first={failed[0]}",
            ),
        )
    return SemanticReplayRecord.create(
        outcome="accepted",
        system_sha256=system_sha256,
        values_raw_sha256=values_raw_sha256,
        readback=ordered,
        atom_results=atom_results,
        issue=None,
    )


def replay_ordered_readback(
    system: PolynomialSystem,
    readback: Sequence[ExactRationalReadback],
    *,
    limits: ReplayLimits = DEFAULT_REPLAY_LIMITS,
) -> SemanticReplayRecord:
    """Replay canonical records without claiming custody of raw PIQD bytes."""

    return _replay_ordered_readback(
        system,
        readback,
        values_raw_sha256=None,
        limits=limits,
    )


def replay_piqd_sat_values(
    system: PolynomialSystem,
    payload: str,
    *,
    limits: ReplayLimits = DEFAULT_REPLAY_LIMITS,
) -> SemanticReplayRecord:
    """Parse and independently replay one raw PIQD SAT values payload."""

    system_sha256 = _system_hash(system)
    values_raw_sha256: str | None = None
    if type(payload) is str:
        try:
            values_raw_sha256 = raw_sha256(payload.encode("utf-8"))
        except UnicodeEncodeError:
            values_raw_sha256 = None
    try:
        readback = parse_piqd_get_values(
            payload,
            system.variable_order,
            limits=limits,
        )
    except CapConfigurationReplayError as exc:
        return _rejected(
            system_sha256,
            values_raw_sha256=values_raw_sha256,
            error=exc,
        )
    return _replay_ordered_readback(
        system,
        readback,
        values_raw_sha256=values_raw_sha256,
        limits=limits,
    )


def verify_replay_record(
    system: PolynomialSystem,
    record_or_mapping: SemanticReplayRecord | Mapping[str, Any],
    *,
    raw_values_payload: str | bytes | None = None,
    allow_readback_only: bool = False,
    limits: ReplayLimits = DEFAULT_REPLAY_LIMITS,
) -> SemanticReplayRecord:
    """Parse and recompute a stored replay, requiring canonical byte identity.

    A record that claims a raw-value digest is verified only from separately
    retained raw payload bytes.  The explicit readback-only branch authenticates
    no raw bytes and is limited to records whose raw digest is null.
    """

    if type(record_or_mapping) is SemanticReplayRecord:
        stored = record_or_mapping
    elif isinstance(record_or_mapping, Mapping):
        try:
            candidate = dict(record_or_mapping)
        except (TypeError, ValueError) as exc:
            raise CapConfigurationReplayError(
                "malformed_record", "semantic replay mapping cannot be materialized"
            ) from exc
        stored = SemanticReplayRecord.from_record(candidate)
    else:
        _fail(
            "malformed_record",
            "semantic replay must be a record object or mapping",
        )

    expected_system_hash = _system_hash(system)
    bounded_limits = _validated_limits(limits)
    if stored.system_sha256 != expected_system_hash:
        _fail(
            "system_hash_mismatch",
            "semantic replay is bound to a different polynomial system",
        )
    if stored.values_raw_sha256 is not None:
        if raw_values_payload is None:
            _fail(
                "raw_values_payload_required",
                "retained raw PIQD values payload is required for verification",
            )
        if type(raw_values_payload) is bytes:
            raw_payload_bytes = raw_values_payload
            try:
                payload_text = raw_payload_bytes.decode("utf-8")
            except UnicodeDecodeError as exc:
                raise CapConfigurationReplayError(
                    "raw_values_payload_invalid",
                    "retained raw PIQD values bytes are not valid UTF-8",
                ) from exc
        elif type(raw_values_payload) is str:
            payload_text = raw_values_payload
            try:
                raw_payload_bytes = payload_text.encode("utf-8")
            except UnicodeEncodeError as exc:
                raise CapConfigurationReplayError(
                    "raw_values_payload_invalid",
                    "retained raw PIQD values text is not valid UTF-8",
                ) from exc
        else:
            _fail(
                "raw_values_payload_invalid",
                "retained raw PIQD values payload must be exact str or bytes",
            )
        if raw_sha256(raw_payload_bytes) != stored.values_raw_sha256:
            _fail(
                "raw_values_hash_mismatch",
                "retained raw PIQD values digest does not match replay record",
            )
        recomputed = replay_piqd_sat_values(
            system,
            payload_text,
            limits=bounded_limits,
        )
    else:
        if raw_values_payload is not None:
            _fail(
                "unexpected_raw_values_payload",
                "readback-only replay record does not bind raw PIQD values",
            )
        if type(allow_readback_only) is not bool or not allow_readback_only:
            _fail(
                "readback_only_not_authorized",
                "readback-only verification requires explicit authorization",
            )
        recomputed = replay_ordered_readback(
            system,
            stored.readback,
            limits=bounded_limits,
        )
    if canonical_json_bytes(recomputed.to_record()) != canonical_json_bytes(
        stored.to_record()
    ):
        _fail(
            "replay_record_mismatch",
            "stored semantic replay differs from independent recomputation",
        )
    return stored


__all__ = [
    "DEFAULT_REPLAY_LIMITS",
    "SEMANTIC_REPLAY_SCHEMA",
    "SEMANTIC_REPLAY_VERIFIER_ID",
    "AtomReplayResult",
    "CapConfigurationReplayError",
    "ExactRationalReadback",
    "ReplayIssue",
    "ReplayLimits",
    "SemanticReplayRecord",
    "parse_piqd_get_values",
    "replay_ordered_readback",
    "replay_piqd_sat_values",
    "verify_replay_record",
]
