"""Fail-closed source custody and finite semantic replay for exact17.

Structural decoding and source-semantic acceptance are separate boundaries.
The semantic boundary requires exact byte custody, the pinned source-runner
contract, a production allocation, satisfaction of every CNF clause, and a
local replay of every finite source predicate.  Neither boundary proves
aggregate coverage, a universal statement, theorem closure, or Lean checking.
"""

from __future__ import annotations

import base64
import functools
import hashlib
import itertools
import json
import os
import re
import stat
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

SCHEMA = "p97-piqd-exact17-semantic-custody-v1"
SOURCE_BUNDLE_SCHEMA = "p97-piqd-exact17-source-bundle-v1"
VARIABLE_MAP_SCHEMA = "p97-piqd-exact17-variable-map-v1"
DECODED_SCHEMA = "p97-piqd-exact17-decoded-object-v1"
SEMANTIC_PACKAGE_SCHEMA = "p97-piqd-exact17-semantic-package-v1"
SEMANTIC_EVIDENCE_SCHEMA = "p97-piqd-exact17-semantic-evidence-v1"
SEMANTIC_RECEIPT_SCHEMA = "p97-piqd-exact17-semantic-receipt-v1"
PROVENANCE_SIDECAR_SCHEMA = "p97-piqd-exact17-producer-provenance-v1"
ACCEPTED_MANIFEST_SCHEMA = (
    "p97-rigid221-exact17-source-faithful-boolean-cnf-"
    "transitive-two-circle-candidate-v4"
)
PINNED_SOURCE_RUNNER_SHA256 = (
    "9bb7ae8193b6c427273802b850bf8628a6a6a6762a6798afb30b9c138eee55a2"
)
PINNED_V19_MANIFEST_SHA256 = (
    "19fe9d3ee8e24e9bdcefc2a0dfb62c81e484d784d3ff37fe5b291d8d7081d63a"
)
PINNED_V19_CNF_SHA256 = (
    "ebca3272a22c945a235a3f1141c1646f1a9780f39eefec6164f57e48bbe84c7c"
)
PINNED_V19_SCOPE = (
    "one normalized cap-nine case; nogood soundness and Lean lift remain separate"
)
PINNED_V19_CLAUSE_BLOCKS_SHA256 = (
    "f3be2c68037d2ad7754e424f6acfae329043a410732f84f774201b402f5762f5"
)
PINNED_V19_LEARNED_RECORD_KINDS_SHA256 = (
    "8ec7a136ae1b9ba10a469efc880bb172d1d6a7c5f6f85bb1b6292c250b559e32"
)
PINNED_V19_CUT_ADMISSION_SHA256 = (
    "7f970f29db05397a2fcfb3151c31f321c671546b6c90b68e46a14a689ba3d81b"
)

EXACT_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_KEYS = frozenset(
    {
        "source_runner",
        "direct_exporter",
        "base_cnf_exporter",
        "fullcover",
        "order_base",
        "producer_bank",
        "shared_late_pair",
        "direct_row_consumers",
        "static_schema_lean_consumers",
    }
)
EXPECTED_TRANSITIVE_METADATA = {
    "comparison_xor_variables": 73440,
    "distance_label_bits": 8,
    "distance_label_variables": 1088,
    "edge_pair_comparisons": 9180,
    "five_point_forbidden_cores": 61880,
    "forbidden_cores": 9520,
}
REQUIRED_CLAUSE_BLOCKS = frozenset(
    {
        "exact_four",
        "source_coverage",
        "two_center_common_hit",
        "old_row_cap_units",
        "old_row_outside_partition",
        "fifth_center_exactly_one",
        "fifth_row_source_and_one_hit",
        "transitive_convex_five_point",
        "transitive_label_selected_equality",
        "transitive_label_xor_definition",
        "transitive_two_circle_bisector",
    }
)

LIVE_MANIFEST_LABEL = (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "source-faithful-cap9-direct-cnf-v12t-exact-all-cores-44/"
    "o0-p0-1.manifest.json"
)
LIVE_MANIFEST_SHA256 = (
    "940bd8aa727f144973840c5fa69ea968a5942a8be4ef695acb25eb7224c86572"
)
LIVE_CNF_SHA256 = "62de9fb9e20d13ff256f59aa20d5044f55bc17f9adbce8204564d486adfc75fb"

LIVE_SOURCE_LABELS = {
    "source_runner": (
        "scratch/rigid221-blockerv-exact17-20260806/exact17_source_faithful_cegar.py"
    ),
    "direct_exporter": (
        "scratch/rigid221-blockerv-exact17-20260806/"
        "export_source_faithful_boolean_cnf.py"
    ),
    "base_cnf_exporter": (
        "scratch/rigid221-blockerv-exact17-20260806/export_exact17_boolean_cnf.py"
    ),
    "fullcover": (
        "scratch/rigid221-blockerv-exact17-20260806/exact17_fullcover_cegar.py"
    ),
    "order_base": ("scratch/rigid221-blockerv-exact17-20260806/exact17_kalmanson.py"),
    "producer_bank": "census/atail_force/producer_bank.py",
    "shared_late_pair": (
        "scratch/rigid221-blockerv-exact17-20260806/"
        "exact17_two_rows_shared_late_pair.py"
    ),
    "direct_row_consumers": (
        "scratch/rigid221-blockerv-exact17-20260806/"
        "exact17_committed_direct_row_consumers.py"
    ),
}

MAX_SOURCE_BYTES = 16 * 1024 * 1024
MAX_INPUT_BYTES = 64 * 1024 * 1024
MAX_MANIFEST_BYTES = 8 * 1024 * 1024
MAX_CNF_BYTES = 256 * 1024 * 1024
MAX_TOTAL_SOURCE_BYTES = 64 * 1024 * 1024
MAX_TOTAL_INPUT_BYTES = 64 * 1024 * 1024
MAX_SOURCE_BUNDLE_BYTES = 192 * 1024 * 1024
_SHA256_RE = re.compile(r"[0-9a-f]{64}\Z")
_INT_RE = re.compile(r"-?[0-9]+\Z")


class SemanticCustodyError(ValueError):
    """Raised when fail-closed custody or semantic validation rejects input."""


class ProvenanceMismatchError(SemanticCustodyError):
    """Raised when a structured provenance audit is required to pass."""

    def __init__(self, audit: CustodyAudit) -> None:
        self.audit = audit
        names = ", ".join(item.name for item in audit.mismatches)
        super().__init__(f"exact17 provenance mismatch: {names}")


@dataclass(frozen=True)
class _LaneArtifactContract:
    """Private exact-artifact trust root; production callers cannot select it."""

    manifest_sha256: str
    cnf_sha256: str
    variables: int
    clauses: int
    scope: str
    clause_blocks_sha256: str
    learned_record_kinds_sha256: str
    cut_admission_sha256: str


_PRODUCTION_ARTIFACT_CONTRACT = _LaneArtifactContract(
    manifest_sha256=PINNED_V19_MANIFEST_SHA256,
    cnf_sha256=PINNED_V19_CNF_SHA256,
    variables=74813,
    clauses=2875629,
    scope=PINNED_V19_SCOPE,
    clause_blocks_sha256=PINNED_V19_CLAUSE_BLOCKS_SHA256,
    learned_record_kinds_sha256=PINNED_V19_LEARNED_RECORD_KINDS_SHA256,
    cut_admission_sha256=PINNED_V19_CUT_ADMISSION_SHA256,
)


@dataclass(frozen=True)
class FileSnapshot:
    """An immutable exact-byte snapshot with a canonical repository label."""

    label: str
    sha256: str
    byte_count: int
    content: bytes

    def payload(self) -> dict[str, Any]:
        return {
            "label": self.label,
            "sha256": self.sha256,
            "byte_count": self.byte_count,
            "base64": base64.b64encode(self.content).decode("ascii"),
        }


