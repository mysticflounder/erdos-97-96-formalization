# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import itertools
from fractions import Fraction

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd as subject,
)

_EXECUTION_COMMIT = "d" * 40


@pytest.fixture(scope="module")
def prior() -> dict[str, object]:
    return subject.authenticate_predecessor_run()


@pytest.fixture(scope="module")
def targets(prior: dict[str, object]) -> dict[str, dict[str, object]]:
    return {
        subject._target_key(order_id, branch_id): subject._build_target_from_prior(
            prior, order_id, branch_id
        )
        for order_id in subject.ORDER_IDS
        for branch_id in subject.BRANCH_IDS
    }


def _parabola_polygon(order: tuple[str, ...]) -> dict[str, tuple[Fraction, Fraction]]:
    return {
        class_id: (Fraction(index - 6), Fraction((index - 6) ** 2))
        for index, class_id in enumerate(order)
    }


def test_predecessor_run_0002_and_current_producer_are_authenticated(
    prior: dict[str, object],
) -> None:
    assert prior["status"] == "TARGET_INCONCLUSIVE"
    assert prior["run_manifest_sha256"] == subject.PREDECESSOR_MANIFEST_SHA256
    assert prior["launch_sha256"] == subject.PREDECESSOR_LAUNCH_SHA256
    assert prior["terminal_sha256"] == subject.PREDECESSOR_TERMINAL_SHA256
    assert prior["producer_sha256"] == subject.PREDECESSOR_PRODUCER_SHA256
    assert len(prior["result_sha256s"]) == 6
    assert {key: tuple(order) for key, order in prior["orders"].items()} == subject.EXPECTED_ORDERS


def test_predecessor_producer_tampering_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = subject._read_regular

    def tampered(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        if path == subject.PREDECESSOR_PRODUCER_PATH:
            return payload + b" "
        return payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="bytes drifted"):
        subject.authenticate_predecessor_run()


@pytest.mark.parametrize("key", subject.TARGET_KEYS)
def test_exact_target_inventory(
    targets: dict[str, dict[str, object]], key: str
) -> None:
    system = targets[key]
    assert len(system["variables"]) == 20
    assert len(system["supporting_edges"]) == 143
    assert len(system["source_row_equalities"]) == 11
    assert subject.formula_inventory(system) == {
        "real_declarations": 20,
        "supporting_edge_assertions": 143,
        "row_equality_assertions": 11,
        "radius_assertions": 1,
        "source_assertions": 1,
        "assertions": 156,
        "commands": 177,
    }
    commands = subject._build_smt_commands_current(system)
    assert len(commands) == 177
    assert commands[0] == "(set-logic QF_NRA)"
    assert sum(command.startswith("(declare-fun ") for command in commands) == 20
    assert sum(command.startswith("(assert ") for command in commands) == 156


def test_exact_wrap_edges(targets: dict[str, dict[str, object]]) -> None:
    expected = {
        "parent-z3-mirror": ["c009", "c000"],
        "parent-cvc5-direct": ["c003", "c000"],
    }
    for order_id, wrap in expected.items():
        system = targets[f"{order_id}-radius-lt"]
        wrap_rows = [row for row in system["supporting_edges"] if row["edge_index"] == 12]
        assert len(wrap_rows) == 11
        assert {tuple(row["edge"]) for row in wrap_rows} == {tuple(wrap)}


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_each_emitted_relation_is_an_original_relation_after_cyclic_rotation(
    targets: dict[str, dict[str, object]], order_id: str
) -> None:
    system = targets[f"{order_id}-radius-lt"]
    order = tuple(system["order"])
    originals = set(itertools.combinations(order, 3))
    coords = _parabola_polygon(order)
    for row in system["supporting_edges"]:
        original = tuple(row["original_triple"])
        directed = (*row["edge"], row["vertex"])
        rotations = (
            original,
            (original[1], original[2], original[0]),
            (original[2], original[0], original[1]),
        )
        assert original in originals
        assert directed == rotations[row["cyclic_rotation"]]
        assert subject._area_value(coords, *directed) == subject._area_value(
            coords, *original
        )
        assert row["relation"] == ">"


