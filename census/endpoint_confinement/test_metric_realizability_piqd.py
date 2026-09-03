from __future__ import annotations

import builtins
import hashlib
import json
import os
import sys
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import replace
from fractions import Fraction
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.endpoint_confinement import metric_realizability_piqd as subject
from census.endpoint_confinement import metric_realizability_probe as producer
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
        "solver_signature": f"{solver} endpoint-test-current-schema",
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
        "last_terminal_unsat": (None if solves == 0 and not stale else terminal_unsat),
        "label": label,
    }


class FakeEndpointPiqd:
    """Current-schema fake for exactly the PIQD SMT session routes used here."""

    def __init__(
        self,
        statuses: Sequence[str],
        *,
        values: str | None = None,
        exported_suffix: bytes = b"",
        receipt_tamper: bool = False,
        stale_create: bool = False,
        crossed_create: bool = False,
        reuse_session_id: bool = False,
        fail_solve: bool = False,
    ) -> None:
        self.statuses = list(statuses)
        self.values = values
        self.exported_suffix = exported_suffix
        self.receipt_tamper = receipt_tamper
        self.stale_create = stale_create
        self.crossed_create = crossed_create
        self.reuse_session_id = reuse_session_id
        self.fail_solve = fail_solve
        self.sessions: dict[str, dict[str, Any]] = {}
        self.created_ids: list[str] = []
        self.deleted_ids: list[str] = []
        self.stage_commands: list[list[str]] = []

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> neutral.JsonResponse:
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert body["solver"] == "z3" and body["lane"] == "smt"
            session_id = str(
                uuid.UUID(int=1 if self.reuse_session_id else len(self.created_ids) + 1)
            )
            data: dict[str, Any] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "solve": None,
                "answer": None,
                "receipt": None,
            }
            self.sessions[session_id] = data
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
            if self.fail_solve:
                raise neutral.PiqdTransportLoss("simulated endpoint transport loss")
            assert body is not None
            assert set(body) == {
                "assumptions",
                "timeout_ms",
                "include_model",
                "get_values",
            }
            assert body["assumptions"] == [] and body["include_model"] is True
            assert len(body["get_values"]) == 10
            status = self.statuses.pop(0)
            answer = self._answer(status, list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            response = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": digest,
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
            }
            receipt = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": (
                    "e" * 64 if self.receipt_tamper else _sha(data["journal"])
                ),
                "solver_signature": "z3 endpoint-test-current-schema",
                "solver_sha256": _sha(b"binary:z3"),
                "assumptions": [],
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
                "include_model": True,
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": digest,
                "at": 14,
            }
            data["solve"] = dict(body)
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
        session_id, suffix = self._route(path)
        assert method == "GET" and suffix == "/smt2"
        return neutral.BytesResponse(
            200, self.sessions[session_id]["journal"] + self.exported_suffix
        )

    def _route(self, path: str) -> tuple[str, str]:
        pieces = path.split("/")
        assert len(pieces) in {3, 4} and pieces[:2] == ["", "sessions"]
        session_id = pieces[2]
        assert session_id in self.sessions
        return session_id, "" if len(pieces) == 3 else f"/{pieces[3]}"

    def _answer(self, status: str, variable_ids: list[str]) -> dict[str, object]:
        if status == "SAT":
            return {
                "status": "SAT",
                "model": "(model)",
                "values": self.values or _smoke_values(variable_ids),
            }
        if status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        assert status == "UNKNOWN"
        return {"status": "UNKNOWN"}


def _smoke_values(variable_ids: Sequence[str]) -> str:
    coordinates = {
        "x_0": "0",
        "y_0": "0",
        "x_1": "1",
        "y_1": "0",
        "x_2": "(/ 4 5)",
        "y_2": "(/ 3 5)",
        "x_3": "0",
        "y_3": "1",
        "x_4": "(- (/ 4 5))",
        "y_4": "(/ 3 5)",
    }
    terms = {item["id"]: item["term"] for item in subject._variables(5)}
    return (
        "("
        + " ".join(
            f"({terms.get(variable_id, variable_id)} "
            f"{coordinates[terms.get(variable_id, variable_id)]})"
            for variable_id in variable_ids
        )
        + ")"
    )


def _smoke_sat() -> dict[str, Any]:
    return producer._smoke_systems()[0]


def _direct_source_document() -> dict[str, Any]:
    system: dict[str, Any] = {
        "n": 8,
        "order": list(range(8)),
        "rows": [
            {
                "center": 0,
                "support": [1, 2, 3, 4, 5, 6],
                "exact": True,
            }
        ],
    }
    identity = json.dumps(system, sort_keys=True, separators=(",", ":"))
    return {
        "schema": producer.DIRECT_SYSTEM_SOURCE_SCHEMA,
        "system_id": hashlib.sha256(identity.encode()).hexdigest()[:20],
        **system,
    }


def _mec_direct_source_document(
    mec_apices: Sequence[int] = (0, 1, 2),
) -> dict[str, Any]:
    system: dict[str, Any] = {
        "n": 4,
        "order": [0, 1, 2, 3],
        "rows": [],
        "mec_apices": list(mec_apices),
    }
    identity = json.dumps(system, sort_keys=True, separators=(",", ":"))
    return {
        "schema": producer.DIRECT_SYSTEM_MEC_SOURCE_SCHEMA,
        "system_id": hashlib.sha256(identity.encode()).hexdigest()[:20],
        **system,
    }


def _mec_values(
    variable_ids: Sequence[str], *, mx: str = "(/ 1 2)", r2: str = "(/ 1 2)"
) -> str:
    values = {
        "x_0": "0",
        "y_0": "0",
        "x_1": "1",
        "y_1": "0",
        "x_2": "1",
        "y_2": "1",
        "x_3": "0",
        "y_3": "1",
        "mec_x": mx,
        "mec_y": "(/ 1 2)",
        "mec_r2": r2,
    }
    terms = {
        item["id"]: item["term"]
        for item in subject._variables(4, include_mec=True)
    }
    return (
        "("
        + " ".join(
            f"({terms[variable_id]} {values[terms[variable_id]]})"
            for variable_id in variable_ids
        )
        + ")"
    )


class _FakeArithmetic:
    def __init__(self, evaluate: Any) -> None:
        self.evaluate = evaluate

    @staticmethod
    def coerce(value: object) -> _FakeArithmetic:
        if isinstance(value, _FakeArithmetic):
            return value
        return _FakeArithmetic(lambda _model: Fraction(value))

    def binary(self, other: object, operation: Any) -> _FakeArithmetic:
        right = self.coerce(other)
        return _FakeArithmetic(
            lambda model: operation(self.evaluate(model), right.evaluate(model))
        )

    def __add__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left + right)

    def __radd__(self, other: object) -> _FakeArithmetic:
        return self.coerce(other).__add__(self)

    def __sub__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left - right)

    def __rsub__(self, other: object) -> _FakeArithmetic:
        return self.coerce(other).__sub__(self)

    def __mul__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left * right)

    def __rmul__(self, other: object) -> _FakeArithmetic:
        return self.coerce(other).__mul__(self)

    def __truediv__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left / right)

    def __pow__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left ** int(right))

    def __eq__(self, other: object) -> _FakeArithmetic:  # type: ignore[override]
        return self.binary(other, lambda left, right: left == right)

    def __gt__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left > right)

    def __ge__(self, other: object) -> _FakeArithmetic:
        return self.binary(other, lambda left, right: left >= right)


class _FakeZ3Value:
    def __init__(self, value: object) -> None:
        self.value = value

    def numerator_as_long(self) -> int:
        assert isinstance(self.value, Fraction)
        return self.value.numerator

    def denominator_as_long(self) -> int:
        assert isinstance(self.value, Fraction)
        return self.value.denominator


