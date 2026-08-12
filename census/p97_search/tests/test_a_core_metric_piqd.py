from __future__ import annotations

import hashlib
import json
import uuid
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import a_core_metric_driver as driver
from census.p97_search import a_core_metric_piqd as subject
from census.p97_search import phase3_piqd_smt_source_adapter as neutral


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _session(
    session_id: str,
    label: str,
    *,
    state: str = "live",
    commands: int = 0,
    solves: int = 0,
    status: str | None = None,
    terminal_unsat: bool | None = None,
) -> dict[str, object]:
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": "z3",
        "solver_sha256": _sha(b"binary:z3"),
        "solver_signature": "z3 a-core-fake-current-schema",
        "protocol_version": 1,
        "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + solves,
        "clauses": commands,
        "max_var": 0,
        "solves": solves,
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 else solves,
        "last_assumption_free": None if solves == 0 else True,
        "last_terminal_unsat": None if solves == 0 else terminal_unsat,
        "label": label,
    }


class FakeCurrentPiqd:
    """One-process in-memory fake for the maintained PIQD HTTP contract."""

    def __init__(self, statuses: Sequence[str], *, values: str | None = None) -> None:
        self.statuses = list(statuses)
        self.values = values
        self.sessions: dict[str, dict[str, Any]] = {}
        self.created_ids: list[str] = []
        self.deleted_ids: list[str] = []

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert body["solver"] == "z3" and body["lane"] == "smt"
            session_id = str(uuid.UUID(int=len(self.created_ids) + 1))
            self.sessions[session_id] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "answer": None,
                "receipt": None,
            }
            self.created_ids.append(session_id)
            return neutral.JsonResponse(201, _session(session_id, str(body["label"])))

        session_id, suffix = self._route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            commands = list(body["commands"])
            data["commands"] = commands
            data["journal"] = b"".join(
                str(command).encode() + b"\n" for command in commands
            )
            return neutral.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            status = self.statuses.pop(0)
            answer = self._answer(status, list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            deadline = body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
            data["answer"] = answer
            data["receipt"] = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "z3 a-core-fake-current-schema",
                "solver_sha256": _sha(b"binary:z3"),
                "assumptions": [],
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": deadline,
                "include_model": True,
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": digest,
                "at": 14,
            }
            return neutral.JsonResponse(
                200,
                {
                    **answer,
                    "solve_ms": 3,
                    "solve_index": 1,
                    "result_sha256": digest,
                    "effective_deadline_ms": deadline,
                },
            )
        if method == "GET" and suffix == "":
            answer = data["answer"] or {}
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    commands=len(data["commands"]),
                    solves=0 if not answer else 1,
                    status=answer.get("status"),
                    terminal_unsat=answer.get("terminal_unsat"),
                ),
            )
        if method == "GET" and suffix == "/receipts":
            receipts = [] if data["receipt"] is None else [data["receipt"]]
            return neutral.JsonResponse(
                200,
                {
                    "session_id": session_id,
                    "lane": "smt",
                    "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
                    "receipts_path": (f"/daemon/sessions/{session_id}/receipts.jsonl"),
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "DELETE" and suffix == "":
            answer = data["answer"] or {}
            self.deleted_ids.append(session_id)
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    state="closed",
                    commands=len(data["commands"]),
                    solves=0 if not answer else 1,
                    status=answer.get("status"),
                    terminal_unsat=answer.get("terminal_unsat"),
                ),
            )
        raise AssertionError(f"unexpected fake route {method} {path}")

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        session_id, suffix = self._route(path)
        assert method == "GET" and suffix == "/smt2"
        return neutral.BytesResponse(200, self.sessions[session_id]["journal"])

    def _route(self, path: str) -> tuple[str, str]:
        pieces = path.split("/")
        assert len(pieces) in {3, 4} and pieces[:2] == ["", "sessions"]
        session_id = pieces[2]
        assert session_id in self.sessions
        return session_id, "" if len(pieces) == 3 else f"/{pieces[3]}"

    def _answer(self, status: str, variable_ids: list[str]) -> dict[str, object]:
        if status == "SAT":
            values = self.values or (
                "(" + " ".join(f"({item} 0)" for item in variable_ids) + ")"
            )
            return {"status": "SAT", "model": "(model)", "values": values}
        if status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        assert status == "UNKNOWN"
        return {"status": "UNKNOWN"}


@pytest.fixture(scope="module")
def a2_binding() -> subject.SourceBinding:
    return subject.capture_source(driver.A_CORE_DIR, run="base+P+A2")


