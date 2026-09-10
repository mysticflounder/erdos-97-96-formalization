from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

import pytest

MODULE_PATH = Path(__file__).parents[1] / "tools" / "prove2me_submit.py"
SPEC = importlib.util.spec_from_file_location("prove2me_submit", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
MODULE = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = MODULE
SPEC.loader.exec_module(MODULE)

Client = MODULE.Client
SubmissionError = MODULE.SubmissionError
apply_plan = MODULE.apply_plan
encode_multipart = MODULE.encode_multipart
load_plan = MODULE.load_plan
parse_theorem_file = MODULE.parse_theorem_file

STATEMENT = "theorem Example.target (n : Nat) : n = n := by sorry"
DEFINITION = "import Mathlib\n\nnamespace Example\n\ndef helper := 1\n\nend Example\n"


class ExactTheoremTransport:
    def __init__(self, formal_statement: str = STATEMENT) -> None:
        self.formal_statement = formal_statement
        self.calls: list[tuple[str, str, dict[str, str], bytes | None]] = []

    def request(
        self,
        method: str,
        url: str,
        *,
        headers: dict[str, str],
        body: bytes | None,
    ) -> Any:
        self.calls.append((method, url, headers, body))
        if url.endswith("/agent/refresh"):
            return {"access_token": "access-secret", "expires_at": 10**12, "version": "0.9.8"}
        if "/theorems?" in url:
            return {
                "theorems": [
                    {
                        "theorem_name": "Example.target",
                        "theorem_id": "theorem-1",
                        "formal_statement": self.formal_statement,
                        "status": "Open",
                    }
                ]
            }
        raise AssertionError(f"unexpected request: {method} {url}")


class DefinitionTransport:
    def __init__(
        self, definition: str = DEFINITION, *, definition_exists: bool = False
    ) -> None:
        self.definition = definition
        self.definition_exists = definition_exists
        self.calls: list[tuple[str, str, dict[str, str], bytes | None]] = []

    def request(
        self,
        method: str,
        url: str,
        *,
        headers: dict[str, str],
        body: bytes | None,
    ) -> Any:
        self.calls.append((method, url, headers, body))
        if url.endswith("/agent/refresh"):
            return {
                "access_token": "access-secret",
                "expires_at": 10**12,
                "version": "0.9.8",
            }
        if "/theorems?" in url and "status=Definition" in url:
            if not self.definition_exists:
                return {"theorems": []}
            return {
                "theorems": [
                    {
                        "theorem_name": "Example.Bundle",
                        "theorem_id": "definition-1",
                        "definition": self.definition,
                        "status": "Definition",
                    }
                ]
            }
        if "/theorems?" in url:
            return {
                "theorems": [
                    {
                        "theorem_name": "Example.target",
                        "theorem_id": "theorem-1",
                        "formal_statement": STATEMENT,
                        "status": "Open",
                    }
                ]
            }
        if method == "POST" and url.endswith("/submit-definition"):
            self.definition_exists = True
            return {"jobs": [{"job_id": "definition-job-1", "status": "PENDING"}]}
        if url.endswith("/publish-jobs/definition-job-1"):
            return {"job_id": "definition-job-1", "status": "PUBLISHED"}
        raise AssertionError(f"unexpected request: {method} {url}")


class ProofRetryTransport:
    def __init__(
        self, retry_status: str = "ACCEPTED", recorded_status: str = "FAILED"
    ) -> None:
        self.retry_status = retry_status
        self.recorded_status = recorded_status
        self.calls: list[tuple[str, str, dict[str, str], bytes | None]] = []
        self.retry_count = 0

    def request(
        self,
        method: str,
        url: str,
        *,
        headers: dict[str, str],
        body: bytes | None,
    ) -> Any:
        self.calls.append((method, url, headers, body))
        if url.endswith("/agent/refresh"):
            return {
                "access_token": "access-secret",
                "expires_at": 10**12,
                "version": "0.9.8",
            }
        if "/theorems?" in url:
            return {
                "theorems": [
                    {
                        "theorem_name": "Example.target",
                        "theorem_id": "theorem-1",
                        "formal_statement": STATEMENT,
                        "status": "Open",
                    }
                ]
            }
        if method == "GET" and "submission_id=submission-old" in url:
            return {
                "submission_id": "submission-old",
                "status": self.recorded_status,
                "result": {"diagnostic": "old failure"},
            }
        if method == "POST" and url.endswith("/verify"):
            self.retry_count += 1
            return {
                "submission_id": f"submission-retry-{self.retry_count}",
                "status": "PENDING",
            }
        if method == "GET" and "submission_id=submission-retry-" in url:
            submission_id = url.rsplit("=", 1)[-1]
            return {"submission_id": submission_id, "status": self.retry_status}
        raise AssertionError(f"unexpected request: {method} {url}")


def write_plan(tmp_path: Path) -> Path:
    (tmp_path / "credentials.json").write_text(
        json.dumps({"api_key": "api-secret"}), encoding="utf-8"
    )
    (tmp_path / "target.lean").write_text(
        f"import Mathlib\n\n-- PROVE2ME_FORMAL_STATEMENT\n{STATEMENT}\n",
        encoding="utf-8",
    )
    plan = tmp_path / "plan.toml"
    plan.write_text(
        """schema = "prove2me-submit-plan/v1"
host = "https://prove2.me/api/v1"
platform_version = "0.9.8"
credentials = "credentials.json"
receipt = "receipt.json"

[[theorem]]
name = "Example.target"
title = "Example"
file = "target.lean"
natural_language_statement = "Every natural number equals itself."
source = "https://example.test/source"
tags = ["test"]
""",
        encoding="utf-8",
    )
    return plan


def append_definition(plan: Path, definition: str = DEFINITION) -> None:
    (plan.parent / "definition.lean").write_text(definition, encoding="utf-8")
    with plan.open("a", encoding="utf-8") as stream:
        stream.write(
            """
[[definition]]
name = "Example.Bundle"
file = "definition.lean"
title = "Example definitions"
natural_language_statement = "Reusable helpers for the example."
source = "https://example.test/definition-source"
tags = ["support", "test"]
private = true
env = "mathlib-test"
"""
        )


def append_proof(plan: Path) -> None:
    (plan.parent / "solution.lean").write_text(
        "theorem solution (n : Nat) : n = n := by rfl\n", encoding="utf-8"
    )
    (plan.parent / "explanation.md").write_text("Reflexivity.\n", encoding="utf-8")
    with plan.open("a", encoding="utf-8") as stream:
        stream.write(
            """
[[proof]]
theorem = "Example.target"
file = "solution.lean"
explanation = "explanation.md"
"""
        )


def write_failed_proof_receipt(plan: Any, *, uncertain: bool = False) -> None:
    receipt = MODULE._new_receipt(plan)
    receipt["theorems"]["Example.target"] = {
        "status": "PUBLISHED",
        "theorem_id": "theorem-1",
    }
    receipt["proofs"]["Example.target"] = {
        "status": "PENDING",
        "submission_id": "submission-old",
        "local_metadata": {"preserve": True},
    }
    receipt["intents"]["proof:Example.target"] = {
        "state": "INTENT" if uncertain else "RECORDED",
        "payload_sha256": "original-digest",
        "submission_id": "submission-old",
    }
    MODULE._atomic_json(plan.root / plan.data["receipt"], receipt)


def test_parse_theorem_file_splits_required_marker_and_checks_dotted_name(
    tmp_path: Path,
) -> None:
    path = tmp_path / "target.lean"
    path.write_text(
        f"import Mathlib\nopen Nat\n\n-- PROVE2ME_FORMAL_STATEMENT\n{STATEMENT}\n",
        encoding="utf-8",
    )

    parsed = parse_theorem_file(path, "Example.target")

    assert parsed.preamble == "import Mathlib\nopen Nat"
    assert parsed.formal_statement == STATEMENT
    assert parsed.declaration_name == "Example.target"
    with pytest.raises(SubmissionError, match="theorem name mismatch"):
        parse_theorem_file(path, "Example.other")


def test_load_plan_parses_definition_and_optional_submission_fields(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    append_definition(plan_path)

    loaded = load_plan(plan_path)

    assert len(loaded.definitions) == 1
    definition = loaded.definitions[0]
    assert definition["name"] == "Example.Bundle"
    assert definition["path"] == (tmp_path / "definition.lean").resolve()
    assert definition["definition"] == DEFINITION
    assert MODULE._definition_payload(definition) == {
        "definition_name": "Example.Bundle",
        "definition_title": "Example definitions",
        "definition": DEFINITION,
        "natural_language_statement": "Reusable helpers for the example.",
        "source": "https://example.test/definition-source",
        "tags": ["support", "test"],
        "private": True,
        "env": "mathlib-test",
    }


def test_definition_only_plan_allows_omitting_optional_metadata(tmp_path: Path) -> None:
    (tmp_path / "definition.lean").write_text(DEFINITION, encoding="utf-8")
    plan_path = tmp_path / "plan.toml"
    plan_path.write_text(
        """schema = "prove2me-submit-plan/v1"
host = "https://prove2.me/api/v1"
platform_version = "0.9.8"
credentials = "credentials.json"
receipt = "receipt.json"

[[definition]]
name = "Example.Bundle"
file = "definition.lean"
""",
        encoding="utf-8",
    )

    loaded = load_plan(plan_path)

    assert loaded.theorems == ()
    assert MODULE._definition_payload(loaded.definitions[0]) == {
        "definition_name": "Example.Bundle",
        "definition": DEFINITION,
    }


def test_artifact_root_allows_nested_plan_to_use_canonical_worktree_files(
    tmp_path: Path,
) -> None:
    worktree = tmp_path / "checkout"
    plan_dir = worktree / "submissions" / "packet"
    plan_dir.mkdir(parents=True)
    (worktree / ".git").mkdir()
    (plan_dir / "credentials.json").write_text(
        json.dumps({"api_key": "api-secret"}), encoding="utf-8"
    )
    (worktree / "canonical.lean").write_text(
        f"-- PROVE2ME_FORMAL_STATEMENT\n{STATEMENT}\n", encoding="utf-8"
    )
    plan_path = plan_dir / "plan.toml"
    plan_path.write_text(
        """schema = "prove2me-submit-plan/v1"
host = "https://prove2.me/api/v1"
platform_version = "0.9.8"
artifact_root = "../.."
credentials = "credentials.json"
receipt = "submissions/packet/receipt.json"

[[theorem]]
name = "Example.target"
title = "Example"
file = "canonical.lean"
natural_language_statement = "Every natural number equals itself."
source = "https://example.test/source"
""",
        encoding="utf-8",
    )

    loaded = load_plan(plan_path)

    assert loaded.root == worktree.resolve()
    assert loaded.theorems[0]["path"] == (worktree / "canonical.lean").resolve()


def test_artifact_root_cannot_escape_detected_worktree(tmp_path: Path) -> None:
    worktree = tmp_path / "checkout"
    plan_dir = worktree / "submissions"
    plan_dir.mkdir(parents=True)
    (worktree / ".git").mkdir()
    plan_path = plan_dir / "plan.toml"
    plan_path.write_text(
        """schema = "prove2me-submit-plan/v1"
host = "https://prove2.me/api/v1"
platform_version = "0.9.8"
artifact_root = "../.."
credentials = "credentials.json"
receipt = "receipt.json"
""",
        encoding="utf-8",
    )

    with pytest.raises(SubmissionError, match="escapes the current Git worktree"):
        load_plan(plan_path)


def test_mission_description_preserves_exact_file_text(tmp_path: Path) -> None:
    plan_path = write_plan(tmp_path)
    (tmp_path / "mission.md").write_text("Mission text.\n", encoding="utf-8")
    plan_text = plan_path.read_text(encoding="utf-8").replace(
        'receipt = "receipt.json"\n',
        'receipt = "receipt.json"\nmission_id = "mission-1"\n'
        'mission_description = "mission.md"\n',
    )
    plan_path.write_text(plan_text, encoding="utf-8")

    loaded = load_plan(plan_path)

    assert loaded.mission_description == "Mission text.\n"


def test_multipart_encoding_is_deterministic_and_sorted() -> None:
    fields = {
        "theorem_id": "theorem-1",
        "proof_type": "prove",
        "explanation": "A proof.",
    }
    solution = b"theorem solution : True := by trivial\n"

    first_body, first_boundary = encode_multipart(fields, solution)
    second_body, second_boundary = encode_multipart(dict(reversed(fields.items())), solution)

    assert (first_body, first_boundary) == (second_body, second_boundary)
    assert first_body.endswith(f"--{first_boundary}--\r\n".encode())
    assert first_body.index(b'name="explanation"') < first_body.index(b'name="proof_type"')
    assert solution in first_body


def test_proof_source_rejects_placeholders_but_ignores_comments_and_strings(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    (tmp_path / "solution.lean").write_text(
        """-- sorry is discussed here
/- an outer admit /- and nested sorry -/ comment -/
def message := "sorry and admit"
theorem solution (n : Nat) : n = n := by rfl
""",
        encoding="utf-8",
    )
    (tmp_path / "explanation.md").write_text("Reflexivity.", encoding="utf-8")
    with plan_path.open("a", encoding="utf-8") as stream:
        stream.write(
            """
[[proof]]
theorem = "Example.target"
file = "solution.lean"
explanation = "explanation.md"
"""
        )

    load_plan(plan_path)

    (tmp_path / "solution.lean").write_text(
        "theorem solution (n : Nat) : n = n := by admit\n", encoding="utf-8"
    )
    with pytest.raises(SubmissionError, match="contains 'admit'"):
        load_plan(plan_path)


def test_terminal_proof_failure_is_not_retried_by_default(tmp_path: Path) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan)
    transport = ProofRetryTransport()

    with pytest.raises(SubmissionError, match="ended as FAILED"):
        apply_plan(plan, transport=transport)

    receipt = json.loads((tmp_path / "receipt.json").read_text(encoding="utf-8"))
    assert transport.retry_count == 0
    assert receipt["proofs"]["Example.target"]["status"] == "FAILED"
    assert receipt["proof_attempts"] == {}


def test_explicit_terminal_retry_preserves_history_and_uses_unique_intent(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan)
    transport = ProofRetryTransport()

    receipt = apply_plan(plan, transport=transport, retry_terminal_proofs=True)

    assert receipt["proof_attempts"]["Example.target"] == [
        {
            "local_metadata": {"preserve": True},
            "result": {"diagnostic": "old failure"},
            "status": "FAILED",
            "submission_id": "submission-old",
        }
    ]
    assert receipt["intents"]["proof:Example.target"] == {
        "payload_sha256": "original-digest",
        "state": "RECORDED",
        "submission_id": "submission-old",
    }
    retry_intent = receipt["intents"]["proof:Example.target:retry:1"]
    assert retry_intent["state"] == "RECORDED"
    assert retry_intent["submission_id"] == "submission-retry-1"
    assert retry_intent["retry_of_submission_id"] == "submission-old"
    assert receipt["proofs"]["Example.target"] == {
        "intent_key": "proof:Example.target:retry:1",
        "status": "ACCEPTED",
        "submission_id": "submission-retry-1",
    }


def test_accepted_retry_is_reused_without_another_post(tmp_path: Path) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan)
    transport = ProofRetryTransport()

    first = apply_plan(plan, transport=transport, retry_terminal_proofs=True)
    second = apply_plan(plan, transport=transport, retry_terminal_proofs=True)

    assert first["proofs"] == second["proofs"]
    assert transport.retry_count == 1


def test_failed_retry_does_not_loop_within_one_apply(tmp_path: Path) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan)
    transport = ProofRetryTransport(retry_status="WA")

    with pytest.raises(SubmissionError, match="ended as WA"):
        apply_plan(plan, transport=transport, retry_terminal_proofs=True)

    receipt = json.loads((tmp_path / "receipt.json").read_text(encoding="utf-8"))
    assert transport.retry_count == 1
    assert len(receipt["proof_attempts"]["Example.target"]) == 1
    assert receipt["proofs"]["Example.target"]["status"] == "WA"


