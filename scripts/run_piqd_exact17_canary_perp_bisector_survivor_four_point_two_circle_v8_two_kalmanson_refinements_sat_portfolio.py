"""Fresh fail-closed V8 PIQD portfolio control plane.

The runner reuses the authenticated V7 custody implementation but gives V8 a
new project, output root, receipt namespace, and exact scanner identity
contract.  V8 cannot prepare or launch until its Lean packet is frozen under a
finalized preparation-config schema.
"""

from __future__ import annotations

import hashlib
import json
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_physical_slice_cells as preparer
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as _PARENT

PREFIX = miner.PREFIX
LANE_ID = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson-refinements-sat-portfolio-v8-20260823"
)
RUN_ID = "sat-profile-portfolio-v8"
RUN_OWNER = LANE_ID.removesuffix("-20260823")
BASE_HEAD = preparer.BASE_HEAD
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
PROJECT = (
    "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-"
    "circle-v8-two-kalmanson-v8-sat"
)

REQUESTED_CORE_LIMIT = 1
MAX_ACTIVE_JOBS = 12
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
CELL_COUNT = 76
NUM_VARIABLES = 308
# Frozen from the committed V8 root and physical-slice coverage theorem.
ROOT_NUM_CLAUSES = preparer.ROOT_CLAUSES
NUM_CLAUSES = preparer.CELL_CLAUSES

CAMPAIGN_SCHEMA = f"{PREFIX}-v8-sat-profile-campaign/v1"
LAUNCH_SCHEMA = f"{PREFIX}-v8-sat-profile-launch/v1"
RESULT_SCHEMA = f"{PREFIX}-v8-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = miner.ACCEPTANCE_SCHEMA
SAT_REPLAY_SCHEMA = miner.SAT_REPLAY_SCHEMA
WAVE_MINE_SCHEMA = miner.WAVE_MINE_SCHEMA
WAVE_MINE_LEDGER_SCHEMA = miner.WAVE_MINE_LEDGER_SCHEMA
WAVE_MINE_CANDIDATE_SCHEMA = miner.WAVE_MINE_CANDIDATE_SCHEMA
MINE_VERIFICATION_SCHEMA = miner.VERIFICATION_SCHEMA
UNSAT_REPLAY_SCHEMA = f"{PREFIX}-v8-independent-unsat-replay/v1"
IDENTITY_DERIVATION_SCHEMA = f"{PREFIX}-v8-sat-profile-identity-derivation/v1"
RUNNER_RECEIPT_SCHEMAS = {
    "acceptance": ACCEPTANCE_SCHEMA,
    "candidate": WAVE_MINE_CANDIDATE_SCHEMA,
    "candidate_ledger": WAVE_MINE_LEDGER_SCHEMA,
    "mine": WAVE_MINE_SCHEMA,
    "sat_replay": SAT_REPLAY_SCHEMA,
    "verification": MINE_VERIFICATION_SCHEMA,
}

SOURCE_CELL_PREFIX = preparer.SOURCE_CELL_PREFIX
CANARY_SOURCE_CELL_ID = f"{SOURCE_CELL_PREFIX}-next-center-02-physical-none"
PORTFOLIO_CELL_SUFFIX = "sat-profile-cadical-1core-3600s"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-{PORTFOLIO_CELL_SUFFIX}"

OPERATOR_HELP = """\
Govern the fresh exact-17 V8 PIQD portfolio.

Commands remain fail-closed until the V8 Lean packet and exact source packet
identities are frozen.  Runtime policy is 1 solver core per job, at most 12
active jobs, and 3600-second solve and replay limits.
"""


