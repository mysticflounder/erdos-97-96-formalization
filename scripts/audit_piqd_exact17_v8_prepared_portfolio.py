"""Read-only audit of the prepared exact-17 V8 SAT portfolio packet.

This deliberately does not launch a solver or contact PIQD.  It authenticates
the source packet, rederives the V8 producer/wave bytes, and checks that the
prepared output contains exactly those bytes.
"""

from __future__ import annotations

import hashlib
import json
import stat
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_portfolio as runner

AUDIT_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v8-prepared-portfolio-audit/v1"
)
IDENTITY_AUDIT_RELATIVE = (
    "scratch/runs/exact17-v8-identity-freeze-20260823/identity-freeze-v1/"
    "derived-runner-identities.json"
)


class PreparedPortfolioAuditError(RuntimeError):
    """The prepared packet failed a fail-closed audit."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _fail(message: str) -> None:
    raise PreparedPortfolioAuditError(message)


def _read_regular(path: Path, label: str, *, maximum: int = 64 << 20) -> bytes:
    try:
        metadata = path.lstat()
    except OSError as exc:
        _fail(f"{label} is unavailable")
        raise AssertionError from exc
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        _fail(f"{label} is not a regular file")
    if metadata.st_size > maximum:
        _fail(f"{label} exceeds audit size bound")
    try:
        return path.read_bytes()
    except OSError as exc:
        _fail(f"{label} cannot be read")
        raise AssertionError from exc


def _strict_json(raw: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PreparedPortfolioAuditError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        _fail(f"{label} is not a JSON object")
    return value


def _digest_ref(raw: bytes, ref: Mapping[str, Any], label: str) -> None:
    if type(ref) is not dict or set(ref) != {"path", "sha256", "bytes"}:
        _fail(f"{label} reference keys drifted")
    if type(ref["bytes"]) is not int or ref["bytes"] <= 0:
        _fail(f"{label} byte count drifted")
    if len(raw) != ref["bytes"] or sha256_bytes(raw) != ref["sha256"]:
        _fail(f"{label} bytes or hash drifted")


def _read_ref(root: Path, ref: Mapping[str, Any], label: str, maximum: int) -> bytes:
    try:
        relative = ref["path"]
    except (KeyError, TypeError) as exc:
        raise PreparedPortfolioAuditError(f"{label} reference is malformed") from exc
    relative_path = Path(relative) if type(relative) is str else Path()
    if (
        type(relative) is not str
        or not relative
        or relative_path.is_absolute()
        or ".." in relative_path.parts
    ):
        _fail(f"{label} path is unsafe")
    path = root / relative_path
    try:
        path.resolve(strict=True).relative_to(root.resolve(strict=True))
    except ValueError as exc:
        raise PreparedPortfolioAuditError(f"{label} path escapes repository") from exc
    except OSError as exc:
        raise PreparedPortfolioAuditError(f"{label} path cannot be resolved") from exc
    raw = _read_regular(path, label, maximum=maximum)
    _digest_ref(raw, ref, label)
    return raw


def expected_output_files(cells: Sequence[Mapping[str, Any]]) -> set[str]:
    """Return the complete create-once file inventory for a campaign."""

    files = {"artifacts/campaign-manifest.json", "run_manifest.json"}
    for cell in cells:
        portfolio_id = cell.get("portfolio_cell_id")
        if type(portfolio_id) is not str or not portfolio_id:
            _fail("portfolio cell id is malformed")
        prefix = f"artifacts/cells/{portfolio_id}"
        files.add(f"{prefix}/producer-manifest.json")
        files.add(f"{prefix}/wave-manifest.json")
    return files


def validate_exact_output_inventory(
    run_root: Path, expected_files: set[str]
) -> dict[str, int]:
    """Reject missing, extra, symlinked, or non-regular output entries."""

    if not run_root.is_dir() or run_root.is_symlink():
        _fail("prepared output root is not a directory")
    actual_files: set[str] = set()
    actual_dirs: set[str] = set()
    for path in run_root.rglob("*"):
        relative = path.relative_to(run_root).as_posix()
        if path.is_symlink():
            _fail(f"output inventory contains symlink: {relative}")
        if path.is_dir():
            actual_dirs.add(relative)
        elif path.is_file():
            actual_files.add(relative)
        else:
            _fail(f"output inventory contains special entry: {relative}")
    expected_dirs = {"artifacts", "artifacts/cells", "events", "tmp"}
    for relative in expected_files:
        parent = Path(relative).parent
        while str(parent) != ".":
            expected_dirs.add(parent.as_posix())
            parent = parent.parent
    if actual_files != expected_files:
        missing = sorted(expected_files - actual_files)
        extra = sorted(actual_files - expected_files)
        _fail(f"output file inventory drifted: missing={missing} extra={extra}")
    if actual_dirs != expected_dirs:
        missing = sorted(expected_dirs - actual_dirs)
        extra = sorted(actual_dirs - expected_dirs)
        _fail(f"output directory inventory drifted: missing={missing} extra={extra}")
    return {"files": len(actual_files), "directories": len(actual_dirs)}


def _validate_order_and_binding(
    source_campaign: Mapping[str, Any], campaign: Mapping[str, Any], bundle: Mapping[str, Any]
) -> tuple[list[dict[str, Any]], dict[str, dict[str, Any]]]:
    source_cells = source_campaign.get("cells")
    production_cells = campaign.get("cells")
    if type(source_cells) is not list or type(production_cells) is not list:
        _fail("campaign cell lists are malformed")
    source_ids = [cell.get("cell_id") for cell in source_cells]
    production_ids = [cell.get("portfolio_cell_id") for cell in production_cells]
    if source_ids != list(runner.SOURCE_CELL_IDENTITIES):
        _fail("source campaign order is not canonical")
    expected_production_ids = [
        f"{source_id}-{runner.PORTFOLIO_CELL_SUFFIX}" for source_id in source_ids
    ]
    if production_ids != expected_production_ids:
        _fail("production campaign order or source binding drifted")
    if list(runner.PRODUCTION_CELL_IDENTITIES) != production_ids:
        _fail("production identity table order is not canonical")
    transformed = bundle.get("transformed")
    if type(transformed) is not list or len(transformed) != runner.CELL_COUNT:
        _fail("derived transform coverage is incomplete")
    transformed_by_id = {item.get("portfolio_cell_id"): item for item in transformed}
    if list(transformed_by_id) != expected_production_ids:
        _fail("derived transform order or IDs drifted")
    for source_cell, production_cell in zip(source_cells, production_cells, strict=True):
        source_id = source_cell["cell_id"]
        production_id = production_cell["portfolio_cell_id"]
        if production_cell.get("source_cell_id") != source_id:
            _fail(f"source binding drifted for {production_id}")
        if production_cell.get("source_cnf") != source_cell.get("cnf"):
            _fail(f"source CNF reference drifted for {production_id}")
        source_identity = bundle["source_cell_identities"].get(source_id)
        if source_identity != {
            "cnf_sha256": source_cell["cnf"]["sha256"],
            "cnf_bytes": source_cell["cnf"]["bytes"],
            "producer_sha256": source_cell["producer_manifest"]["sha256"],
            "producer_bytes": source_cell["producer_manifest"]["bytes"],
            "wave_sha256": source_cell["wave_manifest"]["sha256"],
            "wave_bytes": source_cell["wave_manifest"]["bytes"],
        }:
            _fail(f"source identity drifted for {source_id}")
        expected = bundle["production_cell_identities"].get(production_id)
        observed = {
            "cnf_sha256": production_cell["source_cnf"]["sha256"],
            "cnf_bytes": production_cell["source_cnf"]["bytes"],
            "producer_sha256": production_cell["producer_manifest"]["sha256"],
            "producer_bytes": production_cell["producer_manifest"]["bytes"],
            "wave_sha256": production_cell["wave_manifest"]["sha256"],
            "wave_bytes": production_cell["wave_manifest"]["bytes"],
            "identity_hash": production_cell["expected_identity_hash"],
        }
        if expected != observed:
            _fail(f"production identity drifted for {production_id}")
    return [dict(cell) for cell in production_cells], transformed_by_id


def _validate_generated_files(
    root: Path,
    run_root: Path,
    cells: Sequence[Mapping[str, Any]],
    transformed_by_id: Mapping[str, Mapping[str, Any]],
) -> int:
    try:
        output_prefix = run_root.relative_to(root).as_posix()
    except ValueError as exc:
        raise PreparedPortfolioAuditError("prepared root escapes repository") from exc
    for cell in cells:
        portfolio_id = cell["portfolio_cell_id"]
        transformed = transformed_by_id[portfolio_id]
        expected_producer = transformed["producer_raw"]
        expected_wave = transformed["wave_raw"]
        producer_ref = cell["producer_manifest"]
        wave_ref = cell["wave_manifest"]
        expected_prefix = f"{output_prefix}/artifacts/cells/{portfolio_id}/"
        if producer_ref["path"] != f"{expected_prefix}producer-manifest.json":
            _fail(f"producer output path drifted for {portfolio_id}")
        if wave_ref["path"] != f"{expected_prefix}wave-manifest.json":
            _fail(f"wave output path drifted for {portfolio_id}")
        producer_raw = _read_ref(root, producer_ref, "production producer", 4 << 20)
        wave_raw = _read_ref(root, wave_ref, "production wave", 4 << 20)
        if producer_raw != expected_producer or wave_raw != expected_wave:
            _fail(f"generated producer/wave bytes drifted for {portfolio_id}")
        producer = _strict_json(producer_raw, "production producer")
        wave = _strict_json(wave_raw, "production wave")
        try:
            runner._BASE._require_source_production_config(
                producer.get("production_config"),
                source_preparer_commit=runner.SOURCE_PREPARER_COMMIT,
                label="production producer",
            )
            runner._BASE.validate_wave_manifest(wave)
        except Exception as exc:
            raise PreparedPortfolioAuditError(
                f"generated manifest schema drifted for {portfolio_id}"
            ) from exc
        if producer.get("producer_id") != portfolio_id or wave.get("wave_id") != portfolio_id:
            _fail(f"generated manifest IDs drifted for {portfolio_id}")
    return len(cells)


def _validate_source_run(
    root: Path, source_campaign: Mapping[str, Any], source_run: Mapping[str, Any],
    source_campaign_raw: bytes, source_run_raw: bytes,
) -> None:
    if len(source_campaign_raw) != runner.SOURCE_CAMPAIGN_BYTES or sha256_bytes(source_campaign_raw) != runner.SOURCE_CAMPAIGN_SHA256:
        _fail("source campaign pin drifted")
    if len(source_run_raw) != runner.SOURCE_RUN_MANIFEST_BYTES or sha256_bytes(source_run_raw) != runner.SOURCE_RUN_MANIFEST_SHA256:
        _fail("source run manifest pin drifted")
    if source_run.get("manifest_sha256") != sha256_bytes(canonical_json_bytes({k: v for k, v in source_run.items() if k != "manifest_sha256"})):
        _fail("source run manifest self-hash drifted")
    runner._BASE._require_source_campaign_contract(source_campaign)
    runner._BASE._require_source_run_contract(source_run)


def audit_prepared_portfolio(
    *, root: Path = runner.ROOT, run_root: Path = runner.OUTPUT_ROOT
) -> dict[str, Any]:
    """Authenticate and summarize one prepared V8 portfolio, without PIQD."""

    if root != runner.ROOT or run_root != runner.OUTPUT_ROOT:
        _fail("auditor route drifted")
    source_check = runner.preparer.source_static_check()
    runner.validate_committed_dependencies()
    runner._BASE._require_production_pins()
    support = runner._BASE._authenticate_runner_support(root)
    static_checked = runner.static_check(root=root, run_root=run_root)

    campaign_raw = _read_regular(run_root / "artifacts/campaign-manifest.json", "production campaign", maximum=4 << 20)
    run_raw = _read_regular(run_root / "run_manifest.json", "production run manifest", maximum=1 << 20)
    campaign = _strict_json(campaign_raw, "production campaign")
    run_manifest = _strict_json(run_raw, "production run manifest")
    if static_checked.get("campaign_sha256") != sha256_bytes(campaign_raw):
        _fail("production campaign disagrees with static-check")
    if static_checked.get("run_manifest_sha256") != sha256_bytes(run_raw):
        _fail("production run manifest disagrees with static-check")
    source_root = root / runner.SOURCE_RUN_ROOT_RELATIVE
    source_campaign_raw = _read_regular(source_root / "artifacts/campaign-manifest.json", "source campaign", maximum=8 << 20)
    source_run_raw = _read_regular(source_root / "run_manifest.json", "source run manifest", maximum=2 << 20)
    source_campaign = _strict_json(source_campaign_raw, "source campaign")
    source_run = _strict_json(source_run_raw, "source run manifest")
    _validate_source_run(root, source_campaign, source_run, source_campaign_raw, source_run_raw)
    bundle = runner._BASE._derive_identity_bundle(
        root=root,
        source_campaign=source_campaign,
        source_preparer_commit=runner.SOURCE_PREPARER_COMMIT,
    )
    cells, transformed_by_id = _validate_order_and_binding(source_campaign, campaign, bundle)
    if bundle["source_cell_identities"] != runner.SOURCE_CELL_IDENTITIES or bundle["production_cell_identities"] != runner.PRODUCTION_CELL_IDENTITIES:
        _fail("derived identity tables do not match frozen tables")
    if sha256_bytes(canonical_json_bytes(bundle["source_cell_identities"])) != runner.SOURCE_CELL_IDENTITIES_SHA256:
        _fail("derived source table hash drifted")
    if sha256_bytes(canonical_json_bytes(bundle["production_cell_identities"])) != runner.PRODUCTION_CELL_IDENTITIES_SHA256:
        _fail("derived production table hash drifted")

    identity_raw = _read_regular(root / IDENTITY_AUDIT_RELATIVE, "identity audit", maximum=16 << 20)
    identity_artifact = _strict_json(identity_raw, "identity audit")
    if identity_artifact.get("schema") != runner.IDENTITY_DERIVATION_SCHEMA:
        _fail("retained identity artifact schema drifted")
    if identity_artifact.get("source_campaign_sha256") != runner.SOURCE_CAMPAIGN_SHA256 or identity_artifact.get("source_campaign_bytes") != runner.SOURCE_CAMPAIGN_BYTES:
        _fail("retained identity source campaign pin drifted")
    if identity_artifact.get("source_run_manifest_sha256") != runner.SOURCE_RUN_MANIFEST_SHA256 or identity_artifact.get("source_run_manifest_bytes") != runner.SOURCE_RUN_MANIFEST_BYTES:
        _fail("retained identity source run pin drifted")
    if identity_artifact.get("source_cell_identities") != bundle["source_cell_identities"] or identity_artifact.get("production_cell_identities") != bundle["production_cell_identities"]:
        _fail("retained identity artifact drifted")
    if identity_artifact.get("source_table_sha256") != runner.SOURCE_CELL_IDENTITIES_SHA256 or identity_artifact.get("production_table_sha256") != runner.PRODUCTION_CELL_IDENTITIES_SHA256:
        _fail("retained identity table hash drifted")
    if identity_artifact.get("cell_count") != runner.CELL_COUNT or identity_artifact.get("source_preparer_commit") != runner.SOURCE_PREPARER_COMMIT:
        _fail("retained identity preparer commit drifted")

    inventory = validate_exact_output_inventory(run_root, expected_output_files(cells))
    generated_count = _validate_generated_files(root, run_root, cells, transformed_by_id)

    governed = dict(run_manifest.get("source_digests", {}))
    governed_paths = (
        runner.SOURCE_PREPARER_RELATIVE,
        runner.CHECKPOINT_RELATIVE,
        runner.RUNNER_CODE_CHECKPOINT_RELATIVE,
        runner.miner.MINER_RELATIVE,
        runner.RUNNER_RELATIVE,
        runner.RUNNER_TEST_RELATIVE,
    )
    if set(governed) != set(governed_paths):
        _fail("run manifest governed source set drifted")
    for relative in governed_paths:
        raw = _read_regular(root / relative, f"governed source {relative}", maximum=4 << 20)
        if governed.get(relative) != sha256_bytes(raw):
            _fail(f"run manifest source digest drifted: {relative}")
    for relative, digest in support.items():
        if relative in governed and governed.get(relative) != digest:
            _fail(f"run manifest support digest drifted: {relative}")

    return {
        "cell_count": runner.CELL_COUNT,
        "generated_manifest_count": generated_count,
        "identity_artifact_sha256": sha256_bytes(identity_raw),
        "production_campaign_sha256": sha256_bytes(campaign_raw),
        "production_run_manifest_sha256": sha256_bytes(run_raw),
        "production_table_sha256": runner.PRODUCTION_CELL_IDENTITIES_SHA256,
        "schema": AUDIT_SCHEMA,
        "source_campaign_sha256": runner.SOURCE_CAMPAIGN_SHA256,
        "source_run_manifest_sha256": runner.SOURCE_RUN_MANIFEST_SHA256,
        "source_table_sha256": runner.SOURCE_CELL_IDENTITIES_SHA256,
        "source_status": source_check["status"],
        "static_check": True,
        "status": "PASS",
        "output_directories": inventory["directories"],
        "output_files": inventory["files"],
    }


def main() -> int:
    try:
        summary = audit_prepared_portfolio()
    except (
        AttributeError,
        KeyError,
        OSError,
        PreparedPortfolioAuditError,
        RuntimeError,
        TypeError,
        ValueError,
    ) as exc:
        summary = {"error": str(exc), "schema": AUDIT_SCHEMA, "status": "FAIL"}
        print(canonical_json_bytes(summary).decode("utf-8"))
        return 1
    print(canonical_json_bytes(summary).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
