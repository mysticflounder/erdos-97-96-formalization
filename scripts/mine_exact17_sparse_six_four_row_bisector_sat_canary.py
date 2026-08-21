# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.
"""Authenticate and mine the exact17 SAT-profile canary offline.

This adapter consumes only the already sealed portfolio artifacts.  It never
contacts PIQD, starts a solver, or writes to the live portfolio root.
"""

from __future__ import annotations

import hashlib
import io
import json
import os
import sys
from collections import Counter
from datetime import UTC, datetime
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank
from census.p97_search import phase3_piqd_driver as driver
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from scripts import prepare_exact17_sparse_six_four_row_bisector_sat_portfolio as prep
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    path_hits,
    project_record_for_lean,
    reflected,
)

LANE_ID = "exact17-sparse-six-four-row-bisector-sat-canary-mine-20260820"
RUN_ID = "canary-v1"
BASE_HEAD = "69f824502e2f92d1cb6185f041c2fe327c54575f"
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
CHECKPOINT = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
CHECKPOINT_SHA256 = "ad57ef6b312695d2c774f87159f282a0c0337b8c48a7e72a046474fd89f96426"
PORTFOLIO_ROOT = prep.OUTPUT_ROOT
PORTFOLIO_RUN_MANIFEST = PORTFOLIO_ROOT / "run_manifest.json"
PORTFOLIO_CAMPAIGN = PORTFOLIO_ROOT / "artifacts/campaign-manifest.json"
CANARY_LAUNCH = PORTFOLIO_ROOT / "artifacts/canary-launch-manifest.json"
CANARY_RESULT = PORTFOLIO_ROOT / "artifacts/canary-result.json"
CELL_ID = "four-row-bisector-next-center-02-physical-none-sat-profile-v1"
CANARY_JOURNAL = PORTFOLIO_ROOT / f"events/{CELL_ID}.jsonl"
CANARY_SEAL = CANARY_JOURNAL.with_name(f"{CANARY_JOURNAL.name}.seal.json")
CANARY_ARTIFACTS = CANARY_JOURNAL.with_name(f"{CANARY_JOURNAL.name}.artifacts")
SOURCE_CNF = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-20260820/"
    "physical-slice-cell-campaign-v1/artifacts/cells/"
    "four-row-bisector-next-center-02-physical-none/"
    "four-row-bisector-next-center-02-physical-none.cnf"
)
VARIABLE_MAP = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
JOB_ID = "48275627-f0f5-4f13-b50d-f0ca53a6b4ad"
CNF_SHA256 = "227005eefeec723b2b0a04d4f8d75341a64ed3e2f5060c1ee1deef91f9763817"
MODEL_SHA256 = "ccd35afd4fae8d80fb785e2de570c4247b8a503baf0132a72a91e2cf2f42cebc"
SOLVER_LOG_SHA256 = "b06a4f87b6d28b983160fde3118b44ef3ca6321cde1b119bcf58b359465fc164"
WAVE_SHA256 = "e172a9ed7681a968074db4c5168c117b404be44f1528988f3c95d5e28d15c137"
PRODUCER_SHA256 = "787333692186783c2f9960fddb04cac99f2296522f4592a1984fee900c105c9a"
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
JOURNAL_SHA256 = "725dd31964a71e5e2dda4b3949d73a85f1491f05837884891d8492898462e3d1"
SEAL_FILE_SHA256 = "1dbea02f2f2bc1033cf4f59ddb65223d62c3d53f0e8138a7fd95bca9b5ecb41e"
SEAL_SHA256 = "055c46ac25ed2683b9311e3e02954c1ec1e249bcb7bdfaf7aff68dc9c3209d24"
TERMINAL_RECORD_SHA256 = (
    "aa60b6a8506c89d19ba7f872e0c943e7e79daa979c50e31227323c605774b282"
)
CANARY_LAUNCH_SHA256 = (
    "0452590c3ce8190f7d5ad8662bb2a6cd891d7216db0babb3ba0c6286d133a276"
)
CANARY_RESULT_SHA256 = (
    "0c760c47d5e89a73b3a88aac8f0b518b131c346bc38d258b3a15f7d3f060ee12"
)
PORTFOLIO_RUN_SHA256 = (
    "7ccb58e91e8ccc412d0be39dd2373c53c260a1548d11554ab2f240ff38f1a056"
)
PORTFOLIO_CAMPAIGN_SHA256 = (
    "0033261a63aa0260182bad0afdeac4a9873e152744b2c23787ef37281b9e1006"
)
CNF_BYTES = 346_273_647
CNF_CLAUSES = 7_409_263
VARIABLES = 308
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
REVERSE_ORDER = tuple(reversed(ORDER))
MODEL_ARTIFACT = CANARY_ARTIFACTS / MODEL_SHA256
LOG_ARTIFACT = CANARY_ARTIFACTS / SOLVER_LOG_SHA256
MAX_JSON_BYTES = 4 * 1024 * 1024
MAX_CNF_BYTES = 384 * 1024 * 1024
MAX_ARTIFACT_BYTES = 64 * 1024 * 1024
RUN_MANIFEST_KEYS = frozenset(
    {
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
    }
)
CHECKPOINT_KEYS = frozenset(
    {
        "schema",
        "lane_id",
        "owner",
        "base_head",
        "owned_paths",
        "durable_paths",
        "generated_roots",
        "created_utc",
        "manifest_sha256",
    }
)

