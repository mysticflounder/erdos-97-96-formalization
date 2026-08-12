from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import shutil
import sys
import uuid
from collections.abc import Mapping
from pathlib import Path
from typing import Any

import pytest

from census.global_confinement import pinned_generalm_piqd as subject
from census.p97_search import phase3_piqd_smt_source_adapter as neutral


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


class FakeShadow:
    blocks = (
        (0, 1, 2),
        (3, 4, 5),
        (6, 7, 8),
        (0, 3, 6),
        (1, 4, 7),
        (2, 5, 8),
        (0, 4, 8),
        (1, 5, 6),
    )

    def candidate_masks_for(self, sstar: str, center: str) -> list[int]:
        assert sstar.startswith("sstar-") and center in subject.LABELS
        return [sum(1 << index for index in (*block, 9)) for block in self.blocks]

    def py_separated(
        self, center: str, other_center: str, left: str, right: str
    ) -> bool:
        assert len({center, other_center, left, right}) >= 3
        return True


def _fixture_tree(tmp_path: Path) -> tuple[Path, Path, Path, Path]:
    repo = tmp_path / "repo"
    required_path = repo / "inputs/required.json"
    incidence_path = repo / "inputs/incidence.json"
    certificate_path = repo / "inputs/certificate.json"
    bank_path = repo / "inputs/bank.json"
    split_path = repo / "inputs/split.json"
    caller_path = repo / "scripts/caller.py"
    shadow_path = repo / "scripts/shadow.py"
    caller_path.parent.mkdir(parents=True)
    caller_path.write_text("# caller fixture\n")
    shadow_path.write_text("# shadow fixture\n")
    _write_json(bank_path, {"schema": "bank.fixture.v1", "records": []})
    _write_json(split_path, {"schema": "split.fixture.v1", "records": []})
    relaxed_masks = {label: {"mask": 0, "members": []} for label in subject.LABELS}
    rows = [
        {
            "relaxed_id": f"row-{index:02d}",
            "sstar": f"sstar-{index:02d}",
            "relaxed_masks": relaxed_masks,
            "fixture_payload": {"row": index, "kind": "canonical"},
        }
        for index in range(15)
    ]
    incidence = {
        "schema": subject.EXPECTED_INCIDENCE_SCHEMA,
        "source": {
            "bank": "inputs/bank.json",
            "bank_sha256": _sha(bank_path.read_bytes()),
        },
        "rows": rows,
    }
    _write_json(incidence_path, incidence)
    certificate = {
        "schema": subject.EXPECTED_CERTIFICATE_SCHEMA,
        "source": {
            "relaxed_census": "inputs/incidence.json",
            "relaxed_census_sha256": _sha(incidence_path.read_bytes()),
            "split_probe": "inputs/split.json",
            "split_probe_sha256": _sha(split_path.read_bytes()),
            "rvol_input_dir": "/external/not-captured",
        },
    }
    _write_json(certificate_path, certificate)
    leaves = [
        {
            "certificate_id": f"certificate-{index:02d}",
            "relaxed_id": f"row-{index:02d}",
            "erased_facts": [{"center": "u", "witnesses": ["Q1", "Q2"]}],
            "fixture_payload": {"leaf": index, "kind": "canonical"},
        }
        for index in range(15)
    ]
    required = {
        "schema": subject.EXPECTED_REQUIRED_SCHEMA,
        "source": {
            "incidence_census": "inputs/incidence.json",
            "incidence_census_sha256": _sha(incidence_path.read_bytes()),
            "certificate_census": "inputs/certificate.json",
            "certificate_census_sha256": _sha(certificate_path.read_bytes()),
            "certificate_dir": "external-certificates-not-captured",
        },
        "leaves": leaves,
    }
    _write_json(required_path, required)
    return repo, required_path, incidence_path, caller_path, shadow_path


def _bundle(tmp_path: Path) -> tuple[subject.SourceBundle, FakeShadow, Path, Path]:
    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path)
    return (
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        ),
        FakeShadow(),
        caller,
        shadow_path,
    )


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
        "solver_signature": "z3 pinned-generalm-fake",
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