def test_positive_rational_convex_polygon_passes_supporting_edges() -> None:
    order = tuple(f"p{index:02d}" for index in range(13))
    replay = subject.check_supporting_edges(order, _parabola_polygon(order))
    assert replay["accepted"] is True
    assert replay["constraint_count"] == 143
    assert Fraction(replay["min_orientation"]) > 0


@pytest.mark.parametrize("defect", ["nonconvex", "collinear", "duplicate"])
def test_supporting_edges_reject_geometric_defects(defect: str) -> None:
    order = tuple(f"p{index:02d}" for index in range(13))
    coords = _parabola_polygon(order)
    if defect == "nonconvex":
        coords[order[4]], coords[order[5]] = coords[order[5]], coords[order[4]]
    elif defect == "collinear":
        left, right = coords[order[4]], coords[order[6]]
        coords[order[5]] = ((left[0] + right[0]) / 2, (left[1] + right[1]) / 2)
    else:
        coords[order[5]] = coords[order[4]]
    replay = subject.check_supporting_edges(order, coords)
    assert replay["accepted"] is False
    assert replay["reason"] == "supporting_edge"


def test_full_source_replay_checks_286_triples_13_rows_and_metrics(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    order = subject.EXPECTED_ORDERS["parent-cvc5-direct"]
    coords = _parabola_polygon(order)
    monkeypatch.setattr(subject.predecessor, "_frame_coordinates", lambda _order_id: {})
    roles = {
        "c2": order[0],
        "O": order[1],
        "d": order[2],
        "e": order[0],
        "a": order[3],
        "u": order[4],
    }
    system = {
        "order": list(order),
        "order_id": "synthetic",
        "role_class": roles,
        "rows": [
            {"id": f"R{index}", "center": "c2", "support": ["u", "u"]}
            for index in range(13)
        ],
        "radius_branch": {"relation": "<"},
    }
    replay = subject.check_coordinates(system, coords)
    assert replay == {
        "accepted": True,
        "supporting_edge_count": 143,
        "original_triple_count": 286,
        "min_original_orientation": "2",
        "source_row_equality_count": 13,
        "emitted_row_equality_count": 11,
        "radius_relation": "<",
    }
    changed = copy.deepcopy(system)
    changed["rows"][7]["support"] = ["u", "O"]
    rejected = subject.check_coordinates(changed, coords)
    assert rejected["accepted"] is False
    assert rejected["reason"] == "row_R7"


def test_algebraic_sat_values_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
    prior: dict[str, object],
    targets: dict[str, dict[str, object]],
) -> None:
    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    system = targets[subject.TARGET_KEYS[0]]
    prepared = subject._prepare_query_with_prior(system, prior, timeout_ms=1000)
    values = "(" + " ".join(
        f"({term} (root-obj (+ (^ x 2) (- 2)) 1))" for term in system["variables"]
    ) + ")"
    replay = subject.verify_sat_model(prepared.query, "z3", "(model)", values)
    assert replay.accepted is False
    assert replay.evidence["reason"] == "exact_readback_unsupported"


def test_controls_replay_exactly(
    monkeypatch: pytest.MonkeyPatch, prior: dict[str, object]
) -> None:
    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    positive = subject._prepare_query_with_prior(
        subject.build_control_system("positive"), prior, timeout_ms=1000
    )
    negative = subject._prepare_query_with_prior(
        subject.build_control_system("negative"), prior, timeout_ms=1000
    )
    assert subject.verify_sat_model(positive.query, "z3", "(model)", "((t 1))").accepted
    assert not subject.verify_sat_model(
        negative.query, "cvc5", "(model)", "((t 0))"
    ).accepted


