# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import inspect
import json
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_common_payload_v6_run as runner


@pytest.fixture(scope="module")
def dry_run_result() -> dict[str, object]:
    return runner.dry_run(Path(runner.PROPOSED_RUN_ROOT), 30, False)


def test_dry_run_is_approved_registered_nonlaunch_with_zero_solver_calls(
    dry_run_result: dict[str, object],
) -> None:
    result = dry_run_result
    assert result["mode"] == "DRY_RUN"
    assert result["launch"] is False
    assert result["audit_status"] == "APPROVED"
    assert result["solver_calls"] == 0
    assert result["run_root_created"] is False
    assert result["variables"] == 93_280
    assert result["clauses"] == 606_898
    assert result["cnf_sha256"] == runner.EXPECTED_CNF_SHA256
    assert result["source_total"] is False
    assert result["common_payload_field_count"] == 30
    assert result["common_surface_identified_with_c"] is False
    assert result["independent_audit"] == runner.INDEPENDENT_AUDIT
    assert result["independent_audit"]["status"] == "APPROVED"
    assert result["independent_audit"]["counts_reproduced"] == {
        "variables": 93_280,
        "clauses": 606_898,
    }
    assert result["independent_audit"]["cnf_sha256_reproduced"] == (
        runner.EXPECTED_CNF_SHA256
    )
    assert result["independent_audit"]["payload_field_coverage_reproduced"] == 30
    assert result["independent_audit"]["source_map_audited"] is True
    assert result["independent_audit"]["no_unsound_clause_found"] is True
    assert result["independent_audit"]["launch_authorized"] is True
    assert result["run_root"] == {
        "path": runner.PROPOSED_RUN_ROOT,
        "registered": True,
    }
    assert result["predecessor_model_control"]["known_violating_pairs"] == [
        [7, 15],
        [8, 15],
    ]


def test_checkpoint_registers_exact_existing_production_root() -> None:
    checkpoint = runner._read_checkpoint()
    assert checkpoint["lane_id"] == runner.LANE_ID
    assert checkpoint["generated_roots"] == [runner.PROPOSED_RUN_ROOT]
    assert checkpoint["manifest_sha256"] == (
        "0f03992ffef36cba07f14767ea532106b69353e9e0e321a12f3d8b126d51b374"
    )
    assert checkpoint["durable_paths"] == []
    assert checkpoint["owned_paths"] == [
        ".codex/worktree-checkpoints/firstnonhit-common-payload-v6.json",
        "census/p97_search/freshthird_firstnonhit_common_payload_v6.py",
        "census/p97_search/freshthird_firstnonhit_common_payload_v6_run.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_common_payload_v6.py",
        "census/p97_search/tests/test_freshthird_firstnonhit_common_payload_v6_run.py",
    ]
    absolute, relative = runner._normalize_run_root(Path(runner.PROPOSED_RUN_ROOT))
    assert relative == runner.PROPOSED_RUN_ROOT
    assert runner._registration_status(relative) is True
    assert absolute.is_dir()
    assert (absolute / "terminal-receipt.json").is_file()


