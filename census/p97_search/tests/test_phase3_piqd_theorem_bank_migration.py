from __future__ import annotations

import copy
import hashlib
import inspect
import json
import os
from dataclasses import replace
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_theorem_bank_migration as migration


def _registry_fixture(root: Path, *, json_bytes: bytes | None = None) -> None:
    for relative in migration.REGISTRY_RELATIVE_PATHS:
        path = root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        if relative.endswith(".json"):
            path.write_bytes(
                json_bytes
                or (
                    json.dumps(
                        {"candidate_declarations": [], "schema": "fixture/v1"}, indent=2
                    )
                    + "\n"
                ).encode()
            )
        else:
            path.write_bytes(f"fixture:{relative}\n".encode())


def _record(
    payload: bytes = b"payload", *, content: bytes = b'{"claim":false}'
) -> dict[str, object]:
    return {
        "content_sha256": hashlib.sha256(content).hexdigest(),
        "external_id": "fixture-1",
        "project": "fixture",
        "lane": "theorem-bank",
        "kind": "candidate",
        "payload_blob_hash": hashlib.sha256(payload).hexdigest(),
        "manifest_json": content.decode(),
        "created_at": 1,
    }


def _export(records: list[dict[str, object]]) -> dict[str, object]:
    records = sorted(records, key=lambda item: str(item["content_sha256"]))
    return {
        "root_version": migration.PIQD_EVIDENCE_ROOT_VERSION,
        "snapshot_token": "snapshot-fixture-1",
        "root": migration._record_root(records),
        "count": len(records),
        "records": records,
    }


class FakeTransport:
    def __init__(self, responses: list[object]) -> None:
        self.responses = responses
        self.calls: list[tuple[str, str, object]] = []

    def request(self, method: str, path: str, body=None) -> object:
        self.calls.append((method, path, body))
        assert self.responses, "unexpected fake request"
        return self.responses.pop(0)


def test_plan_is_deterministic_componentwise_and_claims_are_false(
    tmp_path: Path,
) -> None:
    _registry_fixture(tmp_path)
    first = migration.build_migration_plan(tmp_path)
    second = migration.build_migration_plan(tmp_path)
    assert first.document == second.document
    assert first.root_sha256 == migration.sha256_json(first.document["manifest"])
    assert first.document["manifest"]["components"] == first.document["registry_paths"]
    assert first.document["plan_sha256"] == migration.sha256_json(
        {key: value for key, value in first.document.items() if key != "plan_sha256"}
    )
    assert all(value is False for value in first.document["claims"].values())
    assert first.document["apply"] == {"status": "BLOCKED_ON_PIQD_FEATURE"}
    assert [item["relative_path"] for item in first.document["registry_paths"]] == list(
        migration.REGISTRY_RELATIVE_PATHS
    )


@pytest.mark.parametrize("kind", ["symlink", "hardlink"])
def test_capture_rejects_symlink_and_hardlink(tmp_path: Path, kind: str) -> None:
    _registry_fixture(tmp_path)
    target = tmp_path / migration.REGISTRY_RELATIVE_PATHS[0]
    replacement = tmp_path / "replacement.md"
    replacement.write_bytes(b"replacement")
    target.unlink()
    if kind == "symlink":
        target.symlink_to(replacement)
    else:
        os.link(replacement, target)
    with pytest.raises(migration.MigrationError, match="symlink|regular nlink=1"):
        migration.build_migration_plan(tmp_path)


def test_capture_rejects_traversal_and_duplicate_paths(tmp_path: Path) -> None:
    _registry_fixture(tmp_path)
    with pytest.raises(migration.MigrationError, match="safe relative"):
        migration._relative_parts("../outside")
    assert (
        "registry_paths"
        not in inspect.signature(migration.build_migration_plan).parameters
    )
    assert migration.REGISTRY_RELATIVE_PATHS == tuple(
        dict.fromkeys(migration.REGISTRY_RELATIVE_PATHS)
    )


def test_capture_is_bounded(tmp_path: Path) -> None:
    _registry_fixture(tmp_path)
    with pytest.raises(migration.MigrationError, match="bounded capture cap"):
        migration.build_migration_plan(tmp_path, byte_cap=1)


