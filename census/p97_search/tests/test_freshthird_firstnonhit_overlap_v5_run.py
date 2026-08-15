# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import inspect
import json
import shutil
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

import census.p97_search.freshthird_firstnonhit_overlap_v5_run as runner


def test_dry_run_is_nonlaunch_and_production_path_is_installed() -> None:
    production_root = runner._repo_root() / runner.PROPOSED_RUN_ROOT
    root_existed_before = production_root.exists() or production_root.is_symlink()
    result = runner.dry_run(None, 30, False)
    assert result["mode"] == "DRY_RUN"
    assert result["launch"] is False
    assert result["solver_calls"] == 0
    assert result["run_root_created"] is False
    assert (production_root.exists() or production_root.is_symlink()) is (
        root_existed_before
    )
    assert result["variables"] == 93_211
    assert result["clauses"] == 560_926
    assert result["cnf_sha256"] == runner.INDEPENDENT_AUDIT["cnf_sha256_expected"]
    assert result["source_total"] is False
    assert result["independent_audit"] == runner.INDEPENDENT_AUDIT
    assert result["independent_audit"] == {
        "status": "APPROVED",
        "scope": "exact emitted CNF, source map, runner, and v4 survivor readback",
        "counts_expected": {"variables": 93_211, "clauses": 560_926},
        "cnf_sha256_expected": (
            "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
        ),
        "counts_reproduced": {"variables": 93_211, "clauses": 560_926},
        "cnf_sha256_reproduced": (
            "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
        ),
        "known_v4_model_violations_reproduced": [[7, 15], [8, 15]],
        "no_unsound_clause_found": True,
        "launch_authorized": True,
    }
    assert result["production_path_installed"] is True
    assert result["runner_base_authenticated"] is True
    assert result["proposed_run_root"] == runner.PROPOSED_RUN_ROOT
    assert result["lean_ingress"] == runner._authenticate_lean_ingress()
    assert result["clause_delta"]["triple_overlap_clauses"] == 92_480
    assert result["predecessor_model_control"]["known_violating_pairs"] == [
        [7, 15],
        [8, 15],
    ]


def test_checkpoint_registers_exact_approved_root_and_is_scoped() -> None:
    checkpoint = runner._read_checkpoint()
    assert checkpoint["lane_id"] == runner.LANE_ID
    assert checkpoint["generated_roots"] == [runner.PROPOSED_RUN_ROOT]
    assert runner._registration_status(runner.PROPOSED_RUN_ROOT) is True
    assert checkpoint["durable_paths"] == []
    assert checkpoint["owned_paths"] == [
        ".codex/worktree-checkpoints/firstnonhit-overlap-v5.json",
        "census/p97_search/freshthird_firstnonhit_overlap_v5.py",
        "census/p97_search/freshthird_firstnonhit_overlap_v5_run.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_overlap_v5.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_overlap_v5_run.py",
    ]


