"""Typed, content-addressed producer references for positive semantic evidence.

This module authenticates producer identity and custody.  It does not decide
whether a producer discharges R1--R4, F1--F7, or any promotion claim.
"""

from __future__ import annotations

import os
import re
import stat
from collections.abc import Mapping
from pathlib import Path
from typing import Any, NoReturn

from census.cap_configuration import schema as json_schema

SCHEMA = "p97-cegar-producer-ref/v1"
MAX_DOCUMENT_BYTES = 1024 * 1024
MAX_INPUT_DIGESTS = 1024

LEAN_DECLARATION = "LEAN_DECLARATION"
EXTERNAL_CHECKER = "EXTERNAL_CHECKER"
PRODUCER_KINDS = frozenset({LEAN_DECLARATION, EXTERNAL_CHECKER})

LEAN_TOOLCHAIN = "LEAN"
EXTERNAL_TOOLCHAIN = "EXTERNAL"
TOOLCHAIN_KINDS = frozenset({LEAN_TOOLCHAIN, EXTERNAL_TOOLCHAIN})

CLEAN = "CLEAN"
DIRTY = "DIRTY"
DIRTY_STATES = frozenset({CLEAN, DIRTY})

_SHA256 = re.compile(r"[0-9a-f]{64}")
_REVISION = re.compile(r"(?:[0-9a-f]{40}|[0-9a-f]{64})")
_TOKEN = re.compile(r"[A-Z][A-Z0-9_]{0,127}")
_REGISTRY_ID = re.compile(r"[a-z0-9][a-z0-9_.-]{0,127}")
_INPUT_NAME = re.compile(r"[a-z0-9][a-z0-9_.-]{0,127}")

_TOP_LEVEL_KEYS = frozenset(
    {
        "schema",
        "producer",
        "normalized_statement_sha256",
        "hypothesis_sha256",
        "import_sha256",
        "transitive_source_sha256",
        "repository",
        "toolchain",
        "trust_classification",
        "input_digests",
        "validation_receipt_sha256",
        "consumer_reachability",
        "producer_ref_sha256",
    }
)


class ProducerRefError(ValueError):
    """Raised when producer-reference identity or artifact custody fails."""


def _fail(message: str) -> NoReturn:
    raise ProducerRefError(message)


