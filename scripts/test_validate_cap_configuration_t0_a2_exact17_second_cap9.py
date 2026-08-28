from __future__ import annotations

import copy
import sys
from pathlib import Path

import pytest

from census.cap_configuration.schema import raw_sha256, structured_hash
from scripts.validate_cap_configuration_t0_a2_exact17_second_cap9 import (
    ACCEPTANCE_PATH,
    EXPECTED_ACCEPTED_UTC,
    EXPECTED_DECISION_MAIN_HEAD,
    EXPECTED_REQUEST_MAIN_HEAD,
    POST_REQUEST_DEPENDENCY_PATH,
    PREFLIGHT_PATH,
    REQUEST_PATH,
    REVIEW_PATH,
    SOURCE_PATH,
    TARGET_PATH,
    TARGET_SOURCE_PATH,
    PacketValidationError,
    _artifact_bindings,
    _parse_args,
    _verify_acceptance,
    _verify_acceptance_request,
    _verify_preflight,
    _verify_review,
    _verify_source_identity,
    _verify_target,
    load_canonical,
    validate_packet,
    verify_structured_record,
)

REPO_ROOT = Path(__file__).resolve().parents[1]


def _rehash(value: dict, field: str, domain: str) -> None:
    body = dict(value)
    del body[field]
    value[field] = structured_hash(domain, body)


def _target_inputs() -> tuple[dict, dict, dict]:
    return (
        load_canonical(REPO_ROOT / SOURCE_PATH),
        load_canonical(REPO_ROOT / PREFLIGHT_PATH),
        load_canonical(REPO_ROOT / TARGET_PATH),
    )


def test_checked_in_target_packet_valid_before_review() -> None:
    result = validate_packet(REPO_ROOT, require_review=False)
    assert result["target_sha256"] == (
        "5b29d98980d7bf163f0d17dee459a644175545a7fcca71464a8db4189bb77c9a"
    )
    assert result["warnings"] in (
        [],
        [
            (
                "external source not materialized locally: "
                "formal_conjectures@89a67be506fbae633d02941ccbd9f3737bbd5457/"
                "FormalConjectures/ErdosProblems/97.lean"
            )
        ],
    )


@pytest.mark.parametrize(
    ("relative", "field", "domain"),
    [
        (SOURCE_PATH, "source_identity_sha256", "cap-configuration-t0-source-identity/v1"),
        (PREFLIGHT_PATH, "preflight_sha256", "cap-configuration-t0-preflight/v1"),
        (TARGET_PATH, "target_sha256", "cap-configuration-t0-target/v1"),
    ],
)
def test_structured_hash_rejects_mutation(
    relative: Path, field: str, domain: str
) -> None:
    value = copy.deepcopy(load_canonical(REPO_ROOT / relative))
    value["status"] = "MUTATED"
    with pytest.raises(PacketValidationError, match="mismatch"):
        verify_structured_record(value, field=field, domain=domain, label="mutation")


def test_noncanonical_storage_rejected(tmp_path: Path) -> None:
    path = tmp_path / "alternate.json"
    path.write_bytes(b'{"b": 1, "a": 2}\n')
    with pytest.raises(PacketValidationError, match="not canonical"):
        load_canonical(path)


def test_cli_rejects_target_only_with_acceptance(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        sys,
        "argv",
        ["validator", "--target-only", "--acceptance", "alternate.json"],
    )
    with pytest.raises(SystemExit) as exc_info:
        _parse_args()
    assert exc_info.value.code == 2


def test_rehashed_source_with_empty_file_manifest_is_rejected() -> None:
    source = copy.deepcopy(load_canonical(REPO_ROOT / SOURCE_PATH))
    source["files"] = []
    _rehash(source, "source_identity_sha256", "cap-configuration-t0-source-identity/v1")
    with pytest.raises(PacketValidationError, match="non-empty array"):
        _verify_source_identity(
            REPO_ROOT,
            source,
            formal_conjectures_root=None,
            require_external_sources=False,
        )