PRIOR_PATHS = (
    ROOT
    / "scratch/exact17-lean-to-sat/child38-wave-mine/child38-cancellation-bank-ledger.json",
    ROOT / "scratch/exact17-lean-to-sat/child39-wave-mine/child39-analysis.json",
    ROOT / "scratch/exact17-lean-to-sat/child40-wave-mine/child40-analysis.json",
    ROOT / "scratch/exact17-lean-to-sat/child41-wave-mine/child41-analysis.json",
    ROOT / "scratch/exact17-lean-to-sat/child42-wave-mine/child42-analysis.json",
    ROOT / "scratch/exact17-lean-to-sat/child43-wave-mine/child43-analysis.json",
    ROOT / "scratch/exact17-child45-wave-mine/child45-wave-occurrence-ledger.json",
)


class MineError(ValueError):
    """An authenticated canary input or finite mine failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise MineError(message)


def _relative(root: Path, path: Path) -> str:
    root = Path(os.path.abspath(root))
    path = Path(os.path.abspath(path))
    try:
        relative = path.relative_to(root)
    except ValueError as exc:
        raise MineError(f"path escapes repository root: {path}") from exc
    value = PurePosixPath(relative.as_posix())
    if not value.parts or any(part in {"", ".", ".."} for part in value.parts):
        raise MineError(f"unsafe relative path: {value}")
    return value.as_posix()


def _json(raw: bytes, label: str, *, canonical: bool = True) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=lambda pairs: _unique(pairs, label),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise MineError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} is not a JSON object")
    if canonical:
        _require(canonical_json_bytes(value) == raw, f"{label} is not canonical JSON")
    return value


def _unique(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"{label} contains duplicate key {key!r}")
        value[key] = item
    return value


def _capture(
    custody: prep.DescriptorCustody,
    root: Path,
    path: Path,
    maximum: int,
    *,
    retain: bool = True,
) -> prep.Snapshot:
    try:
        return custody.capture(
            _relative(root, path), maximum_bytes=maximum, retain=retain
        )
    except (OSError, prep.PreparationError) as exc:
        raise MineError(f"descriptor-bound read failed: {path}") from exc


def _pinned(
    custody: prep.DescriptorCustody,
    root: Path,
    path: Path,
    digest: str,
    maximum: int,
    *,
    retain: bool = True,
) -> prep.Snapshot:
    snapshot = _capture(custody, root, path, maximum, retain=retain)
    _require(snapshot.sha256 == digest, f"pinned SHA-256 drifted: {path}")
    return snapshot


def validate_checkpoint(value: dict[str, Any], *, root: Path = ROOT) -> None:
    _require(frozenset(value) == CHECKPOINT_KEYS, "lane checkpoint keys drifted")
    _require(
        value.get("schema") == "worktree-lane-checkpoint/v1",
        "lane checkpoint schema drifted",
    )
    _require(value.get("lane_id") == LANE_ID, "lane checkpoint lane drifted")
    _require(
        value.get("owner") == "sat-canary-wave-mine", "lane checkpoint owner drifted"
    )
    _require(value.get("base_head") == BASE_HEAD, "lane checkpoint base_head drifted")
    _require(
        value.get("owned_paths")
        == [
            "scripts/mine_exact17_sparse_six_four_row_bisector_sat_canary.py",
            "scripts/test_mine_exact17_sparse_six_four_row_bisector_sat_canary.py",
        ],
        "lane checkpoint owned paths drifted",
    )
    _require(value.get("durable_paths") == [], "lane checkpoint durable paths drifted")
    _require(
        value.get("generated_roots") == [f"scratch/runs/{LANE_ID}/{RUN_ID}"],
        "lane checkpoint generated root drifted",
    )
    _require(
        value.get("created_utc") == "2026-08-21T04:32:17Z",
        "lane checkpoint creation time drifted",
    )
    unsigned = dict(value)
    _require(
        unsigned.pop("manifest_sha256", None)
        == sha256_bytes(canonical_json_bytes(unsigned)),
        "lane checkpoint self-hash invalid",
    )
    _require(
        _relative(root, CHECKPOINT) == f".codex/worktree-checkpoints/{LANE_ID}.json",
        "lane checkpoint path drifted",
    )


def _validate_checkpoint(custody: prep.DescriptorCustody) -> str:
    snapshot = _pinned(custody, ROOT, CHECKPOINT, CHECKPOINT_SHA256, MAX_JSON_BYTES)
    value = _json(snapshot.content or b"", "lane checkpoint", canonical=False)
    validate_checkpoint(value)
    return snapshot.sha256


def validate_run_manifest(value: dict[str, Any], *, root: Path = ROOT) -> None:
    _require(frozenset(value) == RUN_MANIFEST_KEYS, "run manifest keys drifted")
    _require(
        value.get("schema") == "worktree-run-manifest/v1", "run manifest schema drifted"
    )
    _require(
        value.get("lane_id") == LANE_ID and value.get("run_id") == RUN_ID,
        "run manifest identity drifted",
    )
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require(
        value.get("root") == expected_root
        and _relative(root, root / expected_root) == expected_root,
        "run manifest root drifted",
    )
    _require(
        value.get("owner") == "sat-canary-wave-mine"
        and value.get("base_head") == BASE_HEAD,
        "run manifest custody drifted",
    )
    _require(
        value.get("output_classes") == ["artifacts", "events", "tmp"],
        "run manifest output classes drifted",
    )
    _require(
        isinstance(value.get("created_utc"), str)
        and value["created_utc"].endswith("Z"),
        "run manifest timestamp drifted",
    )
    _require(
        value.get("manifest_sha256")
        == sha256_bytes(
            canonical_json_bytes(
                {key: item for key, item in value.items() if key != "manifest_sha256"}
            )
        ),
        "run manifest self-hash invalid",
    )


def validate_seal_envelope(
    seal: dict[str, Any],
    *,
    journal_sha256: str = JOURNAL_SHA256,
    terminal_sha256: str = TERMINAL_RECORD_SHA256,
    wave_sha256: str = WAVE_SHA256,
    record_count: int = 16,
) -> None:
    _require(
        seal.get("schema") == "p97-cegar-wave-journal-seal/v1",
        "journal seal schema drifted",
    )
    _require(seal.get("seal_sha256") == SEAL_SHA256, "journal seal hash field drifted")
    unsigned = dict(seal)
    _require(
        unsigned.pop("seal_sha256", None)
        == sha256_bytes(canonical_json_bytes(unsigned)),
        "journal seal digest invalid",
    )
    _require(
        seal.get("journal_sha256") == journal_sha256
        and seal.get("record_count") == record_count
        and seal.get("terminal_attempt_sha256") == terminal_sha256
        and seal.get("wave_manifest_sha256") == wave_sha256,
        "journal seal envelope drifted",
    )


def validate_wave_binding(wave: dict[str, Any]) -> None:
    try:
        validate_wave_manifest(wave)
    except Exception as exc:
        raise MineError("wave manifest failed canonical validation") from exc
    _require(wave_manifest_sha256(wave) == WAVE_SHA256, "wave hash drifted")
    encoding = wave["encoding"]
    _require(
        encoding["cnf_sha256"] == CNF_SHA256
        and encoding["producer_manifest_sha256"] == PRODUCER_SHA256,
        "wave/CNF/producer binding drifted",
    )
    _require(
        encoding["num_variables"] == VARIABLES
        and encoding["num_clauses"] == CNF_CLAUSES
        and encoding["variable_map_sha256"] == VARIABLE_MAP_SHA256,
        "wave dimensions drifted",
    )


def _load_prior(
    path: Path, custody: prep.DescriptorCustody
) -> tuple[dict[str, Any], str]:
    snapshot = _capture(custody, ROOT, path, MAX_ARTIFACT_BYTES)
    return _json(snapshot.content or b"", str(path), canonical=False), snapshot.sha256


def _validate_portfolio_source(custody: prep.DescriptorCustody) -> dict[str, Any]:
    run = _pinned(
        custody, ROOT, PORTFOLIO_RUN_MANIFEST, PORTFOLIO_RUN_SHA256, MAX_JSON_BYTES
    )
    run_value = _json(run.content or b"", "portfolio run manifest")
    _require(
        run_value.get("schema") == "worktree-run-manifest/v1",
        "portfolio run schema drifted",
    )
    _require(
        run_value.get("lane_id") == prep.LANE_ID
        and run_value.get("run_id") == prep.RUN_ID,
        "portfolio run identity drifted",
    )
    unsigned = dict(run_value)
    _require(
        unsigned.pop("manifest_sha256", None)
        == sha256_bytes(canonical_json_bytes(unsigned)),
        "portfolio run manifest hash drifted",
    )
    source_digests = run_value.get("source_digests")
    _require(
        type(source_digests) is dict and source_digests,
        "portfolio source digest inventory missing",
    )
    checked: dict[str, str] = {}
    for relative, digest in sorted(source_digests.items()):
        path = ROOT / relative
        snapshot = _pinned(custody, ROOT, path, digest, MAX_ARTIFACT_BYTES)
        checked[relative] = snapshot.sha256
    return {"run_manifest_sha256": run.sha256, "source_digests": checked}


def validate_campaign_inventory(campaign: dict[str, Any], *, root: Path = ROOT) -> None:
    _require(
        campaign.get("schema") == prep.PORTFOLIO_SCHEMA
        and campaign.get("status") == "PREPARED_LOCAL_ONLY",
        "portfolio campaign identity drifted",
    )
    _require(
        campaign.get("cell_count") == prep.CELL_COUNT
        and campaign.get("execution", {}).get("solver_profile") == "sat",
        "portfolio execution drifted",
    )
    cells = campaign.get("cells")
    _require(
        type(cells) is list and len(cells) == prep.CELL_COUNT,
        "portfolio cell inventory drifted",
    )
    seen: set[str] = set()
    for cell in cells:
        _require(isinstance(cell, dict), "portfolio cell is malformed")
        portfolio_cell_id = cell.get("portfolio_cell_id")
        _require(
            isinstance(portfolio_cell_id, str) and portfolio_cell_id not in seen,
            "portfolio cell identity is duplicated or malformed",
        )
        seen.add(portfolio_cell_id)
        identity_hash = cell.get("expected_identity_hash")
        _require(
            isinstance(identity_hash, str) and len(identity_hash) == 64,
            "portfolio cell identity hash is malformed",
        )
        for field in (
            "producer_manifest",
            "wave_manifest",
            "source_cnf",
            "source_producer_manifest",
            "source_wave_manifest",
        ):
            reference = cell.get(field)
            _require(
                isinstance(reference, dict),
                f"portfolio {field} reference is malformed",
            )
            path = reference.get("path")
            _require(isinstance(path, str), f"portfolio {field} path is malformed")
            _relative(root, root / path)
            digest = reference.get("sha256")
            _require(
                isinstance(digest, str)
                and len(digest) == 64
                and isinstance(reference.get("bytes"), int)
                and reference["bytes"] > 0,
                f"portfolio {field} descriptor is malformed",
            )


def _validate_manifests(custody: prep.DescriptorCustody) -> dict[str, Any]:
    campaign_snapshot = _pinned(
        custody, ROOT, PORTFOLIO_CAMPAIGN, PORTFOLIO_CAMPAIGN_SHA256, MAX_JSON_BYTES
    )
    launch_snapshot = _pinned(
        custody, ROOT, CANARY_LAUNCH, CANARY_LAUNCH_SHA256, MAX_JSON_BYTES
    )
    result_snapshot = _pinned(
        custody, ROOT, CANARY_RESULT, CANARY_RESULT_SHA256, MAX_JSON_BYTES
    )
    campaign = _json(campaign_snapshot.content or b"", "portfolio campaign")
    launch = _json(launch_snapshot.content or b"", "canary launch")
    result = _json(result_snapshot.content or b"", "canary result")
    validate_campaign_inventory(campaign)
    cells = campaign["cells"]
    cell = next(
        (
            item
            for item in cells
            if isinstance(item, dict) and item.get("portfolio_cell_id") == CELL_ID
        ),
        None,
    )
    _require(isinstance(cell, dict), "canary cell missing from portfolio")
    producer_ref = cell.get("producer_manifest")
    wave_ref = cell.get("wave_manifest")
    cnf_ref = cell.get("source_cnf")
    _require(
        all(isinstance(item, dict) for item in (producer_ref, wave_ref, cnf_ref)),
        "canary manifest references malformed",
    )
    producer_snapshot = _capture(
        custody, ROOT, ROOT / producer_ref["path"], MAX_JSON_BYTES
    )
    wave_snapshot = _capture(custody, ROOT, ROOT / wave_ref["path"], MAX_JSON_BYTES)
    cnf_snapshot = _pinned(
        custody, ROOT, SOURCE_CNF, CNF_SHA256, MAX_CNF_BYTES, retain=True
    )
    _require(
        producer_snapshot.sha256 == PRODUCER_SHA256
        and producer_snapshot.bytes == producer_ref["bytes"],
        "producer identity drifted",
    )
    _require(
        wave_snapshot.sha256 == WAVE_SHA256
        and wave_snapshot.bytes == wave_ref["bytes"],
        "wave identity drifted",
    )
    _require(
        cnf_snapshot.bytes == CNF_BYTES and cnf_snapshot.bytes == cnf_ref["bytes"],
        "CNF byte identity drifted",
    )
    producer = _json(producer_snapshot.content or b"", "canary producer")
    wave = _json(wave_snapshot.content or b"", "canary wave")
    _require(
        producer.get("schema") == prep.PRODUCER_SCHEMA
        and producer.get("solver_profile") == "sat"
        and producer.get("backend") == "cadical",
        "producer profile drifted",
    )
    _require(producer.get("producer_id") == CELL_ID, "producer id drifted")
    _require(wave.get("schema") == prep.WAVE_SCHEMA, "wave schema drifted")
    validate_wave_binding(wave)
    _require(
        launch.get("schema")
        == "p97-exact17-sparse-six-four-row-bisector-sat-profile-launch/v1"
        and launch.get("status") == "LAUNCH_AUTHENTICATED",
        "launch identity drifted",
    )
    _require(
        launch.get("selected_cell_count") == 1
        and launch.get("portfolio_cell_count") == prep.CELL_COUNT,
        "launch scope drifted",
    )
    launch_cells = launch.get("cells")
    _require(
        isinstance(launch_cells, list)
        and len(launch_cells) == 1
        and launch_cells[0].get("portfolio_cell_id") == CELL_ID,
        "launch canary cell drifted",
    )
    _require(
        launch_cells[0].get("expected_identity_hash")
        == cell.get("expected_identity_hash"),
        "launch identity hash drifted",
    )
    _require(
        result.get("schema")
        == "p97-exact17-sparse-six-four-row-bisector-sat-profile-result/v1"
        and result.get("status") == "COMPLETE",
        "result identity drifted",
    )
    selected = result.get("selected_results")
    _require(
        isinstance(selected, list)
        and len(selected) == 1
        and selected[0].get("portfolio_cell_id") == CELL_ID,
        "result canary scope drifted",
    )
    _require(
        selected[0].get("job_id") == JOB_ID
        and selected[0].get("outcome") == "STRUCTURAL_SAT",
        "result job/outcome drifted",
    )
    variable_map = _pinned(
        custody, ROOT, VARIABLE_MAP, VARIABLE_MAP_SHA256, MAX_JSON_BYTES
    )
    return {
        "campaign": campaign_snapshot.sha256,
        "launch": launch_snapshot.sha256,
        "result": result_snapshot.sha256,
        "producer": producer,
        "wave": wave,
        "cnf": cnf_snapshot,
        "variable_map": variable_map,
        "cell": cell,
    }


def _validate_journal(
    custody: prep.DescriptorCustody, wave: dict[str, Any]
) -> tuple[dict[str, Any], dict[str, Any], dict[str, Any]]:
    journal = _pinned(custody, ROOT, CANARY_JOURNAL, JOURNAL_SHA256, MAX_ARTIFACT_BYTES)
    seal_snapshot = _pinned(
        custody, ROOT, CANARY_SEAL, SEAL_FILE_SHA256, MAX_JSON_BYTES
    )
    lines = (journal.content or b"").splitlines(keepends=True)
    _require(
        len(lines) == 16 and all(line.endswith(b"\n") for line in lines),
        "journal record count or termination drifted",
    )
    records = [
        _json(line[:-1], f"journal record {index}") for index, line in enumerate(lines)
    ]
    seal_bytes = seal_snapshot.content or b""
    _require(seal_bytes.endswith(b"\n"), "journal seal is not newline-terminated")
    seal = _json(seal_bytes[:-1], "journal seal")
    validate_seal_envelope(seal)
    try:
        driver.validate_attempt_journal(
            records,
            manifest=wave,
            expected_record_count=16,
            expected_terminal_sha256=TERMINAL_RECORD_SHA256,
        )
    except Exception as exc:
        raise MineError("journal chain validation failed") from exc
    terminal = records[-1]
    _require(
        terminal.get("record_sha256") == TERMINAL_RECORD_SHA256
        and terminal.get("outcome") == "STRUCTURAL_SAT"
        and terminal.get("attempt_index") == 15
        and terminal.get("solver_profile") == "sat",
        "terminal journal record drifted",
    )
    _require(
        terminal.get("detail") == f"MODEL: checked SAT assignment for job {JOB_ID}",
        "terminal job identity drifted",
    )
    artifacts = terminal.get("artifacts")
    _require(
        isinstance(artifacts, dict)
        and artifacts.get("model_sha256") == MODEL_SHA256
        and artifacts.get("solver_log_sha256") == SOLVER_LOG_SHA256
        and artifacts.get("cnf_sha256") == CNF_SHA256,
        "terminal artifact identity drifted",
    )
    referenced = {
        digest
        for record in records
        for digest in record["artifacts"].values()
        if isinstance(digest, str) and digest not in {CNF_SHA256, PRODUCER_SHA256}
    }
    for digest in sorted(referenced):
        artifact = _capture(
            custody, ROOT, CANARY_ARTIFACTS / digest, MAX_ARTIFACT_BYTES
        )
        _require(artifact.sha256 == digest, f"journal artifact hash drifted: {digest}")
    model_snapshot = _pinned(
        custody, ROOT, MODEL_ARTIFACT, MODEL_SHA256, MAX_JSON_BYTES
    )
    log_snapshot = _pinned(
        custody, ROOT, LOG_ARTIFACT, SOLVER_LOG_SHA256, MAX_ARTIFACT_BYTES
    )
    model = _json(model_snapshot.content or b"", "SAT model", canonical=False)
    _require(
        model.get("job_id") == JOB_ID
        and model.get("result") == "SAT"
        and model.get("backend") == "cadical"
        and model.get("solver_profile") == "sat",
        "SAT model identity drifted",
    )
    return (
        model,
        {"journal": journal.sha256, "seal_file": seal_snapshot.sha256, "seal": seal},
        {
            "model": model_snapshot.sha256,
            "model_bytes": model_snapshot.bytes,
            "solver_log": log_snapshot.sha256,
            "solver_log_bytes": log_snapshot.bytes,
        },
    )


def decode_model(model: dict[str, Any]) -> tuple[dict[int, bool], dict[str, Any]]:
    literals = model.get("assignment")
    _require(
        type(literals) is list
        and len(literals) == VARIABLES
        and model.get("num_assigned") == VARIABLES,
        "SAT assignment is incomplete",
    )
    values: dict[int, bool] = {}
    for literal in literals:
        _require(
            type(literal) is int and literal != 0 and abs(literal) <= VARIABLES,
            "SAT assignment literal is malformed",
        )
        _require(
            abs(literal) not in values, "SAT assignment contains duplicate variables"
        )
        values[abs(literal)] = literal > 0
    _require(set(values) == set(range(1, VARIABLES + 1)), "SAT assignment is not total")
    rows = {
        str(center): [point for point in range(17) if values[1 + 17 * center + point]]
        for center in range(17)
    }
    _require(
        all(
            len(support) == 4 and center not in support
            for center, support in ((int(c), s) for c, s in rows.items())
        ),
        "decoded rows are not exact-four off-center rows",
    )
    next_centers = [center for center in range(17) if values[290 + center]]
    named_orders = [order for order in range(2) if values[307 + order]]
    _require(
        next_centers == [2] and named_orders == [0], "decoded selector identity drifted"
    )
    return values, {
        "rows": rows,
        "next_centers": next_centers,
        "named_orders": named_orders,
        "selected_order": list(ORDER),
        "assignment_sha256": sha256_bytes(" ".join(map(str, literals)).encode()),
    }


def replay_dimacs(cnf: bytes, values: dict[int, bool]) -> dict[str, Any]:
    digest = hashlib.sha256(cnf)
    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    for line_number, raw in enumerate(io.BytesIO(cnf), 1):
        fields = raw.decode("ascii").strip().split()
        if not fields or fields[0] == "c":
            continue
        if fields[0] == "p":
            _require(
                header is None and fields[:2] == ["p", "cnf"] and len(fields) == 4,
                f"invalid DIMACS header at line {line_number}",
            )
            header = (int(fields[2]), int(fields[3]))
            continue
        _require(header is not None, "DIMACS clause precedes header")
        for token in fields:
            literal = int(token)
            if literal:
                _require(abs(literal) <= VARIABLES, "DIMACS literal out of range")
                pending.append(literal)
            else:
                checked += 1
                _require(
                    pending
                    and any(values[abs(item)] == (item > 0) for item in pending),
                    f"assignment falsifies DIMACS clause {checked}",
                )
                pending.clear()
    _require(
        not pending
        and header == (VARIABLES, CNF_CLAUSES)
        and checked == CNF_CLAUSES
        and digest.hexdigest() == CNF_SHA256,
        "DIMACS replay identity failed",
    )
    return {
        "variables": VARIABLES,
        "clauses_checked": checked,
        "sha256": CNF_SHA256,
        "satisfies_all": True,
    }


def _support(candidate: dict[str, Any]) -> frozenset[tuple[int, int]]:
    return frozenset((int(a), int(b)) for a, b in candidate["support"])


def build_prior_bank(
    custody: prep.DescriptorCustody,
) -> tuple[set[frozenset[tuple[int, int]]], dict[str, str]]:
    bank: set[frozenset[tuple[int, int]]] = set()
    hashes: dict[str, str] = {}
    for path in PRIOR_PATHS:
        payload, digest = _load_prior(path, custody)
        relative = _relative(ROOT, path)
        hashes[relative] = digest
        if "ledger" in path.name:
            entries = payload.get("entries") or payload.get("full_certificate_records")
            _require(isinstance(entries, list), f"prior ledger malformed: {path}")
            for entry in entries:
                if "hits" in entry:
                    bank.add(frozenset(tuple(hit) for hit in entry["hits"]))
                if "reflected_hits" in entry:
                    bank.add(frozenset(tuple(hit) for hit in entry["reflected_hits"]))
                occurrence = entry.get("occurrence")
                if isinstance(occurrence, dict) and "hits" in occurrence:
                    hits = frozenset(tuple(hit) for hit in occurrence["hits"])
                    bank.add(hits)
                    bank.add(reflected(hits))
        else:
            _require(
                payload.get("status") == "PASS", f"prior analysis is not PASS: {path}"
            )
            for occurrence in payload.get("two_kalmanson_occurrences", []):
                for candidate in occurrence.get("candidates", []):
                    hits = _support(candidate)
                    bank.add(hits)
                    bank.add(reflected(hits))
    return bank, hashes


def classify_support(
    hits: frozenset[tuple[int, int]], bank: set[frozenset[tuple[int, int]]]
) -> str:
    if hits in bank:
        return "exact-parent-bank-support"
    if any(parent < hits for parent in bank):
        return "strictly-subsumed-by-parent-bank"
    return "new-occurrence-existing-family"


def mine_rows(
    values: dict[int, bool], bank: set[frozenset[tuple[int, int]]]
) -> tuple[dict[str, Any], dict[str, Any]]:
    rows = tuple(
        producer_bank.MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    forward = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, 17, ORDER, max_cores=100_000
    )
    reverse = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, 17, REVERSE_ORDER, max_cores=100_000
    )
    forward_by_support = {path_hits(record): record for record in forward}
    reverse_by_support = {path_hits(record): record for record in reverse}
    minimal = sorted(
        (
            hits
            for hits in forward_by_support
            if not any(other < hits for other in forward_by_support)
        ),
        key=lambda item: (len(item), sorted(item)),
    )
    entries: list[dict[str, Any]] = []
    unpaired_forward = 0
    for hits in minimal:
        reverse_hits = reflected(hits)
        if reverse_hits not in reverse_by_support:
            unpaired_forward += 1
            continue
        forward_record = project_record_for_lean(
            forward_by_support[hits], hits, ORDER, rows
        )
        reverse_record = project_record_for_lean(
            reverse_by_support[reverse_hits], reverse_hits, REVERSE_ORDER, rows
        )
        _require(
            lean_occurrence_check(
                hits,
                forward_record,
                reverse_record,
                rows=rows,
                forward_order=ORDER,
                reverse_order=REVERSE_ORDER,
            ),
            "source-valid occurrence replay failed",
        )
        relation = classify_support(hits, bank)
        entries.append(
            {
                "support": [list(hit) for hit in sorted(hits)],
                "support_size": len(hits),
                "bank_relation": relation,
                "source_valid": True,
                "source_validation": {
                    "paired_forward_reverse_replay": True,
                    "lean_occurrence_check": True,
                },
                "immediate_lean_consumer": "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check",
                "forward_source_record_sha256": sha256_bytes(
                    canonical_json_bytes(forward_record)
                ),
                "reverse_source_record_sha256": sha256_bytes(
                    canonical_json_bytes(reverse_record)
                ),
            }
        )
    formalized_count = len(producer_bank.scan_all_formalized_cores(rows, 17, ORDER))
    return {
        "forward_producer_record_count": len(forward),
        "reverse_producer_record_count": len(reverse),
        "forward_distinct_support_count": len(forward_by_support),
        "reverse_distinct_support_count": len(reverse_by_support),
        "subset_minimal_count": len(entries),
        "unpaired_forward_subset_minimal_count": unpaired_forward,
        "subset_minimal_size_counts": dict(
            sorted(Counter(item["support_size"] for item in entries).items())
        ),
        "bank_exact_count": sum(
            item["bank_relation"] == "exact-parent-bank-support" for item in entries
        ),
        "bank_strict_subsumed_count": sum(
            item["bank_relation"] == "strictly-subsumed-by-parent-bank"
            for item in entries
        ),
        "new_occurrence_count": sum(
            item["bank_relation"] == "new-occurrence-existing-family"
            for item in entries
        ),
        "formalized_diagnostic_count": formalized_count,
    }, {
        "schema": "p97-exact17-sat-canary-source-valid-occurrence-ledger/v1",
        "status": "PASS",
        "entries": entries,
    }


def _write_once(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    fd = os.open(path, flags, 0o600)
    try:
        os.write(fd, payload)
        os.fsync(fd)
    finally:
        os.close(fd)


def mine(
    *,
    root: Path = ROOT,
    portfolio_root: Path = PORTFOLIO_ROOT,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    root = Path(os.path.abspath(root))
    portfolio_root = Path(os.path.abspath(portfolio_root))
    output_root = Path(os.path.abspath(output_root))
    _require(
        not output_root.exists() and not output_root.is_symlink(),
        "mine output root already exists",
    )
    with prep.DescriptorCustody(root) as custody:
        checkpoint_sha256 = _validate_checkpoint(custody)
        portfolio_source = _validate_portfolio_source(custody)
        manifests = _validate_manifests(custody)
        model, journal_meta, artifact_meta = _validate_journal(
            custody, manifests["wave"]
        )
        values, decoded = decode_model(model)
        replay = replay_dimacs(manifests["cnf"].content or b"", values)
        bank, prior_hashes = build_prior_bank(custody)
    scan_summary, ledger = mine_rows(values, bank)
    ledger_payload = canonical_json_bytes(ledger)
    analysis = {
        "schema": "p97-exact17-sparse-six-four-row-bisector-sat-canary-analysis/v1",
        "status": "PASS",
        "scope": "only authenticated SAT-profile canary; no PIQD, solver, or Lean launch",
        "provenance": {
            "job_id": JOB_ID,
            "portfolio_run_manifest_sha256": portfolio_source["run_manifest_sha256"],
            "portfolio_campaign_sha256": manifests["campaign"],
            "canary_launch_sha256": manifests["launch"],
            "canary_result_sha256": manifests["result"],
            "journal_sha256": journal_meta["journal"],
            "journal_seal_file_sha256": journal_meta["seal_file"],
            "journal_seal_sha256": journal_meta["seal"]["seal_sha256"],
            "terminal_record_sha256": TERMINAL_RECORD_SHA256,
            "wave_manifest_sha256": WAVE_SHA256,
            "producer_manifest_sha256": PRODUCER_SHA256,
            "cnf_sha256": CNF_SHA256,
            "model_sha256": MODEL_SHA256,
            "solver_log_sha256": SOLVER_LOG_SHA256,
            "variable_map_sha256": VARIABLE_MAP_SHA256,
        },
        "authentication": {
            "journal_record_count": 16,
            "terminal_outcome": "STRUCTURAL_SAT",
            "model_artifact_bytes": artifact_meta["model_bytes"],
            "model_sha256": artifact_meta["model"],
            "solver_log_sha256": artifact_meta["solver_log"],
        },
        "independent_replay": replay,
        "decoded_model": decoded,
        "prior_bank": {
            "support_count_with_orientations": len(bank),
            "source_sha256": prior_hashes,
        },
        "source_valid_scan": scan_summary,
        "candidate_ledger_sha256": sha256_bytes(ledger_payload),
        "conclusion": {
            "new_source_valid_occurrence_count": scan_summary["new_occurrence_count"],
            "new_general_source_valid_theorem": False,
            "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only",
            "exact17_closure": False,
        },
    }
    authenticated_hashes = {
        _relative(root, CHECKPOINT): checkpoint_sha256,
        _relative(root, PORTFOLIO_RUN_MANIFEST): portfolio_source[
            "run_manifest_sha256"
        ],
        _relative(root, PORTFOLIO_CAMPAIGN): manifests["campaign"],
        _relative(root, CANARY_LAUNCH): manifests["launch"],
        _relative(root, CANARY_RESULT): manifests["result"],
        _relative(root, CANARY_JOURNAL): journal_meta["journal"],
        _relative(root, CANARY_SEAL): journal_meta["seal_file"],
        _relative(
            root, ROOT / manifests["cell"]["producer_manifest"]["path"]
        ): PRODUCER_SHA256,
        _relative(root, ROOT / manifests["cell"]["wave_manifest"]["path"]): WAVE_SHA256,
        _relative(root, SOURCE_CNF): CNF_SHA256,
        _relative(root, VARIABLE_MAP): VARIABLE_MAP_SHA256,
        _relative(root, MODEL_ARTIFACT): artifact_meta["model"],
        _relative(root, LOG_ARTIFACT): artifact_meta["solver_log"],
    }
    created_utc = (
        datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
    )
    run_manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "owner": "sat-canary-wave-mine",
        "run_id": RUN_ID,
        "root": _relative(root, output_root),
        "base_head": BASE_HEAD,
        "created_utc": created_utc,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {
            **portfolio_source["source_digests"],
            **authenticated_hashes,
            "scripts/mine_exact17_sparse_six_four_row_bisector_sat_canary.py": sha256_bytes(
                Path(__file__).read_bytes()
            ),
            "scripts/test_mine_exact17_sparse_six_four_row_bisector_sat_canary.py": sha256_bytes(
                (
                    ROOT
                    / "scripts/test_mine_exact17_sparse_six_four_row_bisector_sat_canary.py"
                ).read_bytes()
            ),
        },
        "input_digests": {
            _relative(root, output_root / "artifacts/analysis.json"): sha256_bytes(
                canonical_json_bytes(analysis)
            ),
            _relative(
                root, output_root / "artifacts/candidate-occurrence-ledger.json"
            ): sha256_bytes(ledger_payload),
        },
    }
    run_manifest["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run_manifest))
    validate_run_manifest(run_manifest)
    output_root.mkdir(parents=True)
    (output_root / "artifacts").mkdir()
    (output_root / "events").mkdir()
    (output_root / "tmp").mkdir()
    _write_once(
        output_root / "artifacts/candidate-occurrence-ledger.json", ledger_payload
    )
    _write_once(output_root / "artifacts/analysis.json", canonical_json_bytes(analysis))
    _write_once(output_root / "run_manifest.json", canonical_json_bytes(run_manifest))
    return {
        "status": "PASS",
        "analysis": _relative(root, output_root / "artifacts/analysis.json"),
        "candidate_ledger": _relative(
            root, output_root / "artifacts/candidate-occurrence-ledger.json"
        ),
        "run_manifest": _relative(root, output_root / "run_manifest.json"),
        "clauses_checked": replay["clauses_checked"],
        "new_occurrences": scan_summary["new_occurrence_count"],
        "new_size_counts": scan_summary["subset_minimal_size_counts"],
        "run_manifest_sha256": run_manifest["manifest_sha256"],
    }


def main() -> int:
    try:
        print(json.dumps(mine(), sort_keys=True))
    except (OSError, MineError, prep.PreparationError) as exc:
        print(f"SAT canary mine rejected: {exc}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
