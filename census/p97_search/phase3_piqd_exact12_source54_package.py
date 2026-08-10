"""Strict PIQD custody package for the frozen exact-12 source54 checkpoint.

This module is deliberately additive.  It reconstructs one historical finite
checkpoint without invoking a solver and accepts it only when the regenerated
DIMACS bytes equal the pinned source54 artifact byte-for-byte.  Nothing here
asserts SAT, UNSAT, source entitlement, a universal theorem, or Lean closure.
"""

from __future__ import annotations

import argparse
import io
import json
import os
import stat
import threading
import types
from collections import Counter
from collections.abc import Iterable, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any

from census.card_head import exact12_v14_ordered_coverage as ordered_coverage_module
from census.card_head import exact12_v14_source_order_bank as source_order_bank_module
from census.card_head import exact12_v14_structural_cegar as structural
from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_source_order_bank import install_source_order_bank
from census.card_head.exact12_v14_valuation import (
    added_constraints_hold,
    decode_blockers,
)
from census.card_head.source_faithful_candidate_surface import (
    source_faithful_cube_ok,
)
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    SAT_MEANS_COUNTEREXAMPLE,
    WAVE_SCHEMA,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_wave_manifest,
)

PACKAGE_SCHEMA = "p97-piqd-exact12-source54-package/v1"
INDEX_SCHEMA = "p97-piqd-exact12-source54-package-index/v1"
PRODUCER_SCHEMA = "p97-piqd-exact12-source54-producer/v1"
VARIABLE_MAP_SCHEMA = "p97-piqd-exact12-source54-total-variable-map/v1"
ORDER_SCHEMA = "p97-piqd-exact12-source54-order/v1"
CELL_INDEX = 8
SOURCE_ORDER_CUTS = 54
NUM_VARIABLES = 44_855
NUM_CLAUSES = 732_131
CNF_BYTES = 17_227_349
CNF_SHA256 = "47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4"
JOURNAL_RECORDS = 871
JOURNAL_BYTES = 126_296_724
JOURNAL_SHA256 = "24be15d8040bd5d3d15a4c71346592110bfd09089d5bde6fee5f6218809d0de6"
JOB_SHA256 = "3c873b1591a7a1f2a2f4b30e12288000ccb8b91713a58b5738e6a4e91154e945"
DETECTOR_SHA256 = "89ba37a9c3f18edb2cf33cd0098820098e02e4599fbd1ba47794d8e31fb0f94b"
TERMINAL_RECORD_SHA256 = (
    "8cc37d316c243746613b1f65b841356c06d7b3d07696ca38282bf8f2c9215f10"
)
SOURCE54_BINDINGS_SHA256 = (
    "6565fa5e31da831d7f93f88355c0e687e21d695f6bf87a44401b2a66183e85ff"
)
SOURCE54_BANK_BODY_SHA256 = (
    "4fe83285d1336a8aaa21906cfa460893ab2eb8fa8b3f2318c98fd0f7cfc0dbd9"
)

CNF_RELATIVE = (
    "scratch/rigid221-sourceheavy-anchor/"
    "exact12-v14-source54-static-cell8-r1/static-duplicate-center.cnf"
)
JOURNAL_RELATIVE = (
    "scratch/rigid221-sourceheavy-anchor/exact12-v14-source54-cell8-migrated-r1.jsonl"
)
STATIC_ROOT = "scratch/rigid221-sourceheavy-anchor/exact12-v14-source54-static-cell8-r1"
GENERATOR_RELATIVE = (
    "scratch/rigid221-sourceheavy-anchor/"
    "exact12-v14-wave-e5f1579d-source23-seeded-plus100-c0000-0011-r1/"
    "benchmark_static_duplicate_center_encoding.py"
)
LEAN_SOURCE_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8TwentyThirdPositiveCut.lean"
)

_PINNED_INPUTS: tuple[tuple[str, int, str], ...] = (
    (CNF_RELATIVE, CNF_BYTES, CNF_SHA256),
    (JOURNAL_RELATIVE, JOURNAL_BYTES, JOURNAL_SHA256),
    (
        f"{STATIC_ROOT}/summary.json",
        1_083,
        "af1f21566f188163f430fd8095b61b24c4ba6bbca4bcbf088c13d6d8e26a70ff",
    ),
    (
        f"{STATIC_ROOT}/survivor-cube.json",
        504,
        "92cd9dd872e60ccded0b604d737187384d26f37cf88bbf8fa36f2560fb6f57c2",
    ),
    (
        (
            "scratch/rigid221-sourceheavy-anchor/"
            "exact12-v14-source54-cell8-migration-r1.json"
        ),
        854,
        "9f2be3b36ff1ed5162cdf3b9ded8c06f62667414b60f5ab257fd57b9c4fc7fff",
    ),
    (
        f"{STATIC_ROOT}/RUN-SUMMARY.md",
        3_404,
        "07811105b7361049e8c5acd2726f6ec23b46abdcf014cf9ae4f859f19ccdc17d",
    ),
    (
        LEAN_SOURCE_RELATIVE,
        3_712,
        "7ca3e854d038dfb07c6d5b4a3e9c9b676cff19b371d96992166c93a001892750",
    ),
    (
        GENERATOR_RELATIVE,
        13_525,
        "aa61a44c72887e52e86b251dc63534617a9d91f0869ee23e82467be5280c71aa",
    ),
)

_EXTENSION_PROFILE = MappingProxyType(
    {
        "include_equal_k4": True,
        "include_equilateral_bisector": True,
        "include_three_triad": True,
        "include_perpendicular_bisector": True,
    }
)
_EXTENSION_COUNTS = {
    "edge_count": 66,
    "relation_variables": 2_145,
    "row_implication_clauses": 18_240,
    "transitivity_clauses": 137_280,
    "duplicate_center_clauses": 7_920,
    "equal_k4_clauses": 495,
    "equilateral_bisector_clauses": 95_040,
    "three_triad_clauses": 95_040,
    "perpendicular_bisector_clauses": 7_920,
    "added_variables": 2_145,
    "added_clauses": 361_935,
    "final_variables": NUM_VARIABLES,
    "final_clauses": NUM_CLAUSES,
}
_INCIDENT_COUNTS = (
    253,
    258,
    287,
    287,
    287,
    292,
    292,
    292,
    292,
    284,
    284,
    255,
    291,
    291,
    291,
    281,
    281,
    281,
    281,
    285,
    285,
    287,
    287,
    287,
    289,
    289,
    289,
    289,
    289,
    289,
    275,
    275,
    269,
    269,
    269,
    269,
    274,
    274,
    275,
    269,
    269,
    269,
    269,
    274,
    274,
    269,
    269,
    269,
    269,
    274,
    274,
    263,
    263,
    263,
    271,
    271,
    263,
    263,
    271,
    271,
    263,
    271,
    271,
    271,
    271,
    272,
)
_KIND_COUNTS = {
    "choice": 3_040,
    "one_hot_sinz": 3_040,
    "c4_sinz": 36_480,
    "cell_blocker": 50,
    "cell_source_sinz": 50,
    "cell_center_sinz": 50,
    "relation": 2_145,
}
_OUTPUT_FILES = (
    "discovery.cnf",
    "bound-job.json",
    "source-order-bank.json",
    "variable-map.json",
    "order.json",
    "producer-manifest.json",
    "wave-manifest.json",
)
_PINNED_PACKAGE_ARTIFACTS: tuple[tuple[str, int, str], ...] = (
    ("discovery.cnf", 17_227_349, CNF_SHA256),
    (
        "bound-job.json",
        26_946,
        "3c873b1591a7a1f2a2f4b30e12288000ccb8b91713a58b5738e6a4e91154e945",
    ),
    (
        "source-order-bank.json",
        1_803_145,
        "fa138c495c1f425e18a57cfb5e916eabdbe87dffb1e4e21d7488ce8eda399d4b",
    ),
    (
        "variable-map.json",
        4_429_954,
        "8360d8785b73c56e2b2fd92cacfde51da1163dcca359c9fb5dac068825fbf94c",
    ),
    (
        "order.json",
        1_176,
        "fc014da8307a58210f32b98e77c1c34e4a844c65b651d8b31e1d9da995f12265",
    ),
    (
        "producer-manifest.json",
        21_421,
        "740775cfdf6de9772a0f2541ca5f8c1e144c09238d6275e78b76051483439c9a",
    ),
    (
        "wave-manifest.json",
        1_247,
        "e4568948f8180b6b419965a0ab7f5a9f96128e37fc517fad6dbf106887af8dc1",
    ),
)
PACKAGE_INDEX_BYTES = 1_100
PACKAGE_INDEX_SHA256 = (
    "ac0ba9e938f05e847a9774d596c638d4129e583f4836d7df0879dae9da096b72"
)
_BANK_FREEZE_LOCK = threading.RLock()


