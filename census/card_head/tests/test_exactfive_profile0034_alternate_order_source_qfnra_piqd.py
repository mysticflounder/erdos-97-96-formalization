from __future__ import annotations

import copy
import hashlib
import itertools
import json

import pytest

from census.card_head import (
    exactfive_profile0034_alternate_order_source_qfnra_piqd as subject,
)


@pytest.fixture(scope="module")
def prior() -> dict[str, object]:
    return subject.authenticate_source_orders()


@pytest.fixture(scope="module")
def targets(prior: dict[str, object]) -> dict[str, dict[str, object]]:
    return {
        order_id: subject._build_target_from_prior(prior, order_id)
        for order_id in subject.ORDER_IDS
    }


def test_parent_custody_and_exact_orders(prior: dict[str, object]) -> None:
    assert prior["profile_index"] == 34
    assert prior["profile_sha256"] == subject.PROFILE_SHA256
    authenticated = prior["authenticated_orders"]
    assert [entry["solver"] for entry in authenticated] == ["z3", "cvc5"]
    assert [tuple(entry["order"]) for entry in authenticated] == [
        ("c000", "c005", "c003", "c007", "c004", "c002", "c006", "c001", "c012", "c011", "c010", "c008", "c009"),
        ("c000", "c007", "c012", "c005", "c008", "c009", "c011", "c010", "c001", "c006", "c002", "c004", "c003"),
    ]


@pytest.mark.parametrize(
    "ranks",
    [
        {},
        {"c000": 0, "c001": 1},
        {class_id: 0 for class_id in subject.CLASS_IDS},
        {class_id: index for index, class_id in enumerate(subject.CLASS_IDS[:-1])},
        {class_id: (index if index else True) for index, class_id in enumerate(subject.CLASS_IDS)},
    ],
)
def test_malformed_semantic_rank_maps_fail_closed(ranks: dict[str, object]) -> None:
    with pytest.raises(subject.Profile0034QfnraError, match="parent exact rank"):
        subject._parent_order({"semantic_replay": {"evidence": {"ranks": ranks}}})


