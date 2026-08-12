from __future__ import annotations

import copy
import hashlib
import json
import os
import uuid
from collections.abc import Callable, Mapping
from pathlib import Path
from typing import Any

import pytest

from census.global_confinement import metric_realizability_cvc5_core_miner as legacy
from census.global_confinement import metric_realizability_piqd_core_miner as adapter
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

HERE = Path(__file__).resolve().parents[1]
CURRENT_INPUT = HERE / "metric_realizability_cvc5.json"


class FakePiqd:
    def __init__(
        self,
        *,
        lose_first_solve: bool = False,
        extra_create_field: bool = False,
        extra_solve_field: bool = False,
        solve_status: str = "UNSAT",
        duplicate_core: bool = False,
        duplicate_receipt: bool = False,
    ):
        self.sessions: dict[str, dict[str, Any]] = {}
        self.counter = 0
        self.lose_first_solve = lose_first_solve
        self.lost = False
        self.extra_create_field = extra_create_field
        self.extra_solve_field = extra_solve_field
        self.solve_status = solve_status
        self.duplicate_core = duplicate_core
        self.duplicate_receipt = duplicate_receipt

    def _session(
        self, item: Mapping[str, Any], state: str | None = None
    ) -> dict[str, Any]:
        return {
            "id": item["id"],
            "lane": "smt",
            "state": state or item["state"],
            "solver_name": item["solver"],
            "solver_sha256": "a" * 64,
            "solver_signature": f"{item['solver']} fake-current",
            "protocol_version": 1,
            "journal_path": f"state/sessions/{item['id']}/journal.smt2",
            "created_at": 1,
            "updated_at": 1 + len(item["receipts"]),
            "clauses": len(item["commands"]),
            "max_var": 0,
            "solves": len(item["receipts"]),
            "last_status": item["receipts"][-1]["status"] if item["receipts"] else None,
            "declared_num_vars": None,
            "last_solve_index": len(item["receipts"]) or None,
            "last_assumption_free": (
                not bool(item["receipts"][-1]["assumptions"])
                if item["receipts"]
                else None
            ),
            "last_terminal_unsat": (
                item["receipts"][-1].get("terminal_unsat") if item["receipts"] else None
            ),
            "label": item["label"],
        }

    @staticmethod
    def _route(path: str) -> tuple[str, str]:
        parts = path.split("/")
        return parts[2], "/".join(parts[3:])

    def request_json(
        self, method: str, path: str, body: Mapping[str, object] | None = None
    ) -> neutral.JsonResponse:
        if method == "POST" and path == "/sessions":
            self.counter += 1
            session_id = str(uuid.UUID(int=self.counter))
            assert body is not None
            item = {
                "id": session_id,
                "solver": body["solver"],
                "label": body["label"],
                "state": "live",
                "commands": [],
                "journal": b"",
                "receipts": [],
                "answers": {},
            }
            self.sessions[session_id] = item
            response = self._session(item)
            if self.extra_create_field:
                response["future_field"] = "reject me"
            return neutral.JsonResponse(201, response)
        session_id, suffix = self._route(path)
        item = self.sessions[session_id]
        if method == "POST" and suffix == "assert":
            assert body is not None and body["expect_commands"] == 0
            item["commands"] = list(body["commands"])
            item["journal"] = b"".join(
                command.encode() + b"\n" for command in item["commands"]
            )
            count = len(item["commands"])
            return neutral.JsonResponse(200, {"added": count, "commands": count})
        if method == "GET" and suffix == "receipts":
            receipts = copy.deepcopy(item["receipts"])
            if self.duplicate_receipt and receipts:
                receipts.append(copy.deepcopy(receipts[-1]))
            return neutral.JsonResponse(
                200,
                {
                    "session_id": session_id,
                    "lane": "smt",
                    "journal_path": f"state/sessions/{session_id}/journal.smt2",
                    "receipts_path": f"state/sessions/{session_id}/receipts.jsonl",
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "POST" and suffix == "solve":
            assert body is not None
            request_id = body["request_id"]
            if request_id in item["answers"]:
                replay = copy.deepcopy(item["answers"][request_id])
                replay["replayed"] = True
                return neutral.JsonResponse(200, replay)
            index = len(item["receipts"]) + 1
            answer = {
                "status": self.solve_status,
                "solve_ms": 1,
                "solve_index": index,
                "effective_deadline_ms": neutral.effective_deadline_ms(
                    body["timeout_ms"]
                ),
            }
            if self.solve_status == "UNSAT":
                answer["core"] = [body["assumptions"][0]] * (
                    2 if self.duplicate_core else 1
                )
                answer["terminal_unsat"] = False
            elif self.solve_status == "SAT":
                if body["include_model"]:
                    answer["model"] = (
                        "(model (define-fun x_2 () Real (/ 1 2)) "
                        "(define-fun y_2 () Real 1))"
                    )
                if body["get_values"]:
                    answer["values"] = "((x_2 (/ 1 2)) (y_2 1))"
            elif self.solve_status == "UNKNOWN":
                answer["interrupted_by"] = "daemon_deadline"
            answer["result_sha256"] = neutral.piqd_result_digest(answer)
            response = {**answer, "replayed": False}
            if self.extra_solve_field:
                response["future_field"] = "reject me"
            receipt = {
                "solve_index": index,
                "base_commands": len(item["commands"]),
                "base_bytes": len(item["journal"]),
                "base_sha256": adapter._sha(item["journal"]),
                "solver_signature": f"{item['solver']} fake-current",
                "solver_sha256": "a" * 64,
                "assumptions": list(body["assumptions"]),
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": neutral.effective_deadline_ms(
                    body["timeout_ms"]
                ),
                "include_model": body["include_model"],
                "get_values": list(body["get_values"]),
                **answer,
                "at": index,
                "request_id": request_id,
                "request_sha256": adapter._request_digest(
                    journal=item["journal"],
                    command_count=len(item["commands"]),
                    assumptions=body["assumptions"],
                    timeout_ms=body["timeout_ms"],
                    include_model=body["include_model"],
                    get_values=body["get_values"],
                ),
            }
            item["receipts"].append(receipt)
            item["answers"][request_id] = response
            if self.lose_first_solve and not self.lost:
                self.lost = True
                raise neutral.PiqdTransportLoss("synthetic lost response")
            return neutral.JsonResponse(200, response)
        if method == "DELETE" and not suffix:
            item["state"] = "closed"
            return neutral.JsonResponse(200, self._session(item, "closed"))
        raise AssertionError((method, path, body))

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        assert method == "GET"
        session_id, suffix = self._route(path)
        assert suffix == "smt2"
        return neutral.BytesResponse(200, self.sessions[session_id]["journal"])


def _input_copy(tmp_path: Path) -> Path:
    path = tmp_path / "input.json"
    path.write_bytes(CURRENT_INPUT.read_bytes())
    return path


def _first_unsat_id() -> str:
    source = json.loads(CURRENT_INPUT.read_text())
    return next(
        item["system_id"]
        for item in source["results"]
        if item["status"] == "CVC5_UNSAT"
    )


def _unsat_ids(count: int) -> list[str]:
    source = json.loads(CURRENT_INPUT.read_text())
    return [
        item["system_id"]
        for item in source["results"]
        if item["status"] == "CVC5_UNSAT"
    ][:count]


def _synthetic_sat_input(tmp_path: Path) -> Path:
    source = json.loads(CURRENT_INPUT.read_text())
    result = copy.deepcopy(
        next(item for item in source["results"] if item["status"] == "CVC5_UNSAT")
    )
    result.update(
        {
            "system_id": "0" * 20,
            "n": 3,
            "profile": [1],
            "order": [0, 1, 2],
            "rows": [],
        }
    )
    result["stages"] = [
        {
            "constraint_counts": {},
            "elapsed_sec": 0.0,
            "return_code": 0,
            "stage": "convex-only-relaxation",
            "status": "UNSAT",
        }
    ]
    source["results"] = [result]
    path = tmp_path / "synthetic-sat-input.json"
    path.write_text(json.dumps(source))
    return path


def _rewrite_record_and_manifest(
    output: Path, mutate: Callable[[dict[str, Any]], None]
) -> None:
    result_path = output / "result.json"
    manifest_path = output / "manifest.json"
    result_path.chmod(0o644)
    manifest_path.chmod(0o644)
    record = json.loads(result_path.read_text())
    mutate(record)
    raw = adapter._artifact(record)
    result_path.write_bytes(raw)
    manifest = json.loads(manifest_path.read_text())
    manifest["record_sha256"] = hashlib.sha256(raw).hexdigest()
    manifest["artifacts"]["result.json"].update(
        {"bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()}
    )
    manifest_path.write_bytes(adapter._artifact(manifest))
    result_path.chmod(0o444)
    manifest_path.chmod(0o444)


def test_guarded_journal_and_total_assumptions() -> None:
    source = json.loads(CURRENT_INPUT.read_text())
    raw = next(item for item in source["results"] if item["status"] == "CVC5_UNSAT")
    system = {
        key: raw[key]
        for key in ("system_id", "n", "profile", "order", "rows", "sources")
    }
    commands, journal = adapter._build_journal(system, "cvc5")
    assert commands[0] == "(set-option :nl-cov true)"
    assert b"(check-sat)" not in journal
    plan = adapter._Plan(
        "test", "full-convex", (0,), ((0, system["rows"][0]["support"][1]),), 10
    )
    assumptions = adapter._assumptions(system, plan)
    assert len(assumptions) == 1 + len(system["rows"]) + sum(
        len(row["support"]) - 1 for row in system["rows"]
    )
    assert "p97_full_stage" in assumptions
    assert "(not p97_row_001)" in assumptions


def test_sat_readback_is_replayed_over_exact_rationals() -> None:
    system = {"n": 3, "order": [0, 1, 2], "rows": []}
    plan = adapter._Plan("unit-sat", "convex-only-relaxation", (), (), 10)
    replay = adapter._semantic_replay(
        system,
        plan,
        "(model (define-fun x_2 () Real (/ 1 2)) (define-fun y_2 () Real 1))",
        "((x_2 (/ 1 2)) (y_2 1))",
    )
    assert replay["accepted"] is True
    assert replay["exact_rational"] is True
    assert replay["checks"] == {
        "row_equalities": 0,
        "exact_exclusions": 0,
        "distinctness": 3,
        "convex_order": 3,
    }


def test_full_fake_lane_idempotent_retry_and_offline_validation(tmp_path: Path) -> None:
    output = tmp_path / "published"
    record = adapter.run(
        _input_copy(tmp_path),
        output,
        FakePiqd(lose_first_solve=True),
        deletion_timeout_ms=10,
        validation_timeout_ms=20,
        system_ids=[_first_unsat_id()],
    )
    assert record["classification"] == "PIQD_AUTHENTICATED_DIAGNOSTIC_NOT_P97_CLOSURE"
    assert record["profile"]["workers"] == 1
    assert record["profile"]["local_fallback"] is False
    checked = adapter.validate_published_output(output)
    assert checked == record
    result = checked["results"][0]
    assert result["claims"]["proof"] is False
    assert result["cvc5_engine"]["requests"][0]["include_model"] is True
    assert result["z3_engine"]["requests"][0]["include_model"] is False
    assert result["z3_engine"]["requests"][0]["get_values"] == []
    assert all(
        item["native_named_core_promotion"] is False
        for item in result["row_deletion_attempts"]
    )


def test_fake_piqd_sat_publication_has_exact_cvc5_replay(tmp_path: Path) -> None:
    output = tmp_path / "published"
    record = adapter.run(
        _synthetic_sat_input(tmp_path),
        output,
        FakePiqd(solve_status="SAT"),
        deletion_timeout_ms=10,
        validation_timeout_ms=20,
    )
    assert adapter.validate_published_output(output) == record
    cvc5_evidence = record["results"][0]["atom_validation"]
    assert cvc5_evidence["status"] == "SAT"
    assert cvc5_evidence["semantic_replay"]["accepted"] is True
    assert cvc5_evidence["semantic_replay"]["exact_rational"] is True


def test_unknown_is_published_as_inconclusive_diagnostic(tmp_path: Path) -> None:
    output = tmp_path / "published"
    record = adapter.run(
        _synthetic_sat_input(tmp_path),
        output,
        FakePiqd(solve_status="UNKNOWN"),
        deletion_timeout_ms=10,
        validation_timeout_ms=20,
    )
    assert adapter.validate_published_output(output) == record
    assert record["results"][0]["atom_validation"]["status"] == "UNKNOWN"
    assert record["results"][0]["crosscheck_status"] == "CORE_NOT_REVALIDATED"


def test_error_response_makes_cli_inconclusive(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    fake = FakePiqd(solve_status="ERROR")
    monkeypatch.setattr(neutral, "UrllibPiqdTransport", lambda *args, **kwargs: fake)
    code = adapter.main(
        [
            "--input",
            str(_synthetic_sat_input(tmp_path)),
            "--out",
            str(tmp_path / "published"),
            "--deletion-timeout-ms",
            "10",
            "--validation-timeout-ms",
            "20",
        ]
    )
    assert code == 2
    assert json.loads(capsys.readouterr().out)["status"] == "INCONCLUSIVE"


def test_default_cli_dispatches_to_piqd_and_legacy_requires_flag(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    piqd_calls: list[list[str]] = []
    monkeypatch.setattr(
        adapter, "main", lambda args: piqd_calls.append(list(args)) or 23
    )
    assert legacy.main(["--check", "bundle"]) == 23
    assert piqd_calls == [["--check", "bundle"]]

    class LegacySelected(Exception):
        pass

    def stop_legacy(args: list[str]) -> None:
        assert args == ["--input", "source.json"]
        raise LegacySelected

    monkeypatch.setattr(legacy, "_parse_args", stop_legacy)
    with pytest.raises(LegacySelected):
        legacy.main(["--legacy-local", "--input", "source.json"])


def test_fake_current_session_extension_fails_closed(tmp_path: Path) -> None:
    with pytest.raises(adapter.MetricPiqdCoreError, match="non-current field set"):
        adapter.run(
            _input_copy(tmp_path),
            tmp_path / "published",
            FakePiqd(extra_create_field=True),
            deletion_timeout_ms=10,
            validation_timeout_ms=20,
            system_ids=[_first_unsat_id()],
        )


def test_fake_current_solve_extension_fails_closed(tmp_path: Path) -> None:
    with pytest.raises(adapter.MetricPiqdCoreError, match="non-current field set"):
        adapter.run(
            _input_copy(tmp_path),
            tmp_path / "published",
            FakePiqd(extra_solve_field=True),
            deletion_timeout_ms=10,
            validation_timeout_ms=20,
            system_ids=[_first_unsat_id()],
        )


@pytest.mark.parametrize("fault", ["duplicate_core", "duplicate_receipt"])
def test_duplicate_piqd_evidence_fails_closed(tmp_path: Path, fault: str) -> None:
    with pytest.raises(adapter.MetricPiqdCoreError):
        adapter.run(
            _synthetic_sat_input(tmp_path),
            tmp_path / "published",
            FakePiqd(**{fault: True}),
            deletion_timeout_ms=10,
            validation_timeout_ms=20,
        )


def test_fake_current_input_extension_fails_closed(tmp_path: Path) -> None:
    source = json.loads(CURRENT_INPUT.read_text())
    source["future_field"] = True
    path = tmp_path / "input.json"
    path.write_text(json.dumps(source))
    with pytest.raises(adapter.MetricPiqdCoreError, match="top-level schema"):
        adapter.run(
            path,
            tmp_path / "published",
            FakePiqd(),
            deletion_timeout_ms=10,
            validation_timeout_ms=20,
        )


def test_fake_current_nested_input_extension_fails_closed(tmp_path: Path) -> None:
    source = json.loads(CURRENT_INPUT.read_text())
    source["smoke"]["sat"]["future_field"] = True
    path = tmp_path / "input.json"
    path.write_text(json.dumps(source))
    with pytest.raises(adapter.MetricPiqdCoreError, match="non-current field set"):
        adapter.run(
            path,
            tmp_path / "published",
            FakePiqd(),
            deletion_timeout_ms=10,
            validation_timeout_ms=20,
        )


def test_standalone_validator_rejects_tampering(tmp_path: Path) -> None:
    output = tmp_path / "published"
    adapter.run(
        _input_copy(tmp_path),
        output,
        FakePiqd(),
        deletion_timeout_ms=10,
        validation_timeout_ms=20,
        system_ids=[_first_unsat_id()],
    )
    artifact = output / "result.json"
    artifact.chmod(0o644)
    artifact.write_bytes(artifact.read_bytes() + b" ")
    artifact.chmod(0o444)
    with pytest.raises(adapter.MetricPiqdCoreError, match="digest mismatch"):
        adapter.validate_published_output(output)


@pytest.mark.parametrize("mutation", ["duplicate", "missing", "crossed"])
def test_resigned_result_id_set_must_exactly_match_selection(
    tmp_path: Path, mutation: str
) -> None:
    output = tmp_path / "published"
    adapter.run(
        _input_copy(tmp_path),
        output,
        FakePiqd(),
        deletion_timeout_ms=10,
        validation_timeout_ms=20,
        system_ids=_unsat_ids(2),
    )

    def mutate(record: dict[str, Any]) -> None:
        if mutation == "duplicate":
            record["results"].append(copy.deepcopy(record["results"][0]))
        elif mutation == "missing":
            record["results"].pop()
        else:
            record["results"].reverse()

    _rewrite_record_and_manifest(output, mutate)
    with pytest.raises(adapter.MetricPiqdCoreError, match="ordered selection"):
        adapter.validate_published_output(output)


def test_capture_rejects_oversize_before_read(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "oversize.json"
    path.write_bytes(b"12345")
    monkeypatch.setattr(adapter, "MAX_INPUT_BYTES", 4)
    monkeypatch.setattr(
        adapter,
        "_read_bounded",
        lambda _descriptor: pytest.fail("oversize input was read"),
    )
    with pytest.raises(adapter.MetricPiqdCoreError, match="byte cap"):
        adapter._capture(path)


def test_bounded_reader_stops_at_cap_plus_one(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "source"
    path.write_bytes(b"123456789")
    monkeypatch.setattr(adapter, "MAX_INPUT_BYTES", 4)
    descriptor = os.open(path, os.O_RDONLY)
    try:
        assert adapter._read_bounded(descriptor) == b"12345"
    finally:
        os.close(descriptor)


def test_capture_rejects_symlink_hardlink_and_nonregular(tmp_path: Path) -> None:
    source = tmp_path / "source.json"
    source.write_bytes(b"{}")
    symlink = tmp_path / "symlink.json"
    symlink.symlink_to(source)
    with pytest.raises(adapter.MetricPiqdCoreError, match="singly-linked regular"):
        adapter._capture(symlink)

    hardlink = tmp_path / "hardlink.json"
    os.link(source, hardlink)
    with pytest.raises(adapter.MetricPiqdCoreError, match="singly-linked regular"):
        adapter._capture(source)

    fifo = tmp_path / "fifo"
    os.mkfifo(fifo)
    with pytest.raises(adapter.MetricPiqdCoreError, match="singly-linked regular"):
        adapter._capture(fifo)


def test_capture_rejects_mutation_at_read_boundary(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source = tmp_path / "source.json"
    source.write_bytes(b"{}")
    original = adapter._read_bounded

    def mutate_after_read(descriptor: int) -> bytes:
        raw = original(descriptor)
        with source.open("ab") as handle:
            handle.write(b" ")
        return raw

    monkeypatch.setattr(adapter, "_read_bounded", mutate_after_read)
    with pytest.raises(adapter.MetricPiqdCoreError, match="changed"):
        adapter._capture(source)