class FakePiqd:
    def __init__(
        self,
        *,
        force_status: str | None = None,
        malformed: bool = False,
        lose_solve_response: bool = False,
    ) -> None:
        self.force_status = force_status
        self.malformed = malformed
        self.lose_solve_response = lose_solve_response
        self.sessions: dict[str, dict[str, Any]] = {}
        self.created_ids: list[str] = []
        self.deleted_ids: list[str] = []
        self.solve_calls = 0
        self.active = 0
        self.max_active = 0

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        if method == "POST" and path == "/sessions":
            assert body is not None and body["solver"] == "z3" and body["lane"] == "smt"
            session_id = str(uuid.UUID(int=len(self.created_ids) + 1))
            label = str(body["label"])
            self.sessions[session_id] = {
                "label": label,
                "commands": [],
                "journal": b"",
                "answer": None,
                "receipt": None,
            }
            self.created_ids.append(session_id)
            self.active += 1
            self.max_active = max(self.max_active, self.active)
            result = _session(session_id, label)
            if self.malformed:
                result["solver_name"] = "cvc5"
            return neutral.JsonResponse(201, result)
        session_id, suffix = self._route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            commands = list(body["commands"])
            data["commands"] = commands
            data["journal"] = b"".join(command.encode() + b"\n" for command in commands)
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
            assert len(body["get_values"]) == 10
            self.solve_calls += 1
            if self.lose_solve_response:
                raise neutral.PiqdTransportLoss("synthetic response loss")
            status = self.force_status
            if status is None:
                status = "UNSAT" if "floor4" in str(data["label"]) else "SAT"
            answer = self._answer(status, str(data["label"]), list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            deadline = (
                int(body["timeout_ms"]) + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
            )
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
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "z3 pinned-generalm-fake",
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
            self.active -= 1
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
        raise AssertionError(f"unexpected route {method} {path}")

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        session_id, suffix = self._route(path)
        assert method == "GET" and suffix == "/smt2"
        return neutral.BytesResponse(200, self.sessions[session_id]["journal"])

    def _route(self, path: str) -> tuple[str, str]:
        pieces = path.split("/")
        assert len(pieces) in {3, 4} and pieces[:2] == ["", "sessions"]
        assert pieces[2] in self.sessions
        return pieces[2], "" if len(pieces) == 3 else f"/{pieces[3]}"

    def _answer(self, status: str, label: str, terms: list[str]) -> dict[str, object]:
        if status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        if status == "UNKNOWN":
            return {"status": "UNKNOWN"}
        assert status == "SAT"
        floor = 2 if "floor2" in label else 3
        assignment = {label: 0 for label in subject.LABELS}
        for center, block in zip(
            subject.NONFIXED_CENTERS, FakeShadow.blocks, strict=True
        ):
            selected = block[:floor]
            assignment[center] = sum(1 << index for index in selected)
        values = (
            "("
            + " ".join(
                f"({term} (_ bv{assignment[term.removeprefix('mask_')]} 10))"
                for term in terms
            )
            + ")"
        )
        return {"status": "SAT", "model": "(model)", "values": values}


def test_exact_query_context_and_state_only_journal(tmp_path: Path) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path)
    queries = subject.prepare_queries(bundle, shadow, timeout_ms=1234)
    assert len(queries) == 45
    query = queries[17]
    assert query.cardinality_floor == 3 and query.row_index == 2
    source_files = [
        {
            "role": source.role,
            "path": source.locator,
            "bytes": len(source.payload),
            "sha256": source.sha256,
            "identity": list(source.identity),
            "component_identities": [
                list(identity) for identity in source.component_identities
            ],
        }
        for source in sorted(bundle.sources, key=lambda item: (item.role, item.locator))
    ]
    expected_context = {
        "schema": "pinned-generalm-query-context.v1",
        "query_index": 17,
        "row_index": 2,
        "cardinality_floor": 3,
        "row_record": bundle.incidence["rows"][2],
        "leaf_records": [bundle.required_facts["leaves"][2]],
        "relaxed_id": "row-02",
        "sstar": "sstar-02",
        "labels": list(subject.LABELS),
        "nonfixed_centers": list(subject.NONFIXED_CENTERS),
        "fixed_masks": {"v": 0, "w": 0},
        "domains": {
            center: subject.submask_domain(shadow, "sstar-02", center, 3)
            for center in subject.NONFIXED_CENTERS
        },
        "cross_constraints": [],
        "pair_class_count_max": 2,
        "source_packet_sha256": _sha(
            json.dumps(
                source_files,
                sort_keys=True,
                separators=(",", ":"),
                ensure_ascii=True,
            ).encode("ascii")
        ),
        "source_files": source_files,
        "encoding": "QF_BV10-state-journal-v1",
    }
    assert query.context == expected_context
    assert query.query.descriptor["semantic_input"] == expected_context
    assert query.query.descriptor["solver_profile"] == {
        "schema": subject.PROFILE_SCHEMA,
        "solvers": ["z3"],
        "timeout_ms": 1234,
    }
    assert query.query.journal_commands[0] == "(set-logic QF_BV)"
    assert query.query.journal_commands[1:11] == tuple(
        f"(declare-const mask_{label} (_ BitVec 10))" for label in subject.LABELS
    )
    assert len(query.query.journal_commands) == 67
    assert query.query.journal_commands[-1] == (
        "(assert (not (and (= ((_ extract 8 8) mask_u) #b1) "
        "(= ((_ extract 9 9) mask_u) #b1))))"
    )
    assert all(
        "check-sat" not in command and "get-model" not in command
        for command in query.query.journal_commands
    )
    assert query.query.journal_smt2 == b"".join(
        command.encode() + b"\n" for command in query.query.journal_commands
    )


