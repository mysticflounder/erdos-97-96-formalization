from __future__ import annotations

import copy
import hashlib
import json
import os
import stat
import uuid
from collections.abc import Mapping
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest
import sympy as sp

from census.atail_force import piqd_cvc5_adapter as subject
from census.atail_force import producer_geometry as geometry
from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_smt_oneshot_engine as shared_oneshot


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode()


def _source_tree(root: Path) -> Path:
    for relative in subject.REQUIRED_SOURCE_PATHS:
        target = root / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(f"source fixture: {relative}\n".encode())
    return root


def _blueprint(
    labels: tuple[str, ...] = ("0", "1", "2", "3", "4"),
) -> geometry.GeometryBlueprint:
    a, b, c, d, e = labels
    return geometry.GeometryBlueprint(
        case_id="tiny-atail-geometry",
        labels=labels,
        cyclic_order=labels,
        surplus_apex=a,
        opp_apex1=b,
        opp_apex2=c,
        surplus_cap=frozenset((b, c)),
        opp_cap1=frozenset((a, c)),
        opp_cap2=frozenset((a, b)),
        exact_classes=(
            geometry.ExactClassSpec(b, "exact_1", (a, c, d, e)),
            geometry.ExactClassSpec(c, "exact_2", (a, b, d, e)),
        ),
        pinned_k4_rows=(
            geometry.PinnedK4Row(b, "k4_1", (a, c, d, e)),
            geometry.PinnedK4Row(c, "k4_2", (a, b, d, e)),
        ),
    )


def _sat_system() -> geometry.GeometrySystem:
    x, y = sp.symbols("x y", real=True)
    atoms = (
        geometry.NamedPolynomialAtom(
            "eq_atom", "fixture", "eq", (x - 1,), "fixture:eq"
        ),
        geometry.NamedPolynomialAtom("ge_atom", "fixture", "ge", (y,), "fixture:ge"),
        geometry.NamedPolynomialAtom("gt_atom", "fixture", "gt", (x,), "fixture:gt"),
        geometry.NamedPolynomialAtom(
            "ne_atom", "fixture", "ne", (y - 2,), "fixture:ne"
        ),
        geometry.NamedPolynomialAtom(
            "or_ne_atom",
            "fixture",
            "or_ne",
            (x - 1, y - 1),
            "fixture:or_ne",
        ),
    )
    return geometry.GeometrySystem(_blueprint(), (x, y), atoms, geometry.OMITTED_LEDGER)


def _contradictory_system() -> geometry.GeometrySystem:
    (x,) = sp.symbols("x", real=True, seq=True)
    atoms = (
        geometry.NamedPolynomialAtom("x_is_1", "fixture", "eq", (x - 1,), "fixture:x1"),
        geometry.NamedPolynomialAtom("x_is_2", "fixture", "eq", (x - 2,), "fixture:x2"),
    )
    return geometry.GeometrySystem(_blueprint(), (x,), atoms, geometry.OMITTED_LEDGER)


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
        "solver_name": "cvc5",
        "solver_sha256": _sha(b"fake-cvc5-binary"),
        "solver_signature": "cvc5 fake-atail-schema",
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
    """The exact current routes used by a fresh single-solve SMT session."""

    def __init__(
        self,
        status: str,
        *,
        model: str = "(model (define-fun |x| () Real 1) (define-fun |y| () Real 0))",
        values: str = "((|x| 1) (|y| 0))",
        lose_solve_response: bool = False,
        exported_suffix: bytes = b"",
    ) -> None:
        self.status = status
        self.model = model
        self.values = values
        self.lose_solve_response = lose_solve_response
        self.exported_suffix = exported_suffix
        self.calls: list[tuple[str, str, object]] = []
        self.sessions: dict[str, dict[str, Any]] = {}
        self.solve_calls = 0
        self.active = 0

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        self.calls.append((method, path, copy.deepcopy(body)))
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert body["solver"] == "cvc5" and body["lane"] == "smt"
            session_id = str(uuid.UUID(int=len(self.sessions) + 1))
            self.sessions[session_id] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "solve": None,
                "answer": None,
                "receipt": None,
            }
            self.active += 1
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
            assert body["assumptions"] == [] and body["include_model"] is True
            self.solve_calls += 1
            data["solve"] = dict(body)
            answer = self._answer()
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
                "replayed": False,
            }
            data["answer"] = answer
            data["receipt"] = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "cvc5 fake-atail-schema",
                "solver_sha256": _sha(b"fake-cvc5-binary"),
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
            if self.lose_solve_response:
                raise neutral.PiqdTransportLoss("simulated committed response loss")
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
        raise AssertionError(f"unexpected fake route: {method} {path}")

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        self.calls.append((method, path, None))
        session_id, suffix = self._route(path)
        assert method == "GET" and suffix == "/smt2"
        return neutral.BytesResponse(
            200, self.sessions[session_id]["journal"] + self.exported_suffix
        )

    def _route(self, path: str) -> tuple[str, str]:
        parts = path.split("/")
        assert len(parts) in {3, 4} and parts[:2] == ["", "sessions"]
        session_id = parts[2]
        assert session_id in self.sessions
        return session_id, "" if len(parts) == 3 else "/" + "/".join(parts[3:])

    def _answer(self) -> dict[str, object]:
        if self.status == "SAT":
            return {"status": "SAT", "model": self.model, "values": self.values}
        if self.status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        raise AssertionError(f"unsupported fake status {self.status}")


