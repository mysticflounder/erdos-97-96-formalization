# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare a complementary SAT-profile portfolio for the six center-02 cells.

The command is offline and create-once.  It authenticates the existing physical
slice campaign and every referenced CNF/manifest through held no-follow file
descriptors.  CNFs stay in their original custody tree; only new canonical
producer and wave manifests are written.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Self

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

ROOT = REPO_ROOT
LANE_ID = "exact17-sparse-six-four-row-bisector-sat-portfolio-20260820"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "sat_profile_portfolio"
BASE_HEAD = "5697b8ecc9a614dca272d66a8cce34ee3bea2224"
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-20260820/"
    "physical-slice-cell-campaign-v1"
)
SOURCE_CAMPAIGN_PATH = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
SOURCE_RUN_MANIFEST_PATH = SOURCE_RUN_ROOT / "run_manifest.json"
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

SOURCE_CAMPAIGN_SHA256 = (
    "5e00a9a5206cbf35393e065a5b43e9daee2ae1a6c0e1eca4ee44a1cbf809ba33"
)
SOURCE_CAMPAIGN_BYTES = 93_507
SOURCE_RUN_MANIFEST_SHA256 = (
    "ca49a0a73bf62801656f2eb17b5821f8206f0451f51d42b1b9e18fec379aa214"
)
SOURCE_RUN_MANIFEST_BYTES = 1_473
CHECKPOINT_SHA256 = "d7e6518636786cebc223f8fe58c18decae06a08fb8b418c893fbfed84a28a2cd"
CHECKPOINT_BYTES = 777
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
SOURCE_CAMPAIGN_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-physical-slice-campaign/v1"
)
PORTFOLIO_SCHEMA = "p97-exact17-sparse-six-four-row-bisector-sat-profile-portfolio/v1"
PREPARATION_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-sat-profile-preparation/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
WAVE_SCHEMA = "p97-cegar-wave/v1"
BACKEND = "cadical"
SOURCE_SOLVER_PROFILE = "unsat"
SOLVER_PROFILE = "sat"
QUERY_POLARITY = "UNSAT_MEANS_OBSTRUCTION"
CELL_CATEGORIES = (
    "none",
    "unique-06",
    "unique-07",
    "unique-08",
    "unique-09",
    "unique-10",
)
CELL_COUNT = len(CELL_CATEGORIES)
NUM_VARIABLES = 308
NUM_CLAUSES = 7_409_263
REQUESTED_CORE_LIMIT = 1
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
MAX_CONCURRENCY = 6
MAX_JSON_BYTES = 2 * 1024 * 1024
MAX_CNF_BYTES = 384 * 1024 * 1024
ORDER_SHA256 = sha256_bytes(
    b"exact17-sparse-six-four-row-bisector-center-02-sat-profile-order-v1"
)
PACKAGE_SOURCE_PATHS = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_sat_portfolio.py",
    "scripts/run_piqd_exact17_sparse_six_four_row_bisector_sat_portfolio.py",
    "scripts/test_prepare_exact17_sparse_six_four_row_bisector_sat_portfolio.py",
    "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_sat_portfolio.py",
)
PRODUCTION_CELL_IDENTITIES = {
    "none": {
        "producer_sha256": "787333692186783c2f9960fddb04cac99f2296522f4592a1984fee900c105c9a",
        "wave_sha256": "e172a9ed7681a968074db4c5168c117b404be44f1528988f3c95d5e28d15c137",
        "identity_hash": "e574b4d9c7cfcc13185f41af9622d568d80b941a1fb37fc39b2388be7413b7b8",
    },
    "unique-06": {
        "producer_sha256": "78da67dc91e9185f8f1ebe591672f07aa3d4f2fe7b8db190d46a8321c1a45bd0",
        "wave_sha256": "dc2327f65fb95bf208c18901ee35f7b22be678defaf872c1f80a29919d6769c4",
        "identity_hash": "40ab2a1ef7a3aac6cccdf0b2ff2ce0f40d6162e67645c21ee4b0137268cd51af",
    },
    "unique-07": {
        "producer_sha256": "3c7809cc1895c5bab52078eab09e22a2bde69b7f1c83dfbf293947c7c3ca584e",
        "wave_sha256": "847d2545a248d4032ecd92023e23f2cce0070f95995d598ea0755e0cf72c877d",
        "identity_hash": "7c72df0bdf47d30980eff13b49db38dea5fb9a771313023a12e9edda0e31a077",
    },
    "unique-08": {
        "producer_sha256": "e899cf7fbe710bbfd431456f7885f9f4387b69918aae1120563e8fd571efa46c",
        "wave_sha256": "77f7d6eb5029d1fe2c13c08ed657b6e190f9900cd7e3a60bda1b4e5683187aab",
        "identity_hash": "fe41a44b1222cdd44a8a0df0d6b65edab38d83f44330c6304123be10a7ce46b6",
    },
    "unique-09": {
        "producer_sha256": "cecaacb22bc22cec22b5bd558c440fe0495a998542dee5704976db91c89e44a0",
        "wave_sha256": "b435d5feb2822c4d9ae40ce49dffd4d5b234598fa756ed45a870708b38996a93",
        "identity_hash": "719cb3a1c6368a3791675c751ec20825b26007190d05e0f8f62477dcc662e925",
    },
    "unique-10": {
        "producer_sha256": "824ae8fae3b68cd07dec036de20c79641f0a59b15a129b64623778822975a89c",
        "wave_sha256": "0b4075edf5bc2c0bc0e93d84b01da4eef476e88376cc58f86d1984ced5769f6a",
        "identity_hash": "243c0fb42a9a45be098ce18fa1dd650e2dc400262964d31c13cf8c9972a73152",
    },
}


