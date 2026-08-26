"""Canonical JSON and hash primitives for cap-configuration artifacts.

Structured hashes cover canonical JSON without a terminal newline.  Stored JSON
artifacts add exactly one terminal newline, while raw artifacts are hashed as
their exact retained bytes.  Keeping these operations separate makes it harder
to accidentally authenticate a description of a byte artifact in its place.
"""

from __future__ import annotations

import hashlib
import json
import re
from collections.abc import Iterable
from typing import Any, NoReturn

_HASH_DOMAIN = re.compile(r"[a-z0-9][a-z0-9-]*/v[1-9][0-9]*")


class CapConfigurationSchemaError(ValueError):
    """Raised when an artifact violates the frozen serialization contract."""


def _fail(message: str) -> NoReturn:
    raise CapConfigurationSchemaError(message)


def _validate_json_value(value: Any, path: str = "value") -> None:
    if value is None or type(value) in {bool, int, str}:
        if type(value) is str:
            try:
                value.encode("utf-8")
            except UnicodeEncodeError as exc:
                raise CapConfigurationSchemaError(
                    f"{path} is not valid Unicode"
                ) from exc
        return
    if type(value) is list:
        for index, item in enumerate(value):
            _validate_json_value(item, f"{path}[{index}]")
        return
    if type(value) is dict:
        for key, item in value.items():
            if type(key) is not str:
                _fail(f"{path} has a non-string object key")
            _validate_json_value(key, f"{path}.<key>")
            _validate_json_value(item, f"{path}.{key}")
        return
    _fail(f"{path} has unsupported JSON type {type(value).__name__}")


def canonical_json_bytes(value: Any) -> bytes:
    """Return the one canonical UTF-8 JSON spelling of ``value``.

    Floats are excluded entirely.  Census schemas represent exact rationals as
    reduced numerator/denominator integer pairs, so accepting JSON floats here
    would create a second and potentially lossy numeric path.
    """

    try:
        _validate_json_value(value)
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
    except CapConfigurationSchemaError:
        raise
    except RecursionError as exc:
        raise CapConfigurationSchemaError("JSON value is nested too deeply") from exc
    except (ValueError, OverflowError) as exc:
        raise CapConfigurationSchemaError(
            "JSON value cannot be encoded canonically"
        ) from exc


def stored_json_bytes(value: Any) -> bytes:
    """Return canonical JSON followed by its single storage newline."""

    return canonical_json_bytes(value) + b"\n"


def _pairs_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON object key {key!r}")
        result[key] = value
    return result


def _reject_float(token: str) -> NoReturn:
    _fail(f"JSON floating-point token {token!r} is forbidden")


def _reject_constant(token: str) -> NoReturn:
    _fail(f"non-finite JSON token {token!r} is forbidden")


def parse_stored_json_bytes(payload: bytes) -> Any:
    """Parse and authenticate one canonical stored JSON artifact.

    Duplicate keys, floats, alternate whitespace/escaping, invalid UTF-8, and
    missing or repeated terminal newlines all fail closed.
    """

    if type(payload) is not bytes:
        _fail("stored JSON payload must be exact bytes")
    if not payload.endswith(b"\n"):
        _fail("stored JSON payload lacks its terminal newline")
    encoded = payload[:-1]
    try:
        text = encoded.decode("utf-8", errors="strict")
        value = json.loads(
            text,
            object_pairs_hook=_pairs_without_duplicates,
            parse_float=_reject_float,
            parse_constant=_reject_constant,
        )
    except CapConfigurationSchemaError:
        raise
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise CapConfigurationSchemaError("stored JSON payload is invalid") from exc
    if stored_json_bytes(value) != payload:
        _fail("stored JSON payload is not canonical")
    return value


def raw_sha256(payload: bytes) -> str:
    """Hash exact retained bytes without interpreting them as JSON."""

    if type(payload) is not bytes:
        _fail("raw SHA-256 payload must be exact bytes")
    return hashlib.sha256(payload).hexdigest()


def structured_hash(domain: str, value: Any) -> str:
    """Hash ``UTF8(domain + "\\n") + canonical_json(value)``."""

    if type(domain) is not str or _HASH_DOMAIN.fullmatch(domain) is None:
        _fail("structured-hash domain is not a canonical schema token")
    preimage = domain.encode("ascii") + b"\n" + canonical_json_bytes(value)
    return raw_sha256(preimage)


def exact_keys(
    value: Any,
    expected: Iterable[str],
    path: str,
) -> dict[str, Any]:
    """Require an exact JSON object key set and return the typed object."""

    if type(value) is not dict:
        _fail(f"{path} must be an object")
    expected_keys = frozenset(expected)
    actual_keys = frozenset(value)
    missing = sorted(expected_keys - actual_keys)
    extra = sorted(actual_keys - expected_keys)
    if missing or extra:
        _fail(f"{path} keys mismatch: missing={missing}, extra={extra}")
    return value


def exact_list(value: Any, path: str) -> list[Any]:
    if type(value) is not list:
        _fail(f"{path} must be an array")
    return value


def exact_int(value: Any, path: str, *, minimum: int | None = None) -> int:
    if type(value) is not int:
        _fail(f"{path} must be an integer")
    if minimum is not None and value < minimum:
        _fail(f"{path} must be at least {minimum}")
    return value


def canonical_text(value: Any, path: str) -> str:
    if (
        type(value) is not str
        or not value
        or value != value.strip()
        or any(ord(character) < 32 for character in value)
    ):
        _fail(f"{path} must be non-empty canonical text")
    try:
        value.encode("utf-8")
    except UnicodeEncodeError as exc:
        raise CapConfigurationSchemaError(f"{path} must be valid Unicode text") from exc
    return value
