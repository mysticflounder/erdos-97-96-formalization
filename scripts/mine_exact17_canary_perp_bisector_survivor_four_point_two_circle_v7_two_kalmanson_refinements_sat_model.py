"""Offline theorem miner for one authenticated V7 7,409,816-clause cell."""

from __future__ import annotations

import importlib.util
import stat
import subprocess
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as runner

BASE_MINER_RELATIVE = (
    "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "v5_canary_two_kalmanson_refinements_sat_model.py"
)
BASE_MINER_PATH = ROOT / BASE_MINER_RELATIVE
BASE_MINER_COMMIT = "0e33e3bb377fa0c577daf82b307aade0e47a9a7c"
BASE_MINER_SHA256 = "da467541586eaecd960f29f6b3200e6917ee121e46e6100ff4f434c9f7e39a82"
BASE_MINER_BYTES = 53_680

MINER_NAME = (
    "exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-"
    "source-valid-theorem-miner"
)
MINER_SCHEMA = (
    "p97-exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-"
    "source-valid-theorem-miner/v1"
)
MINER_VERSION = "7"
VERIFICATION_SCHEMA = (
    "p97-exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-"
    "source-valid-theorem-mine-verification/v1"
)
MINER_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()

OPERATOR_HELP = """\
Mine one authenticated V7 two-Kalmanson physical cell offline.

The input must be one of the 76 frozen cells with 308 variables and 7,409,816
clauses.  The miner never contacts PIQD or a SAT solver.

required options:
  --run-root PATH
  --cell-id ID
  --output-dir PATH

optional action:
  --verify-existing
"""


def _read_regular(path: Path) -> bytes:
    metadata = path.lstat()
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise RuntimeError("committed V6 miner custody shape drifted")
    return path.read_bytes()


def validate_committed_dependencies() -> None:
    runner.validate_committed_dependencies()
    live = _read_regular(BASE_MINER_PATH)
    if len(live) != BASE_MINER_BYTES or runner.sha256_bytes(live) != BASE_MINER_SHA256:
        raise RuntimeError("committed V6 miner live bytes drifted")
    committed = subprocess.run(
        ["git", "show", f"{BASE_MINER_COMMIT}:{BASE_MINER_RELATIVE}"],
        cwd=ROOT,
        check=True,
        capture_output=True,
    ).stdout
    if committed != live:
        raise RuntimeError("committed V6 miner blob drifted")


def _load_base() -> Any:
    spec = importlib.util.spec_from_file_location(
        "exact17_v7_twok_committed_v6_miner", BASE_MINER_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load committed V6 miner")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


_BASE = _load_base()
for _name, _value in {
    "runner": runner,
    "MINER_NAME": MINER_NAME,
    "MINER_SCHEMA": MINER_SCHEMA,
    "MINER_VERSION": MINER_VERSION,
    "VERIFICATION_SCHEMA": VERIFICATION_SCHEMA,
    "MINER_RELATIVE": MINER_RELATIVE,
    "NUM_VARIABLES": 308,
    "NUM_CLAUSES": 7_409_816,
}.items():
    setattr(_BASE, _name, _value)

SOURCE_VALID_FAMILIES = _BASE.SOURCE_VALID_FAMILIES
SCANNER_DEPENDENCIES = _BASE.SCANNER_DEPENDENCIES
MineError = _BASE.MineError


def __getattr__(name: str) -> Any:
    return getattr(_BASE, name)


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    validate_committed_dependencies()
    return _BASE.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