def test_exact_sat_replay_rejects_each_constraint_family(tmp_path: Path) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path)
    query = subject.prepare_queries(bundle, shadow, timeout_ms=1234)[0]
    assignment = {label: 0 for label in subject.LABELS}
    for center, block in zip(subject.NONFIXED_CENTERS, FakeShadow.blocks, strict=True):
        assignment[center] = sum(1 << index for index in block[:2])
    evidence = subject.replay_assignment(query.context, assignment)
    assert evidence["checked_leaves"] == 1 and evidence["checked_pair_classes"] == 45

    domain_bad = dict(assignment, u=1023)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="domain"):
        subject.replay_assignment(query.context, domain_bad)
    fixed_bad = dict(assignment, v=1)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="fixed mask"):
        subject.replay_assignment(query.context, fixed_bad)
    cross_bad = dict(assignment, u=(1 << 6) | (1 << 7), s1=(1 << 6) | (1 << 7))
    context = dict(query.context)
    context["domains"] = {
        **context["domains"],
        "u": [cross_bad["u"]],
        "s1": [cross_bad["s1"]],
    }
    context["cross_constraints"] = [["u", "s1", "Pw", "Pu"]]
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="cross separation"):
        subject.replay_assignment(context, cross_bad)
    pair_bad = dict(assignment, s1=3, s2=3, s3=3)
    context = dict(query.context)
    context["domains"] = {
        **context["domains"],
        "s1": [3],
        "s2": [3],
        "s3": [3],
    }
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="pair-class"):
        subject.replay_assignment(context, pair_bad)
    leaf_bad = dict(assignment, u=(1 << 8) | (1 << 9))
    context = dict(query.context)
    context["domains"] = {**context["domains"], "u": [leaf_bad["u"]]}
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="does not defeat leaf"):
        subject.replay_assignment(context, leaf_bad)


