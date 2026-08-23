"""Code-first, fail-closed V7 PIQD portfolio control plane.

The implementation delegates custody and replay mechanics to the exact
committed V6 runner, while replacing every campaign identity with the V7
two-Kalmanson physical packet: a 7,409,810-clause root and 76 physical cells,
each with 308 variables and 7,409,816 clauses.  Production is deliberately
disabled until the V7 source campaign and its byte identities are frozen.
"""

from __future__ import annotations

import importlib.util
import stat
import subprocess
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_physical_slice_cells as preparer

BASE_RUNNER_RELATIVE = (
    "scripts/run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v5_canary_two_kalmanson_refinements_sat_portfolio.py"
)
BASE_RUNNER_PATH = ROOT / BASE_RUNNER_RELATIVE
BASE_RUNNER_COMMIT = "0e33e3bb377fa0c577daf82b307aade0e47a9a7c"
BASE_RUNNER_SHA256 = "52fa452b6686bb18eafdb036d6e3524573aeb75600c08f76bc23db3da3d2787f"
BASE_RUNNER_BYTES = 343_542

LANE_ID = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-"
    "kalmanson-refinements-sat-portfolio-v7-20260823"
)
RUN_ID = "sat-profile-portfolio-v7"
RUN_OWNER = LANE_ID.removesuffix("-20260823")
BASE_HEAD = preparer.BASE_HEAD
CONTROL_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-v7-two-kalmanson-control-plane-20260823.json"
)
SOURCE_PREPARER_RELATIVE = preparer.PREPARER_PATH.relative_to(ROOT).as_posix()
SOURCE_PREPARATION_CONFIG_RELATIVE = preparer.PRODUCTION_CONFIG_RELATIVE.as_posix()
RUNNER_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v7_two_kalmanson_refinements_sat_portfolio.py"
)
MINER_RELATIVE = (
    "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "v7_two_kalmanson_refinements_sat_model.py"
)
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-v7-two-kalmanson-successor-preparer-20260823/"
    "preparation-v1"
)
EXPECTED_SOURCE_LANE_ID = preparer.LANE_ID
EXPECTED_SOURCE_RUN_ID = preparer.RUN_ID
EXPECTED_SOURCE_BASE_HEAD = preparer.BASE_HEAD
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

PORTFOLIO_CELL_SUFFIX = "canary-two-kalmanson-v7-sat-profile-v1"
SOURCE_CELL_PREFIX = (
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "refinements"
)

OPERATOR_HELP = """\
Run the gated V7 two-Kalmanson 76-cell SAT portfolio.

The source root has 7,409,810 clauses.  Every physical cell has 308 variables
and 7,409,816 clauses.  Production requires frozen source and portfolio byte
identities before any PIQD submission is permitted.

commands:
  derive-identities
  prepare
  static-check
  start-canary
  start-rest

options:
  --base-url URL
  --source-campaign-sha256 SHA256
  --source-campaign-bytes BYTES
  --source-run-manifest-sha256 SHA256
  --source-run-manifest-bytes BYTES
  --source-preparer-commit COMMIT
"""


def _read_regular(path: Path, label: str) -> bytes:
    metadata = path.lstat()
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise RuntimeError(f"{label} custody shape drifted")
    return path.read_bytes()


def _verify_base_runner() -> None:
    live = _read_regular(BASE_RUNNER_PATH, BASE_RUNNER_RELATIVE)
    if len(live) != BASE_RUNNER_BYTES or preparer._sha256(live) != BASE_RUNNER_SHA256:
        raise RuntimeError("committed V6 runner live bytes drifted")
    committed = subprocess.run(
        ["git", "show", f"{BASE_RUNNER_COMMIT}:{BASE_RUNNER_RELATIVE}"],
        cwd=ROOT,
        check=True,
        capture_output=True,
    ).stdout
    if committed != live:
        raise RuntimeError("committed V6 runner blob drifted")


def validate_committed_dependencies() -> None:
    preparer.validate_committed_dependencies()
    _verify_base_runner()