def test_prepare_stage_preserves_canonical_rows_order_and_profile(
    a2_binding: subject.SourceBinding,
) -> None:
    prepared = subject.prepare_stage(
        a2_binding, 0, "exact-metric-relaxation", timeout_ms=37
    )

    system = prepared.source_record["system"]
    assert system["rows"] == json.loads(
        json.dumps(a2_binding.adaptation["metric_rows"])
    )
    assert system["order"] == a2_binding.adaptation["orders"][0]
    assert prepared.source_record["solver_profile"] == {
        "schema": subject.PROFILE_SCHEMA,
        "solver": "z3",
        "lane": "smt",
        "logic": "QF_NRA",
        "fresh_session": True,
        "solve_count": 1,
        "workers": 1,
        "timeout_ms": 37,
        "local_fallback": False,
    }


def test_proofless_unsat_is_single_stage_diagnostic_and_offline_validates(
    tmp_path: Path, a2_binding: subject.SourceBinding
) -> None:
    fake = FakeCurrentPiqd(["UNSAT"])
    output = tmp_path / "unsat-order"
    result = subject.run_staged_order(
        a2_binding,
        0,
        timeout_s=0.05,
        transport=fake,
        output_directory=output,
    )

    assert result["status"] == "UNSAT"
    assert result["claims"]["proof"] is False
    assert [stage["classification"] for stage in result["stages"]] == [
        "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    ]
    assert fake.created_ids == fake.deleted_ids
    assert subject.validate_published_output(output) == result


def test_unknown_full_adds_convex_only_with_three_fresh_sessions(
    tmp_path: Path, a2_binding: subject.SourceBinding
) -> None:
    fake = FakeCurrentPiqd(["UNKNOWN", "UNKNOWN", "UNSAT"])
    output = tmp_path / "three-stages"
    result = subject.run_staged_order(
        a2_binding,
        1,
        timeout_s=0.05,
        transport=fake,
        output_directory=output,
    )

    assert [stage["stage"] for stage in result["stages"]] == list(subject.STAGES)
    assert len(set(fake.created_ids)) == 3
    assert fake.created_ids == fake.deleted_ids
    assert subject.validate_published_output(output) == result


def test_unreplayed_sat_is_inconclusive_and_does_not_advance(
    tmp_path: Path, a2_binding: subject.SourceBinding
) -> None:
    fake = FakeCurrentPiqd(["SAT"])
    result = subject.run_staged_order(
        a2_binding,
        2,
        timeout_s=0.05,
        transport=fake,
        output_directory=tmp_path / "bad-sat",
    )

    assert result["status"] == "UNKNOWN"
    assert result["stages"][0]["status"] == "SAT"
    assert result["stages"][0]["effective_status"] == (
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    )
    assert len(fake.created_ids) == 1


def test_driver_default_piqd_route_is_selected_one_worker_no_fallback(
    tmp_path: Path,
) -> None:
    fake = FakeCurrentPiqd(["UNSAT"])
    output = tmp_path / "driver.json"
    custody = tmp_path / "driver-custody"
    artifact = driver.run_current_physical_leaves(
        output_path=output,
        timeout_s=0.05,
        piqd_transport=fake,
        piqd_output_directory=custody,
        run="base+P+A2",
        order_index=0,
    )

    assert artifact["parameters"]["solver_route"] == "piqd-z3-qfnra"
    assert artifact["parameters"]["local_fallback"] is False
    assert artifact["parameters"]["workers"] == 1
    assert artifact["totals"]["probe_orders"] == 1
    assert artifact["leaves"][0]["order_results"][0]["status"] == "UNSAT"
    assert (
        subject.validate_published_output(custody / "base-P-A2" / "order-00000")[
            "status"
        ]
        == "UNSAT"
    )


def test_create_once_and_exact_native_path_fail_closed(
    tmp_path: Path, a2_binding: subject.SourceBinding
) -> None:
    output = tmp_path / "create-once"
    subject.run_staged_order(
        a2_binding,
        3,
        timeout_s=0.05,
        transport=FakeCurrentPiqd(["UNSAT"]),
        output_directory=output,
    )
    with pytest.raises(Exception, match="exists|reserve|publish"):
        subject.run_staged_order(
            a2_binding,
            3,
            timeout_s=0.05,
            transport=FakeCurrentPiqd(["UNSAT"]),
            output_directory=output,
        )

    class PathSubclass(type(Path())):
        pass

    with pytest.raises(subject.ACoreMetricPiqdError, match="exact platform Path"):
        subject.validate_published_output(PathSubclass(output))
