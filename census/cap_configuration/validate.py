"""Standalone zero-network validator for retained cap-configuration runs."""

from __future__ import annotations

import argparse
import os
import re
import stat
import sys
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .campaign import (
    ATTEMPT_ADMISSION_SCHEMA,
    ATTEMPT_OUTCOME_SCHEMA,
    ATTEMPT_STAGE_SCHEMA,
    AUTHORIZATION_CONSUMPTION_SCHEMA,
    CELL_RESULT_SCHEMA,
    COVERAGE_SCHEMA,
    FALSE_CLAIMS,
    FINAL_RECAPTURE_SCHEMA,
    OUTPUT_CLASSES,
    PLAN_SCHEMA,
    RESOURCE_ATTESTATION_SCHEMA,
    RUN_MANIFEST_SCHEMA,
    CapConfigurationCampaignError,
    _adapter_session_id,
    _attempt_identity,
    _attempt_relative,
    _coverage,
    _digest,
    _directory_flags,
    _exact_int,
    _load_if_present,
    _load_plan,
    _object,
    _open_directory_at,
    _open_repo,
    _open_run,
    _parse_utc,
    _read_cap_json,
    _read_regular_at,
    _repo_relative,
    _request_id,
    _run_manifest_hash,
    _snapshot_universe,
    _strict_json_bytes,
    _text,
    _validate_fixture_adapter_result_shape,
    _validate_real_adapter_result,
    _verify_caller_matches_snapshot,
    _verify_record_hash,
    _verify_snapshots,
    validate_wave_authorization,
)
from .replay import replay_piqd_sat_values, verify_replay_record
from .schema import (
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)

VALIDATION_SCHEMA = "cap-configuration-validation-report/v1"


@dataclass(frozen=True, slots=True)
class ValidationReport:
    """Authenticated structural result; it deliberately carries no theorem claim."""

    campaign_id: str
    manifest_sha256: str
    run_root: str
    coverage_status: str
    diagnostic_coverage: bool
    classification_counts: Mapping[str, int]
    validated_cell_ids: tuple[str, ...]
    missing_cell_ids: tuple[str, ...]
    nonterminal_cell_ids: tuple[str, ...]
    orphan_attempts: tuple[str, ...]
    retained_coverage_sha256: str | None
    reconstructed_coverage_sha256: str
    resume_safe: bool
    observations: tuple[str, ...]

    def to_record(self) -> dict[str, Any]:
        return {
            "campaign_id": self.campaign_id,
            "classification_counts": dict(self.classification_counts),
            "coverage_status": self.coverage_status,
            "diagnostic_coverage": self.diagnostic_coverage,
            "manifest_sha256": self.manifest_sha256,
            "mathematical_claim": None,
            "missing_cell_ids": list(self.missing_cell_ids),
            "nonterminal_cell_ids": list(self.nonterminal_cell_ids),
            "observations": list(self.observations),
            "orphan_attempts": list(self.orphan_attempts),
            "reconstructed_coverage_sha256": self.reconstructed_coverage_sha256,
            "resume_safe": self.resume_safe,
            "retained_coverage_sha256": self.retained_coverage_sha256,
            "run_root": self.run_root,
            "schema": VALIDATION_SCHEMA,
            "validated": True,
            "validated_cell_ids": list(self.validated_cell_ids),
        }


def _fail(message: str, *, code: str = "BLOCKED_CUSTODY_OR_IDENTITY") -> None:
    raise CapConfigurationCampaignError(code, message)


def _list_directory(root_fd: int, relative: str) -> tuple[str, ...]:
    try:
        descriptor = _open_directory_at(root_fd, relative)
    except CapConfigurationCampaignError as exc:
        if "unsafe or missing directory" in str(exc):
            return ()
        raise
    try:
        names = tuple(sorted(os.listdir(descriptor)))
        for name in names:
            if name in {"", ".", ".."} or "/" in name or "\\" in name:
                _fail(f"unsafe directory member in {relative}")
            info = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            if stat.S_ISREG(info.st_mode):
                if info.st_nlink != 1:
                    _fail(f"hard-linked retained artifact: {relative}/{name}")
            elif not stat.S_ISDIR(info.st_mode):
                _fail(f"special retained artifact: {relative}/{name}")
        return names
    finally:
        os.close(descriptor)


def _walk_files(root_fd: int, relative: str) -> tuple[str, ...]:
    """Walk one retained tree through no-follow directory descriptors."""

    try:
        descriptor = _open_directory_at(root_fd, relative)
    except CapConfigurationCampaignError as exc:
        if "unsafe or missing directory" in str(exc):
            return ()
        raise
    rows: list[str] = []

    def visit(directory_fd: int, prefix: str) -> None:
        for name in sorted(os.listdir(directory_fd)):
            info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            path = f"{prefix}/{name}"
            if stat.S_ISDIR(info.st_mode):
                child = os.open(name, _directory_flags(), dir_fd=directory_fd)
                try:
                    visit(child, path)
                finally:
                    os.close(child)
            elif stat.S_ISREG(info.st_mode) and info.st_nlink == 1:
                rows.append(path)
            else:
                _fail(f"unsafe retained tree member: {path}")

    try:
        visit(descriptor, relative)
    finally:
        os.close(descriptor)
    return tuple(rows)