def _fake_z3_module(model_values: Mapping[str, Fraction]) -> object:
    sat = object()
    unsat = object()

    def variable(name: str) -> _FakeArithmetic:
        return _FakeArithmetic(lambda model: model[name])

    class Model:
        def eval(self, expression: _FakeArithmetic, **_kwargs: object) -> _FakeZ3Value:
            return _FakeZ3Value(expression.evaluate(model_values))

    class Solver:
        def add(self, *_assertions: _FakeArithmetic) -> None:
            pass

        def set(self, *_args: object) -> None:
            pass

        def check(self) -> object:
            return sat

        def model(self) -> Model:
            return Model()

    return SimpleNamespace(
        Real=variable,
        Reals=lambda names: tuple(variable(name) for name in names.split()),
        RealVal=lambda value: _FakeArithmetic.coerce(value),
        Tactic=lambda _name: SimpleNamespace(solver=Solver),
        sat=sat,
        unsat=unsat,
        simplify=lambda value: value,
        is_true=lambda value: isinstance(value, _FakeZ3Value) and value.value is True,
        is_rational_value=lambda value: (
            isinstance(value, _FakeZ3Value) and isinstance(value.value, Fraction)
        ),
        is_algebraic_value=lambda _value: False,
    )


def _fixture_pins() -> list[dict[str, object]]:
    return [
        {"term": "x_2", "numerator": 4, "denominator": 5},
        {"term": "y_2", "numerator": 3, "denominator": 5},
        {"term": "x_3", "numerator": 0, "denominator": 1},
        {"term": "y_3", "numerator": 1, "denominator": 1},
        {"term": "x_4", "numerator": -4, "denominator": 5},
        {"term": "y_4", "numerator": 3, "denominator": 5},
    ]


def _selected_prefilter_system() -> dict[str, Any]:
    return {
        "system_id": "e1f357be73ee7fb3a72f",
        "n": 11,
        "profile": [6, 4, 4],
        "order": [0, 9, 10, 1, 3, 4, 5, 6, 2, 7, 8],
        "rows": [
            {"center": 0, "exact": True, "support": [1, 2, 4, 6]},
            {"center": 1, "exact": True, "support": [0, 6, 7, 8]},
            {"center": 2, "exact": True, "support": [1, 7, 9, 10]},
            {"center": 3, "exact": True, "support": [1, 4, 5, 8]},
            {"center": 4, "exact": False, "support": [3, 5, 6, 10]},
            {"center": 5, "exact": False, "support": [2, 3, 4, 7]},
            {"center": 6, "exact": False, "support": [2, 5, 8, 10]},
            {"center": 7, "exact": True, "support": [0, 3, 6, 9]},
            {"center": 8, "exact": False, "support": [0, 4, 7, 10]},
            {"center": 9, "exact": False, "support": [0, 2, 3, 5]},
            {"center": 10, "exact": False, "support": [1, 3, 8, 9]},
        ],
        "sources": [],
    }


def _run(tmp_path: Path, fake: FakeEndpointPiqd) -> dict[str, Any]:
    return producer.probe_system(
        _smoke_sat(),
        1,
        piqd_transport=fake,
        piqd_output_directory=tmp_path / "run",
        _piqd_fixture_only=True,
    )


def _hostile_path(raw: Path, touches: list[str]) -> Path:
    class HostilePath(type(Path())):
        def __fspath__(self) -> str:
            touches.append("fspath")
            raise AssertionError("Path subclass protocol was invoked")

        def __truediv__(self, key: object) -> Path:
            touches.append("truediv")
            raise AssertionError(f"Path subclass division was invoked with {key!r}")

        @property
        def parts(self) -> tuple[str, ...]:
            touches.append("parts")
            raise AssertionError("Path subclass parts were read")

        @property
        def name(self) -> str:
            touches.append("name")
            raise AssertionError("Path subclass name was read")

        @property
        def parent(self) -> Path:
            touches.append("parent")
            raise AssertionError("Path subclass parent was read")

    return HostilePath(os.fspath(raw))


def _reseal_publication_file(root: Path, relative: str) -> None:
    target = root / relative
    info = target.stat(follow_symlinks=False)
    manifest_path = root / "custody-inventory.json"
    manifest = json.loads(manifest_path.read_bytes())
    record = next(
        item for item in manifest["payload_inventory"] if item["path"] == relative
    )
    payload = target.read_bytes()
    record.update(
        {
            "bytes": len(payload),
            "sha256": _sha(payload),
            "identity": list(subject._identity(info)),
        }
    )
    manifest_path.write_bytes(subject._canonical(manifest) + b"\n")


def _rewrite_publication_json(
    root: Path,
    relative: str,
    mutate: Any,
    *,
    canonical: bool = True,
) -> None:
    target = root / relative
    value = json.loads(target.read_bytes())
    mutate(value)
    target.chmod(0o600)
    if canonical:
        payload = subject._canonical(value) + b"\n"
    else:
        payload = json.dumps(value, indent=2, sort_keys=True).encode() + b"\n"
    target.write_bytes(payload)
    _reseal_publication_file(root, relative)


def _rewrite_publication_raw_json(
    root: Path, relative: str, mutate: Any, *, pretty: bool = False
) -> None:
    target = root / relative
    value = json.loads(target.read_bytes())
    mutate(value)
    target.chmod(0o600)
    options = {"indent": 2} if pretty else {"separators": (",", ":")}
    target.write_bytes(
        json.dumps(value, sort_keys=True, allow_nan=False, **options).encode() + b"\n"
    )
    _reseal_publication_file(root, relative)


def _rewrite_bound_engine_json(
    root: Path,
    relative: str,
    artifact_key: str,
    mutate: Any,
) -> None:
    target = root / relative
    value = json.loads(target.read_bytes())
    mutate(value)
    target.chmod(0o600)
    payload = (
        json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            sort_keys=True,
            separators=(",", ":"),
        ).encode()
        + b"\n"
    )
    target.write_bytes(payload)
    _reseal_publication_file(root, relative)
    stage_relative = "00-exact-metric-relaxation/stage-result.json"

    def bind(stage: dict[str, Any]) -> None:
        stage["engine"]["artifacts"][artifact_key].update(
            {"bytes": len(payload), "sha256": _sha(payload)}
        )

    _rewrite_publication_json(root, stage_relative, bind)


def test_smoke_sat_exact_replay_and_immutable_custody(tmp_path: Path) -> None:
    fake = FakeEndpointPiqd(["SAT", "SAT"])
    result = _run(tmp_path, fake)

    assert result["status"] == "SAT"
    assert result["decisive_stage"] == "full-convex"
    assert result["verification"]["all_asserted_atoms_replayed"] is True
    assert result["claims"] == subject.FALSE_CLAIMS
    assert result["proof_blueprint"] == subject.PROOF_BLUEPRINT
    assert result["output_custody"]["publication"] == (
        "atomic-directory-rename-no-replace"
    )
    assert (tmp_path / "run" / "custody-inventory.json").is_file()
    assert len(set(fake.created_ids)) == 2
    assert fake.deleted_ids == fake.created_ids
    assert [stage["stage"] for stage in result["stages"]] == list(subject.STAGES[:2])
    for index, stage in enumerate(subject.STAGES[:2]):
        custody = tmp_path / "run" / f"{index:02d}-{stage}"
        assert (custody / "source-record.json").is_file()
        assert (custody / "descriptor.json").is_file()
        assert (custody / "original.smt2").read_bytes() == (
            custody / "journal.smt2"
        ).read_bytes()


def test_fixture_pins_are_exactly_authenticated_in_every_stage() -> None:
    expected_assertions = {
        "(assert (= x_2 (/ 4 5)))",
        "(assert (= y_2 (/ 3 5)))",
        "(assert (= x_3 0))",
        "(assert (= y_3 1))",
        "(assert (= x_4 (- (/ 4 5))))",
        "(assert (= y_4 (/ 3 5)))",
    }
    for stage in subject.STAGES:
        prepared = subject.prepare_stage(
            _smoke_sat(), stage, timeout_ms=1000, _fixture_only=True
        )
        semantic = prepared.query.descriptor["semantic_input"]
        assert prepared.source_record["fixture_only"] is True
        assert prepared.source_record["fixture_pins"] == _fixture_pins()
        assert semantic["fixture_only"] is True
        assert semantic["fixture_pins"] == _fixture_pins()
        assert prepared.source_record["constraint_counts"]["fixture_pins"] == 6
        assert semantic["constraint_counts"]["fixture_pins"] == 6
        assert expected_assertions <= set(prepared.query.journal_commands)