def test_relaxed_system_mutation_is_rejected(
    prior: dict[str, object], targets: dict[str, dict[str, object]]
) -> None:
    changed = copy.deepcopy(targets[subject.TARGET_KEYS[0]])
    changed["supporting_edges"].pop()
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="drifted"):
        subject._validate_system_current(changed, prior)


def test_run_manifest_checkpoint_and_lifecycle_pairing() -> None:
    root, manifest = subject.ensure_run_root()
    checkpoint = subject._load_checkpoint()
    assert manifest["base_head"] == checkpoint["base_head"]
    assert manifest["base_head"] == "30393754d3bf84021134553749a168cade04be95"
    assert manifest["root"] == root.relative_to(subject.REPOSITORY_ROOT).as_posix()
    assert manifest["manifest_sha256"] == subject._self_hash(manifest, "manifest_sha256")
    launch_path = root / "events" / "launch.json"
    terminal_path = root / "events" / "terminal.json"
    assert launch_path.exists() == terminal_path.exists()
    if launch_path.exists():
        launch = subject._strict_json(subject._read_regular(launch_path), "launch")
        terminal = subject._strict_json(subject._read_regular(terminal_path), "terminal")
        assert launch["run_manifest_sha256"] == manifest["manifest_sha256"]
        assert launch["launch_sha256"] == subject._self_hash(launch, "launch_sha256")
        assert terminal["launch_sha256"] == launch["launch_sha256"]
        assert terminal["terminal_sha256"] == subject._self_hash(
            terminal, "terminal_sha256"
        )


def test_execution_commit_custody_accepts_full_sha_and_exact_bound_bytes(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {"source_digests": subject._source_digest_map(subject._manifest_sources())}
    calls: list[tuple[str, ...]] = []

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        calls.append(arguments)
        if arguments[0] == "rev-parse":
            return f"{_EXECUTION_COMMIT}\n".encode()
        assert arguments[0] == "show"
        head, relative = arguments[1].split(":", 1)
        assert head == _EXECUTION_COMMIT
        return subject._read_regular(subject.REPOSITORY_ROOT / relative)

    monkeypatch.setattr(subject, "_git_read", git_read)
    assert subject.authenticate_execution_commit(manifest) == _EXECUTION_COMMIT
    assert calls[0] == ("rev-parse", "--verify", "HEAD^{commit}")
    assert len(calls) == 1 + len(subject._manifest_sources())
    assert all(call[0] in {"rev-parse", "show"} for call in calls)


@pytest.mark.parametrize(
    "payload",
    [b"abc\n", b"D" * 40 + b"\n", b"d" * 40, b"d" * 40 + b"\nextra\n"],
)
def test_execution_commit_custody_rejects_malformed_head(
    monkeypatch: pytest.MonkeyPatch, payload: bytes
) -> None:
    monkeypatch.setattr(subject, "_git_read", lambda _arguments, _where: payload)
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="commit is malformed"):
        subject.authenticate_execution_commit(
            {"source_digests": subject._source_digest_map(subject._manifest_sources())}
        )


def test_execution_commit_custody_rejects_missing_bound_blob(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {"source_digests": subject._source_digest_map(subject._manifest_sources())}

    def git_read(arguments: tuple[str, ...], where: str) -> bytes:
        if arguments[0] == "rev-parse":
            return f"{_EXECUTION_COMMIT}\n".encode()
        raise subject.Profile0034SupportingEdgeError(f"Git object is missing: {where}")

    monkeypatch.setattr(subject, "_git_read", git_read)
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="object is missing"):
        subject.authenticate_execution_commit(manifest)


def test_execution_commit_custody_rejects_committed_byte_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {"source_digests": subject._source_digest_map(subject._manifest_sources())}

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        if arguments[0] == "rev-parse":
            return f"{_EXECUTION_COMMIT}\n".encode()
        relative = arguments[1].split(":", 1)[1]
        return subject._read_regular(subject.REPOSITORY_ROOT / relative) + b"drift"

    monkeypatch.setattr(subject, "_git_read", git_read)
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="commit source drifted"):
        subject.authenticate_execution_commit(manifest)