def _validate_run_manifest(
    repo_fd: int,
    run_fd: int,
    *,
    run_root: str,
    lane_id: str,
    run_id: str,
    plan: Mapping[str, Any],
) -> dict[str, Any]:
    value, _held = _read_cap_json(run_fd, "run_manifest.json")
    _object(
        value,
        {
            "base_head",
            "created_utc",
            "input_digests",
            "lane_id",
            "manifest_sha256",
            "output_classes",
            "owner",
            "root",
            "run_id",
            "schema",
            "source_digests",
        },
        "run manifest",
    )
    if value["schema"] != RUN_MANIFEST_SCHEMA:
        _fail("run manifest schema mismatch")
    if (
        value["root"] != run_root
        or value["lane_id"] != lane_id
        or value["run_id"] != run_id
    ):
        _fail("run manifest identity mismatch")
    if value["output_classes"] != OUTPUT_CLASSES:
        _fail("run manifest output classes mismatch")
    if value["base_head"] != plan["checkpoint"]["base_head"]:
        _fail("run manifest base_head mismatch")
    if value["owner"] != plan["checkpoint"]["owner"]:
        _fail("run manifest owner mismatch")
    _parse_utc(value["created_utc"], "run_manifest.created_utc")
    if value["manifest_sha256"] != _run_manifest_hash(value):
        _fail("run manifest self-hash mismatch")
    expected_inputs = {
        f"{run_root}/{entry['retained_path']}": entry["raw_sha256"]
        for entry in plan["snapshot_files"]
    }
    expected_sources = {
        source["path"]: source["raw_sha256"] for source in plan["source_records"]
    }
    expected_sources[plan["checkpoint"]["path"]] = plan["checkpoint"]["raw_sha256"]
    if value["input_digests"] != expected_inputs:
        _fail("run manifest input_digests differ from the complete plan inventory")
    if value["source_digests"] != expected_sources:
        _fail("run manifest source_digests differ from the complete plan inventory")
    for field in ("source_digests", "input_digests"):
        digest_map = value[field]
        if type(digest_map) is not dict or not digest_map:
            _fail(f"run manifest {field} must be nonempty")
        for path, expected in digest_map.items():
            relative = _repo_relative(path, f"run manifest {field} path")
            held = _read_regular_at(repo_fd, relative)
            if held.raw_sha256 != _digest(expected, f"run manifest {field} digest"):
                _fail(f"run manifest {field} drift: {relative}")
    return value


def _validate_consumption(
    run_fd: int,
    plan: Mapping[str, Any],
    first_attempt_id: str | None,
) -> dict[str, Any] | None:
    loaded = _load_if_present(run_fd, "events/authorization-consumption.json")
    if loaded is None:
        if first_attempt_id is not None:
            _fail(
                "attempt exists without authorization consumption",
                code="BLOCKED_AUTHORIZATION",
            )
        return None
    value = loaded[0]
    _object(
        value,
        {
            "attempt_id",
            "authorization_consumption_sha256",
            "authorization_sha256",
            "campaign_id",
            "consumed_utc",
            "run_root",
            "schema",
        },
        "authorization consumption",
    )
    if value["schema"] != AUTHORIZATION_CONSUMPTION_SCHEMA:
        _fail("authorization consumption schema mismatch", code="BLOCKED_AUTHORIZATION")
    _verify_record_hash(
        value,
        AUTHORIZATION_CONSUMPTION_SCHEMA,
        "authorization_consumption_sha256",
        "authorization consumption",
    )
    if (
        value["authorization_sha256"] != plan["authorization_sha256"]
        or value["campaign_id"] != plan["campaign_id"]
        or value["run_root"] != plan["run_root"]
        or value["attempt_id"] != first_attempt_id
    ):
        _fail(
            "authorization consumption crossed identity", code="BLOCKED_AUTHORIZATION"
        )
    _parse_utc(value["consumed_utc"], "authorization_consumption.consumed_utc")
    return value


def _validate_attestation(
    run_fd: int,
    plan: Mapping[str, Any],
    *,
    attempts_exist: bool,
) -> dict[str, Any] | None:
    loaded = _load_if_present(run_fd, "events/resource-attestation.json")
    if loaded is None:
        if attempts_exist:
            _fail(
                "attempt exists without resource attestation",
                code="BLOCKED_RESOURCE_BOUNDARY",
            )
        return None
    value = loaded[0]
    expected = {
        "campaign_id",
        "observed_piqd",
        "production_memory_ceiling_claimed",
        "recorded_utc",
        "resource_attestation_sha256",
        "resource_envelope",
        "run_root",
        "schema",
        "status",
        "supervisor_config_raw_sha256",
        "supervisor_identity",
        "telemetry_identity",
        "telemetry_policy_raw_sha256",
    }
    _object(value, expected, "resource attestation")
    if value["schema"] != RESOURCE_ATTESTATION_SCHEMA or value["status"] != "PASSED":
        _fail("resource attestation is not passed", code="BLOCKED_RESOURCE_BOUNDARY")
    _verify_record_hash(
        value,
        RESOURCE_ATTESTATION_SCHEMA,
        "resource_attestation_sha256",
        "resource attestation",
    )
    if (
        value["campaign_id"] != plan["campaign_id"]
        or value["run_root"] != plan["run_root"]
        or value["observed_piqd"] != plan["piqd"]
        or value["resource_envelope"] != plan["resource_envelope"]
    ):
        _fail("resource attestation crossed identity", code="BLOCKED_RESOURCE_BOUNDARY")
    _parse_utc(value["recorded_utc"], "resource_attestation.recorded_utc")
    return value