def test_parent_result_tampering_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = subject._read_regular

    def tampered(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b" " if path == subject.PARENT_RESULT_PATH else payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile0034QfnraError, match="profile result digest drifted"):
        subject.authenticate_source_orders()


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_target_inventory_is_full_source(
    prior: dict[str, object], targets: dict[str, dict[str, object]], order_id: str
) -> None:
    system = targets[order_id]
    assert tuple(tuple(entry["roles"]) for entry in system["classes"]) == subject.EXPECTED_CLASSES
    assert tuple(system["order"]) == tuple(
        prior["authenticated_orders"][subject.ORDER_IDS.index(order_id)]["order"]
    )
    assert system["variables"] == list(subject.TARGET_VARIABLES)
    assert len(system["classes"]) == 13
    assert subject.formula_inventory(system) == {
        "coordinate_variable_declarations": 26,
        "control_variable_declarations": 0,
        "gauge_assertions": 4,
        "strict_signed_area_assertions": 286,
        "row_equality_assertions": 13,
        "radius_disequality_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }


def test_profile34_alias_and_source_rows(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets["parent-z3-mirror"]
    role = system["role_class"]
    assert role["c2"] == "c002"
    assert role["q"] == role["e"] == "c006"
    t0 = next(row for row in system["rows"] if row["id"] == "T0")
    assert "c2" not in t0["support"]
    assert [row["id"] for row in system["rows"]] == ["T0", "K1", "K2", "L"]


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_smt_retains_every_requested_assertion(
    targets: dict[str, dict[str, object]], order_id: str
) -> None:
    commands = subject.build_smt_commands(targets[order_id])
    assert commands[0] == "(set-logic QF_NRA)"
    assert len(commands) == 1 + 26 + 4 + 286 + 13 + 1 + 1
    assert sum(command.startswith("(declare-fun ") for command in commands) == 26
    assert sum(command.startswith("(assert (> ") for command in commands) == 286
    assert sum(command.startswith("(assert (= ") for command in commands) == 17
    assert sum(command.startswith("(assert (not (= ") for command in commands) == 1
    assert sum(command.startswith("(assert (< ") for command in commands) == 1


def test_qfnra_triples_follow_each_derived_order_and_source_terms(
    targets: dict[str, dict[str, object]],
) -> None:
    for system in targets.values():
        commands = subject.build_smt_commands(system)
        order = tuple(system["order"])
        triples = tuple(itertools.combinations(order, 3))
        assert all(
            f"x_{b} x_{a}" in command and f"y_{c} y_{a}" in command
            for command, (a, b, c) in zip(commands[31:317], triples, strict=True)
        )
        role = system["role_class"]
        old = subject.frozen_nra._squared_distance_expr(role["c2"], role["O"])
        new = subject.frozen_nra._squared_distance_expr(role["c2"], role["d"])
        left = subject.frozen_nra._squared_distance_expr(role["e"], role["d"])
        right = subject.frozen_nra._squared_distance_expr(role["e"], role["a"])
        assert commands[-2] == f"(assert (not (= {old} {new})))"
        assert commands[-1] == f"(assert (< {left} {right}))"


def test_gauge_pins_first_two_authenticated_classes(
    targets: dict[str, dict[str, object]],
) -> None:
    for system in targets.values():
        zero, one = system["order"][:2]
        commands = subject.build_smt_commands(system)
        assert commands[27:31] == (
            f"(assert (= x_{zero} 0))",
            f"(assert (= y_{zero} 0))",
            f"(assert (= x_{one} 1))",
            f"(assert (= y_{one} 0))",
        )


def test_controls_are_opposite_and_rational() -> None:
    assert subject.build_smt_commands(subject.build_control_system("positive")) == (
        "(set-logic QF_NRA)",
        "(declare-fun t () Real)",
        "(assert (= t 1))",
    )
    assert subject.build_smt_commands(subject.build_control_system("negative")) == (
        "(set-logic QF_NRA)",
        "(declare-fun t () Real)",
        "(assert (= t 0))",
        "(assert (> t 0))",
    )


def test_mutated_source_formula_is_rejected(prior: dict[str, object]) -> None:
    system = subject._build_target_from_prior(prior, "parent-z3-mirror")
    system["rows"][0]["support"].pop()
    with pytest.raises(subject.Profile0034QfnraError, match="source formula"):
        subject._validate_system_current(system, prior)


@pytest.mark.parametrize("timeout", [0, -1, 3_600_001, True, 1.5])
def test_prepare_rejects_bad_timeout(timeout: object) -> None:
    with pytest.raises(subject.Profile0034QfnraError, match="timeout"):
        subject.prepare_query(
            subject.build_control_system("positive"), timeout_ms=timeout
        )


def test_query_binds_parent_sources_and_inventory() -> None:
    prepared = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1234
    )
    descriptor = prepared.query.descriptor
    assert descriptor["solver_profile"] == {
        "schema": subject.adapter.SOLVER_PROFILE_SCHEMA,
        "solvers": ["z3", "cvc5"],
        "timeout_ms": 1234,
    }
    paths = {entry["path"] for entry in descriptor["sources"]}
    assert {
        "parent-run-manifest.json",
        "parent-launch.json",
        "parent-terminal.json",
        "parent-profile-result.json",
        "parent-profile-source-manifest.json",
        "specification.md",
    } <= paths
    assert descriptor["semantic_input"]["formula_inventory"][
        "control_assertions"
    ] == 1


def test_target_adapter_snapshot_has_26_coordinate_values(
    targets: dict[str, dict[str, object]],
) -> None:
    prepared = subject.prepare_query(targets["parent-z3-mirror"], timeout_ms=1234)
    replayed = subject.adapter._revalidate_query_snapshot(prepared.query)
    assert replayed.descriptor == prepared.query.descriptor
    assert len(replayed.get_values) == 26


def test_exact_target_readback_rejects_bad_gauge(
    targets: dict[str, dict[str, object]],
) -> None:
    prepared = subject.prepare_query(targets["parent-z3-mirror"], timeout_ms=1000)
    values = "(" + " ".join(f"({term} 0)" for term in prepared.query.get_values) + ")"
    verification = subject.verify_sat_model(
        prepared.query, "z3", "(model)", values
    )
    assert verification.accepted is False
    assert verification.evidence["reason"] == "gauge"


def test_control_exact_replay() -> None:
    positive = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1000
    )
    negative = subject.prepare_query(
        subject.build_control_system("negative"), timeout_ms=1000
    )
    assert subject.verify_sat_model(
        positive.query, "z3", "(model)", "((t 1))"
    ).accepted
    assert not subject.verify_sat_model(
        negative.query, "cvc5", "(model)", "((t 0))"
    ).accepted


