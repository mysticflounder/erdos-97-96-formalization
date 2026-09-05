from __future__ import annotations

import itertools
from fractions import Fraction

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd as subject,
)


@pytest.fixture(scope="module")
def prior() -> dict[str, object]:
    return subject.authenticate_source_orders()


@pytest.fixture(scope="module")
def targets(prior: dict[str, object]) -> dict[str, dict[str, object]]:
    return {
        b: subject._build_target_from_prior(prior, "mirror", b)
        for b in subject.BRANCH_IDS
    }


def test_parent_and_runtime_order_custody(prior: dict[str, object]) -> None:
    assert prior["profile_sha256"] == subject.PROFILE_SHA256
    assert tuple(prior["orders"]["mirror"]) == subject.EXPECTED_ORDER
    assert prior["order_sha256"] == subject.EXPECTED_ORDER_SHA256
    assert (
        prior["parent_manifest_sha256"]
        == "46dfcd151204d57e759f6910524bc5a77f1e328aec10c57003f21d062c2600bd"
    )
    assert (
        prior["result_sha256s"]["parent-z3-mirror"]
        == "0db3c932e361daf67c9ba70b9c5c5ea565cc307fc7901f2aba3058758e502875"
    )


def test_inventory_and_commands(targets: dict[str, dict[str, object]]) -> None:
    for system in targets.values():
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
        assert len(subject.build_smt_commands(system)) == 177


def test_edges_are_cyclic_rotations_of_full_order_triples(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets["lt"]
    order = tuple(system["order"])
    for row in system["supporting_edges"]:
        original, directed = (
            tuple(row["original_triple"]),
            (*row["edge"], row["vertex"]),
        )
        rotations = (
            original,
            (original[1], original[2], original[0]),
            (original[2], original[0], original[1]),
        )
        assert original in itertools.combinations(order, 3)
        assert directed == rotations[row["cyclic_rotation"]]
        assert row["relation"] == ">"


def test_supporting_replay_accepts_convex_order_and_rejects_defect() -> None:
    order = tuple(f"p{i:02d}" for i in range(13))
    coords = {p: (Fraction(i - 6), Fraction((i - 6) ** 2)) for i, p in enumerate(order)}
    assert subject.check_supporting_edges(order, coords)["accepted"]
    coords[order[5]] = coords[order[4]]
    assert subject.check_supporting_edges(order, coords)["accepted"] is False


def test_mutated_order_and_formula_fail_closed(prior: dict[str, object]) -> None:
    mutated = dict(prior, orders={"mirror": list(reversed(subject.EXPECTED_ORDER))})
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="order hash"
    ):
        subject._build_target_from_prior(mutated, "mirror", "lt")
    system = subject._build_target_from_prior(prior, "mirror", "lt")
    system["supporting_edges"].pop()
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="drifted"
    ):
        subject.build_smt_commands(system)


@pytest.mark.parametrize("bad", [0, -1, True, 1.5, 3_600_001])
def test_bad_timeout_rejected(bad: object) -> None:
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="timeout"
    ):
        subject.prepare_query(subject.build_control_system("positive"), timeout_ms=bad)


def test_controls_are_rational() -> None:
    assert (
        subject.build_smt_commands(subject.build_control_system("positive"))[-1]
        == "(assert (= t 1))"
    )
    assert (
        subject.build_smt_commands(subject.build_control_system("negative"))[-1]
        == "(assert (> t 0))"
    )


def test_positive_control_sat_replay_is_scalar() -> None:
    prepared = subject.prepare_query(subject.build_control_system("positive"))
    replay = subject.verify_sat_model(
        prepared.query,
        "z3",
        "(define-fun t () Real 1)",
        "((t 1))",
    )
    assert replay.accepted
    assert replay.evidence["control"] == "positive"


def test_terminal_record_consumes_both_controls_and_both_targets(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    results = {
        key: {"engines": [{"raw_status": "UNSAT"}, {"raw_status": "UNSAT"}]}
        for key in subject.QUERY_KEYS
    }
    records = {key: {"result_sha256": f"digest-{key}"} for key in subject.QUERY_KEYS}
    monkeypatch.setattr(
        subject, "_result_record", lambda _root, key, _result: records[key]
    )
    launch = {
        "run_manifest_sha256": "manifest",
        "launch_sha256": "launch",
    }
    terminal = subject._terminal_record(subject.RUN_ROOT, launch, results)
    assert terminal["status"] == "TARGETS_UNSAT_DISCOVERY_ONLY"
    assert set(terminal["results"]) == set(subject.QUERY_KEYS)


def test_verify_run_does_not_use_transport(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        subject,
        "_validate_existing_run_root",
        lambda: (_ for _ in ()).throw(
            subject.Profile0034NewMirrorSupportingEdgeError("run root is absent")
        ),
    )
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="absent"):
        subject.verify_run()


@pytest.mark.parametrize(
    "server",
    ["file:///tmp/piqd", "http://user@localhost:7272", "http://localhost:7272/?x=1"],
)
def test_run_rejects_non_custodial_server_urls(server: str) -> None:
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="URL"):
        subject.run_diagnostic(server=server)