class PreparationError(RuntimeError):
    """An input identity or create-once output failed its strict contract."""


@dataclass(frozen=True)
class Snapshot:
    path: str
    sha256: str
    bytes: int
    content: bytes | None


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


def _safe_relative(value: str, label: str) -> str:
    if type(value) is not str or not value:
        raise PreparationError(f"{label} must be a nonempty built-in string")
    path = PurePosixPath(value)
    if path.is_absolute() or any(part in {"", ".", ".."} for part in path.parts):
        raise PreparationError(f"{label} is not a safe repository-relative path")
    return path.as_posix()


def _relative(root: Path, path: Path) -> str:
    if type(root) is not type(Path()) or type(path) is not type(Path()):
        raise PreparationError("paths must be native Path instances")
    try:
        value = path.relative_to(root)
    except ValueError as exc:
        raise PreparationError("path escapes repository root") from exc
    return _safe_relative(value.as_posix(), "path")


def _open_root(root: Path) -> int:
    absolute = Path(os.path.abspath(root))
    if absolute != root or not root.is_absolute():
        raise PreparationError("repository root must be canonical and absolute")
    flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor: int | None = None
    try:
        descriptor = os.open(absolute.anchor, flags)
        for component in absolute.parts[1:]:
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise PreparationError("repository root contains a symlink") from exc