def test_fixture_pin_authentication_rejects_crossed_fixture_and_packet() -> None:
    crossed = _smoke_sat()
    crossed["rows"] = []
    with pytest.raises(subject.EndpointMetricPiqdError, match="exact built-in"):
        subject.prepare_stage(
            crossed,
            "exact-metric-relaxation",
            timeout_ms=1000,
            _fixture_only=True,
        )

    prepared = subject.prepare_stage(
        _smoke_sat(), "full-convex", timeout_ms=1000, _fixture_only=True
    )
    descriptor = json.loads(json.dumps(prepared.query.descriptor))
    descriptor["semantic_input"]["fixture_pins"][3]["numerator"] = True
    tampered = replace(prepared.query, descriptor=descriptor)
    with pytest.raises(subject.EndpointMetricPiqdError, match="fixture pins"):
        subject.verify_sat_model(
            tampered,
            "z3",
            "(model)",
            _smoke_values([item["id"] for item in subject._variables(5)]),
        )


def test_live_shaped_rational_readback_replays_fixture_pins() -> None:
    prepared = subject.prepare_stage(
        _smoke_sat(), "full-convex", timeout_ms=1000, _fixture_only=True
    )
    values = _smoke_values([item["id"] for item in subject._variables(5)])
    replay = subject.verify_sat_model(prepared.query, "z3", "(model)", values)
    assert replay.accepted is True
    assert replay.evidence["checks"]["fixture_pins"] == 6


def test_standalone_validator_replays_complete_smoke_sat_publication(
    tmp_path: Path,
) -> None:
    fake = FakeEndpointPiqd(["SAT", "SAT"])
    produced = _run(tmp_path, fake)

    checked = subject.validate_published_output(tmp_path / "run")

    assert checked["status"] == "SAT"
    assert checked["decisive_stage"] == "full-convex"
    assert checked["stages"] == produced["stages"]
    assert checked["verification"] == produced["verification"]
    assert checked["output_custody"] == produced["output_custody"]
    assert checked["claims"] == subject.FALSE_CLAIMS


@pytest.mark.parametrize(
    ("statuses", "expected_status", "expected_stages"),
    [
        (["UNSAT"], "UNSAT", ["exact-metric-relaxation"]),
        (
            ["SAT", "UNKNOWN", "SAT"],
            "UNKNOWN",
            list(subject.STAGES),
        ),
    ],
    ids=["diagnostic-unsat", "full-unknown-convex-only"],
)
def test_standalone_validator_rederives_terminal_status_and_stage_order(
    tmp_path: Path,
    statuses: list[str],
    expected_status: str,
    expected_stages: list[str],
) -> None:
    _run(tmp_path, FakeEndpointPiqd(statuses))

    checked = subject.validate_published_output(tmp_path / "run")

    assert checked["status"] == expected_status
    assert [stage["stage"] for stage in checked["stages"]] == expected_stages
    assert checked["claims"]["proof"] is False


def test_production_smoke_gate_uses_exact_replay(tmp_path: Path) -> None:
    smoke = producer.run_smoke(
        1,
        piqd_transport=FakeEndpointPiqd(["SAT", "SAT"]),
        piqd_output_directory=tmp_path / "smoke",
    )
    assert smoke["passed"] is True
    assert smoke["sat"]["verification"]["all_asserted_atoms_replayed"] is True
    assert smoke["unsat"]["route"] == "deterministic-symbolic-prefilter"
    assert smoke["unsat"]["piqd_submitted"] is False


def test_unsat_is_diagnostic_only(tmp_path: Path) -> None:
    result = _run(tmp_path, FakeEndpointPiqd(["UNSAT"]))

    assert result["status"] == "UNSAT"
    assert result["stages"][0]["classification"] == (
        "Z3_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"
    )
    assert result["claims"]["proof"] is False


def test_unknown_full_stage_is_only_path_to_convex_only(tmp_path: Path) -> None:
    fake = FakeEndpointPiqd(["SAT", "UNKNOWN", "SAT"])
    result = _run(tmp_path, fake)

    assert result["status"] == "UNKNOWN"
    assert [stage["stage"] for stage in result["stages"]] == list(subject.STAGES)
    assert len(set(fake.created_ids)) == 3
    assert fake.deleted_ids == fake.created_ids
    exact, full, relaxed = fake.stage_commands
    assert len(exact) < len(full)
    assert exact != relaxed


@pytest.mark.parametrize("second", ["SAT", "UNSAT"])
def test_convex_only_not_submitted_after_terminal_full(
    tmp_path: Path, second: str
) -> None:
    result = _run(tmp_path, FakeEndpointPiqd(["SAT", second]))
    assert len(result["stages"]) == 2


@pytest.mark.parametrize(
    "fake",
    [
        FakeEndpointPiqd(["SAT"], stale_create=True),
        FakeEndpointPiqd(["SAT"], crossed_create=True),
        FakeEndpointPiqd(["SAT", "SAT"], reuse_session_id=True),
    ],
    ids=["stale", "crossed", "reused"],
)
def test_crossed_stale_and_reused_identity_fail_closed(
    tmp_path: Path, fake: FakeEndpointPiqd
) -> None:
    with pytest.raises(neutral.SmtSourceAdapterError):
        _run(tmp_path, fake)


@pytest.mark.parametrize(
    "fake",
    [
        FakeEndpointPiqd(["SAT"], receipt_tamper=True),
        FakeEndpointPiqd(["SAT"], exported_suffix=b"\n(assert false)\n"),
    ],
    ids=["receipt", "query"],
)
def test_receipt_and_exported_query_tampering_fail_closed(
    tmp_path: Path, fake: FakeEndpointPiqd
) -> None:
    with pytest.raises(neutral.SmtSourceAdapterError):
        _run(tmp_path, fake)


@pytest.mark.parametrize(
    "values",
    [
        "((x_0 0) (y_0 0) (x_1 1) (y_1 0) (x_2 (root-obj (+ (^ x 2) (- 2)) 1)) (y_2 0) (x_3 0) (y_3 1) (x_4 -1) (y_4 0))",
        "this is not an s-expression",
        _smoke_values([item["id"] for item in subject._variables(5)]).replace(
            "(x_1 1)", "(x_1 2)"
        ),
        _smoke_values([item["id"] for item in subject._variables(5)]).replace(
            "(x_2 (/ 4 5))", "(x_2 (/ 3 5))"
        ),
    ],
    ids=["algebraic", "unparseable", "false-model", "false-fixture-pin"],
)
def test_unverifiable_sat_model_is_rejected(tmp_path: Path, values: str) -> None:
    fake = FakeEndpointPiqd(["SAT", "SAT"], values=values)
    result = _run(tmp_path, fake)
    assert result["status"] == "UNKNOWN"
    assert result["decisive_stage"] is None
    assert "model" not in result
    assert "verification" not in result
    assert [stage["stage"] for stage in result["stages"]] == list(
        subject.STAGES[:2]
    )
    assert len(fake.created_ids) == 2
    assert result["stages"][0]["effective_status"] in {
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
    }
    validated = subject.validate_published_output(tmp_path / "run")
    assert validated["status"] == "UNKNOWN"
    assert validated["decisive_stage"] is None
    assert "model" not in validated


def test_tampered_source_packet_is_rejected_before_submission() -> None:
    prepared = subject.prepare_stage(
        _smoke_sat(),
        "exact-metric-relaxation",
        timeout_ms=1000,
        _fixture_only=True,
    )
    snapshot = prepared.query.source_files[0]
    tampered = replace(
        prepared.query,
        source_files=(
            neutral.SourceSnapshot(snapshot.path, snapshot.payload + b" "),
            *prepared.query.source_files[1:],
        ),
    )
    with pytest.raises(neutral.SmtSourceAdapterError):
        neutral.validate_authenticated_single_solver_query(
            tampered,
            solver="z3",
            descriptor_schema=subject.DESCRIPTOR_SCHEMA,
            solver_profile_schema=subject.PROFILE_SCHEMA,
            authenticated_journal_commands=tampered.journal_commands,
        )


