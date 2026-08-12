from __future__ import annotations

import hashlib
import json
import uuid
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_survivor_metric_driver as driver
from census.p97_search import phase3_survivor_metric_piqd as subject

TEST_SOURCE = (
    driver.ROOT
    / "census/p97_search/tests/fixtures/phase3_structural_survivors_100_current"
)


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
    stale: bool = False,
    crossed: bool = False,
) -> dict[str, object]:
    solver = "cvc5" if crossed else "z3"
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": solver,
        "solver_sha256": _sha(f"binary:{solver}".encode()),
        "solver_signature": f"{solver} survivor-test-current-schema",
        "protocol_version": 1,
        "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + solves,
        "clauses": commands,
        "max_var": 0,
        "solves": 1 if stale and solves == 0 else solves,
        "last_status": "UNKNOWN" if stale and solves == 0 else status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 and not stale else max(1, solves),
        "last_assumption_free": None if solves == 0 and not stale else True,
        "last_terminal_unsat": None if solves == 0 and not stale else terminal_unsat,
        "label": label,
    }


class FakeCurrentPiqd:
    """Adversarial in-memory fake for the maintained PIQD session schema."""

    def __init__(
        self,
        statuses: Sequence[str],
        *,
        values: str | None = None,
        receipt_tamper: bool = False,
        stale_create: bool = False,
        crossed_create: bool = False,
        reuse_session_id: bool = False,
    ) -> None:
        self.statuses = list(statuses)
        self.values = values
        self.receipt_tamper = receipt_tamper
        self.stale_create = stale_create
        self.crossed_create = crossed_create
        self.reuse_session_id = reuse_session_id
        self.sessions: dict[str, dict[str, Any]] = {}
        self.created_ids: list[str] = []
        self.deleted_ids: list[str] = []
        self.stage_commands: list[list[str]] = []
        self.calls: list[tuple[str, str]] = []

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        self.calls.append((method, path))
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert body["solver"] == "z3" and body["lane"] == "smt"
            session_id = str(
                uuid.UUID(int=1 if self.reuse_session_id else len(self.created_ids) + 1)
            )
            self.sessions[session_id] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "answer": None,
                "receipt": None,
            }
            self.created_ids.append(session_id)
            return neutral.JsonResponse(
                201,
                _session(
                    session_id,
                    str(body["label"]),
                    stale=self.stale_create,
                    crossed=self.crossed_create,
                ),
            )

        session_id, suffix = self._route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            commands = list(body["commands"])
            assert all(type(command) is str for command in commands)
            data["commands"] = commands
            data["journal"] = b"".join(command.encode() + b"\n" for command in commands)
            self.stage_commands.append(commands)
            return neutral.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            assert set(body) == {
                "assumptions",
                "timeout_ms",
                "include_model",
                "get_values",
            }
            assert body["assumptions"] == [] and body["include_model"] is True
            assert len(body["get_values"]) == 20
            status = self.statuses.pop(0)
            answer = self._answer(status, list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            deadline = body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
            response = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": digest,
                "effective_deadline_ms": deadline,
            }
            data["answer"] = answer
            data["receipt"] = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": (
                    "e" * 64 if self.receipt_tamper else _sha(data["journal"])
                ),
                "solver_signature": "z3 survivor-test-current-schema",
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
            return neutral.JsonResponse(200, response)
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
                    "receipts_path": f"/daemon/sessions/{session_id}/receipts.jsonl",
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
        self.calls.append((method, path))
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


