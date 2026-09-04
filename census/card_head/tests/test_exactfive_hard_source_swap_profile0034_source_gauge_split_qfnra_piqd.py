from __future__ import annotations

import copy
import hashlib
import itertools

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_source_gauge_split_qfnra_piqd as subject,
)


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


def test_predecessor_run_and_current_producer_are_authenticated(
    prior: dict[str, object],
) -> None:
    assert prior["run_manifest_sha256"] == subject.PREDECESSOR_MANIFEST_SHA256
    assert prior["terminal_sha256"] == subject.PREDECESSOR_TERMINAL_SHA256
    assert prior["producer_sha256"] == subject.PREDECESSOR_PRODUCER_SHA256
    assert prior["coarse_status"] == "TARGET_INCONCLUSIVE"
    assert prior["coarse_target_statuses"] == {
        order_id: ["UNKNOWN", "UNKNOWN"] for order_id in subject.ORDER_IDS
    }
    assert {
        key: tuple(order) for key, order in prior["orders"].items()
    } == subject.EXPECTED_ORDERS


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
    with pytest.raises(subject.Profile0034GaugeSplitError, match="bytes drifted"):
        subject.authenticate_predecessor_run()


def test_exact_four_target_matrix(
    targets: dict[str, dict[str, object]],
) -> None:
    assert tuple(targets) == subject.TARGET_KEYS
    assert len(targets) == 4
    assert {
        (system["order_id"], system["branch_id"]) for system in targets.values()
    } == set(itertools.product(subject.ORDER_IDS, subject.BRANCH_IDS))
    assert {system["radius_branch"]["relation"] for system in targets.values()} == {
        "<",
        ">",
    }


