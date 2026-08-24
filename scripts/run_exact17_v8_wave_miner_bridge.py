"""Replay and mine the frozen V8 canary through a diagnostic-only bridge.

The frozen V8 miner reuses the V5 implementation through V7. Two pieces of
inherited state were not rebound by the V8 wrapper: the private runner surface
and the physical-cell clause count. This bridge restores exactly those
already-frozen V8 values so the existing SAT canary can be inspected while the
official miner is repaired and refrozen.

The bridge deliberately cannot emit ``canary-acceptance.json`` or any other
runner-consumable receipt. Its two outputs are diagnostic evidence only and
authenticate the bridge bytes and effective inherited-state bindings. It never
contacts PIQD or a solver.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
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

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_portfolio as runner

BRIDGE_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()
DIAGNOSTIC_SCHEMA = "p97-exact17-v8-wave-miner-diagnostic-bridge/v1"
DIAGNOSTIC_RUN_ROOT = (
    ROOT / "scratch/runs/exact17-v8-canary-diagnostic-mine-20260824/canary-a785104c"
)
DIAGNOSTIC_OUTPUT_ROOT = DIAGNOSTIC_RUN_ROOT / "artifacts"
DIAGNOSTIC_OUTPUT_NAMES = (
    "diagnostic-candidate-ledger.json",
    "diagnostic-replay-mine-receipt.json",
)
INHERITED_RUNNER_SYMBOLS = (
    "PortfolioRunnerError",
    "STRUCTURAL_SAT",
    "_TERMINAL_RESULT_KEYS",
    "_artifact_bytes",
    "_candidate_id",
    "_load_cell_inputs",
    "_terminal_cell",
    "_validate_candidate_records",
)
EXPECTED_INHERITED_DIMENSIONS = (308, 7_409_816)
EXPECTED_POINTS = 17
EXPECTED_ORDER_TABLES = {
    0: (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    1: (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
}
EXPECTED_NAMED_ORDER_VARIABLES = {0: 307, 1: 308}
EXPECTED_INHERITED_SCANNER_CONTRACT_SHA256 = (
    "c1a001b0c01fe7a9bbc71b85af31f89a73c73049021035d9a4ca3f400373d443"
)


class V8WaveMinerBridgeError(RuntimeError):
    """The frozen V8 diagnostic bridge contract drifted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _self_hash(value: Mapping[str, Any]) -> str:
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return sha256_bytes(canonical_json_bytes(unsigned))


def bridge_identity() -> dict[str, str | int]:
    path = ROOT / BRIDGE_RELATIVE
    metadata = path.lstat()
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise V8WaveMinerBridgeError("diagnostic bridge is not a regular file")
    raw = path.read_bytes()
    return {"path": BRIDGE_RELATIVE, "sha256": sha256_bytes(raw), "bytes": len(raw)}


def bind_inherited_runner_surface() -> tuple[str, ...]:
    """Expose exactly the missing inherited symbols required by the miner."""

    for name in INHERITED_RUNNER_SYMBOLS:
        if name in vars(runner):
            raise V8WaveMinerBridgeError(
                f"V8 runner now exports {name}; retire or refreeze the bridge"
            )
        try:
            value = getattr(runner._BASE, name)
        except AttributeError as exc:
            raise V8WaveMinerBridgeError(
                f"inherited V8 runner symbol is unavailable: {name}"
            ) from exc
        setattr(runner, name, value)
    return INHERITED_RUNNER_SYMBOLS