def test_default_piqd_run_is_45_fresh_sequential_and_offline_validates(
    tmp_path: Path,
) -> None:
    bundle, shadow, caller, shadow_path = _bundle(tmp_path)
    fake = FakePiqd()
    output = tmp_path / "published"
    report = subject.run_piqd(
        bundle,
        shadow,
        transport=fake,
        output_directory=output,
        timeout_ms=1234,
        workers=1,
    )
    assert subject.expected_profile(report)
    assert len(fake.created_ids) == len(set(fake.created_ids)) == 45
    assert len(fake.deleted_ids) == fake.solve_calls == 45
    assert fake.max_active == 1 and fake.active == 0
    validated = subject.validate_publication(
        output,
        repo_root=bundle.repo_root,
        caller_script_path=caller,
        shadow_tool_path=shadow_path,
        shadow_tool=shadow,
    )
    assert validated == report
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="already exists"):
        subject.run_piqd(
            bundle,
            shadow,
            transport=FakePiqd(),
            output_directory=output,
            timeout_ms=1234,
        )


def test_unknown_is_inconclusive_and_malformed_fails_without_fallback(
    tmp_path: Path,
) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path)
    query = subject.prepare_queries(bundle, shadow, timeout_ms=1234)[0]
    query_dir = tmp_path / "query"
    query_dir.mkdir()
    fd = os.open(query_dir, os.O_RDONLY | os.O_DIRECTORY)
    try:
        engine = neutral.run_authenticated_single_solver_query(
            query.query,
            solver="z3",
            descriptor_schema=subject.DESCRIPTOR_SCHEMA,
            solver_profile_schema=subject.PROFILE_SCHEMA,
            authenticated_journal_commands=query.query.journal_commands,
            transport=FakePiqd(force_status="UNKNOWN"),
            semantic_verifier=subject.verify_sat_model,
            output_fd=fd,
        )
    finally:
        os.close(fd)
    assert subject._classification(engine) == ("unknown", "UNKNOWN_INCONCLUSIVE")

    lost_dir = tmp_path / "lost-query"
    lost_dir.mkdir()
    lost_fd = os.open(lost_dir, os.O_RDONLY | os.O_DIRECTORY)
    try:
        lost_engine = neutral.run_authenticated_single_solver_query(
            query.query,
            solver="z3",
            descriptor_schema=subject.DESCRIPTOR_SCHEMA,
            solver_profile_schema=subject.PROFILE_SCHEMA,
            authenticated_journal_commands=query.query.journal_commands,
            transport=FakePiqd(lose_solve_response=True),
            semantic_verifier=subject.verify_sat_model,
            output_fd=lost_fd,
        )
    finally:
        os.close(lost_fd)
    assert subject._classification(lost_engine) == (
        "inconclusive",
        "TRANSPORT_LOSS_INCONCLUSIVE",
    )

    malformed_output = tmp_path / "malformed"
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="failed closed"):
        subject.run_piqd(
            bundle,
            shadow,
            transport=FakePiqd(malformed=True),
            output_directory=malformed_output,
            timeout_ms=1234,
        )
    assert not malformed_output.exists()


def test_source_schema_and_upstream_hash_tamper_fail_closed(tmp_path: Path) -> None:
    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path)
    value = json.loads(required.read_text())
    value["schema"] = "wrong"
    _write_json(required, value)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="schema mismatch"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )

    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path / "second")
    value = json.loads(required.read_text())
    value["source"]["incidence_census_sha256"] = "0" * 64
    _write_json(required, value)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="binding mismatch"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )

    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path / "third")
    value = json.loads(incidence.read_text())
    value["rows"][0]["relaxed_masks"]["v"]["mask"] = True
    _write_json(incidence, value)
    required_value = json.loads(required.read_text())
    required_value["source"]["incidence_census_sha256"] = _sha(incidence.read_bytes())
    _write_json(required, required_value)
    certificate = repo / "inputs/certificate.json"
    certificate_value = json.loads(certificate.read_text())
    certificate_value["source"]["relaxed_census_sha256"] = _sha(incidence.read_bytes())
    _write_json(certificate, certificate_value)
    required_value = json.loads(required.read_text())
    required_value["source"]["certificate_census_sha256"] = _sha(
        certificate.read_bytes()
    )
    _write_json(required, required_value)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="mask v is invalid"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )


def test_source_descriptor_custody_rejects_links_rebinding_and_bounds(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path / "symlink")
    real_required = repo / "inputs/required-real.json"
    required.rename(real_required)
    required.symlink_to(real_required.name)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="cannot capture"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )

    repo, required, incidence, caller, shadow_path = _fixture_tree(
        tmp_path / "parent-symlink"
    )
    inputs = repo / "inputs"
    real_inputs = repo / "inputs-real"
    inputs.rename(real_inputs)
    inputs.symlink_to(real_inputs.name, target_is_directory=True)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="cannot open component"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )

    repo, required, incidence, caller, shadow_path = _fixture_tree(
        tmp_path / "hardlink"
    )
    os.link(required, repo / "required-hardlink.json")
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="unique regular"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )

    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path / "replacement")
    captured_required = bundle.by_role("required_facts").path
    replacement = captured_required.with_name("replacement.json")
    replacement.write_bytes(captured_required.read_bytes())
    os.replace(replacement, captured_required)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="changed after capture"):
        subject.prepare_queries(bundle, shadow, timeout_ms=1234)

    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path / "parent-rebind")
    inputs = bundle.repo_root / "inputs"
    old_inputs = bundle.repo_root / "inputs-old"
    inputs.rename(old_inputs)
    shutil.copytree(old_inputs, inputs)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="changed after capture"):
        subject.prepare_queries(bundle, shadow, timeout_ms=1234)

    repo, required, incidence, caller, shadow_path = _fixture_tree(
        tmp_path / "oversize"
    )
    monkeypatch.setattr(subject, "MAX_SOURCE_BYTES", required.stat().st_size - 1)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="bounded"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )
    monkeypatch.setattr(subject, "MAX_SOURCE_BYTES", 64 * 1024 * 1024)

    repo, required, incidence, caller, shadow_path = _fixture_tree(
        tmp_path / "nonregular"
    )
    required.unlink()
    required.mkdir()
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="regular"):
        subject.capture_source_bundle(
            repo_root=repo,
            required_facts_path=required,
            incidence_path=incidence,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
        )


def test_exact_native_path_and_builtin_container_boundaries(tmp_path: Path) -> None:
    repo, required, incidence, caller, shadow_path = _fixture_tree(tmp_path)

    class PathSubclass(type(Path())):
        pass

    for invalid_root in (str(repo), PathSubclass(repo)):
        with pytest.raises(subject.PinnedGeneralmPiqdError, match="exact native Path"):
            subject.capture_source_bundle(
                repo_root=invalid_root,  # type: ignore[arg-type]
                required_facts_path=required,
                incidence_path=incidence,
                caller_script_path=caller,
                shadow_tool_path=shadow_path,
            )

    bundle = subject.capture_source_bundle(
        repo_root=repo,
        required_facts_path=required,
        incidence_path=incidence,
        caller_script_path=caller,
        shadow_tool_path=shadow_path,
    )
    query = subject.prepare_queries(bundle, FakeShadow(), timeout_ms=1234)[0]

    class DictSubclass(dict[str, Any]):
        pass

    assignment = {
        label: query.context["domains"].get(label, [0])[0] for label in subject.LABELS
    }
    assignment.update(query.context["fixed_masks"])
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="exact builtin"):
        subject.replay_assignment(DictSubclass(query.context), assignment)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="exact builtin"):
        subject.replay_assignment(query.context, DictSubclass(assignment))

    class TupleShadow(FakeShadow):
        def candidate_masks_for(self, sstar: str, center: str) -> list[int]:
            return tuple(super().candidate_masks_for(sstar, center))  # type: ignore[return-value]

    with pytest.raises(subject.PinnedGeneralmPiqdError, match="exact list"):
        subject.submask_domain(TupleShadow(), "sstar-00", "u", 2)