class Exact12Source54PackageError(ValueError):
    """The frozen source54 custody or package contract failed closed."""


@dataclass(frozen=True)
class CapturedInput:
    """One immutable descriptor-relative source snapshot."""

    path: str
    payload: bytes
    size: int
    sha256: str
    signature: tuple[int, int, int, int, int]

    def record(self) -> dict[str, Any]:
        return {"path": self.path, "bytes": self.size, "sha256": self.sha256}


@dataclass(frozen=True)
class ReconstructedCheckpoint:
    """The exact rebuilt checkpoint; JSON metadata is recursively read-only."""

    cnf_bytes: bytes
    instance: Any
    compiled: Any
    bound_job: Mapping[str, Any]
    source_order_bank: Mapping[str, Any]
    journal_record_count: int
    terminal_record_sha256: str
    journal_clauses: frozenset[tuple[int, ...]]
    extension_counts: Mapping[str, int]
    clause_anomaly_scan: Mapping[str, int]
    inputs: Mapping[str, CapturedInput]


@dataclass(frozen=True)
class LoadedPackage:
    """Immutable bytes plus detached parsed-copy views for a runner.

    The canonical bytes in ``artifacts`` are the authority.  Each parsed
    property returns a new object, so caller mutation cannot change this
    loaded package or any later property result.
    """

    directory: Path
    artifacts: Mapping[str, bytes]

    def _json_copy(self, name: str) -> dict[str, Any]:
        value = parse_strict_json(self.artifacts[name], require_canonical=True)
        if not isinstance(value, dict):  # already established by load_package
            raise Exact12Source54PackageError(f"package {name} is not an object")
        return value

    @property
    def index(self) -> dict[str, Any]:
        return self._json_copy("package-index.json")

    @property
    def producer_manifest(self) -> dict[str, Any]:
        return self._json_copy("producer-manifest.json")

    @property
    def wave_manifest(self) -> dict[str, Any]:
        return self._json_copy("wave-manifest.json")

    @property
    def variable_map(self) -> dict[str, Any]:
        return self._json_copy("variable-map.json")


def _deep_freeze_json(value: Any) -> Any:
    if isinstance(value, Mapping):
        return MappingProxyType(
            {key: _deep_freeze_json(item) for key, item in value.items()}
        )
    if isinstance(value, (list, tuple)):
        return tuple(_deep_freeze_json(item) for item in value)
    return value


def _plain_json(value: Any) -> Any:
    if isinstance(value, Mapping):
        return {key: _plain_json(item) for key, item in value.items()}
    if isinstance(value, tuple):
        return [_plain_json(item) for item in value]
    return value