@pytest.mark.parametrize("key", subject.TARGET_KEYS)
def test_source_gauge_inventory_and_substitution(
    targets: dict[str, dict[str, object]], key: str
) -> None:
    system = targets[key]
    assert system["source_gauge"] == {
        "class_c1": "c000",
        "class_O": "c001",
        "substitution": {"c000": ["0", "0"], "c001": ["1", "0"]},
        "emitted_assertions": 0,
    }
    assert system["variables"] == list(subject.TARGET_VARIABLES)
    assert len(system["variables"]) == 22
    assert len(system["strict_signed_areas"]) == 286
    assert len(system["source_row_equalities"]) == 13
    assert subject.formula_inventory(system) == {
        "coordinate_variable_declarations": 22,
        "control_variable_declarations": 0,
        "gauge_assertions": 0,
        "strict_signed_area_assertions": 286,
        "row_equality_assertions": 13,
        "strict_radius_branch_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }
    commands = subject._build_smt_commands_current(system)
    journal = "\n".join(commands)
    assert len(commands) == 1 + 22 + 286 + 13 + 1 + 1
    assert sum(command.startswith("(declare-fun ") for command in commands) == 22
    assert "x_c000" not in journal
    assert "y_c000" not in journal
    assert "x_c001" not in journal
    assert "y_c001" not in journal
    assert "(assert (= x_c000 0))" not in journal
    assert "(assert (= x_c001 1))" not in journal


def test_area_and_source_row_ledgers_are_complete(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets[subject.TARGET_KEYS[0]]
    assert [tuple(row["triple"]) for row in system["strict_signed_areas"]] == list(
        itertools.combinations(system["order"], 3)
    )
    assert [row["row_id"] for row in system["source_row_equalities"]].count("T0") == 4
    assert [row["row_id"] for row in system["source_row_equalities"]].count("K1") == 3
    assert [row["row_id"] for row in system["source_row_equalities"]].count("K2") == 3
    assert [row["row_id"] for row in system["source_row_equalities"]].count("L") == 3


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_radius_cells_share_every_nonbranch_constraint(
    prior: dict[str, object], order_id: str
) -> None:
    less = subject._build_target_from_prior(prior, order_id, "lt")
    greater = subject._build_target_from_prior(prior, order_id, "gt")
    less_radius = less.pop("radius_branch")
    greater_radius = greater.pop("radius_branch")
    less.pop("key")
    greater.pop("key")
    less.pop("branch_id")
    greater.pop("branch_id")
    assert less == greater
    assert less_radius["left"] == greater_radius["left"]
    assert less_radius["right"] == greater_radius["right"]
    assert (less_radius["relation"], greater_radius["relation"]) == ("<", ">")


def test_source_strict_is_retained_in_every_target(
    targets: dict[str, dict[str, object]],
) -> None:
    for system in targets.values():
        strict = system["source_strict"]
        assert strict["left_roles"] == ["e", "d"]
        assert strict["right_roles"] == ["e", "a"]
        assert strict["relation"] == "<"
        assert subject._build_smt_commands_current(system)[-1] == (
            f"(assert (< {strict['left']} {strict['right']}))"
        )


def test_descriptor_has_22_values_and_binds_predecessor_sources(
    prior: dict[str, object], targets: dict[str, dict[str, object]]
) -> None:
    prepared = subject._prepare_query_with_prior(
        targets[subject.TARGET_KEYS[0]], prior, timeout_ms=1234
    )
    assert len(prepared.query.get_values) == 22
    assert set(prepared.query.get_values) == set(subject.TARGET_VARIABLES)
    assert prepared.query.descriptor["solver_profile"] == {
        "schema": subject.adapter.SOLVER_PROFILE_SCHEMA,
        "solvers": ["z3", "cvc5"],
        "timeout_ms": 1234,
    }
    paths = {entry["path"] for entry in prepared.query.descriptor["sources"]}
    assert {
        "predecessor-run-manifest.json",
        "predecessor-launch.json",
        "predecessor-terminal.json",
        "implementation-current.py",
        "implementation-predecessor.py",
        "specification.md",
    } <= paths
    assert {
        f"predecessor-{key}-result.json" for key in subject.predecessor.QUERY_KEYS
    } <= paths


def test_exact_readback_reconstructs_the_source_gauge(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets[subject.TARGET_KEYS[0]]
    values = "(" + " ".join(f"({term} 0)" for term in system["variables"]) + ")"
    coords = subject._parse_coordinates(values, system["variables"])
    assert coords["c000"] == (0, 0)
    assert coords["c001"] == (1, 0)
    assert len(coords) == 13
    replay = subject.check_coordinates(system, coords)
    assert replay["accepted"] is False
    assert replay["reason"] == "strict_fixed_order"


def test_controls_are_opposite_and_exact(
    prior: dict[str, object],
) -> None:
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


def test_semantic_system_mutation_is_rejected(
    prior: dict[str, object], targets: dict[str, dict[str, object]]
) -> None:
    changed = copy.deepcopy(targets[subject.TARGET_KEYS[0]])
    changed["strict_signed_areas"].pop()
    with pytest.raises(subject.Profile0034GaugeSplitError, match="drifted"):
        subject._validate_system_current(changed, prior)


@pytest.mark.parametrize("timeout", [0, -1, 3_600_001, True, 1.5])
def test_prepare_rejects_invalid_timeout(timeout: object) -> None:
    with pytest.raises(subject.Profile0034GaugeSplitError, match="timeout"):
        subject.prepare_query(
            subject.build_control_system("positive"), timeout_ms=timeout
        )


def test_existing_query_tree_never_uses_transport(
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


def test_artifact_digest_custody(tmp_path: subject.Path) -> None:
    artifact = tmp_path / "a.json"
    artifact.write_bytes(b"{}\n")
    record = {
        "path": "a.json",
        "bytes": 3,
        "sha256": hashlib.sha256(b"{}\n").hexdigest(),
    }
    assert subject._verify_artifact(tmp_path, record, set()) == b"{}\n"
    with pytest.raises(subject.Profile0034GaugeSplitError, match="digest mismatch"):
        subject._verify_artifact(tmp_path, dict(record, sha256="0" * 64), set())


def test_worker_bound_and_terminal_classification() -> None:
    unknown = {
        "engines": [
            {"raw_status": "UNKNOWN", "effective_status": "INCONCLUSIVE_UNKNOWN"}
        ]
        * 2
    }
    unsat = {
        "engines": [{"raw_status": "UNSAT", "effective_status": "UNSAT_DISCOVERY_ONLY"}]
        * 2
    }
    assert subject.MAX_WORKERS == subject.DEFAULT_WORKERS == 4
    assert subject.DEFAULT_TIMEOUT_S == 60.0
    assert subject._terminal_status([unknown, unsat]) == "TARGET_INCONCLUSIVE"
    with pytest.raises(subject.Profile0034GaugeSplitError, match="workers"):
        subject.run_diagnostic(workers=5)


def test_prelaunch_manifest_is_current_and_has_no_solver_outputs() -> None:
    root, manifest = subject.ensure_run_root()
    assert manifest["manifest_sha256"] == subject._self_hash(
        manifest, "manifest_sha256"
    )
    assert manifest == subject._expected_run_manifest(manifest["created_utc"])
    assert manifest["base_head"] == "12c416262e4d390a2623cbc72a5ff4c435f60855"
    assert list((root / "artifacts").iterdir()) == []
    assert list((root / "events").iterdir()) == []
    assert list((root / "tmp").iterdir()) == []


def test_module_has_no_direct_solver_or_fallback() -> None:
    source = subject._read_regular(subject.Path(subject.__file__)).decode("utf-8")
    assert "import subprocess" not in source
    assert "subprocess." not in source
    assert "UrllibPiqdTransport" in source
    assert "fallback" not in source.lower()
