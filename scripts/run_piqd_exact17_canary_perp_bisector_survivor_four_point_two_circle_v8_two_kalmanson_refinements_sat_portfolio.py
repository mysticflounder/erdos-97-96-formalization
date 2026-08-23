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
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/exact17-v8-control-plane-20260823.json"
)
RUNNER_CODE_CHECKPOINT_LANE_ID = "exact17-v8-control-plane-20260823"
RUNNER_CODE_CHECKPOINT_BASE_HEAD = "dbd449d772908af330686d6ddde7df7a6d5026b0"
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-v8-two-kalmanson-v8-sat-portfolio-20260823.json"
)
SOURCE_PREPARER_RELATIVE = preparer.PREPARER_PATH.relative_to(ROOT).as_posix()
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = preparer.PRODUCTION_CONFIG_RELATIVE.as_posix()
RUNNER_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_"
    "two_circle_v8_two_kalmanson_refinements_sat_portfolio.py"
)
MINER_TEST_RELATIVE = (
    Path(miner.MINER_RELATIVE)
    .with_name(f"test_{Path(miner.MINER_RELATIVE).name}")
    .as_posix()
)
SOURCE_PREPARER_TEST_RELATIVE = preparer.TEST_PATH.relative_to(ROOT).as_posix()
RUNNER_CODE_CHECKPOINT_OWNED_PATHS = [
    RUNNER_CODE_CHECKPOINT_RELATIVE,
    SOURCE_PREPARATION_CONFIG_RELATIVE,
    miner.MINER_RELATIVE,
    SOURCE_PREPARER_RELATIVE,
    RUNNER_RELATIVE,
    MINER_TEST_RELATIVE,
    SOURCE_PREPARER_TEST_RELATIVE,
    RUNNER_TEST_RELATIVE,
]
SOURCE_RUN_ROOT_RELATIVE = preparer.RUN_ROOT.relative_to(ROOT).as_posix()
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
EXPECTED_SOURCE_LANE_ID = preparer.LANE_ID
EXPECTED_SOURCE_RUN_ID = preparer.RUN_ID
# The source export records the exact current HEAD in its run manifest.  That
# value, like the source campaign and cell identities below, is frozen only
# after the create-once source packet exists.
EXPECTED_SOURCE_BASE_HEAD = ""
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

SOURCE_CELL_PREFIX = preparer.SOURCE_CELL_PREFIX
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
SOURCE_CAMPAIGN_SCHEMA = f"{SOURCE_CELL_PREFIX}-physical-slice-campaign/v1"
EXPECTED_SOURCE_THEOREM = preparer.SOURCE_THEOREM
EXPECTED_SOURCE_PATH = preparer.SOURCE_RELATIVE
EXPECTED_ROOT_SOURCE_PATH = preparer.ROOT_SOURCE_RELATIVE
EXPECTED_FINITE_SCHEMA = f"{SOURCE_CELL_PREFIX}-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = preparer.PRODUCTION_CONFIG_SCHEMA
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-v8-two-kalmanson")

# Artifact-derived production pins.  Empty values are deliberate: inheriting
# the V7 tables or hashes would be less safe than failing closed before the V8
# source packet has been exported and independently inventoried.
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
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {}
SOURCE_CELL_IDENTITIES_SHA256 = ""
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {}
PRODUCTION_CELL_IDENTITIES_SHA256 = ""
RUNNER_RECEIPT_SCHEMAS = {
    "acceptance": ACCEPTANCE_SCHEMA,
    "candidate": WAVE_MINE_CANDIDATE_SCHEMA,
    "candidate_ledger": WAVE_MINE_LEDGER_SCHEMA,
    "mine": WAVE_MINE_SCHEMA,
    "sat_replay": SAT_REPLAY_SCHEMA,
    "verification": MINE_VERIFICATION_SCHEMA,
}

CANARY_SOURCE_CELL_ID = f"{SOURCE_CELL_PREFIX}-next-center-02-physical-none"
PORTFOLIO_CELL_SUFFIX = "sat-profile-cadical-1core-3600s"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-{PORTFOLIO_CELL_SUFFIX}"