def test_rehashed_source_cannot_rekey_external_revision() -> None:
    source = copy.deepcopy(load_canonical(REPO_ROOT / SOURCE_PATH))
    external = next(item for item in source["files"] if item["role"] == "IMPORTED_PROBLEM_SOURCE")
    external["path"] = external["path"].replace(
        source["build_identity"]["formal_conjectures_revision"], "0" * 40
    )
    _rehash(source, "source_identity_sha256", "cap-configuration-t0-source-identity/v1")
    with pytest.raises(PacketValidationError, match="path/revision mismatch"):
        _verify_source_identity(
            REPO_ROOT,
            source,
            formal_conjectures_root=None,
            require_external_sources=False,
        )


def test_rehashed_source_external_path_cannot_escape_materialized_root() -> None:
    source = copy.deepcopy(load_canonical(REPO_ROOT / SOURCE_PATH))
    external = next(item for item in source["files"] if item["role"] == "IMPORTED_PROBLEM_SOURCE")
    revision = source["build_identity"]["formal_conjectures_revision"]
    external["path"] = f"formal_conjectures@{revision}//etc/hosts"
    _rehash(source, "source_identity_sha256", "cap-configuration-t0-source-identity/v1")
    with pytest.raises(PacketValidationError, match="path/revision mismatch"):
        _verify_source_identity(
            REPO_ROOT,
            source,
            formal_conjectures_root=Path("/"),
            require_external_sources=True,
        )


def test_rehashed_preflight_with_wrong_base_is_rejected() -> None:
    source, preflight, _ = _target_inputs()
    preflight = copy.deepcopy(preflight)
    preflight["applicability"]["accepted_base_head"] = "0" * 40
    _rehash(preflight, "preflight_sha256", "cap-configuration-t0-preflight/v1")
    with pytest.raises(PacketValidationError, match="accepted_base_head"):
        _verify_preflight(preflight, source)


def test_rehashed_preflight_rejects_impossible_utc_timestamp() -> None:
    source, preflight, _ = _target_inputs()
    preflight = copy.deepcopy(preflight)
    preflight["recorded_utc"] = "2026-02-31T99:99:99Z"
    _rehash(preflight, "preflight_sha256", "cap-configuration-t0-preflight/v1")
    with pytest.raises(PacketValidationError, match="invalid UTC timestamp"):
        _verify_preflight(preflight, source)


def test_rehashed_target_without_source_problem_is_rejected() -> None:
    source, preflight, target = _target_inputs()
    target = copy.deepcopy(target)
    del target["source_problem"]
    _rehash(target, "target_sha256", "cap-configuration-t0-target/v1")
    with pytest.raises(PacketValidationError, match="keys mismatch"):
        _verify_target(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            target,
        )


def test_rehashed_target_with_empty_claim_flags_is_rejected() -> None:
    source, preflight, target = _target_inputs()
    target = copy.deepcopy(target)
    target["claim_flags"] = {}
    _rehash(target, "target_sha256", "cap-configuration-t0-target/v1")
    with pytest.raises(PacketValidationError, match="claim_flags.*keys mismatch"):
        _verify_target(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            target,
        )


def test_rehashed_target_with_partial_authorization_is_rejected() -> None:
    source, preflight, target = _target_inputs()
    target = copy.deepcopy(target)
    del target["active_plan_authorization"]["solver_campaign_authorized"]
    _rehash(target, "target_sha256", "cap-configuration-t0-target/v1")
    with pytest.raises(PacketValidationError, match="active_plan_authorization.*keys mismatch"):
        _verify_target(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            target,
        )


def test_rehashed_target_with_independent_base_head_is_rejected() -> None:
    source, preflight, target = _target_inputs()
    target = copy.deepcopy(target)
    target["identity"]["repository_base_head"] = "0" * 40
    _rehash(target, "target_sha256", "cap-configuration-t0-target/v1")
    with pytest.raises(PacketValidationError, match="repository_base_head mismatch"):
        _verify_target(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            target,
        )