def test_json_duplicate_and_float_boundaries_fail_closed(tmp_path: Path) -> None:
    _registry_fixture(tmp_path, json_bytes=b'{"a":1,"a":2}')
    with pytest.raises(migration.MigrationError, match="duplicate JSON key"):
        migration.build_migration_plan(tmp_path)
    _registry_fixture(tmp_path, json_bytes=b'{"a":1.5}')
    with pytest.raises(migration.MigrationError, match="non-canonical scalar"):
        migration.build_migration_plan(tmp_path)
    with pytest.raises(migration.MigrationError, match="duplicate JSON key"):
        migration.strict_json_bytes(b'{"x":1,"x":2}', where="fake")
    _registry_fixture(
        tmp_path, json_bytes=b'{"candidate_declarations":[],"schema":"fixture/v1"}'
    )
    with pytest.raises(migration.MigrationError, match="canonical JSON byte format"):
        migration.build_migration_plan(tmp_path)


def test_toctou_change_between_read_and_fstat_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _registry_fixture(tmp_path)
    original_read = migration.os.read
    changed = False
    target = tmp_path / migration.REGISTRY_RELATIVE_PATHS[0]

    def changing_read(fd: int, size: int) -> bytes:
        nonlocal changed
        result = original_read(fd, size)
        if result and not changed:
            changed = True
            target.write_bytes(b"changed during capture\n")
        return result

    monkeypatch.setattr(migration.os, "read", changing_read)
    with pytest.raises(migration.MigrationError, match="changed during capture"):
        migration.build_migration_plan(tmp_path)


def test_capture_rebind_rejects_pathname_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _registry_fixture(tmp_path)
    target = tmp_path / migration.REGISTRY_RELATIVE_PATHS[0]
    original_open = migration.os.open
    final_opens = 0

    def replacing_open(path, flags, *args, **kwargs):
        nonlocal final_opens
        if path == target.name and kwargs.get("dir_fd") is not None:
            final_opens += 1
            if final_opens == 2:
                replacement = target.with_suffix(".replacement")
                replacement.write_bytes(b"same-size!\n")
                os.replace(replacement, target)
        return original_open(path, flags, *args, **kwargs)

    monkeypatch.setattr(migration.os, "open", replacing_open)
    with pytest.raises(migration.MigrationError, match="pathname was replaced"):
        migration.build_migration_plan(tmp_path)


def test_capture_rejects_same_size_mtime_preserving_byte_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _registry_fixture(tmp_path)
    target = tmp_path / migration.REGISTRY_RELATIVE_PATHS[0]
    original_read = migration.os.read
    drifted = False

    def drifting_read(fd: int, size: int) -> bytes:
        nonlocal drifted
        result = original_read(fd, size)
        if result and not drifted:
            drifted = True
            before = target.stat()
            original = target.read_bytes()
            target.write_bytes((b"X" if original[:1] != b"X" else b"Y") + original[1:])
            os.utime(target, ns=(before.st_atime_ns, before.st_mtime_ns))
        return result

    monkeypatch.setattr(migration.os, "read", drifting_read)
    with pytest.raises(migration.MigrationError, match="end pathname recapture"):
        migration.build_migration_plan(tmp_path)


def test_export_root_schema_and_payload_hash_are_checked() -> None:
    first = _record(b"one", content=b'{"a":1}')
    second = _record(b"two", content=b'{"b":2}')
    second["external_id"] = "fixture-2"
    body = _export([first, second])
    audit = migration.audit_evidence_export(
        body,
        blob_loader={
            str(first["payload_blob_hash"]): b"one",
            str(second["payload_blob_hash"]): b"two",
        }.get,
    )
    assert audit.payloads_verified is True
    assert audit.pages_verified is False
    assert len(audit.records) == 2
    bad_payload = dict(body)
    bad_payload["records"] = [dict(first, payload_blob_hash="0" * 64), second]
    with pytest.raises(migration.MigrationError, match="root does not match"):
        migration.audit_evidence_export(bad_payload)
    bad_root = dict(body, root="0" * 64)
    with pytest.raises(migration.MigrationError, match="root does not match"):
        migration.audit_evidence_export(bad_root)


def test_export_requires_snapshot_token() -> None:
    body = _export([_record()])
    body.pop("snapshot_token")
    with pytest.raises(migration.MigrationError) as exc_info:
        migration.audit_evidence_export(body)
    assert exc_info.value.code == "PIQD_SNAPSHOT_REQUIRED"