def test_no_local_fallback_on_transport_loss(tmp_path: Path, monkeypatch: Any) -> None:
    local_z3_imported = False
    original_import = builtins.__import__

    def import_spy(name: str, *args: object, **kwargs: object) -> object:
        nonlocal local_z3_imported
        if name == "z3":
            local_z3_imported = True
        return original_import(name, *args, **kwargs)

    monkeypatch.setattr(builtins, "__import__", import_spy)
    result = _run(tmp_path, FakeEndpointPiqd(["SAT"], fail_solve=True))
    assert result["status"] == "UNKNOWN"
    assert result["stages"][0]["effective_status"] == "INCONCLUSIVE_TRANSPORT_LOSS"
    assert local_z3_imported is False


def test_default_piqd_and_explicit_legacy_dispatch(
    tmp_path: Path, monkeypatch: Any
) -> None:
    assert _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))["route"] == (
        "piqd-z3-qfnra"
    )
    marker = {"status": "LOCAL"}
    monkeypatch.setattr(producer, "_probe_system", lambda *_args, **_kwargs: marker)
    legacy = producer.probe_system(_smoke_sat(), 1, solver_route="legacy-local-z3")
    assert legacy["status"] == "LOCAL"
    assert legacy["route"] == "legacy-local-z3"
    assert legacy["legacy_local_z3_explicit"] is True


@pytest.mark.parametrize("workers", [0, 2, True])
def test_piqd_rejects_non_single_exact_worker(workers: object) -> None:
    with pytest.raises(ValueError):
        producer.probe_system(
            _smoke_sat(),
            1,
            workers=workers,  # type: ignore[arg-type]
            piqd_transport=FakeEndpointPiqd(["SAT"]),
            piqd_output_directory=Path("unused"),
        )


@pytest.mark.parametrize("bad", [True, 5.0, {"not": "a system"}])
def test_source_contract_rejects_non_strict_builtin_systems(bad: object) -> None:
    system = _smoke_sat()
    system["n"] = bad
    with pytest.raises(subject.EndpointMetricPiqdError):
        subject.prepare_stage(
            system,
            "exact-metric-relaxation",
            timeout_ms=1000,
            _fixture_only=True,
        )


def test_direct_source_reconstructs_exact_six_point_row_and_capture(
    tmp_path: Path, monkeypatch: Any
) -> None:
    monkeypatch.setattr(producer, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "_REPO_ROOT", tmp_path)
    source = tmp_path / "direct-system.json"
    source_bytes = (
        json.dumps(_direct_source_document(), sort_keys=True, separators=(",", ":"))
        + "\n"
    ).encode()
    source.write_bytes(source_bytes)

    systems, extraction = producer.extract_systems((source,))

    assert len(systems) == 1
    [system] = systems
    assert system["system_id"] == _direct_source_document()["system_id"]
    assert system["profile"] == []
    assert system["rows"] == [
        {
            "center": 0,
            "support": [1, 2, 3, 4, 5, 6],
            "exact": True,
        }
    ]
    assert system["sources"] == [
        {
            "file": "direct-system.json",
            "json_pointer": "",
            "family": "direct-metric-system",
            "sha256": _sha(source_bytes),
            "context": {"schema": producer.DIRECT_SYSTEM_SOURCE_SCHEMA},
        }
    ]
    assert extraction["raw_assignments"] == 0
    assert extraction["raw_direct_systems"] == 1
    assert extraction["input_files"] == [
        {"path": "direct-system.json", "sha256": _sha(source_bytes)}
    ]

    prepared = subject.prepare_stage(
        system,
        "exact-metric-relaxation",
        timeout_ms=1000,
        source_paths=(source,),
    )
    assert prepared.source_record["constraint_counts"]["equalities"] == 5
    assert prepared.source_record["constraint_counts"]["exactness"] == 1
    assert prepared.source_record["normalization"]["mec_parameterization"] == {
        "schema": subject.MEC_PARAMETERIZATION_SCHEMA,
        "mode": "none",
        "declared_terms": [],
        "exact_substitutions": {},
        "omitted_boundary_apices": [],
    }
    assert prepared.query.descriptor["semantic_input"]["source_record_sha256"] == (
        _sha(prepared.source_record_bytes)
    )
    assert all(
        not variable["term"].startswith("mec_")
        for variable in prepared.query.descriptor["variables"]
    )
    captured = next(
        item for item in prepared.query.source_files if item.path == "input-0000.json"
    )
    assert captured.payload == source_bytes


def test_mec_direct_source_binds_apices_atoms_and_query_custody(
    tmp_path: Path, monkeypatch: Any
) -> None:
    monkeypatch.setattr(producer, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "_REPO_ROOT", tmp_path)
    document = _mec_direct_source_document()
    source = tmp_path / "direct-mec-system.json"
    source_bytes = (
        json.dumps(document, sort_keys=True, separators=(",", ":")) + "\n"
    ).encode()
    source.write_bytes(source_bytes)

    [system], extraction = producer.extract_systems((source,))

    assert system["mec_apices"] == [0, 1, 2]
    assert system["sources"][0]["context"] == {
        "schema": producer.DIRECT_SYSTEM_MEC_SOURCE_SCHEMA
    }
    assert extraction["raw_direct_systems"] == 1
    expected_counts = {
        "mec_gauge": 0,
        "mec_radius_pos": 1,
        "mec_boundary": 1,
        "mec_disk": 4,
        "mec_nonobtuse": 3,
    }
    for stage, convexity, total in (
        ("exact-metric-relaxation", 0, 19),
        ("full-convex", 8, 27),
        ("convex-only-relaxation", 8, 27),
    ):
        prepared = subject.prepare_stage(
            system, stage, timeout_ms=1000, source_paths=(source,)
        )
        counts = prepared.source_record["constraint_counts"]
        assert {key: counts[key] for key in expected_counts} == expected_counts
        assert counts["convexity"] == convexity
        assert counts["total"] == total
        assert prepared.source_record["system_sha256"] == _sha(
            subject._canonical(system)
        )
        assert prepared.query.descriptor["semantic_input"]["system"] == system
        assert prepared.query.descriptor["variables"][-1:] == [
            {"id": "z001-mec-y", "term": "mec_y", "sort": "Real"}
        ]
        assert prepared.query.descriptor["solve"]["readback_variable_ids"][-1:] == [
            "z001-mec-y"
        ]
        assert prepared.source_record["normalization"]["schema"] == (
            subject.NORMALIZATION_SCHEMA
        )
        assert prepared.source_record["normalization"]["mec_parameterization"] == {
            "schema": subject.MEC_PARAMETERIZATION_SCHEMA,
            "mode": "gauge-eliminated",
            "declared_terms": ["mec_y"],
            "exact_substitutions": {
                "mec_x": "(/ 1 2)",
                "mec_r2": "(+ (/ 1 4) (* mec_y mec_y))",
            },
            "omitted_boundary_apices": [0, 1],
        }
        assert prepared.query.descriptor["semantic_input"][
            "source_record_sha256"
        ] == _sha(prepared.source_record_bytes)
        assert prepared.query.descriptor["producer"]["version"] == "v2"
        assert prepared.query.descriptor["semantic_verifier"]["version"] == "v2"
        assert {
            "(declare-fun mec_y () Real)",
            "(assert (> (+ (/ 1 4) (* mec_y mec_y)) 0))",
            "(assert (= (+ (* (- x_2 (/ 1 2)) (- x_2 (/ 1 2))) (* (- y_2 mec_y) (- y_2 mec_y))) (+ (/ 1 4) (* mec_y mec_y))))",
            "(assert (>= (- (+ (/ 1 4) (* mec_y mec_y)) (+ (* (- x_3 (/ 1 2)) (- x_3 (/ 1 2))) (* (- y_3 mec_y) (- y_3 mec_y)))) 0))",
            "(assert (>= (+ (* (- x_1 x_0) (- x_2 x_0)) (* (- y_1 y_0) (- y_2 y_0))) 0))",
        } <= set(prepared.query.journal_commands)
        assert not any(
            "mec_x" in command or "mec_r2" in command
            for command in prepared.query.journal_commands
        )
        captured = next(
            item
            for item in prepared.query.source_files
            if item.path == "input-0000.json"
        )
        assert captured.payload == source_bytes

    ungauged = json.loads(json.dumps(system))
    ungauged["mec_apices"] = [1, 2, 3]
    ungauged_rows = tuple(
        producer.MetricRow(row["center"], tuple(row["support"]), row["exact"])
        for row in ungauged["rows"]
    )
    ungauged_identity = producer._direct_system_key(
        ungauged["n"], ungauged["order"], ungauged_rows, ungauged["mec_apices"]
    )
    ungauged["system_id"] = hashlib.sha256(ungauged_identity.encode()).hexdigest()[
        :20
    ]
    ungauged_commands, ungauged_counts = subject.build_stage_smt2(
        subject._validate_system(ungauged), "full-convex"
    )
    assert ungauged_counts["mec_gauge"] == 0
    assert ungauged_counts["mec_boundary"] == 3
    assert {
        "(declare-fun mec_x () Real)",
        "(declare-fun mec_y () Real)",
        "(declare-fun mec_r2 () Real)",
    } <= set(ungauged_commands)
    assert subject._variables(4, mec_apices=ungauged["mec_apices"])[-3:] == [
        {"id": "z000-mec-x", "term": "mec_x", "sort": "Real"},
        {"id": "z001-mec-y", "term": "mec_y", "sort": "Real"},
        {"id": "z002-mec-r2", "term": "mec_r2", "sort": "Real"},
    ]

    changed = dict(document)
    changed["mec_apices"] = [0, 1, 3]
    changed_identity = {
        key: changed[key] for key in ("n", "order", "rows", "mec_apices")
    }
    changed_id = hashlib.sha256(
        json.dumps(
            changed_identity, sort_keys=True, separators=(",", ":")
        ).encode()
    ).hexdigest()[:20]
    assert changed_id != document["system_id"]


