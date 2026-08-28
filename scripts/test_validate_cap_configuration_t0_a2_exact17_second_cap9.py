from __future__ import annotations

import copy
from pathlib import Path

import pytest

from census.cap_configuration.schema import raw_sha256, structured_hash
from scripts.validate_cap_configuration_t0_a2_exact17_second_cap9 import (
    PREFLIGHT_PATH,
    REVIEW_PATH,
    SOURCE_PATH,
    TARGET_PATH,
    PacketValidationError,
    _verify_acceptance,
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


def test_rehashed_preflight_with_wrong_base_is_rejected() -> None:
    source, preflight, _ = _target_inputs()
    preflight = copy.deepcopy(preflight)
    preflight["applicability"]["accepted_base_head"] = "0" * 40
    _rehash(preflight, "preflight_sha256", "cap-configuration-t0-preflight/v1")
    with pytest.raises(PacketValidationError, match="accepted_base_head"):
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


def _acceptance_record(source: dict, preflight: dict, target: dict, review: dict) -> dict:
    value = {
        "acceptance_sha256": "PENDING",
        "accepted_utc": "2026-08-28T02:00:00Z",
        "artifacts": {
            "source_identity": {
                "path": str(SOURCE_PATH),
                "raw_sha256": raw_sha256((REPO_ROOT / SOURCE_PATH).read_bytes()),
                "structured_sha256": source["source_identity_sha256"],
            },
            "preflight": {
                "path": str(PREFLIGHT_PATH),
                "raw_sha256": raw_sha256((REPO_ROOT / PREFLIGHT_PATH).read_bytes()),
                "structured_sha256": preflight["preflight_sha256"],
            },
            "target": {
                "path": str(TARGET_PATH),
                "raw_sha256": raw_sha256((REPO_ROOT / TARGET_PATH).read_bytes()),
                "structured_sha256": target["target_sha256"],
            },
            "review": {
                "path": str(REVIEW_PATH),
                "raw_sha256": raw_sha256((REPO_ROOT / REVIEW_PATH).read_bytes()),
                "structured_sha256": review["review_sha256"],
            },
        },
        "authorization": {
            "live_search_authorized": False,
            "phase1_authorized": False,
            "solver_campaign_authorized": False,
        },
        "coordinator": {
            "decision": "ACCEPT",
            "identity": "test-coordinator",
            "role": "T0_COORDINATOR",
        },
        "schema": "cap-configuration-t0-acceptance/v1",
        "status": "T0_ACCEPTED_TARGET_CONTRACT_ONLY",
        "target_id": target["target_id"],
    }
    _rehash(value, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    return value


def test_separate_acceptance_binding_is_non_circular_and_validatable() -> None:
    source, preflight, target, review = _review_inputs()
    acceptance = _acceptance_record(source, preflight, target, review)
    _verify_acceptance(
        REPO_ROOT / SOURCE_PATH,
        source,
        REPO_ROOT / PREFLIGHT_PATH,
        preflight,
        REPO_ROOT / TARGET_PATH,
        target,
        REPO_ROOT / REVIEW_PATH,
        review,
        acceptance,
    )


def test_acceptance_requires_explicit_coordinator_accept() -> None:
    source, preflight, target, review = _review_inputs()
    acceptance = _acceptance_record(source, preflight, target, review)
    acceptance["coordinator"]["decision"] = "ABSTAIN"
    _rehash(acceptance, "acceptance_sha256", "cap-configuration-t0-acceptance/v1")
    with pytest.raises(PacketValidationError, match="coordinator ACCEPT"):
        _verify_acceptance(
            REPO_ROOT / SOURCE_PATH,
            source,
            REPO_ROOT / PREFLIGHT_PATH,
            preflight,
            REPO_ROOT / TARGET_PATH,
            target,
            REPO_ROOT / REVIEW_PATH,
            review,
            acceptance,
        )
