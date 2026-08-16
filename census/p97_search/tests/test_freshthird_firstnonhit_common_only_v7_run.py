# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_common_only_v7_run as runner


@pytest.fixture(scope="module")
def dry_run_result() -> dict[str, object]:
    return runner.dry_run(Path(runner.PROPOSED_RUN_ROOT), 30, False)


def test_dry_run_is_approved_registered_root_absent_and_zero_call(
    dry_run_result: dict[str, object],
) -> None:
    result = dry_run_result
    assert result["mode"] == "DRY_RUN"
    assert result["launch"] is False
    assert result["launch_enabled"] is True
    assert result["audit_status"] == "APPROVED"
    assert result["solver_calls"] == 0
    assert result["run_root_created"] is False
    assert result["run_root"] == {
        "path": runner.PROPOSED_RUN_ROOT,
        "registered": True,
    }
    assert result["variables"] == 93_342
    assert result["clauses"] == 638_735
    assert result["cnf_sha256"] == runner.EXPECTED_CNF_SHA256
    assert result["source_total"] is False
    assert result["common_payload_active"] is True
    assert result["retained_active"] is False
    assert result["common_payload_field_count"] == 30
    assert result["reduced_payload_complete_for_finite_assignment"] is True
    assert result["faithful_six_center_boundary_encoded"] is False
    assert result["native_terminal_reentry"] is True
    assert result["manifest_first_runner"] is True
    assert result["independent_audit"]["launch_authorized"] is True
    assert result["independent_audit"]["bundle_hashes_reproduced"] == (
        runner.EXPECTED_BUNDLE_SHA256
    )
    assert result["source_revision"] == {
        "repository_head_claimed_as_source_revision": False,
        "source_projection_commit": runner.emitter.LEAN_COMMIT,
        "target_file_revisions": {
            runner.emitter.REDUCED_PAYLOAD_SOURCE_FILE: runner.emitter.LEAN_COMMIT,
            runner.emitter.INTERACTION_INGRESS_SOURCE_FILE: (
                runner.emitter.INTERACTION_INGRESS_SOURCE_COMMIT
            ),
        },
        "target_files_authenticated_unchanged": True,
    }


def test_checkpoint_has_no_generated_root_and_exact_owned_paths() -> None:
    checkpoint = runner._read_checkpoint()
    assert checkpoint["lane_id"] == runner.LANE_ID
    assert checkpoint["generated_roots"] == [runner.PROPOSED_RUN_ROOT]
    assert checkpoint["durable_paths"] == []
    assert checkpoint["owned_paths"] == [
        ".codex/worktree-checkpoints/firstnonhit-common-only-v7.json",
        "census/p97_search/freshthird_firstnonhit_common_only_v7.py",
        "census/p97_search/freshthird_firstnonhit_common_only_v7_run.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_common_only_v7.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_common_only_v7_run.py",
    ]


def test_readback_rejects_inactive_common_payload_before_branch_escape() -> None:
    stdout = runner._read_regular(
        runner._repo_root() / "scratch/runs/firstnonhit-common-payload-v6/"
        "n17-one-shot-audit-approved/production-cadical.stdout",
        "authenticated v6 retained-branch SAT model",
    )
    added_false = (
        b"v "
        + b" ".join(
            str(-identifier).encode("ascii")
            for identifier in range(
                runner.emitter.PREDECESSOR_VARIABLES + 1,
                runner.EXPECTED_COUNTS["variables"] + 1,
            )
        )
        + b" 0\n"
    )
    with pytest.raises(runner.RunnerError, match="common payload must be active"):
        runner.validate_model(runner.emitter.emit_bundle(17), stdout + added_false)


def test_unregistered_direct_gate_precedes_root_creation_or_process(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    root = tmp_path / runner.RUN_PREFIX / "n17-one-shot-unregistered-test"
    sources = runner._authenticated_source_rows()
    monkeypatch.setattr(runner, "_repo_root", lambda: tmp_path)
    monkeypatch.setattr(runner, "_authenticated_source_rows", lambda: sources)
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: False)

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("unregistered launch crossed a direct safety gate")

    monkeypatch.setattr(runner, "_create_root", forbidden)
    monkeypatch.setattr(runner, "_run_process", forbidden)
    monkeypatch.setattr(runner, "_binary_identity", forbidden)
    with pytest.raises(runner.RunnerError, match="not registered"):
        runner.run_once(root, timeout_seconds=30, cross_check=False)
    assert not root.exists()