def test_execution_commit_custody_rejects_current_bound_digest_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {"source_digests": subject._source_digest_map(subject._manifest_sources())}
    first = min(manifest["source_digests"])
    manifest["source_digests"][first] = "0" * 64
    monkeypatch.setattr(
        subject,
        "_git_read",
        lambda arguments, _where: f"{_EXECUTION_COMMIT}\n".encode()
        if arguments[0] == "rev-parse"
        else b"unreachable",
    )
    with pytest.raises(subject.Profile0034SupportingEdgeError, match="current bound source drifted"):
        subject.authenticate_execution_commit(manifest)


def test_execution_custody_failure_precedes_launch_and_transport(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: subject.Path,
    prior: dict[str, object],
) -> None:
    root = tmp_path / "run-execution-custody-failure"
    manifest = {"source_digests": subject._source_digest_map(subject._manifest_sources())}
    touched: list[str] = []

    def custody_failure(_manifest: dict[str, object]) -> str:
        raise subject.Profile0034SupportingEdgeError("execution commit source drifted")

    def forbidden(*_args: object, **_kwargs: object) -> object:
        touched.append("called")
        raise AssertionError("launch, query, or transport action occurred")

    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "authenticate_execution_commit", custody_failure)
    monkeypatch.setattr(subject, "_launch_record", forbidden)
    monkeypatch.setattr(subject, "_create_once", forbidden)
    monkeypatch.setattr(subject, "_build_target_from_prior", forbidden)
    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", forbidden)
    monkeypatch.setattr(subject, "run_query", forbidden)
    with pytest.raises(
        subject.Profile0034SupportingEdgeError, match="execution commit source drifted"
    ):
        subject.run_diagnostic()
    assert touched == []
    assert not root.exists()


def test_resource_defaults_and_pi_qd_only_transport() -> None:
    assert subject.DEFAULT_TIMEOUT_S == 60.0
    assert subject.DEFAULT_WORKERS == 4
    assert subject.MAX_WORKERS == 4
    manifest = {"manifest_sha256": "a" * 64}
    launch = subject._launch_record(
        manifest, _EXECUTION_COMMIT, "http://127.0.0.1:7272", 60_000, 4
    )
    assert launch["execution_commit"] == _EXECUTION_COMMIT
    assert launch["transport"] == "PIQD HTTP adapter only; fresh named session per engine and query"
    assert launch["queries"] == list(subject.QUERY_KEYS)


def test_existing_launch_without_terminal_never_touches_transport_or_query(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: subject.Path,
    prior: dict[str, object],
) -> None:
    root = tmp_path / "run-partial"
    events = root / "events"
    events.mkdir(parents=True)
    manifest = {"manifest_sha256": "a" * 64}
    launch = subject._launch_record(
        manifest, _EXECUTION_COMMIT, "http://127.0.0.1:7272", 60_000, 4
    )
    (events / "launch.json").write_bytes(subject._json(launch))
    touched: list[str] = []

    def forbidden(*_args: object, **_kwargs: object) -> object:
        touched.append("called")
        raise AssertionError("query or transport action occurred")

    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(
        subject, "authenticate_execution_commit", lambda _manifest: _EXECUTION_COMMIT
    )
    monkeypatch.setattr(subject, "_build_target_from_prior", forbidden)
    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", forbidden)
    monkeypatch.setattr(subject, "run_query", forbidden)
    with pytest.raises(
        subject.Profile0034SupportingEdgeError,
        match="incomplete launch cannot be resumed; use a fresh run id",
    ):
        subject.run_diagnostic()
    assert touched == []