def test_unregistered_root_blocks_before_process_or_creation(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    configured = runner._load_authenticated_runner_base()
    root = Path("scratch/runs/firstnonhit-common-payload-v6/unregistered-test-only")
    absolute, _relative = runner._normalize_run_root(root)
    assert not absolute.exists()
    called = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal called
        called = True
        raise AssertionError("process path ran before registration")

    monkeypatch.setattr(configured, "_run_process", forbidden)
    with pytest.raises(runner.RunnerError, match="not registered"):
        runner.run_once(root, timeout_seconds=30, cross_check=False)
    assert called is False
    assert not absolute.exists()


def test_pending_audit_blocks_registered_root_before_process_or_creation(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    configured = runner._load_authenticated_runner_base()
    root = Path("scratch/runs/firstnonhit-common-payload-v6/pending-test-only")
    absolute, _relative = runner._normalize_run_root(root)
    assert not absolute.exists()
    called = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal called
        called = True
        raise AssertionError("process path ran before audit approval")

    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    monkeypatch.setattr(
        runner,
        "INDEPENDENT_AUDIT",
        {
            **runner.INDEPENDENT_AUDIT,
            "status": "PENDING",
            "counts_reproduced": None,
            "cnf_sha256_reproduced": None,
            "payload_field_coverage_reproduced": None,
            "source_map_audited": False,
            "no_unsound_clause_found": False,
            "launch_authorized": False,
        },
    )
    monkeypatch.setattr(configured, "_run_process", forbidden)
    with pytest.raises(runner.RunnerError, match="pending independent audit"):
        runner.run_once(root, timeout_seconds=30, cross_check=False)
    assert called is False
    assert not absolute.exists()


def test_approved_gate_delegates_only_to_mocked_runtime_on_isolated_root(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    configured = runner._load_authenticated_runner_base()
    root = Path("scratch/runs/firstnonhit-common-payload-v6/approved-test-only")
    absolute, _relative = runner._normalize_run_root(root)
    assert not absolute.exists()
    calls: list[tuple[Path, int, bool]] = []

    def delegated(
        delegated_root: Path, *, timeout_seconds: int, cross_check: bool
    ) -> dict[str, object]:
        calls.append((delegated_root, timeout_seconds, cross_check))
        return {"status": "TEST_DELEGATED"}

    monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", dict(runner.INDEPENDENT_AUDIT))
    monkeypatch.setattr(runner, "_registration_status", lambda _relative: True)
    monkeypatch.setattr(configured, "run_once", delegated)
    result = runner.run_once(root, timeout_seconds=47, cross_check=True)
    assert result == {"status": "TEST_DELEGATED"}
    assert calls == [(root, 47, True)]
    assert not absolute.exists()


def test_approval_gate_requires_every_exact_audit_field(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    base = {
        **runner.INDEPENDENT_AUDIT,
        "status": "APPROVED",
        "counts_reproduced": runner.EXPECTED_COUNTS,
        "cnf_sha256_reproduced": runner.EXPECTED_CNF_SHA256,
        "payload_field_coverage_reproduced": 30,
        "source_map_audited": True,
        "no_unsound_clause_found": True,
        "launch_authorized": True,
    }
    for field, bad in (
        ("counts_reproduced", None),
        ("cnf_sha256_reproduced", None),
        ("payload_field_coverage_reproduced", 29),
        ("source_map_audited", False),
        ("no_unsound_clause_found", False),
        ("launch_authorized", False),
    ):
        monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", {**base, field: bad})
        with pytest.raises(runner.RunnerError, match="pending independent audit"):
            runner._require_launch_audit()
    monkeypatch.setattr(runner, "INDEPENDENT_AUDIT", base)
    runner._require_launch_audit()


def test_common_blocker_readback_uses_blocker_outputs_not_source_indices() -> None:
    runner._load_authenticated_runner_base()
    selected_roles = {
        runner.emitter.v2.P1: 3,
        runner.emitter.v2.R1: 4,
        runner.emitter.v2.APEX: 10,
        "second_apex": 11,
    }
    named_blockers = {
        runner.emitter.v2.P1: 8,
        runner.emitter.v2.R1: 9,
    }
    common_blockers = {"one": 3, "two": 4}
    assert selected_roles[runner.emitter.v2.P1] != named_blockers[runner.emitter.v2.P1]
    assert selected_roles[runner.emitter.v2.R1] != named_blockers[runner.emitter.v2.R1]

    # The common blockers may equal retained source indices.  The Lean fields
    # forbid equality with blockerMap outputs, so this must be accepted.
    runner._validate_common_blocker_inequalities(
        common_blockers, selected_roles, named_blockers
    )

    with pytest.raises(runner.RunnerError, match="blocker inequality failed"):
        runner._validate_common_blocker_inequalities(
            {"one": named_blockers[runner.emitter.v2.P1], "two": 4},
            selected_roles,
            named_blockers,
        )


def test_exact_v5_and_v6_sources_are_authenticated() -> None:
    rows = runner._authenticated_source_rows()
    assert rows["encoder_v5"]["sha256"] == (
        "6bf562662f826a51eba2b56d555476faeb84a234603c06ecefac8874501c74c3"
    )
    assert rows["runner_v5"]["sha256"] == (
        "4603445de8f7cc087e4ebf132f003f9eaf284d124ebcb81981f688d9fce4bea4"
    )
    assert rows["encoder_v6"]["sha256"] == (
        "317967139dfdca861a0e7c2eb28d572a98eab34ac44abe7818a42385613c7d76"
    )
    for label, row in rows.items():
        data = (runner._repo_root() / row["path"]).read_bytes()
        assert hashlib.sha256(data).hexdigest() == row["sha256"], label
    ingress = runner._authenticate_lean_ingress()
    assert ingress["commit"] == runner.LEAN_COMMIT
    assert set(ingress["sources"]) == {"common_payload", "aggregate_hingress"}


def test_source_hash_drift_fails_before_dynamic_load(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    specs = dict(runner.AUTHENTICATED_SOURCE_SPECS)
    path, _digest = specs["encoder_v6"]
    specs["encoder_v6"] = (path, "0" * 64)
    monkeypatch.setattr(runner, "AUTHENTICATED_SOURCE_SPECS", specs)
    with pytest.raises(runner.RunnerError, match="encoder_v6 source hash mismatch"):
        runner._authenticated_source_rows()


def test_delegated_v5_custody_contains_all_one_shot_phases() -> None:
    runner._load_authenticated_runner_base()
    source = inspect.getsource(runner.v5_runner._run_once_v5)
    guarded_index = source.index("    try:")
    create_index = source.index("root.mkdir()")
    manifest_index = source.index('runtime._write_new(root / "run-manifest.json"')
    bundle_index = source.index("runtime._write_bundle(root, bundle)")
    assert guarded_index < create_index < manifest_index < bundle_index
    for required in (
        "_record_binary_versions",
        "_run_smokes",
        '"production-cadical"',
        "validate_model(bundle, production.stdout)",
        "_check_drat",
        "_cross_check",
        "_terminal_receipt",
        "_quarantine_inprogress",
        "_recover_manifest",
        "_recover_terminal_receipt",
    ):
        assert required in source
    configured = runner._load_authenticated_runner_base()
    manifest_source = inspect.getsource(configured._initial_manifest)
    assert "v6_common_payload_semantic_readback" in manifest_source
    assert "custody_base" in manifest_source


def test_cli_default_is_dry_run_and_emits_approved_json(
    capsys: pytest.CaptureFixture[str],
) -> None:
    assert runner.main(["--timeout-seconds", "30"]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["mode"] == "DRY_RUN"
    assert result["audit_status"] == "APPROVED"
    assert result["solver_calls"] == 0
