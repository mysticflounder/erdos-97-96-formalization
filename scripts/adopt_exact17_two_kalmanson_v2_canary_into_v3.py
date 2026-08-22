"""Adopt the authenticated v2 two-Kalmanson canary into v3.

This adapter is intentionally local-only: the v2 adoption receipt already
records live PIQD validation.  Every input is pinned by bytes and hashes,
the v3 duplicate rejection is archived by rename only, and the sealed v2
terminal is copied with create-once semantics.  A mismatch aborts before any
move or copy.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

import run_piqd_exact17_canary_perp_bisector_survivor_two_kalmanson_refinements_sat_portfolio as runner

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes

SCHEMA = "p97-exact17-two-kalmanson-sealed-canary-adoption/v2-to-v3"
ARCHIVE_SCHEMA = f"{SCHEMA}/rejected-attempt-archive/v1"
CELL_ID = "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-none-sat-profile-v1"
V2_ROOT = (
    ROOT
    / "scratch/runs/exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v2-20260822/sat-profile-portfolio-v2"
)
V3_ROOT = (
    ROOT
    / "scratch/runs/exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v3-20260822/sat-profile-portfolio-v3"
)
V2_CAMPAIGN_SHA256 = "908f18a48a515685b11735ba1c8cc83e6a5c4e6f0e6fbc1a7952ab23045579ad"
V2_CAMPAIGN_BYTES = 119920
V2_RUN_SHA256 = "56a791caf0ccba8c29fe365c73180621c55dcf8832901a374c298d46ef8c6239"
V2_RUN_BYTES = 74644
V2_RECEIPT_SHA256 = "31e583b26af9a2c175c7a5dcd217f3984227108555d7dc1ccc51239ce5f80cea"
V2_RECEIPT_BYTES = 3811
V3_CAMPAIGN_SHA256 = "da9ba6d21106d6c9530d6f72415c8b129fed2e4721a7ecf86c811a869fb57253"
V3_CAMPAIGN_BYTES = 119920
V3_RUN_SHA256 = "b8ce88b3ad8d4da59fd1726250f57230089602f00f6a7be09cb5c20cecea2938"
V3_RUN_BYTES = 74644
EXPECTED_JOB_ID = "f2fe634a-929e-449c-89c4-d0e2becd6a01"
EXPECTED_CNF_SHA256 = "4d4f2c031b65121d66abf2f659a5d614fd20d243266ea3ceb44051e0f37e6527"
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
EXPECTED_LOG_SHA256 = "1e549d3cc7e99e19343bf7af1fb0cb32f995563eac4cc042ed70e2dfd9c4b8d0"
REJECTED_DETAIL = (
    "PIQD returned existing=true; no adoption or recovery owner is authorized"
)


class AdoptionError(RuntimeError):
    """An authenticated adoption precondition failed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise AdoptionError(message)


def _read(
    path: Path, *, digest: str | None = None, size: int | None = None, label: str
) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise AdoptionError(f"{label} is missing") from exc
    _require(
        stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
        f"{label} is not private regular custody",
    )
    _require(not stat.S_ISLNK(info.st_mode), f"{label} is a symlink")
    raw = path.read_bytes()
    if size is not None:
        _require(len(raw) == size, f"{label} byte count drifted")
    if digest is not None:
        _require(sha256_bytes(raw) == digest, f"{label} hash drifted")
    return raw


