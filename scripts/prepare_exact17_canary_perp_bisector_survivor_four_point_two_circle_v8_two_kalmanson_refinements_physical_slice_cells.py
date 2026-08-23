"""Fail-closed V8 physical-slice preparation adapter.

V8 is a fresh successor of V7.  The adapter intentionally refuses to emit a
packet until the V8 Lean root, coverage theorem, exporter, counts, and source
digests are frozen in the V8 preparation config.  No V7 output path is ever a
default of a V8 callable.
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

PARENT_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v7_two_kalmanson_refinements_physical_slice_cells.py"
)
PARENT_PATH = ROOT / PARENT_RELATIVE
PARENT_COMMIT = "1fe86e292b6d112ee98052c443b92ca4b84354ca"
PARENT_SHA256 = "e134b37a4ead69df76598574881e2b45c2ef59046e024c82d4e82427a5885bc9"
PARENT_BYTES = 25_281

LANE_ID = "exact17-v8-two-kalmanson-successor-preparer-20260823"
RUN_ID = "preparation-v1"
RUN_OWNER = "exact17-fourpoint-v8-preparer"
BASE_HEAD = "dbd449d772908af330686d6ddde7df7a6d5026b0"
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
ROOT_SOURCE_PATH = ROOT / ROOT_SOURCE_RELATIVE
SOURCE_PATH = ROOT / SOURCE_RELATIVE
EXPORTER_PATH = ROOT / EXPORTER_RELATIVE
PREPARER_PATH = Path(__file__).resolve()
TEST_PATH = ROOT / (
    "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v8_two_kalmanson_refinements_physical_slice_cells.py"
)
CHECKPOINT_PATH = ROOT / (
    ".codex/worktree-checkpoints/exact17-v8-control-plane-20260823.json"
)
PRODUCTION_CONFIG_RELATIVE = Path(
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "preparation-config.json"
)
PRODUCTION_CONFIG_PATH = ROOT / PRODUCTION_CONFIG_RELATIVE
PRODUCTION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson-refinements-preparation-config/v1"
)
SOURCE_CELL_PREFIX = (
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "refinements"
)

OPERATOR_HELP = """\
Prepare the fresh exact-17 V8 physical packet offline.

Production is fail-closed until the V8 Lean source and packet identities are
frozen in the V8 preparation config.  This command never contacts PIQD.
"""


class V8PreparationError(RuntimeError):
    """A V8 source or route contract is incomplete or has drifted."""


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


def _strict_config(path: Path = PRODUCTION_CONFIG_PATH) -> dict[str, Any]:
    raw = _read_regular(path, "V8 preparation config")
    try:
        value = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise V8PreparationError("V8 preparation config is not strict JSON") from exc
    required = {
        "base_head",
        "blocker",
        "generated_root",
        "lane_id",
        "production_pins_finalized",
        "schema",
        "source_paths",
    }
    if type(value) is not dict or set(value) != required:
        raise V8PreparationError("V8 preparation config keys drifted")
    if value["schema"] != PRODUCTION_CONFIG_SCHEMA:
        raise V8PreparationError("V8 preparation config schema drifted")
    if value["base_head"] != BASE_HEAD or value["lane_id"] != LANE_ID:
        raise V8PreparationError("V8 preparation config lane binding drifted")
    if value["generated_root"] != RUN_ROOT.relative_to(ROOT).as_posix():
        raise V8PreparationError("V8 preparation config output root drifted")
    expected_paths = {
        "root": ROOT_SOURCE_RELATIVE,
        "source": SOURCE_RELATIVE,
        "exporter": EXPORTER_RELATIVE,
    }
    if value["source_paths"] != expected_paths:
        raise V8PreparationError("V8 preparation config source routes drifted")
    return value


def validate_committed_dependencies() -> None:
    """Authenticate the immutable V7 implementation inherited by V8."""

    _PARENT.validate_committed_dependencies()
    live = _read_regular(PARENT_PATH, "committed V7 preparer")
    if len(live) != PARENT_BYTES or sha256_bytes(live) != PARENT_SHA256:
        raise V8PreparationError("committed V7 preparer live bytes drifted")
    try:
        committed = subprocess.run(
            ["git", "show", f"{PARENT_COMMIT}:{PARENT_RELATIVE}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
    except (OSError, subprocess.CalledProcessError) as exc:
        raise V8PreparationError("committed V7 preparer blob unavailable") from exc
    if committed != live:
        raise V8PreparationError("committed V7 preparer blob drifted")


def require_production_pins(path: Path = PRODUCTION_CONFIG_PATH) -> dict[str, Any]:
    config = _strict_config(path)
    if config["production_pins_finalized"] is not True:
        blocker = config["blocker"]
        if type(blocker) is not str or not blocker:
            raise V8PreparationError("V8 source pins are incomplete")
        raise V8PreparationError(f"V8 source pins are incomplete: {blocker}")
    # The provisional schema deliberately has no support/digest block.  A
    # finalized flag under this schema is therefore a tamper, not authority.
    raise V8PreparationError(
        "V8 source pins claim finality without the finalized support schema"
    )


def category_id(raw: str) -> str:
    parent_prefix = _PARENT.SOURCE_CELL_PREFIX
    if not raw.startswith(parent_prefix):
        raise V8PreparationError("V8 source cell does not use the V7 parent prefix")
    return SOURCE_CELL_PREFIX + raw[len(parent_prefix) :]


def route_contract() -> dict[str, str]:
    return {
        "run_root": RUN_ROOT.relative_to(ROOT).as_posix(),
        "root_source": ROOT_SOURCE_RELATIVE,
        "source": SOURCE_RELATIVE,
        "exporter": EXPORTER_RELATIVE,
        "config": PRODUCTION_CONFIG_RELATIVE.as_posix(),
    }


def preflight_configuration(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 preflight output root drifted")
    validate_committed_dependencies()
    require_production_pins(config_path)
    raise AssertionError("unreachable")


def initialize_run_root(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 initialize output root drifted")
    validate_committed_dependencies()
    require_production_pins(config_path)
    raise AssertionError("unreachable")


def prepare_campaign(
    *, config_path: Path = PRODUCTION_CONFIG_PATH, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    if run_root != RUN_ROOT:
        raise V8PreparationError("V8 prepare output root drifted")
    validate_committed_dependencies()
    require_production_pins(config_path)
    raise AssertionError("unreachable")


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    preflight_configuration()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
