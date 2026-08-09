"""Package the pinned source-entitled exact-17 v19 PIQD input.

This module is an additive adapter.  It does not run a producer, PIQD, a
solver, or Lean, and it makes no aggregate or theorem-level claim.
"""

from __future__ import annotations

import hashlib
import os
import stat
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_exact17_semantic as semantic
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    WAVE_SCHEMA,
    canonical_json_bytes,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_exact17_package import _emit

PACKAGE_SCHEMA = "p97-phase3-piqd-exact17-v19-package/v1"
PRODUCER_SCHEMA = "p97-phase3-piqd-exact17-v19-producer/v1"
RESULT_SCHEMA = "p97-phase3-piqd-exact17-v19-package-result/v1"
WAVE_ID = "p97-exact17-v19-order0-source-entitled-core1"
LIVE_LEAF = "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier"
PACKAGE_SCOPE = (
    "one authenticated finite exact-17 order; source custody and semantic replay "
    "only; no aggregate coverage, universal lift, or theorem closure"
)

LIVE_DIRECTORY = (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "source-faithful-cap9-direct-cnf-v19-piqd-source-entitled-20260809"
)
LIVE_MANIFEST = f"{LIVE_DIRECTORY}/o0-p0-1.manifest.json"
LIVE_CNF = f"{LIVE_DIRECTORY}/o0-p0-1.cnf"
LIVE_SIDECAR = f"{LIVE_DIRECTORY}/producer-provenance.json"

PINNED_MANIFEST_SHA256 = semantic.PINNED_V19_MANIFEST_SHA256
PINNED_CNF_SHA256 = semantic.PINNED_V19_CNF_SHA256
PINNED_SIDECAR_SHA256 = (
    "0d6aa93747da652a0fbb4517c1193fb643ef6e01bcaa978589fc133aded45378"
)
PINNED_VARIABLES = 74_813
PINNED_CLAUSES = 2_875_629
PINNED_SOURCE_COUNT = 9
PINNED_INPUT_COUNT = 45

# The manifest and repaired sidecar authenticate the hashes keyed by these nine
# names.  Paths are fixed here, rather than accepted from a caller, because the
# upstream records deliberately carry labels only for the manifest, CNF, and
# input corpus.
LIVE_SOURCE_LABELS: Mapping[str, str] = {
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
    "static_schema_lean_consumers": (
        "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean"
    ),
}

PACKAGE_FILES = frozenset(
    {
        "discovery.cnf",
        "upstream-manifest.json",
        "producer-provenance.json",
        "source-bundle.json",
        "variable-map.json",
        "semantic-package.json",
        "producer-manifest.json",
        "wave-manifest.json",
        "package-result.json",
    }
)


class Exact17V19PackageError(RuntimeError):
    """The v19 package failed a custody or identity check."""


@dataclass(frozen=True)
class PackageResult:
    output_dir: Path
    files: Mapping[str, bytes]
    hashes: Mapping[str, str]
    documents: Mapping[str, Mapping[str, Any]]
    source_bundle: semantic.SourceBundle

    @property
    def cnf(self) -> bytes:
        return self.files["discovery.cnf"]

    @property
    def producer_bytes(self) -> bytes:
        return self.files["producer-manifest.json"]

    @property
    def wave(self) -> Mapping[str, Any]:
        return self.documents["wave-manifest.json"]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _claims() -> dict[str, bool]:
    return {
        "finite_source_custody": True,
        "full_variable_map_custody": True,
        "aggregate_order_case_coverage": False,
        "universal_lift": False,
        "theorem_closure": False,
        "lean_checked": False,
    }


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise Exact17V19PackageError(message)


def _source_bundle_from_bytes(raw: bytes) -> semantic.SourceBundle:
    payload = semantic.load_strict_json(raw)
    bundle = semantic.SourceBundle(payload, raw, _sha(raw))
    semantic.validate_source_bundle(bundle)
    return bundle


