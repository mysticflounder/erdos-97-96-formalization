"""Plan a fail-closed migration of the P97 theorem-bank registry.

The registry is source-owned.  This module captures the seven canonical
registry components exactly (with no symlink or hard-link following), emits a
deterministic manifest/plan, and audits the read-only PIQD evidence v2 export.
It does not infer theorem meaning, deduplicate declarations, or promote
computational evidence to a theorem.

``apply_migration`` is unconditionally disabled.  A caller-supplied claim
cannot authenticate or prove a future PIQD endpoint, so no production path
crosses the current split API or any invented future route.
"""

from __future__ import annotations

import errno
import hashlib
import json
import os
import re
import stat
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Protocol

SCHEMA = "p97-piqd-theorem-bank-migration/v1"
PIQD_EVIDENCE_ROOT_VERSION = "piqd-evidence-root/v2"
DEFAULT_COMPONENT_BYTES = 64 * 1024 * 1024
MAX_JSON_DEPTH = 128
MAX_RESPONSE_NODES = 250_000
MAX_RESPONSE_STRING_BYTES = 1 * 1024 * 1024
MAX_RESPONSE_LIST_ITEMS = 100_000
MAX_EXPORT_RECORDS = 100_000
MAX_PAGE_RECORDS = 10_000
MAX_TOTAL_RECORD_STRING_BYTES = 256 * 1024 * 1024
MAX_PAYLOAD_BYTES = 64 * 1024 * 1024

REGISTRY_RELATIVE_PATHS: tuple[str, ...] = (
    "docs/general-n-certificate-bank-mining-2026-07-09.md",
    "certificates/p97_rvol_general_n_mining.md",
    "certificates/p97_rvol_general_n_mining.json",
    "certificates/erdos97_legacy_general_n_mining.md",
    "certificates/erdos97_legacy_general_n_mining.json",
    "certificates/erdos_general_theorem_p97_mining.md",
    "certificates/erdos_general_theorem_p97_mining.json",
)
_HEX64 = re.compile(r"[0-9a-f]{64}\Z")
_REQUIRED_RECORD_KEYS = frozenset(
    {
        "content_sha256",
        "external_id",
        "project",
        "lane",
        "kind",
        "payload_blob_hash",
        "manifest_json",
        "created_at",
    }
)
_OPTIONAL_RECORD_KEYS = frozenset(
    {"job_id", "session_id", "solve_index", "receipt_result_sha256"}
)
_EXPORT_KEYS = frozenset({"root_version", "snapshot_token", "root", "count", "records"})
_PAGE_KEYS = frozenset({"snapshot_token", "records", "count", "next_after"})


class MigrationError(ValueError):
    """A source, plan, export, or capability boundary failed closed."""

    def __init__(self, message: str, *, code: str = "INVALID_MIGRATION_INPUT") -> None:
        super().__init__(message)
        self.code = code


