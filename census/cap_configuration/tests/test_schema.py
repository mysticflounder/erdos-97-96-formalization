from __future__ import annotations

import hashlib

import pytest

from census import cap_configuration
from census.cap_configuration.schema import (
    CapConfigurationSchemaError,
    canonical_json_bytes,
    canonical_text,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)


def test_canonical_json_is_sorted_compact_utf8_and_stored_once() -> None:
    value = {"z": [True, None, 4], "alpha": "λ"}
    encoded = b'{"alpha":"\xce\xbb","z":[true,null,4]}'
    assert canonical_json_bytes(value) == encoded
    assert stored_json_bytes(value) == encoded + b"\n"
    assert parse_stored_json_bytes(encoded + b"\n") == value


def test_structured_hash_uses_domain_newline_and_excludes_storage_newline() -> None:
    domain = "cap-configuration-cell/v1"
    value = {"index": 7, "name": "tiny"}
    expected = hashlib.sha256(
        domain.encode("ascii") + b"\n" + canonical_json_bytes(value)
    ).hexdigest()
    assert (
        expected == "e89f901779d2a4614c66e995b175f704caa5cc5e1a28d0c94b04e11c36c05f6d"
    )
    assert structured_hash(domain, value) == expected
    assert structured_hash(domain, value) != raw_sha256(stored_json_bytes(value))


def test_raw_sha256_pins_exact_bytes_including_terminal_newline() -> None:
    assert raw_sha256(b"abc\n") == (
        "edeaaff3f1774ad2888673770c6d64097e391bc362d7d6fb34982ddf0efd18cb"
    )
    assert raw_sha256(b"abc\n") != raw_sha256(b"abc")


def test_package_facade_exposes_the_canonical_stored_json_parser() -> None:
    assert cap_configuration.parse_stored_json_bytes(b'{"a":1}\n') == {"a": 1}


@pytest.mark.parametrize(
    "payload",
    [
        b'{"a":1,"a":2}\n',
        b'{"outer":{"a":1,"a":2}}\n',
        b'{"a":1,"\\u0061":2}\n',
        b'{"a": 1}\n',
        b'{"a":1}',
        b'{"a":1}\n\n',
        b'{"a":1.0}\n',
        b'{"a":NaN}\n',
        b'{"a":"\\u03bb"}\n',
        b"\xff\n",
    ],
)
def test_stored_json_parser_rejects_ambiguous_or_noncanonical_bytes(
    payload: bytes,
) -> None:
    with pytest.raises(CapConfigurationSchemaError):
        parse_stored_json_bytes(payload)


@pytest.mark.parametrize(
    "value",
    [1.5, {"value": 1.0}, (1, 2), {1: "non-string-key"}],
)
def test_canonical_json_rejects_non_contract_types(value: object) -> None:
    with pytest.raises(CapConfigurationSchemaError):
        canonical_json_bytes(value)


def test_canonical_text_rejects_invalid_unicode() -> None:
    with pytest.raises(CapConfigurationSchemaError, match="valid Unicode"):
        canonical_text("bad\ud800", "fixture")


@pytest.mark.parametrize(
    "payload",
    [b"[" * 2000 + b"0" + b"]" * 2000 + b"\n", b"{" + b'"n":' + b"1" * 5000 + b"}\n"],
    ids=["deeply-nested", "oversized-integer"],
)
def test_hostile_json_inputs_fail_through_the_schema_error(payload: bytes) -> None:
    with pytest.raises(CapConfigurationSchemaError):
        parse_stored_json_bytes(payload)


@pytest.mark.parametrize(
    "value", [10**5000, {"n": 10**5000}], ids=["scalar", "object"]
)
def test_oversized_python_integers_fail_through_the_schema_error(value: object) -> None:
    with pytest.raises(CapConfigurationSchemaError):
        canonical_json_bytes(value)


@pytest.mark.parametrize(
    "domain",
    ["", "Cap-configuration-cell/v1", "cap configuration/v1", "x/v0", "x/v01"],
)
def test_structured_hash_rejects_noncanonical_domains(domain: str) -> None:
    with pytest.raises(CapConfigurationSchemaError):
        structured_hash(domain, {})