def _exact_keys(value: Any, expected: frozenset[str], path: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{path} must be an object")
    if any(type(key) is not str for key in value):
        _fail(f"{path} has a non-string object key")
    return json_schema.exact_keys(value, expected, path)


def _canonical_text(value: Any, path: str, *, maximum_bytes: int = 512) -> str:
    result = json_schema.canonical_text(value, path)
    if len(result.encode("utf-8")) > maximum_bytes:
        _fail(f"{path} is too long")
    return result


def _copy_mapping(value: Any, path: str) -> dict[str, Any]:
    if not isinstance(value, Mapping):
        _fail(f"{path} must be a mapping")
    try:
        return dict(value)
    except (TypeError, ValueError) as exc:
        raise ProducerRefError(f"{path} cannot be copied") from exc


def _sha256(value: Any, path: str) -> str:
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail(f"{path} must be a lowercase SHA-256 digest")
    return value


def _producer(value: Any) -> str:
    producer = _exact_keys(
        value,
        (
            frozenset({"kind", "qualified_name"})
            if type(value) is dict and value.get("kind") == LEAN_DECLARATION
            else frozenset({"kind", "registry_id", "executable_sha256"})
        ),
        "producer_ref.producer",
    )
    kind = producer.get("kind")
    if kind == LEAN_DECLARATION:
        _canonical_text(
            producer.get("qualified_name"), "producer_ref.producer.qualified_name"
        )
    elif kind == EXTERNAL_CHECKER:
        registry_id = producer.get("registry_id")
        if type(registry_id) is not str or _REGISTRY_ID.fullmatch(registry_id) is None:
            _fail("producer_ref.producer.registry_id is not canonical")
        _sha256(
            producer.get("executable_sha256"),
            "producer_ref.producer.executable_sha256",
        )
    else:
        _fail(f"producer_ref.producer.kind must be one of {sorted(PRODUCER_KINDS)}")
    return kind


def _repository(value: Any) -> None:
    repository = _exact_keys(
        value,
        frozenset({"revision", "dirty_state", "dirty_state_sha256"}),
        "producer_ref.repository",
    )
    revision = repository.get("revision")
    if type(revision) is not str or _REVISION.fullmatch(revision) is None:
        _fail("producer_ref.repository.revision is not a canonical revision")
    dirty_state = repository.get("dirty_state")
    dirty_digest = repository.get("dirty_state_sha256")
    if dirty_state not in DIRTY_STATES:
        _fail(
            f"producer_ref.repository.dirty_state must be one of {sorted(DIRTY_STATES)}"
        )
    if dirty_state == CLEAN and dirty_digest is not None:
        _fail("a clean repository must have null dirty_state_sha256")
    if dirty_state == DIRTY:
        _sha256(dirty_digest, "producer_ref.repository.dirty_state_sha256")


def _toolchain(value: Any, producer_kind: str) -> None:
    toolchain = _exact_keys(
        value,
        frozenset({"kind", "identity_sha256"}),
        "producer_ref.toolchain",
    )
    kind = toolchain.get("kind")
    if kind not in TOOLCHAIN_KINDS:
        _fail(f"producer_ref.toolchain.kind must be one of {sorted(TOOLCHAIN_KINDS)}")
    expected = (
        LEAN_TOOLCHAIN if producer_kind == LEAN_DECLARATION else EXTERNAL_TOOLCHAIN
    )
    if kind != expected:
        _fail(f"producer_ref.toolchain.kind must be {expected} for {producer_kind}")
    _sha256(toolchain.get("identity_sha256"), "producer_ref.toolchain.identity_sha256")


def _input_digests(value: Any) -> None:
    inputs = json_schema.exact_list(value, "producer_ref.input_digests")
    if len(inputs) > MAX_INPUT_DIGESTS:
        _fail("producer_ref.input_digests has too many entries")
    names: list[str] = []
    for index, item in enumerate(inputs):
        entry = _exact_keys(
            item,
            frozenset({"name", "sha256"}),
            f"producer_ref.input_digests[{index}]",
        )
        name = entry.get("name")
        if type(name) is not str or _INPUT_NAME.fullmatch(name) is None:
            _fail(f"producer_ref.input_digests[{index}].name is not canonical")
        _sha256(entry.get("sha256"), f"producer_ref.input_digests[{index}].sha256")
        names.append(name)
    if names != sorted(names) or len(names) != len(set(names)):
        _fail("producer_ref.input_digests must have unique name-sorted entries")


def _consumer_reachability(value: Any) -> None:
    if value is None:
        return
    reachability = _exact_keys(
        value,
        frozenset({"consumer_producer_ref_sha256", "reachability_receipt_sha256"}),
        "producer_ref.consumer_reachability",
    )
    _sha256(
        reachability.get("consumer_producer_ref_sha256"),
        "producer_ref.consumer_reachability.consumer_producer_ref_sha256",
    )
    _sha256(
        reachability.get("reachability_receipt_sha256"),
        "producer_ref.consumer_reachability.reachability_receipt_sha256",
    )


def _validate_producer_ref(value: Any) -> None:
    reference = _exact_keys(value, _TOP_LEVEL_KEYS, "producer_ref")
    if reference.get("schema") != SCHEMA:
        _fail(f"producer_ref.schema must be {SCHEMA}")

    producer_kind = _producer(reference.get("producer"))
    for field in (
        "normalized_statement_sha256",
        "hypothesis_sha256",
        "import_sha256",
        "transitive_source_sha256",
        "validation_receipt_sha256",
    ):
        _sha256(reference.get(field), f"producer_ref.{field}")
    _repository(reference.get("repository"))
    _toolchain(reference.get("toolchain"), producer_kind)

    trust = reference.get("trust_classification")
    if type(trust) is not str or _TOKEN.fullmatch(trust) is None:
        _fail("producer_ref.trust_classification is not a canonical token")
    _input_digests(reference.get("input_digests"))
    _consumer_reachability(reference.get("consumer_reachability"))

    claimed_digest = _sha256(
        reference.get("producer_ref_sha256"), "producer_ref.producer_ref_sha256"
    )
    unsigned = dict(reference)
    unsigned.pop("producer_ref_sha256")
    expected_digest = json_schema.raw_sha256(json_schema.canonical_json_bytes(unsigned))
    if claimed_digest != expected_digest:
        _fail("producer_ref.producer_ref_sha256 does not authenticate its payload")


def validate_producer_ref(value: Any) -> None:
    """Validate one structurally authenticated custody reference."""

    try:
        _validate_producer_ref(value)
    except json_schema.CapConfigurationSchemaError as exc:
        raise ProducerRefError(str(exc)) from exc


def validate_publication_producer_ref(value: Any) -> None:
    """Require checked consumer reachability for a publication-bound producer."""

    validate_producer_ref(value)
    if value["consumer_reachability"] is None:
        _fail("publication-bound producer reference lacks consumer reachability")


def build_producer_ref(
    *,
    producer: Mapping[str, Any],
    normalized_statement_sha256: str,
    hypothesis_sha256: str,
    import_sha256: str,
    transitive_source_sha256: str,
    repository: Mapping[str, Any],
    toolchain: Mapping[str, Any],
    trust_classification: str,
    input_digests: Mapping[str, str],
    validation_receipt_sha256: str,
    consumer_reachability: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Build a self-hashed producer reference from already checked evidence."""

    input_map = _copy_mapping(input_digests, "input_digests")
    try:
        inputs = [
            {"name": name, "sha256": digest}
            for name, digest in sorted(input_map.items())
        ]
    except TypeError as exc:
        raise ProducerRefError("input_digests names are not sortable") from exc
    unsigned: dict[str, Any] = {
        "schema": SCHEMA,
        "producer": _copy_mapping(producer, "producer"),
        "normalized_statement_sha256": normalized_statement_sha256,
        "hypothesis_sha256": hypothesis_sha256,
        "import_sha256": import_sha256,
        "transitive_source_sha256": transitive_source_sha256,
        "repository": _copy_mapping(repository, "repository"),
        "toolchain": _copy_mapping(toolchain, "toolchain"),
        "trust_classification": trust_classification,
        "input_digests": inputs,
        "validation_receipt_sha256": validation_receipt_sha256,
        "consumer_reachability": (
            None
            if consumer_reachability is None
            else _copy_mapping(consumer_reachability, "consumer_reachability")
        ),
    }
    result = {
        **unsigned,
        "producer_ref_sha256": json_schema.raw_sha256(
            json_schema.canonical_json_bytes(unsigned)
        ),
    }
    validate_producer_ref(result)
    return result


def producer_ref_pointer(value: Any) -> dict[str, str]:
    """Return the exact pointer shape embedded by semantic-contract receipts."""

    validate_producer_ref(value)
    return {"producer_ref_sha256": value["producer_ref_sha256"]}


def canonical_producer_ref_bytes(value: Any) -> bytes:
    """Return the frozen stored representation, including one final newline."""

    validate_producer_ref(value)
    try:
        payload = json_schema.stored_json_bytes(value)
    except json_schema.CapConfigurationSchemaError as exc:
        raise ProducerRefError(str(exc)) from exc
    if len(payload) > MAX_DOCUMENT_BYTES:
        _fail("producer-reference document exceeds the size limit")
    return payload


def parse_producer_ref_bytes(payload: bytes) -> dict[str, Any]:
    """Parse canonical bytes, rejecting duplicate keys and alternate spellings."""

    if type(payload) is not bytes:
        _fail("producer-reference payload must be exact bytes")
    if len(payload) > MAX_DOCUMENT_BYTES:
        _fail("producer-reference document exceeds the size limit")
    try:
        value = json_schema.parse_stored_json_bytes(payload)
    except json_schema.CapConfigurationSchemaError as exc:
        raise ProducerRefError(str(exc)) from exc
    validate_producer_ref(value)
    return value


def _normalized_path(value: os.PathLike[str] | str) -> Path:
    try:
        raw = os.fspath(value)
    except TypeError as exc:
        raise ProducerRefError("artifact path is not path-like") from exc
    if type(raw) is not str or not raw or "\x00" in raw:
        _fail("artifact path is not canonical text")
    canonical = os.path.abspath(raw)
    if raw != canonical or raw.startswith("//"):
        _fail("artifact path must be absolute and lexically canonical")
    absolute = Path(canonical)
    if not absolute.name:
        _fail("artifact path must name a file")
    return absolute


def _require_posix_custody_primitives() -> None:
    required_flags = ("O_DIRECTORY", "O_NOFOLLOW")
    if os.name != "posix" or any(not hasattr(os, name) for name in required_flags):
        _fail("secure producer-reference custody requires POSIX no-follow support")
    supports_dir_fd = getattr(os, "supports_dir_fd", frozenset())
    supports_follow_symlinks = getattr(os, "supports_follow_symlinks", frozenset())
    if (
        os.open not in supports_dir_fd
        or os.stat not in supports_dir_fd
        or os.unlink not in supports_dir_fd
        or os.stat not in supports_follow_symlinks
    ):
        _fail("secure producer-reference custody requires POSIX dir-fd support")


def _directory_flags() -> int:
    return os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0) | os.O_NOFOLLOW


def _open_parent_directory(
    value: os.PathLike[str] | str,
) -> tuple[int, str, Path]:
    _require_posix_custody_primitives()
    absolute = _normalized_path(value)
    parts = absolute.parts
    descriptor: int | None = None
    try:
        descriptor = os.open(absolute.anchor, _directory_flags())
        for component in parts[1:-1]:
            next_descriptor = os.open(
                component,
                _directory_flags(),
                dir_fd=descriptor,
            )
            info = os.fstat(next_descriptor)
            if not stat.S_ISDIR(info.st_mode):
                os.close(next_descriptor)
                _fail(f"artifact path component is not a directory: {component}")
            os.close(descriptor)
            descriptor = next_descriptor
        return descriptor, parts[-1], absolute
    except ProducerRefError:
        if descriptor is not None:
            os.close(descriptor)
        raise
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise ProducerRefError(
            f"artifact path has an unsafe ancestor: {absolute}"
        ) from exc


def _identity(info: os.stat_result) -> tuple[int, int]:
    return info.st_dev, info.st_ino


def _metadata(info: os.stat_result) -> tuple[int, int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _verify_lexical_entry(
    path: Path,
    original_parent: os.stat_result,
    expected_file: os.stat_result,
) -> None:
    parent_descriptor, name, _ = _open_parent_directory(path)
    try:
        current_parent = os.fstat(parent_descriptor)
        if _identity(current_parent) != _identity(original_parent):
            _fail("artifact parent path changed during access")
        current_file = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if _metadata(current_file) != _metadata(expected_file):
            _fail("artifact path changed during access")
    except ProducerRefError:
        raise
    except OSError as exc:
        raise ProducerRefError("artifact path changed during access") from exc
    finally:
        os.close(parent_descriptor)


def _read_regular_file(path: os.PathLike[str] | str) -> bytes:
    parent_descriptor, name, absolute = _open_parent_directory(path)
    descriptor: int | None = None
    try:
        parent_info = os.fstat(parent_descriptor)
        flags = (
            os.O_RDONLY
            | getattr(os, "O_CLOEXEC", 0)
            | os.O_NOFOLLOW
            | getattr(os, "O_NONBLOCK", 0)
        )
        descriptor = os.open(name, flags, dir_fd=parent_descriptor)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            _fail("producer-reference artifact must be a single-link regular file")
        if before.st_size > MAX_DOCUMENT_BYTES:
            _fail("producer-reference document exceeds the size limit")

        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(64 * 1024, MAX_DOCUMENT_BYTES + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > MAX_DOCUMENT_BYTES:
                _fail("producer-reference document exceeds the size limit")

        after = os.fstat(descriptor)
        if _metadata(after) != _metadata(before) or total != after.st_size:
            _fail("producer-reference artifact mutated during read")
        entry = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if _metadata(entry) != _metadata(after):
            _fail("producer-reference path changed during read")
        _verify_lexical_entry(absolute, parent_info, after)
        return b"".join(chunks)
    except ProducerRefError:
        raise
    except OSError as exc:
        raise ProducerRefError(
            f"cannot read producer-reference artifact: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(parent_descriptor)


def load_producer_ref(path: os.PathLike[str] | str) -> dict[str, Any]:
    """Read and validate one stable, canonical producer-reference artifact."""

    return parse_producer_ref_bytes(_read_regular_file(path))


def _remove_failed_create(
    parent_descriptor: int,
    name: str,
    created_identity: tuple[int, int],
) -> None:
    try:
        current = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if _identity(current) == created_identity:
            os.unlink(name, dir_fd=parent_descriptor)
            os.fsync(parent_descriptor)
    except OSError:
        pass


def publish_producer_ref(
    path: os.PathLike[str] | str,
    value: Any,
) -> Path:
    """Publish one immutable producer reference with exclusive creation."""

    payload = canonical_producer_ref_bytes(value)
    parent_descriptor, name, absolute = _open_parent_directory(path)
    descriptor: int | None = None
    created_identity: tuple[int, int] | None = None
    succeeded = False
    try:
        parent_info = os.fstat(parent_descriptor)
        flags = (
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | os.O_NOFOLLOW
        )
        descriptor = os.open(name, flags, 0o600, dir_fd=parent_descriptor)
        created = os.fstat(descriptor)
        created_identity = _identity(created)
        if not stat.S_ISREG(created.st_mode) or created.st_nlink != 1:
            _fail("new producer-reference artifact is not a single-link regular file")

        remaining = memoryview(payload)
        while remaining:
            written = os.write(descriptor, remaining)
            if written <= 0:
                _fail("short write while publishing producer-reference artifact")
            remaining = remaining[written:]
        os.fsync(descriptor)

        published = os.fstat(descriptor)
        if (
            not stat.S_ISREG(published.st_mode)
            or published.st_nlink != 1
            or published.st_size != len(payload)
        ):
            _fail("published producer-reference artifact failed custody checks")
        entry = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        if _metadata(entry) != _metadata(published):
            _fail("producer-reference path changed during publication")
        os.fsync(parent_descriptor)
        _verify_lexical_entry(absolute, parent_info, published)
        succeeded = True
        return absolute
    except FileExistsError as exc:
        raise ProducerRefError(
            f"refusing to overwrite producer-reference artifact: {absolute}"
        ) from exc
    except ProducerRefError:
        raise
    except OSError as exc:
        raise ProducerRefError(
            f"cannot publish producer-reference artifact: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if not succeeded and created_identity is not None:
            _remove_failed_create(parent_descriptor, name, created_identity)
        os.close(parent_descriptor)
