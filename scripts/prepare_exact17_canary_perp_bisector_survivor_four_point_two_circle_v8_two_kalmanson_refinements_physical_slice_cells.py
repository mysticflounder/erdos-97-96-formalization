"""Finalized, read-only V8 physical-slice source identity gate.

The gate authenticates the committed V8 Lean packet, its generator, the V7
control-plane parents, and the current V8 preparer/miner/runner bytes.  This
module performs no source export itself: a later export checkpoint must first
register the generated root.
"""

from __future__ import annotations

import hashlib
import json
import stat
import subprocess
import sys
from pathlib import Path
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
Authenticate the finalized exact-17 V8 source packet without exporting it.

The static check verifies every committed source and parent pin, every live V8
control-plane pin, and the exact 308/7,409,839/7,409,845 count contract.
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
        metadata = path.lstat()
    except OSError as exc:
        raise V8PreparationError(f"{label} is unavailable") from exc
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise V8PreparationError(f"{label} is not a regular non-symlink file")
    return path.read_bytes()


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
    print(json.dumps(source_static_check(), sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
