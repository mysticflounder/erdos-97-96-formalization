# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor-refinement physical cells.

The production byte identities are intentionally blank in this code checkpoint.
Consequently ``prepare`` and every command which can contact PIQD fail closed
until a later, reviewed pin commit authenticates the regenerated campaign.

Once pinned, the runner admits exactly the 308-variable, 7,409,310-clause
campaign.  It launches ``center=2 / physical=none`` alone, requires an
immutable independent replay/mining acceptance receipt, then schedules the
remaining 75 cells with at most twelve one-core jobs active at once.  Recovery
never submits a second job for a cell already bound to a journal job id.
"""

from __future__ import annotations

import argparse
import fcntl
import json
import os
import stat
import subprocess
import sys
import time
from collections.abc import Mapping, Sequence
from concurrent.futures import FIRST_COMPLETED, Future, ThreadPoolExecutor, wait
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

import run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio as _legacy

from census.p97_search import phase3_piqd_driver as _driver
from census.p97_search.phase3_cegar_wave import (
    CERTIFIED_UNSAT,
    CHECKPOINT,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    PiqdCegarDriver,
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_oracle import (
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_replay import (
    LeanLratReplayer,
    LratReplayError,
    LratReplayResult,
    validate_replay_result,
)

LANE_ID = "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio"
BASE_HEAD = "9b234bbabebe6953ff7dac721a189b2c4c90b9fb"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-refinements-sat-runner-code-20260822.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_physical_slice_cells.py"
)
RUNNER_RELATIVE = (
    "scripts/run_piqd_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_sat_portfolio.py"
)
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_sat_portfolio.py"
)
MINER_RELATIVE = (
    "scripts/mine_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_sat_canary.py"
)
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-canary-perp-bisector-survivor-refinements-"
    "preparer-20260822/preparation-v1"
)
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# A later pin-only checkpoint fills every field below from the authenticated
# regenerated campaign.  Empty values are executable launch blockers.
PRODUCTION_PINS_FINALIZED = False
SOURCE_CAMPAIGN_SHA256 = ""
SOURCE_CAMPAIGN_BYTES = 0
SOURCE_RUN_MANIFEST_SHA256 = ""
SOURCE_RUN_MANIFEST_BYTES = 0
SOURCE_PREPARER_COMMIT = ""
SOURCE_PREPARER_SHA256 = ""
SOURCE_PREPARER_BYTES = 0
CHECKPOINT_SHA256 = ""
CHECKPOINT_BYTES = 0
RUNNER_CODE_CHECKPOINT_SHA256 = ""
RUNNER_CODE_CHECKPOINT_BYTES = 0
MINER_SHA256 = ""
MINER_BYTES = 0
MINER_NAME = ""
MINER_SCHEMA = ""
MINER_VERSION = ""
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = ()
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {}
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {}

NUM_VARIABLES = 308
NUM_CLAUSES = 7_409_310
CELL_COUNT = 76
NAMED_ORDER_TABLES = {
    0: (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    1: (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
}
REQUESTED_CORE_LIMIT = 1
MAX_ACTIVE_JOBS = 12
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
MAX_POLLS = 2_400
POLL_INTERVAL_S = 2.0
MINE_VERIFICATION_TIMEOUT_S = 1_800
BACKEND = "cadical"
SOLVER_PROFILE = "sat"
SOURCE_SOLVER_PROFILE = "unsat"
QUERY_POLARITY = "UNSAT_MEANS_OBSTRUCTION"
PROJECT = "erdos-97-96-exact17-canary-perp-bisector-survivor-refinements-sat-v1"

SOURCE_CAMPAIGN_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-physical-slice-campaign/v1"
)
CAMPAIGN_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-campaign/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-launch/v1"
)
RESULT_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-result/v1"
)
ACCEPTANCE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-canary-acceptance/v1"
)
SAT_REPLAY_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-independent-sat-replay/v1"
)
WAVE_MINE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-mine/v1"
)
WAVE_MINE_LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-"
    "wave-only-candidate-ledger/v1"
)
WAVE_MINE_CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-candidate/v1"
)
MINE_VERIFICATION_SCHEMA = (
    "p97-exact17-survivor-refinements-source-valid-theorem-mine-verification/v1"
)
IDENTITY_DERIVATION_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-"
    "sat-profile-identity-derivation/v1"
)
UNSAT_REPLAY_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-independent-unsat-replay/v1"
)
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement"
    "SurvivorRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinement"
    "SurvivorRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-physical-slice/v1"
)
CANARY_SOURCE_CELL_ID = (
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-none"
)
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-sat-profile-v1"
DIRECT_SENTINELS = frozenset(
    {
        (0, "none"),
        (0, "unique-06"),
        (2, "none"),
        (6, "none"),
        (16, "unique-10"),
    }
)

CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-v1")

_HEX = frozenset("0123456789abcdef")
_TERMINAL_RESULT_KEYS = frozenset(
    {
        "portfolio_cell_id",
        "job_id",
        "outcome",
        "terminal_record_sha256",
        "journal_record_count",
        "seal_sha256",
    }
)


class PortfolioRunnerError(RuntimeError):
    """The authenticated campaign or gated execution failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise PortfolioRunnerError(message)


def _digest(value: Any, label: str) -> str:
    _require(
        type(value) is str and len(value) == 64 and all(char in _HEX for char in value),
        f"{label} must be lowercase SHA-256",
    )
    return value


def _strict_json(raw: bytes, label: str) -> dict[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicate(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=reject_duplicate,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise PortfolioRunnerError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    _require(canonical_json_bytes(value) == raw, f"{label} is not canonical JSON")
    return value


def _require_exact_keys(
    value: Any, expected: set[str] | frozenset[str], label: str
) -> dict[str, Any]:
    _require(
        type(value) is dict and set(value) == set(expected),
        f"{label} schema drifted",
    )
    return value


def _self_hash(payload: Mapping[str, Any], field: str = "manifest_sha256") -> str:
    unsigned = {key: value for key, value in payload.items() if key != field}
    return sha256_bytes(canonical_json_bytes(unsigned))


def _relative(root: Path, path: Path) -> str:
    try:
        return path.resolve().relative_to(root.resolve()).as_posix()
    except ValueError as exc:
        raise PortfolioRunnerError("path escapes the authenticated root") from exc


def _safe_path(root: Path, relative: Any, label: str) -> Path:
    _require(type(relative) is str and relative, f"{label} path is invalid")
    pure = PurePosixPath(relative)
    _require(
        not pure.is_absolute() and ".." not in pure.parts and "." not in pure.parts,
        f"{label} path escapes its root",
    )
    target = root / pure
    _relative(root, target)
    return target


def _read_private_file(path: Path, *, maximum: int, label: str) -> bytes:
    try:
        before = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} is missing") from exc
    _require(stat.S_ISREG(before.st_mode), f"{label} is not a regular file")
    _require(before.st_nlink == 1, f"{label} is linked")
    _require(before.st_mode & 0o077 == 0, f"{label} is not private")
    _require(before.st_size <= maximum, f"{label} exceeds its byte bound")
    try:
        descriptor = os.open(
            path,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
        )
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} cannot be opened safely") from exc
    try:
        held = os.fstat(descriptor)
        _require(
            (held.st_dev, held.st_ino, held.st_mode, held.st_nlink)
            == (before.st_dev, before.st_ino, before.st_mode, before.st_nlink),
            f"{label} identity changed",
        )
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1 << 20, maximum + 1 - total))
            if not chunk:
                break
            total += len(chunk)
            _require(total <= maximum, f"{label} exceeds its byte bound")
            chunks.append(chunk)
        after = os.fstat(descriptor)
        _require(
            (after.st_dev, after.st_ino, after.st_size)
            == (held.st_dev, held.st_ino, total),
            f"{label} changed while read",
        )
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _read_repo_source_file(path: Path, *, maximum: int, label: str) -> bytes:
    """Descriptor-read immutable Git source while permitting mode 0644."""

    try:
        before = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} is missing") from exc
    _require(stat.S_ISREG(before.st_mode), f"{label} is not a regular file")
    _require(before.st_nlink == 1, f"{label} is linked")
    _require(before.st_mode & 0o022 == 0, f"{label} is group/world writable")
    _require(before.st_uid == os.getuid(), f"{label} has the wrong owner")
    _require(before.st_size <= maximum, f"{label} exceeds its byte bound")
    try:
        descriptor = os.open(
            path,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
        )
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} cannot be opened safely") from exc
    try:
        held = os.fstat(descriptor)
        _require(
            (held.st_dev, held.st_ino, held.st_mode, held.st_nlink, held.st_uid)
            == (
                before.st_dev,
                before.st_ino,
                before.st_mode,
                before.st_nlink,
                before.st_uid,
            ),
            f"{label} identity changed",
        )
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1 << 20, maximum + 1 - total))
            if not chunk:
                break
            total += len(chunk)
            _require(total <= maximum, f"{label} exceeds its byte bound")
            chunks.append(chunk)
        after = os.fstat(descriptor)
        _require(
            (
                after.st_dev,
                after.st_ino,
                after.st_mode,
                after.st_nlink,
                after.st_uid,
                after.st_size,
                after.st_mtime_ns,
            )
            == (
                held.st_dev,
                held.st_ino,
                held.st_mode,
                held.st_nlink,
                held.st_uid,
                total,
                held.st_mtime_ns,
            ),
            f"{label} changed while read",
        )
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _read_ref(root: Path, ref: Mapping[str, Any], label: str, maximum: int) -> bytes:
    _require(type(ref) is dict, f"{label} reference is malformed")
    path = _safe_path(root, ref.get("path"), label)
    raw = _read_private_file(path, maximum=maximum, label=label)
    _require(type(ref.get("bytes")) is int, f"{label} byte count is invalid")
    _require(len(raw) == ref["bytes"], f"{label} byte count drifted")
    _require(
        sha256_bytes(raw) == _digest(ref.get("sha256"), label), f"{label} hash drifted"
    )
    return raw


def _require_production_pins() -> None:
    fields = {
        "source campaign hash": SOURCE_CAMPAIGN_SHA256,
        "source run hash": SOURCE_RUN_MANIFEST_SHA256,
        "source preparer commit": SOURCE_PREPARER_COMMIT,
        "source preparer hash": SOURCE_PREPARER_SHA256,
        "production checkpoint hash": CHECKPOINT_SHA256,
        "runner-code checkpoint hash": RUNNER_CODE_CHECKPOINT_SHA256,
        "miner hash": MINER_SHA256,
    }
    _require(PRODUCTION_PINS_FINALIZED is True, "production identities are provisional")
    for label, value in fields.items():
        _require(type(value) is str and value, f"{label} is not finalized")
    for label, value in (
        ("source campaign bytes", SOURCE_CAMPAIGN_BYTES),
        ("source run bytes", SOURCE_RUN_MANIFEST_BYTES),
        ("source preparer bytes", SOURCE_PREPARER_BYTES),
        ("production checkpoint bytes", CHECKPOINT_BYTES),
        ("runner-code checkpoint bytes", RUNNER_CODE_CHECKPOINT_BYTES),
        ("miner bytes", MINER_BYTES),
    ):
        _require(type(value) is int and value > 0, f"{label} is not finalized")
    _require(
        len(SOURCE_PREPARER_COMMIT) == 40
        and all(char in _HEX for char in SOURCE_PREPARER_COMMIT),
        "source preparer commit is not a lowercase full Git identity",
    )
    _require(
        len(SOURCE_CELL_IDENTITIES) == CELL_COUNT
        and len(PRODUCTION_CELL_IDENTITIES) == CELL_COUNT,
        "the 76 cell identity tables are not finalized",
    )
    for value, label in (
        (MINER_NAME, "miner name"),
        (MINER_SCHEMA, "miner schema"),
        (MINER_VERSION, "miner version"),
    ):
        _require(type(value) is str and bool(value), f"{label} is not finalized")
    _require(
        bool(PINNED_SOURCE_VALID_FAMILIES)
        and tuple(sorted(set(PINNED_SOURCE_VALID_FAMILIES)))
        == PINNED_SOURCE_VALID_FAMILIES,
        "source-valid miner family inventory is not finalized",
    )


def _authenticate_runner_support(root: Path = ROOT) -> dict[str, str]:
    """Re-read the governed Python/checkpoint support before any launch route."""

    _require_production_pins()
    observed: dict[str, str] = {}
    for relative, expected_hash, expected_bytes, label in (
        (
            SOURCE_PREPARER_RELATIVE,
            SOURCE_PREPARER_SHA256,
            SOURCE_PREPARER_BYTES,
            "source preparer",
        ),
        (
            CHECKPOINT_RELATIVE,
            CHECKPOINT_SHA256,
            CHECKPOINT_BYTES,
            "production checkpoint",
        ),
        (
            RUNNER_CODE_CHECKPOINT_RELATIVE,
            RUNNER_CODE_CHECKPOINT_SHA256,
            RUNNER_CODE_CHECKPOINT_BYTES,
            "runner-code checkpoint",
        ),
        (MINER_RELATIVE, MINER_SHA256, MINER_BYTES, "wave-only miner"),
    ):
        raw = _read_repo_source_file(
            root / relative,
            maximum=max(expected_bytes, 1 << 20),
            label=label,
        )
        _require(
            len(raw) == expected_bytes
            and sha256_bytes(raw) == _digest(expected_hash, label),
            f"{label} support pin drifted",
        )
        observed[relative] = expected_hash
    checkpoint = _strict_json(
        _read_repo_source_file(
            root / CHECKPOINT_RELATIVE,
            maximum=max(CHECKPOINT_BYTES, 1 << 20),
            label="production checkpoint",
        ),
        "production checkpoint",
    )
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require_exact_keys(
        checkpoint,
        {
            "schema",
            "lane_id",
            "owner",
            "base_head",
            "created_utc",
            "owned_paths",
            "durable_paths",
            "generated_roots",
            "manifest_sha256",
        },
        "production checkpoint",
    )
    _require(
        checkpoint["schema"] == "worktree-lane-checkpoint/v1"
        and checkpoint["lane_id"] == LANE_ID
        and checkpoint["owner"] == RUN_OWNER
        and checkpoint["base_head"] == BASE_HEAD
        and checkpoint["owned_paths"] == [CHECKPOINT_RELATIVE]
        and checkpoint["durable_paths"]
        == sorted(
            [
                MINER_RELATIVE,
                RUNNER_CODE_CHECKPOINT_RELATIVE,
                RUNNER_RELATIVE,
                RUNNER_TEST_RELATIVE,
                SOURCE_PREPARER_RELATIVE,
            ]
        )
        and checkpoint["generated_roots"] == [expected_root]
        and checkpoint["manifest_sha256"] == _self_hash(checkpoint),
        "production checkpoint custody drifted",
    )
    observed["source_preparer_commit"] = SOURCE_PREPARER_COMMIT
    return observed