def test_retry_refuses_uncertain_prior_proof_intent(tmp_path: Path) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan, uncertain=True)
    transport = ProofRetryTransport()

    with pytest.raises(SubmissionError, match="uncertain prior proof POST"):
        apply_plan(plan, transport=transport, retry_terminal_proofs=True)

    assert transport.retry_count == 0


@pytest.mark.parametrize(
    ("status", "message"),
    [("CANCELLED", "ended as CANCELLED"), ("PENDING", "polling timed out")],
)
def test_retry_refuses_unknown_and_active_states(
    tmp_path: Path, status: str, message: str
) -> None:
    plan_path = write_plan(tmp_path)
    append_proof(plan_path)
    plan = load_plan(plan_path)
    write_failed_proof_receipt(plan)
    transport = ProofRetryTransport(recorded_status=status)

    with pytest.raises(SubmissionError, match=message):
        apply_plan(
            plan,
            transport=transport,
            poll_timeout=0,
            retry_terminal_proofs=True,
        )

    assert transport.retry_count == 0


def test_apply_uses_exact_lookup_and_is_idempotent(tmp_path: Path) -> None:
    plan = load_plan(write_plan(tmp_path))
    transport = ExactTheoremTransport()

    first = apply_plan(plan, transport=transport)
    second = apply_plan(plan, transport=transport)

    assert first["theorems"]["Example.target"]["theorem_id"] == "theorem-1"
    assert second["theorems"] == first["theorems"]
    assert [call for call in transport.calls if call[0] in {"POST", "PATCH"} and not call[1].endswith("/agent/refresh")] == []
    assert all("theorem_name=Example.target" in call[1] for call in transport.calls if "/theorems?" in call[1])


