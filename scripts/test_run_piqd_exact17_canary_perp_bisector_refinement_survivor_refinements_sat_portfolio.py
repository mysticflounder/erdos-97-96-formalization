from __future__ import annotations

import hashlib
import multiprocessing
import os
import queue
import threading
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest
import run_piqd_exact17_canary_perp_bisector_refinement_survivor_refinements_sat_portfolio as runner

_ORIGINAL_LIVE_DAEMON_ATTESTATION = runner._live_daemon_attestation
_ORIGINAL_AUTHENTICATE_RUNNER_SUPPORT = runner._authenticate_runner_support


def _bounded_capacity_process(
    root: str,
    run_root: str,
    capacity_root: str,
    cell: dict[str, Any],
    acquired: Any,
    release: Any,
) -> None:
    def cell_runner(*args: Any, **kwargs: Any) -> dict[str, Any]:
        del args, kwargs
        acquired.put(os.getpid())
        release.wait(10)
        return _terminal(cell)

    runner._fresh_run_cell = cell_runner
    runner._resume_run_cell = cell_runner
    runner._terminal_cell = lambda *args, **kwargs: _terminal(cell)
    runner._bounded_run(
        [("FRESH", cell)],
        root=Path(root),
        run_root=Path(run_root),
        base_url="unused",
        capacity_root=Path(capacity_root),
    )