@dataclass(frozen=True)
class ProvenanceMismatch:
    category: str
    name: str
    label: str
    expected_sha256: str
    actual_sha256: str

    def payload(self) -> dict[str, str]:
        return {
            "category": self.category,
            "name": self.name,
            "label": self.label,
            "expected_sha256": self.expected_sha256,
            "actual_sha256": self.actual_sha256,
        }


@dataclass(frozen=True)
class SourceBundle:
    payload: Mapping[str, Any]
    canonical_bytes: bytes
    sha256: str


@dataclass(frozen=True)
class CustodyAudit:
    accepted: bool
    status: str
    mismatches: tuple[ProvenanceMismatch, ...]
    missing_bindings: tuple[str, ...]
    source_count: int
    input_count: int
    candidate_bundle: SourceBundle

    def payload(self) -> dict[str, Any]:
        return {
            "schema": SCHEMA,
            "accepted": self.accepted,
            "status": self.status,
            "mismatches": [item.payload() for item in self.mismatches],
            "missing_bindings": list(self.missing_bindings),
            "source_count": self.source_count,
            "input_count": self.input_count,
            "candidate_bundle_sha256": self.candidate_bundle.sha256,
            "claims": false_claims(),
        }


@dataclass(frozen=True)
class AllocationContract:
    points: tuple[int, ...]
    fifth_candidates: tuple[int, ...]
    distance_label_bits: int

    def __post_init__(self) -> None:
        if not self.points or any(type(value) is not int for value in self.points):
            raise SemanticCustodyError("allocation points must be nonempty integers")
        if len(set(self.points)) != len(self.points):
            raise SemanticCustodyError("allocation points must be unique")
        if any(
            type(value) is not int or value not in self.points
            for value in self.fifth_candidates
        ):
            raise SemanticCustodyError("fifth candidates must be points")
        if len(set(self.fifth_candidates)) != len(self.fifth_candidates):
            raise SemanticCustodyError("fifth candidates must be unique")
        if type(self.distance_label_bits) is not int or self.distance_label_bits < 1:
            raise SemanticCustodyError("distance_label_bits must be positive")


LIVE_ALLOCATION = AllocationContract(
    points=tuple(range(17)),
    fifth_candidates=tuple(point for point in range(17) if point not in {8, 9, 10, 11}),
    distance_label_bits=8,
)


def canonical_json(value: Any) -> bytes:
    """Return the one accepted JSON encoding, rejecting NaN and infinity."""

    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise SemanticCustodyError("value is not canonical finite JSON") from exc


def _reject_constant(value: str) -> Any:
    raise SemanticCustodyError(f"non-finite JSON number rejected: {value}")


def _unique_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise SemanticCustodyError(f"duplicate JSON key rejected: {key}")
        result[key] = value
    return result


