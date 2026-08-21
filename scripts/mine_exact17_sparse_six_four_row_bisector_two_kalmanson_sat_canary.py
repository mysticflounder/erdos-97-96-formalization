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
import types
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
from scripts import (
    prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio as prep,
)
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    path_hits,
    project_record_for_lean,
    reflected,
)

LANE_ID = "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-canary-mine-20260820"
RUN_ID = "canary-v1"
BASE_HEAD = "1c79b49594e0b1f10bf4bfeb7efb2104feeedd23"
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
CHECKPOINT = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
CHECKPOINT_SHA256 = "ad725439ee997699eee2a2cac2a79dc07625ea50fbbd952f6126732e8d260fa8"
PORTFOLIO_ROOT = prep.OUTPUT_ROOT
PORTFOLIO_RUN_MANIFEST = PORTFOLIO_ROOT / "run_manifest.json"
PORTFOLIO_CAMPAIGN = PORTFOLIO_ROOT / "artifacts/campaign-manifest.json"
CANARY_LAUNCH = PORTFOLIO_ROOT / "artifacts/canary-launch-manifest.json"
CANARY_RESULT = PORTFOLIO_ROOT / "artifacts/canary-result.json"
CELL_ID = "four-row-bisector-two-kalmanson-next-center-02-physical-none-sat-profile-v1"
CANARY_JOURNAL = PORTFOLIO_ROOT / f"events/{CELL_ID}.jsonl"
CANARY_SEAL = CANARY_JOURNAL.with_name(f"{CANARY_JOURNAL.name}.seal.json")
CANARY_ARTIFACTS = CANARY_JOURNAL.with_name(f"{CANARY_JOURNAL.name}.artifacts")
SOURCE_CNF = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-two-kalmanson-preparer-20260820/"
    "physical-slice-cell-campaign-v1/artifacts/cells/"
    "four-row-bisector-two-kalmanson-next-center-02-physical-none/"
    "four-row-bisector-two-kalmanson-next-center-02-physical-none.cnf"
)
VARIABLE_MAP = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
JOB_ID = "96551f95-c0b1-4598-8ecc-08a6f9c0b2ba"
CNF_SHA256 = "c75746b3d32d7c61727b84fc9cecd1aef51b1e84b3a4bdfedf2668d038b4b6cc"
MODEL_SHA256 = "efda63bf70ede84d762008e5345e4cf56a46dc7abcce004022d1e2af41764387"
SOLVER_LOG_SHA256 = "2232b7ec2a0d55e61a31c211b36c155f167a42f9ac9c3ce7a4fb8caea23cc603"
WAVE_SHA256 = "fc1e55566924a4ab3b0129c03f89b86219b71e167b068c7672311d9da3d56c91"
PRODUCER_SHA256 = "2add24bf43404618aa74509689f0839a96b9a1fb379792811048031dd417ec11"
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
JOURNAL_SHA256 = "11656d1c3f7a7ec1d5f52150a5fe36bc66e368d35782a7aec18a1a2f54f98b5b"
SEAL_FILE_SHA256 = "42baf1fb0eb97241254bf686dbd092d704aea4c7434dbe19b731b4c308e1f2df"
SEAL_SHA256 = "415f70566f1747b962763bf6331e8ea49cb201dad303d5686369ac996981c64b"
TERMINAL_RECORD_SHA256 = (
    "7cb19c3caa1efbc9d9c2acf47e00f45f56cb35cc7844c1f99a2740da62133022"
)
CANARY_LAUNCH_SHA256 = (
    "c5f35b70a15abdbc8039a9411c205853dc249318362937ebd22fd65a940491d9"
)
CANARY_RESULT_SHA256 = (
    "3e3e4192a1a142cd8ba4f3b4e65f581471dbbbb7ccfdb8bdac5871b252c1856f"
)
PORTFOLIO_RUN_SHA256 = (
    "13128c321b0f974d23fdd992efdd128aeecb1b6213b7c02bfa2ed19f6c6ad34d"
)
PORTFOLIO_CAMPAIGN_SHA256 = (
    "6e25c30e86f56cfce3d67c18f8db1b007b147c5be4e474a216fc1dd504dc8df7"
)
CNF_BYTES = 346_273_747
CNF_CLAUSES = 7_409_267
VARIABLES = 308
ORDER_ZERO = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
ORDER_ONE = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
ORDER_TABLES = {0: ORDER_ZERO, 1: ORDER_ONE}
NAMED_ORDER_VARIABLES = {0: 307, 1: 308}
MODEL_ARTIFACT = CANARY_ARTIFACTS / MODEL_SHA256
LOG_ARTIFACT = CANARY_ARTIFACTS / SOLVER_LOG_SHA256
PREDECESSOR_MODEL = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-sat-portfolio-20260820/"
    "sat-profile-portfolio-v1/events/"
    "four-row-bisector-next-center-02-physical-none-sat-profile-v1.jsonl.artifacts/"
    "ccd35afd4fae8d80fb785e2de570c4247b8a503baf0132a72a91e2cf2f42cebc"
)
PREDECESSOR_MODEL_SHA256 = (
    "ccd35afd4fae8d80fb785e2de570c4247b8a503baf0132a72a91e2cf2f42cebc"
)
PREDECESSOR_ANALYSIS = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-sat-canary-mine-20260820/"
    "canary-v1/artifacts/analysis.json"
)
PREDECESSOR_ANALYSIS_SHA256 = (
    "8508552f393796ed1b11615f5d1fe463c85d8f861fd4b7d6d37bbf5fc0c698d9"
)
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