class DescriptorCustody:
    """Authenticate repository files without following links or trusting names."""

    def __init__(self, root: Path) -> None:
        self.root = root
        self.root_fd = _open_root(root)

    def close(self) -> None:
        os.close(self.root_fd)

    def __enter__(self) -> Self:
        return self

    def __exit__(self, *_args: object) -> None:
        self.close()

    def capture(
        self, relative: str, *, maximum_bytes: int, retain: bool = True
    ) -> Snapshot:
        relative = _safe_relative(relative, "artifact path")
        if type(maximum_bytes) is not int or maximum_bytes < 0:
            raise PreparationError("maximum_bytes must be a nonnegative integer")
        directory_flags = (
            os.O_RDONLY
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0)
        )
        opened: list[tuple[int, str, int, tuple[int, ...]]] = []
        current = os.dup(self.root_fd)
        file_fd: int | None = None
        try:
            parts = PurePosixPath(relative).parts
            for component in parts[:-1]:
                child = os.open(component, directory_flags, dir_fd=current)
                before = os.fstat(child)
                if not stat.S_ISDIR(before.st_mode):
                    raise PreparationError("artifact parent is not a directory")
                opened.append((current, component, child, _identity(before)))
                current = child
            file_fd = os.open(
                parts[-1],
                os.O_RDONLY
                | os.O_NONBLOCK
                | getattr(os, "O_NOFOLLOW", 0)
                | getattr(os, "O_CLOEXEC", 0),
                dir_fd=current,
            )
            before = os.fstat(file_fd)
            if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
                raise PreparationError(
                    f"artifact is not a private regular file: {relative}"
                )
            if before.st_size > maximum_bytes:
                raise PreparationError(f"artifact exceeds byte bound: {relative}")
            digest = hashlib.sha256()
            chunks: list[bytes] = []
            total = 0
            while True:
                block = os.read(file_fd, min(1 << 20, maximum_bytes + 1 - total))
                if not block:
                    break
                total += len(block)
                if total > maximum_bytes:
                    raise PreparationError(f"artifact exceeds byte bound: {relative}")
                digest.update(block)
                if retain:
                    chunks.append(block)
            after = os.fstat(file_fd)
            named = os.stat(parts[-1], dir_fd=current, follow_symlinks=False)
            if _identity(before) != _identity(after) or _identity(after) != _identity(
                named
            ):
                raise PreparationError(
                    f"artifact changed during authenticated read: {relative}"
                )
            if total != before.st_size:
                raise PreparationError(
                    f"artifact length changed during read: {relative}"
                )
            for parent_fd, component, child_fd, expected in reversed(opened):
                if (
                    _identity(os.fstat(child_fd)) != expected
                    or _identity(
                        os.stat(component, dir_fd=parent_fd, follow_symlinks=False)
                    )
                    != expected
                ):
                    raise PreparationError(
                        f"artifact parent changed during read: {relative}"
                    )
            return Snapshot(
                path=relative,
                sha256=digest.hexdigest(),
                bytes=total,
                content=b"".join(chunks) if retain else None,
            )
        except OSError as exc:
            raise PreparationError(
                f"no-follow artifact read failed: {relative}"
            ) from exc
        finally:
            if file_fd is not None:
                os.close(file_fd)
            for parent_fd, _component, _child_fd, _expected in reversed(opened):
                os.close(parent_fd)
            os.close(current)


