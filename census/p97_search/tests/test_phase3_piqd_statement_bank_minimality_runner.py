from __future__ import annotations

import copy
import hashlib
import uuid
from collections.abc import Callable, Mapping
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank
from census.p97_search import phase3_piqd_statement_bank_minimality as minimality
from census.p97_search import phase3_piqd_statement_bank_minimality_runner as campaign
from census.p97_search import phase3_piqd_statement_bank_round_receipts as adapter
from census.p97_search import phase3_piqd_statement_bank_runner as runner

LIMIT = 10_000


def _plan() -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [
            {"clauses": [[-1]], "statement_id": "A"},
            {"clauses": [[-1]], "statement_id": "B"},
        ],
    }
    return bank.build_selector_plan(
        bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    )


class ResponseSubclass(runner.JsonHttpResponse):
    pass


class IntSubclass(int):
    pass


class PlanSubclass(bank.SelectorPlan):
    pass


class FakePiqd:
    def __init__(
        self,
        root: Path,
        round_statuses: list[tuple[str, ...]],
        *,
        malformed_create: bool = False,
        create_response_subclass: bool = False,
        create_status_subclass: bool = False,
        fail_add: bool = False,
        batch_mutator: Callable[[dict], None] | None = None,
        receipts_mutator: Callable[[dict], None] | None = None,
        append_journal_on_receipts: bytes = b"",
        receipts_path_fault: str | None = None,
    ) -> None:
        self.root = root
        self.root.mkdir(parents=True, exist_ok=True)
        self.round_statuses = round_statuses
        self.malformed_create = malformed_create
        self.create_response_subclass = create_response_subclass
        self.create_status_subclass = create_status_subclass
        self.fail_add = fail_add
        self.batch_mutator = batch_mutator
        self.receipts_mutator = receipts_mutator
        self.append_journal_on_receipts = append_journal_on_receipts
        self.receipts_path_fault = receipts_path_fault
        self.calls: list[tuple[str, str, Mapping[str, object] | None]] = []
        self.sessions: dict[str, dict] = {}
        self.created_ids: list[str] = []

    def _session_document(self, state: dict) -> dict:
        return {
            "id": state["id"],
            "lane": "sat",
            "state": state["state"],
            "solver_name": state["solver"],
            "solver_sha256": "a" * 64,
            "solver_signature": "fake-solver",
            "protocol_version": 1,
            "journal_path": str(state["journal_path"]),
            "created_at": state["created_at"],
            "updated_at": state["created_at"] + len(state["receipts"]),
            "clauses": len(state["clauses"]),
            "max_var": state["max_var"],
            "solves": len(state["receipts"]),
            "last_status": (
                None if not state["receipts"] else state["receipts"][-1]["status"]
            ),
            "label": state["label"],
        }

    def _new_session(self, body: Mapping[str, object]) -> runner.JsonHttpResponse:
        ordinal = len(self.created_ids)
        session_id = str(uuid.UUID(int=ordinal + 1))
        session_dir = self.root / "sessions" / session_id
        session_dir.mkdir(parents=True)
        journal_path = session_dir / "journal.cnf"
        journal_path.write_bytes(b"")
        receipts_path = session_dir / "receipts.jsonl"
        receipts_path.write_bytes(b"")
        state = {
            "id": session_id,
            "state": "live",
            "solver": body["solver"],
            "label": body["label"],
            "created_at": 1_786_218_000 + ordinal,
            "journal_path": journal_path,
            "receipts_path": receipts_path,
            "clauses": [],
            "max_var": 0,
            "receipts": [],
            "batch": None,
            "statuses": self.round_statuses[ordinal],
        }
        self.sessions[session_id] = state
        self.created_ids.append(session_id)
        document = self._session_document(state)
        if self.malformed_create:
            document["extra"] = True
        response_type = (
            ResponseSubclass
            if self.create_response_subclass
            else runner.JsonHttpResponse
        )
        status = IntSubclass(201) if self.create_status_subclass else 201
        return response_type(status, document)

    @staticmethod
    def _journal_bytes(clauses: list[list[int]]) -> bytes:
        return "".join(
            "".join(f"{literal} " for literal in clause) + "0\n" for clause in clauses
        ).encode("ascii")

    def _run_batch(self, state: dict, body: Mapping[str, object]) -> dict:
        queries = body["queries"]
        assert type(queries) is list
        digest = adapter._batch_digest(
            [tuple(query["assumptions"]) for query in queries],
            queries[0]["conflict_limit"],
            guard=body["continue_after_first_only_if"],
        )
        statuses = state["statuses"]
        guarded = statuses[0] != "UNSAT"
        run_count = 1 if guarded else min(len(statuses), len(queries))
        journal = self._journal_bytes(state["clauses"])
        base_sha = hashlib.sha256(journal).hexdigest()
        records: list[dict] = []
        for position in range(run_count):
            query = queries[position]
            status = statuses[position]
            assumptions = query["assumptions"]
            result_sha = hashlib.sha256(
                f"{state['id']}:{position}:{status}".encode()
            ).hexdigest()
            receipt = {
                "assumptions": assumptions,
                "at": 1_786_219_000 + position,
                "base_bytes": len(journal),
                "base_clauses": len(state["clauses"]),
                "base_sha256": base_sha,
                "batch_key": body["batch_key"],
                "batch_position": position,
                "batch_request_sha256": digest,
                "batch_size": len(queries),
                "conflict_limit": query["conflict_limit"],
                "model_recorded": False,
                "result_sha256": result_sha,
                "solve_index": position + 1,
                "status": status,
            }
            if status == "UNSAT":
                receipt["core"] = [assumptions[0]]
            elif status == "UNKNOWN":
                receipt["interrupted_by"] = "conflict_limit"
            record = {
                key: receipt[key]
                for key in (
                    "assumptions",
                    "at",
                    "base_bytes",
                    "base_clauses",
                    "base_sha256",
                    "batch_position",
                    "conflict_limit",
                    "result_sha256",
                    "solve_index",
                    "status",
                )
            }
            if status == "UNSAT":
                record["core"] = receipt["core"]
                record["terminal_unsat"] = False
            elif status == "UNKNOWN":
                record["interrupted_by"] = "conflict_limit"
            state["receipts"].append(receipt)
            records.append(record)
        response = {
            "batch_key": body["batch_key"],
            "batch_request_sha256": digest,
            "batch_size": len(queries),
            "complete": guarded or run_count == len(queries),
            "executed": run_count,
            "records": records,
            "replayed": False,
            "session_id": state["id"],
            "stopped_by_guard": guarded,
        }
        state["batch"] = response
        state["receipts_path"].write_bytes(
            b"".join(
                bank.canonical_json_bytes(receipt) + b"\n"
                for receipt in state["receipts"]
            )
        )
        if self.batch_mutator is not None:
            self.batch_mutator(response)
        return response

    def request(
        self, method: str, path: str, body: Mapping[str, object] | None = None
    ) -> runner.JsonHttpResponse:
        self.calls.append((method, path, copy.deepcopy(body)))
        if method == "POST" and path == "/sessions":
            assert body is not None
            return self._new_session(body)
        session_id = path.split("/")[2]
        state = self.sessions[session_id]
        session_path = f"/sessions/{session_id}"
        if method == "POST" and path == f"{session_path}/clauses":
            if self.fail_add:
                return runner.JsonHttpResponse(500, {"error": "injected"})
            assert body is not None and type(body["clauses"]) is list
            state["clauses"] = copy.deepcopy(body["clauses"])
            state["max_var"] = max(
                abs(literal) for clause in state["clauses"] for literal in clause
            )
            state["journal_path"].write_bytes(self._journal_bytes(state["clauses"]))
            count = len(state["clauses"])
            return runner.JsonHttpResponse(
                200, {"added": count, "clauses": count, "max_var": state["max_var"]}
            )
        if method == "POST" and path == f"{session_path}/batch-solve":
            assert body is not None
            return runner.JsonHttpResponse(200, self._run_batch(state, body))
        if method == "DELETE" and path == session_path:
            state["state"] = "closed"
            return runner.JsonHttpResponse(200, self._session_document(state))
        if method == "GET" and path == f"{session_path}/receipts":
            if self.append_journal_on_receipts:
                with state["journal_path"].open("ab") as stream:
                    stream.write(self.append_journal_on_receipts)
            receipts_path = state["receipts_path"]
            if self.receipts_path_fault == "missing":
                receipts_path.unlink()
            elif self.receipts_path_fault == "symlink":
                payload = receipts_path.read_bytes()
                target = receipts_path.with_name("receipts-target.jsonl")
                target.write_bytes(payload)
                receipts_path.unlink()
                receipts_path.symlink_to(target.name)
            response = {
                "count": len(state["receipts"]),
                "journal_path": str(state["journal_path"]),
                "receipts": copy.deepcopy(state["receipts"]),
                "receipts_path": str(receipts_path),
                "session_id": session_id,
            }
            if self.receipts_mutator is not None:
                self.receipts_mutator(response)
            return runner.JsonHttpResponse(200, response)
        raise AssertionError((method, path, body))