def test_ungauged_mec_parameterization_is_bound_into_descriptor_source_custody(
    tmp_path: Path, monkeypatch: Any
) -> None:
    monkeypatch.setattr(producer, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "_REPO_ROOT", tmp_path)
    document = _mec_direct_source_document([1, 2, 3])
    source = tmp_path / "direct-ungauged-mec-system.json"
    source.write_text(
        json.dumps(document, sort_keys=True, separators=(",", ":")) + "\n",
        encoding="utf-8",
    )
    [system], _extraction = producer.extract_systems((source,))

    prepared = subject.prepare_stage(
        system, "full-convex", timeout_ms=1000, source_paths=(source,)
    )

    assert system["system_id"] == document["system_id"]
    assert prepared.source_record["normalization"]["mec_parameterization"] == {
        "schema": subject.MEC_PARAMETERIZATION_SCHEMA,
        "mode": "full-three-variable",
        "declared_terms": ["mec_x", "mec_y", "mec_r2"],
        "exact_substitutions": {},
        "omitted_boundary_apices": [],
    }
    assert prepared.query.descriptor["semantic_input"]["source_record_sha256"] == (
        _sha(prepared.source_record_bytes)
    )
    assert prepared.query.descriptor["variables"][-3:] == [
        {"id": "z000-mec-x", "term": "mec_x", "sort": "Real"},
        {"id": "z001-mec-y", "term": "mec_y", "sort": "Real"},
        {"id": "z002-mec-r2", "term": "mec_r2", "sort": "Real"},
    ]


@pytest.mark.parametrize(
    "mec_apices",
    ([0, 1, 2], [1, 0, 2], [2, 0, 1], [1, 2, 0]),
)
def test_mec_gauge_elimination_is_independent_of_apex_order(
    mec_apices: list[int],
) -> None:
    document = _mec_direct_source_document()
    rows: tuple[producer.MetricRow, ...] = ()
    identity = producer._direct_system_key(
        document["n"], document["order"], rows, mec_apices
    )
    system = {
        "system_id": hashlib.sha256(identity.encode()).hexdigest()[:20],
        "n": document["n"],
        "profile": [],
        "order": document["order"],
        "rows": [],
        "sources": [],
        "mec_apices": mec_apices,
    }

    validated = subject._validate_system(system)
    assert validated["system_id"] == system["system_id"]
    atoms, counts = subject._stage_atoms(validated, "full-convex")
    assert counts["mec_gauge"] == 0
    assert counts["mec_boundary"] == 1
    assert len(atoms["mec_boundary"]) == 1
    assert "x_2" in atoms["mec_boundary"][0]
    assert all(
        "mec_x" not in atom and "mec_r2" not in atom
        for category in (
            "mec_radius_pos",
            "mec_boundary",
            "mec_disk",
            "mec_nonobtuse",
        )
        for atom in atoms[category]
    )


@pytest.mark.parametrize(
    "mec_apices",
    ([0, 1], [0, 1, 1], [0, 1, 4], [0, 1, True], "0,1,2"),
)
def test_mec_direct_source_strictly_rejects_invalid_apices(
    tmp_path: Path, mec_apices: object
) -> None:
    document = _mec_direct_source_document()
    document["mec_apices"] = mec_apices
    source = tmp_path / "bad-mec-apices.json"
    source.write_text(json.dumps(document), encoding="utf-8")
    with pytest.raises(ValueError, match="invalid MEC apices"):
        producer.extract_systems((source,))


def test_mec_runtime_shape_and_system_id_fail_closed() -> None:
    document = _mec_direct_source_document()
    system = {
        "system_id": document["system_id"],
        "n": document["n"],
        "profile": [],
        "order": document["order"],
        "rows": document["rows"],
        "sources": [],
        "mec_apices": document["mec_apices"],
    }
    assert subject._validate_system(system) == system
    legacy = _smoke_sat()
    assert subject._validate_system(legacy) == legacy
    _legacy_commands, legacy_counts = subject.build_stage_smt2(
        legacy, "full-convex", _fixture_only=True
    )
    assert not any(key.startswith("mec_") for key in legacy_counts)
    crossed = json.loads(json.dumps(system))
    crossed["mec_apices"] = [0, 1, 3]
    with pytest.raises(subject.EndpointMetricPiqdError, match="does not bind"):
        subject._validate_system(crossed)
    malformed = json.loads(json.dumps(system))
    malformed["mec_apices"] = [0, 0, 2]
    with pytest.raises(subject.EndpointMetricPiqdError, match="apices are invalid"):
        subject._validate_system(malformed)

    rows = tuple(
        producer.MetricRow(row["center"], tuple(row["support"]), row["exact"])
        for row in system["rows"]
    )
    assert producer._constraint_counts(
        system["n"], rows, system.get("mec_apices")
    ) == {
        "equalities": 0,
        "distinctness": 6,
        "convex_order": 8,
        "exact_exclusions": 0,
        "mec_radius_pos": 1,
        "mec_boundary": 1,
        "mec_disk": 4,
        "mec_nonobtuse": 3,
    }


def test_mec_markdown_ledger_reports_encoded_packet() -> None:
    markdown = producer._render_markdown(
        {
            "extraction": {
                "raw_assignments": 0,
                "unique_metric_systems": 1,
                "input_files": [],
            },
            "summary": {
                "status_counts": {"UNKNOWN": 1},
                "decisive_stage_counts": {"none": 1},
            },
            "selected_systems": 1,
            "results": [{"mec_apices": [0, 1, 2]}],
            "config": {"workers": 1, "timeout_seconds": 1},
            "smoke": {"passed": True},
        }
    )
    assert "for each declared MEC packet" in markdown
    assert "quantified minimum-radius clause" in markdown
    assert "minimal-enclosing-circle, nonobtuse-frame" not in markdown


def test_direct_schema_versions_do_not_accept_each_others_shape(tmp_path: Path) -> None:
    missing = _mec_direct_source_document()
    del missing["mec_apices"]
    missing_path = tmp_path / "v2-missing-mec.json"
    missing_path.write_text(json.dumps(missing), encoding="utf-8")
    with pytest.raises(ValueError, match="wrong keys"):
        producer.extract_systems((missing_path,))

    legacy_extra = _direct_source_document()
    legacy_extra["mec_apices"] = [0, 1, 2]
    legacy_path = tmp_path / "v1-extra-mec.json"
    legacy_path.write_text(json.dumps(legacy_extra), encoding="utf-8")
    with pytest.raises(ValueError, match="wrong keys"):
        producer.extract_systems((legacy_path,))