def test_existing_query_tree_resumes_without_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    output = tmp_path / "done"
    output.mkdir()
    prepared = subject.PreparedQuery(
        "control-positive", subject.build_control_system("positive"), object()
    )
    expected = {"overall_status": "FINITE_DIAGNOSTIC_COMPLETE"}
    monkeypatch.setattr(subject, "verify_adapter_tree", lambda *_args: expected)

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(f"transport used on resume: {name}")

    assert subject.run_query(prepared, output, NoTransport()) is expected


def test_fresh_query_creates_actual_artifact_parent(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    output = tmp_path / "artifacts" / "control-positive"
    prepared = subject.PreparedQuery(
        "control-positive", subject.build_control_system("positive"), object()
    )
    expected = {"overall_status": "FINITE_DIAGNOSTIC_COMPLETE"}
    called: list[subject.Path] = []

    def fake_run(*_args: object) -> None:
        called.append(output)

    monkeypatch.setattr(subject.adapter, "run_source_semantic_query", fake_run)
    monkeypatch.setattr(subject, "verify_adapter_tree", lambda *_args: expected)
    assert subject.run_query(prepared, output, object()) is expected
    assert output.parent.is_dir()
    assert called == [output]


def test_run_root_rejects_symlinked_lane_ancestor(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    repo = tmp_path / "repo"
    runs = repo / "scratch" / "runs"
    runs.mkdir(parents=True)
    target = tmp_path / "target"
    target.mkdir()
    lane = runs / subject.LANE_ID
    lane.symlink_to(target, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repo)
    monkeypatch.setattr(subject, "RUN_ROOT", lane / subject.RUN_ID)
    with pytest.raises(subject.Profile0034QfnraError, match="ancestor is unsafe"):
        subject.ensure_run_root()
    assert not (target / subject.RUN_ID).exists()


def test_run_root_child_filesystem_errors_are_producer_errors(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    repo = tmp_path / "repo"
    run = repo / "scratch" / "runs" / subject.LANE_ID / subject.RUN_ID
    run.mkdir(parents=True)
    (run / "artifacts").write_bytes(b"unsafe")
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repo)
    monkeypatch.setattr(subject, "RUN_ROOT", run)
    with pytest.raises(subject.Profile0034QfnraError, match="run-root child is unsafe"):
        subject.ensure_run_root()


def test_verify_run_is_read_only_for_partial_root(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    repo = tmp_path / "repo"
    run = repo / "scratch" / "runs" / subject.LANE_ID / subject.RUN_ID
    run.mkdir(parents=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repo)
    monkeypatch.setattr(subject, "RUN_ROOT", run)
    before = tuple(sorted(path.relative_to(repo).as_posix() for path in repo.rglob("*")))
    with pytest.raises(subject.Profile0034QfnraError, match="run-root child is absent"):
        subject.verify_run()
    after = tuple(sorted(path.relative_to(repo).as_posix() for path in repo.rglob("*")))
    assert after == before


def test_creation_path_writes_and_revalidates_manifest(
    monkeypatch: pytest.MonkeyPatch, tmp_path: subject.Path
) -> None:
    repo = tmp_path / "repo"
    run = repo / "scratch" / "runs" / subject.LANE_ID / subject.RUN_ID
    checkpoint_path = repo / ".codex" / "worktree-checkpoints" / f"{subject.LANE_ID}.json"
    checkpoint_path.parent.mkdir(parents=True)
    checkpoint = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "owner": subject.RUN_OWNER,
        "base_head": "base-head",
        "owned_paths": subject._CHECKPOINT_OWNED_PATHS,
        "generated_roots": [f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"],
        "durable_paths": [],
        "created_utc": "2026-09-04T00:00:00Z",
    }
    checkpoint["manifest_sha256"] = subject._self_hash(checkpoint, "manifest_sha256")
    checkpoint_path.write_bytes(subject._json(checkpoint))

    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repo)
    monkeypatch.setattr(subject, "RUN_ROOT", run)
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", checkpoint_path)

    def expected(created: str) -> dict[str, object]:
        loaded = subject._load_checkpoint()
        value: dict[str, object] = {
            "schema": subject.RUN_MANIFEST_SCHEMA,
            "lane_id": subject.LANE_ID,
            "run_id": subject.RUN_ID,
            "root": f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}",
            "owner": loaded["owner"],
            "base_head": loaded["base_head"],
            "output_classes": ["artifacts", "events", "tmp"],
            "created_utc": created,
        }
        value["manifest_sha256"] = subject._self_hash(value, "manifest_sha256")
        return value

    monkeypatch.setattr(subject, "_expected_run_manifest", expected)
    created_root, first = subject.ensure_run_root()
    assert created_root == run
    assert (run / "run_manifest.json").is_file()
    _, second = subject.ensure_run_root()
    assert second == first


def test_artifact_digest_custody(tmp_path: subject.Path) -> None:
    artifact = tmp_path / "a.json"
    artifact.write_bytes(b"{}\n")
    record = {
        "path": "a.json",
        "bytes": 3,
        "sha256": hashlib.sha256(b"{}\n").hexdigest(),
    }
    assert subject._verify_artifact(tmp_path, record, set()) == b"{}\n"
    with pytest.raises(subject.Profile0034QfnraError, match="digest mismatch"):
        subject._verify_artifact(tmp_path, dict(record, sha256="0" * 64), set())


def test_partial_and_symlink_output_trees_fail_closed(
    targets: dict[str, dict[str, object]], tmp_path: subject.Path
) -> None:
    prepared = subject.prepare_query(targets["parent-z3-mirror"], timeout_ms=1000)
    partial = tmp_path / "partial"
    partial.mkdir()
    with pytest.raises(subject.Profile0034QfnraError, match="artifact is missing"):
        subject.verify_adapter_tree(prepared, partial)
    link_target = tmp_path / "real"
    link_target.mkdir()
    link = tmp_path / "link"
    link.symlink_to(link_target, target_is_directory=True)
    with pytest.raises(subject.Profile0034QfnraError, match="output directory"):
        subject.verify_adapter_tree(prepared, link)


def test_terminal_status_is_conservative() -> None:
    unsat = {
        "engines": [
            {"raw_status": "UNSAT", "effective_status": "UNSAT_DISCOVERY_ONLY"}
        ]
        * 2
    }
    unknown = {
        "engines": [
            {"raw_status": "UNKNOWN", "effective_status": "INCONCLUSIVE_UNKNOWN"}
        ]
        * 2
    }
    accepted = {
        "engines": [
            {"raw_status": "SAT", "effective_status": "SAT_SEMANTICALLY_REPLAYED"}
        ]
        * 2
    }
    assert subject._terminal_status([unsat, unsat]) == "TARGETS_UNSAT_DISCOVERY_ONLY"
    assert subject._terminal_status([unsat, unknown]) == "TARGET_INCONCLUSIVE"
    assert subject._terminal_status([unsat, accepted]) == "TARGET_SAT_REPLAYED"


def test_governed_manifest_uses_checkpoint_base_without_creating_run() -> None:
    checkpoint = subject._load_checkpoint()
    assert checkpoint["lane_id"] == subject.LANE_ID
    manifest = subject._expected_run_manifest("2026-09-04T00:00:00Z")
    assert manifest["schema"] == subject.RUN_MANIFEST_SCHEMA
    assert manifest["base_head"] == "e296af8f97534aaaadc918e90af3c7da4064e391"
    assert manifest["root"] == f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"


def test_checkpoint_owner_is_bound_to_this_lane(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = subject._read_regular

    def tampered(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        if path == subject.CHECKPOINT_PATH:
            value = json.loads(payload)
            value["owner"] = "foreign-lane"
            return subject._json(value)
        return payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile0034QfnraError, match="checkpoint drifted"):
        subject._load_checkpoint()


def test_terminal_identity_tampering_fails_closed(tmp_path: subject.Path) -> None:
    path = tmp_path / "terminal.json"
    value = {
        "schema": subject.TERMINAL_SCHEMA,
        "claims": dict(subject.FALSE_CLAIMS),
        "status": "TARGET_INCONCLUSIVE",
        "results": {key: {} for key in subject.QUERY_KEYS},
        "terminal_sha256": "0" * 64,
    }
    path.write_bytes(subject._json(value))
    with pytest.raises(subject.Profile0034QfnraError, match="terminal record"):
        subject._read_terminal(path)


def test_no_transport_verify_rejects_unlaunched_run(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    class NoTransport:
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            raise AssertionError("transport used by no-solver verify")

    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", NoTransport)
    monkeypatch.setattr(subject, "_validate_existing_run_root", lambda: (subject.RUN_ROOT, {}))
    with pytest.raises(subject.Profile0034QfnraError, match="artifact is missing"):
        subject.verify_run()


def test_malformed_launch_fails_closed_with_producer_error(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = subject._read_regular

    def malformed(path: subject.Path, limit: int = 96 * 1024 * 1024) -> bytes:
        if path == subject.RUN_ROOT / "events/launch.json":
            return b"{}\n"
        return original(path, limit)

    monkeypatch.setattr(subject, "_read_regular", malformed)
    monkeypatch.setattr(subject, "_validate_existing_run_root", lambda: (subject.RUN_ROOT, {}))
    with pytest.raises(subject.Profile0034QfnraError, match="missing required fields"):
        subject.verify_run()


def test_main_is_sparse_and_verbose_is_one_json(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    result = {"status": "TARGET_INCONCLUSIVE"}
    monkeypatch.setattr(subject, "run_diagnostic", lambda **_kwargs: result)
    assert subject.main([]) == 0
    assert capsys.readouterr() == ("", "")
    assert subject.main(["--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == result
    assert captured.out.count("\n") == 1
    assert captured.err == ""


def test_module_has_no_direct_solver_or_fallback_transport() -> None:
    source = subject._read_regular(subject.Path(subject.__file__)).decode("utf-8")
    assert "import subprocess" not in source
    assert "subprocess." not in source
    assert "UrllibPiqdTransport" in source
    assert "fallback" not in source.lower()


def test_descriptor_mutation_is_rejected() -> None:
    prepared = subject.prepare_query(
        subject.build_control_system("positive"), timeout_ms=1000
    )
    mutated = copy.deepcopy(prepared.query.descriptor)
    mutated["semantic_input"]["formula_inventory"]["control_assertions"] = 2
    prepared.query.descriptor.clear()
    prepared.query.descriptor.update(mutated)
    with pytest.raises(subject.Profile0034QfnraError, match="descriptor"):
        subject.verify_sat_model(prepared.query, "z3", "(model)", "((t 1))")
