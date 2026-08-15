from __future__ import annotations

import shutil
import sys
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_all_large_caps_v4_run as runner


def test_dry_run_is_nonlaunch_and_audited() -> None:
    result = runner.dry_run(None, 30, False)
    assert result["mode"] == "DRY_RUN"
    assert result["launch"] is False
    assert result["solver_calls"] == 0
    assert result["variables"] == 93075
    assert result["clauses"] == 463822
    assert result["cnf_sha256"] == runner.INDEPENDENT_AUDIT["cnf_sha256_reproduced"]
    assert result["source_total"] is False
    assert result["clause_delta"]["constraint_count"] == 3


def test_dry_run_rejects_unregistered_root(tmp_path: Path) -> None:
    root = Path("scratch/runs/firstnonhit-all-large-caps-v4/test-unregistered")
    _absolute, relative = runner._normalize_run_root(root)
    assert runner._registration_status(relative) is False


def test_checkpoint_self_hash_and_lane() -> None:
    checkpoint = runner._read_checkpoint()
    assert checkpoint["lane_id"] == runner.LANE_ID
    assert checkpoint["generated_roots"] == []
    assert checkpoint["owned_paths"] == [
        ".codex/worktree-checkpoints/firstnonhit-all-large-caps-v4.json",
        "census/p97_search/freshthird_firstnonhit_all_large_caps_v4.py",
        "census/p97_search/freshthird_firstnonhit_all_large_caps_v4_run.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_all_large_caps_v4.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_all_large_caps_v4_run.py",
    ]


def test_terminal_reentry_requires_regular_terminal_root(tmp_path: Path) -> None:
    with pytest.raises(runner.RunnerError, match="terminal root"):
        runner.terminal_reentry(tmp_path / "missing")


def test_success_process_set_has_no_nonexistent_drat_trim_version() -> None:
    source = Path(runner.__file__).read_text()
    assert '"drat-trim-version"' not in source


def test_malformed_run_root_rejected() -> None:
    with pytest.raises(runner.RunnerError, match="exactly"):
        runner._normalize_run_root(
            Path("scratch/runs/firstnonhit-all-large-caps-v4/not valid")
        )


def test_changed_dependency_is_rejected_before_execution(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo = tmp_path / "repo"
    source_root = Path(runner._repo_root())
    for relative, _expected in runner.AUTHENTICATED_ENCODER_SPECS.values():
        destination = repo / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_root / relative, destination)
    marker = tmp_path / "executed"
    v2 = repo / runner._V2_RELATIVE
    v2.write_text(
        f"from pathlib import Path\nPath({str(marker)!r}).write_text('ran')\n"
        + v2.read_text()
    )
    monkeypatch.setattr(runner, "_repo_root", lambda: repo)
    names = ("census", "census.p97_search", *runner.AUTHENTICATED_MODULE_NAMES.values())
    prior = {name: sys.modules.pop(name, None) for name in names}
    with pytest.raises(runner.RunnerError, match="encoder_v2 source hash mismatch"):
        runner._load_authenticated_encoders()
    assert not marker.exists()
    assert all(name not in sys.modules for name in names)
    for name, module in prior.items():
        if module is not None:
            sys.modules[name] = module


def test_pythonpath_shadow_cannot_override_authenticated_chain(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    marker = tmp_path / "shadow-executed"
    shadow = tmp_path / "census" / "p97_search"
    shadow.mkdir(parents=True)
    (shadow / "freshthird_firstnonhit_complete_finite_v2.py").write_text(
        f"from pathlib import Path\nPath({str(marker)!r}).write_text('ran')\n"
    )
    monkeypatch.syspath_prepend(str(tmp_path))
    runner._load_authenticated_encoders()
    assert not marker.exists()


def _receipt_rows(
    names: list[str], status: str = "COMPLETED"
) -> dict[str, dict[str, object]]:
    return {name: {"status": status} for name in names}


@pytest.mark.parametrize("status", ["FAILED", "UNKNOWN", "ERROR"])
def test_failure_and_unknown_phase_sets_reject_missing_and_extra(status: str) -> None:
    base = [
        "cadical-version",
        "smoke-sat",
        "smoke-unsat",
        "smoke-unsat-drat-trim",
        "production-cadical",
    ]
    if status == "FAILED":
        runner._validate_process_phase_set(
            ["cadical-version"], _receipt_rows(["cadical-version"]), status, False
        )
    else:
        runner._validate_process_phase_set(base, _receipt_rows(base), status, False)
    with pytest.raises(runner.RunnerError, match="phase set"):
        missing = (
            base[:-1] if status != "FAILED" else ["cadical-version", "smoke-unsat"]
        )
        runner._validate_process_phase_set(
            missing, _receipt_rows(missing), status, False
        )
    with pytest.raises(runner.RunnerError, match="phase set"):
        extra = base + ["unexpected-helper"]
        runner._validate_process_phase_set(extra, _receipt_rows(extra), status, False)


def test_requested_but_unavailable_kissat_reentry_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(runner, "_ensure_authenticated_encoders", lambda: None)
    root = tmp_path / "terminal"
    root.mkdir()
    manifest = {
        "schema": runner.RUN_SCHEMA,
        "status": "RUNNING",
        "source_total": False,
        "all_emitted_hard_clauses_source_mapped": True,
        "independent_audit": runner.INDEPENDENT_AUDIT,
        "n": runner.PRODUCTION_N,
        "query_is_separate_assumption": True,
        "exactly_one_production_wave": True,
        "no_cegar_successor": True,
        "theorem_bank_search_planned": False,
        "cross_check_requested": True,
        "cross_check_effective": True,
        "binaries": {"cadical": {}, "drat_trim": {}, "kissat": None},
    }
    payload = runner._canonical_json(
        runner._self_hashed(manifest, "run_manifest_sha256")
    )
    (root / "run-manifest.json").write_bytes(payload)
    with pytest.raises(runner.RunnerError, match="boundary mismatch"):
        runner.terminal_reentry(root)