def _run(fake: FakePiqd, plan: bank.SelectorPlan, **kwargs):
    return campaign.run_statement_bank_minimality_campaign(
        plan,
        solver_name="cadical",
        conflict_limit=LIMIT,
        transport=fake,
        piqd_data_root=str(fake.root),
        **kwargs,
    )


def _calls(fake: FakePiqd, suffix: str) -> list[tuple[str, str, object]]:
    return [call for call in fake.calls if call[1].endswith(suffix)]


def test_two_round_deletion_then_inclusion_minimal_uses_fresh_sessions(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path / "piqd", [("UNSAT", "UNSAT", "SAT"), ("UNSAT", "SAT")])
    result = _run(fake, plan)

    assert result.outcome is campaign.CampaignOutcome.INCLUSION_MINIMAL
    assert len(result.rounds) == 2
    assert result.terminal_result is result.rounds[-1].minimality_result
    assert result.terminal_result.document["status"] == minimality.INCLUSION_MINIMAL
    assert result.terminal_result.document["claims"][
        "inclusion_minimal_relative_to_supplied_bank"
    ]
    assert [item.minimality_result.document["status"] for item in result.rounds] == [
        minimality.DELETE_AND_CONTINUE,
        minimality.INCLUSION_MINIMAL,
    ]
    assert result.rounds[0].minimality_result.document["deleted_statement_id"] == "A"
    assert len({item.session_id for item in result.rounds}) == 2
    assert len(_calls(fake, "/batch-solve")) == 2
    assert len(_calls(fake, "/receipts")) == 2
    delete_calls = [call for call in fake.calls if call[0] == "DELETE"]
    assert len(delete_calls) == 2
    assert {call[1].split("/")[2] for call in delete_calls} == set(fake.created_ids)
    assert result.rounds[0].audit["previous_round_audit_sha256"] is None
    assert (
        result.rounds[1].audit["previous_round_audit_sha256"]
        == result.rounds[0].audit["round_audit_sha256"]
    )
    assert (
        result.audit["claims"]["inclusion_minimal_relative_to_supplied_bank"] is False
    )
    assert all(
        item.audit["claims"]["inclusion_minimal_relative_to_supplied_bank"] is False
        for item in result.rounds
    )
    assert result.audit["control_outcome"] == "TERMINAL_MINIMALITY_RESULT"
    assert minimality.INCLUSION_MINIMAL not in str(result.audit)
    assert all(
        minimality.INCLUSION_MINIMAL not in str(item.audit) for item in result.rounds
    )