OPERATOR_HELP = """\
Govern the fresh exact-17 V8 PIQD portfolio.

Commands remain fail-closed until the V8 Lean packet and exact source packet
identities are frozen.  Runtime policy is 1 solver core per job, at most 12
active jobs, and 3600-second solve and replay limits.

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
    # The V8 preparer validates its explicitly pinned inherited support before
    # this adapter validates its own scanner and checkpoint roles.  Calling the
    # V7 runner validator directly would reject intentional V8 route rebinding.
    preparer.validate_committed_dependencies()
    miner.validate_committed_dependencies()
    validate_scanner_identity_contract(
        miner.build_scanner_identity(candidate_count=0), candidate_count=0
    )
    _validate_checkpoint_roles()


_BASE = _PARENT._BASE
_BASE_PREPARE_PORTFOLIO = _BASE.prepare_portfolio
_BASE_STATIC_CHECK = _BASE.static_check
_BASE_START_CANARY = _BASE.start_canary
_BASE_START_REST = _BASE.start_rest
_BASE_VALIDATE_MINE_INVENTORY = _BASE._validate_mine_inventory


def _checkpoint_payload(relative: str, label: str) -> dict[str, Any]:
    raw = _BASE._read_repo_source_file(
        ROOT / relative,
        maximum=1 << 20,
        label=label,
    )
    return _BASE._strict_repo_json(raw, label)


def _validate_production_checkpoint_payload(value: Mapping[str, Any]) -> None:
    """Validate the future V8 generated-root lane independently of code custody."""

    _BASE._require_exact_keys(
        value,
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
        "V8 production checkpoint",
    )
    expected_root = OUTPUT_ROOT.relative_to(ROOT).as_posix()
    expected_durable = sorted(
        [
            miner.MINER_RELATIVE,
            RUNNER_CODE_CHECKPOINT_RELATIVE,
            RUNNER_RELATIVE,
            RUNNER_TEST_RELATIVE,
            SOURCE_PREPARER_RELATIVE,
        ]
    )
    _BASE._require(
        value["schema"] == "worktree-lane-checkpoint/v1"
        and value["lane_id"] == LANE_ID
        and value["owner"] == RUN_OWNER
        and value["base_head"] == BASE_HEAD
        and value["owned_paths"] == [CHECKPOINT_RELATIVE]
        and value["durable_paths"] == expected_durable
        and value["generated_roots"] == [expected_root]
        and value["manifest_sha256"] == _BASE._self_hash(value),
        "V8 production checkpoint contract drifted",
    )


def _validate_runner_code_checkpoint_payload(value: Mapping[str, Any]) -> None:
    """Keep the V8 code-owner checkpoint distinct from runtime custody."""

    _BASE._require_exact_keys(
        value,
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
        "V8 runner-code checkpoint",
    )
    _BASE._require(
        value["schema"] == "worktree-lane-checkpoint/v1"
        and value["lane_id"] == RUNNER_CODE_CHECKPOINT_LANE_ID
        and value["owner"] == RUNNER_CODE_CHECKPOINT_LANE_ID
        and value["base_head"] == RUNNER_CODE_CHECKPOINT_BASE_HEAD
        and value["lane_id"] != LANE_ID
        and value["owned_paths"] == RUNNER_CODE_CHECKPOINT_OWNED_PATHS
        and CHECKPOINT_RELATIVE not in value["owned_paths"]
        and value["durable_paths"] == []
        and value["generated_roots"] == []
        and value["manifest_sha256"] == _BASE._self_hash(value),
        "V8 runner-code checkpoint contract drifted",
    )


def _validate_checkpoint_roles() -> None:
    _BASE._require(
        CHECKPOINT_RELATIVE != RUNNER_CODE_CHECKPOINT_RELATIVE,
        "V8 production and runner-code checkpoint paths alias",
    )
    runner_code = _checkpoint_payload(
        RUNNER_CODE_CHECKPOINT_RELATIVE, "V8 runner-code checkpoint"
    )
    _validate_runner_code_checkpoint_payload(runner_code)
    if _BASE.PRODUCTION_PINS_FINALIZED is True:
        production = _checkpoint_payload(
            CHECKPOINT_RELATIVE, "V8 production checkpoint"
        )
        _validate_production_checkpoint_payload(production)


def _transform_source_cell(
    *,
    source_cell: Mapping[str, Any],
    ordinal: int,
    cnf: bytes,
    source_producer_raw: bytes,
    source_wave_raw: bytes,
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Validate and transform one authenticated V8 physical cell."""

    source_id = source_cell.get("cell_id")
    _BASE._require(type(source_id) is str, "source cell id drifted")
    _BASE._require(
        source_id.startswith(f"{SOURCE_CELL_PREFIX}-next-center-"),
        "source cell id is not V8-owned",
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
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "source cell DIMACS dimensions drifted",
    )
    source_manifest = source_producer.get("source_manifest")
    production_config = source_producer.get("production_config")
    _BASE._require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == EXPECTED_FINITE_SCHEMA,
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
    cnf_sha256 = sha256_bytes(cnf)
    source_producer_sha256 = sha256_bytes(source_producer_raw)
    _BASE._require(
        type(source_encoding) is dict
        and source_encoding.get("cnf_sha256") == cnf_sha256
        and source_encoding.get("producer_manifest_sha256")
        == source_producer_sha256
        and source_encoding.get("num_variables") == NUM_VARIABLES
        and source_encoding.get("num_clauses") == NUM_CLAUSES
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
        "solver_profile": _BASE.SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
    }
    _BASE.validate_wave_manifest(wave)
    wave_raw = canonical_json_bytes(wave)
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
        cell["source_cell_id"].startswith(
            f"{SOURCE_CELL_PREFIX}-next-center-"
        ),
        "campaign source cell id is not V8-owned",
    )
    _BASE._require(
        cell["portfolio_cell_id"]
        == f"{cell['source_cell_id']}-{PORTFOLIO_CELL_SUFFIX}",
        "portfolio cell id is not derived from its V8 source cell",
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
    script = miner.scanner_script_identity()
    replacements = {
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "BASE_HEAD": BASE_HEAD,
        "RUNNER_CODE_CHECKPOINT_RELATIVE": RUNNER_CODE_CHECKPOINT_RELATIVE,
        "CHECKPOINT_RELATIVE": CHECKPOINT_RELATIVE,
        "SOURCE_PREPARER_RELATIVE": SOURCE_PREPARER_RELATIVE,
        "EXPECTED_SOURCE_PREPARER_RELATIVE": EXPECTED_SOURCE_PREPARER_RELATIVE,
        "SOURCE_PREPARATION_CONFIG_RELATIVE": SOURCE_PREPARATION_CONFIG_RELATIVE,
        "RUNNER_RELATIVE": RUNNER_RELATIVE,
        "RUNNER_TEST_RELATIVE": RUNNER_TEST_RELATIVE,
        "SOURCE_RUN_ROOT_RELATIVE": SOURCE_RUN_ROOT_RELATIVE,
        "EXPECTED_SOURCE_LANE_ID": EXPECTED_SOURCE_LANE_ID,
        "EXPECTED_SOURCE_RUN_ID": EXPECTED_SOURCE_RUN_ID,
        "EXPECTED_SOURCE_BASE_HEAD": EXPECTED_SOURCE_BASE_HEAD,
        "SOURCE_RUN_ROOT": SOURCE_RUN_ROOT,
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
        "SOURCE_CAMPAIGN_SCHEMA": SOURCE_CAMPAIGN_SCHEMA,
        "EXPECTED_SOURCE_THEOREM": EXPECTED_SOURCE_THEOREM,
        "EXPECTED_SOURCE_PATH": EXPECTED_SOURCE_PATH,
        "EXPECTED_ROOT_SOURCE_PATH": EXPECTED_ROOT_SOURCE_PATH,
        "EXPECTED_FINITE_SCHEMA": EXPECTED_FINITE_SCHEMA,
        "EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA": (
            EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA
        ),
        "SOURCE_CAMPAIGN_SHA256": SOURCE_CAMPAIGN_SHA256,
        "SOURCE_CAMPAIGN_BYTES": SOURCE_CAMPAIGN_BYTES,
        "SOURCE_RUN_MANIFEST_SHA256": SOURCE_RUN_MANIFEST_SHA256,
        "SOURCE_RUN_MANIFEST_BYTES": SOURCE_RUN_MANIFEST_BYTES,
        "SOURCE_PREPARER_COMMIT": SOURCE_PREPARER_COMMIT,
        "SOURCE_PREPARER_SHA256": SOURCE_PREPARER_SHA256,
        "SOURCE_PREPARER_BYTES": SOURCE_PREPARER_BYTES,
        "CHECKPOINT_SHA256": CHECKPOINT_SHA256,
        "CHECKPOINT_BYTES": CHECKPOINT_BYTES,
        "RUNNER_CODE_CHECKPOINT_SHA256": RUNNER_CODE_CHECKPOINT_SHA256,
        "RUNNER_CODE_CHECKPOINT_BYTES": RUNNER_CODE_CHECKPOINT_BYTES,
        "SOURCE_CELL_IDENTITIES": SOURCE_CELL_IDENTITIES,
        "SOURCE_CELL_IDENTITIES_SHA256": SOURCE_CELL_IDENTITIES_SHA256,
        "PRODUCTION_CELL_IDENTITIES": PRODUCTION_CELL_IDENTITIES,
        "PRODUCTION_CELL_IDENTITIES_SHA256": PRODUCTION_CELL_IDENTITIES_SHA256,
        "MINER_RELATIVE": miner.MINER_RELATIVE,
        "MINER_SHA256": script["sha256"],
        "MINER_BYTES": script["bytes"],
        "MINER_NAME": miner.MINER_NAME,
        "MINER_SCHEMA": miner.MINER_SCHEMA,
        "MINER_VERSION": miner.MINER_VERSION,
        "PINNED_SOURCE_VALID_FAMILIES": miner.SOURCE_VALID_FAMILIES,
        "CANARY_SOURCE_CELL_ID": CANARY_SOURCE_CELL_ID,
        "CANARY_PORTFOLIO_CELL_ID": CANARY_PORTFOLIO_CELL_ID,
        "GLOBAL_CAPACITY_ROOT": GLOBAL_CAPACITY_ROOT,
        "PRODUCTION_PINS_FINALIZED": False,
    }
    for name, value in replacements.items():
        setattr(_BASE, name, value)
    _BASE.CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    _BASE.RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
    _BASE.CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"
    _BASE._transform_source_cell = _transform_source_cell
    _BASE._validate_cell = _validate_cell


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