def test_rehashed_preflight_cannot_claim_acceptance() -> None:
    source, preflight, _ = _target_inputs()
    preflight = copy.deepcopy(preflight)
    preflight["status"] = "ACCEPTED"
    _rehash(preflight, "preflight_sha256", "cap-configuration-t0-preflight/v1")
    with pytest.raises(PacketValidationError, match="status must remain draft"):
        _verify_preflight(preflight, source)


def test_rehashed_preflight_cannot_replace_search_objects() -> None:
    source, preflight, _ = _target_inputs()
    preflight = copy.deepcopy(preflight)
    preflight["searches"] = [{"arbitrary": True}]
    _rehash(preflight, "preflight_sha256", "cap-configuration-t0-preflight/v1")
    with pytest.raises(PacketValidationError, match="searches.*keys mismatch"):
        _verify_preflight(preflight, source)


def test_rehashed_source_cannot_change_candidate_branch() -> None:
    source = copy.deepcopy(load_canonical(REPO_ROOT / SOURCE_PATH))
    source["repository"]["candidate_branch"] = "mutated"
    _rehash(source, "source_identity_sha256", "cap-configuration-t0-source-identity/v1")
    with pytest.raises(PacketValidationError, match="candidate branch"):
        _verify_source_identity(
            REPO_ROOT,
            source,
            formal_conjectures_root=None,
            require_external_sources=False,
        )


def test_rehashed_source_cannot_change_toolchain_content() -> None:
    source = copy.deepcopy(load_canonical(REPO_ROOT / SOURCE_PATH))
    source["build_identity"]["lean_toolchain"]["content"] = "leanprover/lean4:mutated"
    _rehash(source, "source_identity_sha256", "cap-configuration-t0-source-identity/v1")
    with pytest.raises(PacketValidationError, match="lean_toolchain.content"):
        _verify_source_identity(
            REPO_ROOT,
            source,
            formal_conjectures_root=None,
            require_external_sources=False,
        )


@pytest.mark.parametrize(
    ("field", "value", "match"),
    [
        ("base_head", "0" * 40, "elaboration base_head"),
        ("result", "UNKNOWN", "elaboration result"),
        ("source_changes", True, "must not change source"),
    ],
)
def test_rehashed_target_cannot_change_elaboration_evidence(
    field: str, value: object, match: str
) -> None:
    source, preflight, target = _target_inputs()
    target = copy.deepcopy(target)
    target["elaborated_proposition"]["elaboration_check"][field] = value
    _rehash(target, "target_sha256", "cap-configuration-t0-target/v1")
    with pytest.raises(PacketValidationError, match=match):
        _verify_target(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            target,
        )


def _review_inputs() -> tuple[dict, dict, dict, dict]:
    source, preflight, target = _target_inputs()
    review = load_canonical(REPO_ROOT / REVIEW_PATH)
    return source, preflight, target, review


def test_rehashed_review_cannot_replace_fixed_checks() -> None:
    source, preflight, target, review = _review_inputs()
    review = copy.deepcopy(review)
    review["checks"] = {"arbitrary": True}
    _rehash(review, "review_sha256", "cap-configuration-t0-review/v1")
    with pytest.raises(PacketValidationError, match="review.checks.*keys mismatch"):
        _verify_review(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            review,
        )


def test_rehashed_review_requires_distinct_reviewer_identities() -> None:
    source, preflight, target, review = _review_inputs()
    review = copy.deepcopy(review)
    review["reviewers"][1]["reviewer_identity"] = review["reviewers"][0]["reviewer_identity"]
    _rehash(review, "review_sha256", "cap-configuration-t0-review/v1")
    with pytest.raises(PacketValidationError, match="identities must be distinct"):
        _verify_review(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            review,
        )


