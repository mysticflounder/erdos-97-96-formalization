"""Adopt one authenticated sealed v1 canary terminal into the v2 campaign.

This is deliberately not a general PIQD adoption mechanism.  It accepts one
exact job and one exact cell identity, revalidates both the old local custody
and the live daemon artifacts, archives the v2 failed-closed attempt, and then
copies the immutable terminal custody create-once into the v2 run.
"""

from __future__ import annotations

import argparse
import os
import stat
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

import run_piqd_exact17_canary_perp_bisector_survivor_two_kalmanson_refinements_sat_portfolio as runner

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_oracle import PiqdRawDimacsClient, PreparedJob

SCHEMA = "p97-exact17-two-kalmanson-sealed-canary-adoption/v1"
ARCHIVE_SCHEMA = f"{SCHEMA}/rejected-attempt-archive/v1"
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-canary-perp-bisector-survivor-two-kalmanson-"
    "refinements-sat-portfolio-20260822/sat-profile-portfolio-v1"
)
SOURCE_CAMPAIGN_SHA256 = (
    "44da46805d9c8f9b92fb20bd6e402d4d5944c172ac29b49c45078b57ecec24cb"
)
SOURCE_CAMPAIGN_BYTES = 119_464
SOURCE_RUN_MANIFEST_SHA256 = (
    "e47ffe5e3550f2aeb2d832dc554da0a12e69a51a091bf508b6d02c2dee91ef63"
)
SOURCE_RUN_MANIFEST_BYTES = 74_626
EXPECTED_JOB_ID = "f2fe634a-929e-449c-89c4-d0e2becd6a01"
EXPECTED_CNF_SHA256 = (
    "4d4f2c031b65121d66abf2f659a5d614fd20d243266ea3ceb44051e0f37e6527"
)
EXPECTED_PRODUCER_SHA256 = (
    "7ce81890ddb8bbfdb65ec3983636f8a8eac136851d75728333ad65701c04edd2"
)
EXPECTED_WAVE_SHA256 = (
    "3119f9479d01804a598842f967608ab1a59278aa6e35552f2bba62f021113434"
)
EXPECTED_IDENTITY_HASH = (
    "d6a047a643d01dbc9c8e22da7009f403e1c6181a12aa12a268772401851c108c"
)
EXPECTED_TERMINAL_RECORD_SHA256 = (
    "d2a934d147b965074c987925850e1d529f4b92b41b676dfcb16e4987e5f9633c"
)
EXPECTED_SEAL_SHA256 = (
    "e4490f336d8f9ec441761524896560d9f0febd9ac894551d7491dd4dac7ceaab"
)
EXPECTED_MODEL_SHA256 = (
    "98deecf63c995b8bfff4f7bd3c84339ed349701139375fa0cc0ee9fec188d408"
)
EXPECTED_SOLVER_LOG_SHA256 = (
    "1e549d3cc7e99e19343bf7af1fb0cb32f995563eac4cc042ed70e2dfd9c4b8d0"
)
EXPECTED_SOURCE_JOURNAL_SHA256 = (
    "4aa9fe9581a4cd172d5ff37b4eede56e384882a4a519e8e2106388abd621c5e4"
)
REJECTED_DETAIL = (
    "PIQD returned existing=true; no adoption or recovery owner is authorized"
)


