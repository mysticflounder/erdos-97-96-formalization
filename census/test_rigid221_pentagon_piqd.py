from __future__ import annotations

import hashlib
import json
import os
import stat
import uuid
from collections.abc import Mapping, Sequence
from fractions import Fraction
from pathlib import Path
from typing import Any

import pytest

from census import rigid221_pentagon_oracle as oracle
from census import rigid221_pentagon_piqd as subject
from census.p97_search import phase3_piqd_smt_source_adapter as neutral


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _session(
    session_id: str,
    label: str,
    *,
    state: str = "live",
    commands: int = 0,
    status: str | None = None,
    labelled: bool = False,
) -> dict[str, object]:
    solved = status is not None
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": "z3",
        "solver_sha256": _sha(b"fake-z3"),
        "solver_signature": "z3 rigid221-fake-current-schema",
        "protocol_version": 1,
        "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + int(solved),
        "clauses": commands,
        "max_var": 0,
        "solves": int(solved),
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": 1 if solved else None,
        "last_assumption_free": (not labelled) if solved else None,
        "last_terminal_unsat": (not labelled) if status == "UNSAT" else None,
        "label": label,
    }


class _TransportExplosion(RuntimeError):
    pass


class _TransportAbort(BaseException):
    pass


class FakePiqd:
    """Current-schema, single-threaded fake for both public one-shot routes."""

    def __init__(
        self,
        statuses: Sequence[str],
        *,
        values: str | None = None,
        tamper: str | None = None,
        explode: BaseException | None = None,
    ) -> None:
        self.statuses = list(statuses)
        self.values = values
        self.tamper = tamper
        self.explode = explode
        self.sessions: dict[str, dict[str, Any]] = {}
        self.created_ids: list[str] = []
        self.deleted_ids: list[str] = []
        self.events: list[tuple[str, str]] = []
        self.live = 0
        self.max_live = 0

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        self.events.append((method, path))
        if method == "POST" and path == "/sessions":
            assert body is not None and set(body) == {"solver", "lane", "label"}
            assert body["solver"] == "z3" and body["lane"] == "smt"
            session_id = str(uuid.UUID(int=len(self.created_ids) + 1))
            self.sessions[session_id] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "answer": None,
                "receipt": None,
                "labelled": False,
            }
            self.created_ids.append(session_id)
            self.live += 1
            self.max_live = max(self.live, self.max_live)
            return neutral.JsonResponse(201, _session(session_id, str(body["label"])))

        session_id, suffix = self._route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            commands = list(body["commands"])
            assert all(type(command) is str for command in commands)
            data["commands"] = commands
            data["journal"] = b"".join(command.encode() + b"\n" for command in commands)
            return neutral.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            if self.explode is not None:
                explosion = self.explode
                self.explode = None
                raise explosion
            assert body is not None
            labelled = "assumption_labels" in body
            data["labelled"] = labelled
            answer = self._answer(self.statuses.pop(0), body, labelled)
            if labelled:
                result_digest = subject.labelled_result_digest(answer)
                request_digest = _named_request_digest(data, body)
            else:
                result_digest = neutral.piqd_result_digest(answer)
                request_digest = None
            if self.tamper == "result-digest":
                result_digest = "d" * 64
            response: dict[str, object] = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": result_digest,
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
            }
            if labelled:
                response.update(
                    {
                        "request_id": body["request_id"],
                        "request_sha256": (
                            "a" * 64
                            if self.tamper == "request-digest"
                            else request_digest
                        ),
                    }
                )
            receipt = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "z3 rigid221-fake-current-schema",
                "solver_sha256": _sha(b"fake-z3"),
                "assumptions": list(body["assumptions"]),
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
                "include_model": True,
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": result_digest,
                "at": 14,
            }
            if labelled:
                receipt.update(
                    {
                        "assumption_labels": list(body["assumption_labels"]),
                        "request_id": body["request_id"],
                        "request_sha256": request_digest,
                    }
                )
                if self.tamper == "receipt-labels":
                    receipt["assumption_labels"] = ["crossed"]
                if self.tamper == "receipt-result":
                    receipt["result_sha256"] = "e" * 64
            data["answer"] = answer
            data["receipt"] = receipt
            return neutral.JsonResponse(200, response)
        if method == "GET" and suffix == "":
            answer = data["answer"] or {}
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    commands=len(data["commands"]),
                    status=answer.get("status"),
                    labelled=data["labelled"],
                ),
            )
        if method == "GET" and suffix == "/receipts":
            receipts = [] if data["receipt"] is None else [data["receipt"]]
            envelope_session = (
                str(uuid.UUID(int=999))
                if self.tamper == "receipt-session" and receipts
                else session_id
            )
            return neutral.JsonResponse(
                200,
                {
                    "session_id": envelope_session,
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
            self.live -= 1
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    state="closed",
                    commands=len(data["commands"]),
                    status=answer.get("status"),
                    labelled=data["labelled"],
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
        assert pieces[2] in self.sessions
        return pieces[2], "" if len(pieces) == 3 else f"/{pieces[3]}"

    def _answer(
        self, status: str, body: Mapping[str, object], labelled: bool
    ) -> dict[str, object]:
        if status == "SAT":
            answer: dict[str, object] = {
                "status": "SAT",
                "model": "(model)",
                "values": self.values,
            }
            if labelled:
                answer["core_labels"] = []
            return answer
        if status == "UNSAT":
            assumptions = list(body["assumptions"])
            answer = {
                "status": "UNSAT",
                "core": assumptions,
                "terminal_unsat": not assumptions,
            }
            if labelled:
                labels = list(body["assumption_labels"])
                if self.tamper == "core-label":
                    labels[0] = "crossed-core-label"
                if self.tamper == "null-core-label":
                    labels[0] = None
                answer["core_labels"] = labels
            return answer
        assert status == "UNKNOWN"
        answer = {"status": "UNKNOWN"}
        if labelled:
            answer["core_labels"] = []
        return answer


def _named_request_digest(data: Mapping[str, Any], body: Mapping[str, object]) -> str:
    digest = hashlib.sha256(b"piqd-smt-solve-request/v1")
    digest.update(
        (
            f"\nbase={len(data['commands'])}:{len(data['journal'])}:"
            f"{_sha(data['journal'])}"
        ).encode()
    )
    digest.update(f"\ntimeout={body['timeout_ms']}\nmodel=true".encode())
    for field in ("assumptions", "get_values", "assumption_labels"):
        values = body[field]
        digest.update(f"\n{field}={len(values)}".encode())
        for value in values:
            encoded = value.encode()
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    return digest.hexdigest()


def _smoke_system() -> dict[str, object]:
    return {
        "system_id": "rigid221-test-smoke",
        "n": 5,
        "profile": [0, 0, 0],
        "order": [0, 1, 2, 3, 4],
        "rows": [oracle.MetricRow(0, (1, 2, 3, 4), True).as_dict()],
        "sources": [],
    }


def _stage5_query(*, named: bool = False):
    arguments = {
        "order": (0, 6, 4, 2, 3, 1, 5),
        "variant": "base+exact+chord",
        "class_exact": True,
        "chord": True,
        "apex_same_side": False,
        "timeout_ms": 1000,
    }
    if named:
        return subject.prepare_named_core_query(
            arguments["order"], timeout_ms=arguments["timeout_ms"]
        )
    return subject.prepare_stage5_query(**arguments)


def _stage5_values(query: neutral.SourceSemanticQuery, *, tamper: bool = False) -> str:
    coordinates = {
        "x_0": Fraction(0),
        "y_0": Fraction(0),
        "x_1": Fraction(1),
        "y_1": Fraction(0),
        "x_2": Fraction(481, 656),
        "y_2": Fraction(-65, 656),
        "x_3": Fraction(125, 148),
        "y_3": Fraction(-5, 74),
        "x_4": Fraction(1, 2),
        "y_4": Fraction(-1, 8),
        "x_5": Fraction(1, 2),
        "y_5": Fraction(15, 16),
        "x_6": Fraction(15, 64),
        "y_6": Fraction(-1, 8),
        "chord_a": Fraction(0),
        "chord_b": Fraction(-1),
        "chord_c": Fraction(1, 2),
    }
    if tamper:
        coordinates["x_2"] = Fraction(0)
    return (
        "("
        + " ".join(f"({term} {coordinates[term]})" for term in query.get_values)
        + ")"
    )


def _open_dir(path: Path) -> int:
    return os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)


def test_default_route_is_piqd_and_private_probe_is_legacy_only(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    calls: list[dict[str, object]] = []
    monkeypatch.setattr(subject, "run_campaign", lambda **kwargs: calls.append(kwargs))
    monkeypatch.setattr(
        oracle,
        "_legacy_main",
        lambda _timeout: (_ for _ in ()).throw(AssertionError("local fallback")),
    )
    output = tmp_path / "new-output"
    assert oracle.main(["--output", str(output)]) == 0
    assert calls == [
        {
            "output_directory": output,
            "timeout_s": 20.0,
            "server": "http://127.0.0.1:7272",
        }
    ]
    production = Path(subject.__file__).read_text()
    assert "_probe_system" not in production


def test_explicit_legacy_backend_is_the_only_local_route(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[float] = []
    monkeypatch.setattr(
        oracle, "_legacy_main", lambda timeout: calls.append(timeout) or 7
    )
    assert oracle.main(["--backend", "legacy-local-z3", "--timeout", "3"]) == 7
    assert calls == [3.0]


def test_public_queries_bind_exact_sources_query_order_and_groups() -> None:
    metric_query = subject.prepare_metric_query(
        _smoke_system(), stage_id="stage0-smoke", timeout_ms=1000
    )
    assert metric_query.journal_smt2 == b"".join(
        command.encode() + b"\n" for command in metric_query.journal_commands
    )
    assert metric_query.descriptor["semantic_input"]["system"] == _smoke_system()
    assert [item.path for item in metric_query.source_files] == sorted(
        item.path for item in metric_query.source_files
    )
    for source in metric_query.source_files[1:]:
        relative = source.path.split("-", 1)[1].replace("--", "/")
        assert source.payload == (subject._ROOT / relative).read_bytes()

    query, labels = _stage5_query(named=True)
    semantic = query.descriptor["semantic_input"]
    assert semantic["order"] == [0, 6, 4, 2, 3, 1, 5]
    assert [group["index"] for group in semantic["groups"]] == list(
        range(len(semantic["groups"]))
    )
    oracle_bytes = Path(oracle.__file__).read_bytes()
    ledger_sha = _sha(
        subject._canonical([list(item) for item in oracle._CAP_LAYER_LEDGER])
    )
    for index, (binding, label) in enumerate(
        zip(semantic["groups"], labels, strict=True)
    ):
        basis = {
            key: value
            for key, value in binding.items()
            if key not in {"binding_sha256", "assumption_label"}
        }
        digest = _sha(subject._canonical(basis))
        assert binding["oracle_source"]["sha256"] == _sha(oracle_bytes)
        assert binding["oracle_source"]["bytes"] == len(oracle_bytes)
        assert binding["ledger_sha256"] == ledger_sha
        assert binding["binding_sha256"] == digest
        assert label == f"rigid221-ledger/{index:03d}/{binding['tag']}/{digest}"
        assert binding["assumption_label"] == label
    assert query.assumptions == tuple(
        group["assumption_term"] for group in semantic["groups"]
    )


def test_stage5_exact_rational_sat_replay_and_tamper() -> None:
    query = _stage5_query()
    accepted = subject.verify_stage5_sat(query, "z3", "(model)", _stage5_values(query))
    rejected = subject.verify_stage5_sat(
        query, "z3", "(model)", _stage5_values(query, tamper=True)
    )
    assert accepted.accepted and accepted.evidence["all_assertions_true"] is True
    assert not rejected.accepted and rejected.evidence["failed"]
    with pytest.raises(subject.Rigid221PiqdError, match="non-rational"):
        subject.verify_stage5_sat(query, "z3", "(model)", "((x_0 (root-obj 1)))")


def test_public_stage5_sessions_are_fresh_strictly_sequential_one_shot(
    tmp_path: Path,
) -> None:
    query = _stage5_query()
    fake = FakePiqd(["UNSAT", "UNSAT"])
    used: set[str] = set()
    for index in range(2):
        directory = tmp_path / str(index)
        directory.mkdir()
        descriptor = _open_dir(directory)
        try:
            engine = subject.run_stage5_query(
                query, transport=fake, output_fd=descriptor, used_session_ids=used
            )
        finally:
            os.close(descriptor)
        assert engine["effective_status"] == "UNSAT_DISCOVERY_ONLY"
    assert len(set(fake.created_ids)) == 2
    assert fake.created_ids == fake.deleted_ids
    assert fake.max_live == 1 and fake.live == 0
    assert all(data["answer"] is not None for data in fake.sessions.values())


@pytest.mark.parametrize(
    ("raw_status", "effective_status"),
    [
        ("SAT", "SAT_SEMANTICALLY_REPLAYED"),
        ("UNSAT", "UNSAT_DISCOVERY_ONLY"),
        ("UNKNOWN", "INCONCLUSIVE_UNKNOWN"),
    ],
)
def test_campaign_recorder_accepts_only_public_effective_statuses(
    tmp_path: Path, raw_status: str, effective_status: str
) -> None:
    query = _stage5_query()
    fake = FakePiqd([raw_status], values=_stage5_values(query))
    descriptor = _open_dir(tmp_path)
    try:
        record, engine = subject._record_job(
            descriptor,
            0,
            "stage5",
            query,
            subject.run_stage5_query,
            transport=fake,
            used_session_ids=set(),
        )
    finally:
        os.close(descriptor)
    assert record["status"] == effective_status
    assert engine["effective_status"] == effective_status
    assert record["diagnostic_only"] is True
    assert (
        json.loads((tmp_path / record["directory"] / "job.json").read_bytes()) == record
    )


@pytest.mark.parametrize(
    "tamper",
    [
        "core-label",
        "null-core-label",
        "receipt-labels",
        "receipt-session",
        "receipt-result",
        "request-digest",
        "result-digest",
    ],
)
def test_named_core_rejects_label_receipt_session_and_digest_crossing(
    tmp_path: Path, tamper: str
) -> None:
    query, labels = _stage5_query(named=True)
    fake = FakePiqd(["UNSAT"], tamper=tamper)
    descriptor = _open_dir(tmp_path)
    try:
        with pytest.raises(subject.Rigid221PiqdError):
            subject.run_named_core_query(
                query,
                labels,
                transport=fake,
                output_fd=descriptor,
                used_session_ids=set(),
            )
    finally:
        os.close(descriptor)
    assert fake.created_ids == fake.deleted_ids


def test_named_core_success_is_diagnostic_and_cross_bound(tmp_path: Path) -> None:
    query, labels = _stage5_query(named=True)
    fake = FakePiqd(["UNSAT"])
    descriptor = _open_dir(tmp_path)
    try:
        artifact = subject.run_named_core_query(
            query,
            labels,
            transport=fake,
            output_fd=descriptor,
            used_session_ids=set(),
        )
    finally:
        os.close(descriptor)
    assert artifact["status"] == "UNSAT"
    assert artifact["proofless_unsat"] is True
    assert artifact["diagnostic_only"] is True
    assert artifact["assumption_labels"] == list(labels)
    assert artifact["core_labels"] == list(labels)
    assert artifact["claims"]["source_entitlement"] is False
    assert artifact["claims"]["proof"] is False
    assert json.loads((tmp_path / "named-core.json").read_bytes()) == artifact


@pytest.mark.parametrize("explosion", [_TransportExplosion("boom"), _TransportAbort()])
def test_unexpected_exception_and_baseexception_propagate_without_fallback(
    tmp_path: Path, explosion: BaseException
) -> None:
    query, labels = _stage5_query(named=True)
    fake = FakePiqd(["UNSAT"], explode=explosion)
    descriptor = _open_dir(tmp_path)
    try:
        with pytest.raises(BaseException) as caught:
            subject.run_named_core_query(
                query,
                labels,
                transport=fake,
                output_fd=descriptor,
                used_session_ids=set(),
            )
    finally:
        os.close(descriptor)
    assert caught.value is explosion
    assert len(fake.created_ids) == 1
    assert fake.created_ids == fake.deleted_ids


@pytest.mark.parametrize("kind", ["symlink", "hardlink", "fifo", "oversize"])
def test_source_capture_rejects_link_nonregular_and_oversize(
    tmp_path: Path, kind: str
) -> None:
    ordinary = tmp_path / "ordinary"
    ordinary.write_bytes(b"source")
    candidate = tmp_path / "candidate"
    cap = 1024
    if kind == "symlink":
        candidate.symlink_to(ordinary)
    elif kind == "hardlink":
        os.link(ordinary, candidate)
    elif kind == "fifo":
        os.mkfifo(candidate)
    else:
        candidate.write_bytes(b"xx")
        cap = 1
    with pytest.raises(subject.Rigid221PiqdError):
        subject.capture_source(candidate, cap=cap)


def test_source_capture_rejects_component_symlink_and_rebind_toctou(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    source = real / "source"
    source.write_bytes(b"one")
    linked = tmp_path / "linked"
    linked.symlink_to(real, target_is_directory=True)
    with pytest.raises(subject.Rigid221PiqdError):
        subject.capture_source(linked / "source")

    original = subject._open_componentwise
    calls = 0

    def rebound(path: Path, *, directory: bool) -> int:
        nonlocal calls
        calls += 1
        if calls == 2:
            source.rename(real / "old")
            source.write_bytes(b"two")
        return original(path, directory=directory)

    monkeypatch.setattr(subject, "_open_componentwise", rebound)
    with pytest.raises(subject.Rigid221PiqdError, match="path changed"):
        subject.capture_source(source)


@pytest.mark.parametrize("kind", ["symlink", "hardlink", "fifo", "oversize"])
def test_publication_inventory_rejects_hostile_entries(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, kind: str
) -> None:
    root = tmp_path / "root"
    root.mkdir()
    ordinary = root / "ordinary"
    ordinary.write_bytes(b"safe")
    candidate = root / "candidate"
    if kind == "symlink":
        candidate.symlink_to(ordinary)
    elif kind == "hardlink":
        os.link(ordinary, candidate)
    elif kind == "fifo":
        os.mkfifo(candidate)
    else:
        candidate.write_bytes(b"xx")
        monkeypatch.setattr(subject, "MAX_PUBLICATION_FILE_BYTES", 1)
    descriptor = _open_dir(root)
    try:
        with pytest.raises(subject.Rigid221PiqdError):
            subject._inventory_from_fd(descriptor)
    finally:
        os.close(descriptor)


@pytest.mark.parametrize("kind", ["directory", "file", "symlink", "fifo"])
def test_output_is_create_once_and_preexisting_target_is_untouched(
    tmp_path: Path, kind: str
) -> None:
    output = tmp_path / "output"
    if kind == "directory":
        output.mkdir()
    elif kind == "file":
        output.write_bytes(b"keep")
    elif kind == "symlink":
        output.symlink_to(tmp_path)
    else:
        os.mkfifo(output)
    before = os.lstat(output)
    with pytest.raises(subject.Rigid221PiqdError, match="already exists"):
        subject._reserve_staging(output)
    after = os.lstat(output)
    assert subject._identity(before) == subject._identity(after)


def test_atomic_publication_rejects_target_race_without_deletion(
    tmp_path: Path,
) -> None:
    output = tmp_path / "output"
    staging = subject._reserve_staging(output)
    hostile = b"preexisting-hostile-target"
    output.write_bytes(hostile)
    try:
        with pytest.raises(subject.Rigid221PiqdError, match="appeared"):
            subject._publish_noreplace(staging)
        assert output.read_bytes() == hostile
        assert os.stat(staging.staging_name, dir_fd=staging.parent_fd).st_nlink == 2
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


def test_publication_rejects_parent_path_toctou_and_keeps_staging(
    tmp_path: Path,
) -> None:
    parent = tmp_path / "parent"
    parent.mkdir()
    output = parent / "output"
    staging = subject._reserve_staging(output)
    moved = tmp_path / "moved"
    parent.rename(moved)
    parent.mkdir()
    try:
        with pytest.raises(subject.Rigid221PiqdError, match="parent path changed"):
            subject._publish_noreplace(staging)
        assert (moved / staging.staging_name).is_dir()
        assert not output.exists()
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


def test_inventory_detects_read_toctou(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    source = tmp_path / "source"
    source.write_bytes(b"abcdef")
    original_read = os.read
    changed = False

    def mutate(descriptor: int, size: int) -> bytes:
        nonlocal changed
        chunk = original_read(descriptor, size)
        if chunk and not changed:
            changed = True
            source.write_bytes(b"x")
        return chunk

    monkeypatch.setattr(os, "read", mutate)
    descriptor = _open_dir(tmp_path)
    try:
        with pytest.raises(subject.Rigid221PiqdError, match="changed while captured"):
            subject._inventory_from_fd(descriptor)
    finally:
        os.close(descriptor)


def test_standalone_check_validates_fake_publication_with_zero_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    output = tmp_path / "published"
    output.mkdir()
    query = _stage5_query()
    fake = FakePiqd(["UNSAT"])
    descriptor = _open_dir(output)
    try:
        record, _engine = subject._record_job(
            descriptor,
            0,
            "stage5",
            query,
            subject.run_stage5_query,
            transport=fake,
            used_session_ids=set(),
        )
        campaign = {
            "schema": subject.RESULT_SCHEMA,
            "workers": 1,
            "sequential": True,
            "fresh_session_per_query": True,
            "solve_count_per_session": 1,
            "local_fallback": False,
            "jobs": [record],
            "source_files": subject._campaign_sources(),
            "proof_blueprint": dict(subject.PROOF_BLUEPRINT),
        }
        subject._write_exclusive(
            descriptor, "campaign.json", subject._canonical(campaign) + b"\n"
        )
        inventory = subject._inventory_from_fd(descriptor)
        manifest = {
            "schema": subject.MANIFEST_SCHEMA,
            "files": inventory,
            "file_count": len(inventory),
            "total_bytes": sum(item["bytes"] for item in inventory),
            "root_digest": subject._sha(subject._canonical(inventory)),
        }
        subject._write_exclusive(
            descriptor, "manifest.json", subject._canonical(manifest) + b"\n"
        )
    finally:
        os.close(descriptor)

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("offline --check attempted transport")

    monkeypatch.setattr(neutral, "UrllibPiqdTransport", forbidden)
    assert subject.main(["--check", str(output)]) == 0
    assert oracle.main(["--check", str(output)]) == 0


def test_check_mode_performs_zero_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("offline --check attempted transport")

    monkeypatch.setattr(neutral, "UrllibPiqdTransport", forbidden)
    empty = tmp_path / "empty"
    empty.mkdir()
    with pytest.raises(subject.Rigid221PiqdError):
        subject.main(["--check", str(empty)])
    with pytest.raises(subject.Rigid221PiqdError):
        oracle.main(["--check", str(empty)])


def test_unknown_and_proofless_unsat_are_not_proof_closure() -> None:
    assert subject.PROOF_BLUEPRINT == {
        "session_id": "019fdf9c",
        "state": "OPEN",
        "relation": "OFF_SPINE",
        "changed": False,
    }
    assert all(value is False for value in subject.FALSE_CLAIMS.values())
    assert subject.FALSE_CLAIMS["proof"] is False
    assert subject.FALSE_CLAIMS["global"] is False
    assert stat.S_ISREG(os.stat(subject.__file__).st_mode)