def test_native_unsat_terminal_replay_is_zero_call_and_checks_certificate(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    sources = runner._authenticated_source_rows()
    monkeypatch.setattr(runner, "_repo_root", lambda: tmp_path)
    monkeypatch.setattr(runner, "_authenticated_source_rows", lambda: sources)
    relative = f"{runner.RUN_PREFIX}synthetic-replay"
    root = tmp_path / relative
    root.mkdir(parents=True)

    bundle = runner.emitter.emit_bundle(17)
    manifest = runner._initial_manifest(relative, bundle, 30, False)
    manifest_data = runner._canonical_json(manifest)
    runner._write_new(root / "run-manifest.json", manifest_data)
    runner._write_bundle(root, bundle)
    binary = {
        "name": "cadical",
        "path": "/synthetic/cadical",
        "sha256": "a" * 64,
        "size": 1,
    }
    drat = {
        "name": "drat_trim",
        "path": "/synthetic/drat-trim",
        "sha256": "b" * 64,
        "size": 1,
    }
    runner._write_binaries(root, binary, drat, None)

    specs = (
        ("cadical-version", 0, b"cadical synthetic\n"),
        ("drat_trim-version", 0, b"drat-trim synthetic\n"),
        ("smoke-sat", 10, b"s SATISFIABLE\n"),
        ("smoke-unsat", 20, b"s UNSATISFIABLE\n"),
        ("smoke-unsat-drat-trim", 0, b"s VERIFIED\n"),
        ("production-cadical", 20, b"s UNSATISFIABLE\n"),
        ("production-drat-trim", 0, b"s VERIFIED\n"),
    )
    commands = {
        "cadical-version": ("/synthetic/cadical", "--version"),
        "drat_trim-version": ("/synthetic/drat-trim", "--version"),
        "smoke-sat": ("/synthetic/cadical", str(root / "smoke-sat.cnf")),
        "smoke-unsat": (
            "/synthetic/cadical",
            str(root / "smoke-unsat.cnf"),
            str(root / ".smoke-unsat.drat.inprogress"),
        ),
        "smoke-unsat-drat-trim": (
            "/synthetic/drat-trim",
            str(root / "smoke-unsat.cnf"),
            str(root / ".smoke-unsat.drat.inprogress"),
        ),
        "production-cadical": (
            "/synthetic/cadical",
            "-t",
            "30",
            str(root / "problem.cnf"),
            str(root / ".production.drat.inprogress"),
        ),
        "production-drat-trim": (
            "/synthetic/drat-trim",
            str(root / "problem.cnf"),
            str(root / ".production.drat.inprogress"),
        ),
    }
    processes = [
        runner._record_process(
            root,
            runner.ProcessResult(
                name,
                commands[name],
                "COMPLETED",
                returncode,
                1,
                stdout,
                b"",
            ),
        )
        for name, returncode, stdout in specs
    ]
    proof_data = b"synthetic checked DRAT custody\n"
    runner._write_new(root / "production.drat", proof_data)
    result = {
        "verdict": "UNSAT",
        "proof": {
            "path": "production.drat",
            "sha256": runner._sha256(proof_data),
            "size": len(proof_data),
            "drat_trim_verified": True,
        },
    }
    runner._terminal_receipt(
        root,
        runner._sha256(manifest_data),
        "UNSAT",
        result,
        processes,
    )

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("terminal reentry invoked a process or binary lookup")

    monkeypatch.setattr(runner, "_run_process", forbidden)
    monkeypatch.setattr(runner, "_binary_identity", forbidden)
    monkeypatch.setattr(runner.subprocess, "run", forbidden)
    replay = runner.terminal_reentry(root)
    assert replay["status"] == "UNSAT"
    assert replay["terminal_reentry"] is True
    assert replay["solver_calls"] == 0
    assert replay["result"] == result


def test_complete_model_parser_rejects_partial_or_conflicting_assignments() -> None:
    with pytest.raises(runner.RunnerError, match="incomplete"):
        runner.parse_complete_model(b"s SATISFIABLE\nv 1 0\n", 2)
    with pytest.raises(runner.RunnerError, match="more than once"):
        runner.parse_complete_model(b"s SATISFIABLE\nv 1 -1 0\n", 1)
