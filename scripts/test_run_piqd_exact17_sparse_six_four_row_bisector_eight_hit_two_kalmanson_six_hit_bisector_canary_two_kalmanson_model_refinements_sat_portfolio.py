# Copyright (c) 2026 Adam McKenna. All rights reserved.
"""Contracts for the authenticated model-refinement SAT-profile portfolio."""

from __future__ import annotations

import copy
import hashlib
import inspect
import json
import os
import subprocess
import sys
from pathlib import Path

import pytest
import run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_portfolio as subject

preparation = subject.preparation


def _source_center02_cells() -> list[dict[str, object]]:
    campaign = json.loads(preparation.SOURCE_CAMPAIGN_PATH.read_bytes())
    return [cell for cell in campaign["cells"] if cell["center"] == 2]


def _read_ref(ref: object) -> dict[str, object]:
    assert isinstance(ref, dict)
    path = ref["path"]
    assert isinstance(path, str)
    return json.loads((subject.ROOT / path).read_bytes())


def test_lane_is_bound_to_audited_model_refinement_v1_source() -> None:
    assert preparation.PRODUCTION_PINS_FINALIZED is True
    assert preparation.PACKAGE_SOURCE_PATHS[0] == subject.CHECKPOINT_RELATIVE
    assert preparation.SOURCE_RUN_ROOT == subject.ROOT / (
        "scratch/runs/exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-preparer-20260821/"
        "physical-slice-cell-campaign-v1"
    )
    assert preparation.SOURCE_CAMPAIGN_SHA256 == (
        "0b3e5718c46ff2fb7397cef42c3430949c27e4fa8562adaa451f285bd4c1bbd8"
    )
    assert preparation.SOURCE_RUN_MANIFEST_SHA256 == (
        "5faf4bdecb1343fa25699a563dbc2c992ab98fbe0c695414ff4122459d2261e0"
    )
    assert preparation.SOURCE_PREPARER_COMMIT == (
        "f6612b9154473c9c1ff6066f4bd3c62975588fb3"
    )
    for value in (
        preparation.SOURCE_CAMPAIGN_SCHEMA,
        preparation.PORTFOLIO_SCHEMA,
        subject.PROJECT,
        subject.LAUNCH_SCHEMA,
        subject.RESULT_SCHEMA,
    ):
        assert "six-hit-bisector" in value
        assert "model-refinements" in value
    assert subject.RUN_ROOT == preparation.OUTPUT_ROOT
    assert subject.CAMPAIGN_PATH == (
        preparation.OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    )