@pytest.fixture(autouse=True)
def finalized_test_pins(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(runner, "PRODUCTION_PINS_FINALIZED", True)
    monkeypatch.setattr(runner, "SOURCE_PREPARER_COMMIT", "1" * 40)
    for name in (
        "SOURCE_CAMPAIGN_SHA256",
        "SOURCE_RUN_MANIFEST_SHA256",
        "SOURCE_PREPARER_SHA256",
        "CHECKPOINT_SHA256",
        "MINER_SHA256",
    ):
        monkeypatch.setattr(runner, name, "a" * 64)
    for name in (
        "SOURCE_CAMPAIGN_BYTES",
        "SOURCE_RUN_MANIFEST_BYTES",
        "SOURCE_PREPARER_BYTES",
        "CHECKPOINT_BYTES",
        "MINER_BYTES",
    ):
        monkeypatch.setattr(runner, name, 1)
    source_identities = {f"cell-{index}": {} for index in range(runner.CELL_COUNT)}
    production_identities = {
        cell["portfolio_cell_id"]: {
            "cnf_sha256": cell["source_cnf"]["sha256"],
            "cnf_bytes": cell["source_cnf"]["bytes"],
            "producer_sha256": cell["producer_manifest"]["sha256"],
            "producer_bytes": cell["producer_manifest"]["bytes"],
            "wave_sha256": cell["wave_manifest"]["sha256"],
            "wave_bytes": cell["wave_manifest"]["bytes"],
            "identity_hash": cell["expected_identity_hash"],
        }
        for cell in _cells()
    }
    monkeypatch.setattr(runner, "SOURCE_CELL_IDENTITIES", source_identities)
    monkeypatch.setattr(runner, "PRODUCTION_CELL_IDENTITIES", production_identities)
    monkeypatch.setattr(runner, "MINER_NAME", "source-valid-wave-miner")
    monkeypatch.setattr(runner, "MINER_SCHEMA", "source-valid-wave-miner/v1")
    monkeypatch.setattr(runner, "MINER_VERSION", "1.0.0")
    monkeypatch.setattr(
        runner,
        "PINNED_SOURCE_VALID_FAMILIES",
        ("four-point-two-circle", "kalmanson", "perp-bisector-core"),
    )
    monkeypatch.setattr(
        runner,
        "_authenticate_runner_support",
        lambda root=runner.ROOT: {
            runner.SOURCE_PREPARER_RELATIVE: runner.SOURCE_PREPARER_SHA256,
            runner.CHECKPOINT_RELATIVE: runner.CHECKPOINT_SHA256,
            runner.MINER_RELATIVE: runner.MINER_SHA256,
            "source_preparer_commit": runner.SOURCE_PREPARER_COMMIT,
        },
    )
    monkeypatch.setattr(
        runner,
        "_live_daemon_attestation",
        lambda base_url: {"daemon": "test", "solver": "test", "base": base_url},
    )


def _ref(
    path: str = "artifact", digest: str = "a" * 64, size: int = 1
) -> dict[str, Any]:
    return {"path": path, "sha256": digest, "bytes": size}


def _cells() -> list[dict[str, Any]]:
    roles: list[tuple[int, str]] = [(2, "none")]
    categories = (
        "none",
        "unique-06",
        "unique-07",
        "unique-08",
        "unique-09",
        "unique-10",
    )
    for center in range(17):
        for category in categories:
            if (center, category) != (2, "none"):
                roles.append((center, category))
            if len(roles) == runner.CELL_COUNT:
                break
        if len(roles) == runner.CELL_COUNT:
            break
    result = []
    for ordinal, (center, category) in enumerate(roles):
        source = f"canary-perp-bisector-survivor-refinements-next-center-{center:02d}-physical-{category}"
        result.append(
            {
                "portfolio_cell_id": f"{source}-sat-profile-v1",
                "source_cell_id": source,
                "center": center,
                "category": category,
                "ordinal": ordinal,
                "source_cnf": _ref(f"cells/{ordinal}.cnf"),
                "producer_manifest": _ref(f"cells/{ordinal}.producer.json"),
                "wave_manifest": _ref(f"cells/{ordinal}.wave.json"),
                "expected_identity_hash": f"{ordinal + 1:064x}",
            }
        )
    return result


def _rest_checked(cells: list[dict[str, Any]]) -> tuple[dict[str, Any], dict[str, Any]]:
    acceptance = {"schema": runner.ACCEPTANCE_SCHEMA, "status": "ACCEPTED"}
    return (
        {
            "campaign_sha256": "a" * 64,
            "run_manifest_sha256": "b" * 64,
            "cells": cells,
            "canary_acceptance_validated": True,
            "canary_acceptance_sha256": hashlib.sha256(
                runner.canonical_json_bytes(acceptance)
            ).hexdigest(),
        },
        acceptance,
    )


def _campaign() -> tuple[dict[str, Any], dict[str, Any]]:
    campaign = {
        "schema": runner.CAMPAIGN_SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": runner.CELL_COUNT,
        "execution": {
            "backend": runner.BACKEND,
            "solver_profile": runner.SOLVER_PROFILE,
            "query_polarity": runner.QUERY_POLARITY,
            "requested_core_limit_per_job": 1,
            "solve_timeout_s": 3_600,
            "replay_timeout_s": 3_600,
            "maximum_active_jobs": 12,
        },
        "source_ingress": {
            "source_theorem": runner.EXPECTED_SOURCE_THEOREM,
            "source_path": runner.EXPECTED_SOURCE_PATH,
            "root_source_path": runner.EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": runner.EXPECTED_FINITE_SCHEMA,
            "source_preparer_commit": runner.SOURCE_PREPARER_COMMIT,
        },
        "cells": _cells(),
    }
    campaign_raw = runner.canonical_json_bytes(campaign)
    root = f"scratch/runs/{runner.LANE_ID}/{runner.RUN_ID}"
    run_unsigned = {
        "schema": runner.RUN_MANIFEST_SCHEMA,
        "lane_id": runner.LANE_ID,
        "run_id": runner.RUN_ID,
        "root": root,
        "owner": runner.RUN_OWNER,
        "base_head": runner.BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {},
        "input_digests": {
            f"{root}/artifacts/campaign-manifest.json": hashlib.sha256(
                campaign_raw
            ).hexdigest()
        },
        "created_utc": "2026-08-22T00:00:00Z",
    }
    run = {**run_unsigned, "manifest_sha256": runner._self_hash(run_unsigned)}
    return campaign, run


def _write(path: Path, payload: bytes) -> dict[str, Any]:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    path.chmod(0o600)
    return {
        "path": path.as_posix(),
        "sha256": hashlib.sha256(payload).hexdigest(),
        "bytes": len(payload),
    }


def _terminal(
    cell: dict[str, Any], *, outcome: str = runner.STRUCTURAL_SAT
) -> dict[str, Any]:
    artifacts = {
        "model_sha256": "b" * 64,
        "solver_log_sha256": "c" * 64,
        "proof_sha256": None,
        "proof_checker_sha256": None,
        "proof_replay_sha256": None,
    }
    if outcome == runner.CERTIFIED_UNSAT:
        artifacts = {
            "model_sha256": None,
            "solver_log_sha256": "c" * 64,
            "proof_sha256": "d" * 64,
            "proof_checker_sha256": "e" * 64,
            "proof_replay_sha256": "f" * 64,
        }
    return {
        "portfolio_cell_id": cell["portfolio_cell_id"],
        "job_id": "job-1",
        "outcome": outcome,
        "terminal_record_sha256": "1" * 64,
        "journal_record_count": 9,
        "seal_sha256": "2" * 64,
        "artifacts": artifacts,
    }


def _candidate(
    *,
    family: str = "kalmanson",
    support: list[Any] | None = None,
    payload: dict[str, Any] | None = None,
) -> dict[str, Any]:
    candidate = {
        "schema": runner.WAVE_MINE_CANDIDATE_SCHEMA,
        "family": family,
        "source_valid": True,
        "lean_consumer": "Problem97.Test.sourceValidConsumer",
        "support": [[0, 1], [2, 3]] if support is None else support,
        "payload": {"dimacs_clause": [-2, -1]} if payload is None else payload,
    }
    candidate["candidate_id"] = runner._candidate_id(candidate)
    candidate["record_sha256"] = runner._self_hash(candidate, "record_sha256")
    return candidate


def test_production_commands_fail_closed_before_any_daemon_call(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(runner, "PRODUCTION_PINS_FINALIZED", False)
    called = False

    def forbidden(*args: Any, **kwargs: Any) -> Any:
        nonlocal called
        called = True
        raise AssertionError("daemon must not be touched")

    monkeypatch.setattr(runner, "PiqdRawDimacsClient", forbidden)
    with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
        runner.prepare_portfolio()
    with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
        runner.static_check()
    with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
        runner.start_canary(base_url="http://forbidden")
    with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
        runner.start_rest(base_url="http://forbidden")
    assert called is False


def test_every_internal_mutating_route_is_gated_before_files_or_daemon(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(runner, "PRODUCTION_PINS_FINALIZED", False)
    cell = _cells()[0]
    job = runner.PreparedJob(
        "job-1", "cadical", "sat", "a" * 64, "b" * 64, 308, 1, False, 1
    )
    calls = (
        lambda: runner._reserve_cell(tmp_path, "cell"),
        lambda: runner._phase_lock(tmp_path, "rest", b"launch"),
        lambda: runner._confirm_and_refresh(object(), job, b"cnf"),
        lambda: runner._fresh_run_cell(tmp_path, tmp_path, cell, "unused"),
        lambda: runner._resume_run_cell(tmp_path, tmp_path, cell, "unused"),
        lambda: runner._bounded_run(
            [],
            root=tmp_path,
            run_root=tmp_path,
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        ),
        lambda: runner._execute_phase(
            phase="rest",
            root=tmp_path,
            run_root=tmp_path,
            base_url="unused",
        ),
    )
    for call in calls:
        with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
            call()
    assert not tmp_path.exists() or not any(tmp_path.iterdir())


def test_runner_support_accepts_0644_and_reauthenticates_all_pins(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source_relative = "scripts/source-preparer.py"
    checkpoint_relative = ".codex/worktree-checkpoints/runner.json"
    miner_relative = "scripts/wave-miner.py"
    source = b"source-preparer\n"
    checkpoint = b'{"checkpoint":true}\n'
    miner = b"wave-miner\n"
    _write(tmp_path / source_relative, source)
    _write(tmp_path / checkpoint_relative, checkpoint)
    _write(tmp_path / miner_relative, miner)
    for relative in (source_relative, checkpoint_relative, miner_relative):
        (tmp_path / relative).chmod(0o644)
    monkeypatch.setattr(runner, "SOURCE_PREPARER_RELATIVE", source_relative)
    monkeypatch.setattr(runner, "CHECKPOINT_RELATIVE", checkpoint_relative)
    monkeypatch.setattr(runner, "MINER_RELATIVE", miner_relative)
    monkeypatch.setattr(
        runner, "SOURCE_PREPARER_SHA256", hashlib.sha256(source).hexdigest()
    )
    monkeypatch.setattr(runner, "SOURCE_PREPARER_BYTES", len(source))
    monkeypatch.setattr(
        runner, "CHECKPOINT_SHA256", hashlib.sha256(checkpoint).hexdigest()
    )
    monkeypatch.setattr(runner, "CHECKPOINT_BYTES", len(checkpoint))
    monkeypatch.setattr(runner, "MINER_SHA256", hashlib.sha256(miner).hexdigest())
    monkeypatch.setattr(runner, "MINER_BYTES", len(miner))
    observed = _ORIGINAL_AUTHENTICATE_RUNNER_SUPPORT(tmp_path)
    assert observed == {
        source_relative: hashlib.sha256(source).hexdigest(),
        checkpoint_relative: hashlib.sha256(checkpoint).hexdigest(),
        miner_relative: hashlib.sha256(miner).hexdigest(),
        "source_preparer_commit": runner.SOURCE_PREPARER_COMMIT,
    }
    (tmp_path / source_relative).write_bytes(b"SOURCE-PREPARER\n")
    (tmp_path / source_relative).chmod(0o644)
    with pytest.raises(runner.PortfolioRunnerError, match="support pin drifted"):
        _ORIGINAL_AUTHENTICATE_RUNNER_SUPPORT(tmp_path)
    (tmp_path / source_relative).write_bytes(source)
    (tmp_path / source_relative).chmod(0o644)
    (tmp_path / checkpoint_relative).write_bytes(b'{"checkpoint":false}\n')
    (tmp_path / checkpoint_relative).chmod(0o644)
    with pytest.raises(runner.PortfolioRunnerError, match="support pin drifted"):
        _ORIGINAL_AUTHENTICATE_RUNNER_SUPPORT(tmp_path)


def test_all_start_routes_fail_on_support_drift_before_daemon_or_files(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    def drift(root: Path = runner.ROOT) -> dict[str, str]:
        del root
        raise runner.PortfolioRunnerError("support drift")

    touched_daemon = False

    def forbidden(*args: Any, **kwargs: Any) -> Any:
        nonlocal touched_daemon
        touched_daemon = True
        raise AssertionError("daemon must not be touched")

    monkeypatch.setattr(runner, "_authenticate_runner_support", drift)
    monkeypatch.setattr(runner, "_live_daemon_attestation", forbidden)
    monkeypatch.setattr(runner, "PiqdRawDimacsClient", forbidden)
    cell = _cells()[0]
    calls = (
        lambda: runner.static_check(root=tmp_path, run_root=tmp_path / "run"),
        lambda: runner._fresh_run_cell(tmp_path, tmp_path / "run", cell, "unused"),
        lambda: runner._resume_run_cell(tmp_path, tmp_path / "run", cell, "unused"),
        lambda: runner._bounded_run(
            [],
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        ),
        lambda: runner._execute_phase(
            phase="canary",
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
        ),
    )
    for call in calls:
        with pytest.raises(runner.PortfolioRunnerError, match="support drift"):
            call()
    assert touched_daemon is False
    assert not any(tmp_path.iterdir())


def test_static_check_binds_every_governed_source_and_detects_runner_tamper(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    relative_payloads = {
        "source.py": b"source\n",
        "checkpoint.json": b"{}\n",
        "miner.py": b"miner\n",
        "runner.py": b"runner\n",
        "runner-test.py": b"runner-test\n",
    }
    for relative, raw in relative_payloads.items():
        _write(tmp_path / relative, raw)
        (tmp_path / relative).chmod(0o644)
    monkeypatch.setattr(runner, "SOURCE_PREPARER_RELATIVE", "source.py")
    monkeypatch.setattr(runner, "CHECKPOINT_RELATIVE", "checkpoint.json")
    monkeypatch.setattr(runner, "MINER_RELATIVE", "miner.py")
    monkeypatch.setattr(runner, "RUNNER_RELATIVE", "runner.py")
    monkeypatch.setattr(runner, "RUNNER_TEST_RELATIVE", "runner-test.py")
    monkeypatch.setattr(
        runner,
        "SOURCE_PREPARER_SHA256",
        hashlib.sha256(relative_payloads["source.py"]).hexdigest(),
    )
    monkeypatch.setattr(
        runner, "SOURCE_PREPARER_BYTES", len(relative_payloads["source.py"])
    )
    monkeypatch.setattr(
        runner,
        "CHECKPOINT_SHA256",
        hashlib.sha256(relative_payloads["checkpoint.json"]).hexdigest(),
    )
    monkeypatch.setattr(
        runner, "CHECKPOINT_BYTES", len(relative_payloads["checkpoint.json"])
    )
    monkeypatch.setattr(
        runner,
        "MINER_SHA256",
        hashlib.sha256(relative_payloads["miner.py"]).hexdigest(),
    )
    monkeypatch.setattr(runner, "MINER_BYTES", len(relative_payloads["miner.py"]))
    monkeypatch.setattr(
        runner, "_authenticate_runner_support", _ORIGINAL_AUTHENTICATE_RUNNER_SUPPORT
    )
    campaign, run = _campaign()
    source_root_relative = "scratch/runs/source-preparer/preparation-v1"
    source_root = tmp_path / source_root_relative
    monkeypatch.setattr(runner, "SOURCE_RUN_ROOT_RELATIVE", source_root_relative)
    source_cells = []
    for ordinal, output_cell in enumerate(_cells()):
        refs = {}
        for key, suffix in (
            ("cnf", "cnf"),
            ("producer_manifest", "producer.json"),
            ("wave_manifest", "wave.json"),
        ):
            raw = f"{ordinal}:{suffix}\n".encode()
            ref = _write(source_root / "inputs" / f"{ordinal}.{suffix}", raw)
            ref["path"] = (
                (source_root / "inputs" / f"{ordinal}.{suffix}")
                .relative_to(tmp_path)
                .as_posix()
            )
            refs[key] = ref
        source_cells.append(
            {
                "cell_id": output_cell["source_cell_id"],
                "ordinal": ordinal,
                **refs,
            }
        )
    source_campaign = {
        "schema": runner.SOURCE_CAMPAIGN_SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": runner.CELL_COUNT,
        "cells": source_cells,
    }
    source_run = {
        "schema": runner.RUN_MANIFEST_SCHEMA,
        "root": source_root_relative,
    }
    source_campaign_raw = runner.canonical_json_bytes(source_campaign)
    source_run_raw = runner.canonical_json_bytes(source_run)
    _write(source_root / "artifacts/campaign-manifest.json", source_campaign_raw)
    _write(source_root / "run_manifest.json", source_run_raw)
    monkeypatch.setattr(
        runner,
        "SOURCE_CAMPAIGN_SHA256",
        hashlib.sha256(source_campaign_raw).hexdigest(),
    )
    monkeypatch.setattr(runner, "SOURCE_CAMPAIGN_BYTES", len(source_campaign_raw))
    monkeypatch.setattr(
        runner,
        "SOURCE_RUN_MANIFEST_SHA256",
        hashlib.sha256(source_run_raw).hexdigest(),
    )
    monkeypatch.setattr(runner, "SOURCE_RUN_MANIFEST_BYTES", len(source_run_raw))
    run["source_digests"] = {
        relative: hashlib.sha256(raw).hexdigest()
        for relative, raw in relative_payloads.items()
    }
    run_root = tmp_path / f"scratch/runs/{runner.LANE_ID}/{runner.RUN_ID}"
    campaign_raw = runner.canonical_json_bytes(campaign)
    run["input_digests"] = runner._authoritative_input_digests(
        tmp_path, run_root, campaign_raw
    )
    run["manifest_sha256"] = runner._self_hash(run)
    _write(
        run_root / "artifacts/campaign-manifest.json",
        campaign_raw,
    )
    _write(run_root / "run_manifest.json", runner.canonical_json_bytes(run))
    assert len(runner.static_check(root=tmp_path, run_root=run_root)["cells"]) == 76
    (tmp_path / "runner.py").write_bytes(b"RUNNER\n")
    (tmp_path / "runner.py").chmod(0o644)
    with pytest.raises(runner.PortfolioRunnerError, match="run-manifest hash drifted"):
        runner.static_check(root=tmp_path, run_root=run_root)
    (tmp_path / "runner.py").write_bytes(relative_payloads["runner.py"])
    (tmp_path / "runner.py").chmod(0o644)
    removed = next(
        key for key in run["input_digests"] if key.endswith(".producer.json")
    )
    original = run["input_digests"].pop(removed)
    run["manifest_sha256"] = runner._self_hash(run)
    _write(run_root / "run_manifest.json", runner.canonical_json_bytes(run))
    with pytest.raises(runner.PortfolioRunnerError, match="input provenance"):
        runner.static_check(root=tmp_path, run_root=run_root)
    run["input_digests"][removed] = "0" * 64
    run["manifest_sha256"] = runner._self_hash(run)
    _write(run_root / "run_manifest.json", runner.canonical_json_bytes(run))
    with pytest.raises(runner.PortfolioRunnerError, match="input provenance"):
        runner.static_check(root=tmp_path, run_root=run_root)
    run["input_digests"][removed] = original


def test_live_identity_rejects_non_loopback_and_wrong_solver_capability(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    with pytest.raises(runner._legacy.PortfolioRunnerError, match="http"):
        runner._legacy._http_json("https://127.0.0.1:7272", "/version")
    with pytest.raises(runner._legacy.PortfolioRunnerError, match="loopback"):
        runner._legacy._http_json("http://example.com:7272", "/version")

    def wrong_solver(base_url: str, target: str) -> dict[str, Any]:
        del base_url
        if target == "/version":
            return {"daemon": runner._legacy.DAEMON_IDENTITY}
        return {
            "daemon": runner._legacy.DAEMON_IDENTITY,
            "solvers": [
                {
                    "name": runner._legacy.SOLVER_NAME,
                    "sha256": "0" * 64,
                    "solver_signature": runner._legacy.SOLVER_SIGNATURE,
                    "protocol_version": runner._legacy.DAEMON_IDENTITY[
                        "protocol_version"
                    ],
                    "backend": runner.BACKEND,
                    "lane": "sat",
                    "usable": True,
                }
            ],
        }

    with pytest.raises(runner._legacy.PortfolioRunnerError, match="SHA-256"):
        runner._legacy.live_identity("http://127.0.0.1:7272", fetch_json=wrong_solver)

    monkeypatch.setattr(
        runner._legacy,
        "live_identity",
        lambda base_url: {"version": {"daemon": {}}, "solver": {}},
    )
    monkeypatch.setattr(
        runner._legacy,
        "_http_json",
        lambda base_url, target: {"max_workers": 13},
    )
    with pytest.raises(runner.PortfolioRunnerError, match="twelve-core"):
        _ORIGINAL_LIVE_DAEMON_ATTESTATION("http://127.0.0.1:7272")


@pytest.mark.parametrize(
    "mutation",
    (
        "missing",
        "duplicate",
        "bool-queued",
        "negative-running",
        "too-large-floor",
        "bad-scope",
    ),
)
def test_live_identity_requires_one_well_formed_project_row(
    mutation: str, monkeypatch: pytest.MonkeyPatch
) -> None:
    project = {
        "name": runner.PROJECT,
        "min_workers": 0,
        "running": 0,
        "queued": 0,
        "created_at": 1,
        "updated_at": 2,
        "ce_scope": None,
    }
    projects: list[dict[str, Any]] = [project]
    if mutation == "missing":
        projects = [{**project, "name": "some-other-project"}]
    elif mutation == "duplicate":
        projects = [project, dict(project)]
    elif mutation == "bool-queued":
        project["queued"] = True
    elif mutation == "negative-running":
        project["running"] = -1
    elif mutation == "too-large-floor":
        project["min_workers"] = runner.MAX_ACTIVE_JOBS + 1
    elif mutation == "bad-scope":
        project["ce_scope"] = []
    capacity = {
        "max_workers": runner.MAX_ACTIVE_JOBS,
        "committed_workers": 0,
        "projects": projects,
    }
    monkeypatch.setattr(
        runner._legacy,
        "live_identity",
        lambda base_url: {"version": {"daemon": {}}, "solver": {}},
    )
    monkeypatch.setattr(runner._legacy, "_http_json", lambda base_url, target: capacity)
    with pytest.raises(runner.PortfolioRunnerError, match="PIQD project"):
        _ORIGINAL_LIVE_DAEMON_ATTESTATION("http://127.0.0.1:7272")


def test_live_identity_persists_exact_project_row(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    project = {
        "name": runner.PROJECT,
        "min_workers": 0,
        "running": 1,
        "queued": 2,
        "created_at": 1,
        "updated_at": 2,
        "ce_scope": "exact17",
    }
    monkeypatch.setattr(
        runner._legacy,
        "live_identity",
        lambda base_url: {"version": {"daemon": {}}, "solver": {}},
    )
    monkeypatch.setattr(
        runner._legacy,
        "_http_json",
        lambda base_url, target: {
            "max_workers": runner.MAX_ACTIVE_JOBS,
            "committed_workers": 3,
            "projects": [project],
        },
    )
    observed = _ORIGINAL_LIVE_DAEMON_ATTESTATION("http://127.0.0.1:7272")
    assert observed["project"] == project
    assert observed["fetched_endpoints"] == ["/version", "/solvers", "/projects"]


def test_confirm_completion_is_refetched_with_result() -> None:
    job = runner.PreparedJob(
        "job-1", "cadical", "sat", "a" * 64, "b" * 64, 308, 1, False, 1
    )

    class Client:
        def confirm(self, prepared: Any, *, expected_cnf: bytes) -> str:
            assert prepared is job and expected_cnf == b"cnf"
            return "completed"

        def status(self, job_id: str) -> dict[str, Any]:
            return {"id": job_id, "status": "completed", "result": "SAT"}

    payload, state, result = runner._confirm_and_refresh(Client(), job, b"cnf")
    assert payload["result"] == "SAT"
    assert (state, result) == ("completed", "SAT")


def test_campaign_contract_is_exactly_76_cells_and_center2_none_canary() -> None:
    campaign, run = _campaign()
    checked = runner.validate_campaign_payload(campaign, run)
    assert len(checked["cells"]) == 76
    assert (
        sum(
            cell["portfolio_cell_id"] == runner.CANARY_PORTFOLIO_CELL_ID
            for cell in checked["cells"]
        )
        == 1
    )


@pytest.mark.parametrize(
    "mutation",
    [
        "count",
        "dimension-policy",
        "duplicate",
        "canary",
        "source-commit",
        "campaign-extra",
        "run-extra",
    ],
)
def test_campaign_contract_rejects_layout_and_policy_drift(mutation: str) -> None:
    campaign, run = _campaign()
    if mutation == "count":
        campaign["cell_count"] = 75
    elif mutation == "dimension-policy":
        campaign["execution"]["maximum_active_jobs"] = 13
    elif mutation == "duplicate":
        campaign["cells"][1] = dict(campaign["cells"][0], ordinal=1)
    elif mutation == "canary":
        campaign["cells"][0]["center"] = 3
    elif mutation == "source-commit":
        campaign["source_ingress"]["source_preparer_commit"] = "2" * 40
    elif mutation == "campaign-extra":
        campaign["unexpected"] = True
    else:
        run["unexpected"] = True
    with pytest.raises(runner.PortfolioRunnerError):
        runner.validate_campaign_payload(campaign, run)


def test_policy_is_one_core_and_runner_cap_is_twelve() -> None:
    policy = runner._policy()
    assert policy.requested_core_limit == 1
    assert runner.MAX_ACTIVE_JOBS == 12


def test_bounded_scheduler_never_exceeds_twelve_active_jobs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    lock = threading.Lock()
    active = 0
    high_water = 0

    def cell_runner(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        nonlocal active, high_water
        with lock:
            active += 1
            high_water = max(high_water, active)
        time.sleep(0.01)
        with lock:
            active -= 1
        return _terminal(cell)

    cells = _cells()[:37]
    monkeypatch.setattr(runner, "_fresh_run_cell", cell_runner)
    monkeypatch.setattr(runner, "_resume_run_cell", cell_runner)
    monkeypatch.setattr(
        runner, "_terminal_cell", lambda root, run_root, cell: _terminal(cell)
    )
    results = runner._bounded_run(
        [("FRESH", cell) for cell in cells],
        root=tmp_path,
        run_root=tmp_path / "run",
        base_url="unused",
        capacity_root=tmp_path / "capacity",
    )
    assert len(results) == len(cells)
    assert high_water <= 12
    assert high_water > 1


def test_two_concurrent_schedulers_share_one_twelve_slot_capacity(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    guard = threading.Lock()
    active = 0
    high_water = 0

    def cell_runner(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        nonlocal active, high_water
        with guard:
            active += 1
            high_water = max(high_water, active)
        time.sleep(0.02)
        with guard:
            active -= 1
        return _terminal(cell)

    def run_batch(offset: int) -> list[dict[str, Any]]:
        cells = _cells()[offset : offset + 20]
        return runner._bounded_run(
            [("FRESH", cell) for cell in cells],
            root=tmp_path,
            run_root=tmp_path / f"run-{offset}",
            base_url="unused",
            capacity_root=tmp_path / "shared-capacity",
        )

    monkeypatch.setattr(runner, "_fresh_run_cell", cell_runner)
    monkeypatch.setattr(runner, "_resume_run_cell", cell_runner)
    monkeypatch.setattr(
        runner, "_terminal_cell", lambda root, run_root, cell: _terminal(cell)
    )
    with ThreadPoolExecutor(max_workers=2) as executor:
        results = [
            future.result()
            for future in (
                executor.submit(run_batch, 0),
                executor.submit(run_batch, 20),
            )
        ]
    assert sum(map(len, results)) == 40
    assert 1 < high_water <= runner.MAX_ACTIVE_JOBS


def test_capacity_lease_is_shared_across_processes(tmp_path: Path) -> None:
    context = multiprocessing.get_context("fork")
    acquired = context.Queue()
    release = context.Event()
    processes = [
        context.Process(
            target=_bounded_capacity_process,
            args=(
                tmp_path.as_posix(),
                (tmp_path / "process-run").as_posix(),
                (tmp_path / "process-capacity").as_posix(),
                _cells()[index],
                acquired,
                release,
            ),
        )
        for index in range(runner.MAX_ACTIVE_JOBS + 1)
    ]
    try:
        for process in processes:
            process.start()
        first_wave = {acquired.get(timeout=10) for _ in range(runner.MAX_ACTIVE_JOBS)}
        assert len(first_wave) == runner.MAX_ACTIVE_JOBS
        with pytest.raises(queue.Empty):
            acquired.get(timeout=0.25)
        release.set()
        assert acquired.get(timeout=10) not in first_wave
        for process in processes:
            process.join(timeout=10)
        assert all(process.exitcode == 0 for process in processes)
    finally:
        release.set()
        for process in processes:
            if process.is_alive():
                process.terminate()
            process.join(timeout=2)


def test_bounded_scheduler_routes_resume_without_fresh_submission(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    calls: list[tuple[str, str]] = []

    def fresh(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        calls.append(("fresh", cell["portfolio_cell_id"]))
        return _terminal(cell)

    def resume(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        calls.append(("resume", cell["portfolio_cell_id"]))
        return _terminal(cell)

    cells = _cells()[:5]
    monkeypatch.setattr(runner, "_fresh_run_cell", fresh)
    monkeypatch.setattr(runner, "_resume_run_cell", resume)
    monkeypatch.setattr(
        runner, "_terminal_cell", lambda root, run_root, cell: _terminal(cell)
    )
    runner._bounded_run(
        [
            ("RESUME", cells[0]),
            ("FRESH", cells[1]),
            ("RESERVED", cells[2]),
            ("RESUME_PREPARE", cells[3]),
            ("RESEAL", cells[4]),
        ],
        root=tmp_path,
        run_root=tmp_path / "run",
        base_url="unused",
        capacity_root=tmp_path / "capacity",
    )
    assert sorted(kind for kind, _ in calls) == [
        "fresh",
        "fresh",
        "resume",
        "resume",
        "resume",
    ]


def test_bounded_scheduler_rejects_unpinned_cell_before_runner(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = dict(_cells()[1])
    cell["expected_identity_hash"] = "f" * 64
    called = False

    def forbidden(*args: Any, **kwargs: Any) -> dict[str, Any]:
        nonlocal called
        called = True
        return {}

    monkeypatch.setattr(runner, "_fresh_run_cell", forbidden)
    monkeypatch.setattr(runner, "_resume_run_cell", forbidden)

    with pytest.raises(runner.PortfolioRunnerError, match="byte-exactly"):
        runner._bounded_run(
            [("FRESH", cell)],
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        )
    assert called is False


def test_bounded_scheduler_rejects_duplicate_cell_before_runner(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = _cells()[1]
    called = False

    def forbidden(*args: Any, **kwargs: Any) -> dict[str, Any]:
        nonlocal called
        called = True
        return {}

    monkeypatch.setattr(runner, "_fresh_run_cell", forbidden)
    monkeypatch.setattr(runner, "_resume_run_cell", forbidden)
    with pytest.raises(runner.PortfolioRunnerError, match="duplicate"):
        runner._bounded_run(
            [("FRESH", cell), ("RESUME", cell)],
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        )
    assert called is False


def test_bounded_scheduler_reconstructs_and_checks_terminal_custody(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = _cells()[1]
    reported = _terminal(cell)
    custody = _terminal(cell)
    custody["job_id"] = "different-job"
    monkeypatch.setattr(runner, "_fresh_run_cell", lambda *args: reported)
    monkeypatch.setattr(runner, "_resume_run_cell", lambda *args: reported)
    monkeypatch.setattr(runner, "_terminal_cell", lambda *args: custody)
    with pytest.raises(runner.PortfolioRunnerError, match="disagrees"):
        runner._bounded_run(
            [("FRESH", cell)],
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        )
    with pytest.raises(TypeError):
        runner._bounded_run(
            [("FRESH", cell)],
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            fresh_runner=lambda *args: reported,  # type: ignore[call-arg]
        )


def test_direct_duplicate_cell_lifecycle_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = _cells()[0]
    entered = threading.Event()
    release = threading.Event()

    def under_lock(*args: Any, **kwargs: Any) -> dict[str, Any]:
        del args, kwargs
        entered.set()
        assert release.wait(5)
        return _terminal(cell)

    monkeypatch.setattr(
        runner,
        "_load_cell_inputs",
        lambda root, selected: (b"cnf", b"producer", {}),
    )
    monkeypatch.setattr(runner, "_fresh_run_cell_under_lock", under_lock)
    with ThreadPoolExecutor(max_workers=1) as executor:
        first = executor.submit(
            runner._fresh_run_cell, tmp_path, tmp_path / "run", cell, "unused"
        )
        assert entered.wait(5)
        with pytest.raises(runner.PortfolioRunnerError, match="already active"):
            runner._fresh_run_cell(tmp_path, tmp_path / "run", cell, "unused")
        release.set()
        assert first.result()["portfolio_cell_id"] == cell["portfolio_cell_id"]


def test_phase_derives_authoritative_campaign_and_membership_internally(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cells = _cells()
    checked, acceptance = _rest_checked(cells)
    observed: list[list[str]] = []

    def authenticate(root: Path, selected: list[dict[str, Any]]) -> dict[str, Any]:
        del root
        observed.append([cell["portfolio_cell_id"] for cell in selected])
        raise runner.PortfolioRunnerError("selection observed")

    monkeypatch.setattr(runner, "static_check", lambda **kwargs: dict(checked))
    monkeypatch.setattr(runner, "_authenticate_selected", authenticate)
    monkeypatch.setattr(
        runner, "_validate_acceptance", lambda root, run_root, value: acceptance
    )
    for phase, expected in (
        ("canary", [cells[0]["portfolio_cell_id"]]),
        ("rest", [cell["portfolio_cell_id"] for cell in cells[1:]]),
    ):
        with pytest.raises(runner.PortfolioRunnerError, match="selection observed"):
            runner._execute_phase(
                phase=phase,
                root=tmp_path,
                run_root=tmp_path / f"run-{phase}",
                base_url="unused",
            )
        assert observed[-1] == expected
    with pytest.raises(TypeError):
        runner._execute_phase(
            phase="canary",
            checked=checked,  # type: ignore[call-arg]
            root=tmp_path,
            run_root=tmp_path / "forged",
            base_url="unused",
        )


def test_phase_skips_authenticated_terminal_and_never_calls_runner(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cells = _cells()
    selected = cells[1:]
    checked, acceptance = _rest_checked(cells)
    monkeypatch.setattr(
        runner, "_validate_acceptance", lambda root, run_root, value: acceptance
    )
    states = {
        cell["portfolio_cell_id"]: runner.CellState("TERMINAL", _terminal(cell))
        for cell in selected
    }
    states[selected[1]["portfolio_cell_id"]] = runner.CellState("FRESH")
    states[selected[2]["portfolio_cell_id"]] = runner.CellState("RESUME")
    monkeypatch.setattr(
        runner,
        "classify_cell_state",
        lambda root, run_root, cell: states[cell["portfolio_cell_id"]],
    )
    monkeypatch.setattr(runner, "_authenticate_selected", lambda root, cells: {})
    monkeypatch.setattr(runner, "static_check", lambda **kwargs: dict(checked))
    calls: list[tuple[str, str]] = []

    def fresh(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        calls.append(("fresh", cell["portfolio_cell_id"]))
        return _terminal(cell)

    def resume(
        root: Path, run_root: Path, cell: dict[str, Any], base_url: str
    ) -> dict[str, Any]:
        del root, run_root, base_url
        calls.append(("resume", cell["portfolio_cell_id"]))
        return _terminal(cell)

    monkeypatch.setattr(runner, "_fresh_run_cell", fresh)
    monkeypatch.setattr(runner, "_resume_run_cell", resume)
    monkeypatch.setattr(
        runner, "_terminal_cell", lambda root, run_root, cell: _terminal(cell)
    )
    result = runner._execute_phase(
        phase="rest",
        root=tmp_path,
        run_root=tmp_path / "run",
        base_url="unused",
    )
    assert len(result["results"]) == runner.CELL_COUNT - 1
    assert {identifier for _, identifier in calls} == {
        selected[1]["portfolio_cell_id"],
        selected[2]["portfolio_cell_id"],
    }
    calls_before = list(calls)
    for cell in selected:
        states[cell["portfolio_cell_id"]] = runner.CellState(
            "TERMINAL", _terminal(cell)
        )
    daemon_calls = 0

    def forbidden_daemon(base_url: str) -> dict[str, Any]:
        del base_url
        nonlocal daemon_calls
        daemon_calls += 1
        raise AssertionError("preexisting result must be handled before daemon contact")

    monkeypatch.setattr(runner, "_live_daemon_attestation", forbidden_daemon)
    replayed = runner._execute_phase(
        phase="rest",
        root=tmp_path,
        run_root=tmp_path / "run",
        base_url="unused",
    )
    assert replayed == result
    assert calls == calls_before
    assert daemon_calls == 0
    _, _, result_path = runner._phase_paths(tmp_path / "run", "rest")
    stale = runner._strict_json(result_path.read_bytes(), "phase result")
    stale["campaign_sha256"] = "e" * 64
    result_path.write_bytes(runner.canonical_json_bytes(stale))
    result_path.chmod(0o600)
    with pytest.raises(runner.PortfolioRunnerError, match="binding drifted"):
        runner._execute_phase(
            phase="rest",
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
        )
    assert daemon_calls == 0


def test_phase_preflights_ambiguity_before_any_submission(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cells = _cells()
    selected = cells[1:]
    checked, acceptance = _rest_checked(cells)
    calls = 0

    def classify(root: Path, run_root: Path, cell: dict[str, Any]) -> runner.CellState:
        del root, run_root
        if cell is selected[2]:
            raise runner.PortfolioRunnerError("ambiguous")
        return runner.CellState("FRESH")

    def fresh(*args: Any, **kwargs: Any) -> dict[str, Any]:
        nonlocal calls
        calls += 1
        return _terminal(cells[0])

    monkeypatch.setattr(runner, "classify_cell_state", classify)
    monkeypatch.setattr(runner, "_authenticate_selected", lambda root, cells: {})
    monkeypatch.setattr(runner, "static_check", lambda **kwargs: dict(checked))
    monkeypatch.setattr(runner, "_fresh_run_cell", fresh)
    monkeypatch.setattr(runner, "_resume_run_cell", fresh)
    monkeypatch.setattr(
        runner, "_validate_acceptance", lambda root, run_root, value: acceptance
    )
    with pytest.raises(runner.PortfolioRunnerError, match="ambiguous"):
        runner._execute_phase(
            phase="rest",
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
        )
    assert calls == 0


def test_phase_authenticates_every_input_before_classification_or_submission(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cells = _cells()
    selected = cells[1:]
    checked, acceptance = _rest_checked(cells)
    loaded: list[str] = []
    classified = False
    submitted = False

    def load(root: Path, cell: dict[str, Any]) -> Any:
        del root
        loaded.append(cell["portfolio_cell_id"])
        if cell is selected[2]:
            raise runner.PortfolioRunnerError("source hash drift")
        return b"cnf", b"producer", {}

    def classify(*args: Any) -> runner.CellState:
        nonlocal classified
        classified = True
        return runner.CellState("FRESH")

    def submit(*args: Any) -> dict[str, Any]:
        nonlocal submitted
        submitted = True
        return _terminal(cells[0])

    monkeypatch.setattr(runner, "_load_cell_inputs", load)
    monkeypatch.setattr(runner, "classify_cell_state", classify)
    monkeypatch.setattr(runner, "static_check", lambda **kwargs: dict(checked))
    monkeypatch.setattr(runner, "_fresh_run_cell", submit)
    monkeypatch.setattr(runner, "_resume_run_cell", submit)
    monkeypatch.setattr(
        runner, "_validate_acceptance", lambda root, run_root, value: acceptance
    )
    with pytest.raises(runner.PortfolioRunnerError, match="source hash drift"):
        runner._execute_phase(
            phase="rest",
            root=tmp_path,
            run_root=tmp_path / "run",
            base_url="unused",
            capacity_root=tmp_path / "capacity",
        )
    assert loaded == [cell["portfolio_cell_id"] for cell in selected[:3]]
    assert classified is False
    assert submitted is False


def test_classification_occurs_only_after_phase_lock_is_held(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = _cells()[0]
    lock_held = False

    def acquire(run_root: Path, phase: str, launch: bytes) -> int:
        del run_root, phase, launch
        nonlocal lock_held
        descriptor = os.open(tmp_path / "held.lock", os.O_CREAT | os.O_RDWR, 0o600)
        __import__("fcntl").flock(descriptor, __import__("fcntl").LOCK_EX)
        lock_held = True
        return descriptor

    def classify(
        root: Path, run_root: Path, selected: dict[str, Any]
    ) -> runner.CellState:
        del root, run_root, selected
        assert lock_held
        return runner.CellState("TERMINAL", _terminal(cell))

    monkeypatch.setattr(runner, "_phase_lock", acquire)
    monkeypatch.setattr(runner, "_authenticate_selected", lambda root, cells: {})
    monkeypatch.setattr(runner, "classify_cell_state", classify)
    monkeypatch.setattr(
        runner,
        "static_check",
        lambda **kwargs: {
            "campaign_sha256": "a" * 64,
            "run_manifest_sha256": "b" * 64,
            "cells": _cells(),
        },
    )
    result = runner._execute_phase(
        phase="canary",
        root=tmp_path,
        run_root=tmp_path / "run",
        base_url="unused",
        capacity_root=tmp_path / "capacity",
    )
    assert result["results"][0]["portfolio_cell_id"] == cell["portfolio_cell_id"]


def test_create_once_phase_lock_accepts_exact_recovery_and_rejects_tamper(
    tmp_path: Path,
) -> None:
    run_root = tmp_path / "run"
    launch = b"exact-launch"
    first = runner._phase_lock(run_root, "rest", launch)
    fcntl = __import__("fcntl")
    fcntl.flock(first, fcntl.LOCK_UN)
    os.close(first)
    second = runner._phase_lock(run_root, "rest", launch)
    fcntl.flock(second, fcntl.LOCK_UN)
    os.close(second)
    lock_path, _, _ = runner._phase_paths(run_root, "rest")
    lock_path.write_bytes(b"tampered")
    with pytest.raises(runner.PortfolioRunnerError, match="conflicts"):
        runner._phase_lock(run_root, "rest", launch)


def test_write_once_fsyncs_payload_and_parent_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    observed: list[bool] = []
    real_fsync = os.fsync

    def fsync(descriptor: int) -> None:
        observed.append(__import__("stat").S_ISDIR(os.fstat(descriptor).st_mode))
        real_fsync(descriptor)

    monkeypatch.setattr(runner.os, "fsync", fsync)
    runner._write_once_or_validate(tmp_path / "artifacts/value.json", b"{}", "value")
    assert observed == [False, True]


def test_private_reader_rejects_symlink_hardlink_and_public_mode(
    tmp_path: Path,
) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"x")
    target.chmod(0o600)
    alias = tmp_path / "alias"
    os.link(target, alias)
    with pytest.raises(runner.PortfolioRunnerError, match="linked"):
        runner._read_private_file(target, maximum=1, label="target")
    alias.unlink()
    symlink = tmp_path / "symlink"
    symlink.symlink_to(target)
    with pytest.raises(runner.PortfolioRunnerError, match="regular"):
        runner._read_private_file(symlink, maximum=1, label="symlink")
    target.chmod(0o644)
    with pytest.raises(runner.PortfolioRunnerError, match="private"):
        runner._read_private_file(target, maximum=1, label="target")


def test_existing_empty_reservation_is_reused_without_create(tmp_path: Path) -> None:
    run_root = tmp_path / "run"
    identifier = "cell"
    events = run_root / "events"
    events.mkdir(parents=True)
    journal = events / f"{identifier}.jsonl"
    lock = events / f"{identifier}.jsonl.lock"
    journal.write_bytes(b"")
    lock.write_bytes(b"")
    journal.chmod(0o600)
    lock.chmod(0o600)
    before = (journal.stat().st_ino, lock.stat().st_ino)
    identities = runner._reserve_cell(run_root, identifier)
    assert (identities[0][1], identities[1][1]) == before


def test_empty_preprepare_and_unsealed_terminal_are_recoverable(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cell = _cells()[0]
    identifier = cell["portfolio_cell_id"]
    events = tmp_path / "events"
    events.mkdir(mode=0o700)
    journal = events / f"{identifier}.jsonl"
    lock = events / f"{identifier}.jsonl.lock"
    artifacts = events / f"{identifier}.jsonl.artifacts"
    journal.write_bytes(b"")
    lock.write_bytes(b"")
    journal.chmod(0o600)
    lock.chmod(0o600)
    artifacts.mkdir(mode=0o700)
    wave = {
        "encoding": {
            "cnf_sha256": "a" * 64,
            "producer_manifest_sha256": "b" * 64,
        }
    }
    monkeypatch.setattr(
        runner,
        "_load_cell_inputs",
        lambda root, selected: (b"cnf", b"producer", wave),
    )
    assert runner.classify_cell_state(tmp_path, tmp_path, cell).kind == "RESUME_PREPARE"
    descriptor_journal = runner._open_existing_descriptor_journal(
        tmp_path, journal, wave, []
    )
    assert isinstance(descriptor_journal, runner._legacy.DescriptorAttemptJournal)
    descriptor_journal.close()

    journal.write_bytes(b"record\n")
    terminal_records = [
        {
            "outcome": runner.STRUCTURAL_SAT,
            "event": {"job_id": "job-1"},
        }
    ]
    monkeypatch.setattr(
        runner,
        "_read_journal_records",
        lambda path, manifest: terminal_records,
    )
    assert runner.classify_cell_state(tmp_path, tmp_path, cell).kind == "RESEAL"


def test_journal_rejects_multiple_job_ids() -> None:
    records = [
        {"event": {"job_id": "job-1"}},
        {"event": {"job_id": "job-2"}},
    ]
    with pytest.raises(runner.PortfolioRunnerError, match="more than one"):
        runner._journal_job_id(records)


def test_partial_prepare_binding_rejects_existing_or_ambiguous_job() -> None:
    cell = _cells()[0]
    cnf = b"p cnf 1 1\n1 0\n"
    cell["expected_identity_hash"] = "9" * 64
    response = {
        "backend": runner.BACKEND,
        "solver_profile": runner.SOLVER_PROFILE,
        "cnf_blob_hash": hashlib.sha256(cnf).hexdigest(),
        "identity_hash": cell["expected_identity_hash"],
        "num_vars": runner.NUM_VARIABLES,
        "num_clauses": runner.NUM_CLAUSES,
        "existing": False,
    }
    record = {
        "event": {
            "phase": "PREPARE",
            "disposition": "SUCCESS",
            "job_id": "job-1",
            "response": response,
        }
    }
    job = runner._prepared_job_from_records([record], cell, cnf)
    assert job.job_id == "job-1"
    response["existing"] = True
    with pytest.raises(runner.PortfolioRunnerError, match="existing"):
        runner._prepared_job_from_records([record], cell, cnf)
    record["event"]["detail"] = "recovered exact raw identity"
    recovered = runner._prepared_job_from_records([record], cell, cnf)
    assert recovered.job_id == "job-1" and recovered.existing is True


@pytest.mark.parametrize("driver_start_only", [False, True])
def test_preprepare_recovery_adopts_exact_existing_job_and_terminalizes(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    driver_start_only: bool,
) -> None:
    cell = _cells()[0]
    cell["expected_identity_hash"] = "9" * 64
    identities = dict(runner.PRODUCTION_CELL_IDENTITIES)
    identities[cell["portfolio_cell_id"]] = {
        **identities[cell["portfolio_cell_id"]],
        "identity_hash": cell["expected_identity_hash"],
    }
    monkeypatch.setattr(runner, "PRODUCTION_CELL_IDENTITIES", identities)
    identifier = cell["portfolio_cell_id"]
    events = tmp_path / "events"
    events.mkdir(mode=0o700)
    journal_path = events / f"{identifier}.jsonl"
    lock_path = events / f"{identifier}.jsonl.lock"
    artifact_dir = events / f"{identifier}.jsonl.artifacts"
    journal_path.write_bytes(b"driver-start\n" if driver_start_only else b"")
    lock_path.write_bytes(b"")
    journal_path.chmod(0o600)
    lock_path.chmod(0o600)
    artifact_dir.mkdir(mode=0o700)
    cnf = b"p cnf 308 1\n1 0\n"
    producer = b"{}"
    wave = {
        "encoding": {
            "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
            "producer_manifest_sha256": hashlib.sha256(producer).hexdigest(),
        },
        "execution": {
            "backend": runner.BACKEND,
            "solver_profile": runner.SOLVER_PROFILE,
        },
    }
    initial_records: list[dict[str, Any]] = []
    if driver_start_only:
        initial_records.append(
            {
                "event": {
                    "phase": "DRIVER_START",
                    "disposition": "SUCCESS",
                    "job_id": None,
                },
                "outcome": runner.CHECKPOINT,
                "record_sha256": "1" * 64,
            }
        )

    class FakeJournal:
        def __init__(self) -> None:
            self.records = list(initial_records)
            self._sealed = None
            self.closed = False

        def append_event(
            self,
            *,
            event: dict[str, Any],
            outcome: str,
            detail: str | None,
            artifact_overrides: Any = None,
        ) -> dict[str, Any]:
            del detail, artifact_overrides
            record = {
                "event": dict(event),
                "outcome": outcome,
                "record_sha256": f"{len(self.records) + 2:064x}",
            }
            self.records.append(record)
            return record

        def close(self) -> None:
            self.closed = True

    fake_journal = FakeJournal()
    calls = {"prepare": 0, "verify": 0, "status": 0}

    class FakeClient:
        def prepare_cnf(self, **kwargs: Any) -> runner.PreparedJob:
            assert kwargs["cnf"] == cnf and kwargs["producer_manifest"] == producer
            calls["prepare"] += 1
            return runner.PreparedJob(
                "job-existing",
                runner.BACKEND,
                runner.SOLVER_PROFILE,
                hashlib.sha256(cnf).hexdigest(),
                cell["expected_identity_hash"],
                runner.NUM_VARIABLES,
                runner.NUM_CLAUSES,
                True,
                runner.REQUESTED_CORE_LIMIT,
            )

        def verify_stored_cnf(self, job: runner.PreparedJob, expected: bytes) -> str:
            assert job.job_id == "job-existing" and expected == cnf
            calls["verify"] += 1
            return job.cnf_blob_hash

        def status(self, job_id: str) -> dict[str, Any]:
            calls["status"] += 1
            return {"id": job_id, "status": "completed", "result": "SAT"}

    class FakeDriver:
        def __init__(self, *, journal: FakeJournal, **kwargs: Any) -> None:
            del kwargs
            self.journal = journal

        def _append(self, **kwargs: Any) -> dict[str, Any]:
            return self.journal.append_event(
                event=kwargs["event"],
                outcome=kwargs["outcome"],
                detail=kwargs.get("detail"),
            )

        def _finish_sat(self, *, job: runner.PreparedJob, cnf: bytes) -> Any:
            assert job.job_id == "job-existing" and job.existing is True
            assert cnf == b"p cnf 308 1\n1 0\n"
            return SimpleNamespace(
                job_id=job.job_id,
                outcome=runner.STRUCTURAL_SAT,
                terminal_record_sha256="a" * 64,
                journal_record_count=len(self.journal.records),
                seal_sha256="b" * 64,
            )

    monkeypatch.setattr(
        runner, "_load_cell_inputs", lambda root, selected: (cnf, producer, wave)
    )
    monkeypatch.setattr(
        runner,
        "_read_journal_records",
        lambda path, manifest: list(initial_records),
    )
    monkeypatch.setattr(
        runner,
        "_open_existing_descriptor_journal",
        lambda root, path, manifest, records: fake_journal,
    )
    monkeypatch.setattr(runner, "PiqdRawDimacsClient", lambda base_url: FakeClient())
    monkeypatch.setattr(runner, "PiqdCegarDriver", FakeDriver)
    monkeypatch.setattr(runner, "LeanLratReplayer", lambda **kwargs: object())

    result = runner._resume_run_cell(tmp_path, tmp_path, cell, "unused")
    assert result["job_id"] == "job-existing"
    assert result["outcome"] == runner.STRUCTURAL_SAT
    assert calls == {"prepare": 1, "verify": 1, "status": 1}
    assert fake_journal.closed is True
    prepare_records = [
        record
        for record in fake_journal.records
        if record["event"].get("phase") == "PREPARE"
    ]
    assert len(prepare_records) == 1
    assert prepare_records[0]["event"]["response"]["existing"] is True
    assert prepare_records[0]["event"]["detail"] == "recovered exact raw identity"


def test_cell_loader_rejects_wrong_dimensions_before_identity_use(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    producer = runner.canonical_json_bytes(
        {
            "backend": runner.BACKEND,
            "solver_profile": runner.SOLVER_PROFILE,
            "query_polarity": runner.QUERY_POLARITY,
            "production_config": {
                "target_code": {"commit": runner.SOURCE_PREPARER_COMMIT}
            },
        }
    )
    cnf = b"p cnf 1 1\n1 0\n"
    wave = {
        "encoding": {
            "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
            "producer_manifest_sha256": hashlib.sha256(producer).hexdigest(),
            "num_variables": runner.NUM_VARIABLES,
            "num_clauses": runner.NUM_CLAUSES,
            "query_polarity": runner.QUERY_POLARITY,
        },
        "execution": {
            "backend": runner.BACKEND,
            "solver_profile": runner.SOLVER_PROFILE,
        },
    }
    wave_raw = runner.canonical_json_bytes(wave)
    cell = _cells()[0]
    cell["source_cnf"] = _write(tmp_path / "cell.cnf", cnf)
    cell["producer_manifest"] = _write(tmp_path / "producer.json", producer)
    cell["wave_manifest"] = _write(tmp_path / "wave.json", wave_raw)
    for key in ("source_cnf", "producer_manifest", "wave_manifest"):
        cell[key]["path"] = Path(cell[key]["path"]).relative_to(tmp_path).as_posix()
    identities = dict(runner.PRODUCTION_CELL_IDENTITIES)
    identities[cell["portfolio_cell_id"]] = {
        "cnf_sha256": cell["source_cnf"]["sha256"],
        "cnf_bytes": cell["source_cnf"]["bytes"],
        "producer_sha256": cell["producer_manifest"]["sha256"],
        "producer_bytes": cell["producer_manifest"]["bytes"],
        "wave_sha256": cell["wave_manifest"]["sha256"],
        "wave_bytes": cell["wave_manifest"]["bytes"],
        "identity_hash": cell["expected_identity_hash"],
    }
    monkeypatch.setattr(runner, "PRODUCTION_CELL_IDENTITIES", identities)
    monkeypatch.setattr(runner, "validate_wave_manifest", lambda value: None)
    monkeypatch.setattr(runner, "scan_dimacs", lambda value: (307, runner.NUM_CLAUSES))
    with pytest.raises(runner.PortfolioRunnerError, match="dimensions"):
        runner._load_cell_inputs(tmp_path, cell)


def test_sat_canary_acceptance_requires_full_replay_and_hardened_mine(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    cell = _cells()[0]
    cnf = b"p cnf 308 1\n1 0\n"
    wave = {"encoding": {}, "execution": {}}
    assignment = [index + 1 for index in range(runner.NUM_VARIABLES)]
    model_raw = runner.canonical_json_bytes(
        {
            "job_id": "job-1",
            "result": "SAT",
            "num_assigned": runner.NUM_VARIABLES,
            "assignment": assignment,
        }
    )
    terminal = _terminal(cell)
    terminal["artifacts"]["model_sha256"] = hashlib.sha256(model_raw).hexdigest()
    monkeypatch.setattr(runner, "_terminal_cell", lambda root, rr, selected: terminal)
    monkeypatch.setattr(
        runner,
        "_load_cell_inputs",
        lambda root, selected: (
            cnf,
            runner.canonical_json_bytes({"variable_map_sha256": "d" * 64}),
            wave,
        ),
    )
    model_path = (
        run_root
        / "events"
        / f"{runner.CANARY_PORTFOLIO_CELL_ID}.jsonl.artifacts"
        / terminal["artifacts"]["model_sha256"]
    )
    _write(model_path, model_raw)
    replay = {
        "schema": runner.SAT_REPLAY_SCHEMA,
        "status": "PASS",
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": "job-1",
        "cnf_sha256": cell["source_cnf"]["sha256"],
        "producer_manifest_sha256": cell["producer_manifest"]["sha256"],
        "wave_manifest_sha256": cell["wave_manifest"]["sha256"],
        "variable_map_sha256": "d" * 64,
        "num_variables": runner.NUM_VARIABLES,
        "clauses_checked": runner.NUM_CLAUSES,
        "all_clauses_satisfied": True,
        "model_sha256": terminal["artifacts"]["model_sha256"],
    }
    mine = {
        "schema": runner.WAVE_MINE_SCHEMA,
        "status": "ACCEPTED",
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": "job-1",
        "model_sha256": terminal["artifacts"]["model_sha256"],
        "source_valid_only": True,
        "complete_equality_component_checked": True,
        "models_mined": 1,
        "candidates_examined": 0,
        "scan_complete": True,
        "complete_no_candidates": True,
    }
    ledger = {
        "schema": runner.WAVE_MINE_LEDGER_SCHEMA,
        "status": "COMPLETE",
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": "job-1",
        "model_sha256": terminal["artifacts"]["model_sha256"],
        "cnf_sha256": cell["source_cnf"]["sha256"],
        "producer_manifest_sha256": cell["producer_manifest"]["sha256"],
        "wave_manifest_sha256": cell["wave_manifest"]["sha256"],
        "variable_map_sha256": "d" * 64,
        "source_valid_only": True,
        "scanner": {
            "name": runner.MINER_NAME,
            "schema": runner.MINER_SCHEMA,
            "version": runner.MINER_VERSION,
            "source_path": runner.MINER_RELATIVE,
            "source_sha256": runner.MINER_SHA256,
        },
        "source_valid_family_inventory": list(runner.PINNED_SOURCE_VALID_FAMILIES),
        "candidates_examined": 0,
        "scan_complete": True,
        "complete_no_candidates": True,
        "candidates": [],
    }
    ledger_path = tmp_path / "evidence/ledger.json"
    ledger_ref = _write(ledger_path, runner.canonical_json_bytes(ledger))
    ledger_ref["path"] = ledger_path.relative_to(tmp_path).as_posix()
    mine["candidate_ledger"] = ledger_ref
    mine["candidate_ledger_sha256"] = ledger_ref["sha256"]
    replay_path = tmp_path / "evidence/replay.json"
    mine_path = tmp_path / "evidence/mine.json"
    replay_ref = _write(replay_path, runner.canonical_json_bytes(replay))
    mine_ref = _write(mine_path, runner.canonical_json_bytes(mine))
    replay_ref["path"] = replay_path.relative_to(tmp_path).as_posix()
    mine_ref["path"] = mine_path.relative_to(tmp_path).as_posix()
    acceptance = {
        "schema": runner.ACCEPTANCE_SCHEMA,
        "status": "ACCEPTED",
        **{key: terminal[key] for key in runner._TERMINAL_RESULT_KEYS},
        "campaign_sha256": "3" * 64,
        "run_manifest_sha256": "4" * 64,
        "evidence": {
            "independent_sat_replay": replay_ref,
            "wave_only_mine": mine_ref,
            "independent_unsat_replay": None,
        },
    }
    acceptance["manifest_sha256"] = runner._self_hash(acceptance)
    _write(
        run_root / "artifacts/canary-acceptance.json",
        runner.canonical_json_bytes(acceptance),
    )
    checked = {
        "cells": [cell],
        "campaign_sha256": "3" * 64,
        "run_manifest_sha256": "4" * 64,
    }

    def persist_mine_chain() -> None:
        updated_ledger_ref = _write(ledger_path, runner.canonical_json_bytes(ledger))
        updated_ledger_ref["path"] = ledger_path.relative_to(tmp_path).as_posix()
        mine["candidate_ledger"] = updated_ledger_ref
        mine["candidate_ledger_sha256"] = updated_ledger_ref["sha256"]
        updated_mine_ref = _write(mine_path, runner.canonical_json_bytes(mine))
        updated_mine_ref["path"] = mine_path.relative_to(tmp_path).as_posix()
        acceptance["evidence"]["wave_only_mine"] = updated_mine_ref
        acceptance["manifest_sha256"] = runner._self_hash(acceptance)
        _write(
            run_root / "artifacts/canary-acceptance.json",
            runner.canonical_json_bytes(acceptance),
        )

    def persist_replay_chain() -> None:
        updated_replay_ref = _write(replay_path, runner.canonical_json_bytes(replay))
        updated_replay_ref["path"] = replay_path.relative_to(tmp_path).as_posix()
        acceptance["evidence"]["independent_sat_replay"] = updated_replay_ref
        acceptance["manifest_sha256"] = runner._self_hash(acceptance)
        _write(
            run_root / "artifacts/canary-acceptance.json",
            runner.canonical_json_bytes(acceptance),
        )

    assert (
        runner._validate_acceptance(tmp_path, run_root, checked)["status"] == "ACCEPTED"
    )
    for key in (
        "producer_manifest_sha256",
        "wave_manifest_sha256",
        "variable_map_sha256",
    ):
        original = replay[key]
        replay[key] = "0" * 64
        persist_replay_chain()
        with pytest.raises(runner.PortfolioRunnerError, match="SAT replay receipt"):
            runner._validate_acceptance(tmp_path, run_root, checked)
        replay[key] = original
    persist_replay_chain()
    ledger["candidates_examined"] = 1
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="candidate ledger"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["candidates_examined"] = 0
    scanner_version = ledger["scanner"].pop("version")
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="scanner identity"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["scanner"]["version"] = scanner_version
    ledger["source_valid_family_inventory"].append("invented-family")
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="family inventory"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["source_valid_family_inventory"].pop()
    ledger["candidates_examined"] = 1
    ledger["complete_no_candidates"] = False
    valid_candidate = _candidate()
    ledger["candidates"] = [valid_candidate]
    mine["candidates_examined"] = 1
    mine["complete_no_candidates"] = False
    persist_mine_chain()
    assert (
        runner._validate_acceptance(tmp_path, run_root, checked)["status"] == "ACCEPTED"
    )
    ledger["candidates"][0]["record_sha256"] = "0" * 64
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="record hash"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    duplicate_candidate = _candidate()
    ledger["candidates"] = [duplicate_candidate, dict(duplicate_candidate)]
    ledger["candidates_examined"] = 2
    mine["candidates_examined"] = 2
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="sorted and unique"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["candidates"] = [_candidate()]
    ledger["candidates_examined"] = 1
    mine["candidates_examined"] = 1
    ledger["candidates"][0]["candidate_id"] = "kalmanson:" + "0" * 64
    ledger["candidates"][0]["record_sha256"] = runner._self_hash(
        ledger["candidates"][0], "record_sha256"
    )
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="identifier drifted"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    invalid_source = _candidate()
    invalid_source["source_valid"] = False
    invalid_source["candidate_id"] = runner._candidate_id(invalid_source)
    invalid_source["record_sha256"] = runner._self_hash(invalid_source, "record_sha256")
    ledger["candidates"] = [invalid_source]
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="record content"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    extra_key = _candidate()
    extra_key["unreviewed"] = True
    extra_key["record_sha256"] = runner._self_hash(extra_key, "record_sha256")
    ledger["candidates"] = [extra_key]
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="record schema"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    unsorted_support = _candidate(support=[[2, 3], [0, 1]])
    ledger["candidates"] = [unsorted_support]
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="support is not canonical"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    invalid_consumer = _candidate()
    invalid_consumer["lean_consumer"] = "not-a-Lean-name"
    invalid_consumer["candidate_id"] = runner._candidate_id(invalid_consumer)
    invalid_consumer["record_sha256"] = runner._self_hash(
        invalid_consumer, "record_sha256"
    )
    ledger["candidates"] = [invalid_consumer]
    persist_mine_chain()
    with pytest.raises(runner.PortfolioRunnerError, match="record content"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["candidates_examined"] = 0
    ledger["complete_no_candidates"] = True
    ledger["candidates"] = []
    mine["candidates_examined"] = 0
    mine["complete_no_candidates"] = True
    persist_mine_chain()
    assert (
        runner._validate_acceptance(tmp_path, run_root, checked)["status"] == "ACCEPTED"
    )
    bad_model = dict(runner._json_mapping(model_raw, "model"))
    bad_model["assignment"] = list(bad_model["assignment"])
    bad_model["assignment"][0] = -1
    model_path.write_bytes(runner.canonical_json_bytes(bad_model))
    model_path.chmod(0o600)
    with pytest.raises((runner.PortfolioRunnerError, runner.PiqdOracleError)):
        runner._validate_acceptance(tmp_path, run_root, checked)
    model_path.write_bytes(model_raw)
    model_path.chmod(0o600)
    ledger["source_valid_only"] = False
    ledger_path.write_bytes(runner.canonical_json_bytes(ledger))
    ledger_path.chmod(0o600)
    with pytest.raises(runner.PortfolioRunnerError):
        runner._validate_acceptance(tmp_path, run_root, checked)
    ledger["source_valid_only"] = True
    ledger_path.write_bytes(runner.canonical_json_bytes(ledger))
    ledger_path.chmod(0o600)
    mine["complete_equality_component_checked"] = False
    _write(mine_path, runner.canonical_json_bytes(mine))
    with pytest.raises(runner.PortfolioRunnerError):
        runner._validate_acceptance(tmp_path, run_root, checked)


def test_unsat_canary_acceptance_requires_proof_checker_and_replay(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    cell = _cells()[0]
    cnf = b"p cnf 308 2\n1 0\n-1 0\n"
    wave = {
        "encoding": {
            "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
            "producer_manifest_sha256": "a" * 64,
        },
        "execution": {
            "backend": runner.BACKEND,
            "solver_profile": runner.SOLVER_PROFILE,
        },
    }
    terminal = _terminal(cell, outcome=runner.CERTIFIED_UNSAT)
    proof_bytes = b"proof\n"
    checker_bytes = b"checker\n"
    replay_artifact = runner.canonical_json_bytes(
        {
            "verified": True,
            "proof_sha256": hashlib.sha256(proof_bytes).hexdigest(),
            "job": {"id": terminal["job_id"]},
        }
    )
    terminal["artifacts"]["proof_sha256"] = hashlib.sha256(proof_bytes).hexdigest()
    terminal["artifacts"]["proof_checker_sha256"] = hashlib.sha256(
        checker_bytes
    ).hexdigest()
    terminal["artifacts"]["proof_replay_sha256"] = hashlib.sha256(
        replay_artifact
    ).hexdigest()
    monkeypatch.setattr(runner, "_terminal_cell", lambda root, rr, selected: terminal)
    monkeypatch.setattr(
        runner,
        "_load_cell_inputs",
        lambda root, selected: (
            cnf,
            runner.canonical_json_bytes({"variable_map_sha256": "d" * 64}),
            wave,
        ),
    )
    artifact_root = (
        run_root / "events" / f"{runner.CANARY_PORTFOLIO_CELL_ID}.jsonl.artifacts"
    )
    for payload in (proof_bytes, checker_bytes, replay_artifact):
        _write(artifact_root / hashlib.sha256(payload).hexdigest(), payload)
    replay_result = SimpleNamespace(
        verified=True,
        checker_source=checker_bytes,
        receipt=b"{}",
    )
    fake_replayer = SimpleNamespace(replay=lambda **kwargs: replay_result)
    monkeypatch.setattr(runner, "validate_replay_result", lambda **kwargs: None)
    monkeypatch.setattr(runner, "LeanLratReplayer", lambda **kwargs: fake_replayer)
    receipt = {
        "schema": runner.UNSAT_REPLAY_SCHEMA,
        "status": "CERTIFIED_UNSAT",
        "portfolio_cell_id": runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": terminal["job_id"],
        "cnf_sha256": cell["source_cnf"]["sha256"],
        "proof_sha256": terminal["artifacts"]["proof_sha256"],
        "proof_checker_sha256": terminal["artifacts"]["proof_checker_sha256"],
        "proof_replay_sha256": terminal["artifacts"]["proof_replay_sha256"],
    }
    receipt_path = tmp_path / "evidence/unsat.json"
    receipt_ref = _write(receipt_path, runner.canonical_json_bytes(receipt))
    receipt_ref["path"] = receipt_path.relative_to(tmp_path).as_posix()
    acceptance = {
        "schema": runner.ACCEPTANCE_SCHEMA,
        "status": "ACCEPTED",
        **{key: terminal[key] for key in runner._TERMINAL_RESULT_KEYS},
        "campaign_sha256": "3" * 64,
        "run_manifest_sha256": "4" * 64,
        "evidence": {
            "independent_sat_replay": None,
            "wave_only_mine": None,
            "independent_unsat_replay": receipt_ref,
        },
    }
    acceptance["manifest_sha256"] = runner._self_hash(acceptance)
    _write(
        run_root / "artifacts/canary-acceptance.json",
        runner.canonical_json_bytes(acceptance),
    )
    checked = {
        "cells": [cell],
        "campaign_sha256": "3" * 64,
        "run_manifest_sha256": "4" * 64,
    }
    assert (
        runner._validate_acceptance(tmp_path, run_root, checked)["status"] == "ACCEPTED"
    )
    proof_path = artifact_root / terminal["artifacts"]["proof_sha256"]
    proof_path.write_bytes(b"tampered\n")
    proof_path.chmod(0o600)
    with pytest.raises(runner.PortfolioRunnerError, match="content hash"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    proof_path.write_bytes(proof_bytes)
    proof_path.chmod(0o600)
    failing_replayer = SimpleNamespace(
        replay=lambda **kwargs: SimpleNamespace(
            verified=False, checker_source=checker_bytes, receipt=b"{}"
        )
    )
    monkeypatch.setattr(runner, "LeanLratReplayer", lambda **kwargs: failing_replayer)
    with pytest.raises(runner.PortfolioRunnerError, match="replay failed"):
        runner._validate_acceptance(tmp_path, run_root, checked)
    monkeypatch.setattr(runner, "LeanLratReplayer", lambda **kwargs: fake_replayer)
    receipt["proof_replay_sha256"] = "0" * 64
    receipt_path.write_bytes(runner.canonical_json_bytes(receipt))
    receipt_path.chmod(0o600)
    with pytest.raises(runner.PortfolioRunnerError):
        runner._validate_acceptance(tmp_path, run_root, checked)


def test_ungated_entry_point_and_cli_surface() -> None:
    with pytest.raises(runner.PortfolioRunnerError, match="ungated"):
        runner.start(base_url="unused")
    assert runner.main(["static-check"]) == 2
    with pytest.raises(SystemExit):
        runner.main(["start"])