def test_export_rejects_wrong_root_version_and_bounded_strings() -> None:
    body = _export([_record()])
    with pytest.raises(migration.MigrationError, match="wrong root_version"):
        migration.audit_evidence_export(dict(body, root_version="other/v1"))
    large = dict(
        body,
        records=[
            dict(
                body["records"][0],
                external_id="x" * (migration.MAX_RESPONSE_STRING_BYTES + 1),
            )
        ],
    )
    with pytest.raises(migration.MigrationError, match="string bound"):
        migration.audit_evidence_export(large)


def test_export_rejects_oversized_payload_before_hash_use(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    payload = b"four"
    record = _record(payload=payload)
    monkeypatch.setattr(migration, "MAX_PAYLOAD_BYTES", 3)
    with pytest.raises(migration.MigrationError, match="payload blob exceeds"):
        migration.audit_evidence_export(
            _export([record]), blob_loader=lambda _: payload
        )


def test_export_rejects_bool_float_subclass_and_noncanonical_shapes() -> None:
    body = _export([_record()])
    for key, value in (("count", True), ("count", 1.0)):
        bad = dict(body, **{key: value})
        with pytest.raises(migration.MigrationError, match="exact integer"):
            migration.audit_evidence_export(bad)
    bad_record = dict(body["records"][0], created_at=type("IntSubclass", (int,), {})(1))
    with pytest.raises(migration.MigrationError, match="exact integer"):
        migration.audit_evidence_export(dict(body, records=[bad_record]))
    bad_schema = dict(body, extra=False)
    with pytest.raises(migration.MigrationError, match="unexpected schema"):
        migration.audit_evidence_export(bad_schema)
    for manifest_json in ('{"a": 1}', '{"a":1,"a":2}', '{"a":1.5}'):
        content = manifest_json.encode()
        record = _record(content=content)
        bad = _export([record])
        with pytest.raises(migration.MigrationError):
            migration.audit_evidence_export(bad)
    deep = "{}"
    for _ in range(migration.MAX_JSON_DEPTH + 2):
        deep = '{"x":' + deep + "}"
    deep_record = _record(content=deep.encode())
    with pytest.raises(migration.MigrationError, match="depth limit"):
        migration.audit_evidence_export(_export([deep_record]))
    subclass_record = dict(
        body["records"][0],
        manifest_json=type("StringSubclass", (str,), {})(
            body["records"][0]["manifest_json"]
        ),
    )
    with pytest.raises(migration.MigrationError, match="exact string"):
        migration.audit_evidence_export(dict(body, records=[subclass_record]))


def test_pagination_cursor_and_root_drift_fail_closed() -> None:
    first = _record(b"one", content=b'{"a":1}')
    second = _record(b"two", content=b'{"b":2}')
    second["external_id"] = "fixture-2"
    export = _export([first, second])
    ordered = export["records"]
    page_one = {
        "snapshot_token": export["snapshot_token"],
        "records": [ordered[0]],
        "count": 1,
        "next_after": ordered[0]["content_sha256"],
    }
    page_two = {
        "snapshot_token": export["snapshot_token"],
        "records": [ordered[1]],
        "count": 1,
        "next_after": ordered[1]["content_sha256"],
    }
    page_three = {
        "snapshot_token": export["snapshot_token"],
        "records": [],
        "count": 0,
        "next_after": None,
    }
    transport = FakeTransport(
        [(200, export), (200, page_one), (200, page_two), (200, page_three)]
    )
    audit = migration.audit_piqd_evidence(transport, page_limit=1)
    assert audit.pages_verified is True
    assert [path for _, path, _ in transport.calls] == [
        "/evidence/export",
        "/evidence?limit=1",
        f"/evidence?limit=1&after={ordered[0]['content_sha256']}",
        f"/evidence?limit=1&after={ordered[1]['content_sha256']}",
    ]

    drift = dict(page_two, records=[dict(ordered[0])])
    drift_transport = FakeTransport([(200, export), (200, page_one), (200, drift)])
    with pytest.raises(migration.MigrationError, match="regressed|drifted"):
        migration.audit_piqd_evidence(drift_transport, page_limit=1)

    bad_cursor = dict(page_one, next_after="0" * 64)
    bad_cursor_transport = FakeTransport([(200, export), (200, bad_cursor)])
    with pytest.raises(migration.MigrationError, match="invalid next_after"):
        migration.audit_piqd_evidence(bad_cursor_transport, page_limit=1)

    repeated = dict(page_two, next_after=ordered[0]["content_sha256"])
    repeated_transport = FakeTransport(
        [(200, export), (200, page_one), (200, repeated)]
    )
    with pytest.raises(
        migration.MigrationError, match="invalid|did not advance|regressed"
    ):
        migration.audit_piqd_evidence(repeated_transport, page_limit=1)

    terminal = {
        "snapshot_token": export["snapshot_token"],
        "records": [ordered[0]],
        "count": 1,
        "next_after": None,
    }
    terminal_transport = FakeTransport([(200, export), (200, terminal)])
    with pytest.raises(migration.MigrationError, match="invalid next_after"):
        migration.audit_piqd_evidence(terminal_transport, page_limit=1)

    page_drift = dict(page_one, snapshot_token="snapshot-other")
    page_drift_transport = FakeTransport([(200, export), (200, page_drift)])
    with pytest.raises(migration.MigrationError, match="snapshot token"):
        migration.audit_piqd_evidence(page_drift_transport, page_limit=1)


def test_apply_blocks_before_any_mutation_even_with_caller_capability(
    tmp_path: Path,
) -> None:
    _registry_fixture(tmp_path)
    plan = migration.build_migration_plan(tmp_path)
    transport = FakeTransport([])
    for capability in (None, {}, {"method": "POST", "path": "/evidence/atomic"}):
        with pytest.raises(migration.MigrationError) as exc_info:
            migration.apply_migration(plan, transport, capability)
        assert exc_info.value.code == "BLOCKED_ON_PIQD_FEATURE"
        assert transport.calls == []


def test_forged_components_fail_plan_custody(tmp_path: Path) -> None:
    _registry_fixture(tmp_path)
    plan = migration.build_migration_plan(tmp_path)
    forged_component = replace(plan.components[0], content=b"forged")
    forged = migration.MigrationPlan(
        document=plan.document,
        components=(forged_component, *plan.components[1:]),
    )
    with pytest.raises(migration.MigrationError, match="captured bytes"):
        migration._validate_plan_custody(forged)
    tampered_document = dict(plan.document, root_sha256="0" * 64)
    tampered = migration.MigrationPlan(
        document=tampered_document, components=plan.components
    )
    with pytest.raises(migration.MigrationError, match="root"):
        migration._validate_plan_custody(tampered)
    transport = FakeTransport([])
    with pytest.raises(migration.MigrationError) as exc_info:
        migration.apply_migration(forged, transport, {"attested": True})
    assert exc_info.value.code == "BLOCKED_ON_PIQD_FEATURE"
    assert transport.calls == []


def test_public_plan_validation_rejects_forged_recomputed_plan(tmp_path: Path) -> None:
    _registry_fixture(tmp_path)
    plan = migration.build_migration_plan(tmp_path)
    forged_bytes = b"forged-source\n"
    forged_component = replace(
        plan.components[0],
        content=forged_bytes,
        size_bytes=len(forged_bytes),
        sha256=migration.sha256_bytes(forged_bytes),
    )
    forged_components = (forged_component, *plan.components[1:])
    document = copy.deepcopy(plan.document)
    document["manifest"]["components"][0]["size_bytes"] = len(forged_bytes)
    document["manifest"]["components"][0]["sha256"] = migration.sha256_bytes(
        forged_bytes
    )
    document["registry_paths"][0]["size_bytes"] = len(forged_bytes)
    document["registry_paths"][0]["sha256"] = migration.sha256_bytes(forged_bytes)
    document["total_size_bytes"] = sum(
        entry["size_bytes"] for entry in document["registry_paths"]
    )
    document["root_sha256"] = migration.sha256_json(document["manifest"])
    document["plan_sha256"] = migration.sha256_json(
        {key: value for key, value in document.items() if key != "plan_sha256"}
    )
    forged = migration.MigrationPlan(document=document, components=forged_components)
    migration._validate_plan_custody(forged)
    with pytest.raises(migration.MigrationError, match="canonical source"):
        migration.validate_migration_plan(forged, tmp_path)


def test_registry_json_depth_and_invalid_utf8_fail_closed(tmp_path: Path) -> None:
    deep = "{}"
    for _ in range(migration.MAX_JSON_DEPTH + 2):
        deep = '{"x":' + deep + "}"
    _registry_fixture(tmp_path, json_bytes=deep.encode())
    with pytest.raises(migration.MigrationError, match="depth limit"):
        migration.build_migration_plan(tmp_path)
    _registry_fixture(tmp_path, json_bytes=b"{\xff}")
    with pytest.raises(migration.MigrationError, match="strict JSON"):
        migration.build_migration_plan(tmp_path)


def test_blob_ingest_qualifier_binds_exact_bytes_and_optional_readback() -> None:
    payload = b"external theorem-bank fixture bytes"
    digest = hashlib.sha256(payload).hexdigest()
    transport = FakeTransport(
        [
            (201, {"hash": digest, "bytes": len(payload), "already_present": False}),
            (200, payload),
        ]
    )
    result = migration.qualify_blob_ingest(transport, payload, verify_get=True)
    assert result == migration.BlobIngestQualification(
        sha256=digest,
        size_bytes=len(payload),
        status_code=201,
        already_present=False,
        get_verified=True,
    )
    assert transport.calls == [
        ("PUT", f"/blobs/{digest}", payload),
        ("GET", f"/blobs/{digest}", None),
    ]
    assert transport.calls[0][1] == transport.calls[0][1].lower()


def test_blob_ingest_qualifier_accepts_idempotent_200_only_with_true_flag() -> None:
    payload = b"already stored"
    digest = hashlib.sha256(payload).hexdigest()
    transport = FakeTransport(
        [(200, {"hash": digest, "bytes": len(payload), "already_present": True})]
    )
    result = migration.qualify_blob_ingest(transport, payload)
    assert result.status_code == 200
    assert result.already_present is True


def test_blob_ingest_qualifier_rejects_422_mismatch_without_followup() -> None:
    payload = b"mismatch fixture"
    transport = FakeTransport([(422, {"error": "digest mismatch"})])
    with pytest.raises(migration.MigrationError) as exc_info:
        migration.qualify_blob_ingest(transport, payload, verify_get=True)
    assert exc_info.value.code == "PIQD_BLOB_REJECTED"
    assert len(transport.calls) == 1
    assert transport.calls[0][0] == "PUT"


def test_blob_ingest_qualifier_rejects_schema_types_and_hash_crossing() -> None:
    payload = b"strict response fixture"
    digest = hashlib.sha256(payload).hexdigest()
    responses = [
        (201, {"hash": digest, "bytes": len(payload), "already_present": True}),
        (201, {"hash": digest, "bytes": float(len(payload)), "already_present": False}),
        (201, {"hash": "0" * 64, "bytes": len(payload), "already_present": False}),
        (
            201,
            {
                "hash": digest,
                "bytes": len(payload),
                "already_present": False,
                "extra": 1,
            },
        ),
        (422, {"error": "digest mismatch", "wrote": True}),
    ]
    for response in responses:
        transport = FakeTransport([response])
        with pytest.raises(migration.MigrationError):
            migration.qualify_blob_ingest(transport, payload)
        assert len(transport.calls) == 1


def test_blob_ingest_qualifier_rejects_readback_drift_and_payload_bounds(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    payload = b"readback fixture"
    digest = hashlib.sha256(payload).hexdigest()
    transport = FakeTransport(
        [
            (201, {"hash": digest, "bytes": len(payload), "already_present": False}),
            (200, b"different bytes"),
        ]
    )
    with pytest.raises(migration.MigrationError, match="differ|match"):
        migration.qualify_blob_ingest(transport, payload, verify_get=True)

    monkeypatch.setattr(migration, "MAX_PAYLOAD_BYTES", 3)
    with pytest.raises(migration.MigrationError, match="exceeds"):
        migration.qualify_blob_ingest(FakeTransport([]), b"1234")

    class BytesSubclass(bytes):
        pass

    with pytest.raises(migration.MigrationError, match="exact bytes"):
        migration.qualify_blob_ingest(FakeTransport([]), BytesSubclass(b"123"))
    with pytest.raises(migration.MigrationError, match="exact boolean"):
        migration.qualify_blob_ingest(FakeTransport([]), b"123", verify_get=1)
