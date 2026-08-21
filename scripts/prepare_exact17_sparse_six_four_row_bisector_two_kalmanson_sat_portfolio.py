# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Draft the successor SAT-profile portfolio for the six center-02 cells.

The command is offline and create-once.  It authenticates the existing physical
slice campaign and every referenced CNF/manifest through held no-follow file
descriptors.  CNFs stay in their original custody tree; only new canonical
producer and wave manifests are written. Production is deliberately disabled
until the source campaign and this lane's generated root are frozen into the
explicit pin inventory below.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import subprocess
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
LANE_ID = "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "exact17-two-kalmanson-sat-portfolio"
BASE_HEAD = "ba6113a21f65ce3885d904773210e836f35cc7c3"
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-two-kalmanson-"
    "preparer-20260820/"
    "physical-slice-cell-campaign-v1"
)
SOURCE_CAMPAIGN_PATH = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
SOURCE_RUN_MANIFEST_PATH = SOURCE_RUN_ROOT / "run_manifest.json"
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_"
    "two_kalmanson_physical_slice_cells.py"
)
SOURCE_PREPARER_PATH = ROOT / SOURCE_PREPARER_RELATIVE
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = (
    "f89fbf2e9223e30e9a7ae368de130f42b5397597b146e610b593c22d3f93d293"
)
SOURCE_CAMPAIGN_BYTES = 104_180
SOURCE_RUN_MANIFEST_SHA256 = (
    "84410583ac7da6e6adcf5443fabd2e6e93a75d45f72a74f0c1fe691a1cbc128d"
)
SOURCE_RUN_MANIFEST_BYTES = 1_654
SOURCE_PREPARER_COMMIT = "83f958d0490730f09179ca65cdef00e3886f2bd1"
SOURCE_PREPARER_SHA256 = (
    "eca6f895325048835a499292d63c2fb14f25423665c1be75b94838566d1d4f9f"
)
SOURCE_PREPARER_BYTES = 67_278
CHECKPOINT_SHA256 = "c070f1b95e75b6130d2143064aa497ef5c9dc81fb126e6c156b04b9cdb6ed6ad"
CHECKPOINT_BYTES = 875
FINALIZATION_REQUIRED = (
    "SOURCE_CAMPAIGN_SHA256",
    "SOURCE_CAMPAIGN_BYTES",
    "SOURCE_RUN_MANIFEST_SHA256",
    "SOURCE_RUN_MANIFEST_BYTES",
    "SOURCE_PREPARER_COMMIT",
    "SOURCE_PREPARER_SHA256",
    "SOURCE_PREPARER_BYTES",
    "CHECKPOINT_SHA256",
    "CHECKPOINT_BYTES",
    "PRODUCTION_CELL_IDENTITIES[none,unique-06,...,unique-10]",
)
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
SOURCE_CAMPAIGN_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-physical-slice-campaign/v1"
)
PORTFOLIO_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-portfolio/v1"
)
PREPARATION_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-preparation/v1"
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
NUM_CLAUSES = 7_409_267
REQUESTED_CORE_LIMIT = 1
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
MAX_CONCURRENCY = 6
MAX_JSON_BYTES = 2 * 1024 * 1024
MAX_CNF_BYTES = 384 * 1024 * 1024
ORDER_SHA256 = sha256_bytes(
    b"exact17-sparse-six-four-row-bisector-two-kalmanson-center-02-sat-profile-order-v1"
)
PACKAGE_SOURCE_PATHS = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
    "scripts/run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
    "scripts/test_prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
    "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
)
PRODUCTION_CELL_IDENTITIES = {
    "none": {
        "producer_sha256": "2add24bf43404618aa74509689f0839a96b9a1fb379792811048031dd417ec11",
        "wave_sha256": "fc1e55566924a4ab3b0129c03f89b86219b71e167b068c7672311d9da3d56c91",
        "identity_hash": "329386b05066f38aa2fdbb1e08595ee6700962ae76aeccd5555b60498e64b7a1",
    },
    "unique-06": {
        "producer_sha256": "6827f5c0e83b1bc244d52eb2fef6b917614d5598b3b960f97ee649717dbf7154",
        "wave_sha256": "36f519787262905cbc7742e4c0985855bfff38240e463e48c92ab76b1a616875",
        "identity_hash": "c1e36f13b23a8c9bd73add6022f752fdc10df73ab6ba4a6e41bc1295cb3445ba",
    },
    "unique-07": {
        "producer_sha256": "68bda764bff3f23fd397ed427e31b9bdb78c45fb1c83380073a55d01f2bd6177",
        "wave_sha256": "3208b7914748e3bab01841d9af26725ea0f009344286851bb431c0304d622972",
        "identity_hash": "1227f502c7314e31b2cf20e061abbf618e613fbe3d5f87b747d32849dbf5582e",
    },
    "unique-08": {
        "producer_sha256": "d092a3c30ac8073688c6cb0504f508d16c1c61715a76fbed3c0b7ff297dc05b9",
        "wave_sha256": "7a9f8830071ebf0c69c4070a9c15595ac0a12cca57930f8e306c5fdf7f12cd71",
        "identity_hash": "6921724d5267949a941fedbc332b3181030cea2e34eaa23dec8e6f042b3ec9a9",
    },
    "unique-09": {
        "producer_sha256": "e7ab21283b6fe97f18941bbee13e754dfa410946ea270eb40ac68707885bb455",
        "wave_sha256": "d94571a683b80d5fd73794175ff235e6ca2e250b7fbc67498908f565f8af412a",
        "identity_hash": "d7cec64d4b93b633958e64f33d4e1ae2b9ef523f3fc8a96beed6db96a0fb2323",
    },
    "unique-10": {
        "producer_sha256": "848f0851bbe80697ec5ee05016c26920233aa1d4ca2c1231d1ecbf96558e1a75",
        "wave_sha256": "299971ae8b67d8bfbf275bb576be7e130cebab39af1331016d4517849ef8e901",
        "identity_hash": "fd90381904c9f2943cc61ec8f634bb107fc0151e7ee223e4a93b756006bbe805",
    },
}


