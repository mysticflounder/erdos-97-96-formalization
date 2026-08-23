"""Offline V8 theorem miner with one exact runner/miner identity contract."""

from __future__ import annotations

import hashlib
import importlib
import json
import stat
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_model as _PARENT
import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_physical_slice_cells as preparer

PREFIX = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson"
)
MINER_NAME = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson-v8-source-valid-theorem-miner"
)
MINER_SCHEMA = f"{PREFIX}-v8-source-valid-theorem-miner/v1"
MINER_VERSION = "8"
VERIFICATION_SCHEMA = f"{PREFIX}-v8-source-valid-theorem-mine-verification/v1"
MINER_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()
SCANNER_IDENTITY_SCHEMA = f"{PREFIX}-v8-scanner-identity-contract/v1"

SAT_REPLAY_SCHEMA = f"{PREFIX}-v8-independent-sat-replay/v1"
WAVE_MINE_SCHEMA = f"{PREFIX}-v8-wave-only-mine/v1"
WAVE_MINE_LEDGER_SCHEMA = f"{PREFIX}-v8-wave-only-candidate-ledger/v1"
WAVE_MINE_CANDIDATE_SCHEMA = f"{PREFIX}-v8-wave-only-candidate/v1"
ACCEPTANCE_SCHEMA = f"{PREFIX}-v8-canary-acceptance/v1"
RUNNER_RECEIPT_SCHEMAS = {
    "acceptance": ACCEPTANCE_SCHEMA,
    "candidate": WAVE_MINE_CANDIDATE_SCHEMA,
    "candidate_ledger": WAVE_MINE_LEDGER_SCHEMA,
    "mine": WAVE_MINE_SCHEMA,
    "sat_replay": SAT_REPLAY_SCHEMA,
    "verification": VERIFICATION_SCHEMA,
}

SOURCE_VALID_FAMILIES = tuple(_PARENT.SOURCE_VALID_FAMILIES)
SCANNER_DEPENDENCIES = dict(_PARENT.SCANNER_DEPENDENCIES)
MineError = _PARENT.MineError

OPERATOR_HELP = """\
Mine one authenticated V8 two-Kalmanson physical cell offline.

The command is fail-closed until the V8 Lean packet and exact clause count are
frozen.  It never contacts PIQD or a SAT solver.
"""


class V8MinerIdentityError(RuntimeError):
    """The runner/miner identity contract is incomplete or has drifted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _read_regular(path: Path) -> bytes:
    metadata = path.lstat()
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise V8MinerIdentityError("V8 miner is not a regular non-symlink file")
    return path.read_bytes()


def scanner_script_identity() -> dict[str, str | int]:
    raw = _read_regular(ROOT / MINER_RELATIVE)
    return {
        "path": MINER_RELATIVE,
        "sha256": sha256_bytes(raw),
        "bytes": len(raw),
    }


def build_scanner_identity(
    *,
    candidate_count: int,
    candidate_families: tuple[str, ...] | list[str] = SOURCE_VALID_FAMILIES,
    scanner_dependencies: Mapping[str, Any] = SCANNER_DEPENDENCIES,
) -> dict[str, Any]:
    if type(candidate_count) is not int or candidate_count < 0:
        raise V8MinerIdentityError("candidate_count must be a nonnegative integer")
    families = tuple(candidate_families)
    if families != SOURCE_VALID_FAMILIES:
        raise V8MinerIdentityError("candidate family inventory drifted")
    dependencies = dict(scanner_dependencies)
    if dependencies != SCANNER_DEPENDENCIES:
        raise V8MinerIdentityError("scanner dependency inventory drifted")
    script = scanner_script_identity()
    return {
        "schema": SCANNER_IDENTITY_SCHEMA,
        "scanner_name": MINER_NAME,
        "scanner_schema": MINER_SCHEMA,
        "verification_schema": VERIFICATION_SCHEMA,
        "scanner_version": MINER_VERSION,
        "scanner_script_path": script["path"],
        "scanner_script_sha256": script["sha256"],
        "scanner_script_bytes": script["bytes"],
        "candidate_count": candidate_count,
        "candidate_families": list(families),
        "scanner_dependencies": dependencies,
        "scanner_dependencies_sha256": sha256_bytes(
            canonical_json_bytes(dependencies)
        ),
        "runner_receipt_schemas": dict(RUNNER_RECEIPT_SCHEMAS),
    }


IDENTITY_KEYS = frozenset(build_scanner_identity(candidate_count=0))


def validate_scanner_identity(
    value: Mapping[str, Any], *, candidate_count: int
) -> dict[str, Any]:
    if type(value) is not dict or set(value) != IDENTITY_KEYS:
        raise V8MinerIdentityError("scanner identity keys drifted")
    expected = build_scanner_identity(candidate_count=candidate_count)
    for field, expected_value in expected.items():
        if value.get(field) != expected_value:
            raise V8MinerIdentityError(f"scanner identity field drifted: {field}")
    return expected


def _configure_parent_for_v8() -> None:
    # The V7 miner's base implementation is reusable only after source pins
    # are complete.  Rebind every externally visible scanner identity first.
    base = _PARENT._BASE
    for name, value in {
        "MINER_NAME": MINER_NAME,
        "MINER_SCHEMA": MINER_SCHEMA,
        "MINER_VERSION": MINER_VERSION,
        "VERIFICATION_SCHEMA": VERIFICATION_SCHEMA,
        "MINER_RELATIVE": MINER_RELATIVE,
        "SOURCE_VALID_FAMILIES": SOURCE_VALID_FAMILIES,
        "SCANNER_DEPENDENCIES": SCANNER_DEPENDENCIES,
    }.items():
        setattr(base, name, value)


_configure_parent_for_v8()


def validate_committed_dependencies() -> None:
    _PARENT.validate_committed_dependencies()
    preparer.validate_committed_dependencies()
    # This checks that the runner and miner read the same live, immutable byte
    # identity before a future source-finalized launch.
    validate_scanner_identity(
        build_scanner_identity(candidate_count=0), candidate_count=0
    )


def __getattr__(name: str) -> Any:
    return getattr(_PARENT, name)


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    validate_committed_dependencies()
    preparer.require_production_pins()
    runner = importlib.import_module(
        "run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
        "v8_two_kalmanson_refinements_sat_portfolio"
    )
    _PARENT._BASE.runner = runner
    return _PARENT._BASE.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