def _validate_admission(
    value: Mapping[str, Any],
    plan: Mapping[str, Any],
    cell: Any,
) -> None:
    _object(
        value,
        {"admission_sha256", "admitted_utc", "attempt_id", "identity", "schema"},
        "attempt admission",
    )
    if value["schema"] != ATTEMPT_ADMISSION_SCHEMA:
        _fail("attempt admission schema mismatch")
    _verify_record_hash(
        value, ATTEMPT_ADMISSION_SCHEMA, "admission_sha256", "attempt admission"
    )
    expected_identity = _attempt_identity(plan, cell, attempt_index=0)
    if value["identity"] != expected_identity:
        _fail("attempt admission identity mismatch")
    expected_id = structured_hash(
        "cap-configuration-attempt-identity/v1", expected_identity
    )
    if value["attempt_id"] != expected_id:
        _fail("attempt ID mismatch")
    _parse_utc(value["admitted_utc"], "admission.admitted_utc")


def _validate_stage(
    value: Mapping[str, Any],
    *,
    attempt_id: str,
    sequence: int,
    kind: str,
    previous_sha256: str,
) -> None:
    _object(
        value,
        {
            "attempt_id",
            "kind",
            "payload",
            "previous_sha256",
            "recorded_utc",
            "schema",
            "sequence",
            "stage_sha256",
        },
        "attempt stage",
    )
    if value["schema"] != ATTEMPT_STAGE_SCHEMA:
        _fail("attempt stage schema mismatch")
    _verify_record_hash(value, ATTEMPT_STAGE_SCHEMA, "stage_sha256", "attempt stage")
    if (
        value["attempt_id"] != attempt_id
        or value["sequence"] != sequence
        or value["kind"] != kind
        or value["previous_sha256"] != previous_sha256
    ):
        _fail("attempt stage chain mismatch")
    if type(value["payload"]) is not dict:
        _fail("attempt stage payload is not an object")
    _parse_utc(value["recorded_utc"], "stage.recorded_utc")


def _artifact_json_field(
    run_fd: int,
    attempt_relative: str,
    descriptor: Mapping[str, Any],
    field: str,
) -> str:
    item = _object(dict(descriptor), {"bytes", "path", "sha256"}, "values artifact")
    name = _text(item["path"], "values artifact path")
    if name in {".", ".."} or "/" in name or "\\" in name or not name.isascii():
        _fail("values artifact path is unsafe", code="BLOCKED_ENCODING_OR_REPLAY")
    held = _read_regular_at(
        run_fd,
        f"{attempt_relative}/piqd/{name}",
        maximum_bytes=64 * 1024 * 1024,
    )
    if held.raw_sha256 != _digest(item["sha256"], "values artifact sha256"):
        _fail("values artifact hash mismatch", code="BLOCKED_ENCODING_OR_REPLAY")
    if len(held.payload) != _exact_int(item["bytes"], "values artifact bytes"):
        _fail("values artifact byte count mismatch", code="BLOCKED_ENCODING_OR_REPLAY")
    value = _strict_json_bytes(held.payload, "values artifact")
    text = value.get(field)
    if type(text) is not str:
        _fail("values artifact field is not text", code="BLOCKED_ENCODING_OR_REPLAY")
    return text


def _validate_adapter_result(
    run_fd: int,
    attempt_relative: str,
    value: Mapping[str, Any],
    *,
    cell: Any,
    cell_bytes: bytes,
    backend: str,
    solver: str,
    timeout_ms: int,
    request_id: str,
) -> tuple[str, str | None]:
    if backend == "none":
        session_id = _validate_fixture_adapter_result_shape(value)
    else:
        output_fd = _open_directory_at(run_fd, f"{attempt_relative}/piqd")
        try:
            canonical = _validate_real_adapter_result(
                cell_bytes=cell_bytes,
                system_bytes=stored_json_bytes(cell.system.to_record()),
                solver=solver,
                timeout_ms=timeout_ms,
                request_id=request_id,
                adapter_result=value,
                output_fd=output_fd,
            )
        finally:
            os.close(output_fd)
        session_id = _adapter_session_id(canonical, allow_missing=False)
    classification = value.get("classification")
    if type(classification) is not str:
        _fail("adapter classification is missing")
    replay = value.get("cap_semantic_replay")
    values_descriptor = value.get("cap_values_artifact")
    values_field = value.get("cap_values_json_field")
    values_raw_sha256 = value.get("cap_values_raw_sha256")
    raw_sat = classification in {
        "SAT_SEMANTICALLY_REPLAYED",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
    }
    if raw_sat:
        if type(values_descriptor) is not dict or values_field != "values":
            _fail(
                "raw SAT result lacks retained values",
                code="BLOCKED_ENCODING_OR_REPLAY",
            )
        values = _artifact_json_field(
            run_fd, attempt_relative, values_descriptor, values_field
        )
        if raw_sha256(values.encode("utf-8")) != values_raw_sha256:
            _fail("raw SAT values hash mismatch", code="BLOCKED_ENCODING_OR_REPLAY")
        regenerated = replay_piqd_sat_values(cell.system, values).to_record()
        if replay != regenerated:
            _fail(
                "retained semantic replay differs from exact regeneration",
                code="BLOCKED_ENCODING_OR_REPLAY",
            )
        try:
            verify_replay_record(cell.system, replay, raw_values_payload=values)
        except Exception as exc:
            raise CapConfigurationCampaignError(
                "BLOCKED_ENCODING_OR_REPLAY", "retained semantic replay is invalid"
            ) from exc
        if regenerated["adapter_classification"] != classification:
            _fail(
                "adapter and replay classifications disagree",
                code="BLOCKED_ENCODING_OR_REPLAY",
            )
    elif any(
        item is not None
        for item in (replay, values_descriptor, values_field, values_raw_sha256)
    ):
        _fail(
            "non-SAT result carries SAT replay fields",
            code="BLOCKED_ENCODING_OR_REPLAY",
        )
    return classification, session_id


