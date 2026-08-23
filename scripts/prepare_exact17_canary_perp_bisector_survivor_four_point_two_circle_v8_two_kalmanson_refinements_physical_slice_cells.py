"""Finalized V8 physical-slice source identity and source-export gate.

The gate authenticates the committed V8 Lean packet, its generator, the V7
control-plane parents, and the current V8 preparer/miner/runner bytes.  The
``source-export`` route is intentionally separate from portfolio preparation:
it requires an external lane checkpoint registering the exact generated root,
exports the source packet once, and never contacts PIQD or a SAT solver.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import subprocess
import sys
from collections.abc import Callable, Iterator
from contextlib import ExitStack, contextmanager
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
if str(SCRIPTS) not in sys.path:
    sys.path.insert(0, str(SCRIPTS))

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_physical_slice_cells as _PARENT

LANE_ID = "exact17-v8-two-kalmanson-successor-preparer-20260823"
RUN_ID = "preparation-v1"
RUN_OWNER = "exact17-fourpoint-v8-preparer"
BASE_HEAD = "5a33fbdb60324e48365587b0cadffdc067308554"
RUN_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
SOURCE_HEAD_AT_HOOK_CREATION = "0ac942533b2809d48944363345c6a526afa0b4b2"
V7_ROOT_CLAUSES = 7_409_810

ROOT_SOURCE_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinements.lean"
)
SOURCE_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinementsPhysicalSliceCoverage.lean"
)
EXPORTER_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinementsPhysicalSliceCellExport.lean"
)
INGRESS_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinementsPhysicalSliceCertificateIngress.lean"
)
GENERATOR_RELATIVE = (
    "scripts/generate_exact17_four_point_two_circle_v8_two_kalmanson_refinements.py"
)
ROOT_SOURCE_PATH = ROOT / ROOT_SOURCE_RELATIVE
SOURCE_PATH = ROOT / SOURCE_RELATIVE
EXPORTER_PATH = ROOT / EXPORTER_RELATIVE
INGRESS_PATH = ROOT / INGRESS_RELATIVE
GENERATOR_PATH = ROOT / GENERATOR_RELATIVE

PREPARER_PATH = Path(__file__).resolve()
TEST_PATH = ROOT / (
    "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v8_two_kalmanson_refinements_physical_slice_cells.py"
)
MINER_RELATIVE = (
    "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "v8_two_kalmanson_refinements_sat_model.py"
)
RUNNER_RELATIVE = (
    "scripts/run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v8_two_kalmanson_refinements_sat_portfolio.py"
)
CHECKPOINT_PATH = ROOT / (
    ".codex/worktree-checkpoints/"
    "exact17-v8-production-identity-freeze-20260823.json"
)
PRODUCTION_CONFIG_RELATIVE = Path(
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "preparation-config.json"
)
PRODUCTION_CONFIG_PATH = ROOT / PRODUCTION_CONFIG_RELATIVE
PRODUCTION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson-refinements-finalized-preparation-config/v1"
)
SOURCE_CELL_PREFIX = (
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "refinements"
)
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivor"
    "FourPointTwoCircleV8TwoKalmansonRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmanson"
    "RefinementPhysicalSliceCell"
)
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
SOURCE_SCHEMA = "p97-piqd-static-source/v1"
WAVE_SCHEMA = "p97-cegar-wave/v1"

# These are the immutable runtime inputs inherited by the V8 adapter from the
# hardened V5/V7 exporter.  They are authenticated by the finalized V8
# preparer pin and rechecked against live bytes before the inherited support
# validator is entered.  In particular, do not source these values from the
# base module's mutable EXPECTED_* globals: those are intentionally empty
# outside an active production context.
INHERITED_IMMEDIATE_PARENT_EXPORTER_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V7TwoKalmansonRefinementsPhysicalSliceCellExport.lean"
)
INHERITED_IMMEDIATE_PARENT_EXPORTER_SHA256 = (
    "2f0b439bae33e796cf10e312f43ef23dddfa4ee485e119bbd4334353adbcb90e"
)
INHERITED_IMMEDIATE_PARENT_EXPORTER_BYTES = 3_667
INHERITED_DELEGATED_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py"
)
INHERITED_DELEGATED_PREPARER_SHA256 = (
    "cd1e278842fec2be41ff728dd6a012a4a701ef387b388736935f842ea5bc62c2"
)
INHERITED_DELEGATED_PREPARER_BYTES = 36_146
INHERITED_DELEGATED_PREPARER_COMMIT = "8965fe837167aa010abb2c8835df0938dad3f595"
INHERITED_HARDENED_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_physical_slice_cells.py"
)
INHERITED_HARDENED_PREPARER_SHA256 = (
    "6fefaa650e82014b9c7f7a218ccb08209ad446500ed2feb49ec036891a10a298"
)
INHERITED_HARDENED_PREPARER_BYTES = 26_066
INHERITED_HARDENED_PREPARER_COMMIT = "bc4c04db398979c57edaf4af9c60e1eae984f436"
INHERITED_VARIABLE_MAP_RELATIVE = (
    "census/p97_search/waves/exact17/child40/variable-map.json"
)
INHERITED_VARIABLE_MAP_SHA256 = (
    "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
)
INHERITED_VARIABLE_MAP_BYTES = 23_341

VARIABLES = 308
ROOT_CLAUSES = 7_409_839
CELL_CLAUSES = 7_409_845
CELL_COUNT = 76
SUFFIX_CLAUSES = 29
ORBIT_CLAUSES = 44
OCCURRENCES = 11
ORBIT_SHA256 = "0a2fb96358182260a5e9a881f7af25930e0d589abf97e60a0dabcfe4afd57ded"
SUFFIX_SHA256 = "43c3f4a7452404a67cd179a18966edf9fd58a11a8b1077b86eb312daba710f75"
EXPECTED_SUFFIX = (
    (-307, -161, -170, -131, -130, -46, -51, -283, -280),
    (-307, -67, -64, -261, -260, -40, -47, -209, -220),
    (-308, -212, -221, -131, -130, -46, -51, -283, -280),
    (-308, -67, -61, -261, -260, -40, -44, -158, -169),
    (-307, -46, -39, -267, -270, -84, -83, -237, -226),
    (-308, -46, -39, -267, -270, -84, -83, -237, -226),
    (-307, -103, -115, -143, -151, -86, -100, -245, -251),
    (-308, -103, -112, -143, -151, -86, -100, -245, -248),
    (-307, -46, -39, -267, -270, -54, -57, -90, -100, -241, -244),
    (-308, -46, -39, -267, -270, -54, -57, -90, -100, -241, -244),
    (-307, -13, -4, -103, -111, -143, -140, -196, -189, -52, -53, -245, -251),
    (-308, -10, -4, -103, -111, -143, -140, -196, -189, -52, -53, -245, -248),
    (-308, -255, -251, -236, -223, -31, -30, -87, -94, -219, -213, -14, -17),
    (-307, -13, -2, -111, -115, -143, -146, -196, -189, -24, -27),
    (-307, -255, -247, -223, -238, -31, -21, -87, -94, -150, -140),
    (-308, -255, -247, -223, -238, -31, -21, -87, -94, -150, -140),
    (-307, -103, -111, -143, -146, -196, -189, -52, -53, -24, -27),
    (-308, -236, -223, -31, -21, -87, -94, -219, -213, -150, -140),
    (-307, -13, -4, -103, -111, -143, -140, -179, -176, -52, -57, -245, -251),
    (-308, -10, -4, -103, -111, -143, -140, -179, -176, -52, -57, -245, -248),
    (-308, -255, -251, -236, -223, -31, -30, -70, -80, -219, -216, -14, -17),
    (-307, -13, -4, -205, -208, -52, -54, -251, -241),
    (-308, -255, -251, -287, -285, -219, -207, -17, -3),
    (-307, -103, -115, -160, -161, -205, -212, -245, -251),
    (-307, -236, -238, -65, -67, -287, -288, -14, -17),
    (-308, -236, -238, -65, -67, -287, -288, -14, -17),
    (-307, -103, -115, -143, -140, -205, -208, -245, -251),
    (-307, -236, -238, -31, -27, -287, -282, -14, -17),
    (-308, -236, -238, -31, -30, -287, -285, -14, -17),
)

OPERATOR_HELP = """\
Authenticate or export the finalized exact-17 V8 source packet.

The static check verifies every committed source and parent pin, every live V8
control-plane pin, and the exact 308/7,409,839/7,409,845 count contract.
The source-export command additionally requires an explicit run root and an
external worktree lane checkpoint registering exactly that root.  It only
creates the source packet; portfolio preparation and PIQD remain separate.
"""


class V8PreparationError(RuntimeError):
    """A V8 source identity, count, or route contract has drifted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _read_regular(path: Path, label: str) -> bytes:
    try:
        return _PARENT._BASE._secure_read_named(path, label)
    except (OSError, _PARENT.PreparationError) as exc:
        raise V8PreparationError(
            f"{label} is not a stable regular non-symlink file"
        ) from exc


def _strict_pin(value: Any, *, label: str, committed: bool) -> dict[str, Any]:
    keys = {"path", "sha256", "bytes", "commit"} if committed else {
        "path",
        "sha256",
        "bytes",
    }
    if type(value) is not dict or set(value) != keys:
        raise V8PreparationError(f"{label} pin keys drifted")
    if type(value["path"]) is not str or not value["path"]:
        raise V8PreparationError(f"{label} path drifted")
    candidate = PurePosixPath(value["path"])
    if (
        candidate.is_absolute()
        or value["path"] != candidate.as_posix()
        or any(part in {"", ".", ".."} for part in candidate.parts)
    ):
        raise V8PreparationError(f"{label} path is not normalized repository-relative")
    digest = value["sha256"]
    if type(digest) is not str or len(digest) != 64:
        raise V8PreparationError(f"{label} sha256 drifted")
    if type(value["bytes"]) is not int or value["bytes"] <= 0:
        raise V8PreparationError(f"{label} byte count drifted")
    if committed:
        commit = value["commit"]
        if type(commit) is not str or len(commit) != 40:
            raise V8PreparationError(f"{label} commit drifted")
    return value


def _strict_config(path: Path = PRODUCTION_CONFIG_PATH) -> dict[str, Any]:
    raw = _read_regular(path, "V8 preparation config")
    try:
        value = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise V8PreparationError("V8 preparation config is not strict JSON") from exc
    keys = {
        "base_head",
        "counts",
        "generated_root",
        "lane_id",
        "parent_dependencies",
        "production_pins_finalized",
        "schema",
        "source_commit",
        "source_support",
        "source_theorem",
        "target_code",
    }
    if type(value) is not dict or set(value) != keys:
        raise V8PreparationError("V8 preparation config keys drifted")
    if value["schema"] != PRODUCTION_CONFIG_SCHEMA:
        raise V8PreparationError("V8 preparation config schema drifted")
    if value["base_head"] != BASE_HEAD or value["lane_id"] != LANE_ID:
        raise V8PreparationError("V8 preparation config lane binding drifted")
    if value["generated_root"] != RUN_ROOT.relative_to(ROOT).as_posix():
        raise V8PreparationError("V8 preparation config output root drifted")
    if value["production_pins_finalized"] is not True:
        raise V8PreparationError("V8 production pins are not finalized")
    if value["source_theorem"] != SOURCE_THEOREM:
        raise V8PreparationError("V8 source theorem drifted")
    expected_counts = {
        "cells": CELL_COUNT,
        "occurrences": OCCURRENCES,
        "orbit_clauses": ORBIT_CLAUSES,
        "physical_cell_clauses": CELL_CLAUSES,
        "root_clauses": ROOT_CLAUSES,
        "suffix_clauses": SUFFIX_CLAUSES,
        "variables": VARIABLES,
    }
    if value["counts"] != expected_counts:
        raise V8PreparationError("V8 count contract drifted")
    source = value["source_support"]
    parents = value["parent_dependencies"]
    targets = value["target_code"]
    if type(source) is not dict or set(source) != {
        "exporter",
        "generator",
        "ingress",
        "root",
        "source",
    }:
        raise V8PreparationError("V8 source support inventory drifted")
    if type(parents) is not dict or set(parents) != {
        "v7_miner",
        "v7_preparer",
        "v7_runner",
    }:
        raise V8PreparationError("V8 parent dependency inventory drifted")
    if type(targets) is not dict or set(targets) != {"miner", "preparer", "runner"}:
        raise V8PreparationError("V8 target-code inventory drifted")
    for label, pin in source.items():
        _strict_pin(pin, label=f"source_support.{label}", committed=True)
        if pin["commit"] != value["source_commit"]:
            raise V8PreparationError(f"source_support.{label} commit drifted")
    for label, pin in parents.items():
        _strict_pin(pin, label=f"parent_dependencies.{label}", committed=True)
    for label, pin in targets.items():
        _strict_pin(pin, label=f"target_code.{label}", committed=False)
    return value