def test_publication_tamper_is_rejected(tmp_path: Path) -> None:
    bundle, shadow, caller, shadow_path = _bundle(tmp_path)
    output = tmp_path / "published"
    subject.run_piqd(
        bundle,
        shadow,
        transport=FakePiqd(),
        output_directory=output,
        timeout_ms=1234,
    )
    artifact = output / "query-00/journal.smt2"
    artifact.chmod(0o600)
    artifact.write_bytes(artifact.read_bytes() + b"\n")
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="inventory mismatch"):
        subject.validate_publication(
            output,
            repo_root=bundle.repo_root,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
            shadow_tool=shadow,
        )


@pytest.mark.parametrize(
    "attack", ["symlink", "hardlink", "same-bytes", "empty-directory", "oversize"]
)
def test_publication_inventory_rejects_adversarial_tree_changes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attack: str
) -> None:
    bundle, shadow, caller, shadow_path = _bundle(tmp_path)
    output = tmp_path / "published"
    subject.run_piqd(
        bundle,
        shadow,
        transport=FakePiqd(),
        output_directory=output,
        timeout_ms=1234,
    )
    artifact = output / "query-00/journal.smt2"
    if attack == "symlink":
        artifact.unlink()
        artifact.symlink_to("../report.json")
    elif attack == "hardlink":
        artifact.unlink()
        os.link(output / "report.json", artifact)
    elif attack == "same-bytes":
        payload = artifact.read_bytes()
        artifact.unlink()
        artifact.write_bytes(payload)
    elif attack == "empty-directory":
        (output / "unrecorded-empty-directory").mkdir()
    elif attack == "oversize":
        monkeypatch.setattr(subject, "MAX_ARTIFACT_BYTES", artifact.stat().st_size - 1)
    else:  # pragma: no cover - exhaustive test parameter guard
        raise AssertionError(attack)
    with pytest.raises(subject.PinnedGeneralmPiqdError):
        subject.validate_publication(
            output,
            repo_root=bundle.repo_root,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
            shadow_tool=shadow,
        )


def test_output_parent_rebind_fails_without_cleaning_hostile_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path / "sources")
    output_parent = tmp_path / "output-parent"
    output_parent.mkdir()
    output = output_parent / "published"
    moved_parent = tmp_path / "output-parent-authenticated"
    original_assert = subject._assert_output_parent_current
    rebound = False

    def rebind_once(staging: subject.StagingDirectory) -> None:
        nonlocal rebound
        if not rebound:
            output_parent.rename(moved_parent)
            output_parent.mkdir()
            (output_parent / "hostile-marker").write_text("must survive\n")
            rebound = True
        original_assert(staging)

    monkeypatch.setattr(subject, "_assert_output_parent_current", rebind_once)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="parent was rebound"):
        subject.run_piqd(
            bundle,
            shadow,
            transport=FakePiqd(),
            output_directory=output,
            timeout_ms=1234,
        )
    assert (output_parent / "hostile-marker").read_text() == "must survive\n"
    assert not output.exists()
    assert not any(moved_parent.iterdir())


def test_staging_open_failure_cleans_only_authenticated_empty_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output_parent = tmp_path / "output-parent"
    output_parent.mkdir()
    original_assert = subject._assert_named_directory

    def fail_staging(
        parent_fd: int, name: str, expected: tuple[int, int], where: str
    ) -> int:
        if where == "private output staging":
            raise subject.PinnedGeneralmPiqdError("synthetic staging-open failure")
        return original_assert(parent_fd, name, expected, where)

    monkeypatch.setattr(subject, "_assert_named_directory", fail_staging)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="synthetic"):
        subject._reserve_staging(output_parent / "published")
    assert not any(output_parent.iterdir())