def test_apply_rejects_exact_name_with_statement_mismatch(tmp_path: Path) -> None:
    plan = load_plan(write_plan(tmp_path))
    transport = ExactTheoremTransport(
        "theorem Example.target (n : Nat) : True := by sorry"
    )

    with pytest.raises(SubmissionError, match="remote theorem statement mismatch"):
        apply_plan(plan, transport=transport)

    receipt = (tmp_path / "receipt.json").read_text(encoding="utf-8")
    assert "api-secret" not in receipt


def test_apply_creates_then_reuses_definition_with_exact_lookup(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    append_definition(plan_path)
    plan = load_plan(plan_path)
    transport = DefinitionTransport()

    first = apply_plan(plan, transport=transport)
    second = apply_plan(plan, transport=transport)

    assert first["definitions"]["Example.Bundle"] == {
        "definition_id": "definition-1",
        "job_id": "definition-job-1",
        "status": "PUBLISHED",
    }
    assert second["definitions"] == first["definitions"]
    posts = [
        call
        for call in transport.calls
        if call[0] == "POST" and call[1].endswith("/submit-definition")
    ]
    assert len(posts) == 1
    assert json.loads(posts[0][3]) == MODULE._definition_payload(plan.definitions[0])
    definition_lookups = [
        call[1]
        for call in transport.calls
        if "/theorems?" in call[1] and "status=Definition" in call[1]
    ]
    assert len(definition_lookups) == 3
    assert all("q=Example.Bundle" in url for url in definition_lookups)
    assert all("env=mathlib-test" in url for url in definition_lookups)
    assert first["intents"]["definition:Example.Bundle"] == {
        "job_id": "definition-job-1",
        "payload_sha256": MODULE._sha256(posts[0][3]),
        "state": "RECORDED",
    }


def test_apply_rejects_exact_definition_name_with_content_mismatch(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    append_definition(plan_path)
    transport = DefinitionTransport(
        "namespace Example\n\ndef helper := 2\n\nend Example\n",
        definition_exists=True,
    )

    with pytest.raises(SubmissionError, match="remote definition content mismatch"):
        apply_plan(load_plan(plan_path), transport=transport)

    assert not any(
        call[0] == "POST" and call[1].endswith("/submit-definition")
        for call in transport.calls
    )


def test_definition_intent_reconciles_exact_remote_without_retry(
    tmp_path: Path,
) -> None:
    plan_path = write_plan(tmp_path)
    append_definition(plan_path)
    plan = load_plan(plan_path)
    payload = MODULE._canonical_json(MODULE._definition_payload(plan.definitions[0]))
    receipt = MODULE._new_receipt(plan)
    receipt["intents"]["definition:Example.Bundle"] = {
        "state": "INTENT",
        "payload_sha256": MODULE._sha256(payload),
    }
    (tmp_path / "receipt.json").write_text(json.dumps(receipt), encoding="utf-8")
    transport = DefinitionTransport(definition_exists=True)

    result = apply_plan(plan, transport=transport)

    assert result["definitions"]["Example.Bundle"]["definition_id"] == "definition-1"
    assert result["intents"]["definition:Example.Bundle"] == {
        "definition_id": "definition-1",
        "payload_sha256": MODULE._sha256(payload),
        "state": "RECORDED",
    }
    assert not any(
        call[0] == "POST" and call[1].endswith("/submit-definition")
        for call in transport.calls
    )


def test_definition_receipt_redacts_payload_and_credentials(tmp_path: Path) -> None:
    secret_definition = "def receiptOnlySecret := \"definition-secret\"\n"
    plan_path = write_plan(tmp_path)
    append_definition(plan_path, secret_definition)

    apply_plan(
        load_plan(plan_path),
        transport=DefinitionTransport(secret_definition),
    )

    receipt = (tmp_path / "receipt.json").read_text(encoding="utf-8")
    assert "definition-secret" not in receipt
    assert "Reusable helpers for the example" not in receipt
    assert "api-secret" not in receipt
    assert "access-secret" not in receipt


def test_publish_receipt_preserves_job_id(tmp_path: Path) -> None:
    class PublishTransport:
        lookup_count = 0

        def request(
            self,
            method: str,
            url: str,
            *,
            headers: dict[str, str],
            body: bytes | None,
        ) -> Any:
            if url.endswith("/agent/refresh"):
                return {
                    "access_token": "access-secret",
                    "expires_at": 10**12,
                    "version": "0.9.8",
                }
            if "/theorems?" in url:
                self.lookup_count += 1
                if self.lookup_count == 1:
                    return {"theorems": []}
                return {
                    "theorems": [
                        {
                            "theorem_name": "Example.target",
                            "theorem_id": "theorem-1",
                            "formal_statement": STATEMENT,
                            "status": "Open",
                        }
                    ]
                }
            if method == "POST" and url.endswith("/submit-problem"):
                return {"jobs": [{"job_id": "publish-job-1", "status": "PENDING"}]}
            if url.endswith("/publish-jobs/publish-job-1"):
                return {"job_id": "publish-job-1", "status": "PUBLISHED"}
            raise AssertionError(f"unexpected request: {method} {url}")

    receipt = apply_plan(load_plan(write_plan(tmp_path)), transport=PublishTransport())

    assert receipt["theorems"]["Example.target"] == {
        "job_id": "publish-job-1",
        "status": "PUBLISHED",
        "theorem_id": "theorem-1",
    }


def test_milestone_readback_accepts_nested_theorem_and_rejects_drift() -> None:
    desired = {
        "title": "Milestone",
        "milestone_description": "Description",
        "theorem_id": "theorem-1",
        "sort_order": 4,
    }
    remote = {
        "id": "milestone-1",
        "title": "Milestone",
        "milestone_description": "Description",
        "theorem": {"id": "theorem-1"},
        "sort_order": 4,
    }

    assert MODULE._require_milestone_readback(remote, desired) is remote
    remote["milestone_description"] = "Stale description"
    with pytest.raises(SubmissionError, match="milestone readback mismatch"):
        MODULE._require_milestone_readback(remote, desired)


def test_mission_description_patch_requires_exact_readback(tmp_path: Path) -> None:
    class StaleMissionClient:
        def request(
            self,
            method: str,
            path: str,
            *,
            query: dict[str, str] | None = None,
            body: bytes | None = None,
        ) -> Any:
            if method == "GET" and path == "/missions":
                return {
                    "missions": [{"id": "mission-1", "description": "old"}],
                    "total": 1,
                }
            if method == "PATCH" and path == "/missions/mission-1":
                return {"id": "mission-1", "description": "new"}
            raise AssertionError(f"unexpected request: {method} {path}")

    receipt = {"intents": {}, "mission_description": {}}

    with pytest.raises(SubmissionError, match="mission description readback mismatch"):
        MODULE._ensure_description(
            "mission-1",
            "new",
            StaleMissionClient(),
            tmp_path / "receipt.json",
            receipt,
        )


def test_transport_errors_redact_api_key_and_access_token() -> None:
    class LeakyTransport:
        calls = 0

        def request(
            self,
            method: str,
            url: str,
            *,
            headers: dict[str, str],
            body: bytes | None,
        ) -> Any:
            self.calls += 1
            if self.calls == 1:
                return {
                    "access_token": "access-secret",
                    "expires_at": 10**12,
                    "version": "0.9.8",
                }
            raise RuntimeError("leaked api-secret and access-secret")

    client = Client(
        "https://prove2.me/api/v1",
        "0.9.8",
        "api-secret",
        transport=LeakyTransport(),
    )

    with pytest.raises(SubmissionError) as captured:
        client.request("GET", "/theorems")

    message = str(captured.value)
    assert "api-secret" not in message
    assert "access-secret" not in message
    assert message.count("[REDACTED]") == 2