def _verify_pin(pin: dict[str, Any], *, label: str, committed: bool) -> None:
    candidate = PurePosixPath(pin["path"])
    if candidate.is_absolute() or ".." in candidate.parts:
        raise V8PreparationError(f"{label} path is unsafe")
    path = ROOT / pin["path"]
    raw = _read_regular(path, label)
    if len(raw) != pin["bytes"] or sha256_bytes(raw) != pin["sha256"]:
        raise V8PreparationError(f"{label} live bytes drifted")
    if not committed:
        return
    try:
        kind = subprocess.run(
            ["git", "cat-file", "-t", pin["commit"]],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
        blob = subprocess.run(
            ["git", "show", f"{pin['commit']}:{pin['path']}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
    except (OSError, subprocess.CalledProcessError) as exc:
        raise V8PreparationError(f"{label} committed blob unavailable") from exc
    if kind != b"commit\n" or blob != raw:
        raise V8PreparationError(f"{label} committed blob drifted")


def _validate_clause_contract() -> None:
    if len(EXPECTED_SUFFIX) != SUFFIX_CLAUSES or len(set(EXPECTED_SUFFIX)) != SUFFIX_CLAUSES:
        raise V8PreparationError("V8 suffix inventory drifted")
    if sha256_bytes(canonical_json_bytes(EXPECTED_SUFFIX)) != SUFFIX_SHA256:
        raise V8PreparationError("V8 suffix digest drifted")
    if ROOT_CLAUSES != 7_409_810 + SUFFIX_CLAUSES:
        raise V8PreparationError("V8 root count is not V7 plus the exact suffix")
    if CELL_CLAUSES != ROOT_CLAUSES + 6:
        raise V8PreparationError("V8 physical-cell count is not root plus six units")
    for clause in EXPECTED_SUFFIX:
        literals = set(clause)
        if not clause or len(literals) != len(clause):
            raise V8PreparationError("V8 suffix clause is empty or repeats a literal")
        if any(literal == 0 or abs(literal) > VARIABLES for literal in clause):
            raise V8PreparationError("V8 suffix clause exceeds the variable map")
        if any(-literal in literals for literal in literals):
            raise V8PreparationError("V8 suffix clause is tautological")


def require_production_pins(path: Path = PRODUCTION_CONFIG_PATH) -> dict[str, Any]:
    config = _strict_config(path)
    _PARENT.validate_committed_dependencies()
    for label, pin in config["source_support"].items():
        _verify_pin(pin, label=f"source_support.{label}", committed=True)
    for label, pin in config["parent_dependencies"].items():
        _verify_pin(pin, label=f"parent_dependencies.{label}", committed=True)
    for label, pin in config["target_code"].items():
        _verify_pin(pin, label=f"target_code.{label}", committed=False)
    _validate_clause_contract()
    return config


def _validate_freeze_checkpoint() -> None:
    value = json.loads(_read_regular(CHECKPOINT_PATH, "V8 freeze checkpoint"))
    if type(value) is not dict or value.get("schema") != "worktree-lane-checkpoint/v1":
        raise V8PreparationError("V8 freeze checkpoint schema drifted")
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    if value.get("manifest_sha256") != sha256_bytes(canonical_json_bytes(unsigned)):
        raise V8PreparationError("V8 freeze checkpoint self-hash drifted")
    if (
        value.get("base_head") != BASE_HEAD
        or value.get("lane_id") != "exact17-v8-production-identity-freeze-20260823"
        or value.get("generated_roots") != []
    ):
        raise V8PreparationError("V8 freeze checkpoint binding drifted")


def validate_committed_dependencies() -> None:
    require_production_pins()


def source_static_check(path: Path = PRODUCTION_CONFIG_PATH) -> dict[str, Any]:
    config = require_production_pins(path)
    _validate_freeze_checkpoint()
    return {
        "schema": (
            "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
            "v8-two-kalmanson-refinements-source-static-check/v1"
        ),
        "status": "SOURCE_EXPORT_READY",
        "source_commit": config["source_commit"],
        "counts": config["counts"],
        "source_theorem": SOURCE_THEOREM,
        "suffix_sha256": SUFFIX_SHA256,
        "orbit_sha256": ORBIT_SHA256,
    }


def category_id(center: int, category: str) -> str:
    _PARENT.category_id(center, category)
    return f"{SOURCE_CELL_PREFIX}-next-center-{center:02d}-physical-{category}"


def route_contract() -> dict[str, str]:
    return {
        "run_root": RUN_ROOT.relative_to(ROOT).as_posix(),
        "root_source": ROOT_SOURCE_RELATIVE,
        "source": SOURCE_RELATIVE,
        "exporter": EXPORTER_RELATIVE,
        "ingress": INGRESS_RELATIVE,
        "generator": GENERATOR_RELATIVE,
        "config": PRODUCTION_CONFIG_RELATIVE.as_posix(),
    }


def _repo_relative(path: Path) -> str:
    try:
        return path.resolve(strict=False).relative_to(ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise V8PreparationError("V8 route escapes the repository") from exc


def _current_head() -> str:
    try:
        raw = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout.strip()
    except (OSError, subprocess.CalledProcessError) as exc:
        raise V8PreparationError("current committed source head is unavailable") from exc
    try:
        head = raw.decode("ascii")
    except UnicodeDecodeError as exc:
        raise V8PreparationError("current committed source head is malformed") from exc
    if len(head) != 40 or any(character not in "0123456789abcdef" for character in head):
        raise V8PreparationError("current committed source head is malformed")
    return head


def _strict_json_object(path: Path, label: str) -> tuple[dict[str, Any], bytes]:
    raw = _read_regular(path, label)

    def pairs_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in pairs:
            if key in value:
                raise V8PreparationError(f"{label} repeats a JSON key")
            value[key] = item
        return value

    try:
        value = json.loads(raw, object_pairs_hook=pairs_object)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise V8PreparationError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        raise V8PreparationError(f"{label} is not a JSON object")
    return value, raw


def _validate_export_checkpoint(
    path: Path, *, run_root: Path, current_head: str
) -> tuple[dict[str, Any], bytes]:
    value, raw = _strict_json_object(path, "V8 source-export lane checkpoint")
    keys = {
        "base_head",
        "created_utc",
        "durable_paths",
        "generated_roots",
        "lane_id",
        "manifest_sha256",
        "owned_paths",
        "owner",
        "schema",
    }
    if set(value) != keys or value["schema"] != "worktree-lane-checkpoint/v1":
        raise V8PreparationError("V8 source-export checkpoint schema drifted")
    lane_id = value["lane_id"]
    if type(lane_id) is not str or not lane_id or value["owner"] != lane_id:
        raise V8PreparationError("V8 source-export checkpoint owner drifted")
    checkpoint_relative = _repo_relative(path)
    if checkpoint_relative != f".codex/worktree-checkpoints/{lane_id}.json":
        raise V8PreparationError("V8 source-export checkpoint path drifted")
    if value["base_head"] != current_head:
        raise V8PreparationError("V8 source-export checkpoint base head drifted")
    expected_root = _repo_relative(run_root)
    if value["generated_roots"] != [expected_root]:
        raise V8PreparationError("V8 source-export checkpoint generated root drifted")
    if value["owned_paths"] != [checkpoint_relative]:
        raise V8PreparationError("V8 source-export checkpoint ownership drifted")
    if value["durable_paths"] != []:
        raise V8PreparationError("V8 source-export checkpoint durability drifted")
    created_utc = value["created_utc"]
    if type(created_utc) is not str or re.fullmatch(
        r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z", created_utc
    ) is None:
        raise V8PreparationError("V8 source-export checkpoint timestamp drifted")
    try:
        datetime.strptime(created_utc, "%Y-%m-%dT%H:%M:%S%z")
    except ValueError as exc:
        raise V8PreparationError("V8 source-export checkpoint timestamp drifted") from exc
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    if value["manifest_sha256"] != sha256_bytes(canonical_json_bytes(unsigned)):
        raise V8PreparationError("V8 source-export checkpoint self-hash drifted")
    expected_parent = Path("scratch/runs") / lane_id
    relative_root = Path(expected_root)
    if relative_root.parent != expected_parent or relative_root.name != RUN_ID:
        raise V8PreparationError("V8 source-export checkpoint route is not canonical")
    return value, raw


def _verify_live_file_at_head(path: Path, head: str, label: str) -> None:
    relative = _repo_relative(path)
    custody, raw = _capture_unpinned(_PARENT._BASE, path, label)
    try:
        try:
            committed = subprocess.run(
                ["git", "show", f"{head}:{relative}"],
                cwd=ROOT,
                check=True,
                capture_output=True,
            ).stdout
        except (OSError, subprocess.CalledProcessError) as exc:
            raise V8PreparationError(
                f"{label} is not committed at the current head"
            ) from exc
        if raw != committed or custody.verify() != raw:
            raise V8PreparationError(f"{label} differs from the current committed head")
    finally:
        custody.close()


def _validate_source_export_controls(
    *,
    run_root: Path,
    lane_checkpoint_path: Path,
    config_path: Path,
) -> tuple[dict[str, Any], dict[str, Any], str]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 source-export output root drifted")
    if config_path != PRODUCTION_CONFIG_PATH:
        raise V8PreparationError("V8 source-export config route drifted")
    if run_root.exists() or run_root.is_symlink():
        raise V8PreparationError("V8 source-export output root already exists")
    head = _current_head()
    config = require_production_pins(config_path)
    checkpoint, _ = _validate_export_checkpoint(
        lane_checkpoint_path, run_root=run_root, current_head=head
    )
    for path, label in (
        (config_path, "V8 preparation config"),
        (PREPARER_PATH, "V8 preparer"),
        (TEST_PATH, "V8 preparer test"),
        (ROOT / MINER_RELATIVE, "V8 miner"),
        (ROOT / RUNNER_RELATIVE, "V8 runner"),
    ):
        _verify_live_file_at_head(path, head, label)
    return config, checkpoint, head


def _validate_v8_parent_novelty(
    immediate_parent: Any, successor_root: Any
) -> dict[str, Any]:
    """Authenticate that V8 is exactly the V7 byte prefix plus its 29 clauses."""

    before_parent = immediate_parent.verify("V7 immediate parent")
    before_successor = successor_root.verify("V8 successor root")
    parent_fd = -1
    successor_fd = -1
    observed: list[tuple[int, ...]] = []
    try:
        parent_fd = os.dup(immediate_parent.descriptor)
        successor_fd = os.dup(successor_root.descriptor)
        os.lseek(parent_fd, 0, os.SEEK_SET)
        os.lseek(successor_fd, 0, os.SEEK_SET)
        with ExitStack() as stack:
            parent_handle = stack.enter_context(
                os.fdopen(parent_fd, "rb", closefd=True)
            )
            parent_fd = -1
            successor_handle = stack.enter_context(
                os.fdopen(successor_fd, "rb", closefd=True)
            )
            successor_fd = -1
            if _PARENT._BASE._parent_header(parent_handle.readline()) != (
                VARIABLES,
                V7_ROOT_CLAUSES,
            ):
                raise V8PreparationError("V7 parent DIMACS dimensions drifted")
            if _PARENT._BASE._parent_header(successor_handle.readline()) != (
                VARIABLES,
                ROOT_CLAUSES,
            ):
                raise V8PreparationError("V8 root DIMACS dimensions drifted")
            for index in range(V7_ROOT_CLAUSES):
                parent_line = parent_handle.readline()
                if not parent_line or successor_handle.readline() != parent_line:
                    raise V8PreparationError(
                        f"V8 parent prefix drifted at clause {index}"
                    )
            if parent_handle.readline():
                raise V8PreparationError("V7 parent has trailing clauses")
            for expected in EXPECTED_SUFFIX:
                line = successor_handle.readline()
                if not line:
                    raise V8PreparationError("V8 successor suffix ended early")
                clause = _PARENT._BASE._clause_tuple(
                    line,
                    VARIABLES,
                    "V8 successor suffix clause",
                    require_unique_literals=True,
                )
                observed.append(clause)
                if clause != expected:
                    raise V8PreparationError("V8 successor suffix order drifted")
            if successor_handle.readline():
                raise V8PreparationError("V8 successor has trailing clauses")
    finally:
        if parent_fd >= 0:
            os.close(parent_fd)
        if successor_fd >= 0:
            os.close(successor_fd)
    if _PARENT._BASE._anchor(before_parent) != _PARENT._BASE._anchor(
        immediate_parent.verify("V7 immediate parent")
    ):
        raise V8PreparationError("V7 parent changed during novelty scan")
    if _PARENT._BASE._anchor(before_successor) != _PARENT._BASE._anchor(
        successor_root.verify("V8 successor root")
    ):
        raise V8PreparationError("V8 root changed during novelty scan")
    return {
        "schema": (
            "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
            "v8-two-kalmanson-refinements-parent-novelty/v1"
        ),
        "policy": {
            "parent_scan": "byte-exact-complete-v7-prefix",
            "successor_shape": "byte-exact V7 prefix plus ordered 29-clause suffix",
        },
        "immediate_parent_clause_count_scanned": V7_ROOT_CLAUSES,
        "suffix_clause_count": SUFFIX_CLAUSES,
        "suffix_clauses": [list(clause) for clause in observed],
        "strict_new_suffix_indices": list(range(SUFFIX_CLAUSES)),
        "strict_new_suffix_count": SUFFIX_CLAUSES,
        "successor_multiplicity": [1] * SUFFIX_CLAUSES,
        "parent_body_exact_prefix": True,
        "suffix_exact_order": True,
    }


def _v8_contract_for_parent() -> None:
    _validate_clause_contract()


def _validated_inherited_runtime_support() -> dict[str, dict[str, Any]]:
    specifications = {
        "immediate_parent_exporter": (
            INHERITED_IMMEDIATE_PARENT_EXPORTER_RELATIVE,
            INHERITED_IMMEDIATE_PARENT_EXPORTER_SHA256,
            INHERITED_IMMEDIATE_PARENT_EXPORTER_BYTES,
            None,
        ),
        "delegated_preparer": (
            INHERITED_DELEGATED_PREPARER_RELATIVE,
            INHERITED_DELEGATED_PREPARER_SHA256,
            INHERITED_DELEGATED_PREPARER_BYTES,
            INHERITED_DELEGATED_PREPARER_COMMIT,
        ),
        "hardened_preparer": (
            INHERITED_HARDENED_PREPARER_RELATIVE,
            INHERITED_HARDENED_PREPARER_SHA256,
            INHERITED_HARDENED_PREPARER_BYTES,
            INHERITED_HARDENED_PREPARER_COMMIT,
        ),
        "variable_map": (
            INHERITED_VARIABLE_MAP_RELATIVE,
            INHERITED_VARIABLE_MAP_SHA256,
            INHERITED_VARIABLE_MAP_BYTES,
            None,
        ),
    }
    validated: dict[str, dict[str, Any]] = {}
    for label, (relative, digest, size, commit) in specifications.items():
        path = ROOT / relative
        raw = _read_regular(path, f"inherited V8 runtime support {label}")
        if len(raw) != size or sha256_bytes(raw) != digest:
            raise V8PreparationError(
                f"inherited V8 runtime support {label} identity drifted"
            )
        pin: dict[str, Any] = {
            "path": relative,
            "sha256": digest,
            "bytes": size,
        }
        if commit is not None:
            pin["commit"] = commit
        validated[label] = {"path_object": path, "pin": pin}
    return validated


@contextmanager
def _configured_v8_export(
    *,
    config: dict[str, Any],
    checkpoint_path: Path,
    checkpoint: dict[str, Any],
    head: str,
    root_custody_sink: list[_ExportRootCustody] | None = None,
) -> Iterator[Any]:
    """Adapt the hardened V5/V7 custody engine to the authenticated V8 packet."""

    base = _PARENT._BASE
    previous: dict[str, Any] = {}

    def replace(name: str, value: Any) -> None:
        previous[name] = getattr(base, name)
        setattr(base, name, value)

    inherited_support = _validated_inherited_runtime_support()
    immediate_parent_exporter = inherited_support["immediate_parent_exporter"][
        "path_object"
    ]
    delegated_preparer = inherited_support["delegated_preparer"]["path_object"]
    hardened_preparer = inherited_support["hardened_preparer"]["path_object"]
    variable_map = inherited_support["variable_map"]["path_object"]
    checkpoint_raw = _read_regular(checkpoint_path, "V8 source-export lane checkpoint")
    checkpoint_sha256 = sha256_bytes(checkpoint_raw)
    config_raw = _read_regular(PRODUCTION_CONFIG_PATH, "V8 preparation config")
    preparer_raw = _read_regular(PREPARER_PATH, "V8 preparer")
    test_raw = _read_regular(TEST_PATH, "V8 preparer test")
    head_pins = {
        "preparer": {
            "path": _repo_relative(PREPARER_PATH),
            "sha256": sha256_bytes(preparer_raw),
            "bytes": len(preparer_raw),
        },
        "test": {
            "path": _repo_relative(TEST_PATH),
            "sha256": sha256_bytes(test_raw),
            "bytes": len(test_raw),
        },
    }

    def artifact(path: Path) -> dict[str, Any]:
        raw = _read_regular(path, _repo_relative(path))
        return {"path": _repo_relative(path), "sha256": sha256_bytes(raw), "bytes": len(raw)}

    support = {
        "source": artifact(SOURCE_PATH),
        "root_source": artifact(ROOT_SOURCE_PATH),
        "exporter": artifact(EXPORTER_PATH),
        "immediate_parent_exporter": inherited_support[
            "immediate_parent_exporter"
        ]["pin"],
        "delegated_preparer": inherited_support["delegated_preparer"]["pin"],
        "hardened_preparer": inherited_support["hardened_preparer"]["pin"],
        "variable_map": inherited_support["variable_map"]["pin"],
        "checkpoint": {
            "path": _repo_relative(checkpoint_path),
            "sha256": checkpoint_sha256,
            "bytes": len(checkpoint_raw),
            "manifest_sha256": checkpoint["manifest_sha256"],
        },
    }
    legacy_value = {
        "schema": PRODUCTION_CONFIG_SCHEMA,
        "base_head": head,
        "lane_id": LANE_ID,
        "generated_root": _repo_relative(RUN_ROOT),
        "source_commit": config["source_commit"],
        "target_code": {"commit": head, **head_pins},
        "support": support,
    }
    custody = base._PinnedInput.capture(
        PRODUCTION_CONFIG_PATH, "V8 preparation config", sha256_bytes(config_raw)
    )
    production = base._ProductionConfig(legacy_value, head, custody)

    def checkpoint_validator(
        value: dict[str, Any], _required: set[str], _durable: set[str], generated: str
    ) -> None:
        if value != checkpoint or generated != _repo_relative(RUN_ROOT):
            raise V8PreparationError("V8 source-export checkpoint binding drifted")

    def governed_initializer(output: Path, manifest: bytes) -> None:
        if root_custody_sink is None:
            raise V8PreparationError("V8 governed initializer has no custody sink")
        if root_custody_sink:
            raise V8PreparationError("V8 governed initializer ran more than once")
        root_custody_sink.append(_initialize_export_root_with_custody(output, manifest))

    def authenticated_initializer(**kwargs: Any) -> dict[str, Any]:
        """Authenticate inputs, then create once without reopening the new root."""

        repo_root = kwargs["repo_root"].resolve(strict=True)
        output_root = kwargs["output_root"].resolve(strict=False)
        base._require_production_configuration(repo_root, output_root)
        digests = base._validate_support(
            repo_root=repo_root,
            source_path=kwargs["source_path"],
            root_source_path=kwargs["root_source_path"],
            exporter_path=kwargs["exporter_path"],
            immediate_parent_exporter_path=kwargs["immediate_parent_exporter_path"],
            delegated_preparer_path=kwargs["delegated_preparer_path"],
            hardened_preparer_path=kwargs["hardened_preparer_path"],
            variable_map_path=kwargs["variable_map_path"],
            checkpoint_path=kwargs["checkpoint_path"],
            preparer_path=kwargs["preparer_path"],
            test_path=kwargs["test_path"],
            output_root=output_root,
        )
        manifest = base.build_run_manifest(
            repo_root,
            output_root,
            digests,
            source_path=kwargs["source_path"],
            root_source_path=kwargs["root_source_path"],
            exporter_path=kwargs["exporter_path"],
            immediate_parent_exporter_path=kwargs["immediate_parent_exporter_path"],
            delegated_preparer_path=kwargs["delegated_preparer_path"],
            hardened_preparer_path=kwargs["hardened_preparer_path"],
            variable_map_path=kwargs["variable_map_path"],
            checkpoint_path=kwargs["checkpoint_path"],
            preparer_path=kwargs["preparer_path"],
            test_path=kwargs["test_path"],
        )
        governed_initializer(output_root, manifest)
        return {
            "status": "RUN_ROOT_INITIALIZED",
            "run_manifest": _canonical_json_object(manifest, "V8 run manifest"),
        }

    try:
        for name, value in {
            "LANE_ID": LANE_ID,
            "RUN_ID": RUN_ID,
            "RUN_OWNER": checkpoint["owner"],
            "BASE_HEAD": head,
            "SOURCE_PATH": SOURCE_PATH,
            "ROOT_SOURCE_PATH": ROOT_SOURCE_PATH,
            "EXPORTER_PATH": EXPORTER_PATH,
            "IMMEDIATE_PARENT_EXPORTER_PATH": immediate_parent_exporter,
            "CHECKPOINT_PATH": checkpoint_path,
            "PREPARER_PATH": PREPARER_PATH,
            "TEST_PATH": TEST_PATH,
            "PARENT_VARIABLES": VARIABLES,
            "PARENT_CLAUSES": ROOT_CLAUSES,
            "IMMEDIATE_PARENT_CLAUSES": V7_ROOT_CLAUSES,
            "CELL_CLAUSES": CELL_CLAUSES,
            "CELL_COUNT": CELL_COUNT,
            "SOURCE_THEOREM": SOURCE_THEOREM,
            "SCHEMA": f"{SOURCE_CELL_PREFIX}-physical-slice-source-export/v1",
            "CAMPAIGN_SCHEMA": f"{SOURCE_CELL_PREFIX}-physical-slice-campaign/v1",
            "FINITE_SCHEMA": f"{SOURCE_CELL_PREFIX}-physical-slice/v1",
            "ROOT_PRODUCER_SCHEMA": f"{SOURCE_CELL_PREFIX}-root-producer/v1",
            "ORDER_SHA256": sha256_bytes(
                f"{SOURCE_CELL_PREFIX}-physical-slice-order-v1".encode()
            ),
            "PRODUCTION_CONFIG_RELATIVE": PRODUCTION_CONFIG_RELATIVE,
            "PRODUCTION_CONFIG_PATH": PRODUCTION_CONFIG_PATH,
            "PRODUCTION_CONFIG_SCHEMA": PRODUCTION_CONFIG_SCHEMA,
            "PRODUCER_SCHEMA": PRODUCER_SCHEMA,
            "SOURCE_SCHEMA": SOURCE_SCHEMA,
            "WAVE_SCHEMA": WAVE_SCHEMA,
            "DELEGATED_PREPARER_PATH": delegated_preparer,
            "HARDENED_PREPARER_PATH": hardened_preparer,
            "VARIABLE_MAP_PATH": variable_map,
            "EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX": EXPECTED_SUFFIX,
            "EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX_SHA256": SUFFIX_SHA256,
            "_validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_contract": _v8_contract_for_parent,
            "validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_parent_novelty": _validate_v8_parent_novelty,
            "category_id": category_id,
            "_cell_id": category_id,
            "_validate_checkpoint": checkpoint_validator,
            **(
                {
                    "_initialize_governed_skeleton": governed_initializer,
                    "_initialize_run_root_authenticated": authenticated_initializer,
                }
                if root_custody_sink is not None
                else {}
            ),
        }.items():
            replace(name, value)
        with base._configured_production(production):
            yield base
    finally:
        for name, value in previous.items():
            setattr(base, name, value)
        production.close()


_DIRECTORY_FLAGS = (
    os.O_RDONLY
    | getattr(os, "O_CLOEXEC", 0)
    | getattr(os, "O_DIRECTORY", 0)
    | getattr(os, "O_NOFOLLOW", 0)
)


@dataclass(frozen=True)
class _RetainedDirectoryNode:
    name: str
    descriptor: int
    identity: tuple[int, int]


class _RetainedDirectoryChain:
    """Open-at custody for every component of one absolute directory path."""

    def __init__(
        self,
        path: Path,
        anchor_descriptor: int,
        nodes: list[_RetainedDirectoryNode],
    ) -> None:
        self.path = Path(os.path.abspath(path))
        self.anchor_descriptor = anchor_descriptor
        self.nodes = nodes

    @property
    def descriptor(self) -> int:
        return self.nodes[-1].descriptor if self.nodes else self.anchor_descriptor

    def verify(self, label: str, *, through: int | None = None) -> None:
        limit = len(self.nodes) if through is None else through
        if not 0 <= limit <= len(self.nodes):
            raise V8PreparationError(f"{label} retained path depth is invalid")
        anchor = os.fstat(self.anchor_descriptor)
        if not stat.S_ISDIR(anchor.st_mode):
            raise V8PreparationError(f"{label} retained filesystem anchor drifted")
        parent = self.anchor_descriptor
        for node in self.nodes[:limit]:
            opened = os.fstat(node.descriptor)
            try:
                named = os.stat(node.name, dir_fd=parent, follow_symlinks=False)
            except FileNotFoundError as exc:
                raise V8PreparationError(f"{label} retained path disappeared") from exc
            if (
                not stat.S_ISDIR(opened.st_mode)
                or not stat.S_ISDIR(named.st_mode)
                or (opened.st_dev, opened.st_ino) != node.identity
                or (named.st_dev, named.st_ino) != node.identity
            ):
                raise V8PreparationError(f"{label} retained path identity drifted")
            parent = node.descriptor

    def close(self) -> None:
        for node in reversed(self.nodes):
            os.close(node.descriptor)
        os.close(self.anchor_descriptor)


@dataclass(frozen=True)
class _ExportRootCustody:
    chain: _RetainedDirectoryChain
    created_lane_parent: bool = False

    @property
    def root_descriptor(self) -> int:
        return self.chain.nodes[-1].descriptor

    @property
    def parent_descriptor(self) -> int:
        return self.chain.nodes[-2].descriptor

    @property
    def root_identity(self) -> tuple[int, int]:
        return self.chain.nodes[-1].identity

    @property
    def parent_identity(self) -> tuple[int, int]:
        return self.chain.nodes[-2].identity


def _capture_directory_chain(path: Path) -> _RetainedDirectoryChain:
    absolute = Path(os.path.abspath(path))
    anchor = os.open(os.path.sep, _DIRECTORY_FLAGS)
    nodes: list[_RetainedDirectoryNode] = []
    parent = anchor
    pending_descriptor: int | None = None
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise V8PreparationError(f"unsafe retained directory path: {path}")
            pending_descriptor = os.open(
                component, _DIRECTORY_FLAGS, dir_fd=parent
            )
            opened = os.fstat(pending_descriptor)
            named = os.stat(component, dir_fd=parent, follow_symlinks=False)
            identity = (opened.st_dev, opened.st_ino)
            if (
                not stat.S_ISDIR(opened.st_mode)
                or not stat.S_ISDIR(named.st_mode)
                or (named.st_dev, named.st_ino) != identity
            ):
                raise V8PreparationError("retained directory crossed inode custody")
            nodes.append(
                _RetainedDirectoryNode(component, pending_descriptor, identity)
            )
            parent = pending_descriptor
            pending_descriptor = None
        chain = _RetainedDirectoryChain(absolute, anchor, nodes)
        chain.verify("captured V8 directory")
        return chain
    except BaseException:
        if pending_descriptor is not None:
            os.close(pending_descriptor)
        for node in reversed(nodes):
            os.close(node.descriptor)
        os.close(anchor)
        raise


def _capture_export_root_custody(run_root: Path) -> _ExportRootCustody:
    if run_root != RUN_ROOT:
        raise V8PreparationError("refusing custody outside the exact V8 run root")
    chain = _capture_directory_chain(run_root)
    if len(chain.nodes) < 2:
        chain.close()
        raise V8PreparationError("V8 run root has no retained lane parent")
    return _ExportRootCustody(chain)


def _initialize_export_root_with_custody(
    run_root: Path, manifest: bytes
) -> _ExportRootCustody:
    """Create the exact governed root and retain the complete live path.

    Any failure preserves every directory and file already created.  POSIX
    pathname mutation cannot be conditioned atomically on retained inode
    custody, so create-once markers deliberately block automatic retry and
    require operator inspection.
    """

    if run_root != RUN_ROOT:
        raise V8PreparationError("refusing initialization outside the exact V8 run root")
    prefix = _capture_directory_chain(run_root.parent.parent)
    nodes = prefix.nodes
    anchor = prefix.anchor_descriptor
    prefix.nodes = []
    created_parent = False
    lane_pending: int | None = None
    root_pending: int | None = None
    custody: _ExportRootCustody | None = None
    try:
        parent_of_lane = nodes[-1].descriptor if nodes else anchor
        try:
            os.mkdir(run_root.parent.name, 0o700, dir_fd=parent_of_lane)
            created_parent = True
        except FileExistsError as exc:
            raise V8PreparationError(
                "governed V8 lane parent already exists; refusing retry after "
                "a possible pre-custody failure"
            ) from exc
        lane_pending = os.open(
            run_root.parent.name, _DIRECTORY_FLAGS, dir_fd=parent_of_lane
        )
        lane_info = os.fstat(lane_pending)
        lane_named = os.stat(
            run_root.parent.name, dir_fd=parent_of_lane, follow_symlinks=False
        )
        lane_identity = (lane_info.st_dev, lane_info.st_ino)
        if (
            not stat.S_ISDIR(lane_info.st_mode)
            or not stat.S_ISDIR(lane_named.st_mode)
            or (lane_named.st_dev, lane_named.st_ino) != lane_identity
        ):
            raise V8PreparationError("governed V8 lane parent crossed inode custody")
        nodes.append(
            _RetainedDirectoryNode(run_root.parent.name, lane_pending, lane_identity)
        )
        lane_descriptor = lane_pending
        lane_pending = None
        try:
            os.mkdir(run_root.name, 0o700, dir_fd=lane_descriptor)
        except FileExistsError as exc:
            raise V8PreparationError("governed V8 run root already exists") from exc
        root_pending = os.open(
            run_root.name, _DIRECTORY_FLAGS, dir_fd=lane_descriptor
        )
        info = os.fstat(root_pending)
        identity = (info.st_dev, info.st_ino)
        named = os.stat(
            run_root.name, dir_fd=lane_descriptor, follow_symlinks=False
        )
        if (
            not stat.S_ISDIR(info.st_mode)
            or not stat.S_ISDIR(named.st_mode)
            or (named.st_dev, named.st_ino) != identity
        ):
            raise V8PreparationError("governed V8 run root crossed inode custody")
        nodes.append(_RetainedDirectoryNode(run_root.name, root_pending, identity))
        descriptor = root_pending
        root_pending = None
        chain = _RetainedDirectoryChain(run_root, anchor, nodes)
        custody = _ExportRootCustody(chain, created_parent)
        _assert_export_root_custody(run_root, custody)
        for name in ("artifacts", "events", "tmp"):
            os.mkdir(name, 0o700, dir_fd=descriptor)
        manifest_fd = os.open(
            "run_manifest.json",
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=descriptor,
        )
        try:
            _PARENT._BASE._write_all(manifest_fd, manifest)
            os.fsync(manifest_fd)
        finally:
            os.close(manifest_fd)
        os.fsync(descriptor)
        os.fsync(lane_descriptor)
        return custody
    except BaseException:
        if custody is not None:
            _close_export_root_custody(custody)
        else:
            # Before root custody exists, POSIX has no atomic inode-qualified
            # pathname mutation.  Preserve all partial state as a durable
            # failure marker instead of risking mutation of a concurrent
            # replacement.  Create-once then blocks an unsafe retry.
            if root_pending is not None:
                os.close(root_pending)
            if lane_pending is not None:
                os.close(lane_pending)
            for node in reversed(nodes):
                os.close(node.descriptor)
            os.close(anchor)
        raise


def _close_export_root_custody(custody: _ExportRootCustody) -> None:
    custody.chain.close()


def _canonical_json_object(raw: bytes, label: str) -> dict[str, Any]:
    def pairs_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in pairs:
            if key in value:
                raise V8PreparationError(f"{label} repeats a JSON key")
            value[key] = item
        return value

    try:
        value = json.loads(raw, object_pairs_hook=pairs_object)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise V8PreparationError(f"{label} is not strict JSON") from exc
    if type(value) is not dict or raw != canonical_json_bytes(value):
        raise V8PreparationError(f"{label} is not canonical JSON")
    return value


def _capture_unpinned(base: Any, path: Path, label: str) -> tuple[Any, bytes]:
    descriptor, parent = base._open_named_nofollow(path, label)
    try:
        payload, info = base._read_fd_stable(descriptor, label)
        custody = base._PinnedInput(
            label,
            path,
            descriptor,
            parent,
            base._anchor(info),
            sha256_bytes(payload),
        )
        return custody, payload
    except BaseException:
        os.close(descriptor)
        os.close(parent)
        raise


class _RetainedInput:
    def __init__(
        self,
        base: Any,
        label: str,
        path: Path,
        descendant: _RetainedDescendant,
        identity: tuple[int, int, int, int, int, int, int],
        digest: str,
    ) -> None:
        self.base = base
        self.label = label
        self.path = path
        self.descendant = descendant
        self.identity = identity
        self.sha256 = digest

    def verify(self) -> bytes:
        self.descendant.verify(self.label)
        payload, info = self.base._read_fd_stable(
            self.descendant.descriptor, self.label
        )
        if (
            sha256_bytes(payload) != self.sha256
            or self.base._anchor(info) != self.identity
        ):
            raise V8PreparationError(f"{self.label} retained identity drifted")
        self.descendant.verify(self.label)
        return payload

    def close(self) -> None:
        self.descendant.close()


class _RetainedPublishedFile:
    def __init__(
        self,
        base: Any,
        path: Path,
        descendant: _RetainedDescendant,
        identity: tuple[int, int],
    ) -> None:
        self.base = base
        self.path = path
        self.descendant = descendant
        self.identity = identity

    @property
    def descriptor(self) -> int:
        return self.descendant.descriptor

    def verify(self, label: str, *, expected_nlink: int = 1) -> os.stat_result:
        self.descendant.verify(label)
        opened = os.fstat(self.descendant.descriptor)
        if (
            not stat.S_ISREG(opened.st_mode)
            or opened.st_nlink != expected_nlink
            or self.base._inode(opened) != self.identity
        ):
            raise V8PreparationError(f"{label} retained identity drifted")
        self.descendant.verify(label)
        return opened

    def close(self) -> None:
        self.descendant.close()


def _assert_export_root_custody(
    run_root: Path, custody: _ExportRootCustody
) -> None:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 audit root differs from the retained run root")
    if custody.chain.path != Path(os.path.abspath(run_root)):
        raise V8PreparationError("V8 retained run-root path drifted")
    try:
        custody.chain.verify("V8 retained run-root custody")
    except (OSError, V8PreparationError) as exc:
        raise V8PreparationError("V8 retained run-root custody drifted") from exc


class _RetainedDirectoryPath:
    """Descriptor custody for every directory below the retained run root."""

    def __init__(
        self,
        base: Any,
        root_custody: _ExportRootCustody,
        relative: PurePosixPath,
        nodes: list[_RetainedDirectoryNode],
    ) -> None:
        self.base = base
        self.root_custody = root_custody
        self.relative = relative
        self.nodes = nodes

    @property
    def descriptor(self) -> int:
        return self.nodes[-1].descriptor if self.nodes else self.root_custody.root_descriptor

    def verify(self, label: str) -> None:
        _assert_export_root_custody(RUN_ROOT, self.root_custody)
        parent = self.root_custody.root_descriptor
        for node in self.nodes:
            opened = os.fstat(node.descriptor)
            named = os.stat(node.name, dir_fd=parent, follow_symlinks=False)
            if (
                not stat.S_ISDIR(opened.st_mode)
                or not stat.S_ISDIR(named.st_mode)
                or (opened.st_dev, opened.st_ino) != node.identity
                or (named.st_dev, named.st_ino) != node.identity
            ):
                raise V8PreparationError(f"{label} retained ancestor identity drifted")
            parent = node.descriptor
        _assert_export_root_custody(RUN_ROOT, self.root_custody)

    def close(self) -> None:
        for node in reversed(self.nodes):
            os.close(node.descriptor)


class _RetainedDescendant:
    def __init__(
        self,
        base: Any,
        directories: _RetainedDirectoryPath,
        name: str,
        descriptor: int,
        identity: tuple[int, int, int, int, int, int, int],
    ) -> None:
        self.base = base
        self.directories = directories
        self.name = name
        self.descriptor = descriptor
        self.identity = identity

    def verify(self, label: str) -> None:
        self.directories.verify(label)
        opened = os.fstat(self.descriptor)
        named = os.stat(
            self.name,
            dir_fd=self.directories.descriptor,
            follow_symlinks=False,
        )
        if (
            self.base._anchor(opened) != self.identity
            or self.base._anchor(named) != self.identity
        ):
            raise V8PreparationError(f"{label} retained pathname crossed custody")
        self.directories.verify(label)

    def close(self) -> None:
        os.close(self.descriptor)
        self.directories.close()


def _open_export_directory_path(
    base: Any,
    root_custody: _ExportRootCustody,
    relative: PurePosixPath,
    label: str,
) -> _RetainedDirectoryPath:
    if relative.is_absolute() or any(
        part in {"", ".", ".."} for part in relative.parts
    ):
        raise V8PreparationError(f"{label} retained directory path is unsafe")
    _assert_export_root_custody(RUN_ROOT, root_custody)
    parent = root_custody.root_descriptor
    nodes: list[_RetainedDirectoryNode] = []
    pending_descriptor: int | None = None
    try:
        for component in relative.parts:
            pending_descriptor = os.open(
                component, _DIRECTORY_FLAGS, dir_fd=parent
            )
            opened = os.fstat(pending_descriptor)
            named = os.stat(component, dir_fd=parent, follow_symlinks=False)
            identity = (opened.st_dev, opened.st_ino)
            if (
                not stat.S_ISDIR(opened.st_mode)
                or not stat.S_ISDIR(named.st_mode)
                or (named.st_dev, named.st_ino) != identity
            ):
                raise V8PreparationError(f"{label} retained parent identity drifted")
            nodes.append(
                _RetainedDirectoryNode(component, pending_descriptor, identity)
            )
            parent = pending_descriptor
            pending_descriptor = None
        retained = _RetainedDirectoryPath(base, root_custody, relative, nodes)
        retained.verify(label)
        return retained
    except BaseException:
        if pending_descriptor is not None:
            os.close(pending_descriptor)
        for node in reversed(nodes):
            os.close(node.descriptor)
        raise


def _open_export_descendant(
    base: Any,
    root_custody: _ExportRootCustody,
    relative: PurePosixPath,
    label: str,
) -> _RetainedDescendant:
    if relative.is_absolute() or any(part in {"", ".", ".."} for part in relative.parts):
        raise V8PreparationError(f"{label} retained path is unsafe")
    directories = _open_export_directory_path(
        base, root_custody, PurePosixPath(*relative.parts[:-1]), label
    )
    descriptor: int | None = None
    try:
        descriptor = os.open(
            relative.name,
            os.O_RDONLY
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=directories.descriptor,
        )
        opened = os.fstat(descriptor)
        named = os.stat(
            relative.name, dir_fd=directories.descriptor, follow_symlinks=False
        )
        if base._anchor(opened) != base._anchor(named):
            raise V8PreparationError(f"{label} retained pathname crossed custody")
        retained = _RetainedDescendant(
            base, directories, relative.name, descriptor, base._anchor(opened)
        )
        retained.verify(label)
        return retained
    except BaseException:
        if descriptor is not None:
            os.close(descriptor)
        directories.close()
        raise


def _capture_export_input(
    base: Any,
    root_custody: _ExportRootCustody,
    relative: str,
    label: str,
) -> tuple[_RetainedInput, bytes]:
    path = RUN_ROOT / relative
    descendant = _open_export_descendant(
        base, root_custody, PurePosixPath(relative), label
    )
    try:
        payload, info = base._read_fd_stable(descendant.descriptor, label)
        retained = _RetainedInput(
            base,
            label,
            path,
            descendant,
            base._anchor(info),
            sha256_bytes(payload),
        )
        return retained, payload
    except BaseException:
        descendant.close()
        raise


def _capture_export_published(
    base: Any,
    root_custody: _ExportRootCustody,
    relative: str,
    label: str,
) -> _RetainedPublishedFile:
    path = RUN_ROOT / relative
    descendant = _open_export_descendant(
        base, root_custody, PurePosixPath(relative), label
    )
    try:
        info = os.fstat(descendant.descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise V8PreparationError(
                f"{label} is not a retained single-link regular file"
            )
        return _RetainedPublishedFile(base, path, descendant, base._inode(info))
    except BaseException:
        descendant.close()
        raise


def _normal_reference_path(raw_path: Any, *, expected: Path, label: str) -> str:
    if type(raw_path) is not str or not raw_path:
        raise V8PreparationError(f"{label} path is malformed")
    candidate = PurePosixPath(raw_path)
    if (
        candidate.is_absolute()
        or raw_path != candidate.as_posix()
        or any(part in {"", ".", ".."} for part in candidate.parts)
    ):
        raise V8PreparationError(f"{label} path is not normalized repository-relative")
    expected_relative = _repo_relative(expected)
    if raw_path != expected_relative:
        raise V8PreparationError(f"{label} path drifted")
    return raw_path


def _reject_unsafe_manifest_paths(value: Any, label: str) -> None:
    if type(value) is dict:
        for key, item in value.items():
            if key == "path" or key.endswith("_path"):
                if type(item) is not str or not item:
                    raise V8PreparationError(f"{label} {key} is malformed")
                candidate = PurePosixPath(item)
                if (
                    candidate.is_absolute()
                    or item != candidate.as_posix()
                    or any(part in {"", ".", ".."} for part in candidate.parts)
                ):
                    raise V8PreparationError(f"{label} {key} is unsafe")
            _reject_unsafe_manifest_paths(item, label)
    elif type(value) is list:
        for item in value:
            _reject_unsafe_manifest_paths(item, label)


def _reference_identity(
    reference: Any, *, expected: Path, label: str
) -> tuple[str, int]:
    if type(reference) is not dict or set(reference) != {"bytes", "path", "sha256"}:
        raise V8PreparationError(f"{label} reference drifted")
    _normal_reference_path(reference["path"], expected=expected, label=label)
    digest = reference["sha256"]
    size = reference["bytes"]
    if (
        type(digest) is not str
        or re.fullmatch(r"[0-9a-f]{64}", digest) is None
        or type(size) is not int
        or size <= 0
    ):
        raise V8PreparationError(f"{label} identity is malformed")
    return digest, size


def _capture_reference(
    base: Any, reference: Any, *, expected: Path, label: str
) -> tuple[Any, bytes]:
    digest, size = _reference_identity(reference, expected=expected, label=label)
    custody = base._PinnedInput.capture(expected, label, digest)
    try:
        raw = custody.verify()
        if len(raw) != size:
            raise V8PreparationError(f"{label} byte count drifted")
        return custody, raw
    except BaseException:
        custody.close()
        raise


def _capture_export_reference(
    base: Any,
    root_custody: _ExportRootCustody,
    reference: Any,
    *,
    expected: Path,
    label: str,
) -> tuple[_RetainedInput, bytes]:
    digest, size = _reference_identity(reference, expected=expected, label=label)
    relative = expected.relative_to(RUN_ROOT).as_posix()
    retained, raw = _capture_export_input(base, root_custody, relative, label)
    try:
        if len(raw) != size or sha256_bytes(raw) != digest:
            raise V8PreparationError(f"{label} retained content identity drifted")
        return retained, raw
    except BaseException:
        retained.close()
        raise


def _assert_single_link_regular_descriptor(descriptor: int, label: str) -> None:
    info = os.fstat(descriptor)
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise V8PreparationError(f"{label} is not a singly linked regular file")


def _secure_write_export_identity(
    base: Any,
    root_custody: _ExportRootCustody,
    identity_directory: _RetainedDirectoryPath,
    relative: str,
    payload: bytes,
) -> None:
    candidate = PurePosixPath(relative)
    if candidate.is_absolute() or any(
        part in {"", ".", ".."} for part in candidate.parts
    ):
        raise V8PreparationError("V8 source-export identity path is unsafe")
    expected_parent = PurePosixPath(*candidate.parts[:-1])
    if (
        identity_directory.root_custody is not root_custody
        or identity_directory.relative != expected_parent
    ):
        raise V8PreparationError("V8 source-export identity custody route drifted")
    directories = identity_directory
    descriptor: int | None = None
    created_identity: tuple[int, int] | None = None
    try:
        directories.verify("V8 source-export identity directory")
        try:
            descriptor = os.open(
                candidate.name,
                os.O_WRONLY
                | os.O_CREAT
                | os.O_EXCL
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_NOFOLLOW", 0),
                0o600,
                dir_fd=directories.descriptor,
            )
        except FileExistsError:
            existing = _open_export_descendant(
                base,
                root_custody,
                candidate,
                "existing V8 source-export identity",
            )
            try:
                current_payload, existing_info = base._read_fd_stable(
                    existing.descriptor, "existing V8 source-export identity"
                )
                if (
                    not stat.S_ISREG(existing_info.st_mode)
                    or existing_info.st_nlink != 1
                ):
                    raise V8PreparationError(
                        "existing V8 source-export identity must be a singly "
                        "linked regular file"
                    )
                if current_payload != payload:
                    raise V8PreparationError("V8 source-export identity differs")
                existing.verify("existing V8 source-export identity")
                _assert_single_link_regular_descriptor(
                    existing.descriptor, "existing V8 source-export identity"
                )
                return
            finally:
                existing.close()
        base._write_all(descriptor, payload)
        os.fsync(descriptor)
        opened = os.fstat(descriptor)
        created_identity = base._inode(opened)
        named = os.stat(
            candidate.name,
            dir_fd=directories.descriptor,
            follow_symlinks=False,
        )
        if (
            not stat.S_ISREG(opened.st_mode)
            or opened.st_nlink != 1
            or not stat.S_ISREG(named.st_mode)
            or named.st_nlink != 1
            or base._inode(named) != created_identity
        ):
            raise V8PreparationError("V8 source-export identity publication drifted")
        os.fsync(directories.descriptor)
        directories.verify("V8 source-export identity directory")
        _assert_export_root_custody(RUN_ROOT, root_custody)
        reopened = _open_export_descendant(
            base,
            root_custody,
            candidate,
            "published V8 source-export identity",
        )
        try:
            reopened_payload, reopened_info = base._read_fd_stable(
                reopened.descriptor, "published V8 source-export identity"
            )
            if (
                reopened_payload != payload
                or base._inode(reopened_info) != created_identity
            ):
                raise V8PreparationError(
                    "V8 source-export identity canonical publication drifted"
                )
            reopened.verify("published V8 source-export identity")
            directories.verify("V8 source-export identity directory")
            _assert_export_root_custody(RUN_ROOT, root_custody)
            _assert_single_link_regular_descriptor(
                reopened.descriptor, "published V8 source-export identity"
            )
        finally:
            reopened.close()
    finally:
        # Never unlink a failed publication by name.  Even after an inode
        # comparison, the name can be replaced before unlink.  The create-once
        # identity remains a durable failure marker for manual inspection.
        if descriptor is not None:
            os.close(descriptor)


def _require_embedded_hash(value: dict[str, Any], field: str, label: str) -> None:
    embedded = value.get(field)
    claimed = value.get(f"{field}_sha256")
    if type(embedded) is not dict or claimed != sha256_bytes(canonical_json_bytes(embedded)):
        raise V8PreparationError(f"{label} {field} hash binding drifted")


def _exact_cell_inventory(base: Any) -> tuple[tuple[int, str, str], ...]:
    rows: list[tuple[int, str, str]] = []
    for center in base.LEGAL_CENTERS:
        for category in base.accepted.hardened._physical_categories(center):
            rows.append((center, category, category_id(center, category)))
    if len(rows) != CELL_COUNT or len({identifier for _, _, identifier in rows}) != CELL_COUNT:
        raise V8PreparationError("V8 expected physical-cell inventory drifted")
    return tuple(rows)


def _validate_exact_root_plus_units(
    base: Any,
    root: Any,
    cell: Any,
    *,
    center: int,
    category: str,
    label: str,
) -> None:
    root_fd = -1
    cell_fd = -1
    try:
        root_fd = os.dup(root.descriptor)
        cell_fd = os.dup(cell.descriptor)
        os.lseek(root_fd, 0, os.SEEK_SET)
        os.lseek(cell_fd, 0, os.SEEK_SET)
        with ExitStack() as stack:
            root_handle = stack.enter_context(os.fdopen(root_fd, "rb", closefd=True))
            root_fd = -1
            cell_handle = stack.enter_context(os.fdopen(cell_fd, "rb", closefd=True))
            cell_fd = -1
            if root_handle.readline() != f"p cnf {VARIABLES} {ROOT_CLAUSES}\n".encode():
                raise V8PreparationError("V8 cumulative-root header drifted")
            if cell_handle.readline() != f"p cnf {VARIABLES} {CELL_CLAUSES}\n".encode():
                raise V8PreparationError(f"{label} header drifted")
            while True:
                block = root_handle.read(1024 * 1024)
                if not block:
                    break
                if cell_handle.read(len(block)) != block:
                    raise V8PreparationError(f"{label} cumulative-root prefix drifted")
            units = base.category_units(center, category)
            if len(units) != CELL_CLAUSES - ROOT_CLAUSES:
                raise V8PreparationError("V8 physical-unit count drifted")
            suffix = b"".join(f"{unit} 0\n".encode() for unit in units)
            if cell_handle.read() != suffix:
                raise V8PreparationError(f"{label} physical-unit suffix drifted")
    finally:
        if root_fd >= 0:
            os.close(root_fd)
        if cell_fd >= 0:
            os.close(cell_fd)


def _audit_source_packet(
    *,
    base: Any,
    config: dict[str, Any],
    checkpoint_path: Path,
    checkpoint: dict[str, Any],
    head: str,
    root_custody: _ExportRootCustody,
) -> dict[str, Any]:
    """Independently authenticate every source artifact under retained custody."""

    custodies: list[Any] = []
    published: list[Any] = []
    identity_directory: _RetainedDirectoryPath | None = None
    try:
        _assert_export_root_custody(RUN_ROOT, root_custody)
        identity_directory = _open_export_directory_path(
            base,
            root_custody,
            PurePosixPath("artifacts"),
            "V8 source-export identity directory",
        )
        run_custody, run_raw = _capture_export_input(
            base, root_custody, "run_manifest.json", "V8 source-export run manifest"
        )
        campaign_custody, campaign_raw = _capture_export_input(
            base,
            root_custody,
            "artifacts/campaign-manifest.json",
            "V8 source campaign",
        )
        root_producer_custody, root_producer_raw = _capture_export_input(
            base,
            root_custody,
            "artifacts/root-producer-manifest.json",
            "V8 root producer manifest",
        )
        preparation_custody, preparation_raw = _capture_export_input(
            base,
            root_custody,
            "artifacts/preparation-report.json",
            "V8 preparation report",
        )
        custodies.extend(
            [run_custody, campaign_custody, root_producer_custody, preparation_custody]
        )
        run_manifest = _canonical_json_object(run_raw, "V8 source-export run manifest")
        campaign = _canonical_json_object(campaign_raw, "V8 source campaign")
        root_producer = _canonical_json_object(
            root_producer_raw, "V8 root producer manifest"
        )
        preparation = _canonical_json_object(preparation_raw, "V8 preparation report")
        for value, label in (
            (run_manifest, "V8 source-export run manifest"),
            (campaign, "V8 source campaign"),
            (root_producer, "V8 root producer manifest"),
            (preparation, "V8 preparation report"),
        ):
            _reject_unsafe_manifest_paths(value, label)

        expected_production = base.build_production_config_manifest(ROOT)
        production_support = expected_production.get("support")
        target_code = expected_production.get("target_code")
        if type(production_support) is not dict or type(target_code) is not dict:
            raise V8PreparationError("V8 production provenance inventory drifted")
        run_digests = {
            "source": production_support["source"]["sha256"],
            "root_source": production_support["root_source"]["sha256"],
            "exporter": production_support["exporter"]["sha256"],
            "immediate_parent_exporter": production_support[
                "immediate_parent_exporter"
            ]["sha256"],
            "delegated_preparer": production_support["delegated_preparer"]["sha256"],
            "hardened_preparer": production_support["hardened_preparer"]["sha256"],
            "variable_map": production_support["variable_map"]["sha256"],
            "checkpoint": production_support["checkpoint"]["sha256"],
            "preparer": target_code["preparer"]["sha256"],
            "test": target_code["test"]["sha256"],
            "production_config": expected_production["sha256"],
        }
        expected_run_raw = base.build_run_manifest(
            ROOT,
            RUN_ROOT,
            run_digests,
            source_path=SOURCE_PATH,
            root_source_path=ROOT_SOURCE_PATH,
            exporter_path=EXPORTER_PATH,
            immediate_parent_exporter_path=_PARENT.EXPORTER_PATH,
            delegated_preparer_path=base.DELEGATED_PREPARER_PATH,
            hardened_preparer_path=base.HARDENED_PREPARER_PATH,
            variable_map_path=base.VARIABLE_MAP_PATH,
            checkpoint_path=checkpoint_path,
            preparer_path=PREPARER_PATH,
            test_path=TEST_PATH,
        )
        if run_raw != expected_run_raw:
            raise V8PreparationError("V8 source-export run manifest is not exact")

        unsigned_run = {
            key: item for key, item in run_manifest.items() if key != "manifest_sha256"
        }
        if (
            run_manifest.get("schema") != "worktree-run-manifest/v1"
            or run_manifest.get("lane_id") != LANE_ID
            or run_manifest.get("run_id") != RUN_ID
            or run_manifest.get("root") != _repo_relative(RUN_ROOT)
            or run_manifest.get("owner") != checkpoint["owner"]
            or run_manifest.get("base_head") != head
            or run_manifest.get("manifest_sha256")
            != sha256_bytes(canonical_json_bytes(unsigned_run))
        ):
            raise V8PreparationError("V8 source-export run manifest drifted")

        expected_campaign_schema = f"{SOURCE_CELL_PREFIX}-physical-slice-campaign/v1"
        cells = campaign.get("cells")
        if (
            campaign.get("schema") != expected_campaign_schema
            or "v7-two-kalmanson" in campaign.get("schema", "")
            or campaign.get("run_id") != RUN_ID
            or campaign.get("project") != "erdos-97-96-formalization"
            or campaign.get("status") != "PREPARED_LOCAL_ONLY"
            or campaign.get("cell_count") != CELL_COUNT
            or type(cells) is not list
            or len(cells) != CELL_COUNT
        ):
            raise V8PreparationError("V8 source campaign contract drifted")
        campaign_sha256 = sha256_bytes(campaign_raw)
        campaign_ref = preparation.get("campaign_manifest")
        _reference_identity(
            campaign_ref,
            expected=RUN_ROOT / "artifacts/campaign-manifest.json",
            label="V8 preparation campaign",
        )
        if (
            campaign_ref["sha256"] != campaign_sha256
            or campaign_ref["bytes"] != len(campaign_raw)
            or preparation.get("cell_count") != CELL_COUNT
            or preparation.get("schema")
            != f"{SOURCE_CELL_PREFIX}-physical-slice-source-export/v1"
            or preparation.get("run_id") != RUN_ID
            or preparation.get("status") != "PREPARED_LOCAL_ONLY"
            or preparation.get("production_run") is not False
        ):
            raise V8PreparationError("V8 preparation report campaign link drifted")

        source_pins = config["source_support"]
        source = campaign.get("source")
        if type(source) is not dict or any(
            source.get(field) != expected
            for field, expected in (
                ("path", source_pins["source"]["path"]),
                ("sha256", source_pins["source"]["sha256"]),
                ("root_source_path", source_pins["root"]["path"]),
                ("root_source_sha256", source_pins["root"]["sha256"]),
                ("exporter_path", source_pins["exporter"]["path"]),
                ("exporter_sha256", source_pins["exporter"]["sha256"]),
                ("source_commit", config["source_commit"]),
            )
        ):
            raise V8PreparationError("V8 source campaign support pins drifted")
        for field in ("parent_novelty", "delegated_dependencies", "production_config"):
            _require_embedded_hash(source, field, "V8 source campaign")
        production = source["production_config"]
        if (
            production != expected_production
            or production.get("schema") != PRODUCTION_CONFIG_SCHEMA
            or "v7-" in production.get("schema", "")
            or type(production_support) is not dict
        ):
            raise V8PreparationError("V8 production-config provenance schema drifted")
        expected_immediate = production_support.get("immediate_parent_exporter")
        expected_variable_map = production_support.get("variable_map")
        expected_checkpoint = production_support.get("checkpoint")
        delegated_preparer = production_support.get("delegated_preparer")
        hardened_preparer = production_support.get("hardened_preparer")
        if not all(
            type(value) is dict
            for value in (
                expected_immediate,
                expected_variable_map,
                expected_checkpoint,
                delegated_preparer,
                hardened_preparer,
            )
        ):
            raise V8PreparationError("V8 production-config support inventory drifted")
        expected_delegated = base.build_delegated_dependency_manifest(
            ROOT,
            base.DELEGATED_PREPARER_PATH,
            base.HARDENED_PREPARER_PATH,
            {
                "delegated_preparer": delegated_preparer["sha256"],
                "hardened_preparer": hardened_preparer["sha256"],
            },
        )
        if (
            source.get("immediate_parent_exporter_path")
            != expected_immediate["path"]
            or source.get("immediate_parent_exporter_sha256")
            != expected_immediate["sha256"]
            or source.get("variable_map_path") != expected_variable_map["path"]
            or source.get("variable_map_sha256") != expected_variable_map["sha256"]
            or source.get("checkpoint_path") != expected_checkpoint["path"]
            or source.get("checkpoint_sha256") != expected_checkpoint["sha256"]
            or source.get("delegated_dependencies") != expected_delegated
        ):
            raise V8PreparationError("V8 campaign provenance cross-link drifted")

        root = _capture_export_published(
            base, root_custody, "artifacts/cumulative-root.cnf", "V8 cumulative root"
        )
        published.append(root)
        root_metadata = base._inspect_published_cnf(
            root,
            label="V8 cumulative root",
            expected_variables=VARIABLES,
            expected_clauses=ROOT_CLAUSES,
            expected_sha256=source.get("parent_root_sha256"),
        )
        root_producer_sha256 = sha256_bytes(root_producer_raw)
        parent_novelty = source["parent_novelty"]
        immediate_parent_sha256 = parent_novelty.get("immediate_parent_sha256")
        immediate_parent_bytes = parent_novelty.get("immediate_parent_bytes")
        if (
            type(immediate_parent_sha256) is not str
            or re.fullmatch(r"[0-9a-f]{64}", immediate_parent_sha256) is None
            or type(immediate_parent_bytes) is not int
            or immediate_parent_bytes <= 0
        ):
            raise V8PreparationError("V8 immediate-parent novelty identity drifted")
        expected_parent_novelty = {
            "schema": (
                "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
                "v8-two-kalmanson-refinements-parent-novelty/v1"
            ),
            "policy": {
                "parent_scan": "byte-exact-complete-v7-prefix",
                "successor_shape": "byte-exact V7 prefix plus ordered 29-clause suffix",
            },
            "immediate_parent_clause_count_scanned": V7_ROOT_CLAUSES,
            "suffix_clause_count": SUFFIX_CLAUSES,
            "suffix_clauses": [list(clause) for clause in EXPECTED_SUFFIX],
            "strict_new_suffix_indices": list(range(SUFFIX_CLAUSES)),
            "strict_new_suffix_count": SUFFIX_CLAUSES,
            "successor_multiplicity": [1] * SUFFIX_CLAUSES,
            "parent_body_exact_prefix": True,
            "suffix_exact_order": True,
            "immediate_parent_sha256": immediate_parent_sha256,
            "immediate_parent_bytes": immediate_parent_bytes,
            "successor_root_sha256": root_metadata["sha256"],
            "successor_root_bytes": root_metadata["bytes"],
        }
        if parent_novelty != expected_parent_novelty:
            raise V8PreparationError("V8 parent-novelty semantic metadata drifted")
        expected_root_producer_raw = base.build_root_producer(
            root_sha256=root_metadata["sha256"],
            root_bytes=root_metadata["bytes"],
            source_path=source_pins["source"]["path"],
            source_sha256=source_pins["source"]["sha256"],
            root_source_path=source_pins["root"]["path"],
            root_source_sha256=source_pins["root"]["sha256"],
            exporter_path=source_pins["exporter"]["path"],
            exporter_sha256=source_pins["exporter"]["sha256"],
            immediate_parent_exporter_path=source[
                "immediate_parent_exporter_path"
            ],
            immediate_parent_exporter_sha256=source[
                "immediate_parent_exporter_sha256"
            ],
            parent_novelty=expected_parent_novelty,
            delegated_dependencies=source["delegated_dependencies"],
            production_config=source["production_config"],
            checkpoint_path=_repo_relative(checkpoint_path),
            checkpoint_sha256=source["checkpoint_sha256"],
            variable_map_sha256=source["variable_map_sha256"],
            source_commit=config["source_commit"],
        )
        if (
            root_producer_raw != expected_root_producer_raw
            or
            root_producer.get("schema") != base.ROOT_PRODUCER_SCHEMA
            or "v7-two-kalmanson" in root_producer.get("schema", "")
            or root_producer.get("run_id") != RUN_ID
            or root_producer.get("root") != {
                "bytes": root_metadata["bytes"],
                "clauses": ROOT_CLAUSES,
                "sha256": root_metadata["sha256"],
                "variables": VARIABLES,
            }
            or root_producer_sha256 != source.get("parent_producer_sha256")
            or root_producer.get("source_commit") != config["source_commit"]
            or root_producer.get("source_path") != source_pins["source"]["path"]
            or root_producer.get("source_sha256") != source_pins["source"]["sha256"]
            or root_producer.get("root_source_path") != source_pins["root"]["path"]
            or root_producer.get("root_source_sha256") != source_pins["root"]["sha256"]
            or root_producer.get("exporter_path") != source_pins["exporter"]["path"]
            or root_producer.get("exporter_sha256") != source_pins["exporter"]["sha256"]
            or root_producer.get("immediate_parent_exporter_path")
            != source.get("immediate_parent_exporter_path")
            or root_producer.get("immediate_parent_exporter_sha256")
            != source.get("immediate_parent_exporter_sha256")
            or root_producer.get("variable_map_sha256")
            != source.get("variable_map_sha256")
        ):
            raise V8PreparationError("V8 root-producer cross-link drifted")
        _normal_reference_path(
            root_producer.get("checkpoint_path"),
            expected=checkpoint_path,
            label="V8 root-producer checkpoint",
        )
        checkpoint_custody, checkpoint_raw = _capture_unpinned(
            base, checkpoint_path, "V8 root-producer checkpoint"
        )
        custodies.append(checkpoint_custody)
        if root_producer.get("checkpoint_sha256") != sha256_bytes(checkpoint_raw):
            raise V8PreparationError("V8 root-producer checkpoint hash drifted")
        for field in ("parent_novelty", "delegated_dependencies", "production_config"):
            _require_embedded_hash(root_producer, field, "V8 root producer")
            if root_producer[field] != source[field]:
                raise V8PreparationError(f"V8 root-producer {field} cross-link drifted")

        expected_cells = _exact_cell_inventory(base)
        observed_ids: list[str] = []
        expected_campaign_cells: list[dict[str, Any]] = []
        direct_validated: list[str] = []
        total_cnf_bytes = 0
        for ordinal, (expected_center, expected_category, identifier) in enumerate(
            expected_cells
        ):
            cell = cells[ordinal]
            if (
                type(cell) is not dict
                or cell.get("ordinal") != ordinal
                or cell.get("center") != expected_center
                or cell.get("category") != expected_category
                or cell.get("cell_id") != identifier
                or "v7-two-kalmanson-refinements-next-center" in identifier
            ):
                raise V8PreparationError("V8 campaign cell identity drifted")
            directory = RUN_ROOT / "artifacts/cells" / identifier
            cnf_path = directory / f"{identifier}.cnf"
            cnf_digest, cnf_bytes = _reference_identity(
                cell.get("cnf"), expected=cnf_path, label=f"{identifier} CNF"
            )
            cnf = _capture_export_published(
                base,
                root_custody,
                cnf_path.relative_to(RUN_ROOT).as_posix(),
                f"{identifier} CNF",
            )
            published.append(cnf)
            cnf_metadata = base._inspect_published_cnf(
                cnf,
                label=f"{identifier} CNF",
                expected_variables=VARIABLES,
                expected_clauses=CELL_CLAUSES,
                expected_sha256=cnf_digest,
                expected_bytes=cnf_bytes,
            )
            _validate_exact_root_plus_units(
                base,
                root,
                cnf,
                center=expected_center,
                category=expected_category,
                label=f"{identifier} CNF",
            )

            producer_path = directory / "producer-manifest.json"
            wave_path = directory / "wave-manifest.json"
            producer_custody, producer_raw = _capture_export_reference(
                base,
                root_custody,
                cell.get("producer_manifest"),
                expected=producer_path,
                label=f"{identifier} producer manifest",
            )
            wave_custody, wave_raw = _capture_export_reference(
                base,
                root_custody,
                cell.get("wave_manifest"),
                expected=wave_path,
                label=f"{identifier} wave manifest",
            )
            custodies.extend([producer_custody, wave_custody])
            producer = _canonical_json_object(
                producer_raw, f"{identifier} producer manifest"
            )
            wave = _canonical_json_object(wave_raw, f"{identifier} wave manifest")
            _reject_unsafe_manifest_paths(producer, f"{identifier} producer manifest")
            _reject_unsafe_manifest_paths(wave, f"{identifier} wave manifest")
            expected_producer_raw = base.build_producer(
                expected_center,
                expected_category,
                source_pins["source"]["path"],
                source_pins["source"]["sha256"],
                source_pins["root"]["path"],
                source_pins["root"]["sha256"],
                source_pins["exporter"]["path"],
                source_pins["exporter"]["sha256"],
                source["immediate_parent_exporter_path"],
                source["immediate_parent_exporter_sha256"],
                source["variable_map_sha256"],
                root_metadata["sha256"],
                root_producer_sha256,
                source["parent_novelty"],
                source["delegated_dependencies"],
                source["production_config"],
            )
            expected_wave_raw = base.build_wave(
                expected_center,
                expected_category,
                cnf_metadata["sha256"],
                sha256_bytes(expected_producer_raw),
                ordinal,
                source_pins["source"]["sha256"],
                source["variable_map_sha256"],
            )
            if producer_raw != expected_producer_raw or wave_raw != expected_wave_raw:
                raise V8PreparationError(
                    f"{identifier} producer/wave semantic metadata drifted"
                )
            base.validate_wave_manifest(wave)
            source_manifest = producer.get("source_manifest")
            if (
                producer.get("schema") != base.PRODUCER_SCHEMA
                or producer.get("producer_id") != f"{identifier}-{RUN_ID}"
                or producer.get("parent_root_sha256") != root_metadata["sha256"]
                or producer.get("parent_producer_sha256") != root_producer_sha256
                or producer.get("exporter_path") != source_pins["exporter"]["path"]
                or producer.get("exporter_sha256") != source_pins["exporter"]["sha256"]
                or producer.get("immediate_parent_exporter_path")
                != source.get("immediate_parent_exporter_path")
                or producer.get("immediate_parent_exporter_sha256")
                != source.get("immediate_parent_exporter_sha256")
                or producer.get("variable_map_sha256")
                != source.get("variable_map_sha256")
                or type(source_manifest) is not dict
                or source_manifest.get("schema") != base.SOURCE_SCHEMA
                or producer.get("source_manifest_sha256")
                != sha256_bytes(canonical_json_bytes(source_manifest))
                or source_manifest.get("source_id") != identifier
                or source_manifest.get("finite_schema") != base.FINITE_SCHEMA
                or "v7-two-kalmanson" in source_manifest.get("finite_schema", "")
                or source_manifest.get("source_theorem") != SOURCE_THEOREM
                or source_manifest.get("source_path") != source_pins["source"]["path"]
                or source_manifest.get("source_sha256") != source_pins["source"]["sha256"]
                or source_manifest.get("root_source_path") != source_pins["root"]["path"]
                or source_manifest.get("root_source_sha256") != source_pins["root"]["sha256"]
            ):
                raise V8PreparationError("V8 producer/source-manifest cross-link drifted")
            for field in ("parent_novelty", "delegated_dependencies", "production_config"):
                _require_embedded_hash(producer, field, f"{identifier} producer")
                if producer[field] != source[field]:
                    raise V8PreparationError(
                        f"{identifier} producer {field} cross-link drifted"
                    )
            for field in ("delegated_dependencies", "production_config"):
                _require_embedded_hash(source_manifest, field, f"{identifier} source")
                if source_manifest[field] != source[field]:
                    raise V8PreparationError(
                        f"{identifier} source {field} cross-link drifted"
                    )

            encoding = wave.get("encoding")
            execution = wave.get("execution")
            wave_source = wave.get("source")
            if (
                wave.get("schema") != base.WAVE_SCHEMA
                or producer.get("schema") != base.PRODUCER_SCHEMA
                or wave.get("wave_id") != f"{identifier}-{RUN_ID}"
                or wave.get("parent_checkpoint_sha256")
                != root_producer.get("checkpoint_sha256")
                or type(encoding) is not dict
                or encoding.get("cnf_sha256") != cnf_metadata["sha256"]
                or encoding.get("producer_manifest_sha256") != sha256_bytes(producer_raw)
                or encoding.get("variable_map_sha256")
                != producer.get("variable_map_sha256")
                or encoding.get("num_variables") != VARIABLES
                or encoding.get("num_clauses") != CELL_CLAUSES
                or type(execution) is not dict
                or execution.get("shard_id") != ordinal
                or execution.get("shard_count") != CELL_COUNT
                or type(wave_source) is not dict
                or wave_source.get("finite_schema") != base.FINITE_SCHEMA
                or wave_source.get("source_theorem") != SOURCE_THEOREM
                or wave_source.get("ingress_hypotheses_sha256")
                != source_pins["source"]["sha256"]
                or identifier not in wave_source.get("cardinality_scope", "")
            ):
                raise V8PreparationError("V8 wave/producer/CNF cross-link drifted")
            observed_ids.append(identifier)
            total_cnf_bytes += cnf_metadata["bytes"]
            direct = (expected_center, expected_category) in base.DIRECT_SENTINELS
            if direct:
                direct_validated.append(identifier)
            expected_campaign_cells.append(
                {
                    "cell_id": identifier,
                    "center": expected_center,
                    "category": expected_category,
                    "ordinal": ordinal,
                    "cnf": {
                        "path": _repo_relative(cnf_path),
                        "sha256": cnf_metadata["sha256"],
                        "bytes": cnf_metadata["bytes"],
                    },
                    "producer_manifest": {
                        "path": _repo_relative(producer_path),
                        "sha256": sha256_bytes(producer_raw),
                        "bytes": len(producer_raw),
                    },
                    "wave_manifest": {
                        "path": _repo_relative(wave_path),
                        "sha256": sha256_bytes(wave_raw),
                        "bytes": len(wave_raw),
                    },
                    "direct_lean_bytes_validated": direct,
                    "claims": base._claims(),
                }
            )

        if observed_ids != [identifier for _, _, identifier in expected_cells]:
            raise V8PreparationError("V8 source packet cell inventory drifted")
        expected_claims = {
            "exact17_closed": False,
            "proof_verified": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        }
        expected_campaign_source = {
            "path": source_pins["source"]["path"],
            "sha256": source_pins["source"]["sha256"],
            "root_source_path": source_pins["root"]["path"],
            "root_source_sha256": source_pins["root"]["sha256"],
            "exporter_path": source_pins["exporter"]["path"],
            "exporter_sha256": source_pins["exporter"]["sha256"],
            "immediate_parent_exporter_path": expected_immediate["path"],
            "immediate_parent_exporter_sha256": expected_immediate["sha256"],
            "variable_map_path": expected_variable_map["path"],
            "variable_map_sha256": expected_variable_map["sha256"],
            "checkpoint_path": expected_checkpoint["path"],
            "checkpoint_sha256": expected_checkpoint["sha256"],
            "source_commit": config["source_commit"],
            "parent_root_sha256": root_metadata["sha256"],
            "parent_producer_sha256": root_producer_sha256,
            "parent_novelty": expected_parent_novelty,
            "parent_novelty_sha256": sha256_bytes(
                canonical_json_bytes(expected_parent_novelty)
            ),
            "delegated_dependencies": expected_delegated,
            "delegated_dependencies_sha256": sha256_bytes(
                canonical_json_bytes(expected_delegated)
            ),
            "production_config": expected_production,
            "production_config_sha256": sha256_bytes(
                canonical_json_bytes(expected_production)
            ),
        }
        expected_campaign = {
            "schema": expected_campaign_schema,
            "run_id": RUN_ID,
            "project": "erdos-97-96-formalization",
            "status": "PREPARED_LOCAL_ONLY",
            "claims": expected_claims,
            "source": expected_campaign_source,
            "cell_count": CELL_COUNT,
            "cells": expected_campaign_cells,
        }
        if campaign != expected_campaign:
            raise V8PreparationError("V8 campaign semantic metadata is not exact")
        expected_preparation = {
            "schema": f"{SOURCE_CELL_PREFIX}-physical-slice-source-export/v1",
            "run_id": RUN_ID,
            "status": "PREPARED_LOCAL_ONLY",
            "production_run": False,
            "cell_count": CELL_COUNT,
            "direct_lean_cells_validated": len(direct_validated),
            "direct_lean_sentinels": direct_validated,
            "campaign_manifest": {
                "path": _repo_relative(RUN_ROOT / "artifacts/campaign-manifest.json"),
                "sha256": campaign_sha256,
                "bytes": len(campaign_raw),
            },
            "parent_novelty": expected_parent_novelty,
            "parent_novelty_sha256": sha256_bytes(
                canonical_json_bytes(expected_parent_novelty)
            ),
            "delegated_dependencies": expected_delegated,
            "delegated_dependencies_sha256": sha256_bytes(
                canonical_json_bytes(expected_delegated)
            ),
            "production_config": expected_production,
            "production_config_sha256": sha256_bytes(
                canonical_json_bytes(expected_production)
            ),
            "claims": expected_claims,
        }
        if preparation != expected_preparation:
            raise V8PreparationError("V8 preparation semantic metadata is not exact")
        _assert_export_root_custody(RUN_ROOT, root_custody)
        for custody in custodies:
            custody.verify()
        root.verify("V8 cumulative root")
        for artifact in published[1:]:
            artifact.verify("V8 physical cell")

        report = {
            "schema": f"{SOURCE_CELL_PREFIX}-source-export-identity/v1",
            "status": "SOURCE_PACKET_EXPORTED",
            "base_head": head,
            "run_manifest_sha256": sha256_bytes(run_raw),
            "run_manifest_self_sha256": run_manifest["manifest_sha256"],
            "campaign_manifest_sha256": campaign_sha256,
            "root_producer_manifest_sha256": root_producer_sha256,
            "cumulative_root_sha256": root_metadata["sha256"],
            "cell_count": CELL_COUNT,
            "variables": VARIABLES,
            "root_clauses": ROOT_CLAUSES,
            "physical_cell_clauses": CELL_CLAUSES,
            "total_cnf_bytes": total_cnf_bytes,
            "source_theorem": SOURCE_THEOREM,
            "source_support": source_pins,
            "cell_ids_sha256": sha256_bytes(canonical_json_bytes(observed_ids)),
        }
        report["manifest_sha256"] = sha256_bytes(canonical_json_bytes(report))
        _secure_write_export_identity(
            base,
            root_custody,
            identity_directory,
            "artifacts/source-export-identity.json",
            canonical_json_bytes(report),
        )
        _assert_export_root_custody(RUN_ROOT, root_custody)
        return report
    finally:
        for artifact in reversed(published):
            artifact.close()
        for custody in reversed(custodies):
            custody.close()
        if identity_directory is not None:
            identity_directory.close()


def _export_source_packet(
    *, config: dict[str, Any], checkpoint_path: Path, checkpoint: dict[str, Any], head: str
) -> dict[str, Any]:
    """Run only the hardened Lean source-packet exporter; never PIQD.

    Failures close retained descriptors but preserve all filesystem state in
    place.  The create-once route rejects retry until an operator inspects and
    explicitly remediates the partial packet.
    """

    root_custodies: list[_ExportRootCustody] = []
    custody: _ExportRootCustody | None = None
    with _configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head=head,
        root_custody_sink=root_custodies,
    ) as base:
        noop = lambda *_args, **_kwargs: None
        try:
            initialized = base._initialize_run_root_authenticated(
                output_root=RUN_ROOT,
                repo_root=ROOT,
                source_path=SOURCE_PATH,
                root_source_path=ROOT_SOURCE_PATH,
                exporter_path=EXPORTER_PATH,
                immediate_parent_exporter_path=_PARENT.EXPORTER_PATH,
                delegated_preparer_path=base.DELEGATED_PREPARER_PATH,
                hardened_preparer_path=base.HARDENED_PREPARER_PATH,
                variable_map_path=base.VARIABLE_MAP_PATH,
                checkpoint_path=checkpoint_path,
                preparer_path=PREPARER_PATH,
                test_path=TEST_PATH,
            )
            if root_custodies:
                custody = root_custodies[0]
            if initialized.get("status") != "RUN_ROOT_INITIALIZED":
                raise V8PreparationError("V8 source export did not create a fresh run root")
            if len(root_custodies) != 1:
                raise V8PreparationError("V8 source export did not retain root custody")
            result = base._prepare_campaign_authenticated(
                source_commit=config["source_commit"],
                output_root=RUN_ROOT,
                repo_root=ROOT,
                source_path=SOURCE_PATH,
                root_source_path=ROOT_SOURCE_PATH,
                exporter_path=EXPORTER_PATH,
                immediate_parent_exporter_path=_PARENT.EXPORTER_PATH,
                delegated_preparer_path=base.DELEGATED_PREPARER_PATH,
                hardened_preparer_path=base.HARDENED_PREPARER_PATH,
                variable_map_path=base.VARIABLE_MAP_PATH,
                checkpoint_path=checkpoint_path,
                preparer_path=PREPARER_PATH,
                test_path=TEST_PATH,
                commit_verifier=noop,
                dependency_commit_verifier=base.verify_committed_dependency_blobs,
                target_commit_verifier=noop,
            )
            result["source_export_identity"] = _audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=custody,
            )
            if result.get("cell_count") != CELL_COUNT:
                raise V8PreparationError("V8 source exporter cell count drifted")
            return result
        finally:
            if custody is not None:
                _close_export_root_custody(custody)


def _source_export_impl(
    *,
    run_root: Path,
    lane_checkpoint_path: Path,
    config_path: Path,
    control_validator: Callable[..., tuple[dict[str, Any], dict[str, Any], str]],
    packet_exporter: Callable[..., dict[str, Any]],
) -> dict[str, Any]:
    config, checkpoint, head = control_validator(
        run_root=run_root,
        lane_checkpoint_path=lane_checkpoint_path,
        config_path=config_path,
    )
    result = packet_exporter(
        config=config,
        checkpoint_path=lane_checkpoint_path,
        checkpoint=checkpoint,
        head=head,
    )
    if not run_root.is_dir() or run_root.is_symlink():
        raise V8PreparationError("V8 source exporter did not create the exact run root")
    if result.get("cell_count") != CELL_COUNT:
        raise V8PreparationError("V8 source exporter cell count drifted")
    return result


def source_export(
    *,
    run_root: Path,
    lane_checkpoint_path: Path,
    config_path: Path = PRODUCTION_CONFIG_PATH,
) -> dict[str, Any]:
    """Create the exact governed V8 source packet once, without PIQD."""

    return _source_export_impl(
        run_root=run_root,
        lane_checkpoint_path=lane_checkpoint_path,
        config_path=config_path,
        control_validator=_validate_source_export_controls,
        packet_exporter=_export_source_packet,
    )


def preflight_configuration(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 preflight output root drifted")
    return source_static_check(config_path)


def initialize_run_root(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 initialize output root drifted")
    source_static_check(config_path)
    raise V8PreparationError(
        "V8 source export requires a separate generated-root lane checkpoint"
    )


def prepare_campaign(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 prepare output root drifted")
    source_static_check(config_path)
    raise V8PreparationError(
        "V8 source export requires a separate generated-root lane checkpoint"
    )


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    if not operator_args:
        print(json.dumps(source_static_check(), sort_keys=True))
        return 0
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    export_parser = subparsers.add_parser("source-export")
    export_parser.add_argument("--run-root", type=Path, required=True)
    export_parser.add_argument("--lane-checkpoint", type=Path, required=True)
    args = parser.parse_args(operator_args)
    if args.command != "source-export":
        parser.error("unsupported command")
    print(
        json.dumps(
            source_export(
                run_root=args.run_root,
                lane_checkpoint_path=args.lane_checkpoint,
            ),
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