def _reject_constant(value: str) -> None:
    raise Exact12Source54PackageError(f"non-finite JSON constant: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise Exact12Source54PackageError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def parse_strict_json(payload: bytes, *, require_canonical: bool) -> Any:
    """Parse strict UTF-8 JSON, optionally requiring its canonical encoding."""

    if type(payload) is not bytes:
        raise Exact12Source54PackageError("JSON payload must be immutable bytes")
    try:
        value = json.loads(
            payload,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise Exact12Source54PackageError("payload is not strict JSON") from exc
    if require_canonical:
        try:
            canonical = canonical_json_bytes(value)
        except (TypeError, ValueError, RecursionError) as exc:
            raise Exact12Source54PackageError("payload is not strict JSON") from exc
        if canonical != payload:
            raise Exact12Source54PackageError("JSON payload is not canonical")
    return value


def _plain_relative(path: str) -> tuple[str, ...]:
    parsed = PurePosixPath(path)
    if (
        parsed.is_absolute()
        or not parsed.parts
        or any(part in {"", ".", ".."} for part in parsed.parts)
    ):
        raise Exact12Source54PackageError(f"unsafe relative path: {path!r}")
    return parsed.parts


def _signature(info: os.stat_result) -> tuple[int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _absolute_plain_path(path: Path) -> Path:
    absolute = path if path.is_absolute() else Path.cwd() / path
    if any(part in {"", ".", ".."} for part in absolute.parts[1:]):
        raise Exact12Source54PackageError("path must have plain absolute components")
    return absolute


def _open_directory_components_nofollow(root: Path) -> int:
    """Open every component from the filesystem anchor without following links."""

    root = _absolute_plain_path(root)
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    if nofollow == 0 or directory == 0 or os.open not in os.supports_dir_fd:
        raise Exact12Source54PackageError(
            "platform lacks descriptor-relative no-follow operations"
        )
    flags = os.O_RDONLY | nofollow | directory | getattr(os, "O_CLOEXEC", 0)
    try:
        current = os.open(root.anchor, flags)
        for part in root.parts[1:]:
            next_fd = os.open(part, flags, dir_fd=current)
            os.close(current)
            current = next_fd
        return current
    except OSError as exc:
        try:
            os.close(current)
        except (OSError, UnboundLocalError):
            pass
        raise Exact12Source54PackageError(f"cannot open directory: {root}") from exc


def _open_relative_nofollow(root_fd: int, relative: str) -> int:
    parts = _plain_relative(relative)
    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    file_flags = (
        os.O_RDONLY
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_NONBLOCK", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    current = os.dup(root_fd)
    try:
        for part in parts[:-1]:
            next_fd = os.open(part, directory_flags, dir_fd=current)
            os.close(current)
            current = next_fd
        return os.open(parts[-1], file_flags, dir_fd=current)
    except OSError as exc:
        raise Exact12Source54PackageError(
            f"cannot open regular no-follow input: {relative}"
        ) from exc
    finally:
        os.close(current)


def _capture_one(
    root_fd: int, relative: str, *, expected_size: int, expected_sha256: str
) -> CapturedInput:
    descriptor = _open_relative_nofollow(root_fd, relative)
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_size != expected_size:
            raise Exact12Source54PackageError(
                f"input type or byte count drifted: {relative}"
            )
        chunks: list[bytes] = []
        remaining = expected_size
        while remaining:
            chunk = os.read(descriptor, min(1 << 20, remaining))
            if not chunk:
                raise Exact12Source54PackageError(f"input truncated: {relative}")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise Exact12Source54PackageError(f"input exceeds bound: {relative}")
        after = os.fstat(descriptor)
    finally:
        os.close(descriptor)
    if _signature(before) != _signature(after):
        raise Exact12Source54PackageError(f"input changed while read: {relative}")
    payload = b"".join(chunks)
    digest = sha256_bytes(payload)
    if digest != expected_sha256:
        raise Exact12Source54PackageError(f"input digest drifted: {relative}")
    return CapturedInput(relative, payload, len(payload), digest, _signature(after))


def _capture_bounded(
    root_fd: int, relative: str, *, maximum_size: int
) -> CapturedInput:
    """Capture an unpinned bootstrap file without following links."""

    descriptor = _open_relative_nofollow(root_fd, relative)
    try:
        before = os.fstat(descriptor)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_size < 0
            or before.st_size > maximum_size
        ):
            raise Exact12Source54PackageError(
                f"bootstrap input exceeds its bound: {relative}"
            )
        chunks: list[bytes] = []
        remaining = before.st_size
        while remaining:
            chunk = os.read(descriptor, min(1 << 20, remaining))
            if not chunk:
                raise Exact12Source54PackageError(
                    f"bootstrap input truncated: {relative}"
                )
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise Exact12Source54PackageError(
                f"bootstrap input exceeds its declared size: {relative}"
            )
        after = os.fstat(descriptor)
    finally:
        os.close(descriptor)
    if _signature(before) != _signature(after):
        raise Exact12Source54PackageError(
            f"bootstrap input changed while read: {relative}"
        )
    payload = b"".join(chunks)
    return CapturedInput(
        relative,
        payload,
        len(payload),
        sha256_bytes(payload),
        _signature(after),
    )


def capture_pinned_inputs(repo_root: Path) -> Mapping[str, CapturedInput]:
    """Capture every pinned source54 input with one cross-file-stable pass."""

    root = _absolute_plain_path(repo_root)
    root_fd = _open_directory_components_nofollow(root)
    captured: dict[str, CapturedInput] = {}
    try:
        for relative, size, digest in _PINNED_INPUTS:
            captured[relative] = _capture_one(
                root_fd, relative, expected_size=size, expected_sha256=digest
            )
        for relative, item in captured.items():
            descriptor = _open_relative_nofollow(root_fd, relative)
            try:
                current = os.fstat(descriptor)
            finally:
                os.close(descriptor)
            if _signature(current) != item.signature:
                raise Exact12Source54PackageError(
                    f"input set changed during component capture: {relative}"
                )
    finally:
        os.close(root_fd)
    return MappingProxyType(captured)


@contextmanager
def _frozen_source54_bank() -> Iterable[None]:
    """Freeze both compiler registries at the authenticated source54 prefix.

    The two modules hold separate globals because the bank builder imported the
    append-only detector registry by value.  The process-local lock makes our
    paired patch/restore atomic with respect to this adapter.  Construction is
    intentionally specified as single-process/single-threaded custody work.
    """

    with _BANK_FREEZE_LOCK:
        bank_bindings = source_order_bank_module.PROOF_BACKED_CUBE_BINDINGS
        detector_bindings = ordered_coverage_module.PROOF_BACKED_CUBE_BINDINGS
        if min(len(bank_bindings), len(detector_bindings)) < SOURCE_ORDER_CUTS:
            raise Exact12Source54PackageError("live bank no longer contains source54")
        bank_prefix = tuple(bank_bindings[:SOURCE_ORDER_CUTS])
        detector_prefix = tuple(detector_bindings[:SOURCE_ORDER_CUTS])
        if (
            bank_prefix != detector_prefix
            or sha256_json(bank_prefix) != SOURCE54_BINDINGS_SHA256
            or sha256_json(detector_prefix) != SOURCE54_BINDINGS_SHA256
        ):
            raise Exact12Source54PackageError(
                "complete source54 bank prefix identity drifted"
            )
        last_binding = bank_prefix[-1][1]
        if (
            last_binding.get("source_path") != LEAN_SOURCE_RELATIVE
            or last_binding.get("source_bytes") != 3_712
            or last_binding.get("source_sha256")
            != "7ca3e854d038dfb07c6d5b4a3e9c9b676cff19b371d96992166c93a001892750"
        ):
            raise Exact12Source54PackageError("source54 bank tail identity drifted")
        source_order_bank_module.PROOF_BACKED_CUBE_BINDINGS = bank_prefix
        ordered_coverage_module.PROOF_BACKED_CUBE_BINDINGS = detector_prefix
        try:
            yield
        finally:
            ordered_coverage_module.PROOF_BACKED_CUBE_BINDINGS = detector_bindings
            source_order_bank_module.PROOF_BACKED_CUBE_BINDINGS = bank_bindings


def _load_extension_from_captured_source(payload: bytes) -> Any:
    """Compile only the authenticated generator bytes used by reconstruction."""

    module = types.ModuleType("_p97_frozen_source54_static_extension")
    module.__file__ = GENERATOR_RELATIVE
    try:
        exec(  # noqa: S102 - execute only the separately hash-pinned captured source
            compile(payload, GENERATOR_RELATIVE, "exec"), module.__dict__
        )
    except Exception as exc:  # pragma: no cover - exact failure is environment-specific
        raise Exact12Source54PackageError(
            "captured extension source did not load"
        ) from exc
    function = module.__dict__.get("add_static_duplicate_center_encoding")
    if not callable(function):
        raise Exact12Source54PackageError("captured extension omitted its entry point")
    return function


def _scan_clauses(clauses: Sequence[tuple[int, ...]]) -> dict[str, int]:
    repeated_literals = 0
    tautologies = 0
    empty_clauses = 0
    for clause in clauses:
        literals = set(clause)
        repeated_literals += int(len(literals) != len(clause))
        tautologies += int(any(-literal in literals for literal in literals))
        empty_clauses += int(not clause)
    return {
        "clauses_scanned": len(clauses),
        "tautological_clauses": tautologies,
        "repeated_literal_clauses": repeated_literals,
        "empty_clauses": empty_clauses,
    }


def _require_zero_anomalies(scan: Mapping[str, int]) -> None:
    if (
        scan.get("tautological_clauses") != 0
        or scan.get("repeated_literal_clauses") != 0
        or scan.get("empty_clauses") != 0
    ):
        raise Exact12Source54PackageError(
            "v1 rejects tautological, repeated-literal, and empty clauses"
        )


def reconstruct_checkpoint(
    repo_root: Path,
    *,
    captured_inputs: Mapping[str, CapturedInput] | None = None,
) -> ReconstructedCheckpoint:
    """Rebuild source54 without a solver and byte-compare its exact DIMACS."""

    root = _absolute_plain_path(repo_root)
    inputs = capture_pinned_inputs(root) if captured_inputs is None else captured_inputs
    if set(inputs) != {record[0] for record in _PINNED_INPUTS}:
        raise Exact12Source54PackageError("captured input inventory is incomplete")
    for relative, size, digest in _PINNED_INPUTS:
        item = inputs[relative]
        if (
            not isinstance(item, CapturedInput)
            or item.path != relative
            or type(item.payload) is not bytes
            or item.size != size
            or len(item.payload) != size
            or item.sha256 != digest
            or sha256_bytes(item.payload) != digest
            or not isinstance(item.signature, tuple)
            or len(item.signature) != 5
            or any(
                isinstance(part, bool) or not isinstance(part, int)
                for part in item.signature
            )
        ):
            raise Exact12Source54PackageError(f"captured input pin drifted: {relative}")

    schedule = structural.build_manifest(root)
    job = structural.build_bound_job(schedule, root, CELL_INDEX)
    if structural.json_sha256(job) != JOB_SHA256:
        raise Exact12Source54PackageError("bound-job identity drifted")
    materialized = structural.instantiate_validated_bound_job(job, schedule, root)
    instance = materialized.instance
    compiled = materialized.compiled

    with _frozen_source54_bank():
        bank = install_source_order_bank(root, instance)
        bank = structural.snapshot_source_order_bank(instance, bank)
        if (
            len(bank.get("entries", ())) != SOURCE_ORDER_CUTS
            or bank.get("bank_sha256") != SOURCE54_BANK_BODY_SHA256
        ):
            raise Exact12Source54PackageError("source54 bank count drifted")
        count, terminal, learned = structural.replay_journal(
            None,
            instance,
            io.BytesIO(inputs[JOURNAL_RELATIVE].payload),
            job_sha256=JOB_SHA256,
            detector_contract_sha256=DETECTOR_SHA256,
            cell_index=CELL_INDEX,
            source_order_bank=bank,
        )
    if count != JOURNAL_RECORDS or terminal != TERMINAL_RECORD_SHA256:
        raise Exact12Source54PackageError("journal replay identity drifted")
    if instance.pattern_variables:
        raise Exact12Source54PackageError(
            "journal or bank unexpectedly allocated patterns"
        )
    if instance.cnf.n_variables != 42_710 or len(instance.cnf.clauses) != 370_196:
        raise Exact12Source54PackageError("pre-relation checkpoint counts drifted")

    add_extension = _load_extension_from_captured_source(
        inputs[GENERATOR_RELATIVE].payload
    )
    counts = add_extension(instance, **dict(_EXTENSION_PROFILE))
    if counts != _EXTENSION_COUNTS:
        raise Exact12Source54PackageError(
            "fixed all-enabled equality-obstruction profile drifted"
        )
    scan = _scan_clauses(instance.cnf.clauses)
    _require_zero_anomalies(scan)
    rebuilt = instance.dimacs().encode("ascii")
    if (
        len(rebuilt) != CNF_BYTES
        or sha256_bytes(rebuilt) != CNF_SHA256
        or rebuilt != inputs[CNF_RELATIVE].payload
    ):
        raise Exact12Source54PackageError(
            "regenerated DIMACS is not byte-identical to source54"
        )
    return ReconstructedCheckpoint(
        cnf_bytes=rebuilt,
        instance=instance,
        compiled=compiled,
        bound_job=_deep_freeze_json(job),
        source_order_bank=_deep_freeze_json(bank),
        journal_record_count=count,
        terminal_record_sha256=terminal,
        journal_clauses=learned,
        extension_counts=_deep_freeze_json(counts),
        clause_anomaly_scan=_deep_freeze_json(scan),
        inputs=MappingProxyType(dict(inputs)),
    )


def _append_entry(entries: list[dict[str, Any]], variable: int, **role: Any) -> None:
    entries.append({"variable": variable, **role})


def _build_total_variable_map(rebuilt: Any, *, validate: bool) -> dict[str, Any]:

    instance = rebuilt.instance
    compiled = rebuilt.compiled
    entries: list[dict[str, Any]] = []
    cursor = 1
    candidate_counts: list[int] = []
    for center in range(12):
        rows = instance.candidates[center]
        candidate_counts.append(len(rows))
        for candidate_index, support in enumerate(rows):
            variable = instance.choice_variables[(center, candidate_index)]
            if variable != cursor:
                raise Exact12Source54PackageError("choice allocation order drifted")
            _append_entry(
                entries,
                cursor,
                kind="choice",
                center=center,
                candidate_index=candidate_index,
                support=list(support),
            )
            cursor += 1
    if candidate_counts != [53, 101, 20, 322, 322, 322, 314, 314, 314, 314, 322, 322]:
        raise Exact12Source54PackageError("candidate count vector drifted")

    for center in range(12):
        for candidate_index in range(len(instance.candidates[center])):
            _append_entry(
                entries,
                cursor,
                kind="one_hot_sinz",
                center=center,
                input_variable=instance.choice_variables[(center, candidate_index)],
                level=0,
            )
            cursor += 1

    incident: dict[tuple[int, int], list[int]] = {
        pair: [] for pair in combinations(range(12), 2)
    }
    for center in range(12):
        for candidate_index, support in enumerate(instance.candidates[center]):
            choice = instance.choice_variables[(center, candidate_index)]
            for pair in combinations(support, 2):
                incident[pair].append(choice)
    if tuple(len(incident[pair]) for pair in incident) != _INCIDENT_COUNTS:
        raise Exact12Source54PackageError("C4 incident order drifted")
    for pair, choices in incident.items():
        for input_index, choice in enumerate(choices):
            for level in range(2):
                _append_entry(
                    entries,
                    cursor,
                    kind="c4_sinz",
                    pair=list(pair),
                    input_index=input_index,
                    input_variable=choice,
                    level=level,
                )
                cursor += 1
    if cursor != 42_561:
        raise Exact12Source54PackageError("base Sinz allocation endpoint drifted")

    source_order = list(compiled.edges)
    if source_order != [6, 9, 0, 2, 8]:
        raise Exact12Source54PackageError("cell source insertion order drifted")
    blockers_by_center: dict[int, list[int]] = {center: [] for center in range(12)}
    for source in source_order:
        source_blockers: list[int] = []
        for center in range(12):
            if center in {1, source}:
                continue
            variable = compiled.blocker_variables[(source, center)]
            if variable != cursor:
                raise Exact12Source54PackageError("cell blocker allocation drifted")
            _append_entry(
                entries,
                cursor,
                kind="cell_blocker",
                source=source,
                center=center,
                physical_edge=list(compiled.edges[source]),
            )
            source_blockers.append(cursor)
            blockers_by_center[center].append(cursor)
            cursor += 1
        for input_index, blocker in enumerate(source_blockers):
            _append_entry(
                entries,
                cursor,
                kind="cell_source_sinz",
                source=source,
                input_index=input_index,
                input_variable=blocker,
                level=0,
            )
            cursor += 1
    for center in range(12):
        for input_index, blocker in enumerate(blockers_by_center[center]):
            _append_entry(
                entries,
                cursor,
                kind="cell_center_sinz",
                center=center,
                input_index=input_index,
                input_variable=blocker,
                level=0,
            )
            cursor += 1
    if cursor != 42_711:
        raise Exact12Source54PackageError("cell compiler allocation endpoint drifted")

    edges = tuple(combinations(range(12), 2))
    for left, right in combinations(range(len(edges)), 2):
        rank = sum(65 - index for index in range(left)) + right - left - 1
        if cursor != 42_711 + rank:
            raise Exact12Source54PackageError("relation rank formula drifted")
        _append_entry(
            entries,
            cursor,
            kind="relation",
            left_edge_index=left,
            right_edge_index=right,
            left_edge=list(edges[left]),
            right_edge=list(edges[right]),
            lexicographic_rank=rank,
        )
        cursor += 1
    variable_map = {
        "schema": VARIABLE_MAP_SCHEMA,
        "coverage": "COMPLETE_TOTAL_1_TO_44855",
        "num_variables": NUM_VARIABLES,
        "entries": entries,
    }
    if validate:
        validate_total_variable_map(variable_map)
    return variable_map


def build_total_variable_map(rebuilt: ReconstructedCheckpoint) -> dict[str, Any]:
    """Serialize the complete, exact allocation role for IDs 1 through 44855."""

    return _build_total_variable_map(rebuilt, validate=True)


def validate_total_variable_map(variable_map: Mapping[str, Any]) -> None:
    """Fail closed unless every role equals the exact cell-8 allocation."""

    if not isinstance(variable_map, Mapping) or set(variable_map) != {
        "schema",
        "coverage",
        "num_variables",
        "entries",
    }:
        raise Exact12Source54PackageError("total variable-map fields are malformed")
    if (
        variable_map.get("schema") != VARIABLE_MAP_SCHEMA
        or variable_map.get("coverage") != "COMPLETE_TOTAL_1_TO_44855"
        or variable_map.get("num_variables") != NUM_VARIABLES
    ):
        raise Exact12Source54PackageError("total variable-map identity drifted")
    entries = variable_map.get("entries")
    if not isinstance(entries, list) or len(entries) != NUM_VARIABLES:
        raise Exact12Source54PackageError("total variable-map length drifted")
    _validate_contiguous_variable_entries(
        entries,
        expected_num_variables=NUM_VARIABLES,
        expected_kind_counts=_KIND_COUNTS,
    )
    for entry in entries:
        _validate_exact_variable_role(entry)
    expected = _build_total_variable_map(materialize_cell(CELL_INDEX), validate=False)
    if variable_map != expected:
        raise Exact12Source54PackageError(
            "variable-map differs from the exact cell-8 allocation"
        )


def _validate_contiguous_variable_entries(
    entries: Sequence[Any],
    *,
    expected_num_variables: int,
    expected_kind_counts: Mapping[str, int],
) -> None:
    """Generic gap/duplicate/type validator for future checkpoint adapters."""

    if len(entries) != expected_num_variables:
        raise Exact12Source54PackageError("variable entry count drifted")
    kinds: Counter[str] = Counter()
    for expected, entry in enumerate(entries, 1):
        if not isinstance(entry, Mapping):
            raise Exact12Source54PackageError("variable-map entry is not an object")
        variable = entry.get("variable")
        kind = entry.get("kind")
        if (
            isinstance(variable, bool)
            or not isinstance(variable, int)
            or variable != expected
            or not isinstance(kind, str)
            or not kind
        ):
            raise Exact12Source54PackageError("variable-map ID or kind drifted")
        kinds[kind] += 1
    if dict(kinds) != dict(expected_kind_counts):
        raise Exact12Source54PackageError("variable-map role counts drifted")


def _plain_int(value: Any, *, minimum: int, maximum: int) -> bool:
    return (
        not isinstance(value, bool)
        and isinstance(value, int)
        and minimum <= value <= maximum
    )


def _integer_list(
    value: Any, *, length: int, minimum: int, maximum: int, strictly_sorted: bool
) -> bool:
    if not isinstance(value, list) or len(value) != length:
        return False
    if not all(_plain_int(item, minimum=minimum, maximum=maximum) for item in value):
        return False
    return not strictly_sorted or all(
        value[index] < value[index + 1] for index in range(len(value) - 1)
    )


def _validate_exact_variable_role(entry: Mapping[str, Any]) -> None:
    kind = entry["kind"]
    common = {"variable", "kind"}
    if kind == "choice":
        if set(entry) != common | {"center", "candidate_index", "support"} or not (
            _plain_int(entry.get("center"), minimum=0, maximum=11)
            and _plain_int(entry.get("candidate_index"), minimum=0, maximum=321)
            and _integer_list(
                entry.get("support"),
                length=4,
                minimum=0,
                maximum=11,
                strictly_sorted=True,
            )
            and entry["center"] not in entry["support"]
        ):
            raise Exact12Source54PackageError("choice variable role drifted")
        return
    if kind == "one_hot_sinz":
        valid = set(entry) == common | {"center", "input_variable", "level"} and (
            _plain_int(entry.get("center"), minimum=0, maximum=11)
            and _plain_int(entry.get("input_variable"), minimum=1, maximum=3_040)
            and _plain_int(entry.get("level"), minimum=0, maximum=0)
        )
    elif kind == "c4_sinz":
        valid = set(entry) == common | {
            "pair",
            "input_index",
            "input_variable",
            "level",
        } and (
            _integer_list(
                entry.get("pair"),
                length=2,
                minimum=0,
                maximum=11,
                strictly_sorted=True,
            )
            and _plain_int(entry.get("input_index"), minimum=0, maximum=291)
            and _plain_int(entry.get("input_variable"), minimum=1, maximum=3_040)
            and entry.get("level") in {0, 1}
            and not isinstance(entry.get("level"), bool)
        )
    elif kind == "cell_blocker":
        valid = set(entry) == common | {
            "source",
            "center",
            "physical_edge",
        } and (
            entry.get("source") in {0, 2, 6, 8, 9}
            and not isinstance(entry.get("source"), bool)
            and _plain_int(entry.get("center"), minimum=0, maximum=11)
            and entry["center"] not in {1, entry["source"]}
            and _integer_list(
                entry.get("physical_edge"),
                length=2,
                minimum=0,
                maximum=11,
                strictly_sorted=True,
            )
        )
    elif kind == "cell_source_sinz":
        valid = set(entry) == common | {
            "source",
            "input_index",
            "input_variable",
            "level",
        } and (
            entry.get("source") in {0, 2, 6, 8, 9}
            and not isinstance(entry.get("source"), bool)
            and _plain_int(entry.get("input_index"), minimum=0, maximum=9)
            and _plain_int(entry.get("input_variable"), minimum=42_561, maximum=42_650)
            and _plain_int(entry.get("level"), minimum=0, maximum=0)
        )
    elif kind == "cell_center_sinz":
        valid = set(entry) == common | {
            "center",
            "input_index",
            "input_variable",
            "level",
        } and (
            _plain_int(entry.get("center"), minimum=0, maximum=11)
            and entry.get("center") != 1
            and _plain_int(entry.get("input_index"), minimum=0, maximum=4)
            and _plain_int(entry.get("input_variable"), minimum=42_561, maximum=42_650)
            and _plain_int(entry.get("level"), minimum=0, maximum=0)
        )
    elif kind == "relation":
        rank = entry.get("lexicographic_rank")
        expected_rank = entry["variable"] - 42_711
        edge_order = tuple(combinations(range(12), 2))
        left_index = entry.get("left_edge_index")
        right_index = entry.get("right_edge_index")
        valid = set(entry) == common | {
            "left_edge_index",
            "right_edge_index",
            "left_edge",
            "right_edge",
            "lexicographic_rank",
        } and (
            _plain_int(left_index, minimum=0, maximum=64)
            and _plain_int(right_index, minimum=1, maximum=65)
            and left_index < right_index
            and _integer_list(
                entry.get("left_edge"),
                length=2,
                minimum=0,
                maximum=11,
                strictly_sorted=True,
            )
            and _integer_list(
                entry.get("right_edge"),
                length=2,
                minimum=0,
                maximum=11,
                strictly_sorted=True,
            )
            and rank == expected_rank
            and not isinstance(rank, bool)
            and expected_rank
            == sum(65 - index for index in range(left_index))
            + right_index
            - left_index
            - 1
            and entry["left_edge"] == list(edge_order[left_index])
            and entry["right_edge"] == list(edge_order[right_index])
        )
    else:
        valid = False
    if not valid:
        raise Exact12Source54PackageError(f"{kind} variable role drifted")


def decode_model_to_base_cube(
    variable_map: Mapping[str, Any], model_literals: Iterable[int]
) -> dict[str, list[int]]:
    """Project supplied literals to exactly one positive choice per center.

    This narrow projection accepts a partial assignment.  Use
    :func:`decode_and_validate_model` at the runner boundary, where a complete
    assignment is mandatory even when PIQD already supplied a completeness
    check for ``GET /model``.
    """

    validate_total_variable_map(variable_map)
    assignments: dict[int, bool] = {}
    for literal in model_literals:
        if isinstance(literal, bool) or not isinstance(literal, int) or literal == 0:
            raise Exact12Source54PackageError("model literal is not a nonzero integer")
        variable = abs(literal)
        if variable > NUM_VARIABLES or variable in assignments:
            raise Exact12Source54PackageError(
                "model variable is repeated or out of range"
            )
        assignments[variable] = literal > 0
    selected: dict[int, list[list[int]]] = {center: [] for center in range(12)}
    for entry in variable_map["entries"][:3_040]:
        if assignments.get(entry["variable"], False):
            selected[entry["center"]].append(entry["support"])
    cube: dict[str, list[int]] = {}
    for center in range(12):
        if len(selected[center]) != 1:
            raise Exact12Source54PackageError(
                f"model selects {len(selected[center])} rows at center {center}"
            )
        cube[str(center)] = list(selected[center][0])
    return cube


def decode_and_validate_model(
    rebuilt: ReconstructedCheckpoint,
    variable_map: Mapping[str, Any],
    model_literals: Iterable[int],
) -> dict[str, list[int]]:
    """Decode and replay source-faithful plus cell semantics for a complete model."""

    literals = tuple(model_literals)
    if len(literals) != NUM_VARIABLES or {
        abs(literal)
        for literal in literals
        if isinstance(literal, int) and not isinstance(literal, bool)
    } != set(range(1, NUM_VARIABLES + 1)):
        raise Exact12Source54PackageError(
            "complete model must assign every variable 1 through 44855 exactly once"
        )
    cube = decode_model_to_base_cube(variable_map, literals)
    positive = frozenset(literal for literal in literals if literal > 0)
    integer_cube = {int(center): support for center, support in cube.items()}
    if not source_faithful_cube_ok(rebuilt.instance.model, integer_cube):
        raise Exact12Source54PackageError("decoded cube fails source-faithful replay")
    try:
        blockers = decode_blockers(positive, rebuilt.compiled.blocker_variables)
    except ValueError as exc:
        raise Exact12Source54PackageError(
            "model blocker assignment is malformed"
        ) from exc
    if not added_constraints_hold(rebuilt.compiled.cell, integer_cube, blockers):
        raise Exact12Source54PackageError("decoded cube fails cell-8 semantic replay")
    return cube


def _source_cut_provenance(bank: Mapping[str, Any]) -> list[dict[str, Any]]:
    provenance: list[dict[str, Any]] = []
    seen: set[str] = set()
    for entry in bank["entries"]:
        clause = entry["learned_clause"]
        digest = sha256_json(clause)
        if digest != entry["learned_clause_sha256"] or digest in seen:
            raise Exact12Source54PackageError("source clause provenance drifted")
        seen.add(digest)
        provenance.append(
            {
                "canonical_clause": list(clause),
                "canonical_clause_sha256": digest,
                "lean_source_sha256": entry["generated_lean_nogood"]["source_sha256"],
                "binding": "canonical_clause_content_sha256",
                "certificate_position_binding": False,
            }
        )
    return provenance


def _build_order(rebuilt: ReconstructedCheckpoint) -> dict[str, Any]:
    return {
        "schema": ORDER_SCHEMA,
        "cell_index": CELL_INDEX,
        "cell_source_insertion_order": list(rebuilt.compiled.edges),
        "c4_pair_order": [list(pair) for pair in combinations(range(12), 2)],
        "relation_edge_order": [list(edge) for edge in combinations(range(12), 2)],
        "source_order_bank_sha256": rebuilt.source_order_bank["bank_sha256"],
        "journal_terminal_record_sha256": TERMINAL_RECORD_SHA256,
    }


def _build_producer_manifest(
    rebuilt: ReconstructedCheckpoint,
    *,
    variable_map_sha256: str,
    order_sha256: str,
) -> dict[str, Any]:
    source_provenance = _source_cut_provenance(rebuilt.source_order_bank)
    input_inventory = [
        rebuilt.inputs[relative].record() for relative, _size, _digest in _PINNED_INPUTS
    ]
    body = {
        "schema": PRODUCER_SCHEMA,
        "semantic_status": "FINITE_LOCAL_CHECKPOINT_ONLY",
        "scope": {
            "cardinality": 12,
            "normalized_v14_cell": CELL_INDEX,
            "source_order_cut_count": SOURCE_ORDER_CUTS,
            "future_checkpoint_capable_helpers": True,
            "v1_acceptance": "PINNED_SOURCE54_ONLY",
        },
        "claims": {
            "source_entitlement": False,
            "sat": False,
            "unsat": False,
            "proof": False,
            "universal": False,
            "aggregate_cell_coverage": False,
            "lean_closure": False,
            "solver_receipt": False,
        },
        "cnf": {
            "path_in_package": "discovery.cnf",
            "bytes": CNF_BYTES,
            "sha256": CNF_SHA256,
            "num_variables": NUM_VARIABLES,
            "num_clauses": NUM_CLAUSES,
            "byte_identical_reconstruction": True,
        },
        "variable_map": {
            "path_in_package": "variable-map.json",
            "sha256": variable_map_sha256,
            "coverage": "COMPLETE_TOTAL_1_TO_44855",
        },
        "order": {"path_in_package": "order.json", "sha256": order_sha256},
        "inputs": {
            "capture": "component-wise no-follow bounded cross-file-stable",
            "inventory": input_inventory,
            "inventory_sha256": sha256_json(input_inventory),
        },
        "compiler_replay": {
            "bound_job_sha256": JOB_SHA256,
            "bound_job_compiler_manifest_sha256": rebuilt.bound_job[
                "compiler_manifest_sha256"
            ],
            "bound_job_contract_files_sha256": rebuilt.bound_job[
                "source_to_cnf_contract"
            ]["files_sha256"],
            "source_order_bank_sha256": rebuilt.source_order_bank["bank_sha256"],
            "source_order_bank_entries": SOURCE_ORDER_CUTS,
            "journal_sha256": JOURNAL_SHA256,
            "journal_records": JOURNAL_RECORDS,
            "journal_detector_contract_sha256": DETECTOR_SHA256,
            "journal_terminal_record_sha256": TERMINAL_RECORD_SHA256,
            "extension_generator_sha256": rebuilt.inputs[GENERATOR_RELATIVE].sha256,
            "extension_profile": dict(_EXTENSION_PROFILE),
            "extension_profile_configurable": False,
            "extension_counts": dict(rebuilt.extension_counts),
        },
        "source_cut_provenance": {
            "binding_key": "canonical_clause_content_sha256",
            "certificate_clause_position_used": False,
            "cuts": source_provenance,
            "cuts_sha256": sha256_json(source_provenance),
        },
        "clause_anomaly_scan": dict(rebuilt.clause_anomaly_scan),
        "runner_boundary": {
            "raw_dimacs_compatible": True,
            "piqd_client": "PiqdRawDimacsClient",
            "requested_core_enforcement": "RUNNER_RESPONSIBILITY",
            "run_packet_json_safe": True,
            "producer_digest_contract": (
                "identity.canonical_body_sha256 hashes the canonical object with "
                "identity omitted; package-index file_sha256 and wave encoding "
                "producer_manifest_sha256 hash the complete archived file"
            ),
        },
    }
    return {
        **body,
        "identity": {"canonical_body_sha256": sha256_json(body)},
    }


def _validate_producer_manifest(manifest: Mapping[str, Any]) -> None:
    if (
        not isinstance(manifest, Mapping)
        or set(manifest)
        != {
            "schema",
            "semantic_status",
            "scope",
            "claims",
            "cnf",
            "variable_map",
            "order",
            "inputs",
            "compiler_replay",
            "source_cut_provenance",
            "clause_anomaly_scan",
            "runner_boundary",
            "identity",
        }
        or manifest.get("schema") != PRODUCER_SCHEMA
    ):
        raise Exact12Source54PackageError("producer schema drifted")
    body = dict(manifest)
    identity = body.pop("identity", None)
    if (
        not isinstance(identity, Mapping)
        or set(identity) != {"canonical_body_sha256"}
        or identity.get("canonical_body_sha256") != sha256_json(body)
    ):
        raise Exact12Source54PackageError("producer canonical body digest drifted")
    if manifest.get("claims") != {
        "source_entitlement": False,
        "sat": False,
        "unsat": False,
        "proof": False,
        "universal": False,
        "aggregate_cell_coverage": False,
        "lean_closure": False,
        "solver_receipt": False,
    }:
        raise Exact12Source54PackageError("producer claims are not fail-closed")
    if manifest.get(
        "semantic_status"
    ) != "FINITE_LOCAL_CHECKPOINT_ONLY" or manifest.get("scope") != {
        "cardinality": 12,
        "normalized_v14_cell": CELL_INDEX,
        "source_order_cut_count": SOURCE_ORDER_CUTS,
        "future_checkpoint_capable_helpers": True,
        "v1_acceptance": "PINNED_SOURCE54_ONLY",
    }:
        raise Exact12Source54PackageError("producer finite scope drifted")
    cnf = manifest.get("cnf")
    if cnf != {
        "path_in_package": "discovery.cnf",
        "bytes": CNF_BYTES,
        "sha256": CNF_SHA256,
        "num_variables": NUM_VARIABLES,
        "num_clauses": NUM_CLAUSES,
        "byte_identical_reconstruction": True,
    }:
        raise Exact12Source54PackageError("producer CNF identity drifted")
    variable_map = manifest.get("variable_map")
    order = manifest.get("order")
    if (
        not isinstance(variable_map, Mapping)
        or set(variable_map) != {"path_in_package", "sha256", "coverage"}
        or variable_map.get("path_in_package") != "variable-map.json"
        or variable_map.get("coverage") != "COMPLETE_TOTAL_1_TO_44855"
        or not _is_sha256(variable_map.get("sha256"))
        or not isinstance(order, Mapping)
        or set(order) != {"path_in_package", "sha256"}
        or order.get("path_in_package") != "order.json"
        or not _is_sha256(order.get("sha256"))
    ):
        raise Exact12Source54PackageError("producer map or order identity drifted")
    inventory = [
        {"path": relative, "bytes": size, "sha256": digest}
        for relative, size, digest in _PINNED_INPUTS
    ]
    inputs = manifest.get("inputs")
    if inputs != {
        "capture": "component-wise no-follow bounded cross-file-stable",
        "inventory": inventory,
        "inventory_sha256": sha256_json(inventory),
    }:
        raise Exact12Source54PackageError("producer input inventory drifted")
    replay = manifest.get("compiler_replay")
    if (
        not isinstance(replay, Mapping)
        or set(replay)
        != {
            "bound_job_sha256",
            "bound_job_compiler_manifest_sha256",
            "bound_job_contract_files_sha256",
            "source_order_bank_sha256",
            "source_order_bank_entries",
            "journal_sha256",
            "journal_records",
            "journal_detector_contract_sha256",
            "journal_terminal_record_sha256",
            "extension_generator_sha256",
            "extension_profile",
            "extension_profile_configurable",
            "extension_counts",
        }
        or replay.get("bound_job_sha256") != JOB_SHA256
        or not _is_sha256(replay.get("bound_job_compiler_manifest_sha256"))
        or not _is_sha256(replay.get("bound_job_contract_files_sha256"))
        or replay.get("source_order_bank_sha256") != SOURCE54_BANK_BODY_SHA256
        or replay.get("source_order_bank_entries") != SOURCE_ORDER_CUTS
        or replay.get("journal_sha256") != JOURNAL_SHA256
        or replay.get("journal_records") != JOURNAL_RECORDS
        or replay.get("journal_detector_contract_sha256") != DETECTOR_SHA256
        or replay.get("journal_terminal_record_sha256") != TERMINAL_RECORD_SHA256
        or replay.get("extension_generator_sha256")
        != {path: digest for path, _size, digest in _PINNED_INPUTS}[GENERATOR_RELATIVE]
        or replay.get("extension_profile") != dict(_EXTENSION_PROFILE)
        or replay.get("extension_profile_configurable") is not False
        or replay.get("extension_counts") != _EXTENSION_COUNTS
    ):
        raise Exact12Source54PackageError("producer replay identity drifted")
    provenance = manifest.get("source_cut_provenance")
    cuts = provenance.get("cuts") if isinstance(provenance, Mapping) else None
    if (
        not isinstance(provenance, Mapping)
        or set(provenance)
        != {
            "binding_key",
            "certificate_clause_position_used",
            "cuts",
            "cuts_sha256",
        }
        or provenance.get("binding_key") != "canonical_clause_content_sha256"
        or provenance.get("certificate_clause_position_used") is not False
        or not isinstance(cuts, list)
        or len(cuts) != SOURCE_ORDER_CUTS
        or provenance.get("cuts_sha256") != sha256_json(cuts)
    ):
        raise Exact12Source54PackageError("producer source provenance drifted")
    seen: set[str] = set()
    for cut in cuts:
        if (
            not isinstance(cut, Mapping)
            or set(cut)
            != {
                "canonical_clause",
                "canonical_clause_sha256",
                "lean_source_sha256",
                "binding",
                "certificate_position_binding",
            }
            or not isinstance(cut.get("canonical_clause"), list)
            or cut.get("canonical_clause_sha256")
            != sha256_json(cut.get("canonical_clause"))
            or cut.get("canonical_clause_sha256") in seen
            or not _is_sha256(cut.get("lean_source_sha256"))
            or cut.get("binding") != "canonical_clause_content_sha256"
            or cut.get("certificate_position_binding") is not False
        ):
            raise Exact12Source54PackageError("producer source cut drifted")
        seen.add(cut["canonical_clause_sha256"])
    if manifest.get("runner_boundary") != {
        "raw_dimacs_compatible": True,
        "piqd_client": "PiqdRawDimacsClient",
        "requested_core_enforcement": "RUNNER_RESPONSIBILITY",
        "run_packet_json_safe": True,
        "producer_digest_contract": (
            "identity.canonical_body_sha256 hashes the canonical object with "
            "identity omitted; package-index file_sha256 and wave encoding "
            "producer_manifest_sha256 hash the complete archived file"
        ),
    }:
        raise Exact12Source54PackageError("producer runner boundary drifted")
    _require_zero_anomalies(manifest.get("clause_anomaly_scan", {}))


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _build_wave(
    producer_manifest: Mapping[str, Any],
    *,
    producer_manifest_sha256: str,
    variable_map_sha256: str,
    order_sha256: str,
) -> dict[str, Any]:
    ingress = producer_manifest["inputs"]["inventory_sha256"]
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": f"exact12-source54-cell8-{CNF_SHA256[:16]}",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": LEAN_SOURCE_RELATIVE,
            "ingress_hypotheses_sha256": ingress,
            "finite_schema": PRODUCER_SCHEMA,
            "cardinality_scope": "exactly 12; normalized v14 cell 8 only",
            "source_theorem": "NONE_SOURCE_ENTITLEMENT_FALSE",
        },
        "encoding": {
            "cnf_sha256": CNF_SHA256,
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_manifest_sha256,
            "num_variables": NUM_VARIABLES,
            "num_clauses": NUM_CLAUSES,
            "query_polarity": SAT_MEANS_COUNTEREXAMPLE,
        },
        "execution": {
            "backend": "piqd-raw-dimacs",
            "solver_profile": "runner-supplied; package makes no solver receipt",
            "shard_id": CELL_INDEX,
            "shard_count": 648,
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
    validate_wave_manifest(wave)
    return wave


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {
        "name": name,
        "bytes": len(payload),
        "file_sha256": sha256_bytes(payload),
    }


def _validate_pinned_artifact_records(records: Any) -> None:
    expected = [
        {"name": name, "bytes": size, "file_sha256": digest}
        for name, size, digest in _PINNED_PACKAGE_ARTIFACTS
    ]
    if records != expected:
        raise Exact12Source54PackageError(
            "package artifact inventory differs from the pinned source54 files"
        )


def _validate_source54_bank(bank: Any) -> None:
    """Validate the complete bank structure and exact source54 recompilation."""

    if not isinstance(bank, Mapping):
        raise Exact12Source54PackageError("package source-order bank is not an object")
    if bank.get("bank_sha256") != SOURCE54_BANK_BODY_SHA256:
        raise Exact12Source54PackageError("package source-order bank identity drifted")
    try:
        with _frozen_source54_bank():
            expected = source_order_bank_module.snapshot_source_order_bank(
                materialize_cell(CELL_INDEX).instance, bank
            )
    except (Exception, RecursionError) as exc:
        if isinstance(exc, Exact12Source54PackageError):
            raise
        raise Exact12Source54PackageError(
            "package source-order bank failed exact source54 recompilation"
        ) from exc
    if canonical_json_bytes(expected) != canonical_json_bytes(bank):
        raise Exact12Source54PackageError(
            "package source-order bank differs from exact source54 recompilation"
        )


def _expected_order() -> dict[str, Any]:
    materialized = materialize_cell(CELL_INDEX)
    return {
        "schema": ORDER_SCHEMA,
        "cell_index": CELL_INDEX,
        "cell_source_insertion_order": list(materialized.compiled.edges),
        "c4_pair_order": [list(pair) for pair in combinations(range(12), 2)],
        "relation_edge_order": [list(edge) for edge in combinations(range(12), 2)],
        "source_order_bank_sha256": SOURCE54_BANK_BODY_SHA256,
        "journal_terminal_record_sha256": TERMINAL_RECORD_SHA256,
    }


def _validate_order(order: Any) -> None:
    if order != _expected_order():
        raise Exact12Source54PackageError("package source54 order identity drifted")


def _write_create_once(directory: Path, artifacts: Mapping[str, bytes]) -> None:
    """Create a package beneath held parent/output FDs, never path-reopening it."""

    directory = _absolute_plain_path(directory)
    basename = directory.name
    if PurePosixPath(basename).name != basename:
        raise Exact12Source54PackageError("unsafe output directory name")
    parent_fd = _open_directory_components_nofollow(directory.parent)
    output_fd: int | None = None
    created_directory: os.stat_result | None = None
    created_files: dict[str, tuple[int, int, int, int, int]] = {}
    try:
        try:
            os.mkdir(basename, 0o700, dir_fd=parent_fd)
        except FileExistsError as exc:
            raise Exact12Source54PackageError(
                "output directory already exists"
            ) from exc
        created_directory = os.stat(basename, dir_fd=parent_fd, follow_symlinks=False)
        if not stat.S_ISDIR(created_directory.st_mode):
            raise Exact12Source54PackageError("new output is not a directory")
        output_fd = os.open(
            basename,
            os.O_RDONLY
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent_fd,
        )
        opened_directory = os.fstat(output_fd)
        if (opened_directory.st_dev, opened_directory.st_ino) != (
            created_directory.st_dev,
            created_directory.st_ino,
        ):
            raise Exact12Source54PackageError("output directory replaced during create")
        for name, payload in artifacts.items():
            if name != PurePosixPath(name).name:
                raise Exact12Source54PackageError("unsafe package artifact name")
            descriptor = os.open(
                name,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
                0o600,
                dir_fd=output_fd,
            )
            initial = os.fstat(descriptor)
            created_files[name] = _signature(initial)
            with os.fdopen(descriptor, "wb", closefd=True) as handle:
                handle.write(payload)
                handle.flush()
                os.fsync(handle.fileno())
                final = os.fstat(handle.fileno())
            if (
                not stat.S_ISREG(final.st_mode)
                or final.st_nlink != 1
                or final.st_size != len(payload)
                or (initial.st_dev, initial.st_ino) != (final.st_dev, final.st_ino)
            ):
                raise Exact12Source54PackageError(
                    f"created artifact identity drifted: {name}"
                )
            created_files[name] = _signature(final)
        for name, payload in artifacts.items():
            captured = _capture_one(
                output_fd,
                name,
                expected_size=len(payload),
                expected_sha256=sha256_bytes(payload),
            )
            if captured.signature != created_files[name]:
                raise Exact12Source54PackageError(
                    f"created artifact changed before seal: {name}"
                )
        os.fsync(output_fd)
        current_directory = os.stat(basename, dir_fd=parent_fd, follow_symlinks=False)
        if not stat.S_ISDIR(current_directory.st_mode) or (
            current_directory.st_dev,
            current_directory.st_ino,
        ) != (opened_directory.st_dev, opened_directory.st_ino):
            raise Exact12Source54PackageError("output directory replaced before seal")
        os.fsync(parent_fd)
    except Exception:
        if output_fd is not None:
            for name, signature in reversed(created_files.items()):
                try:
                    current = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
                    if (current.st_dev, current.st_ino) == signature[:2]:
                        os.unlink(name, dir_fd=output_fd)
                except OSError:
                    pass
        if created_directory is not None:
            try:
                current = os.stat(basename, dir_fd=parent_fd, follow_symlinks=False)
                if (current.st_dev, current.st_ino) == (
                    created_directory.st_dev,
                    created_directory.st_ino,
                ):
                    os.rmdir(basename, dir_fd=parent_fd)
            except OSError:
                pass
        raise
    finally:
        if output_fd is not None:
            os.close(output_fd)
        os.close(parent_fd)


def build_package(repo_root: Path, output_dir: Path) -> LoadedPackage:
    """Reconstruct, emit create-once canonical artifacts, and reload-validate."""

    rebuilt = reconstruct_checkpoint(repo_root)
    variable_map = build_total_variable_map(rebuilt)
    variable_map_bytes = canonical_json_bytes(variable_map)
    variable_map_sha256 = sha256_bytes(variable_map_bytes)
    order = _build_order(rebuilt)
    order_bytes = canonical_json_bytes(order)
    order_sha256 = sha256_bytes(order_bytes)
    producer = _build_producer_manifest(
        rebuilt,
        variable_map_sha256=variable_map_sha256,
        order_sha256=order_sha256,
    )
    _validate_producer_manifest(producer)
    producer_bytes = canonical_json_bytes(producer)
    wave = _build_wave(
        producer,
        producer_manifest_sha256=sha256_bytes(producer_bytes),
        variable_map_sha256=variable_map_sha256,
        order_sha256=order_sha256,
    )
    artifacts: dict[str, bytes] = {
        "discovery.cnf": rebuilt.cnf_bytes,
        "bound-job.json": canonical_json_bytes(_plain_json(rebuilt.bound_job)),
        "source-order-bank.json": canonical_json_bytes(
            _plain_json(rebuilt.source_order_bank)
        ),
        "variable-map.json": variable_map_bytes,
        "order.json": order_bytes,
        "producer-manifest.json": producer_bytes,
        "wave-manifest.json": canonical_json_bytes(wave),
    }
    records = [_artifact_record(name, artifacts[name]) for name in _OUTPUT_FILES]
    index = {
        "schema": INDEX_SCHEMA,
        "package_schema": PACKAGE_SCHEMA,
        "create_once": True,
        "artifacts": records,
        "artifacts_sha256": sha256_json(records),
    }
    artifacts["package-index.json"] = canonical_json_bytes(index)
    _write_create_once(output_dir, artifacts)
    return load_package(output_dir)


def _capture_package_artifact(root_fd: int, record: Mapping[str, Any]) -> CapturedInput:
    name = record.get("name")
    size = record.get("bytes")
    digest = record.get("file_sha256")
    if (
        not isinstance(name, str)
        or name != PurePosixPath(name).name
        or isinstance(size, bool)
        or not isinstance(size, int)
        or size < 0
        or not isinstance(digest, str)
        or len(digest) != 64
    ):
        raise Exact12Source54PackageError("package artifact record is malformed")
    return _capture_one(root_fd, name, expected_size=size, expected_sha256=digest)


def load_package(package_dir: Path) -> LoadedPackage:
    """Load immutable package bytes no-follow and validate every cross-binding."""

    directory = _absolute_plain_path(package_dir)
    root_fd = _open_directory_components_nofollow(directory)
    try:
        index_capture = _capture_bounded(
            root_fd, "package-index.json", maximum_size=1 << 20
        )
        if (index_capture.size, index_capture.sha256) != (
            PACKAGE_INDEX_BYTES,
            PACKAGE_INDEX_SHA256,
        ):
            raise Exact12Source54PackageError("package index file identity drifted")
        index = parse_strict_json(index_capture.payload, require_canonical=True)
        if not isinstance(index, Mapping) or set(index) != {
            "schema",
            "package_schema",
            "create_once",
            "artifacts",
            "artifacts_sha256",
        }:
            raise Exact12Source54PackageError("package index fields are malformed")
        if (
            index.get("schema") != INDEX_SCHEMA
            or index.get("package_schema") != PACKAGE_SCHEMA
            or index.get("create_once") is not True
        ):
            raise Exact12Source54PackageError("package index identity drifted")
        records = index.get("artifacts")
        if not isinstance(records, list) or sha256_json(records) != index.get(
            "artifacts_sha256"
        ):
            raise Exact12Source54PackageError("package artifact inventory drifted")
        _validate_pinned_artifact_records(records)
        captures = [_capture_package_artifact(root_fd, record) for record in records]
        if set(os.listdir(root_fd)) != {*_OUTPUT_FILES, "package-index.json"}:
            raise Exact12Source54PackageError("package contains unindexed files")
        index_descriptor = _open_relative_nofollow(root_fd, "package-index.json")
        try:
            index_info = os.fstat(index_descriptor)
        finally:
            os.close(index_descriptor)
        if _signature(index_info) != index_capture.signature:
            raise Exact12Source54PackageError("package index changed during load")
        for item in captures:
            descriptor = _open_relative_nofollow(root_fd, item.path)
            try:
                info = os.fstat(descriptor)
            finally:
                os.close(descriptor)
            if _signature(info) != item.signature:
                raise Exact12Source54PackageError("package changed during load")
    finally:
        os.close(root_fd)
    artifacts = MappingProxyType(
        {
            "package-index.json": index_capture.payload,
            **{item.path: item.payload for item in captures},
        }
    )
    if not artifacts["discovery.cnf"].startswith(b"p cnf 44855 732131\n") or (
        len(artifacts["discovery.cnf"]),
        sha256_bytes(artifacts["discovery.cnf"]),
    ) != (CNF_BYTES, CNF_SHA256):
        raise Exact12Source54PackageError("package DIMACS identity drifted")
    variable_map = parse_strict_json(
        artifacts["variable-map.json"], require_canonical=True
    )
    validate_total_variable_map(variable_map)
    producer = parse_strict_json(
        artifacts["producer-manifest.json"], require_canonical=True
    )
    _validate_producer_manifest(producer)
    wave = parse_strict_json(artifacts["wave-manifest.json"], require_canonical=True)
    validate_wave_manifest(wave)
    order = parse_strict_json(artifacts["order.json"], require_canonical=True)
    _validate_order(order)
    if (
        producer["variable_map"]["sha256"]
        != sha256_bytes(artifacts["variable-map.json"])
        or producer["order"]["sha256"] != sha256_bytes(artifacts["order.json"])
        or wave["encoding"]["producer_manifest_sha256"]
        != sha256_bytes(artifacts["producer-manifest.json"])
        or wave["encoding"]["variable_map_sha256"]
        != sha256_bytes(artifacts["variable-map.json"])
        or wave["execution"]["order_sha256"] != sha256_json(order)
    ):
        raise Exact12Source54PackageError("package manifest cross-binding drifted")
    bound_job = parse_strict_json(artifacts["bound-job.json"], require_canonical=True)
    if (
        not isinstance(bound_job, Mapping)
        or bound_job.get("cell_index") != CELL_INDEX
        or structural.json_sha256(bound_job) != JOB_SHA256
    ):
        raise Exact12Source54PackageError("package bound-job identity drifted")
    bank = parse_strict_json(
        artifacts["source-order-bank.json"], require_canonical=True
    )
    _validate_source54_bank(bank)
    replay = producer["compiler_replay"]
    expected_provenance = _source_cut_provenance(bank)
    if (
        replay["bound_job_compiler_manifest_sha256"]
        != bound_job.get("compiler_manifest_sha256")
        or replay["bound_job_contract_files_sha256"]
        != (
            bound_job.get("source_to_cnf_contract", {}).get("files_sha256")
            if isinstance(bound_job.get("source_to_cnf_contract"), Mapping)
            else None
        )
        or replay["source_order_bank_sha256"] != bank.get("bank_sha256")
        or order["source_order_bank_sha256"] != bank.get("bank_sha256")
        or producer["source_cut_provenance"]["cuts"] != expected_provenance
        or producer["source_cut_provenance"]["cuts_sha256"]
        != sha256_json(expected_provenance)
    ):
        raise Exact12Source54PackageError(
            "package compiler, bank, order, or provenance binding drifted"
        )
    return LoadedPackage(directory=directory, artifacts=artifacts)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    loaded = build_package(args.repo_root, args.output_dir)
    print(
        json.dumps(
            {
                "package": str(loaded.directory),
                "cnf_sha256": CNF_SHA256,
                "claims": dict(loaded.producer_manifest["claims"]),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