def test_batch_request_has_exact_guard_order_and_no_timeout_or_model(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path / "piqd", [("UNSAT", "SAT", "SAT")])
    result = _run(fake, plan)
    body = _calls(fake, "/batch-solve")[0][2]
    expected_round = minimality.build_initial_round(plan).document["queries"]

    assert set(body) == {"batch_key", "continue_after_first_only_if", "queries"}
    assert str(uuid.UUID(body["batch_key"])) == body["batch_key"]
    assert body["continue_after_first_only_if"] == "UNSAT"
    assert [query["assumptions"] for query in body["queries"]] == [
        expected_round["baseline"]["assumptions"],
        *(query["assumptions"] for query in expected_round["leave_one_group_out"]),
    ]
    assert all(
        set(query) == {"assumptions", "conflict_limit"} for query in body["queries"]
    )
    assert all(query["conflict_limit"] == LIMIT for query in body["queries"])
    assert result.outcome is campaign.CampaignOutcome.INCLUSION_MINIMAL


@pytest.mark.parametrize("baseline", ["SAT", "UNKNOWN"])
def test_guarded_baseline_is_one_record_terminal_inconclusive(
    tmp_path: Path, baseline: str
) -> None:
    fake = FakePiqd(tmp_path / baseline, [(baseline,)])
    result = _run(fake, _plan())

    assert result.outcome is campaign.CampaignOutcome.INCONCLUSIVE
    assert result.terminal_result is None
    assert len(result.rounds) == 1
    evidence = result.rounds[0].receipt_evidence
    assert type(evidence) is adapter.AuthenticatedGuardedBaseline
    assert evidence.baseline.verdict.value == baseline
    assert evidence.audit["batch"]["complete"] is True
    assert evidence.audit["batch"]["stopped_by_guard"] is True
    assert len(_calls(fake, "/batch-solve")) == 1
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


def test_unknown_omission_is_dense_terminal_inconclusive(tmp_path: Path) -> None:
    fake = FakePiqd(tmp_path / "piqd", [("UNSAT", "SAT", "UNKNOWN")])
    result = _run(fake, _plan())
    assert result.outcome is campaign.CampaignOutcome.INCONCLUSIVE
    assert result.terminal_result.document["status"] == minimality.INCONCLUSIVE
    assert type(result.rounds[0].receipt_evidence) is adapter.AuthenticatedCompleteRound