@pytest.mark.parametrize("kind", ["file", "directory", "symlink"])
def test_output_is_create_once_for_every_existing_entry_kind(
    tmp_path: Path, kind: str
) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path / "sources")
    output = tmp_path / "output-parent/published"
    output.parent.mkdir()
    if kind == "file":
        output.write_text("occupied\n")
    elif kind == "directory":
        output.mkdir()
    else:
        target = tmp_path / "symlink-target"
        target.mkdir()
        output.symlink_to(target, target_is_directory=True)
    fake = FakePiqd()
    with pytest.raises(subject.PinnedGeneralmPiqdError, match="already exists"):
        subject.run_piqd(
            bundle,
            shadow,
            transport=fake,
            output_directory=output,
            timeout_ms=1234,
        )
    assert fake.created_ids == []


def _refresh_custody_inventory(output: Path) -> None:
    fd = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        inventory = subject._tree_inventory_fd(fd)
        root_identity = list(subject._directory_identity(os.fstat(fd)))
    finally:
        os.close(fd)
    custody = {
        "schema": subject.INVENTORY_SCHEMA,
        "root_identity": root_identity,
        "entries": inventory,
        "entries_sha256": _sha(subject._canonical(inventory)),
    }
    path = output / "custody-inventory.json"
    path.chmod(0o600)
    path.write_bytes(subject._canonical(custody) + b"\n")


@pytest.mark.parametrize("tamper", ["unsupported-status", "query-metadata"])
def test_validator_recomputes_status_and_query_metadata(
    tmp_path: Path, tamper: str
) -> None:
    bundle, shadow, caller, shadow_path = _bundle(tmp_path)
    output = tmp_path / "published"
    subject.run_piqd(
        bundle,
        shadow,
        transport=FakePiqd(),
        output_directory=output,
        timeout_ms=1234,
    )
    query_path = output / "query-00/query-result.json"
    report_path = output / "report.json"
    query = json.loads(query_path.read_text())
    report = json.loads(report_path.read_text())
    report_query = report["floors"][0]["rows"][0]
    if tamper == "unsupported-status":
        query["engine"]["raw_status"] = "ERRORED"
        query["engine"]["effective_status"] = "INCONCLUSIVE_ERROR"
        report_query["engine"] = query["engine"]
        expected = "unsupported"
    else:
        query["query_index"] = 44
        report_query["query_index"] = 44
        expected = "metadata mismatch"
    for path, value in ((query_path, query), (report_path, report)):
        path.chmod(0o600)
        path.write_bytes(subject._canonical(value) + b"\n")
    manifest_path = output / "run-manifest.json"
    manifest = json.loads(manifest_path.read_text())
    report_payload = report_path.read_bytes()
    manifest["report"] = {
        "path": "report.json",
        "bytes": len(report_payload),
        "sha256": _sha(report_payload),
    }
    manifest_path.chmod(0o600)
    manifest_path.write_bytes(subject._canonical(manifest) + b"\n")
    _refresh_custody_inventory(output)
    with pytest.raises(subject.PinnedGeneralmPiqdError, match=expected):
        subject.validate_publication(
            output,
            repo_root=bundle.repo_root,
            caller_script_path=caller,
            shadow_tool_path=shadow_path,
            shadow_tool=shadow,
        )