def test_orphan_terminal_is_rejected_before_launch_or_transport(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: subject.Path,
    prior: dict[str, object],
) -> None:
    root = tmp_path / "run-orphan-terminal"
    events = root / "events"
    events.mkdir(parents=True)
    terminal_path = events / "terminal.json"
    terminal_path.write_bytes(b"{}\n")
    launch_path = events / "launch.json"
    manifest = {"manifest_sha256": "b" * 64}
    touched: list[str] = []

    def forbidden(*_args: object, **_kwargs: object) -> object:
        touched.append("called")
        raise AssertionError("query or transport action occurred")

    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(
        subject, "authenticate_execution_commit", lambda _manifest: _EXECUTION_COMMIT
    )
    monkeypatch.setattr(subject, "_build_target_from_prior", forbidden)
    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", forbidden)
    monkeypatch.setattr(subject, "run_query", forbidden)
    with pytest.raises(
        subject.Profile0034SupportingEdgeError,
        match="terminal exists without its launch",
    ):
        subject.run_diagnostic()
    assert touched == []
    assert not launch_path.exists()
    assert terminal_path.read_bytes() == b"{}\n"


def test_existing_launch_and_terminal_replay_without_transport_or_new_query(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: subject.Path,
    prior: dict[str, object],
) -> None:
    root = tmp_path / "run-terminal-replay"
    events = root / "events"
    events.mkdir(parents=True)
    manifest = {"manifest_sha256": "c" * 64}
    launch = subject._launch_record(
        manifest, _EXECUTION_COMMIT, "http://127.0.0.1:7272", 60_000, 4
    )
    launch_path = events / "launch.json"
    launch_path.write_bytes(subject._json(launch))
    results: dict[str, dict[str, object]] = {}
    for key in subject.QUERY_KEYS:
        target = key in subject.TARGET_KEYS
        raw_status = "UNKNOWN" if target else (
            "SAT" if key == "control-positive" else "UNSAT"
        )
        effective_status = (
            "INCONCLUSIVE_UNKNOWN"
            if target
            else "SAT_SEMANTICALLY_REPLAYED"
            if raw_status == "SAT"
            else "UNSAT_DISCOVERY_ONLY"
        )
        results[key] = {
            "overall_status": "INCONCLUSIVE" if target else "FINITE_DIAGNOSTIC_COMPLETE",
            "engines": [
                {"raw_status": raw_status, "effective_status": effective_status},
                {"raw_status": raw_status, "effective_status": effective_status},
            ],
        }
        artifact_dir = root / "artifacts" / key
        artifact_dir.mkdir(parents=True)
        (artifact_dir / "result.json").write_bytes(
            subject._json({"key": key, "synthetic": True})
        )
    expected_terminal = subject._terminal_record(root, launch, results)
    terminal_path = events / "terminal.json"
    terminal_path.write_bytes(subject._json(expected_terminal))
    verified: list[str] = []
    touched: list[str] = []

    def prepare(
        system: dict[str, object],
        _prior: dict[str, object],
        *,
        timeout_ms: int,
    ) -> str:
        assert timeout_ms == 60_000
        return str(system["key"])

    def replay(prepared: str, output_directory: subject.Path) -> dict[str, object]:
        assert prepared == output_directory.name
        verified.append(prepared)
        return results[prepared]

    def forbidden(*_args: object, **_kwargs: object) -> object:
        touched.append("called")
        raise AssertionError("transport or new query occurred")

    monkeypatch.setattr(subject, "authenticate_predecessor_run", lambda: prior)
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(
        subject, "authenticate_execution_commit", lambda _manifest: _EXECUTION_COMMIT
    )
    monkeypatch.setattr(
        subject,
        "_build_target_from_prior",
        lambda _prior, order_id, branch_id: {
            "key": subject._target_key(order_id, branch_id)
        },
    )
    monkeypatch.setattr(subject, "_prepare_query_with_prior", prepare)
    monkeypatch.setattr(subject, "verify_adapter_tree", replay)
    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", forbidden)
    monkeypatch.setattr(subject, "run_query", forbidden)
    observed = subject.run_diagnostic()
    assert observed == expected_terminal
    assert verified == list(subject.QUERY_KEYS)
    assert touched == []
    assert launch_path.read_bytes() == subject._json(launch)
    assert terminal_path.read_bytes() == subject._json(expected_terminal)