def test_mec_exact_fraction_replay_covers_every_assertion(
    tmp_path: Path, monkeypatch: Any
) -> None:
    monkeypatch.setattr(producer, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "_REPO_ROOT", tmp_path)
    source = tmp_path / "direct-mec-system.json"
    source.write_text(
        json.dumps(
            _mec_direct_source_document(), sort_keys=True, separators=(",", ":")
        )
        + "\n",
        encoding="utf-8",
    )
    [system], _extraction = producer.extract_systems((source,))
    prepared = subject.prepare_stage(
        system, "full-convex", timeout_ms=1000, source_paths=(source,)
    )
    variable_ids = prepared.query.descriptor["solve"]["readback_variable_ids"]
    replay = subject.verify_sat_model(
        prepared.query, "z3", "(model)", _mec_values(variable_ids)
    )
    assert replay.accepted is True
    assert replay.evidence["checks"] == {
        key: value
        for key, value in prepared.source_record["constraint_counts"].items()
        if key != "total"
    }
    assert replay.evidence["checks"]["mec_radius_pos"] == 1
    assert replay.evidence["checks"]["mec_gauge"] == 0
    assert replay.evidence["checks"]["mec_boundary"] == 1
    assert replay.evidence["checks"]["mec_disk"] == 4
    assert replay.evidence["checks"]["mec_nonobtuse"] == 3
    assert replay.evidence["circumscribed_mec"] == {
        "x": "1/2",
        "y": "1/2",
        "r2": "1/2",
        "apices": [0, 1, 2],
    }
    old_variable_ids = [
        *variable_ids[:-1],
        "z000-mec-x",
        "z001-mec-y",
        "z002-mec-r2",
    ]
    with pytest.raises(subject.EndpointMetricPiqdError, match="arity mismatch"):
        subject.verify_sat_model(
            prepared.query,
            "z3",
            "(model)",
            _mec_values(old_variable_ids),
        )


@pytest.mark.parametrize(
    ("mec_apices", "expected_boundary", "expected_metric_total"),
    [([0, 1, 2], 1, 15), ([1, 2, 3], 3, 17)],
)
def test_legacy_z3_mec_gauge_models_and_constraint_counts_without_solving(
    monkeypatch: Any,
    mec_apices: list[int],
    expected_boundary: int,
    expected_metric_total: int,
) -> None:
    fake_z3 = _fake_z3_module(
        {
            "x_2": Fraction(1),
            "y_2": Fraction(1),
            "x_3": Fraction(0),
            "y_3": Fraction(1),
            "mec_x": Fraction(1, 2),
            "mec_y": Fraction(1, 2),
            "mec_r2": Fraction(1, 2),
        }
    )
    monkeypatch.setitem(sys.modules, "z3", fake_z3)
    document = _mec_direct_source_document()
    system = {
        "system_id": "legacy-z3-parity-fixture",
        "n": document["n"],
        "profile": [],
        "order": document["order"],
        "rows": [],
        "sources": [],
        "mec_apices": mec_apices,
    }

    result = producer._probe_system(system, 1)

    assert result["status"] == "SAT"
    assert result["constraint_counts"]["mec_boundary"] == expected_boundary
    assert result["stages"] == [
        {
            "stage": "exact-metric-relaxation",
            "added_constraints": expected_metric_total,
            "total_constraints": expected_metric_total,
            "status": "SAT",
            "elapsed_sec": result["stages"][0]["elapsed_sec"],
        },
        {
            "stage": "full-convex",
            "added_constraints": 8,
            "total_constraints": expected_metric_total + 8,
            "status": "SAT",
            "elapsed_sec": result["stages"][1]["elapsed_sec"],
        },
    ]
    assert result["verification"]["all_z3_assertions_true"] is True
    assert result["mec_model"] == {
        "x": "1/2",
        "y": "1/2",
        "r2": "1/2",
        "apices": mec_apices,
    }


@pytest.mark.parametrize(
    ("defect", "message"),
    [
        ("wrong-keys", "wrong keys"),
        ("missing-key", "wrong keys"),
        ("wrong-schema", "wrong schema"),
        ("boolean-n", "invalid n"),
        ("bad-order", "not a permutation"),
        ("noncanonical-support", "noncanonical support"),
        ("nonboolean-exact", "non-Boolean exact"),
        ("bad-system-id", "canonical digest"),
    ],
)
def test_direct_source_rejects_malformed_documents(
    tmp_path: Path, defect: str, message: str
) -> None:
    document = _direct_source_document()
    if defect == "wrong-keys":
        document["unexpected"] = None
    elif defect == "missing-key":
        del document["order"]
    elif defect == "wrong-schema":
        document["schema"] = "p97-endpoint-direct-metric-system-source-v0"
    elif defect == "boolean-n":
        document["n"] = True
    elif defect == "bad-order":
        document["order"][-1] = 6
    elif defect == "noncanonical-support":
        document["rows"][0]["support"] = [2, 1, 3, 4, 5, 6]
    elif defect == "nonboolean-exact":
        document["rows"][0]["exact"] = 1
    else:
        assert defect == "bad-system-id"
        document["system_id"] = "0" * 20
    source = tmp_path / f"{defect}.json"
    source.write_text(json.dumps(document), encoding="utf-8")

    with pytest.raises(ValueError, match=message):
        producer.extract_systems((source,))


def test_legacy_assignment_keeps_exact_four_support_contract() -> None:
    assignment = {
        "legacy": {"center": 0, "support": [4, 2, 3, 1], "exact": 1}
    }
    assert producer._normalize_assignment(assignment, 7) == (
        producer.MetricRow(0, (1, 2, 3, 4), True),
    )
    assignment["legacy"]["support"] = [1, 2, 3, 4, 5, 6]
    with pytest.raises(ValueError, match="four distinct points"):
        producer._normalize_assignment(assignment, 7)


def test_public_source_path_boundaries_reject_user_subclass_before_side_effects(
    tmp_path: Path,
) -> None:
    touches: list[str] = []
    source = _hostile_path(tmp_path / "source.json", touches)
    with pytest.raises(subject.EndpointMetricPiqdError, match="exact platform Path"):
        subject.prepare_stage(
            _smoke_sat(),
            "exact-metric-relaxation",
            timeout_ms=1000,
            source_paths=(source,),
        )
    assert touches == []

    fake = FakeEndpointPiqd(["SAT"])
    output = tmp_path / "must-not-exist"
    with pytest.raises(subject.EndpointMetricPiqdError, match="exact platform Path"):
        subject.run_staged_system(
            _smoke_sat(),
            timeout_s=1,
            transport=fake,
            output_directory=output,
            source_paths=(source,),
        )
    assert touches == []
    assert fake.created_ids == []
    assert not output.exists()
    assert list(tmp_path.iterdir()) == []


def test_public_output_path_boundaries_reject_user_subclass_before_side_effects(
    tmp_path: Path,
) -> None:
    touches: list[str] = []
    output = _hostile_path(tmp_path / "hostile-output", touches)
    fake = FakeEndpointPiqd(["SAT"])
    with pytest.raises(subject.EndpointMetricPiqdError, match="exact platform Path"):
        subject.run_staged_system(
            _smoke_sat(),
            timeout_s=1,
            transport=fake,
            output_directory=output,
            _fixture_only=True,
        )
    assert touches == []
    assert fake.created_ids == []

    with pytest.raises(subject.EndpointMetricPiqdError, match="exact platform Path"):
        subject.validate_published_output(output)
    assert touches == []


def test_public_repo_root_rejects_user_subclass_before_output_capture(
    tmp_path: Path,
) -> None:
    touches: list[str] = []
    repo_root = _hostile_path(Path(producer.ROOT), touches)
    with pytest.raises(
        subject.EndpointMetricPiqdError,
        match="repo_root must be an exact platform Path",
    ):
        subject.validate_published_output(
            tmp_path / "missing-publication", repo_root=repo_root
        )
    assert touches == []