def _strict_json(
    raw: bytes, label: str, *, require_canonical: bool = True
) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=unique,
            parse_constant=lambda x: (_ for _ in ()).throw(ValueError(x)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PreparationError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        raise PreparationError(f"{label} is not a JSON object")
    if require_canonical and canonical_json_bytes(value) != raw:
        raise PreparationError(f"{label} is not a canonical JSON object")
    return value


def _bind(snapshot: Snapshot, reference: Any, label: str) -> None:
    if type(reference) is not dict:
        raise PreparationError(f"{label} reference is malformed")
    if set(reference) != {"path", "sha256", "bytes"}:
        raise PreparationError(f"{label} reference keys drifted")
    if reference != {
        "path": snapshot.path,
        "sha256": snapshot.sha256,
        "bytes": snapshot.bytes,
    }:
        raise PreparationError(f"{label} byte identity drifted")


def _require_snapshot(
    custody: DescriptorCustody,
    path: str,
    digest: str,
    size: int,
    *,
    maximum_bytes: int,
    retain: bool = True,
) -> Snapshot:
    snapshot = custody.capture(path, maximum_bytes=maximum_bytes, retain=retain)
    if snapshot.sha256 != digest or snapshot.bytes != size:
        raise PreparationError(f"pinned byte identity drifted: {path}")
    return snapshot


def cell_id(category: str) -> str:
    if category not in CELL_CATEGORIES:
        raise PreparationError(f"unexpected center-02 category: {category!r}")
    return f"four-row-bisector-next-center-02-physical-{category}"


def portfolio_cell_id(category: str) -> str:
    return f"{cell_id(category)}-sat-profile-v1"


def raw_dimacs_identity(cnf_sha256: str, producer_sha256: str) -> str:
    material = (
        f"raw-dimacs/v1\n{BACKEND}\n{SOLVER_PROFILE}\n{cnf_sha256}\n"
        f"{producer_sha256}\ncores={REQUESTED_CORE_LIMIT}"
    )
    return sha256_bytes(material.encode())


def build_producer(source: dict[str, Any], source_sha256: str, category: str) -> bytes:
    if source.get("schema") != PRODUCER_SCHEMA:
        raise PreparationError("source producer schema drifted")
    if source.get("producer_id") != f"{cell_id(category)}-v1":
        raise PreparationError("source producer identity drifted")
    if (
        source.get("backend") != BACKEND
        or source.get("solver_profile") != SOURCE_SOLVER_PROFILE
    ):
        raise PreparationError("source producer backend/profile drifted")
    if source.get("query_polarity") != QUERY_POLARITY:
        raise PreparationError("source producer query polarity drifted")
    if source.get("variable_map_sha256") != VARIABLE_MAP_SHA256:
        raise PreparationError("source producer variable-map claim drifted")
    source_manifest = source.get("source_manifest")
    if type(source_manifest) is not dict or source.get(
        "source_manifest_sha256"
    ) != sha256_bytes(canonical_json_bytes(source_manifest)):
        raise PreparationError("source producer source-manifest claim drifted")
    result = dict(source)
    result["producer_id"] = portfolio_cell_id(category)
    result["solver_profile"] = SOLVER_PROFILE
    result["profile_source_producer_manifest_sha256"] = source_sha256
    return canonical_json_bytes(result)


def build_wave(
    source: dict[str, Any], producer_sha256: str, category: str, ordinal: int
) -> bytes:
    if (
        source.get("schema") != WAVE_SCHEMA
        or source.get("wave_id") != f"{cell_id(category)}-v1"
    ):
        raise PreparationError("source wave identity drifted")
    encoding = source.get("encoding")
    execution = source.get("execution")
    if type(encoding) is not dict or type(execution) is not dict:
        raise PreparationError("source wave is malformed")
    if (
        encoding.get("query_polarity") != QUERY_POLARITY
        or encoding.get("variable_map_sha256") != VARIABLE_MAP_SHA256
        or execution.get("backend") != BACKEND
        or execution.get("solver_profile") != SOURCE_SOLVER_PROFILE
    ):
        raise PreparationError("source wave profile or encoding claims drifted")
    result = dict(source)
    result["wave_id"] = portfolio_cell_id(category)
    result["encoding"] = {**encoding, "producer_manifest_sha256": producer_sha256}
    result["execution"] = {
        **execution,
        "solver_profile": SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
        "order_sha256": ORDER_SHA256,
    }
    validate_wave_manifest(result)
    return canonical_json_bytes(result)


def _file_ref(snapshot: Snapshot) -> dict[str, Any]:
    return {"path": snapshot.path, "sha256": snapshot.sha256, "bytes": snapshot.bytes}


def _payload_ref(root: Path, path: Path, payload: bytes) -> dict[str, Any]:
    return {
        "path": _relative(root, path),
        "sha256": sha256_bytes(payload),
        "bytes": len(payload),
    }


def _validate_checkpoint(value: dict[str, Any], output_root: Path, root: Path) -> None:
    if value.get("schema") != "worktree-lane-checkpoint/v1":
        raise PreparationError("lane checkpoint schema drifted")
    if value.get("lane_id") != LANE_ID or value.get("base_head") != BASE_HEAD:
        raise PreparationError("lane checkpoint identity drifted")
    if value.get("owned_paths") != list(PACKAGE_SOURCE_PATHS):
        raise PreparationError("lane checkpoint owned paths drifted")
    if value.get("generated_roots") != [_relative(root, output_root)]:
        raise PreparationError("lane checkpoint generated root drifted")
    unsigned = dict(value)
    claimed = unsigned.pop("manifest_sha256", None)
    if claimed != sha256_bytes(canonical_json_bytes(unsigned)):
        raise PreparationError("lane checkpoint embedded hash drifted")


def authenticate_source_campaign(
    *,
    root: Path = ROOT,
    campaign_path: Path = SOURCE_CAMPAIGN_PATH,
    source_run_manifest_path: Path = SOURCE_RUN_MANIFEST_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    """Authenticate and transform exactly the six source cells, without writes."""
    with DescriptorCustody(root) as custody:
        campaign_snapshot = _require_snapshot(
            custody,
            _relative(root, campaign_path),
            SOURCE_CAMPAIGN_SHA256,
            SOURCE_CAMPAIGN_BYTES,
            maximum_bytes=MAX_JSON_BYTES,
        )
        run_snapshot = _require_snapshot(
            custody,
            _relative(root, source_run_manifest_path),
            SOURCE_RUN_MANIFEST_SHA256,
            SOURCE_RUN_MANIFEST_BYTES,
            maximum_bytes=MAX_JSON_BYTES,
        )
        checkpoint_snapshot = _require_snapshot(
            custody,
            _relative(root, checkpoint_path),
            CHECKPOINT_SHA256,
            CHECKPOINT_BYTES,
            maximum_bytes=MAX_JSON_BYTES,
        )
        campaign = _strict_json(campaign_snapshot.content or b"", "source campaign")
        source_run = _strict_json(run_snapshot.content or b"", "source run manifest")
        checkpoint = _strict_json(
            checkpoint_snapshot.content or b"",
            "lane checkpoint",
            require_canonical=False,
        )
        _validate_checkpoint(checkpoint, output_root, root)
        if (
            campaign.get("schema") != SOURCE_CAMPAIGN_SCHEMA
            or campaign.get("status") != "PREPARED_LOCAL_ONLY"
        ):
            raise PreparationError("source campaign identity or status drifted")
        if source_run.get("schema") != RUN_MANIFEST_SCHEMA:
            raise PreparationError("source run manifest schema drifted")
        unsigned_source_run = dict(source_run)
        claimed_source_run = unsigned_source_run.pop("manifest_sha256", None)
        if claimed_source_run != sha256_bytes(
            canonical_json_bytes(unsigned_source_run)
        ):
            raise PreparationError("source run manifest embedded hash drifted")
        source_cells = campaign.get("cells")
        if type(source_cells) is not list:
            raise PreparationError("source campaign cells are malformed")
        selected = [
            item
            for item in source_cells
            if type(item) is dict and item.get("center") == 2
        ]
        if [item.get("category") for item in selected] != list(CELL_CATEGORIES):
            raise PreparationError("source campaign center-02 inventory drifted")

        transformed: list[dict[str, Any]] = []
        for ordinal, (category, item) in enumerate(
            zip(CELL_CATEGORIES, selected, strict=True)
        ):
            if item.get("cell_id") != cell_id(category):
                raise PreparationError("source cell identity drifted")
            cnf_ref = item.get("cnf")
            producer_ref = item.get("producer_manifest")
            wave_ref = item.get("wave_manifest")
            if not all(
                type(value) is dict for value in (cnf_ref, producer_ref, wave_ref)
            ):
                raise PreparationError("source cell references are malformed")
            cnf = custody.capture(
                _safe_relative(cnf_ref["path"], "CNF path"),
                maximum_bytes=MAX_CNF_BYTES,
                retain=False,
            )
            producer = custody.capture(
                _safe_relative(producer_ref["path"], "producer path"),
                maximum_bytes=MAX_JSON_BYTES,
            )
            wave = custody.capture(
                _safe_relative(wave_ref["path"], "wave path"),
                maximum_bytes=MAX_JSON_BYTES,
            )
            _bind(cnf, cnf_ref, "CNF")
            _bind(producer, producer_ref, "source producer")
            _bind(wave, wave_ref, "source wave")
            source_producer = _strict_json(producer.content or b"", "source producer")
            source_wave = _strict_json(wave.content or b"", "source wave")
            if (
                source_wave.get("encoding", {}).get("cnf_sha256") != cnf.sha256
                or source_wave.get("encoding", {}).get("producer_manifest_sha256")
                != producer.sha256
                or source_wave.get("encoding", {}).get("num_variables") != NUM_VARIABLES
                or source_wave.get("encoding", {}).get("num_clauses") != NUM_CLAUSES
            ):
                raise PreparationError("source wave encoding identity drifted")
            producer_bytes = build_producer(source_producer, producer.sha256, category)
            producer_sha256 = sha256_bytes(producer_bytes)
            wave_bytes = build_wave(source_wave, producer_sha256, category, ordinal)
            transformed.append(
                {
                    "cell_id": cell_id(category),
                    "portfolio_cell_id": portfolio_cell_id(category),
                    "category": category,
                    "ordinal": ordinal,
                    "source_cnf": cnf,
                    "source_producer": producer,
                    "source_wave": wave,
                    "producer_bytes": producer_bytes,
                    "wave_bytes": wave_bytes,
                    "expected_identity_hash": raw_dimacs_identity(
                        cnf.sha256, producer_sha256
                    ),
                    "claims": item.get("claims"),
                }
            )
        if root == ROOT and campaign_path == SOURCE_CAMPAIGN_PATH:
            actual_identities = {
                item["category"]: {
                    "producer_sha256": sha256_bytes(item["producer_bytes"]),
                    "wave_sha256": sha256_bytes(item["wave_bytes"]),
                    "identity_hash": item["expected_identity_hash"],
                }
                for item in transformed
            }
            if actual_identities != PRODUCTION_CELL_IDENTITIES:
                raise PreparationError("production SAT-profile identities drifted")
        package_sources = {
            path: custody.capture(
                path, maximum_bytes=MAX_JSON_BYTES, retain=False
            ).sha256
            for path in PACKAGE_SOURCE_PATHS
        }
    return {
        "campaign": campaign_snapshot,
        "source_run": run_snapshot,
        "checkpoint": checkpoint_snapshot,
        "package_sources": package_sources,
        "cells": transformed,
    }


def _write_once(path: Path, payload: bytes) -> None:
    if path.exists() or path.is_symlink():
        raise PreparationError(f"refusing existing output: {path}")
    descriptor = os.open(
        path,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
        0o600,
    )
    try:
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise PreparationError("output write made no progress")
            offset += written
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    info = os.lstat(path)
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise PreparationError("new output is not a private regular file")


def _mkdir_once(path: Path) -> None:
    try:
        path.mkdir()
    except FileExistsError as exc:
        raise PreparationError(f"refusing existing/reentry output: {path}") from exc
    info = os.lstat(path)
    if not stat.S_ISDIR(info.st_mode):
        raise PreparationError(f"new output is not a directory: {path}")


def _mkdir_output_root(root: Path, output_root: Path) -> int:
    """Create governed parents no-follow, then reserve the run root once."""
    relative = PurePosixPath(_relative(root, output_root))
    flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor = _open_root(root)
    output_fd: int | None = None
    try:
        for component in relative.parts[:-1]:
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except FileNotFoundError:
                os.mkdir(component, 0o700, dir_fd=descriptor)
                child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
        try:
            os.mkdir(relative.parts[-1], 0o700, dir_fd=descriptor)
        except FileExistsError as exc:
            raise PreparationError(
                f"refusing existing/reentry output: {output_root}"
            ) from exc
        output_fd = os.open(relative.parts[-1], flags, dir_fd=descriptor)
        named = os.stat(relative.parts[-1], dir_fd=descriptor, follow_symlinks=False)
        if _identity(os.fstat(output_fd)) != _identity(named):
            raise PreparationError("new run root changed during reservation")
        os.fsync(descriptor)
    except PreparationError:
        if output_fd is not None:
            os.close(output_fd)
            output_fd = None
        raise
    except OSError as exc:
        if output_fd is not None:
            os.close(output_fd)
            output_fd = None
        raise PreparationError(
            "output path contains a symlink or unsafe component"
        ) from exc
    finally:
        os.close(descriptor)
    if output_fd is None:
        raise PreparationError("new run root was not opened")
    info = os.fstat(output_fd)
    if not stat.S_ISDIR(info.st_mode):
        os.close(output_fd)
        raise PreparationError("new run root is unsafe")
    return output_fd


def _mkdir_at(parent_fd: int, name: str) -> int:
    if name in {"", ".", ".."} or "/" in name:
        raise PreparationError("unsafe output directory name")
    try:
        os.mkdir(name, 0o700, dir_fd=parent_fd)
        child = os.open(
            name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent_fd,
        )
    except OSError as exc:
        raise PreparationError(
            f"cannot create private output directory: {name}"
        ) from exc
    named = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    if _identity(os.fstat(child)) != _identity(named):
        os.close(child)
        raise PreparationError(f"output directory changed during creation: {name}")
    os.fsync(parent_fd)
    return child


def _write_once_at(parent_fd: int, name: str, payload: bytes) -> None:
    if name in {"", ".", ".."} or "/" in name:
        raise PreparationError("unsafe output file name")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | os.O_NOFOLLOW
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=parent_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise PreparationError("output write made no progress")
            offset += written
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        named = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or _identity(info) != _identity(named)
        ):
            raise PreparationError("new output is not a stable private regular file")
        os.fsync(parent_fd)
    except OSError as exc:
        raise PreparationError(f"cannot create private output file: {name}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _build_run_manifest(
    root: Path, output_root: Path, authenticated: dict[str, Any]
) -> bytes:
    inputs = {
        authenticated["campaign"].path: authenticated["campaign"].sha256,
        authenticated["source_run"].path: authenticated["source_run"].sha256,
    }
    for item in authenticated["cells"]:
        for key in ("source_cnf", "source_producer", "source_wave"):
            snapshot = item[key]
            inputs[snapshot.path] = snapshot.sha256
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _relative(root, output_root),
        "owner": RUN_OWNER,
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {
            **authenticated["package_sources"],
            authenticated["checkpoint"].path: authenticated["checkpoint"].sha256,
        },
        "input_digests": dict(sorted(inputs.items())),
        "created_utc": "2026-08-21T03:11:29Z",
    }
    manifest["manifest_sha256"] = sha256_bytes(canonical_json_bytes(manifest))
    return canonical_json_bytes(manifest)