def test_unregistered_run_root_prevents_process_and_creation(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    root = Path("scratch/runs/firstnonhit-overlap-v5/source-only-test")
    absolute, relative = runner._normalize_run_root(root)
    assert runner._registration_status(relative) is False
    assert not absolute.exists()
    runtime = runner._load_authenticated_runner_base()
    called = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal called
        called = True
        raise AssertionError("process path ran before registration")

    monkeypatch.setattr(runtime, "_run_process", forbidden)
    with pytest.raises(runner.RunnerError, match="not registered"):
        runner.run_once(root, timeout_seconds=30, cross_check=False)
    assert called is False
    assert not absolute.exists()


def test_pending_audit_prevents_registered_launch_before_process(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    runtime = runner._load_authenticated_runner_base()
    test_root = Path("scratch/runs/firstnonhit-overlap-v5/pending-audit-test-only")
    absolute, _relative = runner._normalize_run_root(test_root)
    assert not absolute.exists()
    pending = {
        **runner.INDEPENDENT_AUDIT,
        "status": "PENDING",
        "counts_reproduced": None,
        "cnf_sha256_reproduced": None,
        "known_v4_model_violations_reproduced": None,
        "no_unsound_clause_found": False,
        "launch_authorized": False,
    }
    called = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal called
        called = True
        raise AssertionError("process path ran before audit approval")

    monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", pending)
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    monkeypatch.setattr(runtime, "_run_process", forbidden)
    with pytest.raises(runner.RunnerError, match="pending independent audit"):
        runner.run_once(test_root, timeout_seconds=30, cross_check=False)
    assert called is False
    assert not absolute.exists()


def test_approved_registered_gate_delegates_exactly_once(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    runtime = runner._load_authenticated_runner_base()
    test_root = Path("scratch/runs/firstnonhit-overlap-v5/approved-gate-test-only")
    absolute, _relative = runner._normalize_run_root(test_root)
    assert not absolute.exists()
    approved = {
        **runner.INDEPENDENT_AUDIT,
        "status": "APPROVED",
        "counts_reproduced": runner.INDEPENDENT_AUDIT["counts_expected"],
        "cnf_sha256_reproduced": runner.INDEPENDENT_AUDIT["cnf_sha256_expected"],
        "known_v4_model_violations_reproduced": [[7, 15], [8, 15]],
        "no_unsound_clause_found": True,
        "launch_authorized": True,
    }
    calls: list[tuple[Path, int, bool]] = []

    def delegated(
        root: Path, *, timeout_seconds: int, cross_check: bool
    ) -> dict[str, object]:
        calls.append((root, timeout_seconds, cross_check))
        return {"status": "TEST_DELEGATED"}

    monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", approved)
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    monkeypatch.setattr(runtime, "run_once", delegated)
    result = runner.run_once(test_root, timeout_seconds=47, cross_check=True)
    assert result == {"status": "TEST_DELEGATED"}
    assert calls == [(test_root, 47, True)]
    assert not absolute.exists()


def test_authenticated_runner_base_has_all_one_shot_custody_phases() -> None:
    runtime = runner._load_authenticated_runner_base()
    path = Path(runner._repo_root()) / runner._RUNNER_BASE_RELATIVE
    data = path.read_bytes()
    assert (
        hashlib.sha256(data).hexdigest()
        == runner.AUTHENTICATED_ENCODER_SPECS["runner_base"][1]
    )
    run_source = inspect.getsource(runner._run_once_v5)
    guarded_index = run_source.index("    try:")
    create_index = run_source.index("root.mkdir()")
    manifest_index = run_source.index('runtime._write_new(root / "run-manifest.json"')
    bundle_index = run_source.index("runtime._write_bundle(root, bundle)")
    assert guarded_index < create_index < manifest_index < bundle_index
    assert manifest_index < (run_source.index("_write_bundle(root, bundle)"))
    custody_source = "\n".join(
        (
            run_source,
            inspect.getsource(runner._quarantine_inprogress),
            inspect.getsource(runner._recover_manifest),
            inspect.getsource(runner._recover_terminal_receipt),
        )
    )
    for required in (
        "_record_binary_versions",
        "_run_smokes",
        '"production-cadical"',
        "validate_model(bundle, production.stdout)",
        "_check_drat",
        "_cross_check",
        "_terminal_receipt",
        "_quarantine_inprogress",
        "_recorded_process_summaries",
        "failure_phase",
        "_recover_manifest",
        "_recover_terminal_receipt",
    ):
        assert required in custody_source
    manifest_source = inspect.getsource(runtime._initial_manifest)
    assert "lean_ingress" in manifest_source
    assert "runner_base_sha256" in manifest_source


@pytest.mark.parametrize("failure_point", ["root-fsync", "bundle-write"])
def test_initialization_failure_gets_terminal_failed_receipt_before_process(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, failure_point: str
) -> None:
    runtime = runner._load_authenticated_runner_base()
    root = tmp_path / "run-root"
    relative = runner.PROPOSED_RUN_ROOT
    approved_digest = "a" * 64
    approved = {
        **runner.INDEPENDENT_AUDIT,
        "cnf_sha256_reproduced": approved_digest,
    }
    fake_bundle = SimpleNamespace(cnf=b"p cnf 0 0\n")
    fake_emitter = SimpleNamespace(
        emit_bundle=lambda _n: fake_bundle,
        validate_bundle=lambda _bundle: {
            "source_total": False,
            "cnf_sha256": approved_digest,
        },
    )
    writes: list[str] = []
    process_called = False
    base_write_new = runtime._write_new
    base_fsync_directory = runtime._fsync_directory

    def tracking_write(path: Path, data: bytes) -> None:
        writes.append(path.name)
        base_write_new(path, data)

    def fail_bundle_write(bundle_root: Path, _bundle: object) -> None:
        tracking_write(bundle_root / "problem.cnf", b"partial bundle\n")
        raise runner.RunnerError("injected bundle custody failure")

    def forbidden_bundle_write(*_args: object) -> None:
        raise AssertionError("bundle write ran after root fsync failure")

    def forbidden_process(*_args: object, **_kwargs: object) -> object:
        nonlocal process_called
        process_called = True
        raise AssertionError("process ran after initialization custody failure")

    fsync_failure_injected = False

    def maybe_fail_root_fsync(path: Path) -> None:
        nonlocal fsync_failure_injected
        if (
            failure_point == "root-fsync"
            and path == root.parent
            and not fsync_failure_injected
        ):
            fsync_failure_injected = True
            raise runner.RunnerError("injected root fsync custody failure")
        base_fsync_directory(path)

    monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", approved)
    monkeypatch.setattr(runtime, "INDEPENDENT_AUDIT", approved)
    monkeypatch.setattr(runner, "emitter", fake_emitter)
    monkeypatch.setattr(runner, "_ensure_authenticated_encoders", dict)
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    monkeypatch.setattr(runtime, "_normalize_run_root", lambda _root: (root, relative))
    monkeypatch.setattr(
        runtime,
        "_binary_identity",
        lambda name, *, required: {
            "name": name,
            "path": f"/authenticated/{name}",
            "sha256": "b" * 64,
            "size": 1,
            "version_identity": "sha256:" + "b" * 64,
        },
    )
    monkeypatch.setattr(
        runtime,
        "_initial_manifest",
        lambda *_args, **_kwargs: {
            "cross_check_requested": False,
            "cross_check_effective": False,
        },
    )
    monkeypatch.setattr(runtime, "_fsync_directory", maybe_fail_root_fsync)
    monkeypatch.setattr(runtime, "_write_new", tracking_write)
    if failure_point == "bundle-write":
        monkeypatch.setattr(runtime, "_write_bundle", fail_bundle_write)
    else:
        monkeypatch.setattr(runtime, "_write_bundle", forbidden_bundle_write)
    monkeypatch.setattr(runtime, "_run_process", forbidden_process)

    expected_reason = (
        "injected root fsync custody failure"
        if failure_point == "root-fsync"
        else "injected bundle custody failure"
    )
    with pytest.raises(runner.RunnerError, match=expected_reason):
        runner._run_once_v5(
            Path(relative),
            timeout_seconds=30,
            cross_check=False,
            runtime=runtime,
        )

    receipt = json.loads((root / "terminal-receipt.json").read_bytes())
    assert receipt["status"] == "FAILED"
    assert receipt["result"] == {
        "verdict": None,
        "reason": expected_reason,
        "failure_phase": "initialization",
    }
    assert receipt["processes"] == []
    assert process_called is False
    expected_initial_writes = (
        ["run-manifest.json", "problem.cnf"]
        if failure_point == "bundle-write"
        else ["run-manifest.json"]
    )
    assert writes[: len(expected_initial_writes)] == expected_initial_writes
    assert writes[-1] == "terminal-receipt.json"
    runner._validate_failed_receipt(root, receipt, runtime)


def _copy_authenticated_sources(repo: Path, source_root: Path) -> None:
    for relative, _expected in runner.AUTHENTICATED_ENCODER_SPECS.values():
        destination = repo / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_root / relative, destination)
    lean = repo / runner.LEAN_INGRESS_RELATIVE
    lean.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source_root / runner.LEAN_INGRESS_RELATIVE, lean)


def test_changed_dependency_is_rejected_before_execution(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo = tmp_path / "repo"
    source_root = Path(runner._repo_root())
    _copy_authenticated_sources(repo, source_root)
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


def test_changed_lean_ingress_is_rejected_before_python_execution(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo = tmp_path / "repo"
    source_root = Path(runner._repo_root())
    _copy_authenticated_sources(repo, source_root)
    marker = tmp_path / "executed"
    v2 = repo / runner._V2_RELATIVE
    marked = (
        f"from pathlib import Path\nPath({str(marker)!r}).write_text('ran')\n"
        + v2.read_text()
    )
    v2.write_text(marked)
    specs = dict(runner.AUTHENTICATED_ENCODER_SPECS)
    specs["encoder_v2"] = (
        runner._V2_RELATIVE,
        hashlib.sha256(marked.encode()).hexdigest(),
    )
    lean = repo / runner.LEAN_INGRESS_RELATIVE
    lean.write_text(lean.read_text() + "\n-- mutation\n")
    monkeypatch.setattr(runner, "AUTHENTICATED_ENCODER_SPECS", specs)
    monkeypatch.setattr(runner, "_repo_root", lambda: repo)
    names = ("census", "census.p97_search", *runner.AUTHENTICATED_MODULE_NAMES.values())
    prior = {name: sys.modules.pop(name, None) for name in names}
    with pytest.raises(runner.RunnerError, match="Lean ingress source hash mismatch"):
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


def test_same_blocker_semantic_readback_rejects_wrong_auxiliary(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    runner._ensure_authenticated_encoders()
    roles = (
        "blocker/0/0",
        "blocker/0/1",
        "blocker/1/0",
        "blocker/1/1",
        "row/0/0",
        "row/0/1",
        "row/1/0",
        "row/1/1",
        "same_blocker/0/1",
    )
    bundle = SimpleNamespace(
        variable_map=json.dumps(
            {
                "variables": [
                    {"id": identifier, "role": role}
                    for identifier, role in enumerate(roles, 1)
                ]
            }
        ).encode()
    )
    monkeypatch.setattr(
        runner.emitter,
        "validate_bundle",
        lambda _bundle: {"n": 2, "variables": len(roles)},
    )

    class Runtime:
        @staticmethod
        def parse_complete_model(_stdout: bytes, _count: int) -> dict[int, bool]:
            return {
                1: True,
                2: False,
                3: False,
                4: True,
                5: True,
                6: True,
                7: True,
                8: True,
                9: False,
            }

    summary = runner._validate_v5_auxiliaries(bundle, b"", {}, Runtime())
    assert summary["same_blocker_auxiliaries_validated"] == 1
    assert summary["same_blocker_distinct_pairs"] == 1

    class BadRuntime(Runtime):
        @staticmethod
        def parse_complete_model(stdout: bytes, count: int) -> dict[int, bool]:
            assignment = Runtime.parse_complete_model(stdout, count)
            assignment[9] = True
            return assignment

    with pytest.raises(runner.RunnerError, match="sameBlocker readback mismatch"):
        runner._validate_v5_auxiliaries(bundle, b"", {}, BadRuntime())


def test_complete_model_parser_rejects_missing_variable() -> None:
    with pytest.raises(runner.RunnerError, match="first missing variable is 2"):
        runner.parse_complete_model(b"s SATISFIABLE\nv 1 0\n", 2)


def test_optional_kissat_unavailable_path_makes_no_process(tmp_path: Path) -> None:
    runtime = runner._load_authenticated_runner_base()
    result, process = runtime._cross_check(
        tmp_path, None, "SAT", object(), timeout_seconds=30
    )
    assert result == {"status": "SKIPPED_UNAVAILABLE", "binary": "kissat"}
    assert process is None


def _receipt_rows(
    names: list[str], status: str = "COMPLETED"
) -> dict[str, dict[str, object]]:
    return {name: {"status": status} for name in names}


@pytest.mark.parametrize("status", ["FAILED", "UNKNOWN", "ERROR"])
def test_failure_and_unknown_phase_sets_reject_extra(status: str) -> None:
    base = [
        "cadical-version",
        "smoke-sat",
        "smoke-unsat",
        "smoke-unsat-drat-trim",
        "production-cadical",
    ]
    observed = ["cadical-version"] if status == "FAILED" else base
    runner._validate_process_phase_set(observed, _receipt_rows(observed), status, False)
    extra = observed + ["unexpected-helper"]
    with pytest.raises(runner.RunnerError, match="phase set"):
        runner._validate_process_phase_set(extra, _receipt_rows(extra), status, False)


def test_terminal_reentry_never_invokes_process(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    runtime = runner._load_authenticated_runner_base()
    test_root = Path("scratch/runs/firstnonhit-overlap-v5/reentry-test-only")
    absolute, _relative = runner._normalize_run_root(test_root)
    assert not absolute.exists()
    called = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal called
        called = True
        raise AssertionError("terminal reentry invoked a process")

    monkeypatch.setattr(runtime, "_run_process", forbidden)
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    with pytest.raises(runner.RunnerError, match="terminal root"):
        runner.terminal_reentry(test_root)
    assert called is False
    assert not absolute.exists()


@pytest.mark.parametrize("bad_timeout", [0, -1, True, False, 1.0, "30"])
def test_dry_run_rejects_invalid_timeout(bad_timeout: object) -> None:
    with pytest.raises(runner.RunnerError, match="timeout"):
        runner.dry_run(None, bad_timeout, False)  # type: ignore[arg-type]