@pytest.mark.parametrize(
    "mutator",
    [
        lambda batch: batch.pop("records"),
        lambda batch: batch.update(
            complete=False, records=batch["records"][:1], executed=1
        ),
        lambda batch: batch.update(
            complete=True,
            stopped_by_guard=True,
            records=batch["records"][:1],
            executed=1,
        ),
    ],
    ids=["malformed", "partial", "guard-after-unsat"],
)
def test_malformed_partial_and_guard_after_unsat_fail_closed(
    tmp_path: Path, mutator: Callable[[dict], None]
) -> None:
    fake = FakePiqd(
        tmp_path / "piqd",
        [("UNSAT", "SAT", "SAT")],
        batch_mutator=mutator,
    )
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, _plan())
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


@pytest.mark.parametrize(
    ("malformed_create", "create_response_subclass", "create_status_subclass"),
    [(True, False, False), (False, True, False), (False, False, True)],
    ids=["malformed-body", "response-subclass", "status-int-subclass"],
)
def test_cleanup_once_on_malformed_create_201(
    tmp_path: Path,
    malformed_create: bool,
    create_response_subclass: bool,
    create_status_subclass: bool,
) -> None:
    fake = FakePiqd(
        tmp_path / "piqd",
        [("SAT",)],
        malformed_create=malformed_create,
        create_response_subclass=create_response_subclass,
        create_status_subclass=create_status_subclass,
    )
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, _plan())
    assert len(fake.created_ids) == 1
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


def test_cleanup_once_on_mid_round_http_failure(tmp_path: Path) -> None:
    fake = FakePiqd(tmp_path / "piqd", [("SAT",)], fail_add=True)
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, _plan())
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


@pytest.mark.parametrize(
    ("receipts_mutator", "journal_suffix"),
    [
        (lambda response: response["receipts"][0].update(base_sha256="f" * 64), b""),
        (None, b"9 0\n"),
    ],
    ids=["receipt-mismatch", "journal-mismatch"],
)
def test_receipt_or_journal_mismatch_fails_after_exactly_one_close(
    tmp_path: Path,
    receipts_mutator: Callable[[dict], None] | None,
    journal_suffix: bytes,
) -> None:
    fake = FakePiqd(
        tmp_path / "piqd",
        [("SAT",)],
        receipts_mutator=receipts_mutator,
        append_journal_on_receipts=journal_suffix,
    )
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, _plan())
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


@pytest.mark.parametrize("receipts_path_fault", ["missing", "symlink"])
def test_receipts_file_path_must_be_stable_rooted_regular_file(
    tmp_path: Path, receipts_path_fault: str
) -> None:
    fake = FakePiqd(
        tmp_path / "piqd",
        [("SAT",)],
        receipts_path_fault=receipts_path_fault,
    )
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, _plan())
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


def test_runner_owned_audits_are_deeply_immutable(tmp_path: Path) -> None:
    result = _run(FakePiqd(tmp_path / "piqd", [("SAT",)]), _plan())

    with pytest.raises(TypeError):
        result.audit["claims"]["global_minimum"] = True
    with pytest.raises(TypeError):
        result.rounds[0].audit["claims"]["solver_attestation"] = True
    assert type(result.audit["round_audit_sha256"]) is tuple
    with pytest.raises(AttributeError):
        result.audit["round_audit_sha256"].append("0" * 64)


def test_max_round_bound_cannot_silently_truncate_a_deletion(tmp_path: Path) -> None:
    fake = FakePiqd(tmp_path / "piqd", [("UNSAT", "UNSAT", "SAT")])
    with pytest.raises(campaign.StatementBankMinimalityRunnerError, match="max_rounds"):
        _run(fake, _plan(), max_rounds=1)
    assert len(fake.created_ids) == 1
    assert len([call for call in fake.calls if call[0] == "DELETE"]) == 1


@pytest.mark.parametrize(
    "kwargs",
    [
        {"conflict_limit": True},
        {"conflict_limit": IntSubclass(LIMIT)},
        {"max_rounds": True},
    ],
)
def test_bool_and_integer_subclass_spoofs_fail_before_session(
    tmp_path: Path, kwargs: dict
) -> None:
    fake = FakePiqd(tmp_path / "piqd", [("SAT",)])
    parameters = {
        "plan": _plan(),
        "solver_name": "cadical",
        "conflict_limit": LIMIT,
        "transport": fake,
        "piqd_data_root": str(fake.root),
        **kwargs,
    }
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        campaign.run_statement_bank_minimality_campaign(**parameters)
    assert fake.created_ids == []


def test_selector_plan_subclass_spoof_fails_before_session(tmp_path: Path) -> None:
    source = _plan()
    spoof = PlanSubclass(source.document, source.dimacs_bytes)
    fake = FakePiqd(tmp_path / "piqd", [("SAT",)])
    with pytest.raises(campaign.StatementBankMinimalityRunnerError):
        _run(fake, spoof)
    assert fake.created_ids == []
