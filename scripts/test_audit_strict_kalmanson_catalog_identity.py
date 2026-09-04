from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

SCRIPTS = Path(__file__).parent
REPO_ROOT = SCRIPTS.parent
sys.path.insert(0, str(SCRIPTS))

PRODUCER_PATH = SCRIPTS / "generate_strict_kalmanson_local_collapse_bank.py"
PRODUCER_SPEC = importlib.util.spec_from_file_location(
    "generate_strict_kalmanson_local_collapse_bank", PRODUCER_PATH
)
assert PRODUCER_SPEC is not None and PRODUCER_SPEC.loader is not None
producer = importlib.util.module_from_spec(PRODUCER_SPEC)
sys.modules[PRODUCER_SPEC.name] = producer
PRODUCER_SPEC.loader.exec_module(producer)

AUDIT_PATH = SCRIPTS / "audit_strict_kalmanson_catalog_identity.py"
AUDIT_SPEC = importlib.util.spec_from_file_location(
    "audit_strict_kalmanson_catalog_identity", AUDIT_PATH
)
assert AUDIT_SPEC is not None and AUDIT_SPEC.loader is not None
audit = importlib.util.module_from_spec(AUDIT_SPEC)
sys.modules[AUDIT_SPEC.name] = audit
AUDIT_SPEC.loader.exec_module(audit)


def test_bounded_scan_inventory_and_report_self_hash() -> None:
    patterns = producer.enumerate_minimal_local_collapses(4)
    target = hashlib.sha256(b"payload outside the fixed families").hexdigest()
    report = audit.scan_catalog_identity(patterns, target_sha256=target)

    assert report["schema"] == audit.SCAN_SCHEMA
    assert report["catalog_pattern_count"] == 12
    assert report["family_attempt_counts"] == {"basic": 3_256, "row_mask": 8_704}
    assert report["attempt_count"] == 11_960
    assert 0 < report["unique_payload_digest_count"] <= 11_960
    assert report["match_count"] == 0
    assert report["matches"] == []

    payload = audit.canonical_report_bytes(report)
    decoded = json.loads(payload)
    assert decoded == report
    assert payload.endswith(b"\n")


def test_report_self_hash_rejects_mutation() -> None:
    report = audit.scan_catalog_identity(
        producer.enumerate_minimal_local_collapses(4)
    )
    report["attempt_count"] = 0

    try:
        audit.canonical_report_bytes(report)
    except ValueError as error:
        assert str(error) == "scan report self-hash mismatch"
    else:
        raise AssertionError("mutated report unexpectedly passed its self-hash")


def test_retained_full_scan_report_is_self_authenticated() -> None:
    path = (
        REPO_ROOT
        / "docs/audits/2026-09-04-strict-kalmanson-catalog-identity-scan.json"
    )
    payload = path.read_bytes()
    report = json.loads(payload)

    assert report["catalog_pattern_count"] == 202
    assert report["catalog_diagnostic_sha256"] == (
        "eb9d60d2541b8ce7ab646fc752afc9f74d0cca750ab30234efcfaef598ad63f6"
    )
    assert report["attempt_count"] == 11_960
    assert report["unique_payload_digest_count"] == 5_520
    assert report["match_count"] == 0
    assert report["report_sha256"] == (
        "e74c891696b9e5d4ffc50ad8014d13a3bcc81cf6eaee24cb2938566e70668fbb"
    )
    assert audit.canonical_report_bytes(report) == payload
