# Copyright (c) 2026 Adam McKenna. All rights reserved.
"""Contracts for the authenticated SixHitBisector SAT-profile portfolio."""

from __future__ import annotations

import copy
import hashlib
import json
import subprocess
import sys
from pathlib import Path

import pytest
import run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_sat_portfolio as subject

preparation = subject.preparation


def _source_center02_cells() -> list[dict[str, object]]:
    campaign = json.loads(preparation.SOURCE_CAMPAIGN_PATH.read_bytes())
    return [cell for cell in campaign["cells"] if cell["center"] == 2]


def _read_ref(ref: object) -> dict[str, object]:
    assert isinstance(ref, dict)
    path = ref["path"]
    assert isinstance(path, str)
    return json.loads((subject.ROOT / path).read_bytes())


def test_lane_is_bound_to_audited_six_hit_v2_source() -> None:
    assert preparation.PRODUCTION_PINS_FINALIZED is True
    assert preparation.SOURCE_RUN_ROOT == subject.ROOT / (
        "scratch/runs/exact17-six-hit-bisector-preparer-20260821/"
        "physical-slice-cell-campaign-v2"
    )
    assert preparation.SOURCE_CAMPAIGN_SHA256 == (
        "14d1bac3d84b821c5c01b77cf3893c755a56fa53c60b85adb697fab3ddd37385"
    )
    assert preparation.SOURCE_RUN_MANIFEST_SHA256 == (
        "2b81ca0bbd654c758a7f3f77d58dc3b719f5ab6dac73d02a0580cccda6c27e16"
    )
    assert preparation.SOURCE_PREPARER_COMMIT == (
        "0d739e8ac1109dc6912d4269868caf28e0f9b3dd"
    )
    for value in (
        preparation.SOURCE_CAMPAIGN_SCHEMA,
        preparation.PORTFOLIO_SCHEMA,
        subject.PROJECT,
        subject.LAUNCH_SCHEMA,
        subject.RESULT_SCHEMA,
    ):
        assert "six-hit-bisector" in value
    assert subject.RUN_ROOT == preparation.OUTPUT_ROOT
    assert subject.CAMPAIGN_PATH == (
        preparation.OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    )


def test_exact_six_cell_sat_policy_and_canary() -> None:
    assert preparation.CELL_CATEGORIES == (
        "none",
        "unique-06",
        "unique-07",
        "unique-08",
        "unique-09",
        "unique-10",
    )
    assert preparation.CELL_COUNT == 6
    assert (preparation.NUM_VARIABLES, preparation.NUM_CLAUSES) == (
        308,
        7_409_271,
    )
    assert preparation.SOURCE_SOLVER_PROFILE == "unsat"
    assert preparation.SOLVER_PROFILE == "sat"
    assert preparation.REQUESTED_CORE_LIMIT == 1
    assert preparation.MAX_CONCURRENCY == 6
    assert preparation.SOLVE_TIMEOUT_S == preparation.REPLAY_TIMEOUT_S == 3_600
    assert preparation.portfolio_cell_id("none").endswith(
        "center-02-physical-none-sat-profile-v1"
    )


def test_all_transformed_identities_are_pinned_and_six_way_unique() -> None:
    actual: dict[str, dict[str, str]] = {}
    cells = _source_center02_cells()
    assert [cell["category"] for cell in cells] == list(preparation.CELL_CATEGORIES)
    for ordinal, cell in enumerate(cells):
        category = cell["category"]
        assert isinstance(category, str)
        producer_ref = cell["producer_manifest"]
        wave_ref = cell["wave_manifest"]
        cnf_ref = cell["cnf"]
        assert isinstance(producer_ref, dict)
        assert isinstance(wave_ref, dict)
        assert isinstance(cnf_ref, dict)
        source_producer = _read_ref(producer_ref)
        source_wave = _read_ref(wave_ref)
        producer = preparation.build_producer(
            source_producer, producer_ref["sha256"], category
        )
        producer_sha256 = hashlib.sha256(producer).hexdigest()
        wave = preparation.build_wave(source_wave, producer_sha256, category, ordinal)
        actual[category] = {
            "producer_sha256": producer_sha256,
            "wave_sha256": hashlib.sha256(wave).hexdigest(),
            "identity_hash": preparation.raw_dimacs_identity(
                cnf_ref["sha256"], producer_sha256
            ),
        }
    assert actual == subject.PRODUCTION_CELL_IDENTITIES
    for key in ("producer_sha256", "wave_sha256", "identity_hash"):
        assert len({identity[key] for identity in actual.values()}) == 6