def _load_base() -> Any:
    spec = importlib.util.spec_from_file_location(
        "exact17_v7_twok_committed_v6_runner", BASE_RUNNER_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load committed V6 runner")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


_BASE = _load_base()
PortfolioRunnerError = _BASE.PortfolioRunnerError


def _transform_source_cell(
    *,
    source_cell: Mapping[str, Any],
    ordinal: int,
    cnf: bytes,
    source_producer_raw: bytes,
    source_wave_raw: bytes,
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Validate and transform one authenticated V7 physical cell."""

    source_id = source_cell.get("cell_id")
    _BASE._require(type(source_id) is str, "source cell id drifted")
    _BASE._require(
        source_id.startswith(f"{SOURCE_CELL_PREFIX}-next-center-"),
        "source cell id is not V7-owned",
    )
    _BASE._require(source_cell.get("ordinal") == ordinal, "source cell ordinal drifted")
    _BASE._require(
        type(source_cell.get("direct_lean_bytes_validated")) is bool
        and type(source_cell.get("center")) is int
        and type(source_cell.get("category")) is str,
        "source cell physical/Lean validation drifted",
    )
    source_producer = _BASE._strict_json(source_producer_raw, "source producer")
    source_wave = _BASE._strict_json(source_wave_raw, "source wave")
    _BASE.validate_wave_manifest(source_wave)
    variables, clauses = _BASE.scan_dimacs(cnf)
    _BASE._require(
        (variables, clauses) == (_BASE.NUM_VARIABLES, _BASE.NUM_CLAUSES),
        "source cell DIMACS dimensions drifted",
    )
    source_manifest = source_producer.get("source_manifest")
    production_config = source_producer.get("production_config")
    _BASE._require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == _BASE.EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == _BASE.EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == _BASE.EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == _BASE.EXPECTED_FINITE_SCHEMA,
        "source producer Lean ingress drifted",
    )
    _BASE._require_source_production_config(
        production_config,
        source_preparer_commit=source_preparer_commit,
        label="source producer",
    )
    source_encoding = source_wave.get("encoding")
    source_execution = source_wave.get("execution")
    _BASE._require(
        source_producer.get("backend") == _BASE.BACKEND
        and source_producer.get("solver_profile") == _BASE.SOURCE_SOLVER_PROFILE
        and source_producer.get("query_polarity") == _BASE.QUERY_POLARITY,
        "source producer profile drifted",
    )
    cnf_sha256 = _BASE.sha256_bytes(cnf)
    source_producer_sha256 = _BASE.sha256_bytes(source_producer_raw)
    _BASE._require(
        type(source_encoding) is dict
        and source_encoding.get("cnf_sha256") == cnf_sha256
        and source_encoding.get("producer_manifest_sha256") == source_producer_sha256
        and source_encoding.get("num_variables") == _BASE.NUM_VARIABLES
        and source_encoding.get("num_clauses") == _BASE.NUM_CLAUSES
        and source_encoding.get("query_polarity") == _BASE.QUERY_POLARITY
        and type(source_execution) is dict
        and source_execution.get("backend") == _BASE.BACKEND
        and source_execution.get("solver_profile") == _BASE.SOURCE_SOLVER_PROFILE,
        "source wave profile or encoding drifted",
    )
    portfolio_id = f"{source_id}-{PORTFOLIO_CELL_SUFFIX}"
    producer = dict(source_producer)
    producer["producer_id"] = portfolio_id
    producer["solver_profile"] = _BASE.SOLVER_PROFILE
    producer["profile_source_producer_manifest_sha256"] = source_producer_sha256
    producer_raw = _BASE.canonical_json_bytes(producer)
    producer_sha256 = _BASE.sha256_bytes(producer_raw)
    wave = dict(source_wave)
    wave["wave_id"] = portfolio_id
    wave["encoding"] = {
        **source_wave["encoding"],
        "producer_manifest_sha256": producer_sha256,
    }
    wave["execution"] = {
        **source_wave["execution"],
        "solver_profile": _BASE.SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": _BASE.CELL_COUNT,
    }
    _BASE.validate_wave_manifest(wave)
    wave_raw = _BASE.canonical_json_bytes(wave)
    return {
        "portfolio_cell_id": portfolio_id,
        "source_cell_id": source_id,
        "center": source_cell["center"],
        "category": source_cell["category"],
        "ordinal": ordinal,
        "producer_raw": producer_raw,
        "wave_raw": wave_raw,
        "identity_hash": _BASE._legacy.preparation.raw_dimacs_identity(
            cnf_sha256, producer_sha256
        ),
    }


def _validate_cell(cell: Any, ordinal: int) -> dict[str, Any]:
    _BASE._require(type(cell) is dict, "campaign cell is malformed")
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
    _BASE._require(set(cell) == required, "campaign cell keys drifted")
    _BASE._require(cell["ordinal"] == ordinal, "campaign cell ordinal drifted")
    _BASE._require(type(cell["center"]) is int, "campaign center is invalid")
    _BASE._require(
        type(cell["category"]) is str and cell["category"],
        "campaign category is invalid",
    )
    _BASE._require(type(cell["source_cell_id"]) is str, "source cell id is invalid")
    _BASE._require(
        cell["portfolio_cell_id"]
        == f"{cell['source_cell_id']}-{PORTFOLIO_CELL_SUFFIX}",
        "portfolio cell id is not derived from its V7 source cell",
    )
    _BASE._digest(cell["expected_identity_hash"], "cell raw identity")
    for key in ("source_cnf", "producer_manifest", "wave_manifest"):
        ref = cell[key]
        _BASE._require(
            type(ref) is dict and set(ref) == {"path", "sha256", "bytes"},
            f"{key} ref keys drifted",
        )
        _BASE._digest(ref.get("sha256"), key)
        _BASE._require(
            type(ref.get("bytes")) is int and ref["bytes"] > 0,
            f"{key} bytes invalid",
        )
    return dict(cell)


def _configure_base() -> None:
    prefix = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson"
    replacements = {
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "BASE_HEAD": BASE_HEAD,
        "RUNNER_CODE_CHECKPOINT_RELATIVE": CONTROL_CHECKPOINT_RELATIVE,
        "CHECKPOINT_RELATIVE": CONTROL_CHECKPOINT_RELATIVE,
        "SOURCE_PREPARER_RELATIVE": SOURCE_PREPARER_RELATIVE,
        "EXPECTED_SOURCE_PREPARER_RELATIVE": SOURCE_PREPARER_RELATIVE,
        "SOURCE_PREPARATION_CONFIG_RELATIVE": SOURCE_PREPARATION_CONFIG_RELATIVE,
        "RUNNER_RELATIVE": RUNNER_RELATIVE,
        "RUNNER_TEST_RELATIVE": RUNNER_TEST_RELATIVE,
        "MINER_RELATIVE": MINER_RELATIVE,
        "SOURCE_RUN_ROOT_RELATIVE": SOURCE_RUN_ROOT_RELATIVE,
        "EXPECTED_SOURCE_LANE_ID": EXPECTED_SOURCE_LANE_ID,
        "EXPECTED_SOURCE_RUN_ID": EXPECTED_SOURCE_RUN_ID,
        "EXPECTED_SOURCE_BASE_HEAD": EXPECTED_SOURCE_BASE_HEAD,
        "SOURCE_RUN_ROOT": SOURCE_RUN_ROOT,
        "OUTPUT_ROOT": OUTPUT_ROOT,
        "PRODUCTION_PINS_FINALIZED": False,
        "SOURCE_CAMPAIGN_SHA256": "",
        "SOURCE_CAMPAIGN_BYTES": 0,
        "SOURCE_RUN_MANIFEST_SHA256": "",
        "SOURCE_RUN_MANIFEST_BYTES": 0,
        "SOURCE_PREPARER_COMMIT": "",
        "SOURCE_PREPARER_SHA256": "",
        "SOURCE_PREPARER_BYTES": 0,
        "CHECKPOINT_SHA256": "",
        "CHECKPOINT_BYTES": 0,
        "RUNNER_CODE_CHECKPOINT_SHA256": "",
        "RUNNER_CODE_CHECKPOINT_BYTES": 0,
        "MINER_SHA256": "",
        "MINER_BYTES": 0,
        "MINER_NAME": "exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-source-valid-theorem-miner",
        "MINER_SCHEMA": f"{prefix}-v7-source-valid-theorem-miner/v1",
        "MINER_VERSION": "7",
        "SOURCE_CELL_IDENTITIES": {},
        "SOURCE_CELL_IDENTITIES_SHA256": "",
        "PRODUCTION_CELL_IDENTITIES": {},
        "PRODUCTION_CELL_IDENTITIES_SHA256": "",
        "NUM_VARIABLES": 308,
        "ROOT_NUM_CLAUSES": 7_409_810,
        "NUM_CLAUSES": 7_409_816,
        "CELL_COUNT": 76,
        "PROJECT": "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-v7-sat",
        "SOURCE_CAMPAIGN_SCHEMA": f"{prefix}-refinements-physical-slice-campaign/v1",
        "CAMPAIGN_SCHEMA": f"{prefix}-v7-sat-profile-campaign/v1",
        "LAUNCH_SCHEMA": f"{prefix}-v7-sat-profile-launch/v1",
        "RESULT_SCHEMA": f"{prefix}-v7-sat-profile-result/v1",
        "ACCEPTANCE_SCHEMA": f"{prefix}-v7-canary-acceptance/v1",
        "SAT_REPLAY_SCHEMA": f"{prefix}-v7-independent-sat-replay/v1",
        "WAVE_MINE_SCHEMA": f"{prefix}-v7-wave-only-mine/v1",
        "WAVE_MINE_LEDGER_SCHEMA": f"{prefix}-v7-wave-only-candidate-ledger/v1",
        "WAVE_MINE_CANDIDATE_SCHEMA": f"{prefix}-v7-wave-only-candidate/v1",
        "MINE_VERIFICATION_SCHEMA": f"{prefix}-v7-source-valid-theorem-mine-verification/v1",
        "IDENTITY_DERIVATION_SCHEMA": f"{prefix}-v7-sat-profile-identity-derivation/v1",
        "UNSAT_REPLAY_SCHEMA": f"{prefix}-v7-independent-unsat-replay/v1",
        "EXPECTED_SOURCE_THEOREM": (
            "Problem97.ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivor"
            "FourPointTwoCircleV7TwoKalmansonRefinementsPhysicalSliceCoverage."
            "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmanson"
            "RefinementPhysicalSliceCell"
        ),
        "EXPECTED_SOURCE_PATH": preparer.SOURCE_RELATIVE,
        "EXPECTED_ROOT_SOURCE_PATH": preparer.ROOT_SOURCE_RELATIVE,
        "EXPECTED_FINITE_SCHEMA": f"{prefix}-refinements-physical-slice/v1",
        "EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA": preparer.PRODUCTION_CONFIG_SCHEMA,
        "CANARY_SOURCE_CELL_ID": f"{SOURCE_CELL_PREFIX}-next-center-02-physical-none",
        "GLOBAL_CAPACITY_ROOT": Path("/tmp/p97-piqd-global-capacity-v7-two-kalmanson"),
    }
    for name, value in replacements.items():
        setattr(_BASE, name, value)
    _BASE.CANARY_PORTFOLIO_CELL_ID = (
        f"{_BASE.CANARY_SOURCE_CELL_ID}-{PORTFOLIO_CELL_SUFFIX}"
    )
    _BASE.CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    _BASE.RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
    _BASE.CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"
    _BASE._validate_cell = _validate_cell
    _BASE._transform_source_cell = _transform_source_cell


_configure_base()

for _name in (
    "REQUESTED_CORE_LIMIT",
    "MAX_ACTIVE_JOBS",
    "SOLVE_TIMEOUT_S",
    "REPLAY_TIMEOUT_S",
    "NUM_VARIABLES",
    "ROOT_NUM_CLAUSES",
    "NUM_CLAUSES",
    "CELL_COUNT",
    "CANARY_SOURCE_CELL_ID",
    "CANARY_PORTFOLIO_CELL_ID",
    "PROJECT",
    "CAMPAIGN_SCHEMA",
    "EXPECTED_SOURCE_THEOREM",
    "EXPECTED_SOURCE_PATH",
    "EXPECTED_ROOT_SOURCE_PATH",
    "EXPECTED_FINITE_SCHEMA",
):
    globals()[_name] = getattr(_BASE, _name)


def _require_production_pins() -> None:
    validate_committed_dependencies()
    _BASE._require_production_pins()


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