def _transform_source_cell(
    *,
    source_cell: Mapping[str, Any],
    ordinal: int,
    cnf: bytes,
    source_producer_raw: bytes,
    source_wave_raw: bytes,
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Purely validate and transform one authenticated physical cell."""

    source_id = source_cell.get("cell_id")
    _require(type(source_id) is str, "source cell id drifted")
    _require(source_cell.get("ordinal") == ordinal, "source cell ordinal drifted")
    _require(
        type(source_cell.get("direct_lean_bytes_validated")) is bool
        and type(source_cell.get("center")) is int
        and type(source_cell.get("category")) is str,
        "source cell physical/Lean validation drifted",
    )
    source_producer = _strict_json(source_producer_raw, "source producer")
    source_wave = _strict_json(source_wave_raw, "source wave")
    validate_wave_manifest(source_wave)
    variables, clauses = scan_dimacs(cnf)
    _require(
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "source cell DIMACS dimensions drifted",
    )
    source_manifest = source_producer.get("source_manifest")
    production_config = source_producer.get("production_config")
    target_code = (
        production_config.get("target_code")
        if type(production_config) is dict
        else None
    )
    _require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == EXPECTED_FINITE_SCHEMA,
        "source producer Lean ingress drifted",
    )
    _require(
        type(target_code) is dict
        and target_code.get("commit") == source_preparer_commit,
        "source producer preparer commit drifted",
    )
    source_encoding = source_wave.get("encoding")
    source_execution = source_wave.get("execution")
    _require(
        source_producer.get("backend") == BACKEND
        and source_producer.get("solver_profile") == SOURCE_SOLVER_PROFILE
        and source_producer.get("query_polarity") == QUERY_POLARITY,
        "source producer profile drifted",
    )
    cnf_sha256 = sha256_bytes(cnf)
    source_producer_sha256 = sha256_bytes(source_producer_raw)
    _require(
        type(source_encoding) is dict
        and source_encoding.get("cnf_sha256") == cnf_sha256
        and source_encoding.get("producer_manifest_sha256") == source_producer_sha256
        and source_encoding.get("num_variables") == NUM_VARIABLES
        and source_encoding.get("num_clauses") == NUM_CLAUSES
        and source_encoding.get("query_polarity") == QUERY_POLARITY
        and type(source_execution) is dict
        and source_execution.get("backend") == BACKEND
        and source_execution.get("solver_profile") == SOURCE_SOLVER_PROFILE,
        "source wave profile or encoding drifted",
    )
    portfolio_id = f"{source_id}-sat-profile-v1"
    producer = dict(source_producer)
    producer["producer_id"] = portfolio_id
    producer["solver_profile"] = SOLVER_PROFILE
    producer["profile_source_producer_manifest_sha256"] = source_producer_sha256
    producer_raw = canonical_json_bytes(producer)
    producer_sha256 = sha256_bytes(producer_raw)
    wave = dict(source_wave)
    wave["wave_id"] = portfolio_id
    wave["encoding"] = {
        **source_wave["encoding"],
        "producer_manifest_sha256": producer_sha256,
    }
    wave["execution"] = {
        **source_wave["execution"],
        "solver_profile": SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
    }
    validate_wave_manifest(wave)
    wave_raw = canonical_json_bytes(wave)
    return {
        "portfolio_cell_id": portfolio_id,
        "source_cell_id": source_id,
        "center": source_cell["center"],
        "category": source_cell["category"],
        "ordinal": ordinal,
        "producer_raw": producer_raw,
        "wave_raw": wave_raw,
        "identity_hash": _legacy.preparation.raw_dimacs_identity(
            cnf_sha256, producer_sha256
        ),
    }


def _require_direct_sentinel_inventory(source_cells: Sequence[Any]) -> None:
    observed: set[tuple[int, str]] = set()
    for source_cell in source_cells:
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        direct = source_cell.get("direct_lean_bytes_validated")
        center = source_cell.get("center")
        category = source_cell.get("category")
        _require(
            type(direct) is bool and type(center) is int and type(category) is str,
            "source cell direct Lean sentinel marker is malformed",
        )
        if direct:
            observed.add((center, category))
    _require(
        frozenset(observed) == DIRECT_SENTINELS,
        "source campaign direct Lean sentinel inventory drifted",
    )


def _derive_identity_bundle(
    *,
    root: Path,
    source_campaign: Mapping[str, Any],
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Descriptor-authenticate all 76 cells and derive both identity tables."""

    _require(
        type(source_preparer_commit) is str
        and len(source_preparer_commit) == 40
        and all(char in _HEX for char in source_preparer_commit),
        "source preparer commit is not a lowercase full Git identity",
    )
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    _require_direct_sentinel_inventory(source_cells)
    transformed: list[dict[str, Any]] = []
    source_identities: dict[str, dict[str, str | int]] = {}
    production_identities: dict[str, dict[str, str | int]] = {}
    for ordinal, source_cell in enumerate(source_cells):
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        source_id = source_cell.get("cell_id")
        _require(
            type(source_id) is str and source_id not in source_identities,
            "source cell id drifted",
        )
        source_refs = {
            "cnf": source_cell.get("cnf"),
            "producer": source_cell.get("producer_manifest"),
            "wave": source_cell.get("wave_manifest"),
        }
        _require(
            all(type(ref) is dict for ref in source_refs.values()),
            "source cell references are malformed",
        )
        cnf = _read_ref(root, source_refs["cnf"], "source cell CNF", 512 << 20)
        source_producer_raw = _read_ref(
            root, source_refs["producer"], "source producer", 4 << 20
        )
        source_wave_raw = _read_ref(root, source_refs["wave"], "source wave", 4 << 20)
        item = _transform_source_cell(
            source_cell=source_cell,
            ordinal=ordinal,
            cnf=cnf,
            source_producer_raw=source_producer_raw,
            source_wave_raw=source_wave_raw,
            source_preparer_commit=source_preparer_commit,
        )
        source_identity = {
            "cnf_sha256": source_refs["cnf"]["sha256"],
            "cnf_bytes": source_refs["cnf"]["bytes"],
            "producer_sha256": source_refs["producer"]["sha256"],
            "producer_bytes": source_refs["producer"]["bytes"],
            "wave_sha256": source_refs["wave"]["sha256"],
            "wave_bytes": source_refs["wave"]["bytes"],
        }
        production_identity = {
            "cnf_sha256": source_refs["cnf"]["sha256"],
            "cnf_bytes": source_refs["cnf"]["bytes"],
            "producer_sha256": sha256_bytes(item["producer_raw"]),
            "producer_bytes": len(item["producer_raw"]),
            "wave_sha256": sha256_bytes(item["wave_raw"]),
            "wave_bytes": len(item["wave_raw"]),
            "identity_hash": item["identity_hash"],
        }
        source_identities[source_id] = source_identity
        production_identities[item["portfolio_cell_id"]] = production_identity
        item["source_refs"] = source_refs
        item["source_identity"] = source_identity
        item["production_identity"] = production_identity
        transformed.append(item)
    _require(
        len(source_identities) == CELL_COUNT
        and len(production_identities) == CELL_COUNT,
        "derived identity tables are incomplete",
    )
    source_identities = dict(sorted(source_identities.items()))
    production_identities = dict(sorted(production_identities.items()))
    return {
        "transformed": transformed,
        "source_cell_identities": source_identities,
        "production_cell_identities": production_identities,
        "source_table_sha256": sha256_bytes(canonical_json_bytes(source_identities)),
        "production_table_sha256": sha256_bytes(
            canonical_json_bytes(production_identities)
        ),
    }


def derive_identities(
    *,
    source_campaign_sha256: str,
    source_campaign_bytes: int,
    source_run_manifest_sha256: str,
    source_run_manifest_bytes: int,
    source_preparer_commit: str,
    root: Path = ROOT,
) -> dict[str, Any]:
    """Read-only, provisional-safe derivation of the two production pin tables."""

    _digest(source_campaign_sha256, "source campaign")
    _digest(source_run_manifest_sha256, "source run manifest")
    _require(
        type(source_campaign_bytes) is int and source_campaign_bytes > 0,
        "source campaign byte count is invalid",
    )
    _require(
        type(source_run_manifest_bytes) is int and source_run_manifest_bytes > 0,
        "source run manifest byte count is invalid",
    )
    source_root = root / SOURCE_RUN_ROOT_RELATIVE
    campaign_raw = _read_private_file(
        source_root / "artifacts/campaign-manifest.json",
        maximum=8 << 20,
        label="source campaign",
    )
    run_raw = _read_private_file(
        source_root / "run_manifest.json",
        maximum=2 << 20,
        label="source run manifest",
    )
    _require(
        len(campaign_raw) == source_campaign_bytes
        and sha256_bytes(campaign_raw) == source_campaign_sha256,
        "source campaign caller pin drifted",
    )
    _require(
        len(run_raw) == source_run_manifest_bytes
        and sha256_bytes(run_raw) == source_run_manifest_sha256,
        "source run manifest caller pin drifted",
    )
    source_campaign = _strict_json(campaign_raw, "source campaign")
    source_run = _strict_json(run_raw, "source run manifest")
    _require(
        source_run.get("schema") == RUN_MANIFEST_SCHEMA
        and source_run.get("root") == SOURCE_RUN_ROOT_RELATIVE,
        "source run custody drifted",
    )
    _require(
        source_run.get("manifest_sha256") == _self_hash(source_run),
        "source run manifest self-hash drifted",
    )
    bundle = _derive_identity_bundle(
        root=root,
        source_campaign=source_campaign,
        source_preparer_commit=source_preparer_commit,
    )
    return {
        "schema": IDENTITY_DERIVATION_SCHEMA,
        "source_campaign_sha256": source_campaign_sha256,
        "source_campaign_bytes": source_campaign_bytes,
        "source_run_manifest_sha256": source_run_manifest_sha256,
        "source_run_manifest_bytes": source_run_manifest_bytes,
        "source_preparer_commit": source_preparer_commit,
        "cell_count": CELL_COUNT,
        "source_cell_identities": bundle["source_cell_identities"],
        "production_cell_identities": bundle["production_cell_identities"],
        "source_table_sha256": bundle["source_table_sha256"],
        "production_table_sha256": bundle["production_table_sha256"],
    }


def prepare_portfolio(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    """Transform the pinned physical campaign to the SAT profile create-once."""

    _require_production_pins()
    _authenticate_runner_support(ROOT)
    source_campaign_path = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
    source_run_path = SOURCE_RUN_ROOT / "run_manifest.json"
    source_campaign_raw = _read_private_file(
        source_campaign_path,
        maximum=8 << 20,
        label="source campaign",
    )
    source_run_raw = _read_private_file(
        source_run_path,
        maximum=2 << 20,
        label="source run manifest",
    )
    source_preparer_raw = _read_repo_source_file(
        ROOT / SOURCE_PREPARER_RELATIVE,
        maximum=2 << 20,
        label="source preparer",
    )
    checkpoint_raw = _read_repo_source_file(
        ROOT / CHECKPOINT_RELATIVE,
        maximum=1 << 20,
        label="production checkpoint",
    )
    runner_code_checkpoint_raw = _read_repo_source_file(
        ROOT / RUNNER_CODE_CHECKPOINT_RELATIVE,
        maximum=1 << 20,
        label="runner-code checkpoint",
    )
    miner_raw = _read_repo_source_file(
        ROOT / MINER_RELATIVE,
        maximum=4 << 20,
        label="wave-only miner",
    )
    runner_raw = _read_repo_source_file(
        ROOT / RUNNER_RELATIVE,
        maximum=4 << 20,
        label="portfolio runner",
    )
    runner_test_raw = _read_repo_source_file(
        ROOT / RUNNER_TEST_RELATIVE,
        maximum=4 << 20,
        label="portfolio runner test",
    )
    for raw, digest, size, label in (
        (
            source_campaign_raw,
            SOURCE_CAMPAIGN_SHA256,
            SOURCE_CAMPAIGN_BYTES,
            "source campaign",
        ),
        (
            source_run_raw,
            SOURCE_RUN_MANIFEST_SHA256,
            SOURCE_RUN_MANIFEST_BYTES,
            "source run manifest",
        ),
        (
            source_preparer_raw,
            SOURCE_PREPARER_SHA256,
            SOURCE_PREPARER_BYTES,
            "source preparer",
        ),
        (
            checkpoint_raw,
            CHECKPOINT_SHA256,
            CHECKPOINT_BYTES,
            "runner checkpoint",
        ),
        (
            runner_code_checkpoint_raw,
            RUNNER_CODE_CHECKPOINT_SHA256,
            RUNNER_CODE_CHECKPOINT_BYTES,
            "runner-code checkpoint",
        ),
        (miner_raw, MINER_SHA256, MINER_BYTES, "wave-only miner"),
    ):
        _require(
            len(raw) == size and sha256_bytes(raw) == _digest(digest, label),
            f"{label} pin drifted",
        )
    source_campaign = _strict_json(source_campaign_raw, "source campaign")
    source_run = _strict_json(source_run_raw, "source run manifest")
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    _require(
        source_run.get("schema") == "worktree-run-manifest/v1"
        and source_run.get("root") == _relative(ROOT, SOURCE_RUN_ROOT),
        "source run custody drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    bundle = _derive_identity_bundle(
        root=ROOT,
        source_campaign=source_campaign,
        source_preparer_commit=SOURCE_PREPARER_COMMIT,
    )
    _require(
        bundle["source_cell_identities"] == SOURCE_CELL_IDENTITIES,
        "source cell identity table drifted",
    )
    _require(
        bundle["production_cell_identities"] == PRODUCTION_CELL_IDENTITIES,
        "SAT-profile cell identity table drifted",
    )
    output_cells: list[dict[str, Any]] = []
    pending_files: list[tuple[Path, bytes, str]] = []
    for item in bundle["transformed"]:
        portfolio_id = item["portfolio_cell_id"]
        producer_raw = item["producer_raw"]
        wave_raw = item["wave_raw"]
        cell_root = output_root / "artifacts/cells" / portfolio_id
        producer_path = cell_root / "producer-manifest.json"
        wave_path = cell_root / "wave-manifest.json"
        pending_files.extend(
            (
                (producer_path, producer_raw, "SAT-profile producer manifest"),
                (wave_path, wave_raw, "SAT-profile wave manifest"),
            )
        )
        output_cell = {
            "portfolio_cell_id": portfolio_id,
            "source_cell_id": item["source_cell_id"],
            "center": item["center"],
            "category": item["category"],
            "ordinal": item["ordinal"],
            "source_cnf": dict(item["source_refs"]["cnf"]),
            "producer_manifest": _file_ref(producer_path, producer_raw, ROOT),
            "wave_manifest": _file_ref(wave_path, wave_raw, ROOT),
            "expected_identity_hash": item["identity_hash"],
        }
        output_cells.append(output_cell)
    campaign = {
        "schema": CAMPAIGN_SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": CELL_COUNT,
        "execution": {
            "backend": BACKEND,
            "solver_profile": SOLVER_PROFILE,
            "query_polarity": QUERY_POLARITY,
            "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
            "solve_timeout_s": SOLVE_TIMEOUT_S,
            "replay_timeout_s": REPLAY_TIMEOUT_S,
            "maximum_active_jobs": MAX_ACTIVE_JOBS,
        },
        "source_ingress": {
            "source_theorem": EXPECTED_SOURCE_THEOREM,
            "source_path": EXPECTED_SOURCE_PATH,
            "root_source_path": EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": EXPECTED_FINITE_SCHEMA,
            "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        },
        "cells": output_cells,
    }
    campaign_raw = canonical_json_bytes(campaign)
    input_digests = {
        _relative(ROOT, source_campaign_path): sha256_bytes(source_campaign_raw),
        _relative(ROOT, source_run_path): sha256_bytes(source_run_raw),
        _relative(ROOT, output_root / "artifacts/campaign-manifest.json"): sha256_bytes(
            campaign_raw
        ),
    }
    for source_cell in source_cells:
        for key in ("cnf", "producer_manifest", "wave_manifest"):
            ref = source_cell[key]
            input_digests[ref["path"]] = ref["sha256"]
    run_unsigned = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _relative(ROOT, output_root),
        "owner": RUN_OWNER,
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {
            SOURCE_PREPARER_RELATIVE: sha256_bytes(source_preparer_raw),
            CHECKPOINT_RELATIVE: sha256_bytes(checkpoint_raw),
            RUNNER_CODE_CHECKPOINT_RELATIVE: sha256_bytes(runner_code_checkpoint_raw),
            MINER_RELATIVE: sha256_bytes(miner_raw),
            RUNNER_RELATIVE: sha256_bytes(runner_raw),
            RUNNER_TEST_RELATIVE: sha256_bytes(runner_test_raw),
        },
        "input_digests": dict(sorted(input_digests.items())),
        "created_utc": "2026-08-22T00:00:00Z",
    }
    run_manifest = {
        **run_unsigned,
        "manifest_sha256": sha256_bytes(canonical_json_bytes(run_unsigned)),
    }
    run_raw = canonical_json_bytes(run_manifest)
    for path, raw, label in pending_files:
        _write_once_or_validate(path, raw, label)
    _write_once_or_validate(
        output_root / "artifacts/campaign-manifest.json",
        campaign_raw,
        "SAT-profile campaign",
    )
    _write_once_or_validate(
        output_root / "run_manifest.json", run_raw, "SAT-profile run manifest"
    )
    (output_root / "events").mkdir(mode=0o700, parents=True, exist_ok=True)
    (output_root / "tmp").mkdir(mode=0o700, parents=True, exist_ok=True)
    validate_campaign_payload(campaign, run_manifest)
    return {
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": CELL_COUNT,
        "campaign_sha256": sha256_bytes(campaign_raw),
        "run_manifest_sha256": sha256_bytes(run_raw),
    }


def _validate_cell(cell: Any, ordinal: int) -> dict[str, Any]:
    _require(type(cell) is dict, "campaign cell is malformed")
    required = {
        "portfolio_cell_id",
        "source_cell_id",
        "center",
        "category",
        "ordinal",
        "source_cnf",
        "producer_manifest",
        "wave_manifest",
        "expected_identity_hash",
    }
    _require(set(cell) == required, "campaign cell keys drifted")
    _require(cell["ordinal"] == ordinal, "campaign cell ordinal drifted")
    _require(type(cell["center"]) is int, "campaign center is invalid")
    _require(
        type(cell["category"]) is str and cell["category"],
        "campaign category is invalid",
    )
    _require(type(cell["source_cell_id"]) is str, "source cell id is invalid")
    _require(
        cell["portfolio_cell_id"] == f"{cell['source_cell_id']}-sat-profile-v1",
        "portfolio cell id is not derived from its source cell",
    )
    _digest(cell["expected_identity_hash"], "cell raw identity")
    for key in ("source_cnf", "producer_manifest", "wave_manifest"):
        ref = cell[key]
        _require(
            type(ref) is dict and set(ref) == {"path", "sha256", "bytes"},
            f"{key} ref keys drifted",
        )
        _digest(ref.get("sha256"), key)
        _require(
            type(ref.get("bytes")) is int and ref["bytes"] > 0, f"{key} bytes invalid"
        )
    return dict(cell)


def validate_campaign_payload(
    campaign: Mapping[str, Any], run_manifest: Mapping[str, Any]
) -> dict[str, Any]:
    """Validate the complete finite layout without touching PIQD."""

    _require(
        set(campaign)
        == {"schema", "status", "cell_count", "execution", "source_ingress", "cells"},
        "campaign keys drifted",
    )
    _require(campaign.get("schema") == CAMPAIGN_SCHEMA, "campaign schema drifted")
    _require(campaign.get("status") == "PREPARED_LOCAL_ONLY", "campaign status drifted")
    _require(campaign.get("cell_count") == CELL_COUNT, "campaign cell count drifted")
    execution = campaign.get("execution")
    expected_execution = {
        "backend": BACKEND,
        "solver_profile": SOLVER_PROFILE,
        "query_polarity": QUERY_POLARITY,
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "solve_timeout_s": SOLVE_TIMEOUT_S,
        "replay_timeout_s": REPLAY_TIMEOUT_S,
        "maximum_active_jobs": MAX_ACTIVE_JOBS,
    }
    _require(execution == expected_execution, "campaign execution policy drifted")
    ingress = campaign.get("source_ingress")
    _require(
        ingress
        == {
            "source_theorem": EXPECTED_SOURCE_THEOREM,
            "source_path": EXPECTED_SOURCE_PATH,
            "root_source_path": EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": EXPECTED_FINITE_SCHEMA,
            "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        },
        "campaign Lean ingress drifted",
    )
    raw_cells = campaign.get("cells")
    _require(
        type(raw_cells) is list and len(raw_cells) == CELL_COUNT,
        "campaign cells drifted",
    )
    cells = [_validate_cell(cell, ordinal) for ordinal, cell in enumerate(raw_cells)]
    ids = [cell["portfolio_cell_id"] for cell in cells]
    roles = [(cell["center"], cell["category"]) for cell in cells]
    _require(len(set(ids)) == CELL_COUNT, "campaign cell ids are not unique")
    _require(len(set(roles)) == CELL_COUNT, "campaign physical roles are not unique")
    canaries = [
        cell for cell in cells if cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
    ]
    _require(
        len(canaries) == 1
        and canaries[0]["center"] == 2
        and canaries[0]["category"] == "none",
        "center2/none canary is missing or duplicated",
    )
    _require(
        set(run_manifest)
        == {
            "schema",
            "lane_id",
            "run_id",
            "root",
            "owner",
            "base_head",
            "output_classes",
            "source_digests",
            "input_digests",
            "created_utc",
            "manifest_sha256",
        },
        "run manifest keys drifted",
    )
    _require(
        run_manifest.get("schema") == RUN_MANIFEST_SCHEMA, "run manifest schema drifted"
    )
    _require(run_manifest.get("lane_id") == LANE_ID, "run manifest lane drifted")
    _require(run_manifest.get("run_id") == RUN_ID, "run manifest id drifted")
    _require(
        run_manifest.get("base_head") == BASE_HEAD, "run manifest base head drifted"
    )
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require(
        run_manifest.get("root") == expected_root
        and run_manifest.get("owner") == RUN_OWNER
        and run_manifest.get("output_classes") == ["artifacts", "events", "tmp"],
        "run manifest fixed layout drifted",
    )
    _require(
        run_manifest.get("created_utc") == "2026-08-22T00:00:00Z",
        "run manifest creation time drifted",
    )
    _require(
        type(run_manifest.get("source_digests")) is dict
        and type(run_manifest.get("input_digests")) is dict,
        "run manifest digest maps are malformed",
    )
    for map_name in ("source_digests", "input_digests"):
        for relative, digest in run_manifest[map_name].items():
            _require(
                type(relative) is str and relative and not relative.startswith("/"),
                f"run manifest {map_name} path is invalid",
            )
            _digest(digest, f"run manifest {map_name} digest")
    _require(
        run_manifest["input_digests"].get(
            f"{expected_root}/artifacts/campaign-manifest.json"
        )
        == sha256_bytes(canonical_json_bytes(campaign)),
        "run manifest campaign binding drifted",
    )
    _require(
        run_manifest.get("manifest_sha256") == _self_hash(run_manifest),
        "run manifest self-hash drifted",
    )
    return {
        "campaign": dict(campaign),
        "run_manifest": dict(run_manifest),
        "cells": cells,
    }


def _authoritative_input_digests(
    root: Path, run_root: Path, campaign_raw: bytes
) -> dict[str, str]:
    """Reconstruct every immutable input named by the prepared run."""

    expected_output_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require(
        _relative(root, run_root) == expected_output_root,
        "SAT-profile output root drifted",
    )
    source_root = root / SOURCE_RUN_ROOT_RELATIVE
    source_campaign_path = source_root / "artifacts/campaign-manifest.json"
    source_run_path = source_root / "run_manifest.json"
    source_campaign_raw = _read_private_file(
        source_campaign_path,
        maximum=8 << 20,
        label="source campaign",
    )
    source_run_raw = _read_private_file(
        source_run_path,
        maximum=2 << 20,
        label="source run manifest",
    )
    _require(
        len(source_campaign_raw) == SOURCE_CAMPAIGN_BYTES
        and sha256_bytes(source_campaign_raw)
        == _digest(SOURCE_CAMPAIGN_SHA256, "source campaign"),
        "source campaign pin drifted",
    )
    _require(
        len(source_run_raw) == SOURCE_RUN_MANIFEST_BYTES
        and sha256_bytes(source_run_raw)
        == _digest(SOURCE_RUN_MANIFEST_SHA256, "source run manifest"),
        "source run manifest pin drifted",
    )
    source_campaign = _strict_json(source_campaign_raw, "source campaign")
    source_run = _strict_json(source_run_raw, "source run manifest")
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    _require(
        source_run.get("schema") == RUN_MANIFEST_SCHEMA
        and source_run.get("root") == SOURCE_RUN_ROOT_RELATIVE,
        "source run custody drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    expected: dict[str, str] = {
        _relative(root, source_campaign_path): sha256_bytes(source_campaign_raw),
        _relative(root, source_run_path): sha256_bytes(source_run_raw),
        f"{expected_output_root}/artifacts/campaign-manifest.json": sha256_bytes(
            campaign_raw
        ),
    }
    seen_ids: set[str] = set()
    for ordinal, source_cell in enumerate(source_cells):
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        source_id = source_cell.get("cell_id")
        _require(
            type(source_id) is str
            and source_id not in seen_ids
            and source_cell.get("ordinal") == ordinal,
            "source campaign cell identity drifted",
        )
        seen_ids.add(source_id)
        for key, label, maximum in (
            ("cnf", "source cell CNF", 512 << 20),
            ("producer_manifest", "source producer manifest", 8 << 20),
            ("wave_manifest", "source wave manifest", 8 << 20),
        ):
            ref = source_cell.get(key)
            _require(type(ref) is dict, f"{label} reference is malformed")
            _read_ref(root, ref, label, maximum)
            relative = ref.get("path")
            _require(
                type(relative) is str and relative not in expected,
                "source input path is duplicated",
            )
            expected[relative] = ref["sha256"]
    return dict(sorted(expected.items()))


def static_check(*, root: Path = ROOT, run_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    _require_production_pins()
    support = _authenticate_runner_support(root)
    campaign_raw = _read_private_file(
        run_root / "artifacts/campaign-manifest.json", maximum=4 << 20, label="campaign"
    )
    run_raw = _read_private_file(
        run_root / "run_manifest.json", maximum=1 << 20, label="run manifest"
    )
    campaign = _strict_json(campaign_raw, "campaign")
    run_manifest = _strict_json(run_raw, "run manifest")
    checked = validate_campaign_payload(campaign, run_manifest)
    source_digests = run_manifest["source_digests"]
    governed_sources = {
        SOURCE_PREPARER_RELATIVE: "source preparer",
        CHECKPOINT_RELATIVE: "production checkpoint",
        RUNNER_CODE_CHECKPOINT_RELATIVE: "runner-code checkpoint",
        MINER_RELATIVE: "wave-only miner",
        RUNNER_RELATIVE: "portfolio runner",
        RUNNER_TEST_RELATIVE: "portfolio runner test",
    }
    _require(
        set(source_digests) == set(governed_sources),
        "run manifest governed source set drifted",
    )
    for relative, label in governed_sources.items():
        raw = _read_repo_source_file(
            root / relative,
            maximum=4 << 20,
            label=label,
        )
        _require(
            sha256_bytes(raw) == source_digests[relative],
            f"{label} run-manifest hash drifted",
        )
    _require(
        source_digests.get(SOURCE_PREPARER_RELATIVE)
        == support[SOURCE_PREPARER_RELATIVE]
        and source_digests.get(CHECKPOINT_RELATIVE) == support[CHECKPOINT_RELATIVE]
        and source_digests.get(RUNNER_CODE_CHECKPOINT_RELATIVE)
        == support[RUNNER_CODE_CHECKPOINT_RELATIVE]
        and source_digests.get(MINER_RELATIVE) == support[MINER_RELATIVE]
        and campaign["source_ingress"].get("source_preparer_commit")
        == support["source_preparer_commit"],
        "launch support provenance drifted",
    )
    _require(
        run_manifest["input_digests"]
        == _authoritative_input_digests(root, run_root, campaign_raw),
        "run manifest authoritative input provenance drifted",
    )
    for cell in checked["cells"]:
        identity = PRODUCTION_CELL_IDENTITIES.get(cell["portfolio_cell_id"])
        _require(type(identity) is dict, "prepared cell identity is unpinned")
        observed = {
            "cnf_sha256": cell["source_cnf"]["sha256"],
            "cnf_bytes": cell["source_cnf"]["bytes"],
            "producer_sha256": cell["producer_manifest"]["sha256"],
            "producer_bytes": cell["producer_manifest"]["bytes"],
            "wave_sha256": cell["wave_manifest"]["sha256"],
            "wave_bytes": cell["wave_manifest"]["bytes"],
            "identity_hash": cell["expected_identity_hash"],
        }
        _require(identity == observed, "prepared cell byte identity drifted")
    checked["campaign_sha256"] = sha256_bytes(campaign_raw)
    checked["run_manifest_sha256"] = sha256_bytes(run_raw)
    checked["root"] = root
    checked["run_root"] = run_root
    return checked


def _require_production_cell_identity(cell: Mapping[str, Any]) -> None:
    """Reject any cell not represented byte-for-byte in the frozen table."""

    _require_production_pins()
    identifier = cell.get("portfolio_cell_id")
    expected_production = PRODUCTION_CELL_IDENTITIES.get(identifier)
    source_ref = cell.get("source_cnf")
    producer_ref = cell.get("producer_manifest")
    wave_ref = cell.get("wave_manifest")
    _require(
        type(source_ref) is dict
        and type(producer_ref) is dict
        and type(wave_ref) is dict,
        "cell production references are malformed",
    )
    observed_production = {
        "cnf_sha256": source_ref.get("sha256"),
        "cnf_bytes": source_ref.get("bytes"),
        "producer_sha256": producer_ref.get("sha256"),
        "producer_bytes": producer_ref.get("bytes"),
        "wave_sha256": wave_ref.get("sha256"),
        "wave_bytes": wave_ref.get("bytes"),
        "identity_hash": cell.get("expected_identity_hash"),
    }
    _require(
        type(identifier) is str
        and type(expected_production) is dict
        and expected_production == observed_production,
        "cell is not byte-exactly represented in production identities",
    )


def _load_cell_inputs(
    root: Path, cell: Mapping[str, Any]
) -> tuple[bytes, bytes, dict[str, Any]]:
    _require_production_cell_identity(cell)
    cnf = _read_ref(root, cell["source_cnf"], "cell CNF", 512 << 20)
    producer = _read_ref(root, cell["producer_manifest"], "producer manifest", 4 << 20)
    wave_raw = _read_ref(root, cell["wave_manifest"], "wave manifest", 4 << 20)
    producer_json = _strict_json(producer, "producer manifest")
    production_config = producer_json.get("production_config")
    target_code = (
        production_config.get("target_code")
        if type(production_config) is dict
        else None
    )
    _require(
        type(target_code) is dict
        and target_code.get("commit") == SOURCE_PREPARER_COMMIT,
        "cell producer source preparer commit drifted",
    )
    wave = _strict_json(wave_raw, "wave manifest")
    validate_wave_manifest(wave)
    variables, clauses = scan_dimacs(cnf)
    _require(
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "cell DIMACS dimensions drifted",
    )
    encoding = wave.get("encoding")
    execution = wave.get("execution")
    _require(
        type(encoding) is dict
        and encoding.get("cnf_sha256") == sha256_bytes(cnf)
        and encoding.get("producer_manifest_sha256") == sha256_bytes(producer)
        and encoding.get("num_variables") == NUM_VARIABLES
        and encoding.get("num_clauses") == NUM_CLAUSES
        and encoding.get("query_polarity") == QUERY_POLARITY,
        "cell wave encoding drifted",
    )
    _require(
        type(execution) is dict
        and execution.get("backend") == BACKEND
        and execution.get("solver_profile") == SOLVER_PROFILE,
        "cell wave execution drifted",
    )
    _require(
        producer_json.get("backend") == BACKEND
        and producer_json.get("solver_profile") == SOLVER_PROFILE
        and producer_json.get("query_polarity") == QUERY_POLARITY,
        "cell producer profile drifted",
    )
    expected_identity = _legacy.preparation.raw_dimacs_identity(
        sha256_bytes(cnf), sha256_bytes(producer)
    )
    _require(
        cell.get("expected_identity_hash") == expected_identity,
        "cell raw identity drifted",
    )
    return cnf, producer, wave


def _authenticate_selected(
    root: Path, selected: Sequence[Mapping[str, Any]]
) -> dict[str, tuple[bytes, bytes, dict[str, Any]]]:
    """Read and authenticate every launch input before PIQD can be mutated."""

    authenticated: dict[str, tuple[bytes, bytes, dict[str, Any]]] = {}
    for cell in selected:
        identifier = str(cell["portfolio_cell_id"])
        _require(identifier not in authenticated, "selected cell is duplicated")
        authenticated[identifier] = _load_cell_inputs(root, cell)
    _require(
        len(authenticated) == len(selected),
        "selected input authentication coverage drifted",
    )
    return authenticated


def _live_daemon_attestation(base_url: str) -> dict[str, Any]:
    """Require a loopback PIQD with the exact SAT-worker capability."""

    _require_production_pins()
    observed = _legacy.live_identity(base_url)
    capacity = _legacy._http_json(base_url, "/projects")
    version = observed.get("version")
    solver = observed.get("solver")
    _require(
        type(version) is dict and type(solver) is dict, "PIQD attestation malformed"
    )
    _require(
        type(capacity.get("max_workers")) is int
        and 1 <= capacity["max_workers"] <= MAX_ACTIVE_JOBS,
        "live PIQD global worker capacity exceeds the twelve-core covenant",
    )
    _require(
        type(capacity.get("committed_workers")) is int
        and 0 <= capacity["committed_workers"] <= capacity["max_workers"],
        "live PIQD committed worker accounting is malformed",
    )
    projects = capacity.get("projects")
    _require(type(projects) is list, "live PIQD project registry is malformed")
    matches = [
        project
        for project in projects
        if type(project) is dict and project.get("name") == PROJECT
    ]
    _require(len(matches) == 1, "exact PIQD project row is missing or duplicated")
    project = matches[0]
    for key in ("min_workers", "running", "queued", "created_at", "updated_at"):
        _require(
            type(project.get(key)) is int and project[key] >= 0,
            f"live PIQD project {key} is malformed",
        )
    _require(
        project["min_workers"] <= capacity["max_workers"],
        "live PIQD project worker floor exceeds daemon capacity",
    )
    _require(
        project.get("ce_scope") is None or type(project.get("ce_scope")) is str,
        "live PIQD project ce_scope is malformed",
    )
    solver_attestation = {
        key: solver.get(key)
        for key in (
            "name",
            "sha256",
            "solver_signature",
            "protocol_version",
            "solver",
            "backend",
            "lane",
            "usable",
        )
    }
    solver_attestation["solver"] = solver.get("solver", solver.get("backend"))
    solver_attestation["backend"] = solver.get("backend", solver.get("solver"))
    attestation = {
        "daemon": version.get("daemon"),
        "solver": solver_attestation,
        "global_worker_capacity": capacity["max_workers"],
        "project": {
            key: project.get(key)
            for key in (
                "name",
                "min_workers",
                "running",
                "queued",
                "created_at",
                "updated_at",
                "ce_scope",
            )
        },
        "fetched_endpoints": ["/version", "/solvers", "/projects"],
    }
    _validate_live_identity_attestation(attestation)
    return attestation


def _validate_live_identity_attestation(value: Any) -> dict[str, Any]:
    identity = _require_exact_keys(
        value,
        {
            "daemon",
            "solver",
            "global_worker_capacity",
            "project",
            "fetched_endpoints",
        },
        "persisted live PIQD identity",
    )
    solver = _require_exact_keys(
        identity["solver"],
        {
            "name",
            "sha256",
            "solver_signature",
            "protocol_version",
            "solver",
            "backend",
            "lane",
            "usable",
        },
        "persisted PIQD solver identity",
    )
    project = _require_exact_keys(
        identity["project"],
        {
            "name",
            "min_workers",
            "running",
            "queued",
            "created_at",
            "updated_at",
            "ce_scope",
        },
        "persisted PIQD project identity",
    )
    _require(
        identity["daemon"] == _legacy.DAEMON_IDENTITY
        and solver["name"] == _legacy.SOLVER_NAME
        and solver["sha256"] == _legacy.SOLVER_SHA256
        and solver["solver_signature"] == _legacy.SOLVER_SIGNATURE
        and solver["protocol_version"] == _legacy.DAEMON_IDENTITY["protocol_version"]
        and solver["solver"] == BACKEND
        and solver["backend"] == BACKEND
        and solver["lane"] == "sat"
        and solver["usable"] is True
        and type(identity["global_worker_capacity"]) is int
        and 1 <= identity["global_worker_capacity"] <= MAX_ACTIVE_JOBS
        and project["name"] == PROJECT
        and all(
            type(project[key]) is int and project[key] >= 0
            for key in (
                "min_workers",
                "running",
                "queued",
                "created_at",
                "updated_at",
            )
        )
        and project["min_workers"] <= identity["global_worker_capacity"]
        and (project["ce_scope"] is None or type(project["ce_scope"]) is str)
        and identity["fetched_endpoints"] == ["/version", "/solvers", "/projects"],
        "persisted live PIQD identity drifted",
    )
    return identity


def _policy() -> DriverPolicy:
    return DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=MAX_POLLS,
        max_result_attempts=1,
        poll_interval_s=POLL_INTERVAL_S,
        solver_timeout_s=SOLVE_TIMEOUT_S,
        march_timeout_s=SOLVE_TIMEOUT_S,
        project=PROJECT,
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )


def _summary(identifier: str, result: Any) -> dict[str, Any]:
    return {
        "portfolio_cell_id": identifier,
        "job_id": result.job_id,
        "outcome": result.outcome,
        "terminal_record_sha256": result.terminal_record_sha256,
        "journal_record_count": result.journal_record_count,
        "seal_sha256": result.seal_sha256,
    }


def _public_result(result: Mapping[str, Any]) -> dict[str, Any]:
    _require(
        set(_TERMINAL_RESULT_KEYS) <= set(result),
        "terminal result is missing public custody fields",
    )
    return {key: result[key] for key in sorted(_TERMINAL_RESULT_KEYS)}


def _empty_file_identity(path: Path, label: str) -> tuple[int, int, int, int]:
    raw = _read_private_file(path, maximum=0, label=label)
    _require(raw == b"", f"{label} is not empty")
    info = path.lstat()
    return (info.st_dev, info.st_ino, info.st_mode, info.st_nlink)


def _reserve_cell(run_root: Path, identifier: str) -> tuple[Any, Any]:
    _require_production_pins()
    events = run_root / "events"
    events.mkdir(mode=0o700, parents=True, exist_ok=True)
    journal_path = events / f"{identifier}.jsonl"
    lock_path = events / f"{identifier}.jsonl.lock"
    if journal_path.exists() or lock_path.exists():
        _require(
            journal_path.exists() and lock_path.exists(),
            "cell reservation is incomplete",
        )
        return (
            _empty_file_identity(journal_path, "reserved journal"),
            _empty_file_identity(lock_path, "reserved journal lock"),
        )
    events_fd = os.open(events, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        journal = _legacy._create_once(events_fd, f"{identifier}.jsonl")
        lock = _legacy._create_once(events_fd, f"{identifier}.jsonl.lock")
        return journal, lock
    finally:
        os.close(events_fd)


@contextmanager
def _cell_lifecycle_lock(run_root: Path, identifier: str) -> Any:
    """Hold one descriptor-hardened lock across a cell's daemon lifecycle."""

    _require_production_pins()
    events = run_root / "events"
    events.mkdir(mode=0o700, parents=True, exist_ok=True)
    directory = events.lstat()
    _require(
        stat.S_ISDIR(directory.st_mode)
        and directory.st_uid == os.getuid()
        and directory.st_mode & 0o077 == 0,
        "cell lifecycle directory is unsafe",
    )
    path = events / f"{identifier}.lifecycle.lock"
    binding = canonical_json_bytes(
        {
            "schema": f"{LAUNCH_SCHEMA}/cell-lifecycle-lock/v1",
            "portfolio_cell_id": identifier,
        }
    )
    _write_once_or_validate(path, binding, "cell lifecycle lock")
    before = path.lstat()
    descriptor = os.open(path, os.O_RDWR | os.O_NOFOLLOW)
    try:
        held = os.fstat(descriptor)
        _require(
            stat.S_ISREG(held.st_mode)
            and held.st_nlink == 1
            and held.st_uid == os.getuid()
            and held.st_mode & 0o077 == 0
            and (held.st_dev, held.st_ino, held.st_mode, held.st_nlink)
            == (before.st_dev, before.st_ino, before.st_mode, before.st_nlink),
            "cell lifecycle lock is unsafe",
        )
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            raise PortfolioRunnerError(
                f"cell lifecycle is already active: {identifier}"
            ) from exc
        yield
    finally:
        fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def _fresh_run_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    identifier = str(cell["portfolio_cell_id"])
    cnf, producer, wave = _load_cell_inputs(root, cell)
    with _cell_lifecycle_lock(run_root, identifier):
        return _fresh_run_cell_under_lock(
            root, run_root, identifier, cnf, producer, wave, base_url
        )


def _fresh_run_cell_under_lock(
    root: Path,
    run_root: Path,
    identifier: str,
    cnf: bytes,
    producer: bytes,
    wave: Mapping[str, Any],
    base_url: str,
) -> dict[str, Any]:
    _require_production_pins()
    _live_daemon_attestation(base_url)
    journal_identity, lock_identity = _reserve_cell(run_root, identifier)
    journal = _legacy.DescriptorAttemptJournal(
        run_root / "events" / f"{identifier}.jsonl",
        manifest=wave,
        root=root,
        expected_journal_identity=journal_identity,
        expected_lock_identity=lock_identity,
    )
    client = _legacy.FreshOnlyPiqdClient(PiqdRawDimacsClient(base_url))
    try:
        result = PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=_policy(),
            proof_replayer=LeanLratReplayer(
                lean_root=root / "lean",
                work_dir=run_root / "tmp" / f"{identifier}-replay-work",
                timeout_s=REPLAY_TIMEOUT_S,
            ),
            sleep=time.sleep,
        ).run(wave_manifest=wave, cnf=cnf, producer_manifest=producer)
    finally:
        journal.close()
    return _summary(identifier, result)


def _read_journal_records(path: Path, wave: Mapping[str, Any]) -> list[dict[str, Any]]:
    raw = _read_private_file(path, maximum=64 << 20, label="cell journal")
    _require(raw and raw.endswith(b"\n"), "partial journal is empty or torn")
    records: list[dict[str, Any]] = []
    for index, line in enumerate(raw.splitlines(), start=1):
        records.append(_strict_json(line, f"journal record {index}"))
    _driver.validate_attempt_journal(records, manifest=wave)
    _journal_job_id(records)
    return records


def _journal_job_id(records: Sequence[Mapping[str, Any]]) -> str | None:
    job_ids = {
        record["event"].get("job_id")
        for record in records
        if record["event"].get("job_id") is not None
    }
    _require(len(job_ids) <= 1, "journal contains more than one job identity")
    return None if not job_ids else str(next(iter(job_ids)))


def _prepared_job_from_records(
    records: Sequence[Mapping[str, Any]], cell: Mapping[str, Any], cnf: bytes
) -> PreparedJob:
    prepared = [
        record
        for record in records
        if record["event"].get("phase") == "PREPARE"
        and record["event"].get("disposition") == "SUCCESS"
    ]
    _require(len(prepared) == 1, "partial journal has no unique successful PREPARE")
    event = prepared[0]["event"]
    response = event.get("response")
    _require(type(response) is dict, "partial PREPARE response is malformed")
    job_id = _journal_job_id(records)
    _require(
        job_id is not None and event.get("job_id") == job_id,
        "partial journal job identity is ambiguous",
    )
    _require(
        response.get("existing") is False
        or (
            response.get("existing") is True
            and event.get("detail") == "recovered exact raw identity"
        ),
        "partial journal adopted an unaudited existing PIQD job",
    )
    expected = {
        "backend": BACKEND,
        "solver_profile": SOLVER_PROFILE,
        "cnf_blob_hash": sha256_bytes(cnf),
        "identity_hash": cell["expected_identity_hash"],
        "num_vars": NUM_VARIABLES,
        "num_clauses": NUM_CLAUSES,
    }
    for key, value in expected.items():
        _require(response.get(key) == value, f"partial PREPARE {key} drifted")
    return PreparedJob(
        str(event["job_id"]),
        BACKEND,
        SOLVER_PROFILE,
        sha256_bytes(cnf),
        str(cell["expected_identity_hash"]),
        NUM_VARIABLES,
        NUM_CLAUSES,
        bool(response["existing"]),
        REQUESTED_CORE_LIMIT,
    )


def _open_existing_descriptor_journal(
    root: Path,
    path: Path,
    wave: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> Any:
    """Open an existing unsealed attempt through held no-follow descriptors."""

    journal = object.__new__(_legacy.DescriptorAttemptJournal)
    journal.path = path
    journal.manifest = dict(wave)
    journal._raw = _read_private_file(path, maximum=64 << 20, label="resume journal")
    journal.records = [dict(record) for record in records]
    journal._sealed = None
    journal._events_fd = _legacy._open_directory(
        root, _legacy.preparation._relative(root, path.parent)
    )
    journal._journal_name = path.name
    journal._lock_name = f"{path.name}.lock"
    journal._artifact_name = f"{path.name}.artifacts"
    journal._seal_name = f"{path.name}.seal.json"
    journal._journal_fd = None
    journal._lock_fd = None
    journal._artifact_fd = None
    journal._artifact_identities = {}
    journal._seal_identity = None
    journal._virtual_artifacts = {
        str(wave["encoding"]["cnf_sha256"]),
        str(wave["encoding"]["producer_manifest_sha256"]),
    }
    try:
        journal._journal_fd = journal._open_private_regular(
            journal._journal_name, os.O_RDWR | os.O_APPEND, expected_identity=None
        )
        journal._lock_fd = journal._open_private_regular(
            journal._lock_name, os.O_RDWR, expected_identity=None
        )
        journal._artifact_fd = os.open(
            journal._artifact_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=journal._events_fd,
        )
        journal._assert_core_custody()
        for name in os.listdir(journal._artifact_fd):
            _digest(name, "resume artifact filename")
            info = os.stat(name, dir_fd=journal._artifact_fd, follow_symlinks=False)
            _require(
                stat.S_ISREG(info.st_mode)
                and info.st_nlink == 1
                and info.st_mode & 0o077 == 0,
                "resume artifact is unsafe",
            )
            journal._artifact_identities[name] = journal._file_identity(info)
        journal._assert_core_custody()
    except BaseException:
        journal.close()
        raise
    return journal


def _assert_resume_paths(run_root: Path, identifier: str) -> None:
    journal = run_root / "events" / f"{identifier}.jsonl"
    lock = run_root / "events" / f"{identifier}.jsonl.lock"
    _read_private_file(journal, maximum=64 << 20, label="resume journal")
    lock_raw = _read_private_file(lock, maximum=0, label="resume journal lock")
    _require(lock_raw == b"", "resume journal lock is not empty")
    artifacts = run_root / "events" / f"{identifier}.jsonl.artifacts"
    try:
        info = artifacts.lstat()
    except OSError as exc:
        raise PortfolioRunnerError("resume artifact directory is missing") from exc
    _require(
        stat.S_ISDIR(info.st_mode) and info.st_nlink >= 2,
        "resume artifact directory is unsafe",
    )
    _require(
        not (run_root / "events" / f"{identifier}.jsonl.seal.json").exists(),
        "sealed cell cannot enter partial resume",
    )


def _confirm_and_refresh(
    client: Any, job: PreparedJob, cnf: bytes
) -> tuple[dict[str, Any] | Mapping[str, Any], str, str | None]:
    _require_production_pins()
    state = client.confirm(job, expected_cnf=cnf)
    payload: dict[str, Any] | Mapping[str, Any] = {"status": state}
    result_name: str | None = None
    if state in {"completed", "failed"}:
        payload = client.status(job.job_id)
        state, result_name = _driver._status_state(payload)
    return payload, state, result_name


def _resume_run_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    _require_production_cell_identity(cell)
    identifier = str(cell["portfolio_cell_id"])
    with _cell_lifecycle_lock(run_root, identifier):
        return _resume_run_cell_under_lock(root, run_root, cell, base_url)


def _resume_run_cell_under_lock(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    identifier = str(cell["portfolio_cell_id"])
    cnf, producer, wave = _load_cell_inputs(root, cell)
    _live_daemon_attestation(base_url)
    _assert_resume_paths(run_root, identifier)
    journal_path = run_root / "events" / f"{identifier}.jsonl"
    journal_raw = _read_private_file(
        journal_path, maximum=64 << 20, label="resume journal"
    )
    records = _read_journal_records(journal_path, wave) if journal_raw else []
    artifact_dir = run_root / "events" / f"{identifier}.jsonl.artifacts"
    _write_once_or_validate(
        artifact_dir / sha256_bytes(cnf), cnf, "recovery CNF artifact"
    )
    _write_once_or_validate(
        artifact_dir / sha256_bytes(producer),
        producer,
        "recovery producer artifact",
    )
    journal = _open_existing_descriptor_journal(root, journal_path, wave, records)
    _require(journal._sealed is None, "partial resume journal is already sealed")
    client = PiqdRawDimacsClient(base_url)
    driver = PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=_policy(),
        proof_replayer=LeanLratReplayer(
            lean_root=root / "lean",
            work_dir=run_root / "tmp" / f"{identifier}-replay-work",
            timeout_s=REPLAY_TIMEOUT_S,
        ),
        sleep=time.sleep,
    )
    try:
        if records and records[-1]["outcome"] != CHECKPOINT:
            journal.seal()
            return _terminal_cell(root, run_root, cell)
        prepared = [
            record
            for record in records
            if record["event"].get("phase") == "PREPARE"
            and record["event"].get("disposition") == "SUCCESS"
        ]
        if not prepared:
            if not records:
                driver._append(
                    event=_driver._event(
                        phase="DRIVER_START",
                        disposition="SUCCESS",
                        detail="descriptor-bound recovery started",
                        response=_policy().as_dict(),
                    ),
                    outcome=CHECKPOINT,
                    detail="DRIVER_START: descriptor-bound recovery started",
                )
            job = client.prepare_cnf(
                wave_manifest=wave,
                cnf=cnf,
                producer_manifest=producer,
                timeout_s=SOLVE_TIMEOUT_S,
                march_timeout_s=SOLVE_TIMEOUT_S,
                project=PROJECT,
                requested_core_limit=REQUESTED_CORE_LIMIT,
            )
            driver._append(
                event=_driver._event(
                    phase="PREPARE",
                    disposition="SUCCESS",
                    retry_index=0,
                    job_id=job.job_id,
                    status="prepared",
                    detail=(
                        "recovered exact raw identity"
                        if job.existing
                        else "new raw identity"
                    ),
                    response={
                        "backend": job.backend,
                        "solver_profile": job.solver_profile,
                        "cnf_blob_hash": job.cnf_blob_hash,
                        "identity_hash": job.identity_hash,
                        "num_vars": job.num_vars,
                        "num_clauses": job.num_clauses,
                        "existing": job.existing,
                    },
                ),
                outcome=CHECKPOINT,
                detail=f"PREPARE: recovered job {job.job_id}",
            )
            records = journal.records
        job = _prepared_job_from_records(records, cell, cnf)
        client.verify_stored_cnf(job, cnf)
        driver._append(
            event=_driver._event(
                phase="POLL",
                disposition="SUCCESS",
                job_id=job.job_id,
                detail="journal-bound recovery verified exact stored CNF",
            ),
            outcome=CHECKPOINT,
            detail=f"POLL: resumed authenticated job {job.job_id}",
        )
        for poll_index in range(MAX_POLLS):
            payload = client.status(job.job_id)
            state, result_name = _driver._status_state(payload)
            if state == "prepared":
                payload, state, result_name = _confirm_and_refresh(client, job, cnf)
            if state in {"confirmed", "running"}:
                if poll_index + 1 == MAX_POLLS:
                    record = driver._record_error(
                        phase="POLL_TIMEOUT",
                        detail="journal-bound job did not terminate",
                        poll_index=poll_index,
                        job_id=job.job_id,
                        status=state,
                    )
                    return _summary(
                        identifier, driver._finish(record, job_id=job.job_id)
                    )
                time.sleep(POLL_INTERVAL_S)
                continue
            if state == "failed":
                record = driver._record_error(
                    phase="DAEMON_FAILED",
                    detail="journal-bound PIQD job failed",
                    poll_index=poll_index,
                    job_id=job.job_id,
                    status=state,
                    result=result_name,
                    response=payload,
                )
                return _summary(identifier, driver._finish(record, job_id=job.job_id))
            _require(
                state == "completed",
                "PIQD resume returned an invalid lifecycle state",
            )
            if result_name == "SAT":
                return _summary(identifier, driver._finish_sat(job=job, cnf=cnf))
            if result_name == "UNSAT":
                return _summary(
                    identifier,
                    driver._finish_unsat(job=job, cnf=cnf, wave_manifest=wave),
                )
            record = driver._record_error(
                phase="SOLVER_UNKNOWN",
                detail="journal-bound PIQD job completed UNKNOWN",
                poll_index=poll_index,
                job_id=job.job_id,
                status=state,
                result=result_name,
                response=payload,
            )
            return _summary(identifier, driver._finish(record, job_id=job.job_id))
        raise PortfolioRunnerError("resume poll loop ended without a terminal record")
    finally:
        journal.close()


@dataclass(frozen=True)
class CellState:
    kind: str
    result: dict[str, Any] | None = None


def _validate_artifact_directory(path: Path) -> set[str]:
    try:
        info = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError("cell artifact directory is missing") from exc
    _require(stat.S_ISDIR(info.st_mode), "cell artifact path is not a directory")
    descriptor = os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        names = set(os.listdir(descriptor))
        for name in names:
            _digest(name, "cell artifact filename")
            raw = _read_private_file(
                path / name, maximum=8 << 30, label="cell artifact"
            )
            _require(sha256_bytes(raw) == name, "cell artifact content hash drifted")
    finally:
        os.close(descriptor)
    return names


def _terminal_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any]
) -> dict[str, Any]:
    identifier = str(cell["portfolio_cell_id"])
    _, _, wave = _load_cell_inputs(root, cell)
    journal_path = run_root / "events" / f"{identifier}.jsonl"
    records = _read_journal_records(journal_path, wave)
    _empty_file_identity(
        run_root / "events" / f"{identifier}.jsonl.lock", "cell journal lock"
    )
    artifact_names = _validate_artifact_directory(
        run_root / "events" / f"{identifier}.jsonl.artifacts"
    )
    seal_path = run_root / "events" / f"{identifier}.jsonl.seal.json"
    seal_raw = _read_private_file(seal_path, maximum=1 << 20, label="cell seal")
    _require(seal_raw.endswith(b"\n"), "cell seal is not newline-terminated")
    seal = _strict_json(seal_raw[:-1], "cell seal")
    _require(
        seal.get("seal_sha256") == _self_hash(seal, "seal_sha256"),
        "cell seal self-hash drifted",
    )
    _require(
        seal.get("wave_manifest_sha256") == _driver.wave_manifest_sha256(wave),
        "cell seal wave binding drifted",
    )
    terminal = records[-1]
    _require(terminal["outcome"] != CHECKPOINT, "sealed journal is not terminal")
    _require(seal.get("record_count") == len(records), "cell seal count drifted")
    _require(
        seal.get("terminal_attempt_sha256") == terminal["record_sha256"],
        "cell seal terminal drifted",
    )
    _require(
        seal.get("journal_sha256")
        == sha256_bytes(
            _read_private_file(journal_path, maximum=64 << 20, label="cell journal")
        ),
        "cell seal journal hash drifted",
    )
    virtual = {
        str(wave["encoding"]["cnf_sha256"]),
        str(wave["encoding"]["producer_manifest_sha256"]),
    }
    referenced = {
        str(digest)
        for record in records
        for digest in record["artifacts"].values()
        if digest is not None
    }
    _require(
        referenced - virtual <= artifact_names <= referenced | virtual,
        "cell artifact inventory does not match the journal",
    )
    artifacts = terminal["artifacts"]
    if terminal["outcome"] == STRUCTURAL_SAT:
        _require(
            artifacts.get("model_sha256") and artifacts.get("solver_log_sha256"),
            "SAT terminal lacks model/log custody",
        )
    if terminal["outcome"] == CERTIFIED_UNSAT:
        for key in (
            "solver_log_sha256",
            "proof_sha256",
            "proof_checker_sha256",
            "proof_replay_sha256",
        ):
            _require(artifacts.get(key), f"certified UNSAT terminal lacks {key}")
    event = terminal["event"]
    journal_job_id = _journal_job_id(records)
    _require(
        type(event.get("job_id")) is str
        and event["job_id"]
        and event["job_id"] == journal_job_id,
        "terminal job id is missing",
    )
    return {
        "portfolio_cell_id": identifier,
        "job_id": event["job_id"],
        "outcome": terminal["outcome"],
        "terminal_record_sha256": terminal["record_sha256"],
        "journal_record_count": len(records),
        "seal_sha256": seal["seal_sha256"],
        "artifacts": dict(artifacts),
    }


def classify_cell_state(
    root: Path, run_root: Path, cell: Mapping[str, Any]
) -> CellState:
    identifier = str(cell["portfolio_cell_id"])
    base = run_root / "events" / f"{identifier}.jsonl"
    lock = base.with_name(f"{base.name}.lock")
    artifacts = base.with_name(f"{base.name}.artifacts")
    seal = base.with_name(f"{base.name}.seal.json")
    flags = (base.exists(), lock.exists(), artifacts.exists(), seal.exists())
    if flags == (False, False, False, False):
        return CellState("FRESH")
    if flags == (True, True, False, False):
        _empty_file_identity(base, "reserved journal")
        _empty_file_identity(lock, "reserved journal lock")
        return CellState("RESERVED")
    if flags == (True, True, True, False):
        cnf, _, wave = _load_cell_inputs(root, cell)
        raw = _read_private_file(base, maximum=64 << 20, label="cell journal")
        if not raw:
            return CellState("RESUME_PREPARE")
        records = _read_journal_records(base, wave)
        if records[-1]["outcome"] != CHECKPOINT:
            _require(
                _journal_job_id(records) is not None,
                "unsealed terminal lacks a job identity",
            )
            return CellState("RESEAL")
        prepared = [
            record
            for record in records
            if record["event"].get("phase") == "PREPARE"
            and record["event"].get("disposition") == "SUCCESS"
        ]
        if not prepared:
            return CellState("RESUME_PREPARE")
        _prepared_job_from_records(records, cell, cnf)
        return CellState("RESUME")
    if flags == (True, True, True, True):
        result = _terminal_cell(root, run_root, cell)
        return CellState("TERMINAL", result)
    raise PortfolioRunnerError(f"cell {identifier} has ambiguous recovery custody")


def _file_ref(path: Path, raw: bytes, root: Path) -> dict[str, Any]:
    return {
        "path": _relative(root, path),
        "sha256": sha256_bytes(raw),
        "bytes": len(raw),
    }


def _artifact_bytes(
    run_root: Path, identifier: str, digest: Any, label: str, maximum: int
) -> bytes:
    expected = _digest(digest, label)
    path = run_root / "events" / f"{identifier}.jsonl.artifacts" / expected
    raw = _read_private_file(path, maximum=maximum, label=label)
    _require(sha256_bytes(raw) == expected, f"{label} content hash drifted")
    return raw


def _json_mapping(raw: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=lambda pairs: _unique_pairs(pairs, label),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise PortfolioRunnerError(f"{label} is not valid strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    return value


def _unique_pairs(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        _require(key not in result, f"{label} has a duplicate JSON key")
        result[key] = value
    return result


def _valid_lean_identifier(value: Any) -> bool:
    if type(value) is not str or not value.startswith("Problem97."):
        return False
    parts = value.split(".")
    return all(
        part
        and part.isascii()
        and (part[0].isalpha() or part[0] == "_")
        and all(char.isalnum() or char in "_'" for char in part[1:])
        for part in parts
    )


def _candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": candidate.get("schema"),
        "family": candidate.get("family"),
        "source_valid": candidate.get("source_valid"),
        "lean_consumer": candidate.get("lean_consumer"),
        "support": candidate.get("support"),
        "payload": candidate.get("payload"),
    }


def _candidate_id(candidate: Mapping[str, Any]) -> str:
    family = candidate.get("family")
    return f"{family}:{sha256_bytes(canonical_json_bytes(_candidate_identity_material(candidate)))}"


def _validate_candidate_records(
    candidates: Sequence[Any], family_inventory: Sequence[str]
) -> None:
    expected_keys = {
        "schema",
        "candidate_id",
        "record_sha256",
        "family",
        "source_valid",
        "lean_consumer",
        "support",
        "payload",
    }
    identifiers: list[str] = []
    for candidate in candidates:
        _require(
            type(candidate) is dict and set(candidate) == expected_keys,
            "wave-only candidate record schema drifted",
        )
        family = candidate["family"]
        support = candidate["support"]
        payload = candidate["payload"]
        _require(
            candidate["schema"] == WAVE_MINE_CANDIDATE_SCHEMA
            and type(family) is str
            and family in family_inventory
            and family
            and family.isascii()
            and all(char.islower() or char.isdigit() or char == "-" for char in family)
            and candidate["source_valid"] is True
            and _valid_lean_identifier(candidate["lean_consumer"])
            and type(support) is list
            and type(payload) is dict
            and bool(support or payload),
            "wave-only candidate record content drifted",
        )
        support_keys = [canonical_json_bytes(item) for item in support]
        _require(
            support_keys == sorted(set(support_keys)),
            "wave-only candidate support is not canonical",
        )
        identifier = candidate["candidate_id"]
        _require(
            type(identifier) is str
            and identifier == _candidate_id(candidate)
            and identifier.startswith(f"{family}:"),
            "wave-only candidate identifier drifted",
        )
        _require(
            candidate["record_sha256"] == _self_hash(candidate, "record_sha256"),
            "wave-only candidate record hash drifted",
        )
        identifiers.append(identifier)
    _require(
        identifiers == sorted(set(identifiers)),
        "wave-only candidate identifiers are not sorted and unique",
    )


_MINE_VERIFY_AUDIT_WRAPPER = r"""
import os
import runpy
import sys

_WRITE_FLAGS = (
    os.O_WRONLY | os.O_RDWR | os.O_APPEND | os.O_CREAT | os.O_TRUNC
)
_MUTATION_EVENTS = {
    "os.chdir", "os.chflags", "os.chmod", "os.chown", "os.fchdir",
    "os.fchmod", "os.fchown", "os.lchflags", "os.lchmod", "os.lchown",
    "os.link", "os.mkdir", "os.putenv", "os.remove", "os.removexattr",
    "os.rename", "os.rmdir", "os.setxattr", "os.symlink", "os.truncate",
    "os.unlink", "os.unsetenv", "os.utime",
}
_PROCESS_EVENTS = {
    "os.fork", "os.forkpty", "os.kill", "os.killpg", "os.posix_spawn",
    "pty.spawn", "signal.pthread_kill",
}

def _deny_side_effects(event, args):
    if event.startswith(("socket.", "subprocess.", "os.exec", "os.spawn")):
        raise RuntimeError("verify-existing side effect denied: " + event)
    if event in _MUTATION_EVENTS or event in _PROCESS_EVENTS or event == "os.system":
        raise RuntimeError("verify-existing side effect denied: " + event)
    if event == "open":
        mode = args[1] if len(args) > 1 else None
        flags = args[2] if len(args) > 2 else 0
        if (
            isinstance(mode, str) and any(char in mode for char in "wax+")
        ) or (isinstance(flags, int) and flags & _WRITE_FLAGS):
            raise RuntimeError("verify-existing file mutation denied")

sys.addaudithook(_deny_side_effects)
script = sys.argv[1]
sys.argv = sys.argv[1:]
runpy.run_path(script, run_name="__main__")
""".strip()


def _validate_scanner_dependencies(value: Any, *, root: Path) -> dict[str, Any]:
    dependencies = _require_exact_keys(
        value,
        set(value) if type(value) is dict else set(),
        "scanner dependency inventory",
    )
    _require(bool(dependencies), "scanner dependency inventory is empty")
    for relative, reference in dependencies.items():
        _safe_path(root, relative, "scanner dependency")
        _require_exact_keys(reference, {"sha256", "bytes"}, "scanner dependency")
        _digest(reference["sha256"], "scanner dependency")
        _require(
            type(reference["bytes"]) is int and reference["bytes"] > 0,
            "scanner dependency byte count is invalid",
        )
    return dependencies


def _validate_mine_inventory(
    ledger: Mapping[str, Any], candidates: Sequence[Any], canary: Mapping[str, Any]
) -> None:
    inventory = _require_exact_keys(
        ledger.get("family_inventory"),
        {
            "family_candidate_counts",
            "formalized_stage_counts",
            "excluded_diagnostic_stage_counts",
            "complete_equality_component_counts",
        },
        "wave-only family inventory",
    )
    counts = _require_exact_keys(
        inventory["family_candidate_counts"],
        set(PINNED_SOURCE_VALID_FAMILIES),
        "wave-only family candidate counts",
    )
    observed_counts = {
        family: sum(candidate["family"] == family for candidate in candidates)
        for family in PINNED_SOURCE_VALID_FAMILIES
    }
    _require(counts == observed_counts, "wave-only family candidate counts drifted")
    for label in (
        "formalized_stage_counts",
        "excluded_diagnostic_stage_counts",
        "complete_equality_component_counts",
    ):
        values = inventory[label]
        _require(
            type(values) is dict
            and all(type(key) is str and key for key in values)
            and all(type(count) is int and count >= 0 for count in values.values()),
            f"wave-only {label} is malformed",
        )

    decoded = _require_exact_keys(
        ledger.get("decoded_selectors"),
        {"rows", "nextCenter", "NamedOrder", "order", "assignment_sha256"},
        "wave-only decoded selectors",
    )
    rows = decoded["rows"]
    _require(
        type(rows) is dict and set(rows) == {str(index) for index in range(17)},
        "wave-only decoded rows are incomplete",
    )
    for center in range(17):
        support = rows[str(center)]
        _require(
            type(support) is list
            and len(support) == 4
            and support == sorted(set(support))
            and center not in support
            and all(type(point) is int and 0 <= point < 17 for point in support),
            "wave-only decoded row is malformed",
        )
    order_index = decoded["NamedOrder"]
    _require(
        type(order_index) is int
        and order_index in NAMED_ORDER_TABLES
        and decoded["order"] == list(NAMED_ORDER_TABLES[order_index])
        and decoded["nextCenter"] == canary["center"],
        "wave-only decoded selector binding drifted",
    )
    _digest(decoded["assignment_sha256"], "wave-only assignment")


def _verify_existing_mine(
    *,
    root: Path,
    run_root: Path,
    canary: Mapping[str, Any],
    terminal: Mapping[str, Any],
    campaign_sha256: str,
    run_manifest_sha256: str,
    ledger: Mapping[str, Any],
    receipt_raws: Mapping[str, bytes],
) -> dict[str, Any]:
    """Re-run the exact pinned miner in an isolated, read-only process."""

    miner_path = root / MINER_RELATIVE
    miner_raw = _read_repo_source_file(
        miner_path,
        maximum=max(MINER_BYTES, 1 << 20),
        label="wave-only miner",
    )
    _require(
        len(miner_raw) == MINER_BYTES
        and sha256_bytes(miner_raw) == _digest(MINER_SHA256, "wave-only miner"),
        "wave-only miner support pin drifted before verification",
    )
    command = (
        sys.executable,
        "-I",
        "-B",
        "-c",
        _MINE_VERIFY_AUDIT_WRAPPER,
        str(miner_path),
        "--run-root",
        str(run_root),
        "--cell-id",
        CANARY_PORTFOLIO_CELL_ID,
        "--output-dir",
        str(run_root / "artifacts"),
        "--verify-existing",
    )
    environment = {
        "LANG": "C",
        "LC_ALL": "C",
        "PATH": "/usr/bin:/bin",
        "PYTHONHASHSEED": "0",
        "PYTHONDONTWRITEBYTECODE": "1",
        "PYTHONNOUSERSITE": "1",
    }
    try:
        completed = subprocess.run(
            command,
            cwd=root,
            env=environment,
            stdin=subprocess.DEVNULL,
            capture_output=True,
            timeout=MINE_VERIFICATION_TIMEOUT_S,
            check=False,
            close_fds=True,
            start_new_session=True,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise PortfolioRunnerError(
            "pinned miner verification did not complete"
        ) from exc
    _require(
        completed.returncode == 0
        and completed.stderr == b""
        and 0 < len(completed.stdout) <= 64 << 10,
        "pinned miner verification failed",
    )
    verification = _strict_json(completed.stdout, "pinned miner verification")
    _require_exact_keys(
        verification,
        {
            "schema",
            "status",
            "portfolio_cell_id",
            "campaign_sha256",
            "run_manifest_sha256",
            "model_sha256",
            "cnf_sha256",
            "candidate_ledger_sha256",
            "scanner_dependencies_sha256",
            "family_inventory_sha256",
            "decoded_selectors_sha256",
            "receipt_sha256s",
        },
        "pinned miner verification",
    )
    expected_receipts = {
        name: sha256_bytes(raw) for name, raw in sorted(receipt_raws.items())
    }
    _require_exact_keys(
        verification["receipt_sha256s"],
        set(expected_receipts),
        "pinned miner verification receipt hashes",
    )
    _require(
        verification["schema"] == MINE_VERIFICATION_SCHEMA
        and verification["status"] == "PASS"
        and verification["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
        and verification["campaign_sha256"] == campaign_sha256
        and verification["run_manifest_sha256"] == run_manifest_sha256
        and verification["model_sha256"] == terminal["artifacts"]["model_sha256"]
        and verification["cnf_sha256"] == canary["source_cnf"]["sha256"]
        and verification["candidate_ledger_sha256"]
        == expected_receipts["candidate-ledger.json"]
        and verification["scanner_dependencies_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["scanner_dependencies"]))
        and verification["family_inventory_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["family_inventory"]))
        and verification["decoded_selectors_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["decoded_selectors"]))
        and verification["receipt_sha256s"] == expected_receipts,
        "pinned miner verification binding drifted",
    )
    return verification


def _validated_archived_sat_assignment(
    model_raw: bytes,
    *,
    terminal: Mapping[str, Any],
    cnf: bytes,
) -> list[int]:
    """Validate the exact PIQD SAT-model response schema and replay it.

    PIQD's certified model seam has exactly four keys and no embedded self-hash.
    The immutable artifact filename and terminal custody therefore bind the exact
    canonical response bytes by their SHA-256 instead of inventing a fifth field.
    """

    expected_sha256 = _digest(
        terminal["artifacts"].get("model_sha256"), "archived SAT model"
    )
    _require(
        sha256_bytes(model_raw) == expected_sha256,
        "archived SAT model raw hash drifted",
    )
    model = _strict_json(model_raw, "archived SAT model")
    _require_exact_keys(
        model,
        {"job_id", "result", "num_assigned", "assignment"},
        "archived SAT model",
    )
    assignment = model["assignment"]
    _require(
        model["job_id"] == terminal["job_id"]
        and model["result"] == "SAT"
        and type(assignment) is list
        and model["num_assigned"] == NUM_VARIABLES
        and len(assignment) == NUM_VARIABLES
        and all(type(literal) is int for literal in assignment),
        "archived SAT model binding drifted",
    )
    scan_dimacs(cnf, assignment=assignment)
    return assignment


def _validate_acceptance(
    root: Path,
    run_root: Path,
    checked: Mapping[str, Any],
) -> dict[str, Any]:
    canary = next(
        cell
        for cell in checked["cells"]
        if cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
    )
    terminal = _terminal_cell(root, run_root, canary)
    path = run_root / "artifacts/canary-acceptance.json"
    raw = _read_private_file(path, maximum=1 << 20, label="canary acceptance")
    payload = _strict_json(raw, "canary acceptance")
    _require_exact_keys(
        payload,
        set(_TERMINAL_RESULT_KEYS)
        | {
            "schema",
            "status",
            "campaign_sha256",
            "run_manifest_sha256",
            "evidence",
            "manifest_sha256",
        },
        "canary acceptance",
    )
    _require(
        payload.get("schema") == ACCEPTANCE_SCHEMA
        and payload.get("status") == "ACCEPTED",
        "canary acceptance status drifted",
    )
    _require(
        payload.get("manifest_sha256") == _self_hash(payload),
        "canary acceptance self-hash drifted",
    )
    for key in _TERMINAL_RESULT_KEYS:
        _require(
            payload.get(key) == terminal.get(key), f"canary acceptance {key} drifted"
        )
    _require(
        payload.get("campaign_sha256") == checked["campaign_sha256"],
        "canary acceptance campaign drifted",
    )
    _require(
        payload.get("run_manifest_sha256") == checked["run_manifest_sha256"],
        "canary acceptance run drifted",
    )
    evidence = payload.get("evidence")
    _require_exact_keys(
        evidence,
        {
            "independent_sat_replay",
            "wave_only_mine",
            "independent_unsat_replay",
        },
        "canary acceptance evidence",
    )
    cnf, producer_raw, wave = _load_cell_inputs(root, canary)
    producer = _strict_json(producer_raw, "canary producer manifest")
    variable_map_sha256 = _digest(
        producer.get("variable_map_sha256"), "canary producer variable map"
    )
    if terminal["outcome"] == STRUCTURAL_SAT:
        _require_exact_keys(
            evidence["independent_sat_replay"],
            {"path", "sha256", "bytes"},
            "SAT replay receipt reference",
        )
        _require_exact_keys(
            evidence["wave_only_mine"],
            {"path", "sha256", "bytes"},
            "wave-only mine receipt reference",
        )
        replay_raw = _read_ref(
            root, evidence.get("independent_sat_replay"), "SAT replay receipt", 4 << 20
        )
        mine_raw = _read_ref(
            root, evidence.get("wave_only_mine"), "wave-only mine receipt", 16 << 20
        )
        replay = _strict_json(replay_raw, "SAT replay receipt")
        mine = _strict_json(mine_raw, "wave-only mine receipt")
        _require_exact_keys(
            replay,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "cnf_sha256",
                "producer_manifest_sha256",
                "wave_manifest_sha256",
                "variable_map_sha256",
                "num_variables",
                "clauses_checked",
                "all_clauses_satisfied",
                "model_sha256",
            },
            "SAT replay receipt",
        )
        _require_exact_keys(
            mine,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "model_sha256",
                "source_valid_only",
                "complete_equality_component_checked",
                "candidate_ledger_sha256",
                "candidate_ledger",
                "candidates_examined",
                "scan_complete",
                "complete_no_candidates",
                "models_mined",
            },
            "wave-only mine receipt",
        )
        model_raw = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["model_sha256"],
            "archived SAT model",
            16 << 20,
        )
        _validated_archived_sat_assignment(
            model_raw,
            terminal=terminal,
            cnf=cnf,
        )
        _require(
            replay.get("schema") == SAT_REPLAY_SCHEMA
            and replay.get("status") == "PASS"
            and replay.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and replay.get("job_id") == terminal["job_id"]
            and replay.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and replay.get("producer_manifest_sha256")
            == canary["producer_manifest"]["sha256"]
            and replay.get("wave_manifest_sha256") == canary["wave_manifest"]["sha256"]
            and replay.get("variable_map_sha256") == variable_map_sha256
            and replay.get("num_variables") == NUM_VARIABLES
            and replay.get("clauses_checked") == NUM_CLAUSES
            and replay.get("all_clauses_satisfied") is True
            and replay.get("model_sha256") == terminal["artifacts"]["model_sha256"],
            "independent SAT replay receipt drifted",
        )
        _require(
            mine.get("schema") == WAVE_MINE_SCHEMA
            and mine.get("status") == "ACCEPTED"
            and mine.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and mine.get("job_id") == terminal["job_id"]
            and mine.get("model_sha256") == terminal["artifacts"]["model_sha256"]
            and mine.get("source_valid_only") is True
            and mine.get("complete_equality_component_checked") is True,
            "wave-only theorem mine acceptance drifted",
        )
        _digest(mine.get("candidate_ledger_sha256"), "wave-only candidate ledger")
        _require_exact_keys(
            mine["candidate_ledger"],
            {"path", "sha256", "bytes"},
            "wave-only candidate ledger reference",
        )
        ledger_raw = _read_ref(
            root,
            mine.get("candidate_ledger"),
            "wave-only candidate ledger",
            32 << 20,
        )
        _require(
            sha256_bytes(ledger_raw) == mine["candidate_ledger_sha256"],
            "wave-only candidate ledger receipt hash drifted",
        )
        ledger = _strict_json(ledger_raw, "wave-only candidate ledger")
        _require_exact_keys(
            ledger,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "model_sha256",
                "cnf_sha256",
                "producer_manifest_sha256",
                "wave_manifest_sha256",
                "variable_map_sha256",
                "source_valid_only",
                "scan_complete",
                "candidates_examined",
                "complete_no_candidates",
                "scanner",
                "scanner_dependencies",
                "source_valid_family_inventory",
                "family_inventory",
                "decoded_selectors",
                "candidates",
                "manifest_sha256",
            },
            "wave-only candidate ledger",
        )
        _require(
            ledger.get("manifest_sha256") == _self_hash(ledger),
            "wave-only candidate ledger self-hash drifted",
        )
        candidates = ledger.get("candidates")
        scanner = ledger.get("scanner")
        family_inventory = ledger.get("source_valid_family_inventory")
        candidates_examined = ledger.get("candidates_examined")
        _require(
            ledger.get("schema") == WAVE_MINE_LEDGER_SCHEMA
            and ledger.get("status") == "COMPLETE"
            and ledger.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and ledger.get("job_id") == terminal["job_id"]
            and ledger.get("model_sha256") == terminal["artifacts"]["model_sha256"]
            and ledger.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and ledger.get("producer_manifest_sha256")
            == canary["producer_manifest"]["sha256"]
            and ledger.get("wave_manifest_sha256") == canary["wave_manifest"]["sha256"]
            and ledger.get("variable_map_sha256") == variable_map_sha256
            and ledger.get("source_valid_only") is True
            and ledger.get("scan_complete") is True
            and type(candidates) is list
            and type(candidates_examined) is int
            and candidates_examined >= 0
            and candidates_examined == len(candidates)
            and type(mine.get("candidates_examined")) is int
            and mine.get("candidates_examined") == candidates_examined
            and mine.get("scan_complete") is True
            and ledger.get("complete_no_candidates") is (candidates_examined == 0)
            and mine.get("complete_no_candidates") is (candidates_examined == 0),
            "wave-only candidate ledger binding drifted",
        )
        _require(
            type(scanner) is dict
            and scanner
            == {
                "name": MINER_NAME,
                "schema": MINER_SCHEMA,
                "version": MINER_VERSION,
                "source_path": MINER_RELATIVE,
                "source_sha256": MINER_SHA256,
            },
            "wave-only scanner identity is incomplete",
        )
        _require(
            type(family_inventory) is list
            and family_inventory == list(PINNED_SOURCE_VALID_FAMILIES),
            "wave-only source-valid family inventory is incomplete",
        )
        _validate_candidate_records(candidates, family_inventory)
        _validate_scanner_dependencies(ledger.get("scanner_dependencies"), root=root)
        _validate_mine_inventory(ledger, candidates, canary)
        _require(
            type(mine.get("models_mined")) is int and mine["models_mined"] == 1,
            "wave-only theorem mine model count drifted",
        )
        _require(
            evidence.get("independent_unsat_replay") is None,
            "SAT acceptance carries UNSAT evidence",
        )
        _verify_existing_mine(
            root=root,
            run_root=run_root,
            canary=canary,
            terminal=terminal,
            campaign_sha256=checked["campaign_sha256"],
            run_manifest_sha256=checked["run_manifest_sha256"],
            ledger=ledger,
            receipt_raws={
                "candidate-ledger.json": ledger_raw,
                "sat-replay-receipt.json": replay_raw,
                "mine-receipt.json": mine_raw,
                "canary-acceptance.json": raw,
            },
        )
    elif terminal["outcome"] == CERTIFIED_UNSAT:
        _require_exact_keys(
            evidence["independent_unsat_replay"],
            {"path", "sha256", "bytes"},
            "UNSAT replay receipt reference",
        )
        proof_raw = _read_ref(
            root,
            evidence.get("independent_unsat_replay"),
            "UNSAT replay receipt",
            4 << 20,
        )
        proof = _strict_json(proof_raw, "UNSAT replay receipt")
        _require_exact_keys(
            proof,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "cnf_sha256",
                "proof_sha256",
                "proof_checker_sha256",
                "proof_replay_sha256",
            },
            "UNSAT replay receipt",
        )
        proof_bytes = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_sha256"],
            "archived LRAT proof",
            8 << 30,
        )
        checker_bytes = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_checker_sha256"],
            "archived Lean checker",
            2 << 30,
        )
        archived_replay_raw = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_replay_sha256"],
            "archived proof replay receipt",
            16 << 20,
        )
        archived_replay = _strict_json(
            archived_replay_raw, "archived proof replay receipt"
        )
        _require(
            archived_replay.get("verified") is True
            and archived_replay.get("proof_sha256")
            == terminal["artifacts"]["proof_sha256"]
            and type(archived_replay.get("job")) is dict
            and archived_replay["job"].get("id") == terminal["job_id"],
            "archived proof replay binding drifted",
        )
        job = PreparedJob(
            terminal["job_id"],
            BACKEND,
            SOLVER_PROFILE,
            sha256_bytes(cnf),
            str(canary["expected_identity_hash"]),
            NUM_VARIABLES,
            NUM_CLAUSES,
            False,
            REQUESTED_CORE_LIMIT,
        )
        validate_replay_result(
            result=LratReplayResult(
                verified=True,
                checker_source=checker_bytes,
                receipt=archived_replay_raw,
            ),
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        replayer = LeanLratReplayer(
            lean_root=root / "lean",
            work_dir=run_root / "tmp" / "canary-independent-unsat-replay",
            timeout_s=REPLAY_TIMEOUT_S,
        )
        replay_result = replayer.replay(
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        validate_replay_result(
            result=replay_result,
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        _require(replay_result.verified is True, "independent UNSAT replay failed")
        _require(
            replay_result.checker_source == checker_bytes,
            "independent UNSAT checker source drifted",
        )
        _require(
            proof.get("schema") == UNSAT_REPLAY_SCHEMA
            and proof.get("status") == "CERTIFIED_UNSAT"
            and proof.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and proof.get("job_id") == terminal["job_id"]
            and proof.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and proof.get("proof_sha256") == terminal["artifacts"]["proof_sha256"]
            and proof.get("proof_checker_sha256")
            == terminal["artifacts"]["proof_checker_sha256"]
            and proof.get("proof_replay_sha256")
            == terminal["artifacts"]["proof_replay_sha256"],
            "independent UNSAT replay receipt drifted",
        )
        _require(
            evidence.get("independent_sat_replay") is None
            and evidence.get("wave_only_mine") is None,
            "UNSAT acceptance carries SAT evidence",
        )
    else:
        raise PortfolioRunnerError("canary terminal outcome is not acceptable")
    return payload


@contextmanager
def _global_capacity_lease(
    *, capacity_root: Path = GLOBAL_CAPACITY_ROOT, slots: int = MAX_ACTIVE_JOBS
) -> Any:
    """Hold one process-global PIQD core slot across a complete cell lifecycle."""

    _require_production_pins()
    _require(slots == MAX_ACTIVE_JOBS, "global PIQD capacity must remain exactly 12")
    capacity_root.mkdir(mode=0o700, parents=True, exist_ok=True)
    root_info = capacity_root.lstat()
    _require(
        stat.S_ISDIR(root_info.st_mode)
        and root_info.st_mode & 0o077 == 0
        and root_info.st_uid == os.getuid(),
        "global capacity root is unsafe",
    )
    root_fd = os.open(
        capacity_root,
        os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
    )
    held_root = os.fstat(root_fd)
    _require(
        (held_root.st_dev, held_root.st_ino) == (root_info.st_dev, root_info.st_ino),
        "global capacity root identity changed",
    )
    descriptor: int | None = None
    try:
        while descriptor is None:
            for index in range(slots):
                name = f"slot-{index:02d}.lock"
                try:
                    candidate = os.open(
                        name,
                        os.O_RDWR
                        | os.O_CREAT
                        | os.O_EXCL
                        | os.O_NOFOLLOW
                        | getattr(os, "O_CLOEXEC", 0),
                        0o600,
                        dir_fd=root_fd,
                    )
                    os.fsync(root_fd)
                except FileExistsError:
                    candidate = os.open(
                        name,
                        os.O_RDWR | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
                        dir_fd=root_fd,
                    )
                try:
                    held = os.fstat(candidate)
                    named = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
                    _require(
                        stat.S_ISREG(held.st_mode)
                        and held.st_nlink == 1
                        and held.st_mode & 0o077 == 0
                        and held.st_uid == os.getuid()
                        and (held.st_dev, held.st_ino) == (named.st_dev, named.st_ino),
                        "global capacity slot is unsafe",
                    )
                    try:
                        fcntl.flock(candidate, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    except BlockingIOError:
                        os.close(candidate)
                        continue
                    descriptor = candidate
                    break
                except BaseException:
                    if descriptor != candidate:
                        os.close(candidate)
                    raise
            if descriptor is None:
                time.sleep(0.05)
        yield
    finally:
        if descriptor is not None:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
            os.close(descriptor)
        os.close(root_fd)


def _bounded_run(
    jobs: Sequence[tuple[str, Mapping[str, Any]]],
    *,
    root: Path,
    run_root: Path,
    base_url: str,
    max_active: int = MAX_ACTIVE_JOBS,
    capacity_root: Path = GLOBAL_CAPACITY_ROOT,
) -> list[dict[str, Any]]:
    _require_production_pins()
    _authenticate_runner_support(root)
    _require(1 <= max_active <= MAX_ACTIVE_JOBS, "active-job bound is invalid")
    identifiers = [str(cell.get("portfolio_cell_id")) for _, cell in jobs]
    _require(len(identifiers) == len(set(identifiers)), "bounded jobs duplicate a cell")
    cell_by_id: dict[str, Mapping[str, Any]] = {}
    for kind, cell in jobs:
        _require(
            kind in {"FRESH", "RESERVED", "RESUME", "RESUME_PREPARE", "RESEAL"},
            "unknown cell recovery state",
        )
        _require_production_cell_identity(cell)
        cell_by_id[str(cell["portfolio_cell_id"])] = cell
    pending = iter(jobs)
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=max_active) as executor:
        active: dict[Future[dict[str, Any]], str] = {}

        def submit_one(item: tuple[str, Mapping[str, Any]]) -> None:
            kind, cell = item
            cell_runner = (
                _fresh_run_cell if kind in {"FRESH", "RESERVED"} else _resume_run_cell
            )

            def leased() -> dict[str, Any]:
                with _global_capacity_lease(capacity_root=capacity_root):
                    return cell_runner(root, run_root, cell, base_url)

            future = executor.submit(leased)
            active[future] = str(cell["portfolio_cell_id"])

        for _ in range(max_active):
            try:
                submit_one(next(pending))
            except StopIteration:
                break
        while active:
            completed, _ = wait(active, return_when=FIRST_COMPLETED)
            for future in completed:
                expected = active.pop(future)
                result = future.result()
                _require(
                    result.get("portfolio_cell_id") == expected,
                    "cell runner returned wrong identity",
                )
                terminal = _terminal_cell(root, run_root, cell_by_id[expected])
                for key in (
                    "portfolio_cell_id",
                    "job_id",
                    "outcome",
                    "terminal_record_sha256",
                    "journal_record_count",
                    "seal_sha256",
                ):
                    _require(
                        result.get(key) == terminal.get(key),
                        f"cell runner {key} disagrees with terminal custody",
                    )
                results.append(terminal)
                try:
                    submit_one(next(pending))
                except StopIteration:
                    pass
    return sorted(results, key=lambda item: item["portfolio_cell_id"])


def _phase_paths(run_root: Path, phase: str) -> tuple[Path, Path, Path]:
    return (
        run_root / "artifacts" / f"{phase}-launch.lock",
        run_root / "artifacts" / f"{phase}-launch-manifest.json",
        run_root / "artifacts" / f"{phase}-result.json",
    )


def _write_once_or_validate(path: Path, raw: bytes, label: str) -> None:
    _require_production_pins()
    path.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    try:
        descriptor = os.open(
            path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o600
        )
    except FileExistsError:
        _require(
            _read_private_file(path, maximum=max(len(raw), 1 << 20), label=label)
            == raw,
            f"{label} conflicts with existing bytes",
        )
        return
    except OSError as exc:
        raise PortfolioRunnerError(f"cannot create {label}") from exc
    try:
        offset = 0
        while offset < len(raw):
            offset += os.write(descriptor, raw[offset:])
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    parent = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        os.fsync(parent)
    finally:
        os.close(parent)


def _phase_lock(run_root: Path, phase: str, launch_bytes: bytes) -> int:
    _require_production_pins()
    lock, _, _ = _phase_paths(run_root, phase)
    binding_payload = {
        "schema": f"{LAUNCH_SCHEMA}/lock/v1",
        "phase": phase,
        "launch_sha256": sha256_bytes(launch_bytes),
    }
    binding = canonical_json_bytes(
        {**binding_payload, "manifest_sha256": _self_hash(binding_payload)}
    )
    _write_once_or_validate(lock, binding, f"{phase} launch lock")
    descriptor = os.open(lock, os.O_RDWR | os.O_NOFOLLOW)
    try:
        fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except BaseException:
        os.close(descriptor)
        raise
    return descriptor


def _validated_existing_phase_result(
    *,
    phase: str,
    checked: Mapping[str, Any],
    selected: Sequence[Mapping[str, Any]],
    root: Path,
    run_root: Path,
) -> dict[str, Any] | None:
    """Authenticate a prior phase result before any daemon endpoint is used."""

    _, launch_path, result_path = _phase_paths(run_root, phase)
    if not result_path.exists():
        return None
    result_raw = _read_private_file(
        result_path, maximum=4 << 20, label=f"preexisting {phase} result"
    )
    result = _strict_json(result_raw, f"preexisting {phase} result")
    _require(
        set(result)
        == {
            "schema",
            "phase",
            "campaign_sha256",
            "run_manifest_sha256",
            "launch_sha256",
            "results",
            "manifest_sha256",
        },
        f"preexisting {phase} result keys drifted",
    )
    _require(
        result["manifest_sha256"] == _self_hash(result),
        f"preexisting {phase} result self-hash drifted",
    )
    launch_raw = _read_private_file(
        launch_path, maximum=4 << 20, label=f"preexisting {phase} launch manifest"
    )
    launch = _strict_json(launch_raw, f"preexisting {phase} launch manifest")
    expected_launch = {
        "schema": LAUNCH_SCHEMA,
        "phase": phase,
        "campaign_sha256": checked["campaign_sha256"],
        "run_manifest_sha256": checked["run_manifest_sha256"],
        "selected_cell_ids": [cell["portfolio_cell_id"] for cell in selected],
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "maximum_active_jobs": 1 if phase == "canary" else MAX_ACTIVE_JOBS,
        "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        "canary_acceptance_sha256": checked.get("canary_acceptance_sha256"),
    }
    _validate_live_identity_attestation(launch.get("live_identity"))
    _require(
        result.get("schema") == RESULT_SCHEMA
        and result.get("phase") == phase
        and result.get("campaign_sha256") == checked["campaign_sha256"]
        and result.get("run_manifest_sha256") == checked["run_manifest_sha256"]
        and result.get("launch_sha256") == sha256_bytes(launch_raw)
        and set(launch) == set(expected_launch) | {"live_identity", "manifest_sha256"}
        and launch.get("manifest_sha256") == _self_hash(launch)
        and all(launch.get(key) == value for key, value in expected_launch.items()),
        f"preexisting {phase} launch/result binding drifted",
    )
    states = [(cell, classify_cell_state(root, run_root, cell)) for cell in selected]
    _require(
        all(state.kind == "TERMINAL" for _, state in states),
        f"preexisting {phase} result exists before complete terminal custody",
    )
    expected_results = sorted(
        [
            _public_result(state.result)
            for _, state in states
            if state.result is not None
        ],
        key=lambda item: item["portfolio_cell_id"],
    )
    _require(
        result.get("results") == expected_results,
        f"preexisting {phase} result terminal custody drifted",
    )
    return result


def _execute_phase(
    *,
    phase: str,
    root: Path,
    run_root: Path,
    base_url: str,
    capacity_root: Path = GLOBAL_CAPACITY_ROOT,
) -> dict[str, Any]:
    _require_production_pins()
    _require(phase in {"canary", "rest"}, "unknown gated launch phase")
    checked = static_check(root=root, run_root=run_root)
    checked_cells = checked["cells"]
    selected = [
        cell
        for cell in checked_cells
        if (cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID)
        is (phase == "canary")
    ]
    _require(
        (phase == "canary" and len(selected) == 1)
        or (phase == "rest" and len(selected) == CELL_COUNT - 1),
        "phase selection is not the exact governed canary/rest membership",
    )
    if phase == "rest":
        acceptance = _validate_acceptance(root, run_root, checked)
        acceptance_sha256 = sha256_bytes(canonical_json_bytes(acceptance))
        checked["canary_acceptance_validated"] = True
        checked["canary_acceptance_sha256"] = acceptance_sha256
    launch_intent = {
        "schema": LAUNCH_SCHEMA,
        "phase": phase,
        "campaign_sha256": checked["campaign_sha256"],
        "run_manifest_sha256": checked["run_manifest_sha256"],
        "selected_cell_ids": [cell["portfolio_cell_id"] for cell in selected],
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "maximum_active_jobs": 1 if phase == "canary" else MAX_ACTIVE_JOBS,
        "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        "canary_acceptance_sha256": checked.get("canary_acceptance_sha256"),
    }
    intent_bytes = canonical_json_bytes(launch_intent)
    _, launch_path, result_path = _phase_paths(run_root, phase)
    lock_fd = _phase_lock(run_root, phase, intent_bytes)
    try:
        _authenticate_selected(root, selected)
        existing = _validated_existing_phase_result(
            phase=phase,
            checked=checked,
            selected=selected,
            root=root,
            run_root=run_root,
        )
        if existing is not None:
            return existing
        live_identity = _validate_live_identity_attestation(
            _live_daemon_attestation(base_url)
        )
        states = [
            (cell, classify_cell_state(root, run_root, cell)) for cell in selected
        ]
        launch_payload = {**launch_intent, "live_identity": live_identity}
        launch = {
            **launch_payload,
            "manifest_sha256": _self_hash(launch_payload),
        }
        launch_bytes = canonical_json_bytes(launch)
        _write_once_or_validate(launch_path, launch_bytes, f"{phase} launch manifest")
        terminal = [
            _public_result(state.result)
            for _, state in states
            if state.kind == "TERMINAL" and state.result is not None
        ]
        jobs = [
            (state.kind, cell) for cell, state in states if state.kind != "TERMINAL"
        ]
        new_results = [
            _public_result(result)
            for result in _bounded_run(
                jobs,
                root=root,
                run_root=run_root,
                base_url=base_url,
                max_active=1 if phase == "canary" else MAX_ACTIVE_JOBS,
                capacity_root=capacity_root,
            )
        ]
        results = sorted(
            terminal + new_results,
            key=lambda item: item["portfolio_cell_id"],
        )
        _require(
            len(results) == len(selected),
            "gated phase did not terminalize every selected cell",
        )
        for cell, result in zip(
            sorted(selected, key=lambda item: item["portfolio_cell_id"]),
            results,
            strict=True,
        ):
            _require(
                result["portfolio_cell_id"] == cell["portfolio_cell_id"],
                "terminal result coverage drifted",
            )
            _require(
                result["outcome"] in {STRUCTURAL_SAT, CERTIFIED_UNSAT},
                "terminal cell did not produce accepted SAT/UNSAT custody",
            )
        result_payload = {
            "schema": RESULT_SCHEMA,
            "phase": phase,
            "campaign_sha256": checked["campaign_sha256"],
            "run_manifest_sha256": checked["run_manifest_sha256"],
            "launch_sha256": sha256_bytes(launch_bytes),
            "results": results,
        }
        payload = {
            **result_payload,
            "manifest_sha256": _self_hash(result_payload),
        }
        result_bytes = canonical_json_bytes(payload)
        _write_once_or_validate(result_path, result_bytes, f"{phase} result")
        return payload
    finally:
        fcntl.flock(lock_fd, fcntl.LOCK_UN)
        os.close(lock_fd)


def start_canary(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _execute_phase(
        phase="canary",
        root=root,
        run_root=run_root,
        base_url=base_url,
    )


def start_rest(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _execute_phase(
        phase="rest",
        root=root,
        run_root=run_root,
        base_url=base_url,
    )


def start(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    del base_url, root, run_root
    raise PortfolioRunnerError(
        "ungated launch is disabled; use start-canary then start-rest"
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the gated 76-cell survivor-refinement SAT portfolio"
    )
    parser.add_argument(
        "command",
        choices=(
            "derive-identities",
            "prepare",
            "static-check",
            "start-canary",
            "start-rest",
        ),
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--source-campaign-sha256")
    parser.add_argument("--source-campaign-bytes", type=int)
    parser.add_argument("--source-run-manifest-sha256")
    parser.add_argument("--source-run-manifest-bytes", type=int)
    parser.add_argument("--source-preparer-commit")
    args = parser.parse_args(argv)
    try:
        if args.command == "derive-identities":
            result = derive_identities(
                source_campaign_sha256=args.source_campaign_sha256,
                source_campaign_bytes=args.source_campaign_bytes,
                source_run_manifest_sha256=args.source_run_manifest_sha256,
                source_run_manifest_bytes=args.source_run_manifest_bytes,
                source_preparer_commit=args.source_preparer_commit,
                root=ROOT,
            )
        elif args.command == "prepare":
            result = prepare_portfolio()
        elif args.command == "static-check":
            result = static_check()
        elif args.command == "start-canary":
            result = start_canary(base_url=args.base_url)
        else:
            result = start_rest(base_url=args.base_url)
    except (
        OSError,
        PortfolioRunnerError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(f"survivor-refinement SAT portfolio rejected: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