def test_rehashed_review_rejects_impossible_utc_timestamp() -> None:
    source, preflight, target, review = _review_inputs()
    review = copy.deepcopy(review)
    review["reviewed_utc"] = "2026-02-31T99:99:99Z"
    _rehash(review, "review_sha256", "cap-configuration-t0-review/v1")
    with pytest.raises(PacketValidationError, match="invalid UTC timestamp"):
        _verify_review(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            review,
        )


def _request_inputs() -> tuple[dict, dict, dict, dict, dict]:
    source, preflight, target, review = _review_inputs()
    request = load_canonical(REPO_ROOT / REQUEST_PATH)
    return source, preflight, target, review, request


def _verify_checked_in_request(
    source: dict,
    preflight: dict,
    target: dict,
    review: dict,
    request: dict,
    *,
    require_observed_branch_head: bool = False,
) -> None:
    expected_artifacts = _artifact_bindings(
        REPO_ROOT / SOURCE_PATH,
        source,
        REPO_ROOT / PREFLIGHT_PATH,
        preflight,
        REPO_ROOT / TARGET_PATH,
        target,
        REPO_ROOT / REVIEW_PATH,
        review,
    )
    _verify_acceptance_request(
        REPO_ROOT,
        source,
        review,
        expected_artifacts,
        request,
        require_observed_branch_head=require_observed_branch_head,
    )


def test_checked_in_acceptance_request_is_valid_at_its_frozen_head() -> None:
    source, preflight, target, review, request = _request_inputs()
    _verify_checked_in_request(source, preflight, target, review, request)


def test_checked_in_pending_request_rejects_current_main_drift() -> None:
    source, preflight, target, review, request = _request_inputs()
    with pytest.raises(PacketValidationError, match="observed branch ref"):
        _verify_checked_in_request(
            source,
            preflight,
            target,
            review,
            request,
            require_observed_branch_head=True,
        )


def test_rehashed_request_cannot_authorize_phase1() -> None:
    source, preflight, target, review, request = _request_inputs()
    request = copy.deepcopy(request)
    request["authorization"]["phase1_authorized"] = True
    _rehash(request, "request_sha256", "cap-configuration-t0-acceptance-request/v1")
    with pytest.raises(PacketValidationError, match="authorization must remain entirely false"):
        _verify_checked_in_request(source, preflight, target, review, request)


def test_rehashed_request_cannot_replace_reviewed_main_head() -> None:
    source, preflight, target, review, request = _request_inputs()
    request = copy.deepcopy(request)
    request["source_drift_attestation"]["checked_head"] = request[
        "source_drift_attestation"
    ]["base_head"]
    _rehash(request, "request_sha256", "cap-configuration-t0-acceptance-request/v1")
    with pytest.raises(PacketValidationError, match="unexpected checked_head"):
        _verify_checked_in_request(source, preflight, target, review, request)