def _read_regular(root: Path, label: str, *, maximum_bytes: int) -> bytes:
    """Read one bounded repository file through no-follow parent components."""

    _require(
        type(label) is str
        and bool(label)
        and not label.startswith("/")
        and all(part not in {"", ".", ".."} for part in label.split("/")),
        "unsafe repository-relative label",
    )
    _require(
        type(maximum_bytes) is int and maximum_bytes >= 0,
        "invalid package read bound",
    )
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    _require(
        nofollow is not None and directory is not None,
        "platform lacks required no-follow flags",
    )
    directory_fd = os.open("/", os.O_RDONLY | directory)
    opened_directories = [directory_fd]
    file_fd: int | None = None
    try:
        absolute_root = Path(os.path.abspath(root))
        for component in (*absolute_root.parts[1:], *label.split("/")[:-1]):
            directory_fd = os.open(
                component,
                os.O_RDONLY | directory | nofollow,
                dir_fd=directory_fd,
            )
            opened_directories.append(directory_fd)
        name = label.split("/")[-1]
        file_fd = os.open(
            name,
            os.O_RDONLY | os.O_NONBLOCK | nofollow,
            dir_fd=directory_fd,
        )
        before = os.fstat(file_fd)
        _require(
            stat.S_ISREG(before.st_mode) and before.st_nlink == 1,
            f"package input is not a private regular file: {label}",
        )
        _require(
            before.st_size <= maximum_bytes,
            f"package input exceeds its byte bound: {label}",
        )
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(file_fd, min(1024 * 1024, maximum_bytes + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            _require(
                total <= maximum_bytes,
                f"package input exceeds its byte bound: {label}",
            )
        after = os.fstat(file_fd)
        pathname = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        _require(
            _file_identity(before) == _file_identity(after) == _file_identity(pathname),
            f"package input changed while captured: {label}",
        )
        payload = b"".join(chunks)
        _require(
            len(payload) == after.st_size,
            f"package input length changed while captured: {label}",
        )
        return payload
    except OSError as exc:
        raise Exact17V19PackageError(f"cannot safely capture {label}") from exc
    finally:
        if file_fd is not None:
            os.close(file_fd)
        for descriptor in reversed(opened_directories):
            os.close(descriptor)


def _documents(files: Mapping[str, bytes]) -> dict[str, Mapping[str, Any]]:
    generated = {
        "source-bundle.json",
        "variable-map.json",
        "semantic-package.json",
        "producer-manifest.json",
        "wave-manifest.json",
        "package-result.json",
    }
    return {
        name: semantic.load_strict_json(payload)
        for name, payload in files.items()
        if name in generated
    }


def build_package(*, repo_root: Path) -> tuple[dict[str, bytes], semantic.SourceBundle]:
    """Build and fully revalidate the canonical package in memory."""

    repo_root = Path(os.path.abspath(repo_root))
    bundle = semantic.capture_source_bundle(
        root=repo_root,
        manifest_label=LIVE_MANIFEST,
        source_labels=LIVE_SOURCE_LABELS,
        provenance_sidecar_label=LIVE_SIDECAR,
    )
    bundle_payload = semantic.validate_source_bundle(bundle)
    _require(
        len(bundle_payload["sources"]) == PINNED_SOURCE_COUNT,
        "source count changed",
    )
    _require(
        len(bundle_payload["inputs"]) == PINNED_INPUT_COUNT,
        "input count changed",
    )
    _require(
        {record["name"] for record in bundle_payload["sources"]}
        == set(LIVE_SOURCE_LABELS),
        "source keys changed",
    )

    manifest_bytes = _read_regular(
        repo_root, LIVE_MANIFEST, maximum_bytes=8 * 1024 * 1024
    )
    sidecar_bytes = _read_regular(
        repo_root, LIVE_SIDECAR, maximum_bytes=8 * 1024 * 1024
    )
    cnf_bytes = _read_regular(repo_root, LIVE_CNF, maximum_bytes=256 * 1024 * 1024)
    _require(_sha(manifest_bytes) == PINNED_MANIFEST_SHA256, "manifest pin mismatch")
    _require(_sha(sidecar_bytes) == PINNED_SIDECAR_SHA256, "sidecar pin mismatch")
    _require(_sha(cnf_bytes) == PINNED_CNF_SHA256, "CNF pin mismatch")
    _require(
        bundle_payload["manifest"]["base64"]
        == __import__("base64").b64encode(manifest_bytes).decode("ascii"),
        "bundle manifest bytes changed",
    )
    _require(
        bundle_payload["provenance_sidecar"]["base64"]
        == __import__("base64").b64encode(sidecar_bytes).decode("ascii"),
        "bundle sidecar bytes changed",
    )

    variable_map = semantic.build_variable_map()
    semantic.validate_variable_map(variable_map, semantic.LIVE_ALLOCATION)
    semantic_package = semantic.build_semantic_package(
        source_bundle=bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map,
    )
    semantic.validate_semantic_package(
        semantic_package,
        source_bundle=bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map,
    )

    artifacts = {
        "discovery.cnf": cnf_bytes,
        "upstream-manifest.json": manifest_bytes,
        "producer-provenance.json": sidecar_bytes,
        "source-bundle.json": bundle.canonical_bytes,
        "variable-map.json": variable_map,
        "semantic-package.json": semantic_package,
    }
    producer = {
        "schema": PRODUCER_SCHEMA,
        "scope": PACKAGE_SCOPE,
        "wave_id": WAVE_ID,
        "requested_core_limit": 1,
        "identity": {
            "manifest_sha256": PINNED_MANIFEST_SHA256,
            "cnf_sha256": PINNED_CNF_SHA256,
            "sidecar_sha256": PINNED_SIDECAR_SHA256,
            "variables": PINNED_VARIABLES,
            "clauses": PINNED_CLAUSES,
            "source_count": PINNED_SOURCE_COUNT,
            "input_count": PINNED_INPUT_COUNT,
        },
        "artifacts": {name: _sha(raw) for name, raw in sorted(artifacts.items())},
        "claims": _claims(),
    }
    producer_bytes = semantic.canonical_json(producer)
    artifacts["producer-manifest.json"] = producer_bytes
    order_sha = _sha(semantic.canonical_json(list(semantic.EXACT_ORDER)))
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": WAVE_ID,
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": LIVE_LEAF,
            "ingress_hypotheses_sha256": bundle.sha256,
            "finite_schema": semantic.SEMANTIC_PACKAGE_SCHEMA,
            "cardinality_scope": "one finite exact-17 order (order_index 0)",
            "source_theorem": "FINITE_SOURCE_SEMANTIC_REPLAY_ONLY",
        },
        "encoding": {
            "cnf_sha256": PINNED_CNF_SHA256,
            "variable_map_sha256": _sha(variable_map),
            "producer_manifest_sha256": _sha(producer_bytes),
            "num_variables": PINNED_VARIABLES,
            "num_clauses": PINNED_CLAUSES,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": order_sha,
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
    artifacts["wave-manifest.json"] = canonical_json_bytes(wave)
    result = {
        "schema": RESULT_SCHEMA,
        "package_schema": PACKAGE_SCHEMA,
        "wave_id": WAVE_ID,
        "artifacts": {name: _sha(raw) for name, raw in sorted(artifacts.items())},
        "claims": _claims(),
    }
    artifacts["package-result.json"] = semantic.canonical_json(result)
    _require(set(artifacts) == PACKAGE_FILES, "internal package file set changed")
    return artifacts, bundle


def validate_package_files(files: Mapping[str, bytes]) -> semantic.SourceBundle:
    """Recompute every package binding from the supplied exact bytes."""

    _require(set(files) == PACKAGE_FILES, "package file set changed")
    docs = _documents(files)
    result = docs["package-result.json"]
    _require(
        set(result) == {"schema", "package_schema", "wave_id", "artifacts", "claims"},
        "package result keys changed",
    )
    _require(result.get("schema") == RESULT_SCHEMA, "package result schema changed")
    _require(result.get("package_schema") == PACKAGE_SCHEMA, "package schema changed")
    _require(result.get("wave_id") == WAVE_ID, "package wave changed")
    _require(result.get("claims") == _claims(), "package result claims changed")
    expected_hashes = {
        name: _sha(files[name]) for name in PACKAGE_FILES - {"package-result.json"}
    }
    _require(
        result.get("artifacts") == dict(sorted(expected_hashes.items())),
        "package result artifact binding changed",
    )
    producer = docs["producer-manifest.json"]
    _require(
        set(producer)
        == {
            "schema",
            "scope",
            "wave_id",
            "requested_core_limit",
            "identity",
            "artifacts",
            "claims",
        },
        "producer keys changed",
    )
    _require(producer.get("schema") == PRODUCER_SCHEMA, "producer schema changed")
    _require(
        type(producer.get("requested_core_limit")) is int
        and producer["requested_core_limit"] == 1,
        "producer core limit changed",
    )
    _require(producer.get("scope") == PACKAGE_SCOPE, "producer scope changed")
    _require(producer.get("wave_id") == WAVE_ID, "producer wave changed")
    _require(producer.get("claims") == _claims(), "producer claims changed")
    _require(
        producer.get("artifacts")
        == {
            name: _sha(files[name])
            for name in sorted(
                PACKAGE_FILES
                - {
                    "producer-manifest.json",
                    "wave-manifest.json",
                    "package-result.json",
                }
            )
        },
        "producer artifact bindings changed",
    )
    identity = producer.get("identity")
    _require(type(identity) is dict, "producer identity must be a builtin object")
    _require(
        identity
        == {
            "manifest_sha256": PINNED_MANIFEST_SHA256,
            "cnf_sha256": PINNED_CNF_SHA256,
            "sidecar_sha256": PINNED_SIDECAR_SHA256,
            "variables": PINNED_VARIABLES,
            "clauses": PINNED_CLAUSES,
            "source_count": PINNED_SOURCE_COUNT,
            "input_count": PINNED_INPUT_COUNT,
        },
        "producer identity changed",
    )
    _require(
        all(
            type(identity[field]) is int
            for field in ("variables", "clauses", "source_count", "input_count")
        ),
        "producer identity counts must be builtin integers",
    )
    _require(
        _sha(files["upstream-manifest.json"]) == PINNED_MANIFEST_SHA256,
        "manifest bytes changed",
    )
    _require(
        _sha(files["producer-provenance.json"]) == PINNED_SIDECAR_SHA256,
        "sidecar bytes changed",
    )
    _require(_sha(files["discovery.cnf"]) == PINNED_CNF_SHA256, "CNF bytes changed")
    bundle = _source_bundle_from_bytes(files["source-bundle.json"])
    semantic.validate_variable_map(files["variable-map.json"], semantic.LIVE_ALLOCATION)
    semantic.validate_semantic_package(
        files["semantic-package.json"],
        source_bundle=bundle,
        cnf_bytes=files["discovery.cnf"],
        variable_map_bytes=files["variable-map.json"],
    )
    wave = docs["wave-manifest.json"]
    validate_wave_manifest(wave)
    _require(wave["wave_id"] == WAVE_ID, "wave id changed")
    _require(
        wave["encoding"]
        == {
            "cnf_sha256": PINNED_CNF_SHA256,
            "variable_map_sha256": _sha(files["variable-map.json"]),
            "producer_manifest_sha256": _sha(files["producer-manifest.json"]),
            "num_variables": PINNED_VARIABLES,
            "num_clauses": PINNED_CLAUSES,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "wave encoding changed",
    )
    return bundle


def package_exact17_v19(*, repo_root: Path, output_dir: Path) -> PackageResult:
    files, _ = build_package(repo_root=repo_root)
    _emit(output_dir, files)
    bundle = validate_package_files(files)
    documents = _documents(files)
    return PackageResult(
        output_dir=output_dir,
        files=dict(files),
        hashes={name: _sha(raw) for name, raw in files.items()},
        documents=documents,
        source_bundle=bundle,
    )