def test_production_stage_requires_sources_and_binds_all_implementations(
    monkeypatch: Any,
) -> None:
    source = Path(producer.__file__)
    monkeypatch.setattr(
        producer,
        "extract_systems",
        lambda captured: ([_smoke_sat()], {"captured": captured[0].read_bytes()}),
    )
    with pytest.raises(subject.EndpointMetricPiqdError, match="require nonempty"):
        subject.prepare_stage(_smoke_sat(), "exact-metric-relaxation", timeout_ms=1000)
    prepared = subject.prepare_stage(
        _smoke_sat(),
        "exact-metric-relaxation",
        timeout_ms=1000,
        source_paths=(source,),
    )
    names = [snapshot.path for snapshot in prepared.query.source_files]
    assert names[:4] == [
        "0000-system-record.json",
        "0001-endpoint_adapter.py",
        "0002-legacy_producer.py",
        "0003-generic_adapter.py",
    ]
    assert [
        item["role"] for item in prepared.source_record["implementation_sources"]
    ] == ["endpoint_adapter", "legacy_producer", "generic_adapter"]
    assert prepared.source_record["fixture_only"] is False
    assert prepared.source_record["fixture_pins"] == []
    assert prepared.source_record["constraint_counts"]["fixture_pins"] == 0
    assert prepared.source_record["inputs"][0]["path"] == os.path.relpath(
        source, producer.ROOT
    )
    assert not Path(prepared.source_record["inputs"][0]["path"]).is_absolute()
    assert ".." not in Path(prepared.source_record["inputs"][0]["path"]).parts
    assert prepared.query.descriptor["semantic_input"]["fixture_pins"] == []
    assert not any(
        command
        in {
            "(assert (= x_2 (/ 4 5)))",
            "(assert (= y_2 (/ 3 5)))",
            "(assert (= x_4 (- (/ 4 5))))",
        }
        for command in prepared.query.journal_commands
    )
    with pytest.raises(subject.EndpointMetricPiqdError, match="production sources"):
        subject.prepare_stage(
            _smoke_sat(),
            "exact-metric-relaxation",
            timeout_ms=1000,
            source_paths=(source,),
            _fixture_only=True,
        )


@pytest.mark.parametrize("attack", ["outside", "dotdot"])
def test_production_source_ingress_rejects_repo_escape_without_side_effects(
    tmp_path: Path, monkeypatch: Any, attack: str
) -> None:
    outside = tmp_path / "outside-input.json"
    outside.write_bytes(b'{"outside":true}\n')
    source = (
        outside
        if attack == "outside"
        else Path(producer.ROOT) / "census" / ".." / "outside-input.json"
    )
    read_calls = 0

    def forbidden_read(_path: Path) -> bytes:
        nonlocal read_calls
        read_calls += 1
        raise AssertionError("source custody began before repo containment rejection")

    monkeypatch.setattr(subject, "_read_nofollow", forbidden_read)
    expected = "contained within repo_root" if attack == "outside" else "exact lexical"

    with pytest.raises(subject.EndpointMetricPiqdError, match=expected):
        subject.prepare_stage(
            _smoke_sat(),
            "exact-metric-relaxation",
            timeout_ms=1000,
            source_paths=(source,),
        )
    assert read_calls == 0

    fake = FakeEndpointPiqd(["SAT"])
    output = tmp_path / "must-not-exist"
    before = {path.name for path in tmp_path.iterdir()}
    with pytest.raises(subject.EndpointMetricPiqdError, match=expected):
        subject.run_staged_system(
            _smoke_sat(),
            timeout_s=1,
            transport=fake,
            output_directory=output,
            source_paths=(source,),
        )
    assert read_calls == 0
    assert fake.created_ids == []
    assert not output.exists()
    assert {path.name for path in tmp_path.iterdir()} == before


def test_selected_system_prefilter_has_zero_transport_and_output(
    tmp_path: Path,
) -> None:
    class ForbiddenTransport:
        calls = 0

        def request_json(self, *_args: object, **_kwargs: object) -> object:
            self.calls += 1
            raise AssertionError("prefilter contacted PIQD")

        def request_bytes(self, *_args: object, **_kwargs: object) -> object:
            self.calls += 1
            raise AssertionError("prefilter contacted PIQD")

    transport = ForbiddenTransport()
    output = tmp_path / "must-not-exist"
    result = producer.probe_system(
        _selected_prefilter_system(),
        1,
        piqd_transport=transport,
        piqd_output_directory=output,
    )
    assert result["system_id"] == "e1f357be73ee7fb3a72f"
    assert result["status"] == "UNSAT"
    assert result["decisive_stage"] == "equality-convex-five-point"
    assert result["route"] == "deterministic-symbolic-prefilter"
    assert result["piqd_submitted"] is False
    assert transport.calls == 0
    assert not output.exists()


def test_source_capture_rejects_symlink_hardlink_nonregular_and_oversize(
    tmp_path: Path,
) -> None:
    source = tmp_path / "source"
    source.write_bytes(b"source")
    symlink = tmp_path / "symlink"
    symlink.symlink_to(source)
    hardlink = tmp_path / "hardlink"
    os.link(source, hardlink)
    oversized = tmp_path / "oversized"
    with oversized.open("wb") as stream:
        stream.truncate(subject.MAX_SOURCE_BYTES + 1)
    for path in (symlink, hardlink, tmp_path, oversized):
        with pytest.raises(subject.EndpointMetricPiqdError):
            subject._read_nofollow(path)


def test_source_capture_detects_path_replacement(
    tmp_path: Path, monkeypatch: Any
) -> None:
    first = tmp_path / "first"
    second = tmp_path / "second"
    first.write_bytes(b"same")
    second.write_bytes(b"same")
    original = subject._open_file_nofollow
    calls = 0

    def crossed(path: Path) -> int:
        nonlocal calls
        calls += 1
        return original(first if calls == 1 else second)

    monkeypatch.setattr(subject, "_open_file_nofollow", crossed)
    with pytest.raises(subject.EndpointMetricPiqdError, match="path changed"):
        subject._read_nofollow(first)


def test_endpoint_owns_no_private_sexpr_dependency() -> None:
    source = Path(subject.__file__).read_text(encoding="utf-8")
    assert "freshthird_smt_session" not in source
    assert "." + "_parse_sexpr" not in source
    with pytest.raises(subject.EndpointMetricPiqdError):
        subject._parse_bounded_sexpr("(" * (subject.MAX_MODEL_DEPTH + 1))


@pytest.mark.parametrize("flag", ["--resume", "--explain-exact-core"])
def test_piqd_local_only_flags_fail_before_smoke_or_transport(
    flag: str, monkeypatch: Any
) -> None:
    calls: list[str] = []
    monkeypatch.setattr(
        producer,
        "run_smoke",
        lambda *_args, **_kwargs: calls.append("smoke"),
    )
    monkeypatch.setattr(
        neutral,
        "UrllibPiqdTransport",
        lambda *_args, **_kwargs: calls.append("transport"),
    )
    with pytest.raises(SystemExit):
        producer.main([flag])
    assert calls == []


@pytest.mark.parametrize("failure", [RuntimeError("unexpected"), KeyboardInterrupt()])
def test_piqd_main_propagates_unexpected_failures(
    tmp_path: Path, monkeypatch: Any, failure: BaseException
) -> None:
    monkeypatch.setattr(
        producer, "run_smoke", lambda *_args, **_kwargs: {"passed": True}
    )
    monkeypatch.setattr(
        producer,
        "extract_systems",
        lambda _inputs: ([_smoke_sat()], {"schema": "fixture"}),
    )
    monkeypatch.setattr(producer, "_write_checkpoint", lambda *_args, **_kwargs: None)
    monkeypatch.setattr(
        producer, "probe_system", lambda *_args, **_kwargs: raise_(failure)
    )
    monkeypatch.setattr(neutral, "UrllibPiqdTransport", lambda _url: object())
    with pytest.raises(
        type(failure), match="unexpected" if type(failure) is RuntimeError else None
    ):
        producer.main(
            [
                "--out",
                str(tmp_path / "out.json"),
                "--markdown",
                str(tmp_path / "out.md"),
                "--piqd-output-directory",
                str(tmp_path / "custody"),
            ]
        )


def raise_(failure: BaseException) -> object:
    raise failure