def _acceptance_record(target: dict, review: dict, request: dict) -> dict:
    value = {
        "acceptance_scope": {
            "accepted_source_head": EXPECTED_REQUEST_MAIN_HEAD,
            "current_main_governed": False,
            "mode": "FROZEN_REQUEST_SNAPSHOT_ONLY",
            "post_request_implementation_authorized": False,
            "retroactive_authorization": False,
        },
        "acceptance_sha256": "PENDING",
        "accepted_utc": EXPECTED_ACCEPTED_UTC,
        "authorization": {
            "live_search_authorized": False,
            "phase1_authorized": False,
            "solver_campaign_authorized": False,
            "t0_target_contract_accepted": True,
        },
        "coordinator": {
            "decision": "ACCEPT",
            "identity": "Adam McKenna",
            "role": "T0_COORDINATOR",
        },
        "decision": "ACCEPT",
        "decision_context": {
            "changed_manifest_paths": [str(TARGET_SOURCE_PATH)],
            "new_relevant_paths": [str(POST_REQUEST_DEPENDENCY_PATH)],
            "observed_main_branch": "main",
            "observed_main_head": EXPECTED_DECISION_MAIN_HEAD,
            "observed_main_worktree_bytes_governed": False,
            "post_request_drift_status": (
                "MATERIAL_TARGET_SOURCE_DRIFT_REQUIRES_REFRESH"
            ),
            "target_statement_preserved": True,
        },
        "evidence": {
            "packet": copy.deepcopy(request["evidence"]["packet"]),
            "request": {
                "path": str(REQUEST_PATH),
                "raw_sha256": raw_sha256((REPO_ROOT / REQUEST_PATH).read_bytes()),
                "structured_sha256": request["request_sha256"],
            },
            "reviewer_identities": sorted(
                reviewer["reviewer_identity"] for reviewer in review["reviewers"]
            ),
        },
        "schema": "cap-configuration-t0-acceptance/v1",
        "source_drift_attestation": copy.deepcopy(request["source_drift_attestation"]),
        "status": "T0_ACCEPTED_TARGET_CONTRACT_ONLY",
        "target_id": target["target_id"],
    }
    _rehash(value, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    return value


def test_separate_acceptance_binding_is_non_circular_and_validatable() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    _verify_acceptance(
        REPO_ROOT,
        REPO_ROOT / SOURCE_PATH,
        source,
        REPO_ROOT / PREFLIGHT_PATH,
        preflight,
        REPO_ROOT / TARGET_PATH,
        target,
        REPO_ROOT / REVIEW_PATH,
        review,
        REPO_ROOT / REQUEST_PATH,
        request,
        acceptance,
    )


def test_checked_in_acceptance_is_bound_and_validatable() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = load_canonical(REPO_ROOT / ACCEPTANCE_PATH)
    assert acceptance["acceptance_sha256"] == (
        "1511c8e938d21e560518c22f2a890cc47d27b9cd0e4854da10abbb0523694ed6"
    )
    _verify_acceptance(
        REPO_ROOT,
        REPO_ROOT / SOURCE_PATH,
        source,
        REPO_ROOT / PREFLIGHT_PATH,
        preflight,
        REPO_ROOT / TARGET_PATH,
        target,
        REPO_ROOT / REVIEW_PATH,
        review,
        REPO_ROOT / REQUEST_PATH,
        request,
        acceptance,
    )


def test_acceptance_requires_explicit_coordinator_accept() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["coordinator"]["decision"] = "ABSTAIN"
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="coordinator ACCEPT"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_requires_explicit_coordinator_identity() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["coordinator"]["identity"] = "substituted-coordinator"
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="explicit decision author"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_cannot_govern_current_main() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["acceptance_scope"]["current_main_governed"] = True
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="frozen-snapshot scope boundary"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_cannot_retroactively_authorize_implementation() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["acceptance_scope"]["retroactive_authorization"] = True
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="frozen-snapshot scope boundary"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_cannot_substitute_decision_main_head() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["decision_context"]["observed_main_head"] = EXPECTED_REQUEST_MAIN_HEAD
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="decision-context boundary"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_cannot_authorize_phase1() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["authorization"]["phase1_authorized"] = True
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="must not authorize downstream execution"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_cannot_substitute_a_different_source_head() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    acceptance["source_drift_attestation"]["checked_head"] = request["evidence"]["packet"][
        "commit"
    ]
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="unexpected checked_head"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            request,
            acceptance,
        )


def test_acceptance_reauthenticates_the_stored_pending_request() -> None:
    source, preflight, target, review, request = _request_inputs()
    acceptance = _acceptance_record(target, review, request)
    forged_request = copy.deepcopy(request)
    forged_request["status"] = "FORGED"
    with pytest.raises(PacketValidationError, match="differs from stored request bytes"):
        _verify_acceptance(
            REPO_ROOT,
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            REPO_ROOT / REQUEST_PATH,
            forged_request,
            acceptance,
        )
