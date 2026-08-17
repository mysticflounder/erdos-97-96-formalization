"""Focused fail-closed tests for the FortyNinth PIQD ingress adapter."""

from __future__ import annotations

from dataclasses import replace

import pytest
import validate_exact17_forty_ninth_piqd_ingress as subject


def test_production_pins_child_publication_and_single_core_policy() -> None:
    assert subject.PRODUCTION_EXPORT_SPEC.provisioned
    assert subject.PRODUCTION_INGRESS_SPEC.provisioned
    assert subject.CHILD_SHA256 == (
        "5b95f49958ec25f6d893bc27af748d93e93073256763b81842c7d16f23d7a4c5"
    )
    assert subject.CHILD_BYTES == 338_661_334
    assert subject.CHILD_CLAUSES == 7_198_668
    assert subject.RECEIPT_SHA256 == (
        "a9a54e254925354e65d5eae884a2565583030b7b43ce474b5875765abaa8e656"
    )
    assert subject.PUBLISHER_SHA256 == (
        "94e57910cd88baa7ebf393d43159f93086d5d6963e47d03841bea3e5be2bc582"
    )
    assert subject.VALIDATOR_SHA256 == (
        "fa251edd61234d222f89f345d770159bb1307ca2bb632a904b33051da5032c8d"
    )
    assert subject.COVERAGE_LEDGER_SHA256 == (
        "23c52a2d391938c280f8c31ed5b4a0ada152e6f265c1534d67f65b7a29cf1704"
    )
    assert subject.TIMEOUT_S == 3_600
    assert subject.REQUESTED_CORE_LIMIT == 1
    assert subject.MAX_REQUESTED_CORE_LIMIT == 12


def test_explicit_receipt_pin_mismatch_fails_before_large_cnf_replay() -> None:
    with pytest.raises(subject.IngressValidationError, match="manifest pin"):
        subject.validate_ingress(expected_manifest_sha256="0" * 64)


def test_streaming_export_replay_preserves_prefix_suffix_and_census() -> None:
    result = subject._streaming_validate_export(check_support=False)
    assert result["status"] == "PASS"
    assert result["child"] == {
        "path": str(subject.export_validator.CHILD_PATH.resolve()),
        "sha256": subject.CHILD_SHA256,
        "bytes": subject.CHILD_BYTES,
        "clauses": subject.CHILD_CLAUSES,
    }
    assert result["suffix"]["clauses"] == 196
    assert result["suffix"]["sha256"] == (
        "4c5c831aa026ad0c74055413f7814b9fc371a5dc02122254d899af1d6f47c4a8"
    )
    assert result["parent_subsumption_census"]["witness_total"] == 128


def test_any_production_identity_change_is_unprovisioned() -> None:
    changed = replace(subject.PRODUCTION_EXPORT_SPEC, child_bytes=1)
    changed_spec = replace(subject.PRODUCTION_INGRESS_SPEC, export=changed)
    assert not changed.provisioned
    assert not changed_spec.provisioned


def test_strict_json_rejects_duplicate_keys_and_nonfinite_constants() -> None:
    with pytest.raises(subject.IngressValidationError, match="duplicate JSON key"):
        subject._strict_json(b'{"schema":1,"schema":2}', "fixture")
    with pytest.raises(subject.IngressValidationError, match="invalid constant"):
        subject._strict_json(b'{"value":NaN}', "fixture")