@pytest.fixture(scope="module")
def prepared_sat() -> subject.PreparedGeometryQuery:
    return subject.prepare_geometry_query(_sat_system(), timeout_ms=700)


@pytest.fixture(scope="module")
def prepared_unsat() -> subject.PreparedGeometryQuery:
    return subject.prepare_geometry_query(_contradictory_system(), timeout_ms=700)


def _run(
    prepared: subject.PreparedGeometryQuery,
    fake: FakePiqd,
    output: Path,
) -> dict[str, object]:
    output.mkdir()
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        return subject.run_prepared_query(
            prepared, transport=fake, output_fd=descriptor
        )
    finally:
        os.close(descriptor)


def _repack(
    prepared: subject.PreparedGeometryQuery, descriptor: dict[str, object]
) -> subject.PreparedGeometryQuery:
    query = replace(
        prepared.query,
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
    )
    return subject.PreparedGeometryQuery(query)


def _replace_bytes(path: Path, payload: bytes) -> None:
    path.unlink()
    path.write_bytes(payload)


def _replace_json(path: Path, value: object) -> None:
    _replace_bytes(path, _canonical(value) + b"\n")


def _validate_run(path: Path) -> dict[str, object]:
    descriptor = os.open(path, os.O_RDONLY | os.O_DIRECTORY)
    try:
        return subject.validate_run_directory(descriptor)
    finally:
        os.close(descriptor)


def _artifact_record(path: Path) -> dict[str, object]:
    payload = path.read_bytes()
    return {"path": path.name, "bytes": len(payload), "sha256": _sha(payload)}


def _resign_engine_artifact(output: Path, key: str, name: str) -> None:
    result = json.loads((output / "atail-result.json").read_bytes())
    result["engine"]["artifacts"][key] = _artifact_record(output / name)
    _replace_json(output / "atail-result.json", result)


def test_deterministic_packet_is_cvc5_state_only_and_fully_bound() -> None:
    left = subject.prepare_geometry_query(_sat_system(), timeout_ms=700)
    right = subject.prepare_geometry_query(_sat_system(), timeout_ms=700)
    assert left.query.descriptor_bytes == right.query.descriptor_bytes
    assert (
        left.query.original_smt2 == right.query.original_smt2 == left.query.journal_smt2
    )
    assert left.query.journal_commands[0] == subject.NL_COV_COMMAND
    assert not any(
        marker in left.query.original_smt2
        for marker in (b"check-sat", b"get-unsat-core", b"produce-unsat-cores")
    )
    descriptor = left.query.descriptor
    assert descriptor["solver_profile"]["solvers"] == ["cvc5"]
    assert descriptor["solve"] == {
        "assumption_ids": [],
        "readback_variable_ids": ["x", "y"],
        "include_model": True,
    }
    assert (
        tuple(item.path for item in left.query.source_files)
        == subject.REQUIRED_SOURCE_PATHS
    )
    subject.validate_prepared_query(left)
    assert subject.SMT_ONESHOT_PROFILE_IDENTITY == (
        "atail-exact-rational-atom-replay",
        "v1",
    )
    assert subject.validate_smt_oneshot_query(left.query) == left.query
    profile = shared_oneshot.resolve_smt_oneshot_semantic_profile(
        subject.SMT_ONESHOT_PROFILE_IDENTITY
    )
    assert profile.descriptor_schema == subject.DESCRIPTOR_SCHEMA
    assert profile.solver_profile_schema == subject.PROFILE_SCHEMA
    assert profile.solver == "cvc5"
    assert profile.query_validator(left.query) == left.query
    replay = profile.semantic_verifier(
        left.query,
        "cvc5",
        "(model (define-fun |x| () Real 1) (define-fun |y| () Real 0))",
        "((|x| 1) (|y| 0))",
    )
    assert replay.accepted is True