def test_model_refinement_lean_ingress_is_exact() -> None:
    assert subject.EXPECTED_SOURCE_THEOREM.endswith(
        "CanaryTwoKalmansonModelRefinementPhysicalSliceCell"
    )
    assert "ModelRefinementsPhysicalSliceCoverage.lean" in (
        subject.EXPECTED_SOURCE_PATH
    )
    assert subject.EXPECTED_ROOT_SOURCE_PATH.endswith(
        "CanaryTwoKalmansonModelRefinements.lean"
    )
    assert subject.EXPECTED_FINITE_SCHEMA.endswith(
        "canary-two-kalmanson-model-refinements-physical-slice/v1"
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
        7_409_301,
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


def test_producer_rejects_missing_lean_ingress_manifest() -> None:
    cell = _source_center02_cells()[0]
    producer_ref = cell["producer_manifest"]
    assert isinstance(producer_ref, dict)
    source = _read_ref(producer_ref)
    source.pop("source_manifest")
    with pytest.raises(preparation.PreparationError, match="lacks Lean ingress"):
        preparation.build_producer(source, producer_ref["sha256"], "none")


@pytest.mark.parametrize(
    "pin",
    (
        "SOURCE_CAMPAIGN_SHA256",
        "SOURCE_RUN_MANIFEST_SHA256",
    ),
)
def test_source_authentication_rejects_campaign_or_run_hash_drift(
    monkeypatch: pytest.MonkeyPatch, pin: str
) -> None:
    monkeypatch.setattr(preparation, pin, "0" * 64)
    with pytest.raises(preparation.PreparationError, match="drifted|hash|SHA-256"):
        subject._authenticate_source_campaign()


def test_source_authentication_rejects_cell_hash_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    identities = copy.deepcopy(preparation.SOURCE_CELL_IDENTITIES)
    identities["none"]["cnf_sha256"] = "0" * 64
    monkeypatch.setattr(preparation, "SOURCE_CELL_IDENTITIES", identities)
    with pytest.raises(preparation.PreparationError, match="drifted|identity|hash"):
        subject._authenticate_source_campaign()


def test_default_source_paths_reach_v1_identity_validation(monkeypatch) -> None:
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


def test_launch_lock_is_create_once(tmp_path: Path) -> None:
    directory_fd = os.open(tmp_path, os.O_RDONLY | os.O_DIRECTORY)
    try:
        subject._create_once(directory_fd, "launch.lock")
        with pytest.raises(subject.PortfolioRunnerError, match="already exists"):
            subject._create_once(directory_fd, "launch.lock")
    finally:
        os.close(directory_fd)


def test_runner_retains_single_attempt_prepare_confirm_and_finalize_contract() -> None:
    runner_text = inspect.getsource(subject._run_cell)
    assert "max_prepare_attempts=1" in runner_text
    assert "max_confirm_attempts=1" in runner_text
    assert "max_result_attempts=1" in runner_text
    assert "requested_core_limit=preparation.REQUESTED_CORE_LIMIT" in runner_text
    assert "FreshOnlyPiqdClient(PiqdRawDimacsClient(base_url))" in runner_text
    assert "LeanLratReplayer(" in runner_text
    assert "client.rejected_existing" in runner_text


def test_run_cell_rejects_wrong_source_dimensions_before_daemon_use(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    cnf = b"p cnf 308 7409301\n"
    cnf_sha = hashlib.sha256(cnf).hexdigest()
    producer = preparation.canonical_json_bytes(
        {
            "backend": preparation.BACKEND,
            "solver_profile": preparation.SOLVER_PROFILE,
            "query_polarity": preparation.QUERY_POLARITY,
            "variable_map_sha256": preparation.VARIABLE_MAP_SHA256,
        }
    )
    producer_sha = hashlib.sha256(producer).hexdigest()
    wave = preparation.canonical_json_bytes(
        {
            "encoding": {
                "cnf_sha256": cnf_sha,
                "producer_manifest_sha256": producer_sha,
                "variable_map_sha256": preparation.VARIABLE_MAP_SHA256,
                "num_variables": preparation.NUM_VARIABLES,
                "num_clauses": preparation.NUM_CLAUSES - 1,
                "query_polarity": preparation.QUERY_POLARITY,
            },
            "execution": {
                "backend": preparation.BACKEND,
                "solver_profile": preparation.SOLVER_PROFILE,
            },
        }
    )
    wave_sha = hashlib.sha256(wave).hexdigest()
    snapshots = {
        "cnf": preparation.Snapshot("cnf", cnf_sha, len(cnf), cnf),
        "producer": preparation.Snapshot(
            "producer", producer_sha, len(producer), producer
        ),
        "wave": preparation.Snapshot("wave", wave_sha, len(wave), wave),
    }

    def fake_read(
        _root: Path, relative: str, *, maximum_bytes: int
    ) -> preparation.Snapshot:
        assert maximum_bytes > 0
        return snapshots[relative]

    monkeypatch.setattr(subject, "_read_output", fake_read)
    monkeypatch.setattr(
        subject,
        "PiqdRawDimacsClient",
        lambda _base_url: pytest.fail("wrong dimensions reached PIQD"),
    )
    cell = {
        "source_cnf": {"path": "cnf", "sha256": cnf_sha, "bytes": len(cnf)},
        "producer_manifest": {
            "path": "producer",
            "sha256": producer_sha,
            "bytes": len(producer),
        },
        "wave_manifest": {
            "path": "wave",
            "sha256": wave_sha,
            "bytes": len(wave),
        },
        "portfolio_cell_id": "wrong-dimensions",
        "expected_identity_hash": preparation.raw_dimacs_identity(
            cnf_sha, producer_sha
        ),
    }
    with pytest.raises(subject.PortfolioRunnerError, match="encoding drifted"):
        subject._run_cell(tmp_path, tmp_path, cell, "http://127.0.0.1:7272")


def test_public_cli_exposes_prepare_and_six_hit_identity() -> None:
    result = subprocess.run(
        [sys.executable, str(Path(subject.__file__)), "--help"],
        capture_output=True,
        text=True,
        check=False,
    )
    assert result.returncode == 0
    assert "SixHitBisector canary-two-Kalmanson model-refinements" in result.stdout
    assert "prepare" in result.stdout


def test_public_prepare_command_uses_authenticated_defaults(monkeypatch) -> None:
    calls: list[dict[str, object]] = []

    def fake_prepare(**kwargs: object) -> dict[str, str]:
        calls.append(kwargs)
        return {"status": "TEST"}

    monkeypatch.setattr(subject, "prepare_portfolio", fake_prepare)
    assert subject.main(["prepare"]) == 0
    assert calls == [{}]