def bind_inherited_miner_state() -> dict[str, Any]:
    """Guard every inherited packet constant and install V8 dimensions."""

    base = miner._PARENT._BASE
    inherited = (base.NUM_VARIABLES, base.NUM_CLAUSES)
    if inherited != EXPECTED_INHERITED_DIMENSIONS:
        raise V8WaveMinerBridgeError("inherited V7 miner dimensions drifted")
    if base.NUM_POINTS != EXPECTED_POINTS:
        raise V8WaveMinerBridgeError("inherited point count drifted")
    if base.ORDER_TABLES != EXPECTED_ORDER_TABLES:
        raise V8WaveMinerBridgeError("inherited named order tables drifted")
    if base.NAMED_ORDER_VARIABLES != EXPECTED_NAMED_ORDER_VARIABLES:
        raise V8WaveMinerBridgeError("inherited named-order variables drifted")
    authoritative = (miner.preparer.VARIABLES, miner.preparer.CELL_CLAUSES)
    runner_dimensions = (runner.NUM_VARIABLES, runner.NUM_CLAUSES)
    if authoritative != (308, 7_409_845) or runner_dimensions != authoritative:
        raise V8WaveMinerBridgeError("authoritative V8 dimensions drifted")
    if tuple(base.SOURCE_VALID_FAMILIES) != tuple(miner.SOURCE_VALID_FAMILIES):
        raise V8WaveMinerBridgeError("source-valid family inventory drifted")
    if dict(base.SCANNER_DEPENDENCIES) != dict(miner.SCANNER_DEPENDENCIES):
        raise V8WaveMinerBridgeError("scanner dependency inventory drifted")
    inherited_scanner_contract = {
        "approved_formalized_stages": sorted(base.APPROVED_FORMALIZED_STAGES),
        "approved_lean_consumers": sorted(base.APPROVED_LEAN_CONSUMERS),
        "scanner_module_names": list(base.SCANNER_MODULE_NAMES),
        "max_json_bytes": base.MAX_JSON_BYTES,
        "receipt_names": list(base.RECEIPT_NAMES),
    }
    contract_sha256 = sha256_bytes(canonical_json_bytes(inherited_scanner_contract))
    if contract_sha256 != EXPECTED_INHERITED_SCANNER_CONTRACT_SHA256:
        raise V8WaveMinerBridgeError("inherited scanner contract drifted")
    base.NUM_VARIABLES, base.NUM_CLAUSES = authoritative
    base.runner = runner
    return {
        "inherited_num_variables": inherited[0],
        "inherited_num_clauses": inherited[1],
        "effective_num_variables": authoritative[0],
        "effective_num_clauses": authoritative[1],
        "num_points": base.NUM_POINTS,
        "named_order_variables": dict(base.NAMED_ORDER_VARIABLES),
        "inherited_scanner_contract_sha256": contract_sha256,
    }


def normalize_run_root(value: Path) -> Path:
    candidate = value if value.is_absolute() else ROOT / value
    try:
        resolved = candidate.resolve(strict=True)
        expected = runner.OUTPUT_ROOT.resolve(strict=True)
    except OSError as exc:
        raise V8WaveMinerBridgeError("portfolio run root is unavailable") from exc
    if resolved != expected:
        raise V8WaveMinerBridgeError("portfolio run-root route drifted")
    return resolved


def normalize_diagnostic_output(value: Path) -> Path:
    candidate = value if value.is_absolute() else ROOT / value
    lexical = Path(os.path.abspath(candidate))
    expected = Path(os.path.abspath(DIAGNOSTIC_OUTPUT_ROOT))
    if lexical != expected:
        raise V8WaveMinerBridgeError("diagnostic output route drifted")
    try:
        current = lexical
        while True:
            metadata = current.lstat()
            if stat.S_ISLNK(metadata.st_mode):
                raise V8WaveMinerBridgeError(
                    "diagnostic output route contains a symlink"
                )
            if current == ROOT:
                break
            if ROOT not in current.parents:
                raise V8WaveMinerBridgeError(
                    "diagnostic output route escaped the repository"
                )
            current = current.parent
        resolved = lexical.resolve(strict=True)
    except OSError as exc:
        raise V8WaveMinerBridgeError(
            "diagnostic output directory is unavailable"
        ) from exc
    if not resolved.is_dir() or resolved != expected:
        raise V8WaveMinerBridgeError("diagnostic output route is not governed scratch")
    return resolved