class PreparationError(RuntimeError):
    """An input identity or create-once output failed its strict contract."""


def require_production_pins_finalized(root: Path) -> None:
    """Reject the repository production route until every source pin is frozen."""
    if Path(os.path.abspath(root)) == ROOT and not PRODUCTION_PINS_FINALIZED:
        missing = ", ".join(FINALIZATION_REQUIRED)
        raise PreparationError(
            f"production pins are provisional; finalize before use: {missing}"
        )


def require_committed_source_preparer(root: Path, snapshot: Snapshot) -> None:
    """Bind the live preparer bytes to the exact committed Git blob."""
    if Path(os.path.abspath(root)) != ROOT:
        return
    relative = _relative(root, SOURCE_PREPARER_PATH)
    try:
        result = subprocess.run(
            ["git", "cat-file", "blob", f"{SOURCE_PREPARER_COMMIT}:{relative}"],
            cwd=root,
            check=False,
            capture_output=True,
            timeout=30,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise PreparationError("cannot read pinned source-preparer Git blob") from exc
    if result.returncode != 0:
        raise PreparationError("pinned source-preparer Git blob is unavailable")
    if (
        sha256_bytes(result.stdout) != SOURCE_PREPARER_SHA256
        or len(result.stdout) != SOURCE_PREPARER_BYTES
        or snapshot.content != result.stdout
    ):
        raise PreparationError("live source preparer differs from pinned Git blob")


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
        self,
        relative: str,
        *,
        maximum_bytes: int,
        retain: bool = True,
        expected_dimacs: tuple[int, int] | None = None,
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
        dimacs_header = bytearray()
        dimacs_body_started = False
        dimacs_body_newlines = 0
        dimacs_body_terminators = 0
        dimacs_body_tail = b""

        def scan_dimacs(block: bytes) -> None:
            nonlocal dimacs_body_started
            nonlocal dimacs_body_newlines
            nonlocal dimacs_body_terminators
            nonlocal dimacs_body_tail
            if expected_dimacs is None:
                return
            body = block
            if not dimacs_body_started:
                newline = body.find(b"\n")
                if newline < 0:
                    dimacs_header.extend(body)
                    if len(dimacs_header) > 128:
                        raise PreparationError("DIMACS header exceeds byte bound")
                    return
                dimacs_header.extend(body[:newline])
                expected_header = (
                    f"p cnf {expected_dimacs[0]} {expected_dimacs[1]}".encode()
                )
                if bytes(dimacs_header) != expected_header:
                    raise PreparationError("DIMACS header dimensions drifted")
                dimacs_body_started = True
                body = body[newline + 1 :]
            combined = dimacs_body_tail + body
            dimacs_body_newlines += body.count(b"\n")
            dimacs_body_terminators += combined.count(b" 0\n")
            dimacs_body_tail = combined[-2:]

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
                scan_dimacs(block)
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
            if expected_dimacs is not None:
                if not dimacs_body_started:
                    raise PreparationError("DIMACS header is missing or truncated")
                if dimacs_body_tail[-1:] != b"\n":
                    raise PreparationError("DIMACS body is truncated")
                if (
                    dimacs_body_newlines != expected_dimacs[1]
                    or dimacs_body_terminators != expected_dimacs[1]
                ):
                    raise PreparationError("DIMACS body clause count drifted")
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
    return f"four-row-bisector-two-kalmanson-next-center-02-physical-{category}"


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
    require_production_pins_finalized(root)
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
        source_preparer_snapshot = _require_snapshot(
            custody,
            SOURCE_PREPARER_RELATIVE,
            SOURCE_PREPARER_SHA256,
            SOURCE_PREPARER_BYTES,
            maximum_bytes=MAX_JSON_BYTES,
        )
        require_committed_source_preparer(root, source_preparer_snapshot)
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
                expected_dimacs=(NUM_VARIABLES, NUM_CLAUSES),
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
        for label, values in (
            (
                "producer",
                [sha256_bytes(item["producer_bytes"]) for item in transformed],
            ),
            ("wave", [sha256_bytes(item["wave_bytes"]) for item in transformed]),
            (
                "raw-DIMACS",
                [item["expected_identity_hash"] for item in transformed],
            ),
        ):
            if len(values) != CELL_COUNT or len(set(values)) != CELL_COUNT:
                raise PreparationError(
                    f"transformed {label} identities are not six-way unique"
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
        "source_preparer": source_preparer_snapshot,
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
        authenticated["source_preparer"].path: authenticated["source_preparer"].sha256,
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
            "source_preparer": {
                **_file_ref(authenticated["source_preparer"]),
                "commit": SOURCE_PREPARER_COMMIT,
                "git_blob_sha256": SOURCE_PREPARER_SHA256,
            },
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