def prepare_portfolio(
    *,
    root: Path = ROOT,
    campaign_path: Path = SOURCE_CAMPAIGN_PATH,
    source_run_manifest_path: Path = SOURCE_RUN_MANIFEST_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    root = Path(os.path.abspath(root))
    output_root = Path(os.path.abspath(output_root))
    try:
        output_root.relative_to(root)
    except ValueError as exc:
        raise PreparationError("output root must be inside repository") from exc
    if output_root.exists() or output_root.is_symlink():
        raise PreparationError("refusing existing/reentry portfolio root")
    authenticated = authenticate_source_campaign(
        root=root,
        campaign_path=campaign_path,
        source_run_manifest_path=source_run_manifest_path,
        checkpoint_path=checkpoint_path,
        output_root=output_root,
    )
    run_fd = _mkdir_output_root(root, output_root)
    artifacts_fd: int | None = None
    cells_fd: int | None = None
    try:
        artifacts_fd = _mkdir_at(run_fd, "artifacts")
        for name in ("events", "tmp"):
            child = _mkdir_at(run_fd, name)
            os.close(child)
        cells_fd = _mkdir_at(artifacts_fd, "cells")
        cells_root = output_root / "artifacts/cells"
        cells: list[dict[str, Any]] = []
        for item in authenticated["cells"]:
            directory = cells_root / item["portfolio_cell_id"]
            cell_fd = _mkdir_at(cells_fd, item["portfolio_cell_id"])
            try:
                producer_path = directory / "producer-manifest.json"
                wave_path = directory / "wave-manifest.json"
                _write_once_at(cell_fd, producer_path.name, item["producer_bytes"])
                _write_once_at(cell_fd, wave_path.name, item["wave_bytes"])
            finally:
                os.close(cell_fd)
            cells.append(
                {
                    "cell_id": item["cell_id"],
                    "portfolio_cell_id": item["portfolio_cell_id"],
                    "category": item["category"],
                    "ordinal": item["ordinal"],
                    "source_cnf": _file_ref(item["source_cnf"]),
                    "source_producer_manifest": _file_ref(item["source_producer"]),
                    "source_wave_manifest": _file_ref(item["source_wave"]),
                    "producer_manifest": _payload_ref(
                        root, producer_path, item["producer_bytes"]
                    ),
                    "wave_manifest": _payload_ref(root, wave_path, item["wave_bytes"]),
                    "expected_identity_hash": item["expected_identity_hash"],
                    "claims": item["claims"],
                }
            )
        campaign = {
            "schema": PORTFOLIO_SCHEMA,
            "status": "PREPARED_LOCAL_ONLY",
            "project": "erdos-97-96-formalization",
            "source_campaign": _file_ref(authenticated["campaign"]),
            "source_run_manifest": _file_ref(authenticated["source_run"]),
            "cnf_custody": "REFERENCE_ONLY_NO_COPY",
            "execution": {
                "backend": BACKEND,
                "solver_profile": SOLVER_PROFILE,
                "query_polarity": QUERY_POLARITY,
                "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
                "solve_timeout_s": SOLVE_TIMEOUT_S,
                "replay_timeout_s": REPLAY_TIMEOUT_S,
                "maximum_concurrency": MAX_CONCURRENCY,
                "duplicate_recovery_owner": None,
            },
            "cell_count": len(cells),
            "cells": cells,
            "claims": {
                "exact17_closed": False,
                "lean_closure": False,
                "source_entitlement": False,
                "theorem_coverage": False,
                "universal_lift": False,
            },
        }
        campaign_bytes = canonical_json_bytes(campaign)
        campaign_output = output_root / "artifacts/campaign-manifest.json"
        _write_once_at(artifacts_fd, campaign_output.name, campaign_bytes)
        report = {
            "schema": PREPARATION_SCHEMA,
            "status": "PREPARED_LOCAL_ONLY",
            "production_run": False,
            "cell_count": CELL_COUNT,
            "campaign_manifest": _payload_ref(root, campaign_output, campaign_bytes),
            "expected_identity_hashes": {
                item["portfolio_cell_id"]: item["expected_identity_hash"]
                for item in cells
            },
        }
        _write_once_at(
            artifacts_fd,
            "preparation-report.json",
            canonical_json_bytes(report),
        )
        _write_once_at(
            run_fd,
            "run_manifest.json",
            _build_run_manifest(root, output_root, authenticated),
        )
        return report
    finally:
        if cells_fd is not None:
            os.close(cells_fd)
        if artifacts_fd is not None:
            os.close(artifacts_fd)
        os.close(run_fd)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-root", type=Path, default=OUTPUT_ROOT)
    args = parser.parse_args(argv)
    try:
        report = prepare_portfolio(output_root=args.output_root)
    except (OSError, PreparationError) as exc:
        print(f"SAT-profile portfolio preparation rejected: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