def build_diagnostic_outputs(
    *,
    root: Path,
    run_root: Path,
    portfolio_cell_id: str,
    bindings: Mapping[str, Any],
) -> dict[str, bytes]:
    """Recompute the exact scan without constructing production acceptance."""

    base = miner._PARENT._BASE
    inputs = base.authenticate_inputs(
        root=root, run_root=run_root, portfolio_cell_id=portfolio_cell_id
    )
    scanner = base.load_scanner_modules(root)
    values, decoded, rows = base.decode_model(
        scanner, inputs.model, expected_center=int(inputs.cell["center"])
    )
    replay = base.replay_dimacs(inputs.cnf, values)
    scanner_raw = base._read_private(
        root / miner.MINER_RELATIVE, 2 << 20, "miner source"
    )
    scanner_sha256 = sha256_bytes(scanner_raw)
    ledger = base.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=scanner.dependency_inventory,
    )
    base.validate_candidate_ledger(
        ledger,
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=scanner.dependency_inventory,
    )
    ledger_raw = canonical_json_bytes(ledger)
    receipt: dict[str, Any] = {
        "schema": DIAGNOSTIC_SCHEMA,
        "status": "PASS",
        "production_acceptance_eligible": False,
        "reason": "bridge identity is outside the frozen V8 production control plane",
        "portfolio_cell_id": portfolio_cell_id,
        "job_id": inputs.terminal["job_id"],
        "bridge": bridge_identity(),
        "frozen_miner": {
            "path": miner.MINER_RELATIVE,
            "sha256": scanner_sha256,
            "bytes": len(scanner_raw),
        },
        "bindings": dict(bindings),
        "replay": dict(replay),
        "candidate_ledger_sha256": sha256_bytes(ledger_raw),
        "candidate_count": ledger["candidates_examined"],
        "complete_no_candidates": ledger["complete_no_candidates"],
    }
    receipt["manifest_sha256"] = _self_hash(receipt)
    return {
        "diagnostic-candidate-ledger.json": ledger_raw,
        "diagnostic-replay-mine-receipt.json": canonical_json_bytes(receipt),
    }


def write_or_verify_outputs(
    *, output_dir: Path, outputs: Mapping[str, bytes], verify_existing: bool
) -> None:
    if set(outputs) != set(DIAGNOSTIC_OUTPUT_NAMES):
        raise V8WaveMinerBridgeError("diagnostic output inventory drifted")
    base = miner._PARENT._BASE
    for name in DIAGNOSTIC_OUTPUT_NAMES:
        path = output_dir / name
        raw = outputs[name]
        if verify_existing:
            try:
                existing = path.read_bytes()
            except OSError as exc:
                raise V8WaveMinerBridgeError(
                    f"diagnostic output is unavailable: {name}"
                ) from exc
            if existing != raw:
                raise V8WaveMinerBridgeError(f"diagnostic output differs: {name}")
        else:
            base._write_once(path, raw)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--cell-id", required=True)
    parser.add_argument("--diagnostic-output-dir", type=Path, required=True)
    parser.add_argument("--verify-existing", action="store_true")
    args = parser.parse_args(sys.argv[1:] if argv is None else argv)
    miner.validate_committed_dependencies()
    miner.preparer.require_production_pins()
    run_root = normalize_run_root(args.run_root)
    output_dir = normalize_diagnostic_output(args.diagnostic_output_dir)
    bind_inherited_runner_surface()
    bindings = bind_inherited_miner_state()
    outputs = build_diagnostic_outputs(
        root=ROOT,
        run_root=run_root,
        portfolio_cell_id=args.cell_id,
        bindings=bindings,
    )
    write_or_verify_outputs(
        output_dir=output_dir,
        outputs=outputs,
        verify_existing=args.verify_existing,
    )
    receipt = json.loads(outputs["diagnostic-replay-mine-receipt.json"])
    print(
        json.dumps(
            {
                "status": "PASS",
                "production_acceptance_eligible": False,
                "candidate_count": receipt["candidate_count"],
                "clauses_checked": receipt["replay"]["clauses_checked"],
                "manifest_sha256": receipt["manifest_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