def test_malformed_terminal_is_rejected(tmp_path) -> None:
    path = tmp_path / "terminal.json"
    path.write_text("{}", encoding="utf-8")
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="terminal"
    ):
        subject._read_terminal(path)


def test_existing_tree_rejects_symlinked_ancestor(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repo"
    repository.mkdir()
    outside = tmp_path / "outside"
    outside.mkdir()
    (repository / "runs").symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", repository / "runs" / "lane" / "run")
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="unsafe"):
        subject._validate_existing_run_root()


def test_existing_tree_rejects_partial_children(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repo"
    root = repository / "runs" / "lane" / "run"
    (root / "artifacts").mkdir(parents=True)
    (root / "events").mkdir()
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="child"):
        subject._validate_existing_run_root()


def test_resume_rejects_immutable_launch_drift(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    (root / "events" / "launch.json").write_text("{}", encoding="utf-8")
    manifest = {"manifest_sha256": "manifest"}
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="launch"):
        subject.run_diagnostic(server="http://127.0.0.1:7272")


def test_parent_result_mutation_is_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    original = subject._read_regular

    def corrupt(path, limit=96 * 1024 * 1024):
        payload = original(path, limit)
        if path == subject.PARENT_RESULT_PATH:
            return payload + b"\n"
        return payload

    monkeypatch.setattr(subject, "_read_regular", corrupt)
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="parent result"
    ):
        subject.authenticate_source_orders()


def test_fractional_millisecond_timeout_creates_no_launch(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="millisecond"
    ):
        subject.run_diagnostic(timeout_s=0.0001)
    assert not (run_root / "events" / "launch.json").exists()


def test_ensure_run_root_creates_and_revalidates_manifest(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    actual_repository = subject.REPOSITORY_ROOT
    repository = tmp_path / "repo"
    repository.mkdir()
    checkpoint_path = tmp_path / "checkpoint.json"
    checkpoint = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "owner": subject.RUN_OWNER,
        "base_head": "0" * 40,
        "owned_paths": subject._CHECKPOINT_OWNED_PATHS,
        "generated_roots": [f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"],
        "durable_paths": [],
        "created_utc": "2026-09-04T00:00:00Z",
    }
    checkpoint["manifest_sha256"] = subject._self_hash(checkpoint, "manifest_sha256")
    checkpoint_path.write_bytes(subject._json(checkpoint))
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(
        subject,
        "RUN_ROOT",
        repository / "scratch" / "runs" / subject.LANE_ID / subject.RUN_ID,
    )
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", checkpoint_path)
    monkeypatch.setattr(
        subject,
        "_repo_path",
        lambda path: path.resolve().relative_to(actual_repository.resolve()).as_posix(),
    )
    assert not subject.RUN_ROOT.exists()
    root, first = subject.ensure_run_root()
    assert (root / "run_manifest.json").is_file()
    assert all((root / name).is_dir() for name in ("artifacts", "events", "tmp"))
    same_root, second = subject.ensure_run_root()
    assert same_root == root
    assert second == first
    assert second["manifest_sha256"] == subject._self_hash(second, "manifest_sha256")


def test_existing_tree_rejects_unsafe_child_symlink(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repo"
    root = repository / "runs" / "lane" / "run"
    (root / "artifacts").mkdir(parents=True)
    (root / "events").mkdir()
    outside = tmp_path / "outside"
    outside.mkdir()
    (root / "tmp").symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeError, match="unsafe"):
        subject._validate_existing_run_root()


@pytest.mark.parametrize("key", subject.parent.QUERY_KEYS)
def test_each_parent_source_manifest_binding_is_checked(
    key: str, monkeypatch: pytest.MonkeyPatch
) -> None:
    original = subject.parent._read_regular
    target = subject.PARENT_ROOT / "artifacts" / key / "source-manifest.json"

    def corrupt(path, limit=96 * 1024 * 1024):
        payload = original(path, limit)
        if path == target:
            return payload + b"\n"
        return payload

    monkeypatch.setattr(subject.parent, "_read_regular", corrupt)
    with pytest.raises(
        subject.Profile0034NewMirrorSupportingEdgeError, match="parent artifact replay"
    ):
        subject.authenticate_source_orders()


def test_completed_terminal_resume_uses_verify_without_transport(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "events" / "launch.json").write_text("{}", encoding="utf-8")
    (root / "events" / "terminal.json").write_text("{}", encoding="utf-8")
    monkeypatch.setattr(
        subject, "ensure_run_root", lambda: (root, {"manifest_sha256": "manifest"})
    )
    monkeypatch.setattr(subject, "_launch_record", lambda *args: {})
    monkeypatch.setattr(subject, "verify_run", lambda: {"status": "complete"})

    class NoTransport:
        def __init__(self, *args, **kwargs):
            raise AssertionError("transport must not be constructed on resume")

    monkeypatch.setattr(subject.adapter, "UrllibPiqdTransport", NoTransport)
    assert subject.run_diagnostic() == {"status": "complete"}