class AdoptionError(RuntimeError):
    """The exact sealed-custody adoption contract failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise AdoptionError(message)


def _read_pinned(path: Path, *, digest: str, size: int, label: str) -> bytes:
    raw = runner._read_private_file(path, maximum=size, label=label)
    _require(len(raw) == size, f"{label} byte count drifted")
    _require(sha256_bytes(raw) == digest, f"{label} hash drifted")
    return raw


def _campaign_cell(campaign: Mapping[str, Any]) -> Mapping[str, Any]:
    cells = campaign.get("cells")
    _require(type(cells) is list, "campaign cell inventory is malformed")
    selected = [
        cell
        for cell in cells
        if type(cell) is dict
        and cell.get("portfolio_cell_id") == runner.CANARY_PORTFOLIO_CELL_ID
    ]
    _require(len(selected) == 1, "campaign lacks the unique pinned canary")
    return selected[0]


def _cell_identity(cell: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "portfolio_cell_id": cell.get("portfolio_cell_id"),
        "source_cell_id": cell.get("source_cell_id"),
        "center": cell.get("center"),
        "category": cell.get("category"),
        "ordinal": cell.get("ordinal"),
        "cnf_sha256": cell.get("source_cnf", {}).get("sha256"),
        "cnf_bytes": cell.get("source_cnf", {}).get("bytes"),
        "producer_sha256": cell.get("producer_manifest", {}).get("sha256"),
        "producer_bytes": cell.get("producer_manifest", {}).get("bytes"),
        "wave_sha256": cell.get("wave_manifest", {}).get("sha256"),
        "wave_bytes": cell.get("wave_manifest", {}).get("bytes"),
        "expected_identity_hash": cell.get("expected_identity_hash"),
    }


def require_same_cell_identity(
    source_cell: Mapping[str, Any], target_cell: Mapping[str, Any]
) -> dict[str, Any]:
    """Require all semantic and byte identities while allowing path relocation."""

    source = _cell_identity(source_cell)
    target = _cell_identity(target_cell)
    _require(source == target, "v1/v2 canary cell identity drifted")
    _require(source["cnf_sha256"] == EXPECTED_CNF_SHA256, "pinned CNF drifted")
    _require(
        source["producer_sha256"] == EXPECTED_PRODUCER_SHA256,
        "pinned producer drifted",
    )
    _require(source["wave_sha256"] == EXPECTED_WAVE_SHA256, "pinned wave drifted")
    _require(
        source["expected_identity_hash"] == EXPECTED_IDENTITY_HASH,
        "pinned PIQD identity drifted",
    )
    return source


def require_expected_source_terminal(terminal: Mapping[str, Any]) -> None:
    artifacts = terminal.get("artifacts")
    _require(type(artifacts) is dict, "source terminal artifacts are malformed")
    expected = {
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": EXPECTED_JOB_ID,
        "outcome": runner.STRUCTURAL_SAT,
        "terminal_record_sha256": EXPECTED_TERMINAL_RECORD_SHA256,
        "journal_record_count": 16,
        "seal_sha256": EXPECTED_SEAL_SHA256,
    }
    for key, value in expected.items():
        _require(terminal.get(key) == value, f"source terminal {key} drifted")
    _require(
        artifacts.get("cnf_sha256") == EXPECTED_CNF_SHA256,
        "source terminal CNF drifted",
    )
    _require(
        artifacts.get("model_sha256") == EXPECTED_MODEL_SHA256,
        "source terminal model drifted",
    )
    _require(
        artifacts.get("solver_log_sha256") == EXPECTED_SOLVER_LOG_SHA256,
        "source terminal solver log drifted",
    )


def _validate_rejected_attempt(
    run_root: Path, cell: Mapping[str, Any]
) -> tuple[dict[str, Any], tuple[Path, ...]]:
    identifier = runner.CANARY_PORTFOLIO_CELL_ID
    base = run_root / "events" / f"{identifier}.jsonl"
    lock = base.with_name(f"{base.name}.lock")
    artifacts = base.with_name(f"{base.name}.artifacts")
    seal_path = base.with_name(f"{base.name}.seal.json")
    _require(
        all(path.exists() for path in (base, lock, artifacts, seal_path)),
        "rejected v2 attempt custody is incomplete",
    )
    _, _, wave = runner._load_cell_inputs(ROOT, cell)
    records = runner._read_journal_records(base, wave)
    _require(len(records) == 2, "rejected v2 journal length drifted")
    _require(runner._journal_job_id(records) is None, "rejected attempt has a job id")
    last = records[-1]
    event = last["event"]
    _require(
        last["outcome"] == "ERROR"
        and event.get("phase") == "PREPARE"
        and event.get("disposition") == "ERROR"
        and event.get("detail") == REJECTED_DETAIL,
        "v2 attempt is not the pinned failed-closed duplicate rejection",
    )
    runner._empty_file_identity(lock, "rejected attempt lock")
    artifact_names = runner._validate_artifact_directory(artifacts)
    seal_raw = runner._read_private_file(
        seal_path, maximum=1 << 20, label="rejected attempt seal"
    )
    _require(seal_raw.endswith(b"\n"), "rejected attempt seal is torn")
    seal = runner._strict_json(seal_raw[:-1], "rejected attempt seal")
    _require(
        seal.get("seal_sha256") == runner._self_hash(seal, "seal_sha256")
        and seal.get("record_count") == len(records)
        and seal.get("terminal_attempt_sha256") == last["record_sha256"]
        and seal.get("journal_sha256") == sha256_bytes(
            runner._read_private_file(base, maximum=64 << 20, label="rejected journal")
        ),
        "rejected attempt seal drifted",
    )
    virtual = {
        str(wave["encoding"]["cnf_sha256"]),
        str(wave["encoding"]["producer_manifest_sha256"]),
    }
    referenced = {
        str(value)
        for record in records
        for value in record["artifacts"].values()
        if value is not None
    }
    _require(
        referenced - virtual <= artifact_names <= referenced | virtual,
        "rejected attempt artifact inventory drifted",
    )
    inventory = {
        "journal": {
            "sha256": sha256_bytes(runner._read_private_file(base, maximum=64 << 20, label="rejected journal")),
            "bytes": base.stat().st_size,
        },
        "lock": {"sha256": sha256_bytes(b""), "bytes": 0},
        "seal": {"sha256": sha256_bytes(seal_raw), "bytes": len(seal_raw)},
        "artifacts": {
            name: {
                "sha256": name,
                "bytes": (artifacts / name).stat().st_size,
            }
            for name in sorted(artifact_names)
        },
    }
    return inventory, (base, lock, artifacts, seal_path)


def _archive_rejected_attempt(run_root: Path, cell: Mapping[str, Any]) -> Path:
    archive = run_root / "tmp" / "rejected-existing-canary-attempt-v1"
    intent_path = archive / "archive-intent.json"
    complete_path = archive / "archive-complete.json"
    if not intent_path.exists():
        inventory, paths = _validate_rejected_attempt(run_root, cell)
        archive.mkdir(mode=0o700, parents=True, exist_ok=False)
        payload: dict[str, Any] = {
            "schema": ARCHIVE_SCHEMA,
            "status": "INTENT",
            "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
            "inventory": inventory,
        }
        payload["manifest_sha256"] = runner._self_hash(payload)
        runner._write_once_or_validate(
            intent_path, canonical_json_bytes(payload), "rejected-attempt archive intent"
        )
    else:
        raw = runner._read_private_file(intent_path, maximum=1 << 20, label="archive intent")
        payload = runner._strict_json(raw, "archive intent")
        _require(
            payload.get("schema") == ARCHIVE_SCHEMA
            and payload.get("status") == "INTENT"
            and payload.get("portfolio_cell_id") == runner.CANARY_PORTFOLIO_CELL_ID
            and payload.get("manifest_sha256") == runner._self_hash(payload),
            "rejected-attempt archive intent drifted",
        )
        identifier = runner.CANARY_PORTFOLIO_CELL_ID
        base = run_root / "events" / f"{identifier}.jsonl"
        paths = (
            base,
            base.with_name(f"{base.name}.lock"),
            base.with_name(f"{base.name}.artifacts"),
            base.with_name(f"{base.name}.seal.json"),
        )
    for source in paths:
        target = archive / source.name
        if source.exists() and not target.exists():
            os.rename(source, target)
        elif target.exists() and not source.exists():
            pass
        else:
            raise AdoptionError(f"ambiguous rejected-attempt archive state: {source.name}")
    inventory = payload.get("inventory")
    _require(type(inventory) is dict, "archive intent inventory is malformed")
    identifier = runner.CANARY_PORTFOLIO_CELL_ID
    archived_base = archive / f"{identifier}.jsonl"
    archived_lock = archive / f"{identifier}.jsonl.lock"
    archived_seal = archive / f"{identifier}.jsonl.seal.json"
    archived_artifacts = archive / f"{identifier}.jsonl.artifacts"
    for key, path, maximum in (
        ("journal", archived_base, 64 << 20),
        ("lock", archived_lock, 0),
        ("seal", archived_seal, 1 << 20),
    ):
        reference = inventory.get(key)
        _require(type(reference) is dict, f"archive {key} reference is malformed")
        raw = runner._read_private_file(path, maximum=maximum, label=f"archived {key}")
        _require(
            len(raw) == reference.get("bytes")
            and sha256_bytes(raw) == reference.get("sha256"),
            f"archived {key} drifted",
        )
    artifact_inventory = inventory.get("artifacts")
    _require(type(artifact_inventory) is dict, "archive artifact inventory is malformed")
    _require(
        set(artifact_inventory) == set(os.listdir(archived_artifacts)),
        "archived artifact names drifted",
    )
    for name, reference in artifact_inventory.items():
        _require(type(reference) is dict, "archive artifact reference is malformed")
        raw = runner._read_private_file(
            archived_artifacts / name,
            maximum=2 << 20,
            label="archived rejected-attempt artifact",
        )
        _require(
            len(raw) == reference.get("bytes") and sha256_bytes(raw) == name,
            "archived rejected-attempt artifact drifted",
        )
    complete: dict[str, Any] = {
        "schema": ARCHIVE_SCHEMA,
        "status": "COMPLETE",
        "intent_sha256": sha256_bytes(
            runner._read_private_file(intent_path, maximum=1 << 20, label="archive intent")
        ),
    }
    complete["manifest_sha256"] = runner._self_hash(complete)
    runner._write_once_or_validate(
        complete_path,
        canonical_json_bytes(complete),
        "rejected-attempt archive completion",
    )
    return complete_path


def _copy_file_create_once_or_validate(source: Path, target: Path, label: str) -> None:
    info = source.lstat()
    _require(
        stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
        f"{label} source is not a private regular file",
    )
    raw = runner._read_private_file(source, maximum=8 << 30, label=label)
    target.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    runner._write_once_or_validate(target, raw, label)


def _copy_source_terminal(run_root: Path) -> None:
    identifier = runner.CANARY_PORTFOLIO_CELL_ID
    source_base = SOURCE_RUN_ROOT / "events" / f"{identifier}.jsonl"
    target_base = run_root / "events" / f"{identifier}.jsonl"
    for suffix in ("", ".lock", ".seal.json"):
        _copy_file_create_once_or_validate(
            source_base.with_name(f"{source_base.name}{suffix}"),
            target_base.with_name(f"{target_base.name}{suffix}"),
            f"adopted canary {suffix or 'journal'}",
        )
    source_artifacts = source_base.with_name(f"{source_base.name}.artifacts")
    target_artifacts = target_base.with_name(f"{target_base.name}.artifacts")
    target_artifacts.mkdir(mode=0o700, parents=True, exist_ok=True)
    for source in sorted(source_artifacts.iterdir(), key=lambda path: path.name):
        _require(
            len(source.name) == 64
            and all(char in "0123456789abcdef" for char in source.name),
            "source artifact filename is not a digest",
        )
        _copy_file_create_once_or_validate(
            source, target_artifacts / source.name, "adopted canary artifact"
        )


def _live_reverify(
    *, base_url: str, source_cell: Mapping[str, Any], terminal: Mapping[str, Any]
) -> dict[str, Any]:
    cnf_ref = source_cell["source_cnf"]
    cnf = runner._read_ref(ROOT, cnf_ref, "source canary CNF", 1 << 30)
    job = PreparedJob(
        EXPECTED_JOB_ID,
        runner.BACKEND,
        runner.SOLVER_PROFILE,
        EXPECTED_CNF_SHA256,
        EXPECTED_IDENTITY_HASH,
        runner.NUM_VARIABLES,
        runner.NUM_CLAUSES,
        True,
        runner.REQUESTED_CORE_LIMIT,
    )
    client = PiqdRawDimacsClient(base_url)
    status = client.status(EXPECTED_JOB_ID)
    expected_status = {
        "id": EXPECTED_JOB_ID,
        "status": "completed",
        "result": "SAT",
        "backend": runner.BACKEND,
        "solver_profile": runner.SOLVER_PROFILE,
        "project": runner.PROJECT,
        "cnf_blob_hash": EXPECTED_CNF_SHA256,
        "identity_hash": EXPECTED_IDENTITY_HASH,
        "requested_core_limit": runner.REQUESTED_CORE_LIMIT,
    }
    for key, value in expected_status.items():
        _require(status.get(key) == value, f"live PIQD {key} drifted")
    _require(
        client.verify_stored_cnf(job, cnf) == EXPECTED_CNF_SHA256,
        "live PIQD CNF verification drifted",
    )
    checked_model = client.checked_model(job, cnf=cnf)
    solver_log, solver_log_sha256 = client.log(job)
    _require(
        sha256_bytes(checked_model.response_body) == EXPECTED_MODEL_SHA256
        and checked_model.response_sha256 == EXPECTED_MODEL_SHA256,
        "live PIQD model artifact drifted",
    )
    _require(
        sha256_bytes(solver_log) == EXPECTED_SOLVER_LOG_SHA256
        and solver_log_sha256 == EXPECTED_SOLVER_LOG_SHA256,
        "live PIQD solver log drifted",
    )
    _require(
        terminal["artifacts"]["model_sha256"] == checked_model.response_sha256,
        "live/local model custody disagrees",
    )
    return {
        "status_sha256": sha256_bytes(canonical_json_bytes(dict(status))),
        "cnf_sha256": EXPECTED_CNF_SHA256,
        "model_sha256": checked_model.response_sha256,
        "solver_log_sha256": solver_log_sha256,
    }


def _write_canary_result(
    *, run_root: Path, checked: Mapping[str, Any], terminal: Mapping[str, Any]
) -> dict[str, Any]:
    _, launch_path, result_path = runner._phase_paths(run_root, "canary")
    launch_raw = runner._read_private_file(
        launch_path, maximum=2 << 20, label="existing canary launch"
    )
    launch = runner._strict_json(launch_raw, "existing canary launch")
    _require(
        launch.get("schema") == runner.LAUNCH_SCHEMA
        and launch.get("phase") == "canary"
        and launch.get("campaign_sha256") == checked["campaign_sha256"]
        and launch.get("run_manifest_sha256") == checked["run_manifest_sha256"]
        and launch.get("selected_cell_ids") == [runner.CANARY_PORTFOLIO_CELL_ID]
        and launch.get("requested_core_limit_per_job")
        == runner.REQUESTED_CORE_LIMIT
        and launch.get("maximum_active_jobs") == 1
        and launch.get("source_preparer_commit") == runner.SOURCE_PREPARER_COMMIT
        and launch.get("canary_acceptance_sha256") is None
        and type(launch.get("live_identity")) is dict
        and launch.get("manifest_sha256") == runner._self_hash(launch),
        "existing canary launch manifest drifted",
    )
    runner._validate_live_identity_attestation(launch["live_identity"])
    payload: dict[str, Any] = {
        "schema": runner.RESULT_SCHEMA,
        "phase": "canary",
        "campaign_sha256": checked["campaign_sha256"],
        "run_manifest_sha256": checked["run_manifest_sha256"],
        "launch_sha256": sha256_bytes(launch_raw),
        "results": [runner._public_result(terminal)],
    }
    payload["manifest_sha256"] = runner._self_hash(payload)
    runner._write_once_or_validate(
        result_path, canonical_json_bytes(payload), "adopted canary phase result"
    )
    return payload


def adopt(*, base_url: str, run_root: Path = runner.OUTPUT_ROOT) -> dict[str, Any]:
    runner._require_production_pins()
    checked = runner.static_check(root=ROOT, run_root=run_root)
    target_cell = _campaign_cell({"cells": checked["cells"]})
    source_campaign_raw = _read_pinned(
        SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json",
        digest=SOURCE_CAMPAIGN_SHA256,
        size=SOURCE_CAMPAIGN_BYTES,
        label="v1 campaign",
    )
    _read_pinned(
        SOURCE_RUN_ROOT / "run_manifest.json",
        digest=SOURCE_RUN_MANIFEST_SHA256,
        size=SOURCE_RUN_MANIFEST_BYTES,
        label="v1 run manifest",
    )
    source_campaign = runner._strict_json(source_campaign_raw, "v1 campaign")
    source_cell = _campaign_cell(source_campaign)
    cell_identity = require_same_cell_identity(source_cell, target_cell)
    source_terminal = runner._terminal_cell(ROOT, SOURCE_RUN_ROOT, source_cell)
    require_expected_source_terminal(source_terminal)
    source_journal = SOURCE_RUN_ROOT / "events" / f"{runner.CANARY_PORTFOLIO_CELL_ID}.jsonl"
    _require(
        sha256_bytes(runner._read_private_file(source_journal, maximum=64 << 20, label="v1 journal"))
        == EXPECTED_SOURCE_JOURNAL_SHA256,
        "v1 journal hash drifted",
    )
    live = _live_reverify(
        base_url=base_url, source_cell=source_cell, terminal=source_terminal
    )
    with runner._cell_lifecycle_lock(run_root, runner.CANARY_PORTFOLIO_CELL_ID):
        try:
            target_terminal = runner._terminal_cell(ROOT, run_root, target_cell)
            require_expected_source_terminal(target_terminal)
            archive_complete = (
                run_root
                / "tmp/rejected-existing-canary-attempt-v1/archive-complete.json"
            )
            _require(
                archive_complete.exists(),
                "adopted terminal lacks the rejected-attempt archive",
            )
        except runner.PortfolioRunnerError:
            archive_complete = _archive_rejected_attempt(run_root, target_cell)
            _copy_source_terminal(run_root)
            target_terminal = runner._terminal_cell(ROOT, run_root, target_cell)
    require_expected_source_terminal(target_terminal)
    _require(
        {key: target_terminal[key] for key in runner._TERMINAL_RESULT_KEYS}
        == {key: source_terminal[key] for key in runner._TERMINAL_RESULT_KEYS},
        "adopted terminal public custody drifted",
    )
    phase_result = _write_canary_result(
        run_root=run_root, checked=checked, terminal=target_terminal
    )
    receipt_path = run_root / "artifacts/v1-canary-adoption.json"
    adapter_raw = runner._read_repo_source_file(
        ROOT / "scripts/adopt_exact17_two_kalmanson_v1_canary_into_v2.py",
        maximum=2 << 20,
        label="adoption adapter",
    )
    archive_raw = runner._read_private_file(
        archive_complete, maximum=1 << 20, label="archive completion"
    )
    archive_payload = runner._strict_json(archive_raw, "archive completion")
    _require(
        archive_payload.get("schema") == ARCHIVE_SCHEMA
        and archive_payload.get("status") == "COMPLETE"
        and archive_payload.get("manifest_sha256")
        == runner._self_hash(archive_payload),
        "archive completion receipt drifted",
    )
    receipt: dict[str, Any] = {
        "schema": SCHEMA,
        "status": "ADOPTED_SEALED_TERMINAL",
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "source_campaign_sha256": SOURCE_CAMPAIGN_SHA256,
        "source_run_manifest_sha256": SOURCE_RUN_MANIFEST_SHA256,
        "target_campaign_sha256": checked["campaign_sha256"],
        "target_run_manifest_sha256": checked["run_manifest_sha256"],
        "cell_identity": cell_identity,
        "source_terminal": source_terminal,
        "target_terminal": target_terminal,
        "live_reverification": live,
        "archived_rejected_attempt_sha256": sha256_bytes(archive_raw),
        "canary_phase_result_sha256": sha256_bytes(canonical_json_bytes(phase_result)),
        "adapter_sha256": sha256_bytes(adapter_raw),
    }
    receipt["manifest_sha256"] = runner._self_hash(receipt)
    runner._write_once_or_validate(
        receipt_path, canonical_json_bytes(receipt), "sealed-canary adoption receipt"
    )
    return receipt


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        result = adopt(base_url=args.base_url)
    except (
        AdoptionError,
        runner.PortfolioRunnerError,
        runner.PiqdOracleError,
        OSError,
    ) as exc:
        print(f"sealed canary adoption rejected: {exc}", file=sys.stderr)
        return 2
    sys.stdout.buffer.write(canonical_json_bytes(result))
    sys.stdout.buffer.flush()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