def _load_script() -> Any:
    path = (
        Path(__file__).resolve().parents[3]
        / "scripts/pinned-generalm-certificate-coverage.py"
    )
    spec = importlib.util.spec_from_file_location("pinned_generalm_cli_test", path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def test_cli_defaults_to_piqd_and_legacy_is_explicit(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    script = _load_script()
    assert script.parse_args([]).backend == "piqd"
    assert script.z3 is None
    assert script.parse_args(["--backend", "legacy-local"]).backend == "legacy-local"
    sentinel_shadow = object()
    monkeypatch.setattr(script, "load_shadow_tool", lambda: sentinel_shadow)
    monkeypatch.setattr(
        script.pinned_generalm_piqd, "capture_source_bundle", lambda **kwargs: "bundle"
    )
    monkeypatch.setattr(
        script.neutral, "UrllibPiqdTransport", lambda *args, **kwargs: "transport"
    )
    monkeypatch.setattr(
        script.pinned_generalm_piqd,
        "run_piqd",
        lambda *args, **kwargs: {"floors": []},
    )
    monkeypatch.setattr(
        script.pinned_generalm_piqd, "expected_profile", lambda report: True
    )
    monkeypatch.setattr(
        script,
        "solve_row",
        lambda *args, **kwargs: (_ for _ in ()).throw(
            AssertionError("legacy fallback")
        ),
    )
    assert script.main([]) == 0
    monkeypatch.setattr(script, "run_legacy_local", lambda args, shadow: 17)
    assert script.main(["--backend", "legacy-local"]) == 17


def test_cli_check_is_offline_and_constructs_no_transport_or_solver(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    script = _load_script()
    sentinel_shadow = object()
    publication = tmp_path / "publication"
    calls: list[tuple[Path, object]] = []
    monkeypatch.setattr(script, "load_shadow_tool", lambda: sentinel_shadow)
    monkeypatch.setattr(
        script.pinned_generalm_piqd,
        "validate_publication",
        lambda output, **kwargs: calls.append((output, kwargs["shadow_tool"])),
    )
    monkeypatch.setattr(
        script.neutral,
        "UrllibPiqdTransport",
        lambda *args, **kwargs: (_ for _ in ()).throw(
            AssertionError("offline check constructed transport")
        ),
    )
    monkeypatch.setattr(
        script.pinned_generalm_piqd,
        "capture_source_bundle",
        lambda **kwargs: (_ for _ in ()).throw(
            AssertionError("offline check captured run inputs")
        ),
    )
    monkeypatch.setattr(
        script.pinned_generalm_piqd,
        "run_piqd",
        lambda *args, **kwargs: (_ for _ in ()).throw(
            AssertionError("offline check executed PIQD")
        ),
    )
    monkeypatch.setattr(
        script,
        "run_legacy_local",
        lambda *args, **kwargs: (_ for _ in ()).throw(
            AssertionError("offline check imported/executed local Z3")
        ),
    )
    assert script.main(["--check", str(publication)]) == 0
    assert calls == [(publication, sentinel_shadow)]
    assert script.z3 is None


def test_unexpected_exception_and_baseexception_propagate_without_fallback(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    script = _load_script()
    sentinel_shadow = object()
    monkeypatch.setattr(script, "load_shadow_tool", lambda: sentinel_shadow)
    monkeypatch.setattr(
        script.pinned_generalm_piqd, "capture_source_bundle", lambda **kwargs: "bundle"
    )
    monkeypatch.setattr(
        script.neutral, "UrllibPiqdTransport", lambda *args, **kwargs: "transport"
    )
    monkeypatch.setattr(
        script,
        "solve_row",
        lambda *args, **kwargs: (_ for _ in ()).throw(
            AssertionError("unexpected fallback to local solver")
        ),
    )

    class SyntheticBaseException(BaseException):
        pass

    for failure in (
        RuntimeError("runtime transport failure"),
        SyntheticBaseException(),
    ):
        monkeypatch.setattr(
            script.pinned_generalm_piqd,
            "run_piqd",
            lambda *args, _failure=failure, **kwargs: (_ for _ in ()).throw(_failure),
        )
        with pytest.raises(type(failure)) as caught:
            script.main([])
        assert caught.value is failure


def test_run_propagates_unexpected_failures_and_removes_only_its_staging(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    bundle, shadow, _caller, _shadow_path = _bundle(tmp_path / "sources")

    class SyntheticBaseException(BaseException):
        pass

    for index, failure in enumerate(
        (RuntimeError("unexpected adapter failure"), SyntheticBaseException())
    ):
        output = tmp_path / f"output-{index}/published"
        monkeypatch.setattr(
            neutral,
            "run_authenticated_single_solver_query",
            lambda *args, _failure=failure, **kwargs: (_ for _ in ()).throw(_failure),
        )
        with pytest.raises(type(failure)) as caught:
            subject.run_piqd(
                bundle,
                shadow,
                transport=FakePiqd(),
                output_directory=output,
                timeout_ms=1234,
            )
        assert caught.value is failure
        assert not output.exists()
        assert not any(output.parent.iterdir())
