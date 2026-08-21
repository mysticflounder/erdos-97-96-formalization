# Copyright (c) 2026 Adam McKenna. All rights reserved.
"""Focused contract tests for the true-EightHit PIQD driver surface."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

import prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio as preparation
import pytest
import run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio as subject


def test_driver_uses_fresh_eight_hit_project_and_preparer() -> None:
    assert subject.preparation is preparation
    assert "eight-hit" in subject.PROJECT
    assert "eight-hit" in subject.LAUNCH_SCHEMA
    assert "eight-hit" in subject.RESULT_SCHEMA
    assert subject.RUN_ROOT == preparation.OUTPUT_ROOT
    assert (
        subject.CAMPAIGN_PATH
        == preparation.OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    )


def test_driver_keeps_six_cell_sat_policy() -> None:
    assert preparation.CELL_COUNT == 6
    assert preparation.SOLVER_PROFILE == "sat"
    assert preparation.REQUESTED_CORE_LIMIT == 1
    assert preparation.MAX_CONCURRENCY == 6
    assert preparation.SOLVE_TIMEOUT_S == preparation.REPLAY_TIMEOUT_S == 3_600


def test_static_check_is_blocked_before_runtime_root_creation(tmp_path) -> None:
    with pytest.raises(
        (subject.PortfolioRunnerError, preparation.PreparationError),
        match="missing|campaign|run root",
    ):
        subject.static_check(root=preparation.ROOT, run_root=tmp_path / "missing")
    assert not (tmp_path / "missing").exists()


def test_fresh_only_client_rejects_existing_jobs() -> None:
    class Existing:
        def prepare_cnf(self, **_kwargs):
            class Job:
                existing = True

            return Job()

    client = subject.FreshOnlyPiqdClient(Existing())
    with pytest.raises(subject.PiqdOracleError, match="existing=true"):
        client.prepare_cnf()
    assert client.rejected_existing is True


def test_public_cli_help_is_finalized_eighthit() -> None:
    result = subprocess.run(
        [sys.executable, str(Path(subject.__file__)), "--help"],
        capture_output=True,
        text=True,
        check=False,
    )
    assert result.returncode == 0
    assert "EightHit" in result.stdout
    assert "finalized" in result.stdout
    assert "v5" in result.stdout


def test_public_main_passes_v5_runtime_paths(monkeypatch) -> None:
    observed = {}

    def fake_static_check(**kwargs):
        observed.update(kwargs)
        return {"status": "TEST"}

    monkeypatch.setattr(subject, "static_check", fake_static_check)
    assert subject.main(["static-check"]) == 0
    assert observed == {"root": preparation.ROOT, "run_root": preparation.OUTPUT_ROOT}
