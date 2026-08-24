from __future__ import annotations

from pathlib import Path

import pytest
import run_exact17_v8_wave_miner_bridge as bridge


def test_frozen_runner_is_missing_exact_inherited_surface() -> None:
    assert all(name not in vars(bridge.runner) for name in bridge.INHERITED_RUNNER_SYMBOLS)
    assert all(hasattr(bridge.runner._BASE, name) for name in bridge.INHERITED_RUNNER_SYMBOLS)


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


def test_normalize_operator_paths_accepts_only_exact_routes(tmp_path: Path) -> None:
    run_root = tmp_path / "run"
    (run_root / "artifacts").mkdir(parents=True)
    args = bridge.normalize_operator_paths(
        [
            "--run-root",
            "run",
            "--cell-id",
            "cell",
            "--output-dir",
            "run/artifacts",
        ],
        root=tmp_path,
        expected_run_root=run_root,
    )
    assert args[1] == str(run_root.resolve())
    assert args[5] == str((run_root / "artifacts").resolve())


def test_normalize_operator_paths_rejects_wrong_output(tmp_path: Path) -> None:
    run_root = tmp_path / "run"
    (run_root / "artifacts").mkdir(parents=True)
    (tmp_path / "other").mkdir()
    with pytest.raises(bridge.V8WaveMinerBridgeError, match="route drifted"):
        bridge.normalize_operator_paths(
            [
                "--run-root",
                "run",
                "--output-dir",
                "other",
            ],
            root=tmp_path,
            expected_run_root=run_root,
        )
