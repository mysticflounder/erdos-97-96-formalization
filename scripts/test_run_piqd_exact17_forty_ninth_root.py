"""Focused offline tests for the FortyNinth one-shot PIQD runner adapter."""

from __future__ import annotations

import hashlib

import run_piqd_exact17_forty_ninth_root as subject


def _fake_ingress() -> dict[str, object]:
    spec = subject.PRODUCTION_RUNNER_SPEC
    return {
        "status": "PASS",
        "dimacs": {
            "path": str(subject.PRODUCTION_RUNNER_PATHS.ingress.child.resolve()),
            "sha256": spec.root_sha256,
            "bytes": spec.root_bytes,
            "variables": spec.variables,
            "clauses": spec.clauses,
        },
        "lean": {
            "root": {
                "sha256": subject.ingress.export_validator.LEAN_ROOT_SHA256,
            }
        },
        "export_receipt": {"schema": subject.ingress.RECEIPT_SCHEMA},
    }


def test_production_runner_pins_root_and_execution_policy() -> None:
    spec = subject.PRODUCTION_RUNNER_SPEC
    assert spec.provisioned
    assert spec.root_sha256 == subject.ingress.CHILD_SHA256
    assert spec.root_bytes == 338_661_334
    assert spec.variables == 308
    assert spec.clauses == 7_198_668
    assert spec.timeout_s == 3_600
    assert spec.requested_core_limit == 1
    assert spec.maximum_requested_core_limit == 12
    subject._configure_base()
    assert subject._base._validate_lane_checkpoint(subject.PRODUCTION_RUNNER_PATHS)


def test_forty_ninth_manifests_are_authenticated_without_launch() -> None:
    source, producer = subject.build_static_manifests(_fake_ingress())
    assert len(source) == subject.SOURCE_MANIFEST_BYTES
    assert len(producer) == subject.PRODUCER_MANIFEST_BYTES
    assert hashlib.sha256(source).hexdigest() == subject.SOURCE_MANIFEST_SHA256
    assert hashlib.sha256(producer).hexdigest() == subject.PRODUCER_MANIFEST_SHA256


def test_identity_hash_binds_one_core_and_producer_manifest() -> None:
    spec = subject.PRODUCTION_RUNNER_SPEC
    material = (
        f"raw-dimacs/v1\n{spec.ingress.backend}\n{spec.ingress.solver_profile}\n"
        f"{spec.root_sha256}\n{subject.PRODUCER_MANIFEST_SHA256}\ncores=1"
    )
    assert (
        subject.expected_identity_hash()
        == hashlib.sha256(material.encode()).hexdigest()
    )