def test_sat_replays_all_relations_exactly_and_retains_false_claims(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    fake = FakePiqd("SAT")
    result = _run(prepared_sat, fake, tmp_path / "sat")
    assert result["raw_status"] == "SAT"
    assert result["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert result["classification"] == "SAT_EXACT_RATIONAL_REPLAY"
    assert result["engine"]["semantic_replay"]["evidence"]["atom_count"] == 5
    assert result["claims"] == subject.FALSE_CLAIMS
    assert not any(result["claims"].values())
    assert result["core_entitlement"] is False
    assert result["proof_blueprint"] == subject.PROOF_BLUEPRINT
    assert fake.solve_calls == 1 and len(fake.sessions) == 1 and fake.active == 0


def test_contradictory_fixture_stays_unsat_discovery_only(
    prepared_unsat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    fake = FakePiqd("UNSAT", model="", values="")
    result = _run(prepared_unsat, fake, tmp_path / "unsat")
    assert result["raw_status"] == "UNSAT"
    assert result["effective_status"] == "UNSAT_DISCOVERY_ONLY"
    assert result["classification"] == "UNSAT_DISCOVERY_ONLY"
    assert result["engine"]["unsat_assumptions"] == {
        "basis": "get-unsat-assumptions",
        "named_core_support": False,
        "daemon_field": "core",
        "assumption_terms": [],
        "source_atom_ids": [],
        "terminal_unsat": True,
    }
    assert result["core_entitlement"] is False and not any(result["claims"].values())


@pytest.mark.parametrize(
    "values",
    (
        "((|x| 1))",
        "((|x| 1) (|x| 1) (|y| 0))",
        "((|x| 1) (|y| 0) (|z| 0))",
        "((|x| 1) (|y| root_2))",
    ),
    ids=("missing", "duplicate", "extra", "nonrational"),
)
def test_readback_rejects_incomplete_duplicate_extra_and_nonrational(
    prepared_sat: subject.PreparedGeometryQuery, values: str
) -> None:
    with pytest.raises(subject.ATailPiqdCvc5Error):
        subject.verify_sat_model(
            prepared_sat.query,
            "cvc5",
            "(model (define-fun |x| () Real 1) (define-fun |y| () Real 0))",
            values,
        )


def test_model_readback_disagreement_and_atom_mismatch_fail_closed(
    prepared_sat: subject.PreparedGeometryQuery,
) -> None:
    with pytest.raises(subject.ATailPiqdCvc5Error, match="disagree"):
        subject.verify_sat_model(
            prepared_sat.query,
            "cvc5",
            "(model (define-fun |x| () Real 1) (define-fun |y| () Real 0))",
            "((|x| 1) (|y| 1))",
        )
    replay = subject.verify_sat_model(
        prepared_sat.query,
        "cvc5",
        "(model (define-fun |x| () Real 2) (define-fun |y| () Real 0))",
        "((|x| 2) (|y| 0))",
    )
    assert replay.accepted is False
    assert replay.evidence["reason"] == "ATOM_RELATION_MISMATCH"


def test_safe_collision_and_weak_blueprint_are_rejected() -> None:
    colliding = _sat_system()
    colliding = replace(colliding, blueprint=_blueprint(("a-b", "a_b", "c", "d", "e")))
    with pytest.raises(subject.ATailPiqdCvc5Error, match="collide"):
        subject.prepare_geometry_query(colliding)

    weak = _sat_system()
    weak = replace(weak, blueprint=replace(weak.blueprint, exact_classes=()))
    with pytest.raises(subject.ATailPiqdCvc5Error, match="exact classes"):
        subject.prepare_geometry_query(weak)


def test_variable_atom_cross_ledger_symbol_collision_is_rejected(
    prepared_sat: subject.PreparedGeometryQuery,
) -> None:
    (x,) = sp.symbols("x", real=True, seq=True)
    colliding = geometry.GeometrySystem(
        _blueprint(),
        (x,),
        (
            geometry.NamedPolynomialAtom(
                "x", "fixture", "eq", (x - 1,), "fixture:collision"
            ),
        ),
        geometry.OMITTED_LEDGER,
    )
    with pytest.raises(subject.ATailPiqdCvc5Error, match="symbols collide"):
        subject.prepare_geometry_query(colliding)

    descriptor = copy.deepcopy(prepared_sat.query.descriptor)
    semantic = descriptor["semantic_input"]
    semantic["system"]["atoms"][0]["id"] = "x"
    semantic["enabled_atom_order"][0] = "x"
    semantic["system_sha256"] = _sha(_canonical(semantic["system"]))
    descriptor["semantic_sha256"] = _sha(_canonical(semantic))
    with pytest.raises(subject.ATailPiqdCvc5Error, match="symbols collide"):
        subject.validate_prepared_query(_repack(prepared_sat, descriptor))


def test_mutated_weak_blueprint_schema_and_custody_fail_closed(
    prepared_sat: subject.PreparedGeometryQuery,
) -> None:
    descriptor = copy.deepcopy(prepared_sat.query.descriptor)
    semantic = descriptor["semantic_input"]
    semantic["system"]["blueprint"]["exact_classes"] = []
    semantic["system_sha256"] = _sha(_canonical(semantic["system"]))
    descriptor["semantic_sha256"] = _sha(_canonical(semantic))
    with pytest.raises(subject.ATailPiqdCvc5Error, match="exact classes"):
        subject.validate_prepared_query(_repack(prepared_sat, descriptor))

    profile = copy.deepcopy(prepared_sat.query.descriptor)
    profile["solver_profile"]["solvers"] = ["z3"]
    with pytest.raises(neutral.SmtSourceAdapterError):
        subject.validate_prepared_query(_repack(prepared_sat, profile))

    first = prepared_sat.query.source_files[0]
    tampered_sources = (
        replace(first, payload=first.payload + b"\n# tampered\n"),
    ) + prepared_sat.query.source_files[1:]
    tampered = subject.PreparedGeometryQuery(
        replace(prepared_sat.query, source_files=tampered_sources)
    )
    with pytest.raises(neutral.SmtSourceAdapterError):
        subject.validate_prepared_query(tampered)


def test_journal_atom_and_complete_variable_bindings_reject_mutation(
    prepared_sat: subject.PreparedGeometryQuery,
) -> None:
    journal = prepared_sat.query.journal_smt2 + b"(check-sat)\n"
    tampered_journal = subject.PreparedGeometryQuery(
        replace(
            prepared_sat.query,
            journal_commands=prepared_sat.query.journal_commands + ("(check-sat)",),
            journal_smt2=journal,
        )
    )
    with pytest.raises((subject.ATailPiqdCvc5Error, neutral.SmtSourceAdapterError)):
        subject.validate_prepared_query(tampered_journal)

    descriptor = copy.deepcopy(prepared_sat.query.descriptor)
    descriptor["solve"]["readback_variable_ids"] = ["x"]
    with pytest.raises((subject.ATailPiqdCvc5Error, neutral.SmtSourceAdapterError)):
        subject.validate_prepared_query(_repack(prepared_sat, descriptor))

    descriptor = copy.deepcopy(prepared_sat.query.descriptor)
    descriptor["named_atoms"][0]["assumption_term"] = "|wrong|"
    with pytest.raises((subject.ATailPiqdCvc5Error, neutral.SmtSourceAdapterError)):
        subject.validate_prepared_query(_repack(prepared_sat, descriptor))

    descriptor = copy.deepcopy(prepared_sat.query.descriptor)
    semantic = descriptor["semantic_input"]
    semantic["system"]["atoms"][0]["relation"] = "or_ne"
    semantic["system_sha256"] = _sha(_canonical(semantic["system"]))
    descriptor["semantic_sha256"] = _sha(_canonical(semantic))
    with pytest.raises(subject.ATailPiqdCvc5Error, match="arity"):
        subject.validate_prepared_query(_repack(prepared_sat, descriptor))


def test_committed_response_loss_reconciles_without_second_solve(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    fake = FakePiqd("SAT", lose_solve_response=True)
    result = _run(prepared_sat, fake, tmp_path / "loss")
    assert result["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert fake.solve_calls == 1 and len(fake.sessions) == 1 and fake.active == 0
    solve_posts = [
        call for call in fake.calls if call[0] == "POST" and call[1].endswith("/solve")
    ]
    assert len(solve_posts) == 1


def test_export_tamper_fails_before_solve(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    fake = FakePiqd("SAT", exported_suffix=b"(check-sat)\n")
    output = tmp_path / "tamper"
    output.mkdir()
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(neutral.SmtSourceAdapterError, match="GET /smt2 differs"):
            subject.run_prepared_query(
                prepared_sat, transport=fake, output_fd=descriptor
            )
    finally:
        os.close(descriptor)
    assert fake.solve_calls == 0 and len(fake.sessions) == 1 and fake.active == 0


def test_source_capture_rejects_intermediate_and_leaf_symlinks(tmp_path: Path) -> None:
    intermediate = _source_tree(tmp_path / "intermediate")
    census = intermediate / "census"
    real_census = intermediate / "real-census"
    census.rename(real_census)
    census.symlink_to(real_census, target_is_directory=True)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="cannot capture"):
        subject._capture_sources(intermediate)

    leaf_root = _source_tree(tmp_path / "leaf")
    leaf = leaf_root / subject.REQUIRED_SOURCE_PATHS[0]
    outside = tmp_path / "outside.py"
    outside.write_bytes(b"outside\n")
    leaf.unlink()
    leaf.symlink_to(outside)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="cannot capture"):
        subject._capture_sources(leaf_root)


def test_source_capture_rejects_hardlink_nonregular_and_oversize(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    hardlink_root = _source_tree(tmp_path / "hardlink")
    hardlink_leaf = hardlink_root / subject.REQUIRED_SOURCE_PATHS[0]
    os.link(hardlink_leaf, tmp_path / "source-alias.py")
    with pytest.raises(subject.ATailPiqdCvc5Error, match="hard-linked"):
        subject._capture_sources(hardlink_root)

    nonregular_root = _source_tree(tmp_path / "nonregular")
    nonregular_leaf = nonregular_root / subject.REQUIRED_SOURCE_PATHS[0]
    nonregular_leaf.unlink()
    nonregular_leaf.mkdir()
    with pytest.raises(subject.ATailPiqdCvc5Error, match="not regular"):
        subject._capture_sources(nonregular_root)

    oversize_root = _source_tree(tmp_path / "oversize")
    monkeypatch.setattr(subject, "MAX_SOURCE_BYTES", 8)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="exceeds cap"):
        subject._capture_sources(oversize_root)


def test_source_capture_detects_same_size_toctou_with_restored_mtime(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = _source_tree(tmp_path / "toctou")
    target = root / subject.REQUIRED_SOURCE_PATHS[0]
    before = target.stat()
    real_read = subject.os.read
    fired = False

    def mutate_then_read(descriptor: int, count: int) -> bytes:
        nonlocal fired
        if not fired:
            fired = True
            target.write_bytes(b"Z" * before.st_size)
            os.utime(target, ns=(before.st_atime_ns, before.st_mtime_ns))
        return real_read(descriptor, count)

    monkeypatch.setattr(subject.os, "read", mutate_then_read)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="changed during capture"):
        subject._capture_sources(root)


def test_source_capture_detects_ancestor_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = _source_tree(tmp_path / "ancestor")
    ancestor = root / "census" / "atail_force"
    displaced = root / "census" / "atail_force-displaced"
    real_read = subject.os.read
    fired = False

    def replace_then_read(descriptor: int, count: int) -> bytes:
        nonlocal fired
        if not fired:
            fired = True
            ancestor.rename(displaced)
            ancestor.mkdir()
        return real_read(descriptor, count)

    monkeypatch.setattr(subject.os, "read", replace_then_read)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="directory.*changed"):
        subject._capture_sources(root)


def test_parser_token_cap_counts_parentheses(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(subject, "MAX_MODEL_TOKENS", 10)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="too many tokens"):
        subject._tokenize("()()()()()()")


def test_immutable_write_recaptures_exact_bytes_and_fsyncs_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "exact"
    output.mkdir()
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    real_fsync = subject.os.fsync
    synced_modes: list[int] = []

    def record_fsync(opened: int) -> None:
        synced_modes.append(os.fstat(opened).st_mode)
        real_fsync(opened)

    monkeypatch.setattr(subject.os, "fsync", record_fsync)
    try:
        record = subject._write_immutable(descriptor, "artifact.bin", b"exact\0bytes")
    finally:
        os.close(descriptor)
    assert record == {
        "path": "artifact.bin",
        "bytes": 11,
        "sha256": _sha(b"exact\0bytes"),
    }
    assert (output / "artifact.bin").read_bytes() == b"exact\0bytes"
    assert not ((output / "artifact.bin").stat().st_mode & 0o222)
    assert any(stat.S_ISDIR(mode) for mode in synced_modes)


def test_immutable_write_rejects_nonbytes_and_preserves_preexisting_target(
    tmp_path: Path,
) -> None:
    output = tmp_path / "preexisting"
    output.mkdir()
    with pytest.raises(subject.ATailPiqdCvc5Error, match="exact bytes"):
        subject._write_immutable(-1, "bad.bin", bytearray(b"bad"))  # type: ignore[arg-type]

    hostile = output / "hostile.bin"
    hostile.write_bytes(b"hostile")
    target = output / "artifact.bin"
    target.symlink_to(hostile.name)
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(subject.ATailPiqdCvc5Error, match="cannot create"):
            subject._write_immutable(descriptor, target.name, b"ours")
    finally:
        os.close(descriptor)
    assert target.is_symlink() and hostile.read_bytes() == b"hostile"

    existing = output / "existing.bin"
    existing.write_bytes(b"existing")
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(subject.ATailPiqdCvc5Error, match="cannot create"):
            subject._write_immutable(descriptor, existing.name, b"ours")
    finally:
        os.close(descriptor)
    assert existing.read_bytes() == b"existing"


@pytest.mark.parametrize("race", ("hardlink", "size", "replacement", "symlink"))
def test_immutable_write_detects_leaf_races_without_deleting_hostile_targets(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, race: str
) -> None:
    output = tmp_path / race
    output.mkdir()
    target = output / "artifact.bin"
    alias = output / "alias.bin"
    hostile = output / "hostile.bin"
    hostile.write_bytes(b"hostile")
    real_fsync = subject.os.fsync
    fired = False

    def race_after_first_fsync(descriptor: int) -> None:
        nonlocal fired
        real_fsync(descriptor)
        if fired:
            return
        fired = True
        if race == "hardlink":
            os.link(target, alias)
        elif race == "size":
            os.write(descriptor, b"-extra")
        else:
            target.unlink()
            if race == "replacement":
                target.write_bytes(b"replacement")
            else:
                target.symlink_to(hostile.name)

    monkeypatch.setattr(subject.os, "fsync", race_after_first_fsync)
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(subject.ATailPiqdCvc5Error):
            subject._write_immutable(descriptor, target.name, b"ours")
    finally:
        os.close(descriptor)
    assert hostile.read_bytes() == b"hostile"
    if race == "hardlink":
        assert target.exists() and alias.exists()
    elif race == "size":
        assert target.read_bytes() == b"ours-extra"
    elif race == "replacement":
        assert target.read_bytes() == b"replacement"
    else:
        assert target.is_symlink()


def test_immutable_write_fails_closed_when_directory_fsync_fails(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "directory-fsync"
    output.mkdir()
    real_fsync = subject.os.fsync

    def fail_directory_fsync(descriptor: int) -> None:
        if stat.S_ISDIR(os.fstat(descriptor).st_mode):
            raise OSError("simulated directory fsync failure")
        real_fsync(descriptor)

    monkeypatch.setattr(subject.os, "fsync", fail_directory_fsync)
    descriptor = os.open(output, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(subject.ATailPiqdCvc5Error, match="cannot create"):
            subject._write_immutable(descriptor, "artifact.bin", b"ours")
    finally:
        os.close(descriptor)
    assert (output / "artifact.bin").read_bytes() == b"ours"


@pytest.mark.parametrize("status", ("SAT", "UNSAT"))
def test_standalone_validator_accepts_complete_normal_run(
    prepared_sat: subject.PreparedGeometryQuery,
    prepared_unsat: subject.PreparedGeometryQuery,
    tmp_path: Path,
    status: str,
) -> None:
    prepared = prepared_sat if status == "SAT" else prepared_unsat
    output = tmp_path / status.lower()
    expected = _run(prepared, FakePiqd(status), output)
    assert _validate_run(output) == expected


@pytest.mark.parametrize("status", ("SAT", "UNSAT"))
def test_standalone_validator_accepts_reconciled_run(
    prepared_sat: subject.PreparedGeometryQuery,
    prepared_unsat: subject.PreparedGeometryQuery,
    tmp_path: Path,
    status: str,
) -> None:
    prepared = prepared_sat if status == "SAT" else prepared_unsat
    output = tmp_path / f"reconciled-{status.lower()}"
    expected = _run(prepared, FakePiqd(status, lose_solve_response=True), output)
    assert _validate_run(output) == expected


@pytest.mark.parametrize(
    "attack",
    ("tamper", "extra", "missing", "swapped", "symlink", "hardlink"),
)
def test_standalone_validator_rejects_inventory_and_leaf_attacks(
    prepared_sat: subject.PreparedGeometryQuery,
    tmp_path: Path,
    attack: str,
) -> None:
    output = tmp_path / attack
    _run(prepared_sat, FakePiqd("SAT"), output)
    if attack == "tamper":
        _replace_bytes(output / "journal.smt2", b"(set-logic QF_NRA)\n")
    elif attack == "extra":
        (output / "extra.bin").write_bytes(b"extra")
    elif attack == "missing":
        (output / "source-04.py").unlink()
    elif attack == "swapped":
        left = (output / "source-00.py").read_bytes()
        right = (output / "source-01.py").read_bytes()
        _replace_bytes(output / "source-00.py", right)
        _replace_bytes(output / "source-01.py", left)
    elif attack == "symlink":
        (output / "cvc5.smt2").unlink()
        (output / "cvc5.smt2").symlink_to("journal.smt2")
    else:
        (output / "cvc5.smt2").unlink()
        os.link(output / "journal.smt2", output / "cvc5.smt2")
    with pytest.raises(subject.ATailPiqdCvc5Error):
        _validate_run(output)


@pytest.mark.parametrize(
    ("key", "name"),
    (
        ("session", "cvc5.session.json"),
        ("receipts", "cvc5.receipts.json"),
        ("closed_session", "cvc5.closed-session.json"),
    ),
)
def test_standalone_validator_rejects_crossed_lifecycle_artifacts(
    prepared_sat: subject.PreparedGeometryQuery,
    tmp_path: Path,
    key: str,
    name: str,
) -> None:
    fake = FakePiqd("SAT")
    left = tmp_path / f"left-{key}"
    right = tmp_path / f"right-{key}"
    _run(prepared_sat, fake, left)
    _run(prepared_sat, fake, right)
    _replace_bytes(left / name, (right / name).read_bytes())
    _resign_engine_artifact(left, key, name)
    with pytest.raises(subject.ATailPiqdCvc5Error):
        _validate_run(left)


def test_standalone_validator_rejects_crossed_result(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    fake = FakePiqd("SAT")
    left = tmp_path / "left-result"
    right = tmp_path / "right-result"
    _run(prepared_sat, fake, left)
    _run(prepared_sat, fake, right)
    _replace_bytes(
        left / "atail-result.json", (right / "atail-result.json").read_bytes()
    )
    with pytest.raises(subject.ATailPiqdCvc5Error):
        _validate_run(left)


def test_standalone_validator_rejects_resigned_schema_and_session_tamper(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    schema_output = tmp_path / "schema"
    _run(prepared_sat, FakePiqd("SAT"), schema_output)
    descriptor = json.loads((schema_output / "descriptor.json").read_bytes())
    descriptor["schema"] = "hostile-schema/v9"
    _replace_json(schema_output / "descriptor.json", descriptor)
    result = json.loads((schema_output / "atail-result.json").read_bytes())
    result["custody"]["descriptor"] = _artifact_record(
        schema_output / "descriptor.json"
    )
    _replace_json(schema_output / "atail-result.json", result)
    with pytest.raises(subject.ATailPiqdCvc5Error):
        _validate_run(schema_output)

    session_output = tmp_path / "session"
    _run(prepared_sat, FakePiqd("SAT"), session_output)
    session = json.loads((session_output / "cvc5.session.json").read_bytes())
    session["label"] = "resigned-but-hostile"
    _replace_json(session_output / "cvc5.session.json", session)
    _resign_engine_artifact(session_output, "session", "cvc5.session.json")
    with pytest.raises(subject.ATailPiqdCvc5Error):
        _validate_run(session_output)


def test_standalone_validator_replays_persisted_sat_semantics(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    output = tmp_path / "semantic"
    _run(prepared_sat, FakePiqd("SAT"), output)
    semantic = json.loads((output / "cvc5.semantic.json").read_bytes())
    semantic["evidence"]["atom_count"] += 1
    _replace_json(output / "cvc5.semantic.json", semantic)
    result = json.loads((output / "atail-result.json").read_bytes())
    result["engine"]["semantic_replay"] = semantic
    result["engine"]["artifacts"]["semantic"] = _artifact_record(
        output / "cvc5.semantic.json"
    )
    _replace_json(output / "atail-result.json", result)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="semantic replay"):
        _validate_run(output)


def test_standalone_validator_rejects_unsat_claim_escalation(
    prepared_unsat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    output = tmp_path / "unsat-claims"
    _run(prepared_unsat, FakePiqd("UNSAT"), output)
    result = json.loads((output / "atail-result.json").read_bytes())
    result["claims"]["theorem"] = True
    result["engine"]["claims"]["theorem"] = True
    _replace_json(output / "atail-result.json", result)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="reconstruction"):
        _validate_run(output)


def test_standalone_validator_rejects_noncanonical_json_and_bool_int_alias(
    prepared_sat: subject.PreparedGeometryQuery, tmp_path: Path
) -> None:
    noncanonical = tmp_path / "noncanonical"
    _run(prepared_sat, FakePiqd("SAT"), noncanonical)
    result = json.loads((noncanonical / "atail-result.json").read_bytes())
    _replace_bytes(
        noncanonical / "atail-result.json",
        json.dumps(result, indent=2).encode() + b"\n",
    )
    with pytest.raises(subject.ATailPiqdCvc5Error, match="canonical JSON"):
        _validate_run(noncanonical)

    type_alias = tmp_path / "type-alias"
    _run(prepared_sat, FakePiqd("SAT"), type_alias)
    result = json.loads((type_alias / "atail-result.json").read_bytes())
    result["core_entitlement"] = 0
    result["claims"]["theorem"] = 0
    _replace_json(type_alias / "atail-result.json", result)
    with pytest.raises(subject.ATailPiqdCvc5Error, match="reconstruction"):
        _validate_run(type_alias)

    with pytest.raises(subject.ATailPiqdCvc5Error, match="fd is invalid"):
        subject.validate_run_directory(True)
    deeply_nested = b"[" * 1_100 + b"0" + b"]" * 1_100 + b"\n"
    with pytest.raises(subject.ATailPiqdCvc5Error, match="strict UTF-8 JSON|depth cap"):
        subject._strict_json_artifact(deeply_nested, "deep artifact")


def test_standalone_validator_final_recapture_detects_result_replacement(
    prepared_sat: subject.PreparedGeometryQuery,
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "toctou"
    _run(prepared_sat, FakePiqd("SAT"), output)
    result_path = output / "atail-result.json"
    original_bytes = result_path.read_bytes()
    real_finalize = subject._finalize_run_directory_capture

    def replace_then_finalize(
        descriptor: int,
        identity: tuple[int, int, int, int, int, int, int],
        files: Mapping[str, bytes],
    ) -> None:
        _replace_bytes(result_path, original_bytes)
        real_finalize(descriptor, identity, files)

    monkeypatch.setattr(
        subject, "_finalize_run_directory_capture", replace_then_finalize
    )
    with pytest.raises(subject.ATailPiqdCvc5Error, match="changed during validation"):
        _validate_run(output)