def _running_snapshot(tmp_path: Path) -> Path:
    source_dir = tmp_path / "source"
    source_dir.mkdir()
    survivor = TEST_SOURCE.joinpath("survivors.jsonl").read_bytes().splitlines()[0]
    survivor_bytes = survivor + b"\n"
    (source_dir / "survivors.jsonl").write_bytes(survivor_bytes)
    manifest = driver._strict_json(TEST_SOURCE / "manifest.json")
    manifest["status"] = "RUNNING"
    manifest["counts"]["structural_survivor_count"] = 1
    manifest["counts"]["unclassified_raw_sat_count"] = 17
    manifest["artifact_hashes"]["survivors.jsonl"] = _sha(survivor_bytes)
    for relative in driver.SOURCE_DEPENDENCIES:
        manifest["configuration"]["dependency_sha256"][relative] = driver._sha256_file(
            driver.ROOT / relative
        )
    manifest.pop("manifest_sha256")
    manifest["manifest_sha256"] = driver._sha256_value(manifest)
    (source_dir / "live-manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    return source_dir


def _rewrite_journal_and_manifest(source_dir: Path, journal: bytes) -> None:
    (source_dir / "survivors.jsonl").write_bytes(journal)
    manifest_path = source_dir / "live-manifest.json"
    manifest = driver._strict_json(manifest_path)
    manifest["artifact_hashes"]["survivors.jsonl"] = _sha(journal)
    manifest.pop("manifest_sha256")
    manifest["manifest_sha256"] = driver._sha256_value(manifest)
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")


def _binding(tmp_path: Path) -> subject.SourceBinding:
    return subject.capture_source(
        _running_snapshot(tmp_path),
        case_index=0,
        expected_count=1,
        running_snapshot=True,
    )


def test_exact_record_bytes_and_ingress_digests_are_preserved(tmp_path: Path) -> None:
    source = _running_snapshot(tmp_path)
    journal = (source / "survivors.jsonl").read_bytes()
    manifest_bytes = (source / "live-manifest.json").read_bytes()
    binding = subject.capture_source(
        source, case_index=0, expected_count=1, running_snapshot=True
    )

    assert binding.survivor_record_bytes == journal
    assert binding.survivors_bytes == journal
    assert binding.manifest_bytes == manifest_bytes
    assert binding.manifest_sha256 == _sha(manifest_bytes)
    assert binding.survivors_sha256 == _sha(journal)
    assert binding.manifest_survivors_sha256 == binding.survivors_sha256
    assert binding.manifest_identity != binding.survivors_identity


def test_parsed_equal_manifest_substitution_during_load_fails_closed(
    tmp_path: Path, monkeypatch: Any
) -> None:
    source = _running_snapshot(tmp_path)
    manifest_path = source / "live-manifest.json"
    original_load_source = driver.load_source

    def load_then_substitute(*args: object, **kwargs: object) -> object:
        loaded = original_load_source(*args, **kwargs)
        manifest = driver._strict_json(manifest_path)
        manifest_path.write_bytes(
            json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode() + b"\n"
        )
        return loaded

    monkeypatch.setattr(driver, "load_source", load_then_substitute)
    with pytest.raises(
        subject.SurvivorMetricPiqdError,
        match="changed during authenticated ingress",
    ):
        subject.capture_sources(source, expected_count=1, running_snapshot=True)


def test_authenticated_same_object_jsonl_bytes_must_be_canonical(
    tmp_path: Path,
) -> None:
    source = _running_snapshot(tmp_path)
    record = json.loads((source / "survivors.jsonl").read_bytes())
    alternate = json.dumps(record, sort_keys=True, separators=(", ", ": ")).encode()
    _rewrite_journal_and_manifest(source, alternate + b"\n")

    with pytest.raises(subject.SurvivorMetricPiqdError, match="not canonical JSON"):
        subject.capture_sources(source, expected_count=1, running_snapshot=True)


def test_authenticated_crlf_journal_fails_closed(tmp_path: Path) -> None:
    source = _running_snapshot(tmp_path)
    journal = (source / "survivors.jsonl").read_bytes().replace(b"\n", b"\r\n")
    _rewrite_journal_and_manifest(source, journal)

    with pytest.raises(subject.SurvivorMetricPiqdError, match="never CRLF"):
        subject.capture_sources(source, expected_count=1, running_snapshot=True)


@pytest.mark.parametrize(
    ("mutation", "error"),
    [
        (lambda payload: payload.removesuffix(b"\n"), "end in an exact LF"),
        (lambda payload: payload + b"\n", "line count changed"),
    ],
    ids=["missing-final-lf", "fabricated-blank-final-lf"],
)
def test_non_exact_final_lf_policy_fails_closed(
    tmp_path: Path, mutation: Any, error: str
) -> None:
    source = _running_snapshot(tmp_path)
    journal = mutation((source / "survivors.jsonl").read_bytes())
    _rewrite_journal_and_manifest(source, journal)

    with pytest.raises(subject.SurvivorMetricPiqdError, match=error):
        subject.capture_sources(source, expected_count=1, running_snapshot=True)


def test_post_load_journal_replacement_fails_closed(
    tmp_path: Path, monkeypatch: Any
) -> None:
    source = _running_snapshot(tmp_path)
    journal_path = source / "survivors.jsonl"
    original_load_source = driver.load_source

    def load_then_replace(*args: object, **kwargs: object) -> object:
        loaded = original_load_source(*args, **kwargs)
        journal = journal_path.read_bytes()
        journal_path.write_bytes(journal.removesuffix(b"\n") + b" \n")
        return loaded

    monkeypatch.setattr(driver, "load_source", load_then_replace)
    with pytest.raises(
        subject.SurvivorMetricPiqdError,
        match="changed during authenticated ingress",
    ):
        subject.capture_sources(source, expected_count=1, running_snapshot=True)


def test_final_source_inode_gate_precedes_publication_and_preserves_hostile_path(
    tmp_path: Path,
) -> None:
    source = _running_snapshot(tmp_path)
    binding = subject.capture_source(
        source, case_index=0, expected_count=1, running_snapshot=True
    )
    journal_path = source / "survivors.jsonl"
    output = tmp_path / "published"
    sentinel = output / "hostile.txt"

    class ReplaceAfterFinalQuery(FakeCurrentPiqd):
        def request_json(
            self,
            method: str,
            path: str,
            body: Mapping[str, object] | None = None,
        ) -> neutral.JsonResponse:
            response = super().request_json(method, path, body)
            if method == "DELETE" and path.startswith("/sessions/"):
                replacement = source / "replacement-survivors.jsonl"
                replacement.write_bytes(journal_path.read_bytes())
                replacement.replace(journal_path)
                output.mkdir()
                sentinel.write_text("hostile-preexisting\n")
            return response

    fake = ReplaceAfterFinalQuery(["UNSAT"])
    with pytest.raises(
        subject.SurvivorMetricPiqdError,
        match="source changed after authentication",
    ):
        subject.run_staged_order(
            binding,
            binding.case.orders[0],
            timeout_s=1,
            transport=fake,
            output_directory=output,
        )

    assert fake.created_ids == fake.deleted_ids
    assert len(fake.created_ids) == 1
    assert len(fake.calls) == 7
    assert sentinel.read_text() == "hostile-preexisting\n"
    assert list(output.iterdir()) == [sentinel]


def test_unknown_full_uses_fresh_convex_only_and_validates_offline(
    tmp_path: Path,
) -> None:
    binding = _binding(tmp_path)
    fake = FakeCurrentPiqd(["UNKNOWN", "UNKNOWN", "UNSAT"])
    output = tmp_path / "published"

    result = subject.run_staged_order(
        binding,
        binding.case.orders[0],
        timeout_s=1,
        transport=fake,
        output_directory=output,
    )

    assert [stage["stage"] for stage in result["stages"]] == list(subject.STAGES)
    assert result["status"] == "UNSAT"
    assert result["decisive_stage"] == "convex-only-relaxation"
    assert result["stages"][-1]["classification"] == (
        "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    )
    assert len(fake.created_ids) == len(set(fake.created_ids)) == 3
    assert fake.deleted_ids == fake.created_ids
    assert result["claims"]["proof"] is False
    assert result["local_fallback"] is False
    assert (
        subject.validate_published_output(output, source_dir=binding.source_dir)
        == result
    )


def test_driver_default_route_is_complete_sequential_piqd(tmp_path: Path) -> None:
    source = _running_snapshot(tmp_path)
    fake = FakeCurrentPiqd(["UNSAT"] * driver.ORDER_COUNT)
    output = tmp_path / "driver-output"
    custody = tmp_path / "piqd-custody"

    manifest = driver.run_driver(
        source_dir=source,
        out_dir=output,
        workers=1,
        timeout_s=1,
        expected_count=1,
        running_snapshot=True,
        piqd_transport=fake,
        piqd_output_directory=custody,
    )

    assert manifest["configuration"]["solver_route"] == "piqd-z3-qfnra"
    assert manifest["configuration"]["requested_solver_route"] == "piqd"
    assert manifest["configuration"]["workers"] == 1
    assert manifest["configuration"]["legacy_local_z3_explicit"] is False
    assert manifest["configuration"]["local_fallback"] is False
    assert len(fake.created_ids) == len(fake.deleted_ids) == driver.ORDER_COUNT
    records = driver._strict_jsonl(output / "results.jsonl")
    assert len(records) == 1
    assert len(records[0]["convexity_order"]["results"]) == driver.ORDER_COUNT
    assert all(
        result["backend_result"]["claims"]["proof"] is False
        for result in records[0]["convexity_order"]["results"]
    )


@pytest.mark.parametrize(
    ("statuses", "expected_stages"),
    [
        (["UNSAT"], ["exact-metric-relaxation"]),
        (["UNKNOWN", "UNSAT"], ["exact-metric-relaxation", "full-convex"]),
    ],
)
def test_terminal_stage_never_submits_convex_only(
    tmp_path: Path, statuses: list[str], expected_stages: list[str]
) -> None:
    binding = _binding(tmp_path)
    fake = FakeCurrentPiqd(statuses)
    result = subject.run_staged_order(
        binding,
        binding.case.orders[0],
        timeout_s=1,
        transport=fake,
        output_directory=tmp_path / "published",
    )

    assert [stage["stage"] for stage in result["stages"]] == expected_stages
    assert len(fake.created_ids) == len(expected_stages)


@pytest.mark.parametrize(
    "fake",
    [
        FakeCurrentPiqd(["UNSAT"], receipt_tamper=True),
        FakeCurrentPiqd(["UNSAT"], stale_create=True),
        FakeCurrentPiqd(["UNSAT"], crossed_create=True),
    ],
)
def test_adversarial_current_schema_identity_and_receipt_fail_closed(
    tmp_path: Path, fake: FakeCurrentPiqd
) -> None:
    binding = _binding(tmp_path)
    with pytest.raises(neutral.SmtSourceAdapterError):
        subject.run_staged_order(
            binding,
            binding.case.orders[0],
            timeout_s=1,
            transport=fake,
            output_directory=tmp_path / "published",
        )


def test_sat_without_exact_atom_replay_is_not_accepted(tmp_path: Path) -> None:
    binding = _binding(tmp_path)
    fake = FakeCurrentPiqd(["SAT"])

    result = subject.run_staged_order(
        binding,
        binding.case.orders[0],
        timeout_s=1,
        transport=fake,
        output_directory=tmp_path / "published",
    )

    assert result["status"] == "UNKNOWN"
    assert result["decisive_stage"] is None
    assert result["stages"][0]["classification"] == "INCONCLUSIVE_NO_VERDICT"
    assert result["stages"][0]["engine"]["effective_status"] == (
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    )
    assert len(fake.created_ids) == 1


def test_route_gate_precedes_source_and_local_pool_resolution(tmp_path: Path) -> None:
    with pytest.raises(driver.SurvivorMetricError, match="requires workers=1"):
        driver.run_driver(
            source_dir=tmp_path / "absent-source",
            out_dir=tmp_path / "absent-output",
            workers=2,
            timeout_s=1,
        )


def test_cli_defaults_to_sequential_piqd() -> None:
    args = driver._parse_args([])
    assert args.solver_route == "piqd"
    assert args.workers == 1


def test_existing_custody_root_is_never_reused(tmp_path: Path) -> None:
    occupied = tmp_path / "occupied"
    occupied.mkdir()
    with pytest.raises(
        subject.SurvivorMetricPiqdError, match="cannot create PIQD custody root"
    ):
        subject.create_output_root(occupied)


def test_offline_validator_rejects_post_publication_tamper(tmp_path: Path) -> None:
    binding = _binding(tmp_path)
    output = tmp_path / "published"
    subject.run_staged_order(
        binding,
        binding.case.orders[0],
        timeout_s=1,
        transport=FakeCurrentPiqd(["UNSAT"]),
        output_directory=output,
    )
    target = output / "00-exact-metric-relaxation" / "stage-result.json"
    target.write_bytes(target.read_bytes() + b" ")

    with pytest.raises(subject.SurvivorMetricPiqdError):
        subject.validate_published_output(output, source_dir=binding.source_dir)


def test_partial_immutable_publication_is_cleaned_and_baseexception_propagates(
    tmp_path: Path, monkeypatch: Any
) -> None:
    target = tmp_path / "artifact.json"

    class PublicationAbort(BaseException):
        pass

    def abort_write(_descriptor: int, _payload: object) -> int:
        raise PublicationAbort

    monkeypatch.setattr(driver.os, "write", abort_write)
    with pytest.raises(PublicationAbort):
        driver._immutable_bytes(target, b"payload")
    assert not target.exists()


def test_unexpected_baseexception_is_not_converted(monkeypatch: Any) -> None:
    def interrupt(**_kwargs: object) -> dict[str, object]:
        raise KeyboardInterrupt("stop")

    monkeypatch.setattr(driver, "run_driver", interrupt)
    with pytest.raises(KeyboardInterrupt, match="stop"):
        driver.main([])