@pytest.mark.parametrize(
    ("key", "replacement"),
    (
        ("source_theorem", "Problem97.wrong"),
        ("source_path", "lean/wrong.lean"),
        ("root_source_path", "lean/root-wrong.lean"),
        ("finite_schema", "wrong/v1"),
    ),
)
def test_producer_rejects_lean_ingress_drift(key: str, replacement: str) -> None:
    cell = _source_center02_cells()[0]
    producer_ref = cell["producer_manifest"]
    assert isinstance(producer_ref, dict)
    source = _read_ref(producer_ref)
    mutated = copy.deepcopy(source)
    source_manifest = mutated["source_manifest"]
    assert isinstance(source_manifest, dict)
    source_manifest[key] = replacement
    with pytest.raises(preparation.PreparationError, match="Lean ingress drifted"):
        preparation.build_producer(mutated, producer_ref["sha256"], "none")


def test_default_source_paths_reach_v2_identity_validation(monkeypatch) -> None:
    observed: dict[str, object] = {}

    def fake_authenticate(**kwargs: object) -> dict[str, object]:
        observed.update(kwargs)
        return {"cells": []}

    monkeypatch.setattr(
        subject, "_BASE_AUTHENTICATE_SOURCE_CAMPAIGN", fake_authenticate
    )
    assert subject._authenticate_source_campaign(
        campaign_path=preparation.SOURCE_CAMPAIGN_PATH,
        source_run_manifest_path=preparation.SOURCE_RUN_MANIFEST_PATH,
        checkpoint_path=preparation.CHECKPOINT_PATH,
    ) == {"cells": []}
    assert observed["campaign_path"] is None
    assert observed["source_run_manifest_path"] is None
    assert observed["checkpoint_path"] is None


def test_static_check_does_not_create_a_missing_runtime_root(tmp_path: Path) -> None:
    run_root = tmp_path / "missing"
    with pytest.raises(
        (subject.PortfolioRunnerError, preparation.PreparationError),
        match="missing|campaign|run root",
    ):
        subject.static_check(root=preparation.ROOT, run_root=run_root)
    assert not run_root.exists()


def test_fresh_only_client_rejects_existing_jobs() -> None:
    class Existing:
        def prepare_cnf(self, **_kwargs: object) -> object:
            class Job:
                existing = True

            return Job()

    client = subject.FreshOnlyPiqdClient(Existing())
    with pytest.raises(subject.PiqdOracleError, match="existing=true"):
        client.prepare_cnf()
    assert client.rejected_existing is True


def test_public_cli_exposes_prepare_and_six_hit_identity() -> None:
    result = subprocess.run(
        [sys.executable, str(Path(subject.__file__)), "--help"],
        capture_output=True,
        text=True,
        check=False,
    )
    assert result.returncode == 0
    assert "SixHitBisector" in result.stdout
    assert "prepare" in result.stdout


def test_public_prepare_command_uses_authenticated_defaults(monkeypatch) -> None:
    calls: list[dict[str, object]] = []

    def fake_prepare(**kwargs: object) -> dict[str, str]:
        calls.append(kwargs)
        return {"status": "TEST"}

    monkeypatch.setattr(subject, "prepare_portfolio", fake_prepare)
    assert subject.main(["prepare"]) == 0
    assert calls == [{}]
