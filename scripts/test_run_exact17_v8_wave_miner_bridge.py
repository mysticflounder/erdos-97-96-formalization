from __future__ import annotations

import json
from pathlib import Path

import pytest
import run_exact17_v8_wave_miner_bridge as bridge


def test_frozen_runner_is_missing_exact_inherited_surface() -> None:
    assert all(
        name not in vars(bridge.runner) for name in bridge.INHERITED_RUNNER_SYMBOLS
    )
    assert all(
        hasattr(bridge.runner._BASE, name) for name in bridge.INHERITED_RUNNER_SYMBOLS
    )


def test_bind_inherited_runner_surface_is_exact(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    for name in bridge.INHERITED_RUNNER_SYMBOLS:
        monkeypatch.delattr(bridge.runner, name, raising=False)
    assert bridge.bind_inherited_runner_surface() == bridge.INHERITED_RUNNER_SYMBOLS
    for name in bridge.INHERITED_RUNNER_SYMBOLS:
        assert getattr(bridge.runner, name) is getattr(bridge.runner._BASE, name)


def test_bind_rejects_runner_that_already_exports_symbol(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    first = bridge.INHERITED_RUNNER_SYMBOLS[0]
    monkeypatch.setattr(bridge.runner, first, object(), raising=False)
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="retire or refreeze"):
        bridge.bind_inherited_runner_surface()


def test_bind_inherited_miner_state_installs_exact_v8_dimensions(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    base = bridge.miner._PARENT._BASE
    monkeypatch.setattr(base, "NUM_VARIABLES", 308)
    monkeypatch.setattr(base, "NUM_CLAUSES", 7_409_816)
    result = bridge.bind_inherited_miner_state()
    assert (base.NUM_VARIABLES, base.NUM_CLAUSES) == (308, 7_409_845)
    assert result["inherited_num_clauses"] == 7_409_816
    assert result["effective_num_clauses"] == 7_409_845


def test_bind_inherited_miner_state_rejects_unexpected_parent(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    base = bridge.miner._PARENT._BASE
    monkeypatch.setattr(base, "NUM_CLAUSES", 7_409_815)
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="dimensions drifted"):
        bridge.bind_inherited_miner_state()


def test_bind_inherited_miner_state_rejects_scanner_contract_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    base = bridge.miner._PARENT._BASE
    monkeypatch.setattr(base, "NUM_VARIABLES", 308)
    monkeypatch.setattr(base, "NUM_CLAUSES", 7_409_816)
    monkeypatch.setattr(base, "MAX_JSON_BYTES", base.MAX_JSON_BYTES + 1)
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="scanner contract drifted"):
        bridge.bind_inherited_miner_state()


def test_normalize_run_root_accepts_only_exact_route(tmp_path: Path) -> None:
    expected = tmp_path / "run"
    expected.mkdir()
    other = tmp_path / "other"
    other.mkdir()
    original = bridge.runner.OUTPUT_ROOT
    bridge.runner.OUTPUT_ROOT = expected
    try:
        assert bridge.normalize_run_root(expected) == expected.resolve()
        with pytest.raises(bridge.V8WaveMinerBridgeError, match="route drifted"):
            bridge.normalize_run_root(other)
    finally:
        bridge.runner.OUTPUT_ROOT = original


def test_normalize_diagnostic_output_requires_governed_scratch(tmp_path: Path) -> None:
    outside = tmp_path / "outside"
    outside.mkdir()
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="route drifted"):
        bridge.normalize_diagnostic_output(outside)


def test_normalize_diagnostic_output_rejects_production_artifacts() -> None:
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="route drifted"):
        bridge.normalize_diagnostic_output(bridge.runner.OUTPUT_ROOT / "artifacts")


def test_diagnostic_contract_cannot_emit_production_acceptance() -> None:
    assert "canary-acceptance.json" not in bridge.DIAGNOSTIC_OUTPUT_NAMES
    assert "mine-receipt.json" not in bridge.DIAGNOSTIC_OUTPUT_NAMES
    assert "candidate-ledger.json" not in bridge.DIAGNOSTIC_OUTPUT_NAMES
    receipt = {
        "schema": bridge.DIAGNOSTIC_SCHEMA,
        "production_acceptance_eligible": False,
    }
    raw = bridge.canonical_json_bytes(receipt)
    assert json.loads(raw)["production_acceptance_eligible"] is False