class V8PortfolioError(RuntimeError):
    """The V8 control-plane identity or route contract drifted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def expected_scanner_identity(*, candidate_count: int) -> dict[str, Any]:
    identity = miner.build_scanner_identity(candidate_count=candidate_count)
    if identity["runner_receipt_schemas"] != RUNNER_RECEIPT_SCHEMAS:
        raise V8PortfolioError("runner/miner receipt schema contract drifted")
    return identity


def validate_scanner_identity_contract(
    identity: Mapping[str, Any], *, candidate_count: int
) -> dict[str, Any]:
    """Check every cross-module identity field by exact equality."""

    try:
        validated = miner.validate_scanner_identity(
            identity, candidate_count=candidate_count
        )
    except miner.V8MinerIdentityError as exc:
        raise V8PortfolioError(str(exc)) from exc
    expected = expected_scanner_identity(candidate_count=candidate_count)
    if validated != expected:
        raise V8PortfolioError("runner/miner scanner identity contract drifted")
    return expected


def scanner_identity_from_ledger(ledger: Mapping[str, Any]) -> dict[str, Any]:
    """Normalize a real miner ledger into the canonical V8 identity object."""

    candidates = ledger.get("candidates")
    scanner = ledger.get("scanner")
    families = ledger.get("source_valid_family_inventory")
    dependencies = ledger.get("scanner_dependencies")
    inventory = ledger.get("family_inventory")
    if type(candidates) is not list:
        raise V8PortfolioError("candidate ledger candidates are malformed")
    if type(scanner) is not dict:
        raise V8PortfolioError("candidate ledger scanner is malformed")
    if families != list(miner.SOURCE_VALID_FAMILIES):
        raise V8PortfolioError("candidate family inventory drifted")
    if dependencies != miner.SCANNER_DEPENDENCIES:
        raise V8PortfolioError("scanner dependency inventory drifted")
    if type(inventory) is not dict or type(inventory.get("family_candidate_counts")) is not dict:
        raise V8PortfolioError("candidate family counts are malformed")
    observed_counts = {
        family: sum(
            type(candidate) is dict and candidate.get("family") == family
            for candidate in candidates
        )
        for family in miner.SOURCE_VALID_FAMILIES
    }
    if inventory["family_candidate_counts"] != observed_counts:
        raise V8PortfolioError("candidate family counts drifted")
    script = miner.scanner_script_identity()
    expected_scanner = {
        "name": miner.MINER_NAME,
        "schema": miner.MINER_SCHEMA,
        "version": miner.MINER_VERSION,
        "source_path": script["path"],
        "source_sha256": script["sha256"],
    }
    if scanner != expected_scanner:
        raise V8PortfolioError("candidate ledger scanner identity drifted")
    return miner.build_scanner_identity(candidate_count=len(candidates))


def validate_real_miner_ledger(ledger: Mapping[str, Any]) -> dict[str, Any]:
    identity = scanner_identity_from_ledger(ledger)
    return validate_scanner_identity_contract(
        identity, candidate_count=len(ledger["candidates"])
    )


def route_contract() -> dict[str, str]:
    return {
        "output_root": OUTPUT_ROOT.relative_to(ROOT).as_posix(),
        "project": PROJECT,
        "source_run_root": preparer.RUN_ROOT.relative_to(ROOT).as_posix(),
        "miner": miner.MINER_RELATIVE,
        "preparer": preparer.PREPARER_PATH.relative_to(ROOT).as_posix(),
    }


def validate_committed_dependencies() -> None:
    # The finalized preparer pins the committed V7 control-plane parents.  A
    # direct V7 validation here would reject V8's intentional route rebinding.
    preparer.validate_committed_dependencies()
    miner.validate_committed_dependencies()
    validate_scanner_identity_contract(
        miner.build_scanner_identity(candidate_count=0), candidate_count=0
    )


_BASE = _PARENT._BASE
_BASE_PREPARE_PORTFOLIO = _BASE.prepare_portfolio
_BASE_STATIC_CHECK = _BASE.static_check
_BASE_START_CANARY = _BASE.start_canary
_BASE_START_REST = _BASE.start_rest
_BASE_VALIDATE_MINE_INVENTORY = _BASE._validate_mine_inventory


def _configure_base() -> None:
    script = miner.scanner_script_identity()
    replacements = {
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "BASE_HEAD": BASE_HEAD,
        "OUTPUT_ROOT": OUTPUT_ROOT,
        "PROJECT": PROJECT,
        "REQUESTED_CORE_LIMIT": REQUESTED_CORE_LIMIT,
        "MAX_ACTIVE_JOBS": MAX_ACTIVE_JOBS,
        "SOLVE_TIMEOUT_S": SOLVE_TIMEOUT_S,
        "REPLAY_TIMEOUT_S": REPLAY_TIMEOUT_S,
        "CELL_COUNT": CELL_COUNT,
        "NUM_VARIABLES": NUM_VARIABLES,
        "ROOT_NUM_CLAUSES": ROOT_NUM_CLAUSES,
        "NUM_CLAUSES": NUM_CLAUSES,
        "CAMPAIGN_SCHEMA": CAMPAIGN_SCHEMA,
        "LAUNCH_SCHEMA": LAUNCH_SCHEMA,
        "RESULT_SCHEMA": RESULT_SCHEMA,
        "ACCEPTANCE_SCHEMA": ACCEPTANCE_SCHEMA,
        "SAT_REPLAY_SCHEMA": SAT_REPLAY_SCHEMA,
        "WAVE_MINE_SCHEMA": WAVE_MINE_SCHEMA,
        "WAVE_MINE_LEDGER_SCHEMA": WAVE_MINE_LEDGER_SCHEMA,
        "WAVE_MINE_CANDIDATE_SCHEMA": WAVE_MINE_CANDIDATE_SCHEMA,
        "MINE_VERIFICATION_SCHEMA": MINE_VERIFICATION_SCHEMA,
        "UNSAT_REPLAY_SCHEMA": UNSAT_REPLAY_SCHEMA,
        "IDENTITY_DERIVATION_SCHEMA": IDENTITY_DERIVATION_SCHEMA,
        "MINER_RELATIVE": miner.MINER_RELATIVE,
        "MINER_SHA256": script["sha256"],
        "MINER_BYTES": script["bytes"],
        "MINER_NAME": miner.MINER_NAME,
        "MINER_SCHEMA": miner.MINER_SCHEMA,
        "MINER_VERSION": miner.MINER_VERSION,
        "PINNED_SOURCE_VALID_FAMILIES": miner.SOURCE_VALID_FAMILIES,
        "CANARY_SOURCE_CELL_ID": CANARY_SOURCE_CELL_ID,
        "CANARY_PORTFOLIO_CELL_ID": CANARY_PORTFOLIO_CELL_ID,
        "PRODUCTION_PINS_FINALIZED": False,
    }
    for name, value in replacements.items():
        setattr(_BASE, name, value)
    _BASE.CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    _BASE.RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
    _BASE.CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"


def _validate_mine_inventory_v8(
    ledger: Mapping[str, Any], candidates: list[Any], canary: Mapping[str, Any], assignment_sha256: str
) -> None:
    _BASE_VALIDATE_MINE_INVENTORY(ledger, candidates, canary, assignment_sha256)
    validate_real_miner_ledger(ledger)


def _require_v8_ready() -> None:
    validate_committed_dependencies()
    preparer.require_production_pins()


def _prepare_portfolio_v8(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    if output_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 prepare output root drifted")
    _require_v8_ready()
    return _BASE_PREPARE_PORTFOLIO(output_root=output_root)


def _static_check_v8(
    *, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 static-check route drifted")
    _require_v8_ready()
    return _BASE_STATIC_CHECK(root=root, run_root=run_root)


def _start_canary_v8(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 canary route drifted")
    _require_v8_ready()
    return _BASE_START_CANARY(base_url=base_url, root=root, run_root=run_root)


def _start_rest_v8(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 rest route drifted")
    _require_v8_ready()
    return _BASE_START_REST(base_url=base_url, root=root, run_root=run_root)


def _validate_runtime_entrypoint_routes() -> None:
    expected = {
        "prepare_portfolio": _prepare_portfolio_v8,
        "static_check": _static_check_v8,
        "start_canary": _start_canary_v8,
        "start_rest": _start_rest_v8,
    }
    for name, route in expected.items():
        if getattr(_BASE, name) is not route:
            raise V8PortfolioError(f"V8 runtime entrypoint route drifted: {name}")


_configure_base()
_BASE._validate_mine_inventory = _validate_mine_inventory_v8
_BASE.prepare_portfolio = _prepare_portfolio_v8
_BASE.static_check = _static_check_v8
_BASE.start_canary = _start_canary_v8
_BASE.start_rest = _start_rest_v8


def prepare_portfolio(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    return _prepare_portfolio_v8(output_root=output_root)


def static_check(*, root: Path = ROOT, run_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    return _static_check_v8(root=root, run_root=run_root)


def start_canary(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _start_canary_v8(base_url=base_url, root=root, run_root=run_root)


def start_rest(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _start_rest_v8(base_url=base_url, root=root, run_root=run_root)


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    _validate_runtime_entrypoint_routes()
    _require_v8_ready()
    return _BASE.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