def load_strict_json(data: bytes, *, require_canonical: bool = True) -> dict[str, Any]:
    """Parse a canonical JSON object with duplicates and nonfinite values barred."""

    try:
        text = data.decode("utf-8", errors="strict")
        value = json.loads(
            text,
            object_pairs_hook=_unique_object,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise SemanticCustodyError("invalid UTF-8 JSON") from exc
    if not isinstance(value, dict):
        raise SemanticCustodyError("JSON root must be an object")
    if require_canonical and canonical_json(value) != data:
        raise SemanticCustodyError("JSON bytes are not in canonical form")
    return value


def _validate_sha256(value: Any, field: str) -> str:
    if not isinstance(value, str) or _SHA256_RE.fullmatch(value) is None:
        raise SemanticCustodyError(f"{field} must be a lowercase SHA-256 digest")
    return value


def _canonical_label(label: Any) -> str:
    if not isinstance(label, str) or not label or "\\" in label:
        raise SemanticCustodyError("file label must be a nonempty POSIX path")
    pure = PurePosixPath(label)
    if pure.is_absolute() or str(pure) != label:
        raise SemanticCustodyError(f"noncanonical file label rejected: {label!r}")
    if any(part in {"", ".", ".."} for part in pure.parts):
        raise SemanticCustodyError(f"unsafe file label rejected: {label!r}")
    return label


def _identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _read_regular_file(root: Path, label: str, max_bytes: int) -> bytes:
    """Read one repository-relative regular file without following symlinks."""

    label = _canonical_label(label)
    if type(max_bytes) is not int or max_bytes < 0:
        raise SemanticCustodyError("max_bytes must be a nonnegative integer")
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    if nofollow is None or directory is None:
        raise SemanticCustodyError("platform lacks required no-follow open flags")
    directory_fd = os.open(root, os.O_RDONLY | directory | nofollow)
    opened_directories: list[int] = [directory_fd]
    file_fd: int | None = None
    try:
        parts = PurePosixPath(label).parts
        for part in parts[:-1]:
            directory_fd = os.open(
                part,
                os.O_RDONLY | directory | nofollow,
                dir_fd=directory_fd,
            )
            opened_directories.append(directory_fd)
        file_fd = os.open(
            parts[-1],
            os.O_RDONLY | nofollow,
            dir_fd=directory_fd,
        )
        before = os.fstat(file_fd)
        if not stat.S_ISREG(before.st_mode):
            raise SemanticCustodyError(f"not a regular file: {label}")
        if before.st_size > max_bytes:
            raise SemanticCustodyError(f"file exceeds byte bound: {label}")
        chunks: list[bytes] = []
        remaining = before.st_size + 1
        while remaining > 0:
            chunk = os.read(file_fd, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        content = b"".join(chunks)
        after = os.fstat(file_fd)
        if _identity(before) != _identity(after) or len(content) != before.st_size:
            raise SemanticCustodyError(
                f"file changed during authenticated read: {label}"
            )
        if len(content) > max_bytes:
            raise SemanticCustodyError(f"file exceeds byte bound: {label}")
        return content
    except OSError as exc:
        raise SemanticCustodyError(f"no-follow file read failed: {label}") from exc
    finally:
        if file_fd is not None:
            os.close(file_fd)
        for fd in reversed(opened_directories):
            os.close(fd)


def snapshot_file(
    root: Path,
    label: str,
    *,
    max_bytes: int,
) -> FileSnapshot:
    content = _read_regular_file(root, label, max_bytes)
    return FileSnapshot(
        label=_canonical_label(label),
        sha256=hashlib.sha256(content).hexdigest(),
        byte_count=len(content),
        content=content,
    )


def _require_exact_keys(
    value: Mapping[str, Any], expected: set[str], field: str
) -> None:
    if set(value) != expected:
        raise SemanticCustodyError(
            f"{field} keys differ: expected {sorted(expected)}, got {sorted(value)}"
        )


def _manifest_inputs(manifest: Mapping[str, Any]) -> list[tuple[str, int, str, str]]:
    result: list[tuple[str, int, str, str]] = []
    seen: set[str] = set()
    for kind, key in (("artifact", "artifacts"), ("analysis", "analyses")):
        records = manifest.get(key)
        if not isinstance(records, list):
            raise SemanticCustodyError(f"manifest {key} must be a list")
        for index, record in enumerate(records):
            if not isinstance(record, dict):
                raise SemanticCustodyError(f"manifest {key}[{index}] must be an object")
            _require_exact_keys(record, {"path", "sha256"}, f"manifest {key}[{index}]")
            label = _canonical_label(record["path"])
            digest = _validate_sha256(record["sha256"], f"manifest {key}[{index}]")
            if label in seen:
                raise SemanticCustodyError(f"duplicate manifest input label: {label}")
            seen.add(label)
            result.append((kind, index, label, digest))
    return result


def _validate_manifest_case(manifest: Mapping[str, Any]) -> None:
    if type(manifest.get("order_index")) is not int:
        raise SemanticCustodyError("manifest order_index must be an integer")
    positions = manifest.get("anonymous_positions")
    if not (
        isinstance(positions, list)
        and positions
        and all(type(item) is int for item in positions)
    ):
        raise SemanticCustodyError("manifest anonymous_positions must be integer list")
    order = manifest.get("order")
    if not (
        isinstance(order, list)
        and order
        and all(type(item) is int for item in order)
        and len(set(order)) == len(order)
    ):
        raise SemanticCustodyError("manifest order must be a unique integer list")


def _require_exact17_case(manifest: Mapping[str, Any]) -> None:
    _validate_manifest_case(manifest)
    if manifest["order_index"] != 0:
        raise SemanticCustodyError("exact17 v1 requires order_index 0")
    if manifest["anonymous_positions"] != [0, 1]:
        raise SemanticCustodyError("exact17 v1 requires anonymous_positions [0, 1]")
    if manifest["order"] != list(EXACT_ORDER):
        raise SemanticCustodyError("exact17 v1 requires the pinned 17-point order")


def _require_pinned_subobject(
    value: Any,
    *,
    field: str,
    expected_sha256: str,
) -> None:
    if type(value) is not dict:
        raise SemanticCustodyError(f"manifest {field} must be an object")
    actual_sha256 = hashlib.sha256(canonical_json(value)).hexdigest()
    if actual_sha256 != expected_sha256:
        raise SemanticCustodyError(
            f"manifest {field} differs from the reviewed v19 artifact"
        )


def _validate_lane_manifest(
    manifest: Mapping[str, Any],
    *,
    manifest_sha256: str,
) -> None:
    """Validate the exact reviewed source-entitled fresh-v19 artifact."""

    contract = _PRODUCTION_ARTIFACT_CONTRACT

    _require_exact_keys(
        manifest,
        {
            "schema",
            "scope",
            "order_index",
            "anonymous_positions",
            "order",
            "variables",
            "clauses",
            "cnf",
            "cnf_sha256",
            "clause_blocks",
            "learned_record_kinds",
            "cut_admission",
            "learned_replay",
            "source_hashes",
            "artifacts",
            "analyses",
            "transitive_two_circle",
            "transitive_two_circle_metadata",
        },
        "exact17 manifest",
    )
    _require_exact17_case(manifest)
    if manifest["schema"] != ACCEPTED_MANIFEST_SCHEMA:
        raise SemanticCustodyError("exact17 manifest schema is not candidate-v4")
    if type(manifest["scope"]) is not str or manifest["scope"] != contract.scope:
        raise SemanticCustodyError("exact17 manifest scope differs from reviewed v19")
    if manifest["transitive_two_circle"] is not True:
        raise SemanticCustodyError("transitive_two_circle must be true")
    if manifest["learned_replay"] != "verified":
        raise SemanticCustodyError("learned_replay must be verified")
    if (
        type(manifest["variables"]) is not int
        or manifest["variables"] != contract.variables
    ):
        raise SemanticCustodyError(
            f"exact17 manifest variables must equal {contract.variables}"
        )
    if type(manifest["clauses"]) is not int or manifest["clauses"] != contract.clauses:
        raise SemanticCustodyError(
            f"exact17 manifest clauses must equal {contract.clauses}"
        )
    _canonical_label(manifest["cnf"])
    if (
        _validate_sha256(manifest["cnf_sha256"], "manifest cnf_sha256")
        != contract.cnf_sha256
    ):
        raise SemanticCustodyError("manifest CNF hash differs from reviewed v19")
    source_hashes = manifest["source_hashes"]
    if (
        not isinstance(source_hashes, dict)
        or set(source_hashes) != EXPECTED_SOURCE_KEYS
    ):
        raise SemanticCustodyError("exact17 manifest source key set mismatch")
    for name, digest in source_hashes.items():
        _validate_sha256(digest, f"manifest source_hashes.{name}")
    if source_hashes["source_runner"] != PINNED_SOURCE_RUNNER_SHA256:
        raise SemanticCustodyError("source_runner hash requires an adapter update")
    if manifest["transitive_two_circle_metadata"] != EXPECTED_TRANSITIVE_METADATA:
        raise SemanticCustodyError("transitive metadata differs from exact17 v1")
    _require_pinned_subobject(
        manifest["clause_blocks"],
        field="clause_blocks",
        expected_sha256=contract.clause_blocks_sha256,
    )
    _require_pinned_subobject(
        manifest["learned_record_kinds"],
        field="learned_record_kinds",
        expected_sha256=contract.learned_record_kinds_sha256,
    )
    _require_pinned_subobject(
        manifest["cut_admission"],
        field="cut_admission",
        expected_sha256=contract.cut_admission_sha256,
    )
    if not isinstance(manifest["artifacts"], list) or len(manifest["artifacts"]) != 1:
        raise SemanticCustodyError("exact17 manifest requires exactly one artifact")
    if not isinstance(manifest["analyses"], list) or len(manifest["analyses"]) != 44:
        raise SemanticCustodyError("exact17 manifest requires exactly 44 analyses")
    _manifest_inputs(manifest)
    if _validate_sha256(manifest_sha256, "manifest raw sha256") != (
        contract.manifest_sha256
    ):
        raise SemanticCustodyError(
            "manifest raw bytes differ from the reviewed v19 artifact; "
            "a successor requires an adapter-contract update"
        )


def _validate_lane_labels(
    manifest: Mapping[str, Any],
    manifest_label: str,
    source_labels: Mapping[str, str],
    sidecar_label: str,
) -> None:
    source_paths = [_canonical_label(label) for label in source_labels.values()]
    if len(set(source_paths)) != len(source_paths):
        raise SemanticCustodyError("producer source paths must be unique")
    input_paths = [record[2] for record in _manifest_inputs(manifest)]
    protected = [
        _canonical_label(manifest_label),
        _canonical_label(sidecar_label),
        _canonical_label(manifest["cnf"]),
        *source_paths,
        *input_paths,
    ]
    if len(set(protected)) != len(protected):
        raise SemanticCustodyError(
            "manifest, sidecar, CNF, source, and input labels must be disjoint"
        )


def _sidecar_bindings(
    manifest: Mapping[str, Any],
    manifest_snapshot: FileSnapshot,
    sidecar_snapshot: FileSnapshot | None,
) -> tuple[dict[str, Any] | None, tuple[str, ...]]:
    if sidecar_snapshot is None:
        return None, ("canonical producer provenance sidecar",)
    sidecar = load_strict_json(sidecar_snapshot.content)
    required = {
        "schema",
        "manifest",
        "command",
        "runtime",
        "case",
        "order",
        "source_hashes",
    }
    _require_exact_keys(sidecar, required, "producer provenance sidecar")
    errors: list[str] = []
    if sidecar["schema"] != PROVENANCE_SIDECAR_SCHEMA:
        errors.append("sidecar schema mismatch")
    manifest_binding = sidecar["manifest"]
    if not isinstance(manifest_binding, dict):
        raise SemanticCustodyError("sidecar manifest binding must be an object")
    _require_exact_keys(manifest_binding, {"label", "sha256"}, "sidecar manifest")
    if manifest_binding.get("label") != manifest_snapshot.label:
        errors.append("sidecar manifest label disagreement")
    binding_hash = _validate_sha256(
        manifest_binding.get("sha256"),
        "sidecar manifest.sha256",
    )
    if binding_hash != manifest_snapshot.sha256:
        errors.append("sidecar manifest SHA-256 disagreement")
    command = sidecar["command"]
    if not (
        isinstance(command, list)
        and command
        and all(type(item) is str and item for item in command)
    ):
        errors.append("sidecar exact producer argv missing")
    runtime = sidecar["runtime"]
    if not isinstance(runtime, dict):
        errors.append("sidecar exact producer runtime missing")
    else:
        _require_exact_keys(
            runtime,
            {"executable", "interpreter_version", "one_core"},
            "sidecar runtime",
        )
        if type(runtime["executable"]) is not str or not runtime["executable"]:
            errors.append("sidecar runtime executable missing")
        if (
            type(runtime["interpreter_version"]) is not str
            or not runtime["interpreter_version"]
        ):
            errors.append("sidecar runtime interpreter_version missing")
        if runtime["one_core"] is not True:
            errors.append("sidecar runtime one_core must be true")
    case = sidecar["case"]
    if not isinstance(case, dict) or not case:
        errors.append("sidecar exact producer case missing")
    else:
        _require_exact_keys(
            case,
            {"order_index", "anonymous_positions"},
            "sidecar case",
        )
        if type(case["order_index"]) is not int:
            errors.append("sidecar case order_index must be an integer")
        positions = case["anonymous_positions"]
        if not (
            isinstance(positions, list) and all(type(item) is int for item in positions)
        ):
            errors.append("sidecar case anonymous_positions must be integer list")
        if case.get("order_index") != manifest.get("order_index"):
            errors.append("sidecar case order_index disagreement")
        if case.get("anonymous_positions") != manifest.get("anonymous_positions"):
            errors.append("sidecar case anonymous_positions disagreement")
    order = sidecar["order"]
    if not (
        isinstance(order, list)
        and order
        and all(type(item) is int for item in order)
        and len(set(order)) == len(order)
    ):
        errors.append("sidecar exact producer order missing")
    elif order != manifest.get("order"):
        errors.append("sidecar order disagreement")
    source_hashes = sidecar["source_hashes"]
    if not isinstance(source_hashes, dict) or source_hashes != manifest.get(
        "source_hashes"
    ):
        errors.append("sidecar source_hashes disagreement")
    elif any(
        type(name) is not str
        or type(digest) is not str
        or _SHA256_RE.fullmatch(digest) is None
        for name, digest in source_hashes.items()
    ):
        errors.append("sidecar source_hashes types invalid")
    return sidecar, tuple(errors)


def _capture_candidate_bundle(
    root: Path,
    manifest_label: str,
    source_labels: Mapping[str, str],
    provenance_sidecar_label: str | None,
    *,
    enforce_lane_contract: bool,
) -> tuple[SourceBundle, tuple[ProvenanceMismatch, ...], tuple[str, ...]]:
    manifest_snapshot = snapshot_file(
        root,
        manifest_label,
        max_bytes=MAX_MANIFEST_BYTES,
    )
    manifest = load_strict_json(
        manifest_snapshot.content,
        require_canonical=False,
    )
    _validate_manifest_case(manifest)
    if enforce_lane_contract:
        if provenance_sidecar_label is None:
            raise SemanticCustodyError("source-entitled capture requires a sidecar")
        _validate_lane_manifest(
            manifest,
            manifest_sha256=manifest_snapshot.sha256,
        )
        _validate_lane_labels(
            manifest,
            manifest_label,
            source_labels,
            provenance_sidecar_label,
        )
    source_hashes = manifest.get("source_hashes")
    if not isinstance(source_hashes, dict) or not source_hashes:
        raise SemanticCustodyError("manifest source_hashes must be a nonempty object")
    if set(source_hashes) != set(source_labels):
        raise SemanticCustodyError("source labels do not exactly cover source_hashes")

    mismatches: list[ProvenanceMismatch] = []
    source_payloads: list[dict[str, Any]] = []
    for name in sorted(source_hashes):
        expected = _validate_sha256(source_hashes[name], f"source_hashes.{name}")
        label = _canonical_label(source_labels[name])
        snapshot = snapshot_file(root, label, max_bytes=MAX_SOURCE_BYTES)
        source_payloads.append({"name": name, **snapshot.payload()})
        if snapshot.sha256 != expected:
            mismatches.append(
                ProvenanceMismatch(
                    category="producer_source",
                    name=name,
                    label=label,
                    expected_sha256=expected,
                    actual_sha256=snapshot.sha256,
                )
            )

    if sum(record["byte_count"] for record in source_payloads) > MAX_TOTAL_SOURCE_BYTES:
        raise SemanticCustodyError("aggregate producer source bytes exceed limit")

    input_payloads: list[dict[str, Any]] = []
    for kind, index, label, expected in _manifest_inputs(manifest):
        snapshot = snapshot_file(root, label, max_bytes=MAX_INPUT_BYTES)
        input_payloads.append(
            {"kind": kind, "manifest_index": index, **snapshot.payload()}
        )
        if snapshot.sha256 != expected:
            mismatches.append(
                ProvenanceMismatch(
                    category=f"{kind}_input",
                    name=f"{kind}[{index}]",
                    label=label,
                    expected_sha256=expected,
                    actual_sha256=snapshot.sha256,
                )
            )

    if sum(record["byte_count"] for record in input_payloads) > MAX_TOTAL_INPUT_BYTES:
        raise SemanticCustodyError("aggregate manifest input bytes exceed limit")

    sidecar_snapshot = (
        snapshot_file(
            root,
            provenance_sidecar_label,
            max_bytes=MAX_MANIFEST_BYTES,
        )
        if provenance_sidecar_label is not None
        else None
    )
    bindings, missing_bindings = _sidecar_bindings(
        manifest,
        manifest_snapshot,
        sidecar_snapshot,
    )
    accepted = not mismatches and not missing_bindings
    payload: dict[str, Any] = {
        "schema": SOURCE_BUNDLE_SCHEMA,
        "accepted": accepted,
        "manifest": manifest_snapshot.payload(),
        "provenance_sidecar": (
            sidecar_snapshot.payload() if sidecar_snapshot is not None else None
        ),
        "producer_bindings": bindings,
        "sources": source_payloads,
        "inputs": input_payloads,
        "coverage": {
            "declared_source_dependencies": len(source_hashes),
            "captured_source_dependencies": len(source_payloads),
            "declared_inputs": len(input_payloads),
            "captured_inputs": len(input_payloads),
        },
        "mismatches": [item.payload() for item in mismatches],
        "missing_bindings": list(missing_bindings),
        "claims": false_claims(),
    }
    bundle_bytes = canonical_json(payload)
    return (
        SourceBundle(
            payload=payload,
            canonical_bytes=bundle_bytes,
            sha256=hashlib.sha256(bundle_bytes).hexdigest(),
        ),
        tuple(mismatches),
        missing_bindings,
    )


def capture_source_bundle(
    root: Path,
    manifest_label: str,
    source_labels: Mapping[str, str],
    *,
    provenance_sidecar_label: str,
) -> SourceBundle:
    """Capture a complete accepted bundle or reject every provenance defect."""

    bundle, mismatches, missing_bindings = _capture_candidate_bundle(
        root,
        manifest_label,
        source_labels,
        provenance_sidecar_label,
        enforce_lane_contract=True,
    )
    if mismatches or missing_bindings:
        audit = CustodyAudit(
            accepted=False,
            status="PROVENANCE_MISMATCH",
            mismatches=mismatches,
            missing_bindings=missing_bindings,
            source_count=len(bundle.payload["sources"]),
            input_count=len(bundle.payload["inputs"]),
            candidate_bundle=bundle,
        )
        raise ProvenanceMismatchError(audit)
    return bundle


def _snapshot_from_payload(
    record: Any,
    *,
    extra_keys: set[str],
    field: str,
    max_bytes: int,
) -> FileSnapshot:
    if not isinstance(record, dict):
        raise SemanticCustodyError(f"{field} snapshot must be an object")
    _require_exact_keys(
        record,
        {"label", "sha256", "byte_count", "base64", *extra_keys},
        f"{field} snapshot",
    )
    label = _canonical_label(record["label"])
    digest = _validate_sha256(record["sha256"], f"{field}.sha256")
    byte_count = record["byte_count"]
    if type(byte_count) is not int or byte_count < 0:
        raise SemanticCustodyError(f"{field}.byte_count must be nonnegative integer")
    if byte_count > max_bytes:
        raise SemanticCustodyError(f"{field}.byte_count exceeds limit")
    if type(record["base64"]) is not str:
        raise SemanticCustodyError(f"{field}.base64 must be a string")
    max_base64_length = 4 * ((max_bytes + 2) // 3)
    if len(record["base64"]) > max_base64_length:
        raise SemanticCustodyError(f"{field}.base64 exceeds limit")
    try:
        content = base64.b64decode(record["base64"], validate=True)
    except (ValueError, base64.binascii.Error) as exc:
        raise SemanticCustodyError(f"{field}.base64 is invalid") from exc
    if base64.b64encode(content).decode("ascii") != record["base64"]:
        raise SemanticCustodyError(f"{field}.base64 is not canonical")
    if len(content) != byte_count:
        raise SemanticCustodyError(f"{field} byte count mismatch")
    if hashlib.sha256(content).hexdigest() != digest:
        raise SemanticCustodyError(f"{field} embedded byte hash mismatch")
    return FileSnapshot(label, digest, byte_count, content)


def validate_source_bundle(source_bundle: SourceBundle) -> dict[str, Any]:
    """Revalidate a canonical accepted bundle from only its embedded bytes."""

    if type(source_bundle.canonical_bytes) is not bytes:
        raise SemanticCustodyError("source bundle must contain exact bytes")
    if len(source_bundle.canonical_bytes) > MAX_SOURCE_BUNDLE_BYTES:
        raise SemanticCustodyError("source bundle bytes exceed limit")
    parsed = load_strict_json(source_bundle.canonical_bytes)
    if parsed != source_bundle.payload:
        raise SemanticCustodyError("source bundle object/bytes mismatch")
    if (
        hashlib.sha256(source_bundle.canonical_bytes).hexdigest()
        != source_bundle.sha256
    ):
        raise SemanticCustodyError("source bundle hash mismatch")
    _require_exact_keys(
        parsed,
        {
            "schema",
            "accepted",
            "manifest",
            "provenance_sidecar",
            "producer_bindings",
            "sources",
            "inputs",
            "coverage",
            "mismatches",
            "missing_bindings",
            "claims",
        },
        "source bundle",
    )
    if parsed["schema"] != SOURCE_BUNDLE_SCHEMA or parsed["accepted"] is not True:
        raise SemanticCustodyError("source bundle is not custody-accepted")
    if parsed["mismatches"] != [] or parsed["missing_bindings"] != []:
        raise SemanticCustodyError("accepted source bundle contains provenance defects")
    if parsed["claims"] != false_claims():
        raise SemanticCustodyError("source bundle claims must remain false")

    manifest_snapshot = _snapshot_from_payload(
        parsed["manifest"],
        extra_keys=set(),
        field="manifest",
        max_bytes=MAX_MANIFEST_BYTES,
    )
    sidecar_snapshot = _snapshot_from_payload(
        parsed["provenance_sidecar"],
        extra_keys=set(),
        field="provenance_sidecar",
        max_bytes=MAX_MANIFEST_BYTES,
    )
    manifest = load_strict_json(
        manifest_snapshot.content,
        require_canonical=False,
    )
    _validate_lane_manifest(
        manifest,
        manifest_sha256=manifest_snapshot.sha256,
    )
    bindings, errors = _sidecar_bindings(
        manifest,
        manifest_snapshot,
        sidecar_snapshot,
    )
    if errors or bindings != parsed["producer_bindings"]:
        raise SemanticCustodyError("embedded sidecar does not bind embedded manifest")

    source_hashes = manifest.get("source_hashes")
    sources = parsed["sources"]
    if not isinstance(source_hashes, dict) or not isinstance(sources, list):
        raise SemanticCustodyError("source bundle source collection is invalid")
    source_names: set[str] = set()
    source_labels: dict[str, str] = {}
    source_total = 0
    for index, record in enumerate(sources):
        snapshot = _snapshot_from_payload(
            record,
            extra_keys={"name"},
            field=f"sources[{index}]",
            max_bytes=MAX_SOURCE_BYTES,
        )
        name = record["name"]
        if type(name) is not str or name in source_names or name not in source_hashes:
            raise SemanticCustodyError("source bundle source name coverage is invalid")
        source_names.add(name)
        source_labels[name] = snapshot.label
        source_total += snapshot.byte_count
        if snapshot.sha256 != source_hashes[name]:
            raise SemanticCustodyError(
                "source bundle source hash disagrees with manifest"
            )
    if source_names != set(source_hashes):
        raise SemanticCustodyError("source bundle does not cover every producer source")
    if source_total > MAX_TOTAL_SOURCE_BYTES:
        raise SemanticCustodyError("aggregate producer source bytes exceed limit")

    inputs = parsed["inputs"]
    expected_inputs = _manifest_inputs(manifest)
    if not isinstance(inputs, list) or len(inputs) != len(expected_inputs):
        raise SemanticCustodyError("source bundle input coverage is invalid")
    input_total = 0
    for record, expected in zip(inputs, expected_inputs, strict=True):
        kind, index, label, digest = expected
        snapshot = _snapshot_from_payload(
            record,
            extra_keys={"kind", "manifest_index"},
            field=f"inputs[{index}]",
            max_bytes=MAX_INPUT_BYTES,
        )
        if (
            record["kind"] != kind
            or type(record["manifest_index"]) is not int
            or record["manifest_index"] != index
            or snapshot.label != label
            or snapshot.sha256 != digest
        ):
            raise SemanticCustodyError("source bundle input disagrees with manifest")
        input_total += snapshot.byte_count
    if input_total > MAX_TOTAL_INPUT_BYTES:
        raise SemanticCustodyError("aggregate manifest input bytes exceed limit")
    _validate_lane_labels(
        manifest,
        manifest_snapshot.label,
        source_labels,
        sidecar_snapshot.label,
    )
    expected_coverage = {
        "declared_source_dependencies": len(source_hashes),
        "captured_source_dependencies": len(source_hashes),
        "declared_inputs": len(expected_inputs),
        "captured_inputs": len(expected_inputs),
    }
    if parsed["coverage"] != expected_coverage:
        raise SemanticCustodyError("source bundle coverage summary mismatch")
    return parsed


def audit_live_v12t(root: Path) -> CustodyAudit:
    """Audit the live v12t candidate without accepting changed producer bytes."""

    bundle, mismatches, missing_bindings = _capture_candidate_bundle(
        root,
        LIVE_MANIFEST_LABEL,
        LIVE_SOURCE_LABELS,
        None,
        enforce_lane_contract=False,
    )
    manifest = bundle.payload["manifest"]
    if manifest["sha256"] != LIVE_MANIFEST_SHA256:
        mismatches = (
            *mismatches,
            ProvenanceMismatch(
                category="manifest",
                name="v12t_manifest",
                label=LIVE_MANIFEST_LABEL,
                expected_sha256=LIVE_MANIFEST_SHA256,
                actual_sha256=manifest["sha256"],
            ),
        )
    return CustodyAudit(
        accepted=False,
        status="PROVENANCE_MISMATCH",
        mismatches=tuple(mismatches),
        missing_bindings=missing_bindings,
        source_count=len(bundle.payload["sources"]),
        input_count=len(bundle.payload["inputs"]),
        candidate_bundle=bundle,
    )


def require_live_v12t(root: Path) -> SourceBundle:
    audit = audit_live_v12t(root)
    if not audit.accepted:
        raise ProvenanceMismatchError(audit)
    return audit.candidate_bundle


def false_claims() -> dict[str, bool]:
    return {
        "aggregate_coverage": False,
        "universal_lift": False,
        "theorem_closure": False,
        "lean_checked": False,
    }


@functools.lru_cache(maxsize=4)
def build_variable_map(contract: AllocationContract = LIVE_ALLOCATION) -> bytes:
    """Reconstruct the complete deterministic allocation contract."""

    next_variable = 1
    selected: list[dict[str, Any]] = []
    for center in contract.points:
        for point in contract.points:
            if center == point:
                continue
            selected.append(
                {
                    "variable": next_variable,
                    "kind": "selected_incidence",
                    "center": center,
                    "point": point,
                    "formula": {
                        "op": "selected",
                        "arguments": [center, point],
                    },
                }
            )
            next_variable += 1

    fifth: list[dict[str, Any]] = []
    for point in contract.fifth_candidates:
        fifth.append(
            {
                "variable": next_variable,
                "kind": "fifth_choice",
                "point": point,
                "formula": {"op": "fifth_source", "arguments": [point]},
            }
        )
        next_variable += 1

    edges = list(itertools.combinations(contract.points, 2))
    distance: list[dict[str, Any]] = []
    distance_lookup: dict[tuple[tuple[int, int], int], int] = {}
    for edge in edges:
        for bit in range(contract.distance_label_bits):
            distance_lookup[(edge, bit)] = next_variable
            distance.append(
                {
                    "variable": next_variable,
                    "kind": "distance_label_bit",
                    "edge": list(edge),
                    "bit": bit,
                    "formula": {
                        "op": "distance_label_bit",
                        "edge": list(edge),
                        "bit": bit,
                    },
                }
            )
            next_variable += 1

    xor_helpers: list[dict[str, Any]] = []
    for left_edge, right_edge in itertools.combinations(edges, 2):
        for bit in range(contract.distance_label_bits):
            left = distance_lookup[(left_edge, bit)]
            right = distance_lookup[(right_edge, bit)]
            helper = next_variable
            xor_helpers.append(
                {
                    "variable": helper,
                    "kind": "comparison_xor_helper",
                    "left_edge": list(left_edge),
                    "right_edge": list(right_edge),
                    "bit": bit,
                    "formula": {
                        "op": "iff_xor",
                        "result": helper,
                        "inputs": [left, right],
                        "cnf": [
                            [-helper, left, right],
                            [-helper, -left, -right],
                            [helper, left, -right],
                            [helper, -left, right],
                        ],
                    },
                }
            )
            next_variable += 1

    allocations = {
        "selected_incidence": selected,
        "fifth_choice": fifth,
        "distance_label_bits": distance,
        "comparison_xor_helpers": xor_helpers,
    }
    all_records = selected + fifth + distance + xor_helpers
    ids = [record["variable"] for record in all_records]

    def region(records: list[dict[str, Any]]) -> dict[str, int | None]:
        return {
            "first": records[0]["variable"] if records else None,
            "last": records[-1]["variable"] if records else None,
            "count": len(records),
        }

    payload = {
        "schema": VARIABLE_MAP_SCHEMA,
        "contract": {
            "points": list(contract.points),
            "fifth_candidates": list(contract.fifth_candidates),
            "distance_label_bits": contract.distance_label_bits,
        },
        "allocations": allocations,
        "coverage": {
            "first_variable": 1,
            "last_variable": next_variable - 1,
            "variable_count": next_variable - 1,
            "contiguous_exact": ids == list(range(1, next_variable)),
            "variable_ids_sha256": hashlib.sha256(canonical_json(ids)).hexdigest(),
            "regions": {
                "selected_incidence": region(selected),
                "fifth_choice": region(fifth),
                "distance_label_bits": region(distance),
                "comparison_xor_helpers": region(xor_helpers),
            },
        },
    }
    return canonical_json(payload)


def validate_variable_map(
    variable_map_bytes: bytes,
    contract: AllocationContract = LIVE_ALLOCATION,
) -> dict[str, Any]:
    parsed = load_strict_json(variable_map_bytes)
    expected = build_variable_map(contract)
    if variable_map_bytes != expected:
        raise SemanticCustodyError("variable map differs from producer allocation")
    if parsed.get("schema") != VARIABLE_MAP_SCHEMA:
        raise SemanticCustodyError("variable map schema mismatch")
    return parsed


def _validate_literals(literals: Sequence[int], variable_count: int) -> dict[int, bool]:
    if len(literals) != variable_count:
        raise SemanticCustodyError("assignment is not total")
    truth: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0:
            raise SemanticCustodyError("assignment literals must be nonzero integers")
        variable = abs(literal)
        if variable > variable_count:
            raise SemanticCustodyError("assignment literal is out of range")
        if variable in truth:
            raise SemanticCustodyError("assignment contains duplicate variable")
        truth[variable] = literal > 0
    if set(truth) != set(range(1, variable_count + 1)):
        raise SemanticCustodyError("assignment does not cover every variable")
    return truth


def parse_total_dimacs_assignment(
    model: bytes | str | Sequence[int], variable_count: int
) -> dict[int, bool]:
    """Parse one total SAT assignment and reject partial or ambiguous models."""

    if type(variable_count) is not int or variable_count < 1:
        raise SemanticCustodyError("variable_count must be positive")
    if not isinstance(model, (bytes, str)):
        return _validate_literals(model, variable_count)
    try:
        text = (
            model.decode("ascii", errors="strict")
            if isinstance(model, bytes)
            else model
        )
    except UnicodeDecodeError as exc:
        raise SemanticCustodyError("DIMACS model must be ASCII") from exc
    status_seen = False
    tokens: list[str] = []
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped:
            continue
        fields = stripped.split()
        if fields[0] == "c":
            continue
        if fields[0] == "s":
            if fields != ["s", "SATISFIABLE"] or status_seen:
                raise SemanticCustodyError("model must have one SATISFIABLE status")
            status_seen = True
            continue
        if fields[0] != "v":
            raise SemanticCustodyError("unexpected DIMACS model line")
        tokens.extend(fields[1:])
    if not status_seen or not tokens or tokens[-1] != "0" or "0" in tokens[:-1]:
        raise SemanticCustodyError("model must end in one DIMACS zero")
    literal_tokens = tokens[:-1]
    if any(_INT_RE.fullmatch(token) is None for token in literal_tokens):
        raise SemanticCustodyError("invalid DIMACS literal")
    return _validate_literals([int(token) for token in literal_tokens], variable_count)


def validate_and_decode(
    variable_map_bytes: bytes,
    model: bytes | str | Sequence[int],
    contract: AllocationContract = LIVE_ALLOCATION,
) -> dict[str, Any]:
    """Validate allocation-local formulas and structurally decode the model."""

    variable_map = validate_variable_map(variable_map_bytes, contract)
    return _decode_validated_variable_map(variable_map, model, contract)


def _decode_validated_variable_map(
    variable_map: Mapping[str, Any],
    model: bytes | str | Sequence[int],
    contract: AllocationContract,
) -> dict[str, Any]:
    count = variable_map["coverage"]["variable_count"]
    truth = parse_total_dimacs_assignment(model, count)
    allocations = variable_map["allocations"]
    for record in allocations["comparison_xor_helpers"]:
        formula = record["formula"]
        left, right = formula["inputs"]
        if truth[formula["result"]] != (truth[left] != truth[right]):
            raise SemanticCustodyError(
                f"XOR helper formula violated at variable {formula['result']}"
            )

    supports = {str(center): [] for center in contract.points}
    for record in allocations["selected_incidence"]:
        if truth[record["variable"]]:
            supports[str(record["center"])].append(record["point"])
    fifth_choices = [
        record["point"]
        for record in allocations["fifth_choice"]
        if truth[record["variable"]]
    ]
    edge_bits: dict[tuple[int, int], list[bool]] = {
        edge: [False] * contract.distance_label_bits
        for edge in itertools.combinations(contract.points, 2)
    }
    for record in allocations["distance_label_bits"]:
        edge = tuple(record["edge"])
        edge_bits[edge][record["bit"]] = truth[record["variable"]]
    distance_labels = [
        {
            "edge": list(edge),
            "bits_little_endian": bits,
            "label": sum((1 << bit) for bit, value in enumerate(bits) if value),
        }
        for edge, bits in edge_bits.items()
    ]
    return {
        "schema": DECODED_SCHEMA,
        "selected_supports": supports,
        "fifth_choices": fifth_choices,
        "distance_labels": distance_labels,
        "helper_validation": {
            "formula": "helper = left XOR right",
            "validated": True,
            "count": len(allocations["comparison_xor_helpers"]),
        },
        "source_predicate_replay_status": {
            "status": "NOT_RUN_BY_STRUCTURAL_DECODER",
            "replayed_predicates": [],
            "next_requirement": (
                "call replay_source_semantics with an accepted semantic package, "
                "exact CNF bytes, production map, and total model"
            ),
        },
        "claims": false_claims(),
    }


def _canonical_model_bytes(model: bytes | str | Sequence[int]) -> bytes:
    if isinstance(model, bytes):
        return model
    if isinstance(model, str):
        return model.encode("utf-8")
    return canonical_json(list(model))


def _embedded_lane_context(
    source_bundle: SourceBundle,
) -> tuple[dict[str, Any], FileSnapshot, FileSnapshot]:
    bundle = validate_source_bundle(source_bundle)
    manifest_snapshot = _snapshot_from_payload(
        bundle["manifest"],
        extra_keys=set(),
        field="manifest",
        max_bytes=MAX_MANIFEST_BYTES,
    )
    sidecar_snapshot = _snapshot_from_payload(
        bundle["provenance_sidecar"],
        extra_keys=set(),
        field="provenance_sidecar",
        max_bytes=MAX_MANIFEST_BYTES,
    )
    manifest = load_strict_json(
        manifest_snapshot.content,
        require_canonical=False,
    )
    _validate_lane_manifest(
        manifest,
        manifest_sha256=manifest_snapshot.sha256,
    )
    return manifest, manifest_snapshot, sidecar_snapshot


def _inspect_dimacs_cnf(
    cnf_bytes: bytes,
    truth: Mapping[int, bool] | None = None,
) -> dict[str, Any]:
    """Parse exact DIMACS bytes and optionally check every clause."""

    if type(cnf_bytes) is not bytes:
        raise SemanticCustodyError("CNF must be exact bytes")
    if len(cnf_bytes) > MAX_CNF_BYTES:
        raise SemanticCustodyError("CNF bytes exceed limit")
    try:
        text = cnf_bytes.decode("ascii", errors="strict")
    except UnicodeDecodeError as exc:
        raise SemanticCustodyError("CNF must be ASCII") from exc
    variables: int | None = None
    declared_clauses: int | None = None
    clauses_seen = 0
    clause_satisfied = False
    clause_has_literal = False
    for line_number, line in enumerate(text.splitlines(), start=1):
        fields = line.split()
        if not fields:
            continue
        if fields[0] == "c":
            continue
        if fields[0] == "p":
            if variables is not None or clauses_seen or clause_has_literal:
                raise SemanticCustodyError("CNF has misplaced or duplicate header")
            if (
                len(fields) != 4
                or fields[:2] != ["p", "cnf"]
                or not fields[2].isdigit()
                or not fields[3].isdigit()
            ):
                raise SemanticCustodyError("CNF header must be exactly p cnf N M")
            variables = int(fields[2])
            declared_clauses = int(fields[3])
            continue
        if variables is None or declared_clauses is None:
            raise SemanticCustodyError("CNF clause precedes header")
        for token in fields:
            if _INT_RE.fullmatch(token) is None:
                raise SemanticCustodyError(f"invalid CNF literal on line {line_number}")
            literal = int(token)
            if literal == 0:
                clauses_seen += 1
                if truth is not None and not clause_satisfied:
                    raise SemanticCustodyError(
                        f"CNF clause {clauses_seen} is not satisfied by model"
                    )
                clause_satisfied = False
                clause_has_literal = False
                continue
            if abs(literal) > variables:
                raise SemanticCustodyError("CNF literal is out of range")
            clause_has_literal = True
            if truth is not None:
                if abs(literal) not in truth:
                    raise SemanticCustodyError("CNF model is not total")
                value = truth[abs(literal)]
                clause_satisfied = clause_satisfied or (value == (literal > 0))
    if variables is None or declared_clauses is None:
        raise SemanticCustodyError("CNF header is missing")
    if clause_has_literal:
        raise SemanticCustodyError("CNF final clause lacks terminating zero")
    if clauses_seen != declared_clauses:
        raise SemanticCustodyError("CNF clause count differs from header")
    return {
        "variables": variables,
        "clauses": clauses_seen,
        "all_clauses_satisfied": truth is not None,
    }


def build_semantic_package(
    *,
    source_bundle: SourceBundle,
    cnf_bytes: bytes,
    variable_map_bytes: bytes,
) -> bytes:
    """Bind accepted source custody to the exact production CNF and map."""

    manifest, manifest_snapshot, sidecar_snapshot = _embedded_lane_context(
        source_bundle
    )
    variable_map = validate_variable_map(variable_map_bytes, LIVE_ALLOCATION)
    if variable_map["coverage"]["variable_count"] != 74813:
        raise SemanticCustodyError("semantic package requires the 74813-variable map")
    cnf = _inspect_dimacs_cnf(cnf_bytes)
    cnf_sha256 = hashlib.sha256(cnf_bytes).hexdigest()
    if cnf_sha256 != manifest["cnf_sha256"]:
        raise SemanticCustodyError("CNF byte hash disagrees with manifest")
    if cnf["variables"] != manifest["variables"]:
        raise SemanticCustodyError("CNF header variable count disagrees with manifest")
    if cnf["clauses"] != manifest["clauses"] or cnf["clauses"] <= 0:
        raise SemanticCustodyError("CNF header clause count disagrees with manifest")
    payload = {
        "schema": SEMANTIC_PACKAGE_SCHEMA,
        "classification": "SOURCE_CUSTODY_AND_ENCODING_BOUND",
        "manifest": {
            "label": manifest_snapshot.label,
            "sha256": manifest_snapshot.sha256,
        },
        "provenance_sidecar": {
            "label": sidecar_snapshot.label,
            "sha256": sidecar_snapshot.sha256,
        },
        "source_bundle_sha256": source_bundle.sha256,
        "cnf": {
            "label": manifest["cnf"],
            "sha256": cnf_sha256,
            "variables": cnf["variables"],
            "clauses": cnf["clauses"],
        },
        "variable_map": {
            "sha256": hashlib.sha256(variable_map_bytes).hexdigest(),
            "variable_count": variable_map["coverage"]["variable_count"],
        },
        "case": {
            "order_index": manifest["order_index"],
            "anonymous_positions": manifest["anonymous_positions"],
            "order": manifest["order"],
        },
        "claims": false_claims(),
    }
    return canonical_json(payload)


def validate_semantic_package(
    package_bytes: bytes,
    *,
    source_bundle: SourceBundle,
    cnf_bytes: bytes,
    variable_map_bytes: bytes,
) -> dict[str, Any]:
    package = load_strict_json(package_bytes)
    expected = build_semantic_package(
        source_bundle=source_bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map_bytes,
    )
    if package_bytes != expected:
        raise SemanticCustodyError("semantic package differs from recomputed bindings")
    return package


_OLD_CENTERS = (8, 9, 10, 11)
_FIXED_CAP_HITS = {
    8: {6, 9},
    9: {6, 7},
    10: {8, 9},
    11: {8, 10},
}
_OUTSIDE = {1, 3, 4, 5, 13, 14, 15, 16}
_PHYSICAL = {6, 7, 8, 9, 10}
_SECOND_CAP = {0, 2, 6, 7, 8, 9, 10, 11, 12}
_DELETED_SOURCE = 11
REPLAYED_SOURCE_PREDICATES = (
    "all_17_supports_present",
    "support_size_exactly_four",
    "support_excludes_self",
    "source_coverage_all_17_points",
    "pairwise_support_intersection_at_most_two",
    "old_center_fixed_cap_slices",
    "outside_multiplicity_exactly_one",
    "unique_legal_fifth_center",
    "fifth_support_contains_deleted_source_11",
    "fifth_physical_intersection_at_most_one",
)


def _replay_pinned_source_predicates(decoded: Mapping[str, Any]) -> list[str]:
    raw_supports = decoded.get("selected_supports")
    if not isinstance(raw_supports, dict) or set(raw_supports) != {
        str(point) for point in range(17)
    }:
        raise SemanticCustodyError("source replay: all 17 supports are required")
    supports: dict[int, set[int]] = {}
    for center in range(17):
        values = raw_supports[str(center)]
        if not isinstance(values, list) or any(
            type(value) is not int for value in values
        ):
            raise SemanticCustodyError("source replay: support values must be integers")
        if len(values) != len(set(values)) or any(
            value not in range(17) for value in values
        ):
            raise SemanticCustodyError("source replay: support values are invalid")
        supports[center] = set(values)
    if any(len(supports[center]) != 4 for center in range(17)):
        raise SemanticCustodyError(
            "source replay: each support must have size exactly four"
        )
    if any(center in supports[center] for center in range(17)):
        raise SemanticCustodyError("source replay: a support contains its own center")
    if set().union(*supports.values()) != set(range(17)):
        raise SemanticCustodyError(
            "source replay: support union does not cover 17 points"
        )
    if any(
        len(supports[left] & supports[right]) > 2
        for left, right in itertools.combinations(range(17), 2)
    ):
        raise SemanticCustodyError(
            "source replay: pairwise support intersection exceeds two"
        )
    if any(
        supports[center] & _SECOND_CAP != _FIXED_CAP_HITS[center]
        for center in _OLD_CENTERS
    ):
        raise SemanticCustodyError("source replay: fixed cap slice mismatch")
    if any(
        sum(point in supports[center] for center in _OLD_CENTERS) != 1
        for point in _OUTSIDE
    ):
        raise SemanticCustodyError(
            "source replay: outside multiplicity is not exactly one"
        )
    fifth_choices = decoded.get("fifth_choices")
    legal_fifth = set(range(17)) - {_DELETED_SOURCE, *_OLD_CENTERS}
    if (
        not isinstance(fifth_choices, list)
        or len(fifth_choices) != 1
        or type(fifth_choices[0]) is not int
        or fifth_choices[0] not in legal_fifth
    ):
        raise SemanticCustodyError("source replay: fifth center is not uniquely legal")
    fifth = fifth_choices[0]
    if _DELETED_SOURCE not in supports[fifth]:
        raise SemanticCustodyError(
            "source replay: fifth support omits deleted source 11"
        )
    if len(supports[fifth] & _PHYSICAL) > 1:
        raise SemanticCustodyError(
            "source replay: fifth physical intersection exceeds one"
        )
    return list(REPLAYED_SOURCE_PREDICATES)


def replay_source_semantics(
    *,
    package_bytes: bytes,
    cnf_bytes: bytes,
    model: bytes | str | Sequence[int],
    source_bundle: SourceBundle,
    variable_map_bytes: bytes,
) -> dict[str, Any]:
    """Run the finite, pinned source replay using only captured artifact bytes."""

    validate_semantic_package(
        package_bytes,
        source_bundle=source_bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map_bytes,
    )
    manifest, _, _ = _embedded_lane_context(source_bundle)
    variable_map = validate_variable_map(variable_map_bytes, LIVE_ALLOCATION)
    variable_count = variable_map["coverage"]["variable_count"]
    truth = parse_total_dimacs_assignment(model, variable_count)
    decoded = _decode_validated_variable_map(variable_map, model, LIVE_ALLOCATION)
    cnf = _inspect_dimacs_cnf(cnf_bytes, truth)
    if (
        cnf["variables"] != manifest["variables"]
        or cnf["clauses"] != manifest["clauses"]
        or cnf["all_clauses_satisfied"] is not True
    ):
        raise SemanticCustodyError("CNF semantic evidence disagrees with manifest")
    replayed = _replay_pinned_source_predicates(decoded)
    decoded_bytes = canonical_json(decoded)
    evidence = {
        "schema": SEMANTIC_EVIDENCE_SCHEMA,
        "classification": "FINITE_SOURCE_SEMANTIC_REPLAY",
        "bindings": {
            "semantic_package_sha256": hashlib.sha256(package_bytes).hexdigest(),
            "cnf_sha256": hashlib.sha256(cnf_bytes).hexdigest(),
            "model_sha256": hashlib.sha256(_canonical_model_bytes(model)).hexdigest(),
            "source_bundle_sha256": source_bundle.sha256,
            "variable_map_sha256": hashlib.sha256(variable_map_bytes).hexdigest(),
            "decoded_object_sha256": hashlib.sha256(decoded_bytes).hexdigest(),
            "source_runner_contract_sha256": PINNED_SOURCE_RUNNER_SHA256,
        },
        "evidence": {
            "finite_source_custody": True,
            "total_model": True,
            "all_cnf_clauses_satisfied": True,
            "source_predicates_replayed": True,
            "cnf_clauses_checked": cnf["clauses"],
            "replayed_predicates": replayed,
        },
        "claims": false_claims(),
    }
    return {"decoded": decoded, "semantic_evidence": evidence}


def issue_semantic_receipt(
    *,
    package_bytes: bytes,
    cnf_bytes: bytes,
    model: bytes | str | Sequence[int],
    source_bundle: SourceBundle,
    variable_map_bytes: bytes,
) -> bytes:
    """Issue a receipt only after rerunning every finite semantic gate."""

    replay = replay_source_semantics(
        package_bytes=package_bytes,
        cnf_bytes=cnf_bytes,
        model=model,
        source_bundle=source_bundle,
        variable_map_bytes=variable_map_bytes,
    )
    decoded_bytes = canonical_json(replay["decoded"])
    evidence_bytes = canonical_json(replay["semantic_evidence"])
    payload = {
        "schema": SEMANTIC_RECEIPT_SCHEMA,
        "classification": "FINITE_SOURCE_SEMANTIC_RECEIPT",
        "bindings": {
            "semantic_package_sha256": hashlib.sha256(package_bytes).hexdigest(),
            "cnf_sha256": hashlib.sha256(cnf_bytes).hexdigest(),
            "model_sha256": hashlib.sha256(_canonical_model_bytes(model)).hexdigest(),
            "source_bundle_sha256": source_bundle.sha256,
            "variable_map_sha256": hashlib.sha256(variable_map_bytes).hexdigest(),
            "decoded_object_sha256": hashlib.sha256(decoded_bytes).hexdigest(),
            "semantic_evidence_sha256": hashlib.sha256(evidence_bytes).hexdigest(),
        },
        "evidence": replay["semantic_evidence"]["evidence"],
        "claims": false_claims(),
    }
    receipt_hash = hashlib.sha256(canonical_json(payload)).hexdigest()
    return canonical_json({**payload, "receipt_sha256": receipt_hash})


def validate_semantic_receipt(
    receipt_bytes: bytes,
    *,
    package_bytes: bytes,
    cnf_bytes: bytes,
    model: bytes | str | Sequence[int],
    source_bundle: SourceBundle,
    variable_map_bytes: bytes,
) -> dict[str, Any]:
    """Re-run every gate and require byte equality with the expected receipt."""

    receipt = load_strict_json(receipt_bytes)
    receipt_hash = receipt.get("receipt_sha256")
    _validate_sha256(receipt_hash, "receipt_sha256")
    payload = {key: value for key, value in receipt.items() if key != "receipt_sha256"}
    if hashlib.sha256(canonical_json(payload)).hexdigest() != receipt_hash:
        raise SemanticCustodyError("receipt self-hash mismatch")
    expected = issue_semantic_receipt(
        package_bytes=package_bytes,
        cnf_bytes=cnf_bytes,
        model=model,
        source_bundle=source_bundle,
        variable_map_bytes=variable_map_bytes,
    )
    if receipt_bytes != expected:
        raise SemanticCustodyError("semantic receipt differs from recomputed evidence")
    return receipt