def _validate_outcome(
    value: Mapping[str, Any],
    *,
    admission: Mapping[str, Any],
    previous_sha256: str,
    adapter_result: Mapping[str, Any] | None,
) -> None:
    _object(
        value,
        {
            "adapter_classification",
            "adapter_result_raw_sha256",
            "attempt_id",
            "certificate_ref",
            "certificate_status",
            "failure",
            "kind",
            "outcome_sha256",
            "previous_sha256",
            "recorded_utc",
            "schema",
            "semantic_replay_sha256",
        },
        "attempt outcome",
    )
    if value["schema"] != ATTEMPT_OUTCOME_SCHEMA:
        _fail("attempt outcome schema mismatch")
    _verify_record_hash(
        value, ATTEMPT_OUTCOME_SCHEMA, "outcome_sha256", "attempt outcome"
    )
    if (
        value["attempt_id"] != admission["attempt_id"]
        or value["previous_sha256"] != previous_sha256
    ):
        _fail("attempt outcome chain mismatch")
    _parse_utc(value["recorded_utc"], "outcome.recorded_utc")
    if (
        adapter_result is not None
        and value["adapter_classification"] != adapter_result["classification"]
    ):
        _fail("attempt outcome classification mismatch")
    if adapter_result is None and value["adapter_classification"] is not None:
        _fail("failure outcome invents an adapter classification")


def _validate_cell_result(
    value: Mapping[str, Any],
    *,
    plan: Mapping[str, Any],
    cell: Any,
    admission: Mapping[str, Any],
    outcome: Mapping[str, Any],
) -> None:
    _object(
        value,
        {
            "adapter_classification",
            "campaign_id",
            "cell_id",
            "cell_result_sha256",
            "cell_sha256",
            "certificate_ref",
            "certificate_status",
            "claim_flags",
            "manifest_sha256",
            "schema",
            "selection",
        },
        "cell result",
    )
    if value["schema"] != CELL_RESULT_SCHEMA:
        _fail("cell result schema mismatch")
    _verify_record_hash(value, CELL_RESULT_SCHEMA, "cell_result_sha256", "cell result")
    if (
        value["campaign_id"] != plan["campaign_id"]
        or value["manifest_sha256"] != plan["manifest_sha256"]
        or value["cell_id"] != cell.cell_id
        or value["cell_sha256"] != cell.cell_sha256
        or value["adapter_classification"] != outcome["adapter_classification"]
        or value["certificate_ref"] != outcome["certificate_ref"]
        or value["certificate_status"] != outcome["certificate_status"]
        or value["claim_flags"] != FALSE_CLAIMS
    ):
        _fail("cell result crossed identity")
    selection = _object(
        value["selection"],
        {
            "admission_policy",
            "admission_sha256",
            "kind",
            "outcome_sha256",
            "reason",
            "selected_attempt_id",
        },
        "cell result selection",
    )
    if (
        selection["admission_policy"] != "cap-configuration-fixture-result-admission/v1"
        or selection["reason"] != "only_eligible_terminal_attempt"
        or selection["kind"] != "single_attempt"
        or selection["selected_attempt_id"] != admission["attempt_id"]
        or selection["admission_sha256"] != admission["admission_sha256"]
        or selection["outcome_sha256"] != outcome["outcome_sha256"]
    ):
        _fail("cell result selection mismatch")


def _attempt_directory_inventory(
    run_fd: int, expected_cells: Sequence[str]
) -> tuple[str, ...]:
    names = _list_directory(run_fd, "events/attempts")
    return tuple(name for name in names if name not in expected_cells)


def _descriptor_artifact_names(value: object) -> set[str]:
    names: set[str] = set()
    if type(value) is dict:
        if set(value) == {"bytes", "path", "sha256"}:
            path = value["path"]
            if (
                type(path) is str
                and path not in {"", ".", ".."}
                and "/" not in path
                and "\\" not in path
            ):
                names.add(path)
        for item in value.values():
            names.update(_descriptor_artifact_names(item))
    elif type(value) is list:
        for item in value:
            names.update(_descriptor_artifact_names(item))
    return names


