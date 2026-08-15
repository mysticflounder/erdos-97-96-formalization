"""Focused fail-closed tests for the current-root-two-kalmanson PIQD ingress."""

from __future__ import annotations

from dataclasses import replace
from pathlib import Path

import pytest
import validate_exact17_current_root_two_kalmanson_ingress as subject


def test_production_ingress_replays_and_binds_every_published_identity() -> None:
    report = subject.validate_ingress()

    assert report["status"] == "PASS"
    assert report["dimacs"] == {
        "path": str(subject.export_validator.CHILD_PATH.resolve()),
        "sha256": subject.export_validator.CHILD_SHA256,
        "bytes": 333_029_088,
        "variables": 308,
        "clauses": 7_037_176,
    }
    assert report["export_receipt"]["sha256"] == subject.RECEIPT_SHA256
    assert report["publisher"]["sha256"] == subject.PUBLISHER_SHA256
    assert report["validator"]["sha256"] == subject.VALIDATOR_SHA256
    assert report["lean"]["root"]["sha256"] == subject.export_validator.LEAN_ROOT_SHA256
    assert (
        report["lean"]["export"]["sha256"]
        == subject.export_validator.LEAN_EXPORT_SHA256
    )
    assert report["variable_map"]["sha256"] == subject.VARIABLE_MAP_SHA256
    assert report["piqd"]["timeout_s"] == 3_600
    assert report["piqd"]["requested_core_limit"] == 1
    assert report["piqd"]["maximum_requested_core_limit"] == 12
    assert report["piqd"]["unsat_certified_without_proof_replay"] is False


def test_explicit_receipt_pin_mismatch_fails_before_launch() -> None:
    with pytest.raises(
        subject.IngressValidationError, match="manifest pin arguments disagree"
    ):
        subject.validate_ingress(expected_manifest_sha256="0" * 64)


def test_any_production_identity_change_marks_spec_unprovisioned() -> None:
    changed_export = replace(subject.PRODUCTION_EXPORT_SPEC, child_bytes=1)
    changed_ingress = replace(subject.PRODUCTION_INGRESS_SPEC, export=changed_export)

    assert not changed_export.provisioned
    assert not changed_ingress.provisioned
    with pytest.raises(subject.IngressValidationError, match="unprovisioned"):
        subject.validate_ingress(spec=changed_ingress)


def test_receipt_must_itself_be_the_piqd_manifest(tmp_path: Path) -> None:
    paths = replace(
        subject.PRODUCTION_INGRESS_PATHS,
        manifest=tmp_path / "derived-manifest.json",
    )
    with pytest.raises(subject.IngressValidationError, match="receipt itself"):
        subject.validate_ingress(paths)


def test_strict_json_rejects_duplicate_keys_and_nonfinite_constants() -> None:
    with pytest.raises(subject.IngressValidationError, match="duplicate JSON key"):
        subject._strict_json(b'{"schema":1,"schema":2}', "fixture")
    with pytest.raises(subject.IngressValidationError, match="invalid constant"):
        subject._strict_json(b'{"value":NaN}', "fixture")


def test_nofollow_reader_rejects_symlinked_parent(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.mkdir()
    (target / "receipt.json").write_text("{}", encoding="utf-8")
    link = tmp_path / "link"
    link.symlink_to(target, target_is_directory=True)

    with pytest.raises(
        subject.IngressValidationError, match="cannot open without following"
    ):
        subject._read_bound(
            link / "receipt.json",
            subject.FileBinding("0" * 64, 2),
            "fixture",
        )


def test_normal_ingress_artifact_rejects_hardlinks(tmp_path: Path) -> None:
    first = tmp_path / "first"
    second = tmp_path / "second"
    first.write_bytes(b"bound")
    second.hardlink_to(first)
    binding = subject.FileBinding(
        __import__("hashlib").sha256(b"bound").hexdigest(),
        5,
    )

    with pytest.raises(subject.IngressValidationError, match="not singly linked"):
        subject._attest(first, binding, "fixture")
