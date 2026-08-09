"""Freeze the selected corrected-v12t exact-17 DIMACS ingress packet.

This adapter authenticates one archived finite CNF and its two upstream JSON
records.  It does not run PIQD, a solver, Lean, or an upstream producer.  The
emitted package is deliberately explicit about those missing trust links.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    WAVE_SCHEMA,
    WaveContractError,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

UPSTREAM_SCHEMA = (
    "p97-rigid221-exact17-source-faithful-boolean-cnf-"
    "transitive-two-circle-candidate-v4"
)
VALIDATION_SCHEMA = "p97-rigid221-exact17-source-cnf-crosscheck-v3"
PRODUCER_SCHEMA = "p97-phase3-piqd-producer/v1"
VARIABLE_MAP_SCHEMA = "p97-phase3-piqd-variable-map/v1"
ORDER_SCHEMA = "p97-phase3-piqd-exact17-order/v1"
INGRESS_SCHEMA = "p97-phase3-piqd-exact17-ingress/v1"
PACKAGE_RESULT_SCHEMA = "p97-phase3-piqd-exact17-package-result/v1"

UPSTREAM_SCOPE = (
    "one normalized cap-nine case; nogood soundness and Lean lift remain separate"
)
PACKAGE_SCOPE = (
    "one authenticated normalized exact-17 cap-nine order; archived finite CNF "
    "identity only; no source entitlement, aggregate coverage, universal lift, "
    "or theorem closure"
)
VARIABLE_MAP_STATUS = "PARTIAL_OPAQUE_VARIABLE_MAP"
WAVE_ID = "p97-exact17-v12t-order0-canary"
LIVE_LEAF = "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier"
SOURCE_THEOREM = "UNAUTHENTICATED_EXACT17_SOURCE_CONTRACT"
CARDINALITY_SCOPE = "one normalized exact-17 cap-nine order (order_index 0)"

SELECTED_DIRECTORY = (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "source-faithful-cap9-direct-cnf-v12t-exact-all-cores-44"
)
SELECTED_CNF_PATH = f"{SELECTED_DIRECTORY}/o0-p0-1.cnf"
SELECTED_MANIFEST_PATH = f"{SELECTED_DIRECTORY}/o0-p0-1.manifest.json"
SELECTED_VALIDATION_PATH = f"{SELECTED_DIRECTORY}/o0-p0-1.validation.json"
SELECTED_STRUCTURAL_CNF_PATH = (
    f"{SELECTED_DIRECTORY}/o0-p0-1.validation-structural-roundtrip.cnf"
)

SELECTED_ORDER = [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]
SELECTED_ANONYMOUS_POSITIONS = [0, 1]

_HEX = frozenset("0123456789abcdef")
_READ_CHUNK_BYTES = 1024 * 1024
_MAX_JSON_BYTES = 8 * 1024 * 1024
_MAX_CNF_BYTES = 256 * 1024 * 1024
_MAX_DIMACS_LINE_BYTES = 16 * 1024 * 1024
_MAX_DIMACS_INTEGER_DIGITS = 20
_OUTPUT_LOCK_NAME = ".phase3-piqd-exact17-package.lock"

_MANIFEST_KEYS = frozenset(
    {
        "analyses",
        "anonymous_positions",
        "artifacts",
        "clause_blocks",
        "clauses",
        "cnf",
        "cnf_sha256",
        "cut_admission",
        "learned_record_kinds",
        "learned_replay",
        "order",
        "order_index",
        "schema",
        "scope",
        "source_hashes",
        "transitive_two_circle",
        "transitive_two_circle_metadata",
        "variables",
    }
)
_VALIDATION_KEYS = frozenset(
    {
        "anonymous_positions",
        "cadical_model_roundtrip",
        "candidate_cnf",
        "candidate_cnf_sha256",
        "candidate_exact_regeneration",
        "candidate_manifest",
        "candidate_manifest_sha256",
        "order",
        "order_index",
        "schema",
        "source_hashes",
        "source_z3_models_checked",
        "static_clause_digests",
        "status",
        "structural_clauses",
        "structural_cnf",
        "structural_cnf_sha256",
        "transitive_clause_digests",
        "truth_table_assignments",
        "variables",
    }
)
_CLAUSE_BLOCK_KEYS = frozenset(
    {
        "direct_five_ccw_three_rows",
        "direct_shared_middle_endpoint_pair",
        "direct_six_ccw_two_k2_three_rows",
        "exact_four",
        "fifth_center_exactly_one",
        "fifth_row_source_and_one_hit",
        "initial_learned_patterns",
        "kalmanson_core",
        "learned_nogoods",
        "named_row_units",
        "old_row_cap_units",
        "old_row_outside_partition",
        "proposal_two_kalmanson_equality_label",
        "seven_point_schema_c",
        "seven_point_schema_f",
        "six_point_schema_d",
        "six_point_schema_e",
        "six_point_schema_g",
        "source_coverage",
        "three_shell_rotation_bank",
        "transitive_convex_five_point",
        "transitive_label_selected_equality",
        "transitive_label_xor_definition",
        "transitive_two_circle_bisector",
        "two_center_common_hit",
        "two_circle_bisector",
        "two_rows_shared_late_pair",
    }
)
_REQUIRED_TRANSITIVE_BLOCKS = frozenset(
    {
        "transitive_convex_five_point",
        "transitive_label_selected_equality",
        "transitive_label_xor_definition",
        "transitive_two_circle_bisector",
    }
)
_STRUCTURAL_BLOCK_KEYS = frozenset(
    {
        "exact_four",
        "fifth_center_exactly_one",
        "fifth_row_source_and_one_hit",
        "initial_learned_patterns",
        "named_row_units",
        "old_row_cap_units",
        "old_row_outside_partition",
        "source_coverage",
        "two_center_common_hit",
    }
)
_MANIFEST_SOURCE_HASH_KEYS = frozenset(
    {
        "base_cnf_exporter",
        "direct_exporter",
        "direct_row_consumers",
        "fullcover",
        "order_base",
        "producer_bank",
        "shared_late_pair",
        "source_runner",
    }
)
_VALIDATION_SOURCE_HASH_KEYS = frozenset(
    {
        "base_exporter",
        "direct_exporter",
        "direct_row_consumers",
        "fullcover",
        "shared_late_pair",
        "source_runner",
    }
)
_SOURCE_HASH_CROSSWALK = {
    "base_exporter": "base_cnf_exporter",
    "direct_exporter": "direct_exporter",
    "direct_row_consumers": "direct_row_consumers",
    "fullcover": "fullcover",
    "shared_late_pair": "shared_late_pair",
    "source_runner": "source_runner",
}
_TRANSITIVE_METADATA_KEYS = frozenset(
    {
        "comparison_xor_variables",
        "distance_label_bits",
        "distance_label_variables",
        "edge_pair_comparisons",
        "five_point_forbidden_cores",
        "forbidden_cores",
    }
)
_STATIC_DIGEST_KEYS = frozenset(
    {
        "direct_five_ccw_three_rows",
        "direct_shared_middle_endpoint_pair",
        "direct_six_ccw_two_k2_three_rows",
        "kalmanson_core",
        "seven_point_schema_c",
        "seven_point_schema_f",
        "six_point_schema_d",
        "six_point_schema_e",
        "six_point_schema_g",
        "three_shell_rotation_bank",
        "two_circle_bisector",
        "two_rows_shared_late_pair",
    }
)
_TRUTH_TABLE_ASSIGNMENTS = {
    "13_choose_1": 8192,
    "16_choose_4": 65536,
    "4_choose_1": 16,
}

_REPORT_CROSS_VALIDATED_MANIFEST_FIELDS = frozenset(
    {
        "anonymous_positions",
        "cnf",
        "cnf_sha256",
        "order",
        "order_index",
        "variables",
        *(f"clause_blocks.{key}" for key in _STATIC_DIGEST_KEYS),
        "clause_blocks.transitive_convex_five_point",
        *(f"source_hashes.{key}" for key in _SOURCE_HASH_CROSSWALK.values()),
    }
)
_PINNED_BYTES_ONLY_MANIFEST_FIELDS = frozenset(
    {
        "analyses",
        "artifacts",
        "clauses",
        "cut_admission",
        "learned_record_kinds",
        "learned_replay",
        "schema",
        "scope",
        "transitive_two_circle",
        *(f"clause_blocks.{key}" for key in _CLAUSE_BLOCK_KEYS),
        *(f"source_hashes.{key}" for key in _MANIFEST_SOURCE_HASH_KEYS),
        *(f"transitive_two_circle_metadata.{key}" for key in _TRANSITIVE_METADATA_KEYS),
    }
    - _REPORT_CROSS_VALIDATED_MANIFEST_FIELDS
    - {f"clause_blocks.{key}" for key in _STRUCTURAL_BLOCK_KEYS}
)


class Exact17PackageError(ValueError):
    """The selected exact-17 packet failed a fail-closed ingress check."""


@dataclass(frozen=True)
class Exact17Identity:
    """Raw identity and dimensions pinned for the selected candidate."""

    cnf_sha256: str
    cnf_bytes: int
    manifest_sha256: str
    validation_sha256: str
    num_variables: int
    num_clauses: int
    structural_cnf_sha256: str
    structural_cnf_bytes: int
    structural_num_variables: int
    structural_num_clauses: int


SELECTED_V12T_IDENTITY = Exact17Identity(
    cnf_sha256="62de9fb9e20d13ff256f59aa20d5044f55bc17f9adbce8204564d486adfc75fb",
    cnf_bytes=95_933_857,
    manifest_sha256=(
        "940bd8aa727f144973840c5fa69ea968a5942a8be4ef695acb25eb7224c86572"
    ),
    validation_sha256=(
        "ee7bbde2ce02fce6c3e2ced5e3ea26075b747e528e9b439b2fd26e057b3907bd"
    ),
    num_variables=74_813,
    num_clauses=2_504_349,
    structural_cnf_sha256=(
        "884029ff0a06830273a71c650e70e1fa6530a088fabd04d8d83884c56bcdaf98"
    ),
    structural_cnf_bytes=4_160_204,
    structural_num_variables=285,
    structural_num_clauses=145_975,
)


@dataclass(frozen=True)
class _Snapshot:
    payload: bytes
    sha256: str


@dataclass(frozen=True)
class _OutputSnapshot:
    payload: bytes
    identity: tuple[int, int, int, int, int, int]


@dataclass(frozen=True)
class _DimacsDimensions:
    num_variables: int
    num_clauses: int


@dataclass(frozen=True)
class PackageResult:
    """Authenticated identities returned after deterministic package emission."""

    output_dir: Path
    payload: Mapping[str, Any]

    def as_dict(self) -> dict[str, Any]:
        return dict(self.payload)


def _mapping(value: Any, path: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise Exact17PackageError(f"{path} must be an object")
    return value


def _sequence(value: Any, path: str) -> list[Any]:
    if type(value) is not list:
        raise Exact17PackageError(f"{path} must be an array")
    return value


def _exact_keys(value: Mapping[str, Any], expected: frozenset[str], path: str) -> None:
    missing = sorted(expected - value.keys())
    extra = sorted(value.keys() - expected)
    if missing or extra:
        raise Exact17PackageError(
            f"{path} keys mismatch: missing={missing}, extra={extra}"
        )


def _plain_int(value: Any, path: str, *, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise Exact17PackageError(f"{path} must be an integer >= {minimum}")
    return value


def _plain_int_array(value: Any, path: str) -> list[int]:
    items = _sequence(value, path)
    return [_plain_int(item, f"{path}[{index}]") for index, item in enumerate(items)]


def _string(value: Any, path: str) -> str:
    if type(value) is not str or not value.strip():
        raise Exact17PackageError(f"{path} must be a non-empty string")
    return value


def _digest(value: Any, path: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise Exact17PackageError(f"{path} must be a lowercase SHA-256 digest")
    return value


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"non-finite JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            parse_constant=reject_constant,
            object_pairs_hook=reject_duplicates,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        RecursionError,
        ValueError,
    ) as exc:
        raise Exact17PackageError(f"{source} is not strict JSON") from exc
    return _mapping(value, source)


def _normalized_repo_path(value: Any, path: str) -> str:
    text = _string(value, path)
    pure = PurePosixPath(text)
    if (
        pure.is_absolute()
        or not pure.parts
        or pure.as_posix() != text
        or "\\" in text
        or any(part in {"", ".", ".."} for part in pure.parts)
    ):
        raise Exact17PackageError(f"{path} must be a normalized repo-relative path")
    return text


def _input_relative_path(path: Path, *, repo_root: Path, expected: str) -> Path:
    absolute = Path(os.path.abspath(path))
    try:
        relative = absolute.relative_to(repo_root)
    except ValueError as exc:
        raise Exact17PackageError("package input is outside repo_root") from exc
    if relative.as_posix() != expected:
        if "source-faithful-cap9-direct-cnf-v14b-" in relative.as_posix():
            raise Exact17PackageError(
                "the valid v14b successor is deferred and unsupported by this "
                "v12t-only canary adapter"
            )
        if "source-faithful-cap9-direct-cnf-v12-" in relative.as_posix():
            raise Exact17PackageError(
                "the incomplete non-transitive v12 diagnostic export is unsupported; "
                "corrected v12t required"
            )
        if "source-faithful-cap9-direct-cnf-v15-" in relative.as_posix():
            raise Exact17PackageError(
                "the PASS v15 export is an unsupported non-transitive candidate-v2 "
                "shape; corrected v12t required"
            )
        raise Exact17PackageError(
            f"unsupported exact17 candidate path {relative.as_posix()!r}; "
            f"the selected corrected v12t path is {expected!r}"
        )
    return relative


def _metadata_identity(
    metadata: os.stat_result,
) -> tuple[int, int, int, int, int, int]:
    return (
        metadata.st_dev,
        metadata.st_ino,
        metadata.st_size,
        metadata.st_mtime_ns,
        metadata.st_ctime_ns,
        metadata.st_nlink,
    )


def _open_input_root(repo_root: Path) -> int:
    if not hasattr(os, "O_NOFOLLOW"):
        raise Exact17PackageError("O_NOFOLLOW is required for exact17 ingress")
    absolute = Path(os.path.abspath(repo_root))
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    try:
        descriptor = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise Exact17PackageError("cannot safely open the repo_root anchor") from exc
    try:
        for component in absolute.parts[1:]:
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
    except OSError as exc:
        os.close(descriptor)
        raise Exact17PackageError(
            "repo_root path contains a symlink or non-directory component"
        ) from exc
    return descriptor


def _open_relative_regular(
    root_fd: int, relative: Path, *, label: str
) -> tuple[int, int]:
    if not hasattr(os, "O_NOFOLLOW"):
        raise Exact17PackageError("O_NOFOLLOW is required for exact17 ingress")
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    directory_fd = os.dup(root_fd)
    try:
        for component in relative.parts[:-1]:
            child_fd = os.open(component, directory_flags, dir_fd=directory_fd)
            os.close(directory_fd)
            directory_fd = child_fd
        descriptor = os.open(
            relative.name,
            os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
    except OSError as exc:
        os.close(directory_fd)
        raise Exact17PackageError(
            f"cannot safely open {label}; symlinks and non-regular paths are forbidden"
        ) from exc
    return descriptor, directory_fd


def _capture_regular(
    root_fd: int,
    relative: Path,
    *,
    label: str,
    maximum_bytes: int,
    on_chunk: Callable[[bytes], None] | None = None,
) -> _Snapshot:
    descriptor, directory_fd = _open_relative_regular(root_fd, relative, label=label)
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise Exact17PackageError(f"{label} is not a regular file")
        if before.st_size > maximum_bytes:
            raise Exact17PackageError(f"{label} exceeds its byte limit")
        chunks: list[bytes] = []
        digest = hashlib.sha256()
        captured_bytes = 0
        while True:
            chunk = os.read(descriptor, _READ_CHUNK_BYTES)
            if not chunk:
                break
            digest.update(chunk)
            if on_chunk is not None:
                on_chunk(chunk)
            chunks.append(chunk)
            captured_bytes += len(chunk)
            if captured_bytes > maximum_bytes:
                raise Exact17PackageError(f"{label} exceeds its byte limit")
        after = os.fstat(descriptor)
        try:
            path_after = os.stat(
                relative.name, dir_fd=directory_fd, follow_symlinks=False
            )
        except OSError as exc:
            raise Exact17PackageError(f"{label} path changed during capture") from exc
        if not stat.S_ISREG(path_after.st_mode) or (
            after.st_dev,
            after.st_ino,
        ) != (path_after.st_dev, path_after.st_ino):
            raise Exact17PackageError(f"{label} path binding changed during capture")
        if _metadata_identity(before) != _metadata_identity(after):
            raise Exact17PackageError(f"{label} changed while being captured")
        payload = b"".join(chunks)
        if len(payload) != before.st_size:
            raise Exact17PackageError(f"{label} byte count changed during capture")
        return _Snapshot(payload=payload, sha256=digest.hexdigest())
    finally:
        os.close(descriptor)
        os.close(directory_fd)


class _StreamingDimacs:
    def __init__(self) -> None:
        self._buffer = b""
        self._header: tuple[int, int] | None = None
        self._clauses = 0

    def feed(self, chunk: bytes) -> None:
        data = self._buffer + chunk
        lines = data.split(b"\n")
        self._buffer = lines.pop()
        if len(self._buffer) > _MAX_DIMACS_LINE_BYTES:
            raise Exact17PackageError("DIMACS line exceeds the safety limit")
        for line in lines:
            self._line(line)

    def finish(self) -> _DimacsDimensions:
        if self._buffer:
            self._line(self._buffer)
        if self._header is None:
            raise Exact17PackageError("DIMACS header is missing")
        variables, declared_clauses = self._header
        if self._clauses != declared_clauses:
            raise Exact17PackageError(
                "DIMACS clause count does not match the declared header"
            )
        return _DimacsDimensions(variables, self._clauses)

    def _line(self, raw_line: bytes) -> None:
        if len(raw_line) > _MAX_DIMACS_LINE_BYTES:
            raise Exact17PackageError("DIMACS line exceeds the safety limit")
        line = raw_line.strip()
        if not line or line.startswith(b"c"):
            return
        if self._header is None:
            fields = line.split()
            if len(fields) != 4 or fields[:2] != [b"p", b"cnf"]:
                raise Exact17PackageError("DIMACS must begin with one 'p cnf' header")
            variables = self._decimal(fields[2], "DIMACS variable count")
            clauses = self._decimal(fields[3], "DIMACS clause count")
            if variables == 0 or clauses == 0:
                raise Exact17PackageError(
                    "DIMACS variables and clauses must be nonzero"
                )
            self._header = (variables, clauses)
            return
        fields = line.split()
        if not fields or fields[-1] != b"0" or b"0" in fields[:-1]:
            raise Exact17PackageError(
                "each DIMACS clause must occupy one line and end with exactly one 0"
            )
        if len(fields) == 1:
            raise Exact17PackageError(
                "the selected SAT candidate cannot contain an empty clause"
            )
        assert self._header is not None
        variables = self._header[0]
        for token in fields[:-1]:
            literal = self._signed_decimal(token)
            if literal == 0 or abs(literal) > variables:
                raise Exact17PackageError(
                    "DIMACS literal is outside the declared range"
                )
        self._clauses += 1

    @staticmethod
    def _decimal(token: bytes, path: str) -> int:
        if (
            not token
            or any(byte < ord("0") or byte > ord("9") for byte in token)
            or (len(token) > 1 and token.startswith(b"0"))
        ):
            raise Exact17PackageError(f"{path} is not a canonical decimal integer")
        if len(token) > _MAX_DIMACS_INTEGER_DIGITS:
            raise Exact17PackageError(f"{path} exceeds the decimal digit limit")
        try:
            return int(token)
        except ValueError as exc:
            raise Exact17PackageError(
                f"{path} is not a canonical decimal integer"
            ) from exc

    @classmethod
    def _signed_decimal(cls, token: bytes) -> int:
        if token.startswith(b"-"):
            return -cls._decimal(token[1:], "DIMACS literal")
        return cls._decimal(token, "DIMACS literal")


def _validate_path_digest_records(
    value: Any, *, path: str, expected_length: int
) -> None:
    records = _sequence(value, path)
    if len(records) != expected_length:
        raise Exact17PackageError(
            f"{path} must contain exactly {expected_length} records"
        )
    paths: list[str] = []
    for index, item in enumerate(records):
        item_path = f"{path}[{index}]"
        record = _mapping(item, item_path)
        _exact_keys(record, frozenset({"path", "sha256"}), item_path)
        paths.append(_normalized_repo_path(record["path"], f"{item_path}.path"))
        _digest(record["sha256"], f"{item_path}.sha256")
    if paths != sorted(set(paths)):
        raise Exact17PackageError(f"{path} paths must be unique and sorted")


def _validate_digest_record(value: Any, *, path: str, expected_count: int) -> None:
    record = _mapping(value, path)
    _exact_keys(record, frozenset({"count", "square_sum", "sum", "xor"}), path)
    if _plain_int(record["count"], f"{path}.count") != expected_count:
        raise Exact17PackageError(
            f"{path}.count does not match the upstream clause block"
        )
    for key in ("square_sum", "sum", "xor"):
        _digest(record[key], f"{path}.{key}")


def _validate_manifest(
    manifest: Mapping[str, Any], *, snapshot: _Snapshot, dimensions: _DimacsDimensions
) -> dict[str, int]:
    schema = manifest.get("schema")
    if schema == "p97-rigid221-exact17-source-faithful-boolean-cnf-candidate-v2":
        raise Exact17PackageError(
            "unsupported non-transitive candidate-v2 shape (v12/v15); corrected v12t required"
        )
    _exact_keys(manifest, _MANIFEST_KEYS, "upstream_manifest")
    if schema != UPSTREAM_SCHEMA:
        raise Exact17PackageError(
            "upstream manifest is not the selected v12t candidate-v4 schema"
        )
    if manifest["scope"] != UPSTREAM_SCOPE:
        raise Exact17PackageError("upstream manifest scope mismatch")
    if manifest["cnf"] != SELECTED_CNF_PATH:
        raise Exact17PackageError("upstream manifest CNF path mismatch")
    if (
        _digest(manifest["cnf_sha256"], "upstream_manifest.cnf_sha256")
        != snapshot.sha256
    ):
        raise Exact17PackageError("upstream manifest CNF hash mismatch")
    variables = _plain_int(
        manifest["variables"], "upstream_manifest.variables", minimum=1
    )
    clauses = _plain_int(manifest["clauses"], "upstream_manifest.clauses", minimum=1)
    if (variables, clauses) != (dimensions.num_variables, dimensions.num_clauses):
        raise Exact17PackageError("upstream manifest dimensions do not match DIMACS")
    if (
        _plain_int(manifest["order_index"], "upstream_manifest.order_index") != 0
        or _plain_int_array(manifest["order"], "upstream_manifest.order")
        != SELECTED_ORDER
    ):
        raise Exact17PackageError(
            "upstream manifest does not bind selected normalized order 0"
        )
    if (
        _plain_int_array(
            manifest["anonymous_positions"],
            "upstream_manifest.anonymous_positions",
        )
        != SELECTED_ANONYMOUS_POSITIONS
    ):
        raise Exact17PackageError("upstream manifest anonymous positions mismatch")
    if manifest["transitive_two_circle"] is not True:
        raise Exact17PackageError("transitive_two_circle must be true")
    if manifest["learned_replay"] != "verified":
        raise Exact17PackageError("upstream learned replay status must be verified")

    block_input = _mapping(manifest["clause_blocks"], "upstream_manifest.clause_blocks")
    _exact_keys(block_input, _CLAUSE_BLOCK_KEYS, "upstream_manifest.clause_blocks")
    blocks = {
        key: _plain_int(value, f"upstream_manifest.clause_blocks.{key}")
        for key, value in block_input.items()
    }
    if sum(blocks.values()) != clauses:
        raise Exact17PackageError("upstream clause blocks do not sum to DIMACS clauses")
    if blocks["source_coverage"] == 0:
        raise Exact17PackageError("source_coverage clause block must be nonzero")
    for key in _REQUIRED_TRANSITIVE_BLOCKS:
        if blocks[key] == 0:
            raise Exact17PackageError(f"required clause block {key!r} is empty")

    source_hashes = _mapping(
        manifest["source_hashes"], "upstream_manifest.source_hashes"
    )
    _exact_keys(
        source_hashes, _MANIFEST_SOURCE_HASH_KEYS, "upstream_manifest.source_hashes"
    )
    for key, value in source_hashes.items():
        _digest(value, f"upstream_manifest.source_hashes.{key}")

    metadata = _mapping(
        manifest["transitive_two_circle_metadata"],
        "upstream_manifest.transitive_two_circle_metadata",
    )
    _exact_keys(
        metadata,
        _TRANSITIVE_METADATA_KEYS,
        "upstream_manifest.transitive_two_circle_metadata",
    )
    normalized_metadata = {
        key: _plain_int(
            value, f"upstream_manifest.transitive_two_circle_metadata.{key}", minimum=1
        )
        for key, value in metadata.items()
    }
    if (
        normalized_metadata["forbidden_cores"]
        != blocks["transitive_two_circle_bisector"]
    ):
        raise Exact17PackageError("transitive two-circle metadata count mismatch")
    if (
        normalized_metadata["five_point_forbidden_cores"]
        != blocks["transitive_convex_five_point"]
    ):
        raise Exact17PackageError("transitive five-point metadata count mismatch")
    edge_variables = len(SELECTED_ORDER) * (len(SELECTED_ORDER) - 1) // 2
    expected_comparisons = edge_variables * (edge_variables - 1) // 2
    if normalized_metadata["distance_label_bits"] != (edge_variables - 1).bit_length():
        raise Exact17PackageError("transitive distance-label bit width mismatch")
    if normalized_metadata["edge_pair_comparisons"] != expected_comparisons:
        raise Exact17PackageError("transitive edge-pair comparison count mismatch")
    if (
        normalized_metadata["distance_label_variables"]
        != edge_variables * normalized_metadata["distance_label_bits"]
    ):
        raise Exact17PackageError("transitive distance-label variable count mismatch")
    if (
        normalized_metadata["comparison_xor_variables"]
        != normalized_metadata["edge_pair_comparisons"]
        * normalized_metadata["distance_label_bits"]
    ):
        raise Exact17PackageError("transitive comparison-XOR variable count mismatch")

    learned_kinds = _mapping(
        manifest["learned_record_kinds"], "upstream_manifest.learned_record_kinds"
    )
    _exact_keys(
        learned_kinds,
        frozenset({"formalized-bank", "weighted-kalmanson"}),
        "upstream_manifest.learned_record_kinds",
    )
    for key, value in learned_kinds.items():
        _plain_int(value, f"upstream_manifest.learned_record_kinds.{key}")

    _validate_path_digest_records(
        manifest["analyses"], path="upstream_manifest.analyses", expected_length=44
    )
    _validate_path_digest_records(
        manifest["artifacts"], path="upstream_manifest.artifacts", expected_length=1
    )

    cut_admission = _mapping(
        manifest["cut_admission"], "upstream_manifest.cut_admission"
    )
    cut_keys = frozenset(
        {
            "direct_five_ccw_three_rows",
            "direct_shared_middle_endpoint_pair",
            "direct_six_ccw_two_k2_three_rows",
            "two_rows_shared_late_pair",
        }
    )
    _exact_keys(cut_admission, cut_keys, "upstream_manifest.cut_admission")
    for key, item in cut_admission.items():
        path = f"upstream_manifest.cut_admission.{key}"
        record = _mapping(item, path)
        expected_keys = {"clauses", "lean_consumer", "orientation_scope"}
        if key == "two_rows_shared_late_pair":
            expected_keys.add("antecedent")
        _exact_keys(record, frozenset(expected_keys), path)
        if _plain_int(record["clauses"], f"{path}.clauses") != blocks[key]:
            raise Exact17PackageError(f"{path}.clauses mismatch")
        for field in expected_keys - {"clauses"}:
            _string(record[field], f"{path}.{field}")
    return blocks


def _validate_report(
    report: Mapping[str, Any],
    *,
    manifest: Mapping[str, Any],
    manifest_snapshot: _Snapshot,
    cnf_snapshot: _Snapshot,
    structural_snapshot: _Snapshot,
    dimensions: _DimacsDimensions,
    structural_dimensions: _DimacsDimensions,
    blocks: Mapping[str, int],
) -> None:
    _exact_keys(report, _VALIDATION_KEYS, "validation_report")
    if report["schema"] != VALIDATION_SCHEMA:
        raise Exact17PackageError("validation report has the wrong schema")
    for key in ("status", "cadical_model_roundtrip", "candidate_exact_regeneration"):
        if report[key] != "PASS":
            raise Exact17PackageError(f"validation_report.{key} must be PASS")
    if report["candidate_cnf"] != SELECTED_CNF_PATH:
        raise Exact17PackageError("validation report candidate CNF path mismatch")
    if report["candidate_manifest"] != SELECTED_MANIFEST_PATH:
        raise Exact17PackageError("validation report candidate manifest path mismatch")
    if report["structural_cnf"] != SELECTED_STRUCTURAL_CNF_PATH:
        raise Exact17PackageError("validation report structural CNF path mismatch")
    if (
        _digest(
            report["candidate_cnf_sha256"], "validation_report.candidate_cnf_sha256"
        )
        != cnf_snapshot.sha256
    ):
        raise Exact17PackageError("validation report candidate CNF hash mismatch")
    if (
        _digest(
            report["candidate_manifest_sha256"],
            "validation_report.candidate_manifest_sha256",
        )
        != manifest_snapshot.sha256
    ):
        raise Exact17PackageError("validation report candidate manifest hash mismatch")
    if (
        _digest(
            report["structural_cnf_sha256"],
            "validation_report.structural_cnf_sha256",
        )
        != structural_snapshot.sha256
    ):
        raise Exact17PackageError("validation report structural CNF hash mismatch")
    if (
        _plain_int(report["variables"], "validation_report.variables", minimum=1)
        != dimensions.num_variables
    ):
        raise Exact17PackageError("validation report variable count mismatch")
    structural_clauses = _plain_int(
        report["structural_clauses"], "validation_report.structural_clauses", minimum=1
    )
    if structural_clauses != structural_dimensions.num_clauses:
        raise Exact17PackageError("validation report structural clause count mismatch")
    if structural_clauses != sum(blocks[key] for key in _STRUCTURAL_BLOCK_KEYS):
        raise Exact17PackageError("structural clause-block cross-binding mismatch")
    _plain_int(
        report["source_z3_models_checked"],
        "validation_report.source_z3_models_checked",
        minimum=1,
    )
    if (
        _plain_int(report["order_index"], "validation_report.order_index") != 0
        or _plain_int_array(report["order"], "validation_report.order")
        != SELECTED_ORDER
    ):
        raise Exact17PackageError("validation report normalized order mismatch")
    if (
        _plain_int_array(
            report["anonymous_positions"],
            "validation_report.anonymous_positions",
        )
        != SELECTED_ANONYMOUS_POSITIONS
    ):
        raise Exact17PackageError("validation report anonymous positions mismatch")
    if report["order"] != manifest["order"]:
        raise Exact17PackageError(
            "validation report order does not match upstream manifest"
        )

    source_hashes = _mapping(report["source_hashes"], "validation_report.source_hashes")
    _exact_keys(
        source_hashes, _VALIDATION_SOURCE_HASH_KEYS, "validation_report.source_hashes"
    )
    manifest_hashes = _mapping(
        manifest["source_hashes"], "upstream_manifest.source_hashes"
    )
    for report_key, manifest_key in _SOURCE_HASH_CROSSWALK.items():
        digest = _digest(
            source_hashes[report_key], f"validation_report.source_hashes.{report_key}"
        )
        if digest != manifest_hashes[manifest_key]:
            raise Exact17PackageError(
                f"validation source hash mismatch for {report_key}"
            )

    static_digests = _mapping(
        report["static_clause_digests"], "validation_report.static_clause_digests"
    )
    _exact_keys(
        static_digests, _STATIC_DIGEST_KEYS, "validation_report.static_clause_digests"
    )
    for key, value in static_digests.items():
        _validate_digest_record(
            value,
            path=f"validation_report.static_clause_digests.{key}",
            expected_count=blocks[key],
        )
    transitive_digests = _mapping(
        report["transitive_clause_digests"],
        "validation_report.transitive_clause_digests",
    )
    _exact_keys(
        transitive_digests,
        frozenset({"convex_five_point"}),
        "validation_report.transitive_clause_digests",
    )
    _validate_digest_record(
        transitive_digests["convex_five_point"],
        path="validation_report.transitive_clause_digests.convex_five_point",
        expected_count=blocks["transitive_convex_five_point"],
    )
    if report["truth_table_assignments"] != _TRUTH_TABLE_ASSIGNMENTS:
        raise Exact17PackageError(
            "validation report truth-table assignment census mismatch"
        )


def _manifest_report_cross_binding_coverage() -> dict[str, Any]:
    """Describe exactly what frozen v12t report fields semantically cross-bind."""

    return {
        "complete": False,
        "inventory_granularity": (
            "TOP_LEVEL_FIELDS_WITH_PARTIAL_MAPS_EXPANDED_TO_LEAVES"
        ),
        "scope": "UPSTREAM_MANIFEST_FIELDS_VS_FROZEN_V12T_VALIDATION_REPORT",
        "report_cross_validated_manifest_fields": sorted(
            _REPORT_CROSS_VALIDATED_MANIFEST_FIELDS
        ),
        "aggregate_only_relations": [
            {
                "manifest_fields": sorted(
                    f"clause_blocks.{key}" for key in _STRUCTURAL_BLOCK_KEYS
                ),
                "relation": "SUM_EQUALS",
                "validation_report_field": "structural_clauses",
            }
        ],
        "manifest_fields_authenticated_only_by_exact_pinned_bytes": sorted(
            _PINNED_BYTES_ONLY_MANIFEST_FIELDS
        ),
        "whole_manifest_byte_authentication": {
            "package_identity_pin": True,
            "validation_report_field": "candidate_manifest_sha256",
        },
    }


def _open_output_dir(output_dir: Path) -> int:
    if not hasattr(os, "O_NOFOLLOW"):
        raise Exact17PackageError("O_NOFOLLOW is required for exact17 output")
    absolute = Path(os.path.abspath(output_dir))
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            try:
                os.mkdir(component, mode=0o700, dir_fd=descriptor)
            except FileExistsError:
                pass
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
    except OSError as exc:
        os.close(descriptor)
        raise Exact17PackageError(
            "output path contains a symlink or non-directory component"
        ) from exc
    except BaseException:
        os.close(descriptor)
        raise
    return descriptor


def _read_output(directory_fd: int, name: str) -> _OutputSnapshot:
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise Exact17PackageError(f"cannot safely read output artifact {name}") from exc
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise Exact17PackageError(
                f"output artifact {name} is not a private regular file"
            )
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, _READ_CHUNK_BYTES):
            chunks.append(chunk)
        after = os.fstat(descriptor)
        try:
            path_after = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        except OSError as exc:
            raise Exact17PackageError(
                f"output artifact path changed during verification: {name}"
            ) from exc
        if not stat.S_ISREG(path_after.st_mode) or (
            after.st_dev,
            after.st_ino,
        ) != (path_after.st_dev, path_after.st_ino):
            raise Exact17PackageError(
                f"output artifact path binding changed during verification: {name}"
            )
        if _metadata_identity(before) != _metadata_identity(after):
            raise Exact17PackageError(
                f"output artifact changed during verification: {name}"
            )
        payload = b"".join(chunks)
        if len(payload) != before.st_size:
            raise Exact17PackageError(
                f"output artifact byte count changed during verification: {name}"
            )
        return _OutputSnapshot(
            payload=payload,
            identity=_metadata_identity(after),
        )
    finally:
        os.close(descriptor)


def _install_output(
    directory_fd: int, name: str, payload: bytes
) -> tuple[int, int, int, int, int, int]:
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=directory_fd,
        )
    except FileExistsError as exc:
        raise Exact17PackageError(
            f"output artifact appeared concurrently: {name}"
        ) from exc
    except OSError as exc:
        raise Exact17PackageError(
            f"cannot safely install output artifact {name}"
        ) from exc
    try:
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise OSError("output write made no progress")
            offset += written
        os.fsync(descriptor)
        metadata = os.fstat(descriptor)
        if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
            raise Exact17PackageError(f"output artifact changed during install: {name}")
        installed_metadata = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if not stat.S_ISREG(installed_metadata.st_mode) or (
            installed_metadata.st_dev,
            installed_metadata.st_ino,
        ) != (metadata.st_dev, metadata.st_ino):
            raise Exact17PackageError(f"output artifact changed before install: {name}")
        return _metadata_identity(metadata)
    except OSError as exc:
        raise Exact17PackageError(f"failed to install output artifact {name}") from exc
    finally:
        os.close(descriptor)


def _acquire_writer_lock(
    directory_fd: int,
) -> tuple[int, tuple[int, int, int, int, int, int]]:
    try:
        descriptor = os.open(
            _OUTPUT_LOCK_NAME,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=directory_fd,
        )
    except FileExistsError as exc:
        raise Exact17PackageError(
            "exact17 output cooperative writer lock already exists"
        ) from exc
    except OSError as exc:
        raise Exact17PackageError(
            "cannot safely acquire exact17 output cooperative writer lock"
        ) from exc
    try:
        metadata = os.fstat(descriptor)
        try:
            path_metadata = os.stat(
                _OUTPUT_LOCK_NAME, dir_fd=directory_fd, follow_symlinks=False
            )
        except OSError as exc:
            raise Exact17PackageError(
                "exact17 output cooperative writer lock changed during acquisition"
            ) from exc
        if (
            not stat.S_ISREG(metadata.st_mode)
            or metadata.st_nlink != 1
            or not stat.S_ISREG(path_metadata.st_mode)
            or (metadata.st_dev, metadata.st_ino)
            != (path_metadata.st_dev, path_metadata.st_ino)
        ):
            raise Exact17PackageError(
                "exact17 output cooperative writer lock is not private"
            )
        return descriptor, _metadata_identity(metadata)
    except BaseException:
        os.close(descriptor)
        raise


def _verify_writer_lock(
    directory_fd: int,
    descriptor: int,
    identity: tuple[int, int, int, int, int, int],
) -> None:
    metadata = os.fstat(descriptor)
    try:
        path_metadata = os.stat(
            _OUTPUT_LOCK_NAME, dir_fd=directory_fd, follow_symlinks=False
        )
    except OSError as exc:
        raise Exact17PackageError(
            "exact17 output cooperative writer lock disappeared"
        ) from exc
    if (
        not stat.S_ISREG(metadata.st_mode)
        or not stat.S_ISREG(path_metadata.st_mode)
        or metadata.st_nlink != 1
        or _metadata_identity(metadata) != identity
        or _metadata_identity(path_metadata) != identity
    ):
        raise Exact17PackageError("exact17 output cooperative writer lock was replaced")


def _release_writer_lock(
    directory_fd: int,
    descriptor: int,
    identity: tuple[int, int, int, int, int, int],
) -> None:
    # This identity check is the fail-closed boundary for cooperative writers.
    # A process with hostile concurrent write access can still race any pathname
    # cleanup primitive; callers must custody the directory after this returns.
    _verify_writer_lock(directory_fd, descriptor, identity)
    try:
        os.unlink(_OUTPUT_LOCK_NAME, dir_fd=directory_fd)
    except OSError as exc:
        raise Exact17PackageError(
            "exact17 output cooperative writer lock changed during release"
        ) from exc
    metadata = os.fstat(descriptor)
    if (
        not stat.S_ISREG(metadata.st_mode)
        or (metadata.st_dev, metadata.st_ino) != identity[:2]
        or metadata.st_nlink != 0
    ):
        raise Exact17PackageError(
            "exact17 output cooperative writer lock changed during release"
        )
    try:
        os.stat(_OUTPUT_LOCK_NAME, dir_fd=directory_fd, follow_symlinks=False)
    except FileNotFoundError:
        return
    raise Exact17PackageError(
        "a replacement cooperative writer lock appeared during release"
    )


def _verify_emitted_outputs(
    directory_fd: int,
    files: Mapping[str, bytes],
    bindings: Mapping[str, tuple[int, int, int, int, int, int]],
    *,
    lock_descriptor: int,
    lock_identity: tuple[int, int, int, int, int, int],
) -> None:
    expected_entries = set(files) | {_OUTPUT_LOCK_NAME}
    if set(os.listdir(directory_fd)) != expected_entries:
        raise Exact17PackageError("output directory changed during final verification")
    _verify_writer_lock(directory_fd, lock_descriptor, lock_identity)
    for name, payload in files.items():
        snapshot = _read_output(directory_fd, name)
        if snapshot.payload != payload or snapshot.identity != bindings[name]:
            raise Exact17PackageError(f"output artifact verification failed: {name}")
    if set(os.listdir(directory_fd)) != expected_entries:
        raise Exact17PackageError("output directory changed during final verification")
    _verify_writer_lock(directory_fd, lock_descriptor, lock_identity)


def _emit(output_dir: Path, files: Mapping[str, bytes]) -> None:
    """Emit under a lock honored by cooperative writers.

    Trust boundary: every process with write access is trusted to honor the
    no-follow/O_EXCL cooperative lock. Post-fsync verification protects the
    package while this process owns that lock; no local package can make a
    directory writable by a hostile process immutable after this returns.
    """

    directory_fd = _open_output_dir(output_dir)
    lock_descriptor: int | None = None
    lock_identity: tuple[int, int, int, int, int, int] | None = None
    try:
        lock_descriptor, lock_identity = _acquire_writer_lock(directory_fd)
        entries = set(os.listdir(directory_fd)) - {_OUTPUT_LOCK_NAME}
        extras = sorted(entries - files.keys())
        if extras:
            raise Exact17PackageError(f"output directory has extra entries: {extras}")
        bindings: dict[str, tuple[int, int, int, int, int, int]] = {}
        for name, payload in files.items():
            if name in entries:
                snapshot = _read_output(directory_fd, name)
                if snapshot.payload != payload:
                    raise Exact17PackageError(
                        f"refusing different existing artifact: {name}"
                    )
                bindings[name] = snapshot.identity
        for name, payload in files.items():
            if name not in entries:
                bindings[name] = _install_output(directory_fd, name, payload)
        _verify_emitted_outputs(
            directory_fd,
            files,
            bindings,
            lock_descriptor=lock_descriptor,
            lock_identity=lock_identity,
        )
        os.fsync(directory_fd)
        _verify_emitted_outputs(
            directory_fd,
            files,
            bindings,
            lock_descriptor=lock_descriptor,
            lock_identity=lock_identity,
        )
    finally:
        try:
            if lock_descriptor is not None and lock_identity is not None:
                _release_writer_lock(directory_fd, lock_descriptor, lock_identity)
        finally:
            if lock_descriptor is not None:
                os.close(lock_descriptor)
            os.close(directory_fd)


def package_exact17(
    *,
    cnf_path: Path,
    upstream_manifest_path: Path,
    validation_report_path: Path,
    output_dir: Path,
    repo_root: Path,
) -> PackageResult:
    """Validate and emit the one selected corrected-v12t ingress package."""

    repo_root = Path(os.path.abspath(repo_root))
    cnf_relative = _input_relative_path(
        cnf_path, repo_root=repo_root, expected=SELECTED_CNF_PATH
    )
    manifest_relative = _input_relative_path(
        upstream_manifest_path, repo_root=repo_root, expected=SELECTED_MANIFEST_PATH
    )
    validation_relative = _input_relative_path(
        validation_report_path, repo_root=repo_root, expected=SELECTED_VALIDATION_PATH
    )
    structural_relative = Path(SELECTED_STRUCTURAL_CNF_PATH)
    root_fd = _open_input_root(repo_root)
    try:
        scanner = _StreamingDimacs()
        cnf_snapshot = _capture_regular(
            root_fd,
            cnf_relative,
            label="selected CNF",
            maximum_bytes=_MAX_CNF_BYTES,
            on_chunk=scanner.feed,
        )
        dimensions = scanner.finish()
        structural_scanner = _StreamingDimacs()
        structural_snapshot = _capture_regular(
            root_fd,
            structural_relative,
            label="selected structural CNF",
            maximum_bytes=_MAX_CNF_BYTES,
            on_chunk=structural_scanner.feed,
        )
        structural_dimensions = structural_scanner.finish()
        manifest_snapshot = _capture_regular(
            root_fd,
            manifest_relative,
            label="upstream manifest",
            maximum_bytes=_MAX_JSON_BYTES,
        )
        validation_snapshot = _capture_regular(
            root_fd,
            validation_relative,
            label="validation report",
            maximum_bytes=_MAX_JSON_BYTES,
        )
    finally:
        os.close(root_fd)

    identity = SELECTED_V12T_IDENTITY
    if (
        cnf_snapshot.sha256 != identity.cnf_sha256
        or len(cnf_snapshot.payload) != identity.cnf_bytes
        or dimensions.num_variables != identity.num_variables
        or dimensions.num_clauses != identity.num_clauses
    ):
        raise Exact17PackageError(
            "CNF identity is not the selected corrected v12t artifact"
        )
    if (
        structural_snapshot.sha256 != identity.structural_cnf_sha256
        or len(structural_snapshot.payload) != identity.structural_cnf_bytes
        or structural_dimensions.num_variables != identity.structural_num_variables
        or structural_dimensions.num_clauses != identity.structural_num_clauses
    ):
        raise Exact17PackageError(
            "structural CNF identity is not the selected corrected v12t artifact"
        )
    if manifest_snapshot.sha256 != identity.manifest_sha256:
        raise Exact17PackageError(
            "upstream manifest identity is not the selected corrected v12t artifact"
        )
    if validation_snapshot.sha256 != identity.validation_sha256:
        raise Exact17PackageError(
            "validation report identity is not the selected corrected v12t artifact"
        )

    manifest = _strict_json(manifest_snapshot.payload, source="upstream manifest")
    report = _strict_json(validation_snapshot.payload, source="validation report")
    blocks = _validate_manifest(manifest, snapshot=cnf_snapshot, dimensions=dimensions)
    _validate_report(
        report,
        manifest=manifest,
        manifest_snapshot=manifest_snapshot,
        cnf_snapshot=cnf_snapshot,
        structural_snapshot=structural_snapshot,
        dimensions=dimensions,
        structural_dimensions=structural_dimensions,
        blocks=blocks,
    )

    order_record = {
        "schema": ORDER_SCHEMA,
        "semantic_status": "ONE_NORMALIZED_ORDER_ONLY",
        "scope": PACKAGE_SCOPE,
        "order_index": 0,
        "order": SELECTED_ORDER,
        "anonymous_positions": SELECTED_ANONYMOUS_POSITIONS,
        "aggregate_order_case_coverage": False,
        "upstream_manifest_sha256": manifest_snapshot.sha256,
        "validation_report_sha256": validation_snapshot.sha256,
    }
    order_bytes = canonical_json_bytes(order_record)
    order_sha256 = sha256_bytes(order_bytes)
    variable_map = {
        "schema": VARIABLE_MAP_SCHEMA,
        "semantic_status": VARIABLE_MAP_STATUS,
        "scope": PACKAGE_SCOPE,
        "num_variables": dimensions.num_variables,
        "named_variables": [],
        "opaque_variable_ranges": [[1, dimensions.num_variables]],
        "coverage": {
            "named_variables": 0,
            "opaque_variables": dimensions.num_variables,
            "full_variable_map_custody": False,
        },
        "source": {
            "upstream_manifest_sha256": manifest_snapshot.sha256,
            "current_executable_producer_byte_provenance": False,
        },
    }
    variable_map_bytes = canonical_json_bytes(variable_map)
    variable_map_sha256 = sha256_bytes(variable_map_bytes)
    ingress = {
        "schema": INGRESS_SCHEMA,
        "scope": PACKAGE_SCOPE,
        "cnf_sha256": cnf_snapshot.sha256,
        "structural_cnf_sha256": structural_snapshot.sha256,
        "upstream_manifest_sha256": manifest_snapshot.sha256,
        "validation_report_sha256": validation_snapshot.sha256,
        "order_sha256": order_sha256,
    }
    ingress_bytes = canonical_json_bytes(ingress)
    ingress_sha256 = sha256_bytes(ingress_bytes)
    manifest_report_coverage = _manifest_report_cross_binding_coverage()
    claims = {
        "exact_cnf_byte_identity": True,
        "exact_structural_cnf_byte_identity": True,
        "exact_upstream_manifest_byte_identity": True,
        "exact_validation_report_byte_identity": True,
        "complete_manifest_report_cross_binding": False,
        "current_executable_producer_byte_provenance": False,
        "full_variable_map_custody": False,
        "source_entitlement": False,
        "aggregate_order_case_coverage": False,
        "universal_lift": False,
        "theorem_closure": False,
        "daemon_attestation": False,
    }
    producer = {
        "schema": PRODUCER_SCHEMA,
        "semantic_status": "FINITE_ARCHIVED_EXACT17_V12T_INGRESS",
        "scope": PACKAGE_SCOPE,
        "source": {
            "live_leaf": LIVE_LEAF,
            "source_theorem": SOURCE_THEOREM,
            "finite_schema": manifest["schema"],
            "order_index": 0,
            "order": SELECTED_ORDER,
            "upstream_scope": manifest["scope"],
        },
        "provenance": {
            "ingress_identity_sha256": ingress_sha256,
            "upstream_source_hashes": manifest["source_hashes"],
            "source_hash_cross_validation": {
                "status": "PARTIAL",
                "validated_manifest_keys": sorted(_SOURCE_HASH_CROSSWALK.values()),
                "unvalidated_manifest_keys": sorted(
                    _MANIFEST_SOURCE_HASH_KEYS - set(_SOURCE_HASH_CROSSWALK.values())
                ),
            },
            "manifest_report_cross_binding_coverage": manifest_report_coverage,
            "claims": claims,
        },
        "artifacts": {
            "cnf": {
                "path": "discovery.cnf",
                "bytes": len(cnf_snapshot.payload),
                "sha256": cnf_snapshot.sha256,
                "num_variables": dimensions.num_variables,
                "num_clauses": dimensions.num_clauses,
            },
            "structural_cnf": {
                "path": "structural-roundtrip.cnf",
                "bytes": len(structural_snapshot.payload),
                "sha256": structural_snapshot.sha256,
                "num_variables": structural_dimensions.num_variables,
                "num_clauses": structural_dimensions.num_clauses,
            },
            "upstream_manifest": {
                "path": "upstream-manifest.json",
                "bytes": len(manifest_snapshot.payload),
                "sha256": manifest_snapshot.sha256,
            },
            "validation_report": {
                "path": "validation-report.json",
                "bytes": len(validation_snapshot.payload),
                "sha256": validation_snapshot.sha256,
            },
            "ingress_identity": {
                "path": "ingress-identity.json",
                "sha256": ingress_sha256,
            },
            "variable_map": {
                "path": "variable-map.json",
                "sha256": variable_map_sha256,
                "coverage": VARIABLE_MAP_STATUS,
            },
            "order": {"path": "order.json", "sha256": order_sha256},
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    producer_bytes = canonical_json_bytes(producer)
    producer_sha256 = sha256_bytes(producer_bytes)
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": WAVE_ID,
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": LIVE_LEAF,
            "ingress_hypotheses_sha256": ingress_sha256,
            "finite_schema": manifest["schema"],
            "cardinality_scope": CARDINALITY_SCOPE,
            "source_theorem": SOURCE_THEOREM,
        },
        "encoding": {
            "cnf_sha256": cnf_snapshot.sha256,
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": dimensions.num_variables,
            "num_clauses": dimensions.num_clauses,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": order_sha256,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    try:
        validate_wave_manifest(wave)
    except WaveContractError as exc:
        raise Exact17PackageError(f"emitted wave manifest is invalid: {exc}") from exc
    wave_bytes = canonical_json_bytes(wave)
    result_payload = {
        "schema": PACKAGE_RESULT_SCHEMA,
        "semantic_status": "FINITE_INGRESS_PACKET_READY",
        "scope": PACKAGE_SCOPE,
        "artifacts": {
            "cnf_sha256": cnf_snapshot.sha256,
            "structural_cnf_sha256": structural_snapshot.sha256,
            "upstream_manifest_sha256": manifest_snapshot.sha256,
            "validation_report_sha256": validation_snapshot.sha256,
            "ingress_identity_sha256": ingress_sha256,
            "variable_map_sha256": variable_map_sha256,
            "order_sha256": order_sha256,
            "producer_manifest_sha256": producer_sha256,
            "wave_manifest_sha256": sha256_bytes(wave_bytes),
        },
        "manifest_report_cross_binding_coverage": manifest_report_coverage,
        "claims": claims,
    }
    result_bytes = canonical_json_bytes(result_payload)
    files = {
        "discovery.cnf": cnf_snapshot.payload,
        "structural-roundtrip.cnf": structural_snapshot.payload,
        "upstream-manifest.json": manifest_snapshot.payload,
        "validation-report.json": validation_snapshot.payload,
        "ingress-identity.json": ingress_bytes,
        "variable-map.json": variable_map_bytes,
        "order.json": order_bytes,
        "producer-manifest.json": producer_bytes,
        "wave-manifest.json": wave_bytes,
        "package-result.json": result_bytes,
    }
    _emit(output_dir, files)
    return PackageResult(output_dir=output_dir, payload=result_payload)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--upstream-manifest", type=Path, required=True)
    parser.add_argument("--validation-report", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument(
        "--repo-root", type=Path, default=Path(__file__).resolve().parents[2]
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        result = package_exact17(
            cnf_path=args.cnf,
            upstream_manifest_path=args.upstream_manifest,
            validation_report_path=args.validation_report,
            output_dir=args.output_dir,
            repo_root=args.repo_root,
        )
    except (OSError, Exact17PackageError) as exc:
        print(f"phase3_piqd_exact17_package: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result.as_dict()).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
