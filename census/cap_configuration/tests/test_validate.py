from __future__ import annotations

import os
import shutil
from pathlib import Path

import pytest

import census.cap_configuration.validate as validate_module
from census.cap_configuration.campaign import (
    ATTEMPT_OUTCOME_SCHEMA,
    ATTEMPT_STAGE_SCHEMA,
    CELL_RESULT_SCHEMA,
    CapConfigurationCampaignError,
    _open_repo,
    campaign_status,
)
from census.cap_configuration.schema import (
    canonical_json_bytes,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)
from census.cap_configuration.validate import _walk_files, validate_campaign

from .test_campaign import FakeAdapter, execute_fixture, prepare_fixture


def test_planned_prefix_validates_offline_as_incomplete(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert report.diagnostic_coverage is False
    assert len(report.missing_cell_ids) == 3
    assert report.classification_counts == {}
    assert report.resume_safe is True


@pytest.mark.skipif(os.name == "nt", reason="descriptor tests require POSIX paths")
def test_validator_rejects_symlinked_optional_directory(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    attempts = prepared.repo / prepared.run_root / "events/attempts"
    outside = tmp_path / "outside-attempts"
    outside.mkdir()
    attempts.mkdir()
    attempts.rmdir()
    attempts.symlink_to(outside, target_is_directory=True)
    with pytest.raises(
        CapConfigurationCampaignError, match="cannot safely open directory"
    ):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


@pytest.mark.skipif(os.name == "nt", reason="permission tests require POSIX paths")
def test_validator_rejects_inaccessible_optional_directory(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    attempts = prepared.repo / prepared.run_root / "events/attempts"
    attempts.mkdir()
    original_mode = attempts.stat().st_mode & 0o777
    attempts.chmod(0)
    try:
        with pytest.raises(
            CapConfigurationCampaignError, match="cannot safely open directory"
        ):
            validate_campaign(
                prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
            )
    finally:
        attempts.chmod(original_mode)


@pytest.mark.skipif(os.name == "nt", reason="descriptor tests require POSIX paths")
def test_recursive_walk_rejects_nested_directory_rebind(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "walk"
    root.mkdir()
    (root / "tree" / "nested").mkdir(parents=True)
    other = tmp_path / "other"
    other.mkdir()
    root_fd = _open_repo(root)
    original_stat = validate_module.os.stat
    calls = 0

    def rebind_after_open(path: object, *args: object, **kwargs: object):
        nonlocal calls
        if path == "nested":
            calls += 1
            if calls == 2:
                return original_stat(other)
        return original_stat(path, *args, **kwargs)

    monkeypatch.setattr(validate_module.os, "stat", rebind_after_open)
    try:
        with pytest.raises(CapConfigurationCampaignError, match="identity changed"):
            _walk_files(root_fd, "tree")
    finally:
        os.close(root_fd)


def test_missing_result_reconstructs_incomplete_coverage(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    result = next(
        (prepared.repo / prepared.run_root / "artifacts/results").glob("*/*.json")
    )
    result.unlink()
    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert len(report.missing_cell_ids) == 1
    assert "latest retained coverage differs" in " ".join(report.observations)


def test_missing_first_cell_with_later_attempt_is_not_resume_safe(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    first_cell = prepared.plan["ordered_cell_ids"][0]
    shutil.rmtree(prepared.repo / prepared.run_root / "events/attempts" / first_cell)
    shutil.rmtree(prepared.repo / prepared.run_root / "artifacts/results" / first_cell)
    with pytest.raises(
        CapConfigurationCampaignError, match="authorization consumption"
    ):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_missing_middle_cell_with_later_attempt_is_not_resume_safe(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    middle_cell = prepared.plan["ordered_cell_ids"][1]
    later_cell = prepared.plan["ordered_cell_ids"][2]
    shutil.rmtree(prepared.repo / prepared.run_root / "events/attempts" / middle_cell)
    shutil.rmtree(prepared.repo / prepared.run_root / "artifacts/results" / middle_cell)

    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert report.resume_safe is False
    assert middle_cell in report.missing_cell_ids
    assert any(later_cell in item for item in report.orphan_attempts)


def test_later_attempt_after_nonterminal_cell_is_not_resume_safe(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    first_cell = prepared.plan["ordered_cell_ids"][0]
    result = next(
        (prepared.repo / prepared.run_root / "artifacts/results" / first_cell).glob(
            "*.json"
        )
    )
    result.unlink()

    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert report.resume_safe is False
    assert first_cell in report.nonterminal_cell_ids
    assert any(
        prepared.plan["ordered_cell_ids"][1] in item for item in report.orphan_attempts
    )


def test_swapped_result_is_rejected_as_crossed_identity(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    results = sorted(
        (prepared.repo / prepared.run_root / "artifacts/results").glob("*/*.json")
    )
    first_bytes = results[0].read_bytes()
    results[0].unlink()
    results[0].write_bytes(results[1].read_bytes())
    with pytest.raises(CapConfigurationCampaignError, match="crossed identity"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )
    results[0].unlink()
    results[0].write_bytes(first_bytes)


@pytest.mark.parametrize(
    ("field", "value"),
    [("certificate_ref", "certificate/foreign"), ("certificate_status", "CHECKED")],
)
def test_cell_result_certificate_projection_must_match_outcome(
    tmp_path: Path, field: str, value: str
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    result_path = next(
        (prepared.repo / prepared.run_root / "artifacts/results").glob("*/*.json")
    )
    result = parse_stored_json_bytes(result_path.read_bytes())
    result[field] = value
    body = {key: item for key, item in result.items() if key != "cell_result_sha256"}
    result["cell_result_sha256"] = structured_hash(CELL_RESULT_SCHEMA, body)
    result_path.unlink()
    result_path.write_bytes(stored_json_bytes(result))
    with pytest.raises(CapConfigurationCampaignError, match="crossed identity"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("kind", "failed"),
        ("certificate_ref", "certificate/forged"),
        ("certificate_status", "CHECKED"),
        ("failure", {"message": "forged", "stage": "adapter"}),
        ("semantic_replay_sha256", "0" * 64),
    ],
)
def test_synchronized_outcome_and_result_rehash_cannot_forge_projection(
    tmp_path: Path,
    field: str,
    value: object,
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    attempt = next(
        path
        for path in (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000"
        )
        if parse_stored_json_bytes((path / "outcome.json").read_bytes())[
            "adapter_classification"
        ]
        == "SAT_SEMANTICALLY_REPLAYED"
    )
    outcome_path = attempt / "outcome.json"
    outcome = parse_stored_json_bytes(outcome_path.read_bytes())
    outcome[field] = value
    outcome_body = {
        key: item for key, item in outcome.items() if key != "outcome_sha256"
    }
    outcome["outcome_sha256"] = structured_hash(ATTEMPT_OUTCOME_SCHEMA, outcome_body)
    outcome_path.unlink()
    outcome_path.write_bytes(stored_json_bytes(outcome))

    admission = parse_stored_json_bytes((attempt / "admission.json").read_bytes())
    result_path = (
        prepared.repo
        / prepared.run_root
        / "artifacts/results"
        / admission["identity"]["cell_id"]
        / f"{admission['attempt_id']}.json"
    )
    result = parse_stored_json_bytes(result_path.read_bytes())
    result["selection"]["outcome_sha256"] = outcome["outcome_sha256"]
    if field in {"certificate_ref", "certificate_status"}:
        result[field] = value
    result_body = {
        key: item for key, item in result.items() if key != "cell_result_sha256"
    }
    result["cell_result_sha256"] = structured_hash(CELL_RESULT_SCHEMA, result_body)
    result_path.unlink()
    result_path.write_bytes(stored_json_bytes(result))

    with pytest.raises(
        CapConfigurationCampaignError, match="attempt outcome projection mismatch"
    ):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("failure", {"message": "RuntimeError", "stage": "adapter"}),
        ("adapter_result_raw_sha256", "0" * 64),
    ],
)
def test_rehashed_failure_outcome_must_match_failure_stage(
    tmp_path: Path,
    field: str,
    value: object,
) -> None:
    class FailureAdapter(FakeAdapter):
        def __call__(self, **_kwargs: object) -> dict[str, object]:
            raise ValueError("fixture adapter failure")

    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FailureAdapter())
    attempt = next(
        (prepared.repo / prepared.run_root / "events/attempts").glob("*/000000")
    )
    outcome_path = attempt / "outcome.json"
    outcome = parse_stored_json_bytes(outcome_path.read_bytes())
    outcome[field] = value
    outcome_body = {
        key: item for key, item in outcome.items() if key != "outcome_sha256"
    }
    outcome["outcome_sha256"] = structured_hash(ATTEMPT_OUTCOME_SCHEMA, outcome_body)
    outcome_path.unlink()
    outcome_path.write_bytes(stored_json_bytes(outcome))

    admission = parse_stored_json_bytes((attempt / "admission.json").read_bytes())
    result_path = (
        prepared.repo
        / prepared.run_root
        / "artifacts/results"
        / admission["identity"]["cell_id"]
        / f"{admission['attempt_id']}.json"
    )
    result = parse_stored_json_bytes(result_path.read_bytes())
    result["selection"]["outcome_sha256"] = outcome["outcome_sha256"]
    result_body = {
        key: item for key, item in result.items() if key != "cell_result_sha256"
    }
    result["cell_result_sha256"] = structured_hash(CELL_RESULT_SCHEMA, result_body)
    result_path.unlink()
    result_path.write_bytes(stored_json_bytes(result))

    with pytest.raises(
        CapConfigurationCampaignError, match="attempt outcome projection mismatch"
    ):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("admission_policy", "foreign-policy/v1"),
        ("reason", "first_terminal_attempt"),
    ],
)
def test_cell_result_selection_policy_and_reason_are_frozen(
    tmp_path: Path, field: str, value: str
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    result_path = next(
        (prepared.repo / prepared.run_root / "artifacts/results").glob("*/*.json")
    )
    result = parse_stored_json_bytes(result_path.read_bytes())
    result["selection"][field] = value
    body = {key: item for key, item in result.items() if key != "cell_result_sha256"}
    result["cell_result_sha256"] = structured_hash(CELL_RESULT_SCHEMA, body)
    result_path.unlink()
    result_path.write_bytes(stored_json_bytes(result))
    with pytest.raises(CapConfigurationCampaignError, match="selection mismatch"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_run_manifest_cannot_omit_snapshot_even_after_rehash(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    path = prepared.repo / prepared.run_root / "run_manifest.json"
    value = parse_stored_json_bytes(path.read_bytes())
    value["input_digests"].pop(next(iter(value["input_digests"])))
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    value["manifest_sha256"] = raw_sha256(canonical_json_bytes(unsigned))
    path.unlink()
    path.write_bytes(stored_json_bytes(value))
    with pytest.raises(CapConfigurationCampaignError, match="complete plan inventory"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_rehashed_plan_cannot_relocate_snapshot_within_retained_tree(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    run = prepared.repo / prepared.run_root
    plan_path = run / "artifacts/plan.json"
    plan = parse_stored_json_bytes(plan_path.read_bytes())
    snapshot = plan["snapshot_files"][0]
    original_relative = snapshot["retained_path"]
    relocated_relative = "artifacts/snapshots/noncanonical/relocated.json"
    relocated_path = run / relocated_relative
    relocated_path.parent.mkdir(parents=True)
    (run / original_relative).rename(relocated_path)
    snapshot["retained_path"] = relocated_relative
    plan_body = {key: item for key, item in plan.items() if key != "plan_sha256"}
    plan["plan_sha256"] = structured_hash(plan["schema"], plan_body)
    plan_path.unlink()
    plan_path.write_bytes(stored_json_bytes(plan))

    run_manifest_path = run / "run_manifest.json"
    run_manifest = parse_stored_json_bytes(run_manifest_path.read_bytes())
    original_key = f"{prepared.run_root}/{original_relative}"
    relocated_key = f"{prepared.run_root}/{relocated_relative}"
    run_manifest["input_digests"][relocated_key] = run_manifest["input_digests"].pop(
        original_key
    )
    unsigned = {
        key: item for key, item in run_manifest.items() if key != "manifest_sha256"
    }
    run_manifest["manifest_sha256"] = raw_sha256(canonical_json_bytes(unsigned))
    run_manifest_path.unlink()
    run_manifest_path.write_bytes(stored_json_bytes(run_manifest))

    with pytest.raises(CapConfigurationCampaignError, match="noncanonical"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_stage_swap_is_rejected_before_interpretation(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    stages = next(
        (prepared.repo / prepared.run_root / "events/attempts").glob("*/000000/stages")
    )
    stage0 = stages / "000000-resource-attestation.json"
    stage1 = stages / "000001-request-intent.json"
    stage0_bytes = stage0.read_bytes()
    stage0.unlink()
    stage0.write_bytes(stage1.read_bytes())
    with pytest.raises(CapConfigurationCampaignError, match="stage chain mismatch"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )
    stage0.unlink()
    stage0.write_bytes(stage0_bytes)


def test_unreferenced_attempt_artifact_forces_incomplete_orphan_inventory(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    attempt = next(
        (prepared.repo / prepared.run_root / "events/attempts").glob("*/000000")
    )
    (attempt / "unreferenced.json").write_bytes(b"{}\n")
    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert any("unreferenced.json" in item for item in report.orphan_attempts)


def test_failure_stage_piqd_artifact_blocks_validation_and_resume(
    tmp_path: Path,
) -> None:
    class ArtifactThenFailureAdapter(FakeAdapter):
        def __call__(self, **kwargs: object) -> dict[str, object]:
            output_fd = kwargs["output_fd"]
            assert type(output_fd) is int
            descriptor = os.open(
                "partial-adapter-artifact.json",
                os.O_WRONLY | os.O_CREAT | os.O_EXCL,
                0o600,
                dir_fd=output_fd,
            )
            try:
                os.write(descriptor, b"{}\n")
            finally:
                os.close(descriptor)
            raise RuntimeError("adapter failed after partial publication")

    prepared = prepare_fixture(tmp_path)
    adapter = ArtifactThenFailureAdapter()
    coverage = execute_fixture(prepared, adapter)
    assert coverage["coverage_status"] == "INCOMPLETE"

    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.resume_safe is False
    assert any(
        "partial-adapter-artifact.json" in item for item in report.orphan_attempts
    )

    with pytest.raises(CapConfigurationCampaignError) as caught:
        execute_fixture(prepared, adapter)
    assert caught.value.code == "BLOCKED_CUSTODY_OR_IDENTITY"


def test_raw_sat_values_mutation_is_rejected(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    values = next(
        (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/piqd/cap-values.json"
        )
    )
    values.unlink()
    values.write_bytes(b'{"values":"((x 1) (y 0))"}\n')
    with pytest.raises(CapConfigurationCampaignError, match="hash mismatch"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_offline_validator_rejects_cross_cell_session_reuse(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    adapter_results = sorted(
        (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/adapter-result.json"
        )
    )
    first = parse_stored_json_bytes(adapter_results[0].read_bytes())
    second_path = adapter_results[1]
    second = parse_stored_json_bytes(second_path.read_bytes())
    second["session_id"] = first["session_id"]
    second_payload = stored_json_bytes(second)
    second_path.unlink()
    second_path.write_bytes(second_payload)

    stage_path = second_path.parent / "stages/000002-adapter-completed.json"
    stage = parse_stored_json_bytes(stage_path.read_bytes())
    stage["payload"]["adapter_result_raw_sha256"] = raw_sha256(second_payload)
    stage_body = {key: value for key, value in stage.items() if key != "stage_sha256"}
    stage["stage_sha256"] = structured_hash(ATTEMPT_STAGE_SCHEMA, stage_body)
    stage_path.unlink()
    stage_path.write_bytes(stored_json_bytes(stage))

    outcome_path = second_path.parent / "outcome.json"
    outcome = parse_stored_json_bytes(outcome_path.read_bytes())
    outcome["adapter_result_raw_sha256"] = raw_sha256(second_payload)
    outcome["previous_sha256"] = stage["stage_sha256"]
    outcome_body = {
        key: value for key, value in outcome.items() if key != "outcome_sha256"
    }
    outcome["outcome_sha256"] = structured_hash(ATTEMPT_OUTCOME_SCHEMA, outcome_body)
    outcome_path.unlink()
    outcome_path.write_bytes(stored_json_bytes(outcome))

    with pytest.raises(CapConfigurationCampaignError, match="reuse a session_id"):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_mutated_caller_manifest_cannot_replace_retained_snapshot(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    manifest = prepared.repo / prepared.manifest_path
    manifest.write_bytes(manifest.read_bytes() + b" ")
    with pytest.raises(
        CapConfigurationCampaignError, match="differs from planned snapshot"
    ):
        validate_campaign(
            prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
        )


def test_status_never_upgrades_observation_to_validation(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    status = campaign_status(prepared.run_root, repo_root=prepared.repo)
    assert status["coverage_status"] == "COMPLETE"
    assert status["validated"] is False
    assert status["mathematical_claim"] is None