def canonical_json_bytes(value: Any) -> bytes:
    """The one JSON encoding used for hashes and emitted plans."""

    try:
        return json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise MigrationError(f"value is not canonical JSON: {exc}") from exc


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_json(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _reject_constant(value: str) -> Any:
    raise ValueError(f"non-finite JSON constant {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def strict_json_bytes(raw: bytes, *, where: str) -> object:
    """Parse JSON without duplicate keys, NaN/Infinity, or invalid UTF-8."""

    if type(raw) is not bytes:
        raise MigrationError(f"{where} must be exact UTF-8 bytes")
    try:
        text = raw.decode("utf-8")
        return json.loads(
            text,
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        RecursionError,
        ValueError,
    ) as exc:
        raise MigrationError(f"{where} is not strict JSON: {exc}") from exc


def _exact_int(value: object, *, where: str, minimum: int | None = None) -> int:
    if type(value) is not int or (minimum is not None and value < minimum):
        suffix = "" if minimum is None else f" >= {minimum}"
        raise MigrationError(f"{where} must be an exact integer{suffix}")
    return value


def _exact_string(value: object, *, where: str) -> str:
    if type(value) is not str:
        raise MigrationError(f"{where} must be an exact string")
    return value


def _hex(value: object, *, where: str) -> str:
    value = _exact_string(value, where=where)
    if _HEX64.fullmatch(value) is None:
        raise MigrationError(f"{where} must be lower-case SHA-256 hex")
    return value


def _json_tree(value: object, *, where: str, depth: int = 0) -> None:
    """Reject Python bool/float/subclasses even when a fake bypasses JSON."""

    if depth > MAX_JSON_DEPTH:
        raise MigrationError(f"{where} exceeds JSON depth limit")
    if value is None or type(value) in (bool, int, str):
        return
    if type(value) is list:
        for index, item in enumerate(value):
            _json_tree(item, where=f"{where}[{index}]", depth=depth + 1)
        return
    if type(value) is dict:
        for key, item in value.items():
            if type(key) is not str:
                raise MigrationError(f"{where} has a non-string key")
            _json_tree(item, where=f"{where}.{key}", depth=depth + 1)
        return
    raise MigrationError(f"{where} uses a non-canonical scalar type")


def _bounded_json_tree(value: object, *, where: str) -> None:
    """Validate a decoded response before any record/payload processing."""

    nodes = 0
    string_bytes = 0

    def visit(item: object, path: str, depth: int) -> None:
        nonlocal nodes, string_bytes
        nodes += 1
        if nodes > MAX_RESPONSE_NODES:
            raise MigrationError(f"{where} exceeds response node bound")
        if depth > MAX_JSON_DEPTH:
            raise MigrationError(f"{path} exceeds JSON depth limit")
        # Scalar shape is bounded here; field-specific exact-type validators
        # below produce the precise rejection for bool/float counters.
        if item is None or isinstance(item, (bool, int, float)):
            return
        if isinstance(item, str):
            try:
                size = len(item.encode("utf-8"))
            except UnicodeEncodeError as exc:
                raise MigrationError(f"{path} is not valid UTF-8") from exc
            if size > MAX_RESPONSE_STRING_BYTES:
                raise MigrationError(f"{path} exceeds response string bound")
            string_bytes += size
            if string_bytes > MAX_TOTAL_RECORD_STRING_BYTES:
                raise MigrationError(f"{where} exceeds aggregate string bound")
            return
        if type(item) is list:
            if len(item) > MAX_RESPONSE_LIST_ITEMS:
                raise MigrationError(f"{path} exceeds response list bound")
            for index, child in enumerate(item):
                visit(child, f"{path}[{index}]", depth + 1)
            return
        if type(item) is dict:
            if len(item) > MAX_RESPONSE_LIST_ITEMS:
                raise MigrationError(f"{path} exceeds response object bound")
            for key, child in item.items():
                if type(key) is not str:
                    raise MigrationError(f"{path} has a non-string key")
                visit(child, f"{path}.{key}", depth + 1)
            return
        raise MigrationError(f"{path} uses a non-canonical scalar type")

    visit(value, where, 0)


@dataclass(frozen=True)
class CapturedComponent:
    path_label: str
    relative_path: str
    size_bytes: int
    sha256: str
    content: bytes


@dataclass(frozen=True)
class MigrationPlan:
    document: Mapping[str, Any]
    components: tuple[CapturedComponent, ...]

    @property
    def plan_sha256(self) -> str:
        return str(self.document["plan_sha256"])

    @property
    def root_sha256(self) -> str:
        return str(self.document["root_sha256"])


def _relative_parts(relative_path: str) -> tuple[str, ...]:
    path = PurePosixPath(relative_path)
    if (
        not relative_path
        or path.is_absolute()
        or "\\" in relative_path
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        raise MigrationError(
            f"registry path is not a safe relative path: {relative_path!r}",
            code="UNSAFE_PATH",
        )
    return tuple(path.parts)


def _open_parent(root: Path, parts: tuple[str, ...]) -> int:
    directory_fd = os.open(root, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        for part in parts[:-1]:
            next_fd = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        return directory_fd
    except BaseException:
        os.close(directory_fd)
        raise


def _read_fd(file_fd: int, relative_path: str, *, byte_cap: int) -> bytes:
    chunks: list[bytes] = []
    total = 0
    while True:
        chunk = os.read(file_fd, min(1024 * 1024, byte_cap + 1 - total))
        if not chunk:
            break
        chunks.append(chunk)
        total += len(chunk)
        if total > byte_cap:
            raise MigrationError(
                f"{relative_path} changed beyond bounded capture cap",
                code="SOURCE_TOO_LARGE",
            )
    return b"".join(chunks)


def _capture_component(root: Path, relative_path: str, *, byte_cap: int) -> bytes:
    parts = _relative_parts(relative_path)
    if type(byte_cap) is not int or byte_cap <= 0:
        raise MigrationError("byte_cap must be a positive exact integer")
    try:
        root_stat = os.lstat(root)
    except OSError as exc:
        raise MigrationError(
            f"registry root cannot be inspected: {exc}", code="SOURCE_UNAVAILABLE"
        ) from exc
    if stat.S_ISLNK(root_stat.st_mode) or not stat.S_ISDIR(root_stat.st_mode):
        raise MigrationError(
            "registry root must be a real directory", code="UNSAFE_PATH"
        )

    directory_fd: int | None = None
    file_fd: int | None = None
    end_directory_fd: int | None = None
    end_file_fd: int | None = None
    try:
        directory_fd = _open_parent(root, parts)
        file_fd = os.open(parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd)
        before = os.fstat(file_fd)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise MigrationError(
                f"{relative_path} must be a regular nlink=1 file",
                code="UNSAFE_PATH",
            )
        if before.st_size > byte_cap:
            raise MigrationError(
                f"{relative_path} exceeds bounded capture cap {byte_cap}",
                code="SOURCE_TOO_LARGE",
            )
        content = _read_fd(file_fd, relative_path, byte_cap=byte_cap)
        after = os.fstat(file_fd)
        identity = (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns)
        final_identity = (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns)
        if identity != final_identity or after.st_nlink != 1:
            raise MigrationError(
                f"{relative_path} changed during capture", code="SOURCE_CHANGED"
            )
        # Rebind the complete pathname at the end.  Metadata alone cannot
        # detect a same-size/same-mtime replacement, so recapture and compare
        # exact bytes and hashes from the rebound pathname.
        end_directory_fd = _open_parent(root, parts)
        end_file_fd = os.open(
            parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=end_directory_fd
        )
        rebound = os.fstat(end_file_fd)
        if (
            not stat.S_ISREG(rebound.st_mode)
            or rebound.st_nlink != 1
            or (rebound.st_dev, rebound.st_ino) != (before.st_dev, before.st_ino)
        ):
            raise MigrationError(
                f"{relative_path} pathname was replaced", code="SOURCE_CHANGED"
            )
        rebound_content = _read_fd(end_file_fd, relative_path, byte_cap=byte_cap)
        rebound_after = os.fstat(end_file_fd)
        if (
            rebound.st_nlink != 1
            or (rebound.st_dev, rebound.st_ino)
            != (rebound_after.st_dev, rebound_after.st_ino)
            or rebound_content != content
            or sha256_bytes(rebound_content) != sha256_bytes(content)
        ):
            raise MigrationError(
                f"{relative_path} changed during end pathname recapture",
                code="SOURCE_CHANGED",
            )
        return content
    except OSError as exc:
        if exc.errno == errno.ELOOP:
            raise MigrationError(
                f"{relative_path} contains a symlink",
                code="UNSAFE_PATH",
            ) from exc
        raise MigrationError(
            f"cannot capture registry component {relative_path}: {exc}",
            code="SOURCE_UNAVAILABLE",
        ) from exc
    finally:
        if file_fd is not None:
            os.close(file_fd)
        if directory_fd is not None:
            os.close(directory_fd)
        if end_file_fd is not None:
            os.close(end_file_fd)
        if end_directory_fd is not None:
            os.close(end_directory_fd)


def build_migration_plan(
    repo_root: str | os.PathLike[str],
    *,
    byte_cap: int = DEFAULT_COMPONENT_BYTES,
) -> MigrationPlan:
    """Capture the named source components and build a deterministic plan."""

    root = Path(repo_root)
    paths = REGISTRY_RELATIVE_PATHS
    components: list[CapturedComponent] = []
    for relative_path in paths:
        content = _capture_component(root, relative_path, byte_cap=byte_cap)
        _validate_registry_source(relative_path, content)
        components.append(
            CapturedComponent(
                path_label=f"registry:{relative_path}",
                relative_path=relative_path,
                size_bytes=len(content),
                sha256=sha256_bytes(content),
                content=content,
            )
        )
    entries = [
        {
            "path_label": component.path_label,
            "relative_path": component.relative_path,
            "size_bytes": component.size_bytes,
            "sha256": component.sha256,
        }
        for component in components
    ]
    manifest = {
        "schema": SCHEMA,
        "components": entries,
        "semantic_dedup": False,
    }
    root_sha256 = sha256_json(manifest)
    body: dict[str, Any] = {
        "schema": SCHEMA,
        "mode": "DRY_RUN",
        "status": "PLANNED",
        "root_sha256": root_sha256,
        "manifest": manifest,
        "registry_paths": entries,
        "component_count": len(entries),
        "total_size_bytes": sum(item["size_bytes"] for item in entries),
        "claims": {
            "theorem_meaning": False,
            "evidence_attestation": False,
            "source_entitlement": False,
            "theorem_closure": False,
            "universal_promotion": False,
        },
        "semantic_dedup": False,
        "apply": {"status": "BLOCKED_ON_PIQD_FEATURE"},
    }
    plan_sha256 = sha256_json(body)
    body["plan_sha256"] = plan_sha256
    plan = MigrationPlan(document=body, components=tuple(components))
    validate_migration_plan(plan, root, byte_cap=byte_cap)
    return plan


def _validate_registry_source(relative_path: str, content: bytes) -> None:
    if not relative_path.endswith(".json"):
        return
    parsed = strict_json_bytes(content, where=relative_path)
    if type(parsed) is not dict:
        raise MigrationError(
            f"{relative_path} must contain a JSON object", code="INVALID_SOURCE_JSON"
        )
    _json_tree(parsed, where=relative_path)
    try:
        canonical = (json.dumps(parsed, indent=2, allow_nan=False) + "\n").encode(
            "utf-8"
        )
    except (TypeError, ValueError, UnicodeEncodeError) as exc:
        raise MigrationError(
            f"{relative_path} cannot be canonically encoded", code="INVALID_SOURCE_JSON"
        ) from exc
    if content != canonical:
        raise MigrationError(
            f"{relative_path} is not in the committed canonical JSON byte format",
            code="INVALID_SOURCE_JSON",
        )


def _validate_plan_custody(plan: MigrationPlan) -> None:
    """Recompute every plan field from its captured bytes before any apply."""

    if type(plan) is not MigrationPlan or type(plan.document) is not dict:
        raise MigrationError("plan is not a native migration plan", code="PLAN_CUSTODY")
    if type(plan.components) is not tuple or len(plan.components) != len(
        REGISTRY_RELATIVE_PATHS
    ):
        raise MigrationError("plan has the wrong component count", code="PLAN_CUSTODY")
    _json_tree(plan.document, where="plan.document")
    expected_document_keys = {
        "schema",
        "mode",
        "status",
        "root_sha256",
        "manifest",
        "registry_paths",
        "component_count",
        "total_size_bytes",
        "claims",
        "semantic_dedup",
        "apply",
        "plan_sha256",
    }
    if set(plan.document) != expected_document_keys:
        raise MigrationError("plan has an unexpected schema", code="PLAN_CUSTODY")
    if (
        plan.document["schema"] != SCHEMA
        or plan.document["mode"] != "DRY_RUN"
        or plan.document["status"] != "PLANNED"
        or plan.document["semantic_dedup"] is not False
        or plan.document["apply"] != {"status": "BLOCKED_ON_PIQD_FEATURE"}
    ):
        raise MigrationError("plan is not a dry-run plan", code="PLAN_CUSTODY")
    _hex(plan.document["root_sha256"], where="plan.root_sha256")
    _hex(plan.document["plan_sha256"], where="plan.plan_sha256")
    _exact_int(
        plan.document["component_count"], where="plan.component_count", minimum=0
    )
    _exact_int(
        plan.document["total_size_bytes"], where="plan.total_size_bytes", minimum=0
    )
    claims = plan.document["claims"]
    if (
        type(claims) is not dict
        or set(claims)
        != {
            "theorem_meaning",
            "evidence_attestation",
            "source_entitlement",
            "theorem_closure",
            "universal_promotion",
        }
        or any(value is not False for value in claims.values())
    ):
        raise MigrationError("plan claims are not all false", code="PLAN_CUSTODY")
    manifest = plan.document["manifest"]
    if (
        type(manifest) is not dict
        or set(manifest)
        != {
            "schema",
            "components",
            "semantic_dedup",
        }
        or manifest["schema"] != SCHEMA
        or manifest["semantic_dedup"] is not False
    ):
        raise MigrationError("plan manifest is not canonical", code="PLAN_CUSTODY")
    entries: list[dict[str, object]] = []
    for index, (component, relative_path) in enumerate(
        zip(plan.components, REGISTRY_RELATIVE_PATHS, strict=True)
    ):
        if (
            type(component) is not CapturedComponent
            or type(component.content) is not bytes
        ):
            raise MigrationError(
                f"plan component {index} is not native captured custody",
                code="PLAN_CUSTODY",
            )
        if (
            type(component.path_label) is not str
            or type(component.relative_path) is not str
            or type(component.sha256) is not str
            or component.relative_path != relative_path
            or component.path_label != f"registry:{relative_path}"
            or type(component.size_bytes) is not int
            or component.size_bytes != len(component.content)
            or component.sha256 != sha256_bytes(component.content)
        ):
            raise MigrationError(
                f"plan component {index} does not match captured bytes",
                code="PLAN_CUSTODY",
            )
        entries.append(
            {
                "path_label": component.path_label,
                "relative_path": component.relative_path,
                "size_bytes": component.size_bytes,
                "sha256": component.sha256,
            }
        )
    if manifest["components"] != entries or plan.document["registry_paths"] != entries:
        raise MigrationError(
            "plan manifest does not match components", code="PLAN_CUSTODY"
        )
    if plan.document["root_sha256"] != sha256_json(manifest):
        raise MigrationError("plan root does not match manifest", code="PLAN_CUSTODY")
    if plan.document["component_count"] != len(entries) or plan.document[
        "total_size_bytes"
    ] != sum(entry["size_bytes"] for entry in entries):
        raise MigrationError("plan totals do not match components", code="PLAN_CUSTODY")
    body = {key: value for key, value in plan.document.items() if key != "plan_sha256"}
    if plan.document["plan_sha256"] != sha256_json(body):
        raise MigrationError("plan digest does not match document", code="PLAN_CUSTODY")


def validate_migration_plan(
    plan: MigrationPlan,
    repo_root: str | os.PathLike[str],
    *,
    byte_cap: int = DEFAULT_COMPONENT_BYTES,
) -> MigrationPlan:
    """Public custody check, including a fresh capture of canonical sources."""

    _validate_plan_custody(plan)
    root = Path(repo_root)
    for index, relative_path in enumerate(REGISTRY_RELATIVE_PATHS):
        current = _capture_component(root, relative_path, byte_cap=byte_cap)
        _validate_registry_source(relative_path, current)
        component = plan.components[index]
        if (
            current != component.content
            or sha256_bytes(current) != component.sha256
            or len(current) != component.size_bytes
        ):
            raise MigrationError(
                f"canonical source {relative_path} does not match plan custody",
                code="PLAN_CUSTODY",
            )
    _validate_plan_custody(plan)
    return plan


plan_migration = build_migration_plan
build_inventory = build_migration_plan


class JsonTransport(Protocol):
    def request(self, method: str, path: str, body: object | None = None) -> object: ...


def _transport_response(response: object) -> tuple[int, object]:
    if hasattr(response, "status") and hasattr(response, "body"):
        status = response.status
        body = response.body
    elif type(response) is tuple and len(response) == 2:
        status, body = response
    else:
        raise MigrationError("transport returned an invalid response")
    _exact_int(status, where="HTTP status", minimum=100)
    if status < 200 or status >= 300:
        raise MigrationError(f"PIQD returned HTTP {status}", code="PIQD_HTTP_ERROR")
    _bounded_json_tree(body, where="PIQD response")
    return status, body


@dataclass(frozen=True)
class BlobIngestQualification:
    """Result of the injected, non-migration blob-ingress qualification."""

    sha256: str
    size_bytes: int
    status_code: int
    already_present: bool
    get_verified: bool


def _blob_response_parts(response: object) -> tuple[int, object]:
    """Decode a bounded fake/HTTP response while retaining 422 for this seam."""

    if hasattr(response, "status") and hasattr(response, "body"):
        status = response.status
        body = response.body
    elif type(response) is tuple and len(response) == 2:
        status, body = response
    else:
        raise MigrationError("blob transport returned an invalid response")
    _exact_int(status, where="blob HTTP status", minimum=100)
    if status not in (200, 201, 422):
        raise MigrationError(
            f"PIQD blob ingress returned unexpected HTTP {status}",
            code="PIQD_BLOB_HTTP_ERROR",
        )
    if type(body) is bytes:
        if len(body) > MAX_PAYLOAD_BYTES:
            raise MigrationError("PIQD blob response exceeds bounded payload cap")
    else:
        _bounded_json_tree(body, where="PIQD blob response")
    return status, body


def qualify_blob_ingest(
    transport: JsonTransport,
    payload: bytes,
    *,
    verify_get: bool = False,
) -> BlobIngestQualification:
    """Qualify ``PUT /blobs/:hash`` using only injected transport state.

    This is deliberately not used by planning or APPLY.  It sends only the
    caller-provided fixture payload to the injected transport, requires the
    daemon's exact response contract, and optionally re-reads exact bytes from
    the corresponding (future/authorized) GET route.  It does not create an
    evidence record or establish a migration transaction.
    """

    if type(payload) is not bytes:
        raise MigrationError("blob payload must be exact bytes")
    if type(verify_get) is not bool:
        raise MigrationError("verify_get must be an exact boolean")
    if len(payload) > MAX_PAYLOAD_BYTES:
        raise MigrationError(
            "blob payload exceeds bounded custody cap", code="PAYLOAD_TOO_LARGE"
        )
    digest = sha256_bytes(payload)
    path = f"/blobs/{digest}"
    status, body = _blob_response_parts(transport.request("PUT", path, payload))
    if status == 422:
        if type(body) is not dict or set(body) != {"error"}:
            raise MigrationError(
                "PIQD blob mismatch response has an unexpected schema",
                code="PIQD_BLOB_SCHEMA",
            )
        _exact_string(body["error"], where="PIQD blob mismatch.error")
        raise MigrationError(
            "PIQD rejected blob bytes for the addressed digest",
            code="PIQD_BLOB_REJECTED",
        )
    if type(body) is not dict or set(body) != {"hash", "bytes", "already_present"}:
        raise MigrationError(
            "PIQD blob success response has an unexpected schema",
            code="PIQD_BLOB_SCHEMA",
        )
    returned_hash = _hex(body["hash"], where="PIQD blob response.hash")
    returned_size = _exact_int(
        body["bytes"], where="PIQD blob response.bytes", minimum=0
    )
    already_present = body["already_present"]
    if type(already_present) is not bool:
        raise MigrationError(
            "PIQD blob response.already_present must be an exact boolean"
        )
    expected_present = status == 200
    if (
        returned_hash != digest
        or returned_size != len(payload)
        or already_present != expected_present
    ):
        raise MigrationError(
            "PIQD blob response does not bind exact request bytes",
            code="PIQD_BLOB_SCHEMA",
        )
    get_verified = False
    if verify_get:
        get_status, get_body = _blob_response_parts(transport.request("GET", path))
        if get_status != 200 or type(get_body) is not bytes:
            raise MigrationError(
                "PIQD blob GET did not return exact raw bytes",
                code="PIQD_BLOB_READBACK",
            )
        if len(get_body) > MAX_PAYLOAD_BYTES or sha256_bytes(get_body) != digest:
            raise MigrationError(
                "PIQD blob GET bytes do not match the addressed digest",
                code="PIQD_BLOB_READBACK",
            )
        if get_body != payload:
            raise MigrationError(
                "PIQD blob GET bytes differ from the uploaded bytes",
                code="PIQD_BLOB_READBACK",
            )
        get_verified = True
    return BlobIngestQualification(
        sha256=digest,
        size_bytes=len(payload),
        status_code=status,
        already_present=already_present,
        get_verified=get_verified,
    )


def _record_root(records: Sequence[Mapping[str, Any]]) -> str:
    hasher = hashlib.sha256()

    def absorb(data: bytes) -> None:
        hasher.update(len(data).to_bytes(8, "big"))
        hasher.update(data)

    def optional(value: object) -> None:
        if value is None:
            absorb(b"0")
        else:
            absorb(b"1")
            absorb(str(value).encode("utf-8"))

    absorb(PIQD_EVIDENCE_ROOT_VERSION.encode("utf-8"))
    hasher.update(len(records).to_bytes(8, "big"))
    for record in records:
        for key in (
            "content_sha256",
            "external_id",
            "project",
            "lane",
            "kind",
            "payload_blob_hash",
            "manifest_json",
        ):
            absorb(record[key].encode("utf-8"))
        optional(record.get("job_id"))
        optional(record.get("session_id"))
        optional(record.get("solve_index"))
        optional(record.get("receipt_result_sha256"))
        absorb(str(record["created_at"]).encode("utf-8"))
    return hasher.hexdigest()


def _validate_record(record: object, *, where: str) -> dict[str, Any]:
    if type(record) is not dict:
        raise MigrationError(f"{where} must be an object")
    keys = set(record)
    if (
        not _REQUIRED_RECORD_KEYS <= keys
        or not keys <= _REQUIRED_RECORD_KEYS | _OPTIONAL_RECORD_KEYS
    ):
        raise MigrationError(f"{where} has missing or unknown fields")
    result = dict(record)
    for key in ("content_sha256", "payload_blob_hash"):
        _hex(result[key], where=f"{where}.{key}")
    for key in ("external_id", "project", "lane", "kind", "manifest_json"):
        _exact_string(result[key], where=f"{where}.{key}")
    _exact_int(result["created_at"], where=f"{where}.created_at")
    for key in ("job_id", "session_id", "receipt_result_sha256"):
        if key in result:
            _exact_string(result[key], where=f"{where}.{key}")
    if "solve_index" in result:
        _exact_int(result["solve_index"], where=f"{where}.solve_index", minimum=0)
        if "session_id" not in result or "receipt_result_sha256" not in result:
            raise MigrationError(f"{where}.solve_index lacks its receipt binding")
    if "receipt_result_sha256" in result:
        _hex(result["receipt_result_sha256"], where=f"{where}.receipt_result_sha256")
    manifest = strict_json_bytes(
        result["manifest_json"].encode("utf-8"), where=f"{where}.manifest_json"
    )
    if type(manifest) is not dict:
        raise MigrationError(f"{where}.manifest_json must be a JSON object")
    _json_tree(manifest, where=f"{where}.manifest_json")
    if canonical_json_bytes(manifest).decode("utf-8") != result["manifest_json"]:
        raise MigrationError(f"{where}.manifest_json is not canonical JSON")
    if (
        sha256_bytes(result["manifest_json"].encode("utf-8"))
        != result["content_sha256"]
    ):
        raise MigrationError(f"{where}.content_sha256 does not hash manifest_json")
    return result


def _validate_export(body: object) -> tuple[str, str, list[dict[str, Any]]]:
    if type(body) is not dict:
        raise MigrationError("PIQD export has an unexpected schema")
    _bounded_json_tree(body, where="PIQD export")
    if "snapshot_token" not in body:
        raise MigrationError(
            "PIQD export lacks a snapshot token; cross-page consistency is unprovable",
            code="PIQD_SNAPSHOT_REQUIRED",
        )
    if set(body) != _EXPORT_KEYS:
        raise MigrationError("PIQD export has an unexpected schema")
    if (
        _exact_string(body["root_version"], where="PIQD export.root_version")
        != PIQD_EVIDENCE_ROOT_VERSION
    ):
        raise MigrationError("PIQD export has the wrong root_version")
    snapshot_token = _exact_string(
        body["snapshot_token"], where="PIQD export.snapshot_token"
    )
    if not snapshot_token:
        raise MigrationError("PIQD export.snapshot_token must be non-empty")
    root = _hex(body["root"], where="PIQD export.root")
    count = _exact_int(body["count"], where="PIQD export.count", minimum=0)
    if count > MAX_EXPORT_RECORDS:
        raise MigrationError("PIQD export exceeds record bound")
    if type(body["records"]) is not list or count != len(body["records"]):
        raise MigrationError("PIQD export count does not match records")
    records = [
        _validate_record(item, where=f"PIQD export.records[{i}]")
        for i, item in enumerate(body["records"])
    ]
    hashes = [record["content_sha256"] for record in records]
    if hashes != sorted(hashes) or len(hashes) != len(set(hashes)):
        raise MigrationError(
            "PIQD export records are not strictly content-hash ordered"
        )
    if _record_root(records) != root:
        raise MigrationError("PIQD export root does not match its records")
    return root, snapshot_token, records


@dataclass(frozen=True)
class EvidenceExportAudit:
    snapshot_token: str
    root_sha256: str
    records: tuple[Mapping[str, Any], ...]
    payloads_verified: bool
    pages_verified: bool


def audit_evidence_export(
    body: object,
    *,
    blob_loader: Callable[[str], bytes] | None = None,
) -> EvidenceExportAudit:
    """Validate a current v2 export; blob bytes are checked when supplied."""

    root, snapshot_token, records = _validate_export(body)
    if blob_loader is not None:
        for index, record in enumerate(records):
            try:
                payload = blob_loader(record["payload_blob_hash"])
            except Exception as exc:  # callback is an external custody boundary
                raise MigrationError(
                    f"payload loader failed for record {index}: {exc}",
                    code="PAYLOAD_UNAVAILABLE",
                ) from exc
            if type(payload) is not bytes:
                raise MigrationError(
                    f"payload blob does not match record {index}",
                    code="PAYLOAD_HASH_MISMATCH",
                )
            if len(payload) > MAX_PAYLOAD_BYTES:
                raise MigrationError(
                    f"payload blob exceeds bounded custody cap for record {index}",
                    code="PAYLOAD_TOO_LARGE",
                )
            if sha256_bytes(payload) != record["payload_blob_hash"]:
                raise MigrationError(
                    f"payload blob does not match record {index}",
                    code="PAYLOAD_HASH_MISMATCH",
                )
    return EvidenceExportAudit(
        snapshot_token=snapshot_token,
        root_sha256=root,
        records=tuple(records),
        payloads_verified=blob_loader is not None,
        pages_verified=False,
    )


audit_piqd_export = audit_evidence_export


def audit_piqd_evidence(
    transport: JsonTransport,
    *,
    page_limit: int = 1000,
    blob_loader: Callable[[str], bytes] | None = None,
) -> EvidenceExportAudit:
    """Read-only audit of export plus the v2 keyset-paginated listing."""

    limit = _exact_int(page_limit, where="page_limit", minimum=1)
    if limit > MAX_PAGE_RECORDS:
        raise MigrationError("page_limit exceeds bounded page record cap")
    _, export_body = _transport_response(transport.request("GET", "/evidence/export"))
    export_audit = audit_evidence_export(export_body, blob_loader=blob_loader)
    pages: list[dict[str, Any]] = []
    after: str | None = None
    previous: str | None = None
    while True:
        query = f"?limit={limit}" if after is None else f"?limit={limit}&after={after}"
        _, page_body = _transport_response(
            transport.request("GET", f"/evidence{query}")
        )
        if type(page_body) is not dict or set(page_body) != _PAGE_KEYS:
            raise MigrationError("PIQD evidence page has an unexpected schema")
        _bounded_json_tree(page_body, where="PIQD page")
        page_snapshot = _exact_string(
            page_body["snapshot_token"], where="PIQD page.snapshot_token"
        )
        if page_snapshot != export_audit.snapshot_token:
            raise MigrationError(
                "PIQD page snapshot token drifted from export",
                code="PAGINATION_DRIFT",
            )
        if type(page_body["records"]) is not list:
            raise MigrationError("PIQD evidence page.records must be a list")
        if len(page_body["records"]) > MAX_PAGE_RECORDS:
            raise MigrationError("PIQD page exceeds record bound")
        if _exact_int(page_body["count"], where="PIQD page.count", minimum=0) != len(
            page_body["records"]
        ):
            raise MigrationError("PIQD page count does not match records")
        page = [
            _validate_record(item, where=f"PIQD page.records[{i}]")
            for i, item in enumerate(page_body["records"])
        ]
        hashes = [record["content_sha256"] for record in page]
        if hashes != sorted(hashes) or len(hashes) != len(set(hashes)):
            raise MigrationError("PIQD page is not strictly ordered")
        if previous is not None and hashes and hashes[0] <= previous:
            raise MigrationError("PIQD pagination regressed or repeated a cursor")
        pages.extend(page)
        next_after = page_body.get("next_after")
        if len(page) == limit:
            if (
                type(next_after) is not str
                or not _HEX64.fullmatch(next_after)
                or not page
                or next_after != page[-1]["content_sha256"]
            ):
                raise MigrationError("full PIQD page has an invalid next_after cursor")
            if next_after == after:
                raise MigrationError("PIQD cursor did not advance")
            previous, after = next_after, next_after
            continue
        if next_after is not None:
            raise MigrationError("short PIQD page must not carry next_after")
        break
    if (
        tuple(pages) != export_audit.records
        or _record_root(pages) != export_audit.root_sha256
    ):
        raise MigrationError(
            "PIQD paginated listing drifted from export root", code="PAGINATION_DRIFT"
        )
    return EvidenceExportAudit(
        snapshot_token=export_audit.snapshot_token,
        root_sha256=export_audit.root_sha256,
        records=export_audit.records,
        payloads_verified=export_audit.payloads_verified,
        pages_verified=True,
    )


def apply_migration(
    plan: MigrationPlan,
    transport: JsonTransport,
    capability: Mapping[str, object] | None = None,
) -> tuple[object, ...]:
    """Fail closed: the current PIQD API has no authorized APPLY operation.

    ``capability`` is intentionally ignored.  A caller-supplied claim cannot
    authenticate or prove a future server endpoint, and this function makes
    no transport call under any input.  A future implementation must first
    add a private, server-authenticated contract and invoke
    ``_validate_plan_custody`` before gaining an apply path.
    """

    del plan, transport, capability
    raise MigrationError(
        "PIQD APPLY is disabled: current API lacks an authenticated atomic payload-plus-record endpoint",
        code="BLOCKED_ON_PIQD_FEATURE",
    )


def main(argv: Sequence[str] | None = None) -> int:
    import argparse

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--byte-cap", type=int, default=DEFAULT_COMPONENT_BYTES)
    args = parser.parse_args(argv)
    try:
        plan = build_migration_plan(args.repo_root, byte_cap=args.byte_cap)
        print(canonical_json_bytes(plan.document).decode("utf-8"))
        return 0
    except MigrationError as exc:
        print(f"{exc.code}: {exc}")
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