def _validate_descriptor_artifacts(
    run_fd: int, attempt_relative: str, value: object
) -> set[str]:
    names = _descriptor_artifact_names(value)
    descriptors: list[Mapping[str, Any]] = []

    def collect(item: object) -> None:
        if type(item) is dict:
            if set(item) == {"bytes", "path", "sha256"}:
                descriptors.append(item)
            for child in item.values():
                collect(child)
        elif type(item) is list:
            for child in item:
                collect(child)

    collect(value)
    for descriptor in descriptors:
        name = descriptor["path"]
        if name not in names:
            _fail("adapter artifact descriptor has an unsafe path")
        held = _read_regular_at(
            run_fd,
            f"{attempt_relative}/piqd/{name}",
            maximum_bytes=64 * 1024 * 1024,
        )
        if held.raw_sha256 != _digest(
            descriptor["sha256"], "adapter artifact sha256"
        ) or len(held.payload) != _exact_int(
            descriptor["bytes"], "adapter artifact bytes"
        ):
            _fail(f"adapter artifact descriptor mismatch: {name}")
    return names


def _coverage_paths(run_fd: int) -> tuple[str, ...]:
    names = _list_directory(run_fd, "artifacts/coverage")
    if any(re.fullmatch(r"[0-9]{6}\.json", name) is None for name in names):
        _fail("coverage directory contains an unexpected member")
    expected = tuple(f"{index:06d}.json" for index in range(len(names)))
    if names != expected:
        _fail("coverage sequence has a gap")
    return tuple(f"artifacts/coverage/{name}" for name in names)


def _validate_coverage_record(
    value: Mapping[str, Any], plan: Mapping[str, Any]
) -> None:
    _object(
        dict(value),
        {
            "campaign_id",
            "claim_flags",
            "classification_counts",
            "conflicting_decisive",
            "coverage_sha256",
            "coverage_status",
            "diagnostic_coverage",
            "duplicate_cells",
            "failed_cells",
            "identity_mismatches",
            "manifest_sha256",
            "missing_cells",
            "nonterminal_attempts",
            "ordered_attempt_ids",
            "ordered_selected_results",
            "orphan_attempts",
            "promotion_verifier_record",
            "schema",
            "stale_attempts",
            "target_termination",
            "universe",
        },
        "coverage",
    )
    if value.get("schema") != COVERAGE_SCHEMA:
        _fail("coverage schema mismatch")
    _verify_record_hash(value, COVERAGE_SCHEMA, "coverage_sha256", "coverage")
    if (
        value.get("campaign_id") != plan["campaign_id"]
        or value.get("manifest_sha256") != plan["manifest_sha256"]
    ):
        _fail("coverage crossed campaign identity")
    if value.get("claim_flags") != FALSE_CLAIMS:
        _fail("coverage invents a claim")


def _validate_recaptures(
    run_fd: int,
    plan: Mapping[str, Any],
    snapshots: Mapping[str, Any],
    coverage_hashes: set[str],
) -> set[str]:
    names = _list_directory(run_fd, "artifacts/recapture")
    recaptured: set[str] = set()
    for name in names:
        if re.fullmatch(r"[0-9a-f]{64}\.json", name) is None:
            _fail("recapture directory contains an unexpected member")
        value, _ = _read_cap_json(run_fd, f"artifacts/recapture/{name}")
        _object(
            value,
            {
                "campaign_id",
                "coverage_sha256",
                "final_recapture_sha256",
                "recorded_utc",
                "schema",
                "snapshot_digests",
            },
            "final recapture",
        )
        if value["schema"] != FINAL_RECAPTURE_SCHEMA:
            _fail("final recapture schema mismatch")
        _verify_record_hash(
            value, FINAL_RECAPTURE_SCHEMA, "final_recapture_sha256", "final recapture"
        )
        if (
            value["campaign_id"] != plan["campaign_id"]
            or value["coverage_sha256"] not in coverage_hashes
        ):
            _fail("final recapture crossed campaign identity")
        if name != f"{value['coverage_sha256']}.json":
            _fail("final recapture filename mismatch")
        expected = {
            logical: held.raw_sha256 for logical, held in sorted(snapshots.items())
        }
        if value["snapshot_digests"] != expected:
            _fail("final recapture snapshot digest mismatch")
        _parse_utc(value["recorded_utc"], "final_recapture.recorded_utc")
        recaptured.add(value["coverage_sha256"])
    return recaptured