@pytest.mark.parametrize("occupant", ["directory", "symlink"])
def test_publication_never_replaces_existing_target(
    tmp_path: Path, monkeypatch: Any, occupant: str
) -> None:
    staging = subject._reserve_output_staging(tmp_path / "final")
    subject._write_immutable(staging.staging_fd, "artifact", b"held")
    original = subject._rename_directory_noreplace

    def obstruct(root_fd: int, source: str, target: str) -> None:
        if occupant == "directory":
            os.mkdir(target, dir_fd=root_fd)
        else:
            os.symlink("missing", target, dir_fd=root_fd)
        original(root_fd, source, target)

    monkeypatch.setattr(subject, "_rename_directory_noreplace", obstruct)
    try:
        with pytest.raises(subject.EndpointMetricPiqdError, match="already exists"):
            subject._publish_output(staging)
        assert (tmp_path / "final").exists() is (occupant == "directory")
        assert (tmp_path / "final").is_symlink() is (occupant == "symlink")
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


def test_publication_rejects_hardlinked_artifact(tmp_path: Path) -> None:
    staging = subject._reserve_output_staging(tmp_path / "final")
    subject._write_immutable(staging.staging_fd, "artifact", b"held")
    held_path = tmp_path / staging.staging_name
    os.link(held_path / "artifact", held_path / "crossed")
    try:
        with pytest.raises(subject.EndpointMetricPiqdError, match="non-private"):
            subject._publish_output(staging)
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


@pytest.mark.parametrize(
    ("relative", "artifact_key", "mutation"),
    [
        (
            "00-exact-metric-relaxation/stage-result.json",
            None,
            lambda value: value["engine"].__setitem__("session_id", str(uuid.uuid4())),
        ),
        (
            "00-exact-metric-relaxation/source-record.json",
            None,
            lambda value: value.__setitem__("stage", "full-convex"),
        ),
        (
            "00-exact-metric-relaxation/source-record.json",
            None,
            lambda value: value["fixture_pins"][0].__setitem__("numerator", 3),
        ),
        (
            "00-exact-metric-relaxation/descriptor.json",
            None,
            lambda value: value.__setitem__("query_id", "crossed-query"),
        ),
        (
            "00-exact-metric-relaxation/z3.session.json",
            "session",
            lambda value: value.__setitem__("solver_signature", "z3 crossed-session"),
        ),
        (
            "00-exact-metric-relaxation/z3.solve.json",
            "solve",
            lambda value: value.__setitem__("model", "(tampered-model)"),
        ),
        (
            "00-exact-metric-relaxation/z3.receipts.json",
            "receipts",
            lambda value: value["receipts"][0].__setitem__("base_sha256", "0" * 64),
        ),
        (
            "00-exact-metric-relaxation/z3.semantic.json",
            "semantic",
            lambda value: value.__setitem__("accepted", False),
        ),
    ],
    ids=[
        "stage-session",
        "source",
        "fixture-pins",
        "query",
        "archived-session",
        "model",
        "receipt",
        "semantic",
    ],
)
def test_standalone_validator_rejects_resealed_identity_and_payload_crossing(
    tmp_path: Path, relative: str, artifact_key: str | None, mutation: Any
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    if artifact_key is None:
        _rewrite_publication_json(root, relative, mutation)
    else:
        _rewrite_bound_engine_json(root, relative, artifact_key, mutation)

    with pytest.raises(subject.EndpointMetricPiqdError):
        subject.validate_published_output(root)


@pytest.mark.parametrize("kind", ["extra", "missing"])
def test_standalone_validator_requires_exact_complete_inventory(
    tmp_path: Path, kind: str
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    if kind == "extra":
        (root / "unexpected").write_bytes(b"extra")
    else:
        (root / "00-exact-metric-relaxation" / "original.smt2").unlink()

    with pytest.raises(subject.EndpointMetricPiqdError):
        subject.validate_published_output(root)


@pytest.mark.parametrize("kind", ["symlink", "hardlink", "nonregular"])
def test_standalone_validator_rejects_linked_or_nonregular_artifacts(
    tmp_path: Path, kind: str
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    existing = root / "00-exact-metric-relaxation" / "source-record.json"
    crossed = root / "00-crossed"
    if kind == "symlink":
        crossed.symlink_to(existing)
    elif kind == "hardlink":
        os.link(existing, crossed)
    else:
        os.mkfifo(crossed)

    with pytest.raises(subject.EndpointMetricPiqdError, match="link|non-private"):
        subject.validate_published_output(root)


def test_standalone_validator_rejects_oversize_artifact(
    tmp_path: Path, monkeypatch: Any
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    (root / "00-oversize").write_bytes(b"x" * 33)
    monkeypatch.setattr(subject, "MAX_SOURCE_BYTES", 32)

    with pytest.raises(subject.EndpointMetricPiqdError, match="exceeded bounds"):
        subject.validate_published_output(root)


@pytest.mark.parametrize("kind", ["bool", "float", "deep", "noncanonical"])
def test_standalone_validator_rejects_non_strict_or_noncanonical_json(
    tmp_path: Path, kind: str
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    relative = "00-exact-metric-relaxation/stage-result.json"
    if kind == "bool":
        _rewrite_publication_json(
            root,
            relative,
            lambda value: value["engine"].__setitem__("reconciliation_attempts", False),
        )
    elif kind == "float":
        _rewrite_publication_raw_json(
            root,
            relative,
            lambda value: value["engine"].__setitem__("reconciliation_attempts", 0.5),
        )
    elif kind == "deep":

        def deepen(value: dict[str, Any]) -> None:
            nested: object = None
            for _ in range(subject.MAX_JSON_DEPTH + 2):
                nested = [nested]
            value["engine"]["claims"]["deep"] = nested

        _rewrite_publication_raw_json(root, relative, deepen)
    else:
        _rewrite_publication_raw_json(root, relative, lambda _value: None, pretty=True)

    with pytest.raises(subject.EndpointMetricPiqdError):
        subject.validate_published_output(root)


def test_standalone_validator_rejects_builtin_subclasses() -> None:
    class DictSubclass(dict[str, object]):
        pass

    with pytest.raises(subject.EndpointMetricPiqdError, match="non-builtin"):
        subject._validate_builtin_tree(DictSubclass({"x": 1}), "fixture")


def test_standalone_validator_detects_final_byte_change(
    tmp_path: Path, monkeypatch: Any
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    target = root / "00-exact-metric-relaxation" / "stage-result.json"
    original = subject._validate_captured_published_output

    def cross(capture: Any, *, repo_root: Path) -> dict[str, Any]:
        result = original(capture, repo_root=repo_root)
        target.chmod(0o600)
        target.write_bytes(target.read_bytes() + b" ")
        return result

    monkeypatch.setattr(subject, "_validate_captured_published_output", cross)
    with pytest.raises(subject.EndpointMetricPiqdError, match="changed"):
        subject.validate_published_output(root)


def test_standalone_validator_detects_output_root_replacement(
    tmp_path: Path, monkeypatch: Any
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))
    root = tmp_path / "run"
    displaced = tmp_path / "displaced"
    original = subject._validate_captured_published_output

    def cross(capture: Any, *, repo_root: Path) -> dict[str, Any]:
        result = original(capture, repo_root=repo_root)
        root.rename(displaced)
        root.mkdir()
        return result

    monkeypatch.setattr(subject, "_validate_captured_published_output", cross)
    with pytest.raises(subject.EndpointMetricPiqdError, match="replaced"):
        subject.validate_published_output(root)


def test_standalone_check_cli_is_offline(
    tmp_path: Path, monkeypatch: Any, capsys: Any
) -> None:
    _run(tmp_path, FakeEndpointPiqd(["SAT", "SAT"]))

    def forbid_transport(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("offline validator attempted PIQD transport")

    monkeypatch.setattr(neutral, "UrllibPiqdTransport", forbid_transport)
    assert subject.main(["--check", str(tmp_path / "run")]) == 0
    summary = json.loads(capsys.readouterr().out)
    assert summary == {
        "checked": True,
        "output": str(tmp_path / "run"),
        "status": "SAT",
        "system_id": "smoke-sat",
    }