def _reject_constant(value: str) -> None:
    raise AdoptionError(f"non-finite JSON constant: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        _require(key not in result, f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _json(raw: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (TypeError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise AdoptionError(f"{label} is not JSON") from exc
    _require(type(value) is dict, f"{label} is not an object")
    _require(canonical_json_bytes(value) == raw, f"{label} is not canonical JSON")
    return value


def _self_hash(value: Mapping[str, Any], field: str = "manifest_sha256") -> str:
    body = dict(value)
    body.pop(field, None)
    return sha256_bytes(canonical_json_bytes(body))


def _cell(campaign: Mapping[str, Any], label: str) -> dict[str, Any]:
    cells = campaign.get("cells")
    _require(type(cells) is list, f"{label} cells malformed")
    found = [
        c for c in cells if type(c) is dict and c.get("portfolio_cell_id") == CELL_ID
    ]
    _require(len(found) == 1, f"{label} lacks unique pinned canary")
    return found[0]


def _identity(cell: Mapping[str, Any]) -> dict[str, Any]:
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


def _validate_campaign(
    path: Path, digest: str, size: int, version: str
) -> tuple[dict[str, Any], dict[str, Any]]:
    payload = _json(
        _read(path, digest=digest, size=size, label=f"v{version} campaign"),
        f"v{version} campaign",
    )
    _require(
        payload.get("schema")
        == f"p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-profile-campaign/{version}",
        f"v{version} campaign schema drifted",
    )
    cell = _cell(payload, f"v{version} campaign")
    ident = _identity(cell)
    _require(
        ident["cnf_sha256"] == EXPECTED_CNF_SHA256
        and ident["producer_sha256"] == EXPECTED_PRODUCER_SHA256
        and ident["wave_sha256"] == EXPECTED_WAVE_SHA256
        and ident["expected_identity_hash"] == EXPECTED_IDENTITY_HASH,
        f"v{version} canary identity drifted",
    )
    return payload, cell


def _validate_run_manifest(
    path: Path, digest: str, size: int, version: str
) -> dict[str, Any]:
    value = _json(
        _read(path, digest=digest, size=size, label=f"v{version} run manifest"),
        f"v{version} run manifest",
    )
    _require(
        value.get("schema") == "worktree-run-manifest/v1",
        f"v{version} run manifest schema drifted",
    )
    _require(
        value.get("run_id") == f"sat-profile-portfolio-{version}",
        f"v{version} run id drifted",
    )
    return value


def _validate_receipt(path: Path, source_cell: Mapping[str, Any]) -> dict[str, Any]:
    value = _json(
        _read(
            path,
            digest=V2_RECEIPT_SHA256,
            size=V2_RECEIPT_BYTES,
            label="v2 adoption receipt",
        ),
        "v2 adoption receipt",
    )
    _require(
        value.get("schema") == "p97-exact17-two-kalmanson-sealed-canary-adoption/v1"
        and value.get("status") == "ADOPTED_SEALED_TERMINAL",
        "v2 adoption receipt status drifted",
    )
    _require(
        value.get("portfolio_cell_id") == CELL_ID
        and value.get("source_campaign_sha256")
        == "44da46805d9c8f9b92fb20bd6e402d4d5944c172ac29b49c45078b57ecec24cb"
        and value.get("target_campaign_sha256") == V2_CAMPAIGN_SHA256
        and value.get("target_run_manifest_sha256") == V2_RUN_SHA256,
        "v2 adoption receipt bindings drifted",
    )
    _require(
        value.get("manifest_sha256") == _self_hash(value),
        "v2 adoption receipt self-hash drifted",
    )
    _require(
        value.get("cell_identity") == _identity(source_cell),
        "v2 receipt cell identity drifted",
    )
    live = value.get("live_reverification")
    _require(
        live
        == {
            "status_sha256": "4c8fad1bb5b5be890a7b07585bf376111e67a6d76a92e21a68a7c48e3fdd8095",
            "cnf_sha256": EXPECTED_CNF_SHA256,
            "model_sha256": EXPECTED_MODEL_SHA256,
            "solver_log_sha256": EXPECTED_LOG_SHA256,
        },
        "v2 live validation receipt drifted",
    )
    return value


def _validate_terminal(run_root: Path, cell: Mapping[str, Any]) -> dict[str, Any]:
    terminal = runner._terminal_cell(ROOT, run_root, cell)
    expected = {
        "portfolio_cell_id": CELL_ID,
        "job_id": EXPECTED_JOB_ID,
        "outcome": runner.STRUCTURAL_SAT,
        "terminal_record_sha256": EXPECTED_TERMINAL_RECORD_SHA256,
        "journal_record_count": 16,
        "seal_sha256": EXPECTED_SEAL_SHA256,
    }
    for key, val in expected.items():
        _require(terminal.get(key) == val, f"v2 terminal {key} drifted")
    artifacts = terminal.get("artifacts")
    _require(
        type(artifacts) is dict
        and artifacts.get("cnf_sha256") == EXPECTED_CNF_SHA256
        and artifacts.get("model_sha256") == EXPECTED_MODEL_SHA256
        and artifacts.get("solver_log_sha256") == EXPECTED_LOG_SHA256,
        "v2 terminal artifact pins drifted",
    )
    return terminal


def _validate_rejection(
    run_root: Path, cell: Mapping[str, Any]
) -> tuple[dict[str, Any], tuple[Path, ...]]:
    base = run_root / "events" / f"{CELL_ID}.jsonl"
    lock, artifacts, seal_path = (
        base.with_name(base.name + s) for s in (".lock", ".artifacts", ".seal.json")
    )
    _require(
        all(p.exists() for p in (base, lock, artifacts, seal_path)),
        "v3 rejection custody is incomplete",
    )
    _, _, wave = runner._load_cell_inputs(ROOT, cell)
    records = runner._read_journal_records(base, wave)
    _require(
        len(records) == 2 and runner._journal_job_id(records) is None,
        "v3 rejection journal is not exactly two failed-closed records",
    )
    last = records[-1]
    event = last.get("event", {})
    _require(
        last.get("outcome") == "ERROR"
        and event.get("phase") == "PREPARE"
        and event.get("disposition") == "ERROR"
        and event.get("detail") == REJECTED_DETAIL,
        "v3 journal is not the pinned duplicate rejection",
    )
    runner._empty_file_identity(lock, "v3 rejection lock")
    names = runner._validate_artifact_directory(artifacts)
    seal_raw = _read(seal_path, label="v3 rejection seal")
    _require(seal_raw.endswith(b"\n"), "v3 rejection seal is torn")
    seal = _json(seal_raw[:-1], "v3 rejection seal")
    journal_raw = _read(base, label="v3 rejection journal")
    _require(
        seal.get("schema") == "p97-cegar-wave-journal-seal/v1"
        and seal.get("record_count") == 2
        and seal.get("terminal_attempt_sha256") == last["record_sha256"]
        and seal.get("journal_sha256") == sha256_bytes(journal_raw)
        and seal.get("wave_manifest_sha256") == EXPECTED_WAVE_SHA256
        and seal.get("seal_sha256") == _self_hash(seal, "seal_sha256"),
        "v3 rejection seal drifted",
    )
    referenced = {
        str(x)
        for r in records
        for x in r.get("artifacts", {}).values()
        if x is not None
    }
    virtual = {EXPECTED_CNF_SHA256, EXPECTED_PRODUCER_SHA256}
    _require(
        referenced - virtual <= names <= referenced | virtual,
        "v3 rejection artifact inventory drifted",
    )
    inventory = {
        "journal": {"sha256": sha256_bytes(journal_raw), "bytes": len(journal_raw)},
        "lock": {"sha256": sha256_bytes(b""), "bytes": 0},
        "seal": {"sha256": sha256_bytes(seal_raw), "bytes": len(seal_raw)},
        "artifacts": {
            n: {"sha256": n, "bytes": (artifacts / n).stat().st_size}
            for n in sorted(names)
        },
    }
    return inventory, (base, lock, artifacts, seal_path)


def _archive_rejection(run_root: Path, cell: Mapping[str, Any]) -> Path:
    archive = run_root / "tmp" / "rejected-existing-canary-attempt-v2"
    intent = archive / "archive-intent.json"
    complete = archive / "archive-complete.json"
    if complete.exists():
        intent_raw = _read(intent, label="v3 archive intent")
        payload = _json(intent_raw, "v3 archive intent")
        _require(
            payload.get("schema") == ARCHIVE_SCHEMA
            and payload.get("status") == "INTENT"
            and payload.get("portfolio_cell_id") == CELL_ID
            and payload.get("manifest_sha256") == _self_hash(payload),
            "v3 archive intent drifted",
        )
        complete_payload = _json(
            _read(complete, label="v3 archive completion"),
            "v3 archive completion",
        )
        _require(
            complete_payload.get("schema") == ARCHIVE_SCHEMA
            and complete_payload.get("status") == "COMPLETE"
            and complete_payload.get("intent_sha256") == sha256_bytes(intent_raw)
            and complete_payload.get("manifest_sha256") == _self_hash(complete_payload),
            "v3 archive completion drifted",
        )
        _validate_archived_inventory(archive, payload)
        return complete
    if not intent.exists():
        inventory, paths = _validate_rejection(run_root, cell)
        archive.mkdir(mode=0o700, parents=True, exist_ok=False)
        payload: dict[str, Any] = {
            "schema": ARCHIVE_SCHEMA,
            "status": "INTENT",
            "portfolio_cell_id": CELL_ID,
            "inventory": inventory,
        }
        payload["manifest_sha256"] = _self_hash(payload)
        _write_once(intent, canonical_json_bytes(payload), "v3 archive intent")
    else:
        payload = _json(_read(intent, label="v3 archive intent"), "v3 archive intent")
        _require(
            payload.get("schema") == ARCHIVE_SCHEMA
            and payload.get("status") == "INTENT"
            and payload.get("portfolio_cell_id") == CELL_ID
            and payload.get("manifest_sha256") == _self_hash(payload),
            "v3 archive intent drifted",
        )
        base = run_root / "events" / f"{CELL_ID}.jsonl"
        paths = (
            base,
            base.with_name(base.name + ".lock"),
            base.with_name(base.name + ".artifacts"),
            base.with_name(base.name + ".seal.json"),
        )
    for source in paths:
        target = archive / source.name
        if source.exists() and not target.exists():
            os.rename(source, target)
        elif not source.exists() and target.exists():
            continue
        else:
            raise AdoptionError(f"ambiguous archive state: {source.name}")
    _validate_archived_inventory(archive, payload)
    complete_payload = {
        "schema": ARCHIVE_SCHEMA,
        "status": "COMPLETE",
        "intent_sha256": sha256_bytes(_read(intent, label="v3 archive intent")),
    }
    complete_payload["manifest_sha256"] = _self_hash(complete_payload)
    _write_once(
        complete, canonical_json_bytes(complete_payload), "v3 archive completion"
    )
    return complete


def _validate_archived_inventory(archive: Path, payload: Mapping[str, Any]) -> None:
    inventory = payload.get("inventory")
    _require(type(inventory) is dict, "v3 archive inventory malformed")
    for key, name, maximum in (
        ("journal", f"{CELL_ID}.jsonl", 64 << 20),
        ("lock", f"{CELL_ID}.jsonl.lock", 0),
        ("seal", f"{CELL_ID}.jsonl.seal.json", 1 << 20),
    ):
        ref = inventory.get(key)
        _require(type(ref) is dict, f"archive {key} reference malformed")
        raw = _read(archive / name, label=f"archived {key}")
        _require(
            len(raw) == ref.get("bytes") and sha256_bytes(raw) == ref.get("sha256"),
            f"archived {key} drifted",
        )
    artifacts_ref = inventory.get("artifacts")
    _require(type(artifacts_ref) is dict, "archive artifacts reference malformed")
    artifacts = archive / f"{CELL_ID}.jsonl.artifacts"
    names = runner._validate_artifact_directory(artifacts)
    _require(names == set(artifacts_ref), "archived artifact inventory drifted")
    for name in sorted(names):
        ref = artifacts_ref.get(name)
        _require(type(ref) is dict, "archive artifact reference malformed")
        raw = _read(artifacts / name, label="archived artifact")
        _require(
            len(raw) == ref.get("bytes") and sha256_bytes(raw) == ref.get("sha256"),
            "archived artifact drifted",
        )


def _write_once(path: Path, raw: bytes, label: str) -> None:
    path.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    if path.exists():
        _require(_read(path, label=label) == raw, f"{label} drifted")
        return
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    fd = os.open(path, flags, 0o600)
    try:
        written = os.write(fd, raw)
        _require(written == len(raw), f"{label} short write")
    finally:
        os.close(fd)


def _copy_create_once(source: Path, target: Path, label: str) -> None:
    raw = _read(source, label=label)
    _write_once(target, raw, label)


def _copy_terminal(target_root: Path) -> None:
    source_base = V2_ROOT / "events" / f"{CELL_ID}.jsonl"
    target_base = target_root / "events" / f"{CELL_ID}.jsonl"
    for suffix in ("", ".lock", ".seal.json"):
        _copy_create_once(
            source_base.with_name(source_base.name + suffix),
            target_base.with_name(target_base.name + suffix),
            f"adopted terminal {suffix or 'journal'}",
        )
    source_dir = source_base.with_name(source_base.name + ".artifacts")
    target_dir = target_base.with_name(target_base.name + ".artifacts")
    names = runner._validate_artifact_directory(source_dir)
    target_dir.mkdir(mode=0o700, parents=True, exist_ok=True)
    for name in sorted(names):
        _copy_create_once(
            source_dir / name, target_dir / name, "adopted terminal artifact"
        )


def adopt(*, run_root: Path = V3_ROOT) -> dict[str, Any]:
    _, v2_cell = _validate_campaign(
        V2_ROOT / "artifacts/campaign-manifest.json",
        V2_CAMPAIGN_SHA256,
        V2_CAMPAIGN_BYTES,
        "v2",
    )
    _, v3_cell = _validate_campaign(
        run_root / "artifacts/campaign-manifest.json",
        V3_CAMPAIGN_SHA256,
        V3_CAMPAIGN_BYTES,
        "v3",
    )
    _validate_run_manifest(
        V2_ROOT / "run_manifest.json", V2_RUN_SHA256, V2_RUN_BYTES, "v2"
    )
    _validate_run_manifest(
        run_root / "run_manifest.json", V3_RUN_SHA256, V3_RUN_BYTES, "v3"
    )
    _require(_identity(v2_cell) == _identity(v3_cell), "v2/v3 canary identity drifted")
    receipt = _validate_receipt(V2_ROOT / "artifacts/v1-canary-adoption.json", v2_cell)
    source_terminal = _validate_terminal(V2_ROOT, v2_cell)
    _require(
        receipt.get("source_terminal") == source_terminal
        and receipt.get("target_terminal") == source_terminal,
        "v2 receipt terminal custody disagrees",
    )
    archive = _archive_rejection(run_root, v3_cell)
    _copy_terminal(run_root)
    target_terminal = _validate_terminal(run_root, v3_cell)
    _require(target_terminal == source_terminal, "adopted terminal custody drifted")
    archive_raw = _read(archive, label="archive completion")
    adapter_raw = _read(
        ROOT / "scripts/adopt_exact17_two_kalmanson_v2_canary_into_v3.py",
        label="adoption adapter",
    )
    result: dict[str, Any] = {
        "schema": SCHEMA,
        "status": "ADOPTED_SEALED_TERMINAL",
        "portfolio_cell_id": CELL_ID,
        "source_campaign_sha256": V2_CAMPAIGN_SHA256,
        "source_run_manifest_sha256": V2_RUN_SHA256,
        "target_campaign_sha256": V3_CAMPAIGN_SHA256,
        "target_run_manifest_sha256": V3_RUN_SHA256,
        "source_receipt_sha256": V2_RECEIPT_SHA256,
        "source_terminal": source_terminal,
        "target_terminal": target_terminal,
        "archived_rejected_attempt_sha256": sha256_bytes(archive_raw),
        "adapter_sha256": sha256_bytes(adapter_raw),
        "live_validation": receipt["live_reverification"],
    }
    result["manifest_sha256"] = _self_hash(result)
    _write_once(
        run_root / "artifacts/v2-canary-adoption.json",
        canonical_json_bytes(result),
        "v2-to-v3 adoption receipt",
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path, default=V3_ROOT)
    args = parser.parse_args()
    try:
        print(
            json.dumps(
                adopt(run_root=args.run_root), sort_keys=True, separators=(",", ":")
            )
        )
    except AdoptionError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