def validate_campaign(
    manifest_path: str | os.PathLike[str],
    run_root: str | os.PathLike[str],
    *,
    repo_root: str | os.PathLike[str] = ".",
    allow_incomplete: bool = True,
    observed_now_utc: str | None = None,
) -> ValidationReport:
    """Reconstruct one retained prefix without network or solver access."""

    del observed_now_utc  # current expiry is a run-admission gate, not a replay gate
    repository = Path(repo_root).resolve(strict=True)
    repo_fd = _open_repo(repository)
    run_fd = -1
    try:
        run_fd, root_relative, lane_id, run_id = _open_run(repo_fd, run_root)
        top_level = _list_directory(run_fd, ".")
        if set(top_level) != {"run_manifest.json", *OUTPUT_CLASSES}:
            _fail("run root has an unexpected top-level member")
        plan, _plan_held = _load_plan(run_fd)
        if plan["schema"] != PLAN_SCHEMA or plan["run_root"] != root_relative:
            _fail("plan identity mismatch")
        _validate_run_manifest(
            repo_fd,
            run_fd,
            run_root=root_relative,
            lane_id=lane_id,
            run_id=run_id,
            plan=plan,
        )
        snapshots = _verify_snapshots(run_fd, plan)
        expected_snapshot_files = {
            entry["retained_path"] for entry in plan["snapshot_files"]
        }
        observed_snapshot_files = set(_walk_files(run_fd, "artifacts/snapshots"))
        if observed_snapshot_files != expected_snapshot_files:
            _fail("retained snapshot tree differs from the complete plan inventory")
        manifest, universe = _snapshot_universe(plan, snapshots)
        backend = manifest["identity"]["solver"]["backend"]
        _verify_caller_matches_snapshot(
            repo_fd, manifest_path, plan["manifest_raw_sha256"], "manifest"
        )
        authorization = parse_stored_json_bytes(snapshots["authorization.json"].payload)
        validate_wave_authorization(
            authorization,
            manifest=manifest,
            run_root=root_relative,
            now_utc=plan["created_utc"],
        )

        orphan_attempts = list(
            _attempt_directory_inventory(
                run_fd, tuple(cell.cell_id for cell in universe.cells)
            )
        )
        allowed_artifact_members = {
            "coverage",
            "plan.json",
            "recapture",
            "results",
            "snapshots",
        }
        allowed_event_members = {
            "attempts",
            "authorization-consumption.json",
            "resource-attestation.json",
        }
        orphan_attempts += tuple(
            f"artifacts/{name}"
            for name in _list_directory(run_fd, "artifacts")
            if name not in allowed_artifact_members
        )
        orphan_attempts += tuple(
            f"events/{name}"
            for name in _list_directory(run_fd, "events")
            if name not in allowed_event_members
        )
        orphan_attempts += tuple(
            f"tmp/{name}" for name in _list_directory(run_fd, "tmp")
        )
        observations: list[str] = []
        resume_safe = not orphan_attempts
        admissions: list[dict[str, Any]] = []
        results: list[dict[str, Any]] = []
        validated_cell_ids: list[str] = []
        nonterminal: list[str] = []
        adapter_session_ids: set[str] = set()
        retained_prefix_open = True

        for cell in universe.cells:
            cell_attempt_root = f"events/attempts/{cell.cell_id}"
            attempt_names = _list_directory(run_fd, cell_attempt_root)
            if not attempt_names:
                retained_prefix_open = False
                continue
            if not retained_prefix_open:
                orphan_attempts.append(f"{cell.cell_id}/000000")
                resume_safe = False
            if attempt_names != ("000000",):
                orphan_attempts += tuple(
                    f"{cell.cell_id}/{name}"
                    for name in attempt_names
                    if name != "000000"
                )
                resume_safe = False
            attempt_relative = _attempt_relative(cell.cell_id)
            attempt_members = _list_directory(run_fd, attempt_relative)
            allowed_attempt_members = {
                "adapter-result.json",
                "admission.json",
                "outcome.json",
                "piqd",
                "stages",
            }
            orphan_attempts += tuple(
                f"{cell.cell_id}/000000/{name}"
                for name in attempt_members
                if name not in allowed_attempt_members
            )
            stage_names = _list_directory(run_fd, f"{attempt_relative}/stages")
            allowed_stage_names = {
                "000000-resource-attestation.json",
                "000001-request-intent.json",
                "000002-adapter-completed.json",
                "000002-adapter-failure.json",
            }
            orphan_attempts += tuple(
                f"{cell.cell_id}/000000/stages/{name}"
                for name in stage_names
                if name not in allowed_stage_names
            )
            admission_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/admission.json"
            )
            if admission_loaded is None:
                _fail(f"attempt directory lacks admission: {cell.cell_id}")
            admission = admission_loaded[0]
            _validate_admission(admission, plan, cell)
            admissions.append(admission)

            stage0_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/stages/000000-resource-attestation.json"
            )
            if stage0_loaded is None:
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                continue
            stage0 = stage0_loaded[0]
            _validate_stage(
                stage0,
                attempt_id=admission["attempt_id"],
                sequence=0,
                kind="resource_attestation",
                previous_sha256=admission["admission_sha256"],
            )

            stage1_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/stages/000001-request-intent.json"
            )
            if stage1_loaded is None:
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                continue
            stage1 = stage1_loaded[0]
            _validate_stage(
                stage1,
                attempt_id=admission["attempt_id"],
                sequence=1,
                kind="request_intent",
                previous_sha256=stage0["stage_sha256"],
            )
            if stage1["payload"] != {
                "request_id": _request_id(admission["attempt_id"])
            }:
                _fail("request intent identity mismatch")
            cell_bytes = snapshots[
                f"cells/{cell.ordinal:04d}-{cell.cell_id}.json"
            ].payload
            timeout_ms = max(1, plan["resource_envelope"]["wall_seconds"] * 1000)

            completed_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/stages/000002-adapter-completed.json"
            )
            failed_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/stages/000002-adapter-failure.json"
            )
            if completed_loaded is not None and failed_loaded is not None:
                _fail("attempt has both completed and failed adapter stages")
            adapter_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/adapter-result.json"
            )
            adapter_result: dict[str, Any] | None = None
            adapter_raw_sha256: str | None = None
            if completed_loaded is not None:
                if adapter_loaded is None:
                    _fail("completed adapter stage lacks retained result")
                adapter_result, adapter_held = adapter_loaded
                adapter_raw_sha256 = adapter_held.raw_sha256
                classification, session_id = _validate_adapter_result(
                    run_fd,
                    attempt_relative,
                    adapter_result,
                    cell=cell,
                    cell_bytes=cell_bytes,
                    backend=backend,
                    solver=plan["piqd"]["solver"],
                    timeout_ms=timeout_ms,
                    request_id=stage1["payload"]["request_id"],
                )
                if session_id is not None:
                    if session_id in adapter_session_ids:
                        _fail("retained adapter results reuse a session_id")
                    adapter_session_ids.add(session_id)
                referenced_piqd = _validate_descriptor_artifacts(
                    run_fd, attempt_relative, adapter_result
                )
                observed_piqd = set(_list_directory(run_fd, f"{attempt_relative}/piqd"))
                orphan_attempts += tuple(
                    f"{cell.cell_id}/000000/piqd/{name}"
                    for name in sorted(observed_piqd - referenced_piqd)
                )
                stage2 = completed_loaded[0]
                _validate_stage(
                    stage2,
                    attempt_id=admission["attempt_id"],
                    sequence=2,
                    kind="adapter_completed",
                    previous_sha256=stage1["stage_sha256"],
                )
                if stage2["payload"] != {
                    "adapter_result_raw_sha256": adapter_raw_sha256,
                    "classification": classification,
                }:
                    _fail("adapter-completed stage payload mismatch")
            elif failed_loaded is not None:
                stage2 = failed_loaded[0]
                _validate_stage(
                    stage2,
                    attempt_id=admission["attempt_id"],
                    sequence=2,
                    kind="adapter_failure",
                    previous_sha256=stage1["stage_sha256"],
                )
                if adapter_loaded is not None:
                    _fail("failed adapter stage has a retained adapter result")
            elif adapter_loaded is not None:
                adapter_result, _adapter_held = adapter_loaded
                _classification, session_id = _validate_adapter_result(
                    run_fd,
                    attempt_relative,
                    adapter_result,
                    cell=cell,
                    cell_bytes=cell_bytes,
                    backend=backend,
                    solver=plan["piqd"]["solver"],
                    timeout_ms=timeout_ms,
                    request_id=stage1["payload"]["request_id"],
                )
                if session_id is not None:
                    if session_id in adapter_session_ids:
                        _fail("retained adapter results reuse a session_id")
                    adapter_session_ids.add(session_id)
                referenced_piqd = _validate_descriptor_artifacts(
                    run_fd, attempt_relative, adapter_result
                )
                observed_piqd = set(_list_directory(run_fd, f"{attempt_relative}/piqd"))
                orphan_attempts += tuple(
                    f"{cell.cell_id}/000000/piqd/{name}"
                    for name in sorted(observed_piqd - referenced_piqd)
                )
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                observations.append(
                    f"retained adapter result awaits stage projection: {cell.cell_id}"
                )
                continue
            else:
                solver = plan["piqd"]["solver"]
                allowed_prefix_files = {
                    f"{solver}.closed-session.json",
                    f"{solver}.expected-post-append.smt2",
                    f"{solver}.journal-frontiers.json",
                    f"{solver}.pre-append.smt2",
                    f"{solver}.receipts-before.json",
                    f"{solver}.receipts.json",
                    f"{solver}.reconciled-solve.json",
                    f"{solver}.reconciliation-session.json",
                    f"{solver}.semantic.json",
                    f"{solver}.session-create-request.json",
                    f"{solver}.session-lifecycle.json",
                    f"{solver}.session.json",
                    f"{solver}.solve-request.json",
                    f"{solver}.solve.json",
                    f"{solver}.smt2",
                }
                observed_piqd = set(_list_directory(run_fd, f"{attempt_relative}/piqd"))
                orphan_attempts += tuple(
                    f"{cell.cell_id}/000000/piqd/{name}"
                    for name in sorted(observed_piqd - allowed_prefix_files)
                )
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                observations.append(
                    "authenticated request intent awaits adapter reconciliation: "
                    f"{cell.cell_id}"
                )
                continue

            outcome_loaded = _load_if_present(
                run_fd, f"{attempt_relative}/outcome.json"
            )
            if outcome_loaded is None:
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                continue
            outcome = outcome_loaded[0]
            _validate_outcome(
                outcome,
                admission=admission,
                previous_sha256=stage2["stage_sha256"],
                adapter_result=adapter_result,
            )
            if (
                adapter_result is not None
                and outcome["adapter_result_raw_sha256"] != adapter_raw_sha256
            ):
                _fail("outcome adapter-result hash mismatch")

            result_path = (
                f"artifacts/results/{cell.cell_id}/{admission['attempt_id']}.json"
            )
            result_loaded = _load_if_present(run_fd, result_path)
            if result_loaded is None:
                nonterminal.append(cell.cell_id)
                retained_prefix_open = False
                observations.append(
                    f"terminal outcome lacks cell-result projection: {cell.cell_id}"
                )
                continue
            result = result_loaded[0]
            _validate_cell_result(
                result,
                plan=plan,
                cell=cell,
                admission=admission,
                outcome=outcome,
            )
            results.append(result)
            validated_cell_ids.append(cell.cell_id)

        expected_result_cells = {cell.cell_id for cell in universe.cells}
        observed_result_cells = set(_list_directory(run_fd, "artifacts/results"))
        orphan_attempts += tuple(
            f"artifacts/results/{name}"
            for name in sorted(observed_result_cells - expected_result_cells)
        )
        admission_by_cell = {
            admission["identity"]["cell_id"]: admission for admission in admissions
        }
        for cell in universe.cells:
            observed_names = set(
                _list_directory(run_fd, f"artifacts/results/{cell.cell_id}")
            )
            admission = admission_by_cell.get(cell.cell_id)
            expected_names = (
                set() if admission is None else {f"{admission['attempt_id']}.json"}
            )
            orphan_attempts += tuple(
                f"artifacts/results/{cell.cell_id}/{name}"
                for name in sorted(observed_names - expected_names)
            )

        first_attempt = (
            admissions[0]["attempt_id"]
            if admissions
            and admissions[0]["identity"]["cell_id"] == universe.cells[0].cell_id
            else None
        )
        consumption = _validate_consumption(run_fd, plan, first_attempt)
        attestation = _validate_attestation(
            run_fd, plan, attempts_exist=bool(admissions)
        )
        if admissions and (consumption is None or attestation is None):
            _fail("attempt prefix lacks run-admission gates")
        if attestation is not None:
            for cell in universe.cells:
                stage0_loaded = _load_if_present(
                    run_fd,
                    f"{_attempt_relative(cell.cell_id)}/stages/000000-resource-attestation.json",
                )
                if stage0_loaded is not None and stage0_loaded[0]["payload"] != {
                    "resource_attestation_sha256": attestation[
                        "resource_attestation_sha256"
                    ]
                }:
                    _fail("attempt stage names another resource attestation")

        reconstructed = _coverage(plan, universe, results, attempts=admissions)
        if nonterminal:
            reconstructed["nonterminal_attempts"] = list(nonterminal)
            reconstructed["coverage_status"] = "INCOMPLETE"
            reconstructed["diagnostic_coverage"] = False
            body = {
                key: value
                for key, value in reconstructed.items()
                if key != "coverage_sha256"
            }
            reconstructed["coverage_sha256"] = structured_hash(COVERAGE_SCHEMA, body)
        if orphan_attempts:
            reconstructed["orphan_attempts"] = list(orphan_attempts)
            reconstructed["coverage_status"] = "INCOMPLETE"
            reconstructed["diagnostic_coverage"] = False
            body = {
                key: value
                for key, value in reconstructed.items()
                if key != "coverage_sha256"
            }
            reconstructed["coverage_sha256"] = structured_hash(COVERAGE_SCHEMA, body)
            resume_safe = False

        retained_coverage_sha256: str | None = None
        coverage_hashes: set[str] = set()
        for path in _coverage_paths(run_fd):
            value, _ = _read_cap_json(run_fd, path)
            _validate_coverage_record(value, plan)
            coverage_hashes.add(value["coverage_sha256"])
            retained_coverage_sha256 = value["coverage_sha256"]
        if retained_coverage_sha256 != reconstructed["coverage_sha256"]:
            observations.append(
                "latest retained coverage differs from reconstructed prefix"
            )
        recaptured = _validate_recaptures(run_fd, plan, snapshots, coverage_hashes)
        if (
            retained_coverage_sha256 is not None
            and retained_coverage_sha256 not in recaptured
        ):
            observations.append("latest retained coverage lacks final recapture")

        missing = tuple(
            cell.cell_id
            for cell in universe.cells
            if cell.cell_id not in validated_cell_ids
        )
        if reconstructed["coverage_status"] == "INCOMPLETE" and not allow_incomplete:
            _fail("retained campaign coverage is incomplete", code="BLOCKED_COVERAGE")
        counts = Counter(
            result["adapter_classification"]
            for result in results
            if result["adapter_classification"] is not None
        )
        return ValidationReport(
            campaign_id=plan["campaign_id"],
            manifest_sha256=plan["manifest_sha256"],
            run_root=root_relative,
            coverage_status=reconstructed["coverage_status"],
            diagnostic_coverage=reconstructed["diagnostic_coverage"],
            classification_counts=dict(sorted(counts.items())),
            validated_cell_ids=tuple(validated_cell_ids),
            missing_cell_ids=missing,
            nonterminal_cell_ids=tuple(nonterminal),
            orphan_attempts=tuple(orphan_attempts),
            retained_coverage_sha256=retained_coverage_sha256,
            reconstructed_coverage_sha256=reconstructed["coverage_sha256"],
            resume_safe=resume_safe,
            observations=tuple(observations),
        )
    finally:
        if run_fd >= 0:
            os.close(run_fd)
        os.close(repo_fd)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="python -m census.cap_configuration.validate",
        description="Offline validation of a retained cap-configuration prefix.",
    )
    parser.add_argument("manifest")
    parser.add_argument("run_root")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    arguments = _parser().parse_args(argv)
    try:
        report = validate_campaign(arguments.manifest, arguments.run_root)
        print(stored_json_bytes(report.to_record()).decode("utf-8"), end="")
        print("CAP_CONFIG_VALIDATION=PASSED")
        return 0
    except CapConfigurationCampaignError as exc:
        print(str(exc), file=sys.stderr)
        return 22


if __name__ == "__main__":
    raise SystemExit(main())