JUST_ADDED_SUPPORT = frozenset({(5, 6), (5, 7), (11, 6), (11, 7)})
JUST_ADDED_ORBIT_CLAUSES = frozenset(
    {
        (-307, -166, -161, -64, -59),
        (-307, -68, -67, -170, -169),
        (-308, -214, -212, -61, -59),
        (-308, -68, -67, -221, -220),
    }
)
MOTIF_SCANNER = (
    ROOT / "scratch/exact17-lean-to-sat/interlacing-cross-wave-2026-08-15/analyze.py"
)
MOTIF_SCANNER_SHA256 = (
    "6d4161c5fcccd0f731707aaac96d9bcdefefe2c94b8a545a183d8581d7c1a828"
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


def _module_from_snapshot(name: str, path: Path, content: bytes) -> types.ModuleType:
    module = types.ModuleType(name)
    module.__file__ = str(path)
    sys.modules[name] = module
    try:
        exec(  # noqa: S102 -- execute only the descriptor-pinned scanner snapshot
            compile(content, str(path), "exec"), module.__dict__
        )
    except Exception:
        sys.modules.pop(name, None)
        raise
    return module


def selected_order_table(values: dict[int, bool]) -> tuple[int, tuple[int, ...]]:
    selected = [
        order for order, variable in NAMED_ORDER_VARIABLES.items() if values[variable]
    ]
    _require(selected == [0] or selected == [1], "named-order selector is not one-hot")
    order = selected[0]
    table = ORDER_TABLES[order]
    _require(len(table) == 17 and len(set(table)) == 17, "named-order table drifted")
    return order, table


def require_order_matches_selector(
    values: dict[int, bool], order: int, table: tuple[int, ...]
) -> None:
    selected_order, selected_table = selected_order_table(values)
    _require(
        order == selected_order and table == selected_table,
        "mining order does not match authenticated named-order selector",
    )


def validate_checkpoint(value: dict[str, Any], *, root: Path = ROOT) -> None:
    _require(frozenset(value) == CHECKPOINT_KEYS, "lane checkpoint keys drifted")
    _require(
        value.get("schema") == "worktree-lane-checkpoint/v1",
        "lane checkpoint schema drifted",
    )
    _require(value.get("lane_id") == LANE_ID, "lane checkpoint lane drifted")
    _require(
        value.get("owner") == "exact17-two-kalmanson-sat-canary-mine",
        "lane checkpoint owner drifted",
    )
    _require(value.get("base_head") == BASE_HEAD, "lane checkpoint base_head drifted")
    _require(
        value.get("owned_paths")
        == [
            "scripts/mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py",
            "scripts/test_mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py",
        ],
        "lane checkpoint owned paths drifted",
    )
    _require(value.get("durable_paths") == [], "lane checkpoint durable paths drifted")
    _require(
        value.get("generated_roots") == [f"scratch/runs/{LANE_ID}/{RUN_ID}"],
        "lane checkpoint generated root drifted",
    )
    _require(
        value.get("created_utc") == "2026-08-21T06:51:00Z",
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
        value.get("owner") == "exact17-two-kalmanson-sat-canary-mine"
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
        == "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-launch/v1"
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
        == "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-profile-result/v1"
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
    variable_map_value = _json(variable_map.content or b"", "variable map")
    named_order_entries = {
        int(entry["id"]): entry.get("name")
        for entry in variable_map_value.get("entries", [])
        if isinstance(entry, dict) and entry.get("id") in {307, 308}
    }
    _require(
        named_order_entries == {307: "namedOrder:order=0", 308: "namedOrder:order=1"},
        "named-order variable map drifted",
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
    selected_order, selected_table = selected_order_table(values)
    named_orders = [selected_order]
    _require(
        next_centers == [2] and named_orders == [0], "decoded selector identity drifted"
    )
    return values, {
        "rows": rows,
        "next_centers": next_centers,
        "named_orders": named_orders,
        "selected_order_index": selected_order,
        "selected_order": list(selected_table),
        "assignment_sha256": sha256_bytes(" ".join(map(str, literals)).encode()),
    }


def replay_dimacs(cnf: bytes, values: dict[int, bool]) -> dict[str, Any]:
    digest = hashlib.sha256(cnf)
    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    just_added_clauses: Counter[tuple[int, ...]] = Counter()
    just_added_evaluations: list[dict[str, Any]] = []
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
                clause = tuple(pending)
                if clause in JUST_ADDED_ORBIT_CLAUSES:
                    just_added_clauses[clause] += 1
                    true_literals = [
                        item for item in clause if values[abs(item)] == (item > 0)
                    ]
                    guard_literal = clause[0]
                    _require(
                        guard_literal in {-307, -308},
                        "just-added clause guard drifted",
                    )
                    just_added_evaluations.append(
                        {
                            "clause": list(clause),
                            "guard_literal": guard_literal,
                            "guard_satisfies_clause": guard_literal in true_literals,
                            "true_literals": true_literals,
                        }
                    )
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
    _require(
        set(just_added_clauses) == JUST_ADDED_ORBIT_CLAUSES
        and set(just_added_clauses.values()) == {2},
        "two-Kalmanson orbit clause multiplicity drifted",
    )
    _require(
        sum(item["guard_satisfies_clause"] for item in just_added_evaluations) == 4
        and all(item["true_literals"] for item in just_added_evaluations),
        "just-added clause guard evaluation drifted",
    )
    return {
        "variables": VARIABLES,
        "clauses_checked": checked,
        "sha256": CNF_SHA256,
        "satisfies_all": True,
        "just_added_two_kalmanson_unique_orbit_clause_count": len(just_added_clauses),
        "just_added_two_kalmanson_orbit_clause_record_count": sum(
            just_added_clauses.values()
        ),
        "just_added_two_kalmanson_orbit_clause_multiplicities": sorted(
            just_added_clauses.values()
        ),
        "just_added_two_kalmanson_orbit_present": True,
        "just_added_two_kalmanson_clause_evaluations": just_added_evaluations,
    }


def audit_predecessor_selector(
    model: bytes, prior_analysis_bytes: bytes
) -> dict[str, Any]:
    _, decoded = decode_model(_json(model, "predecessor model", canonical=False))
    prior_analysis = _json(
        prior_analysis_bytes, "predecessor analysis", canonical=False
    )
    decoded_selector = decoded["selected_order_index"]
    decoded_table = tuple(decoded["selected_order"])
    prior_reported_selector = prior_analysis["decoded_model"]["named_orders"]
    prior_hardcoded_table = tuple(prior_analysis["decoded_model"]["selected_order"])
    _require(
        decoded_selector == 0
        and decoded_table == ORDER_ZERO
        and prior_reported_selector == [0]
        and prior_hardcoded_table == ORDER_ONE
        and prior_hardcoded_table != decoded_table,
        "predecessor selector audit no longer exposes the pinned order mismatch",
    )
    return {
        "model_sha256": PREDECESSOR_MODEL_SHA256,
        "prior_analysis_sha256": PREDECESSOR_ANALYSIS_SHA256,
        "decoded_selector": decoded_selector,
        "decoded_selector_table": list(decoded_table),
        "prior_reported_selector": prior_reported_selector,
        "prior_hardcoded_mining_table": list(prior_hardcoded_table),
        "hardcoded_table_matched_model_selector": False,
        "prior_model_specific_mine_valid": False,
        "reason": "the committed mine used NamedOrder=1 while its authenticated model selected NamedOrder=0",
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


def occurrence_orbit_clauses(
    hits: frozenset[tuple[int, int]],
) -> frozenset[frozenset[int]]:
    clauses: set[frozenset[int]] = set()
    for order_index, order in ORDER_TABLES.items():
        for reverse_direction in (False, True):
            literals = {-(307 + order_index)}
            for center, point in hits:
                position_center = 16 - center if reverse_direction else center
                position_point = 16 - point if reverse_direction else point
                actual_center = order[position_center]
                actual_point = order[position_point]
                literals.add(-(1 + 17 * actual_center + actual_point))
            clauses.add(frozenset(literals))
    _require(len(clauses) == 4, "occurrence orbit clause family collapsed")
    return frozenset(clauses)


def semantic_orbit_clause_multiplicities(
    cnf: bytes, hits: frozenset[tuple[int, int]]
) -> list[int]:
    targets = occurrence_orbit_clauses(hits)
    counts: Counter[frozenset[int]] = Counter()
    header_seen = False
    pending: list[int] = []
    for raw in io.BytesIO(cnf):
        fields = raw.decode("ascii").strip().split()
        if not fields or fields[0] == "c":
            continue
        if fields[0] == "p":
            header_seen = True
            continue
        _require(header_seen, "DIMACS clause precedes header in semantic scan")
        for token in fields:
            literal = int(token)
            if literal:
                pending.append(literal)
            else:
                clause = frozenset(pending)
                if clause in targets:
                    counts[clause] += 1
                pending.clear()
    _require(not pending, "unterminated DIMACS clause in semantic scan")
    return sorted(counts[clause] for clause in targets)


def classify_ledger_against_cnf(cnf: bytes, ledger: dict[str, Any]) -> dict[str, Any]:
    target_to_entries: dict[frozenset[int], list[int]] = {}
    entry_orbits: list[frozenset[frozenset[int]]] = []
    for index, entry in enumerate(ledger["entries"]):
        orbit = occurrence_orbit_clauses(_support(entry))
        entry_orbits.append(orbit)
        for clause in orbit:
            target_to_entries.setdefault(clause, []).append(index)
    counts: Counter[frozenset[int]] = Counter()
    header_seen = False
    pending: list[int] = []
    for raw in io.BytesIO(cnf):
        fields = raw.decode("ascii").strip().split()
        if not fields or fields[0] == "c":
            continue
        if fields[0] == "p":
            header_seen = True
            continue
        _require(header_seen, "DIMACS clause precedes header in bank scan")
        for token in fields:
            literal = int(token)
            if literal:
                pending.append(literal)
            else:
                clause = frozenset(pending)
                if clause in target_to_entries:
                    counts[clause] += 1
                pending.clear()
    _require(not pending, "unterminated DIMACS clause in bank scan")
    exact_count = 0
    for entry, orbit in zip(ledger["entries"], entry_orbits, strict=True):
        multiplicities = sorted(counts[clause] for clause in orbit)
        entry["current_cnf_orbit_clause_multiplicities"] = multiplicities
        entry["present_in_current_cnf_bank"] = all(
            count > 0 for count in multiplicities
        )
        if entry["present_in_current_cnf_bank"]:
            entry["bank_relation"] = "exact-current-cnf-bank-support"
            exact_count += 1
    return {
        "candidate_count": len(entry_orbits),
        "exact_current_cnf_bank_count": exact_count,
        "new_after_current_cnf_bank_count": len(entry_orbits) - exact_count,
    }


def evaluate_occurrence_orbit(
    values: dict[int, bool], hits: frozenset[tuple[int, int]]
) -> list[dict[str, Any]]:
    evaluations: list[dict[str, Any]] = []
    for clause in occurrence_orbit_clauses(hits):
        guard = next(literal for literal in clause if literal in {-307, -308})
        true_literals = sorted(
            literal for literal in clause if values[abs(literal)] == (literal > 0)
        )
        evaluations.append(
            {
                "clause": sorted(clause),
                "guard_literal": guard,
                "guard_satisfies_clause": guard in true_literals,
                "satisfied": bool(true_literals),
                "true_literals": true_literals,
            }
        )
    return sorted(evaluations, key=lambda item: item["clause"])


def mine_rows(
    values: dict[int, bool],
    bank: set[frozenset[tuple[int, int]]],
    order_index: int,
    order: tuple[int, ...],
) -> tuple[dict[str, Any], dict[str, Any]]:
    require_order_matches_selector(values, order_index, order)
    reverse_order = tuple(reversed(order))
    rows = tuple(
        producer_bank.MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    forward = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, 17, order, max_cores=100_000
    )
    reverse = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, 17, reverse_order, max_cores=100_000
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
            forward_by_support[hits], hits, order, rows
        )
        reverse_record = project_record_for_lean(
            reverse_by_support[reverse_hits], reverse_hits, reverse_order, rows
        )
        _require(
            lean_occurrence_check(
                hits,
                forward_record,
                reverse_record,
                rows=rows,
                forward_order=order,
                reverse_order=reverse_order,
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
    formalized_count = len(producer_bank.scan_all_formalized_cores(rows, 17, order))
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


def scan_registered_families(
    values: dict[int, bool],
    motif_scanner_content: bytes,
    order_index: int,
    order: tuple[int, ...],
) -> dict[str, Any]:
    require_order_matches_selector(values, order_index, order)
    reverse_order = tuple(reversed(order))
    rows = tuple(
        producer_bank.MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    formalized = producer_bank.scan_all_formalized_cores(rows, 17, order)
    stage_counts = Counter(str(record.get("stage", "unknown")) for record in formalized)
    motif = _module_from_snapshot(
        "exact17_two_kalmanson_canary_motif_scanner",
        MOTIF_SCANNER,
        motif_scanner_content,
    )
    raw_rows = [tuple(row.support) for row in rows]
    closure = motif.equality_closure(raw_rows)
    rhombi = motif.rhombus_identities(closure)
    point_sums = motif.point_sum_identities(rhombi, order=order)
    direct_forward = motif.direct_six_occurrence_hits(raw_rows, order)
    direct_reverse = motif.direct_six_occurrence_hits(raw_rows, reverse_order)
    interlacing_forward = motif.paper_interlacing_hits(raw_rows, order)
    interlacing_reverse = motif.paper_interlacing_hits(raw_rows, reverse_order)
    return {
        "registered_source_valid_generic_family_count": 2,
        "source_valid_generic_families": {
            "two_kalmanson_cancellation": {
                "paired_forward_reverse_required": True,
                "matcher": "enumerate_two_kalmanson_cancellations + lean_occurrence_check",
            },
            "two_triple_row_six_point": {
                "paired_forward_reverse_required": True,
                "forward_hits": len(direct_forward),
                "reverse_hits": len(direct_reverse),
                "immediate_lean_consumer": "false_of_six_ccw_two_triple_row_equalities",
            },
        },
        "formalized_core_stage_counts": dict(sorted(stage_counts.items())),
        "formalized_diagnostic_count": len(formalized),
        "formalized_diagnostics_source_valid_new": 0,
        "conditional_or_non_source_valid_families": {
            "equality_closure_class_count": closure["class_count"],
            "rhombus_identity_count": len(rhombi),
            "point_sum_candidate_count": point_sums["candidate_count"],
            "point_sum_universal_target_count": len(point_sums["universal_targets"]),
            "interlacing_forward_hits": len(interlacing_forward),
            "interlacing_reverse_hits": len(interlacing_reverse),
        },
        "new_source_valid_generic_family": False,
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
        cnf = manifests["cnf"].content or b""
        replay = replay_dimacs(cnf, values)
        bank, prior_hashes = build_prior_bank(custody)
        motif_scanner = _pinned(
            custody,
            ROOT,
            MOTIF_SCANNER,
            MOTIF_SCANNER_SHA256,
            MAX_ARTIFACT_BYTES,
        )
        predecessor_model = _pinned(
            custody,
            ROOT,
            PREDECESSOR_MODEL,
            PREDECESSOR_MODEL_SHA256,
            MAX_JSON_BYTES,
        )
        predecessor_analysis = _pinned(
            custody,
            ROOT,
            PREDECESSOR_ANALYSIS,
            PREDECESSOR_ANALYSIS_SHA256,
            MAX_ARTIFACT_BYTES,
        )
        predecessor_selector_audit = audit_predecessor_selector(
            predecessor_model.content or b"", predecessor_analysis.content or b""
        )
    order_index, order = selected_order_table(values)
    scan_summary, ledger = mine_rows(values, bank, order_index, order)
    current_cnf_bank = classify_ledger_against_cnf(cnf, ledger)
    scan_summary["prior_ledger_new_occurrence_count"] = scan_summary[
        "new_occurrence_count"
    ]
    scan_summary.update(current_cnf_bank)
    scan_summary["new_occurrence_count"] = sum(
        entry["bank_relation"] == "new-occurrence-existing-family"
        for entry in ledger["entries"]
    )
    registered_families = scan_registered_families(
        values, motif_scanner.content or b"", order_index, order
    )
    just_added_entries = [
        entry for entry in ledger["entries"] if _support(entry) == JUST_ADDED_SUPPORT
    ]
    _require(
        not any(
            entry["bank_relation"] == "new-occurrence-existing-family"
            for entry in just_added_entries
        ),
        "just-added size-4 occurrence is reported as new",
    )
    new_entries = sorted(
        (
            entry
            for entry in ledger["entries"]
            if entry["bank_relation"] == "new-occurrence-existing-family"
        ),
        key=lambda entry: (entry["support_size"], entry["support"]),
    )
    _require(new_entries, "active-order mine found no new occurrence")
    smallest_new = new_entries[0]
    smallest_evaluations = evaluate_occurrence_orbit(values, _support(smallest_new))
    smallest_falsified = sum(not item["satisfied"] for item in smallest_evaluations)
    _require(
        smallest_falsified > 0
        and sum(item["guard_satisfies_clause"] for item in smallest_evaluations) == 2,
        "smallest new occurrence does not cut the authenticated active-order model",
    )
    just_added_semantic_multiplicities = semantic_orbit_clause_multiplicities(
        cnf, JUST_ADDED_SUPPORT
    )
    _require(
        just_added_semantic_multiplicities == [3, 3, 3, 3],
        "just-added semantic orbit multiplicity drifted",
    )
    ledger_payload = canonical_json_bytes(ledger)
    analysis = {
        "schema": "p97-exact17-sparse-six-four-row-bisector-two-kalmanson-sat-canary-analysis/v1",
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
        "registered_family_scan": registered_families,
        "predecessor_selector_audit": predecessor_selector_audit,
        "just_added_size4_regression": {
            "support": [list(hit) for hit in sorted(JUST_ADDED_SUPPORT)],
            "present_in_prior_ledger_bank": False,
            "present_in_current_cnf_bank": True,
            "reported_as_new": False,
            "orbit_clauses_present_in_cnf": True,
            "exact_serialized_orbit_clause_multiplicities": replay[
                "just_added_two_kalmanson_orbit_clause_multiplicities"
            ],
            "semantic_orbit_clause_multiplicities": just_added_semantic_multiplicities,
            "active_named_order": order_index,
            "active_order_table": list(order),
            "occurs_in_active_order_scan": bool(just_added_entries),
            "active_order_guarded_clause_records": 4,
            "active_order_guarded_clauses_falsified": 0,
            "inactive_order_clause_records_satisfied_by_guard": 4,
        },
        "smallest_sufficient_new_cut": {
            "support": smallest_new["support"],
            "support_size": smallest_new["support_size"],
            "orbit_clause_count": 4,
            "active_order_falsified_clause_count": smallest_falsified,
            "inactive_order_guard_satisfied_clause_count": 2,
            "orbit_evaluations": smallest_evaluations,
            "immediate_lean_consumer": smallest_new["immediate_lean_consumer"],
        },
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
        _relative(root, PREDECESSOR_MODEL): PREDECESSOR_MODEL_SHA256,
        _relative(root, PREDECESSOR_ANALYSIS): PREDECESSOR_ANALYSIS_SHA256,
        _relative(root, LOG_ARTIFACT): artifact_meta["solver_log"],
        _relative(root, MOTIF_SCANNER): MOTIF_SCANNER_SHA256,
    }
    created_utc = (
        datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
    )
    run_manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "owner": "exact17-two-kalmanson-sat-canary-mine",
        "run_id": RUN_ID,
        "root": _relative(root, output_root),
        "base_head": BASE_HEAD,
        "created_utc": created_utc,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {
            **portfolio_source["source_digests"],
            **authenticated_hashes,
            "scripts/mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py": sha256_bytes(
                Path(__file__).read_bytes()
            ),
            "scripts/test_mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py": sha256_bytes(
                (
                    ROOT
                    / "scripts/test_mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py"
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
