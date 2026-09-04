from __future__ import annotations

import copy
import hashlib
import itertools
from fractions import Fraction

import pytest
import sympy

from census.card_head import (
    exactfive_hard_source_swap_profile0034_equilateral_frame_qfnra_piqd as subject,
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
    assert prior["split_status"] == "TARGET_INCONCLUSIVE"
    assert prior["split_target_statuses"] == {
        key: ["UNKNOWN", "UNKNOWN"] for key in subject.predecessor.TARGET_KEYS
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
    with pytest.raises(subject.Profile0034EquilateralFrameError, match="bytes drifted"):
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
def test_equilateral_frame_inventory_and_substitution(
    targets: dict[str, dict[str, object]], key: str
) -> None:
    system = targets[key]
    frame = system["equilateral_frame"]
    assert frame["class_c1"] == "c000"
    assert frame["class_O"] == "c001"
    assert frame["class_a"] == "c003"
    assert frame["vertical_coordinate"] == "Y"
    assert frame["original_vertical_scale_squared"] == 3
    assert frame["substitution"]["c000"] == ["0", "0"]
    assert frame["substitution"]["c001"] == ["1", "0"]
    assert frame["substitution"]["c003"][0] == "1/2"
    assert frame["substitution"]["c003"][1] in {"-1/2", "1/2"}
    assert frame["emitted_assertions"] == 0
    assert frame["removed_row_equalities"] == [
        {"row_id": "T0", "other_support_role": "c1"},
        {"row_id": "K1", "other_support_role": "a"},
    ]
    assert system["variables"] == list(subject.TARGET_VARIABLES)
    assert len(system["variables"]) == 20
    assert len(system["strict_signed_areas"]) == 286
    assert len(system["source_row_equalities"]) == 11
    assert subject.formula_inventory(system) == {
        "coordinate_variable_declarations": 20,
        "control_variable_declarations": 0,
        "gauge_assertions": 0,
        "strict_signed_area_assertions": 286,
        "row_equality_assertions": 11,
        "strict_radius_branch_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }
    commands = subject._build_smt_commands_current(system)
    journal = "\n".join(commands)
    assert len(commands) == 1 + 20 + 286 + 11 + 1 + 1
    assert len(commands) - 1 - 20 == 299
    assert sum(command.startswith("(declare-fun ") for command in commands) == 20
    assert "x_c000" not in journal
    assert "y_c000" not in journal
    assert "x_c001" not in journal
    assert "y_c001" not in journal
    assert "x_c003" not in journal
    assert "Y_c003" not in journal
    assert "y_" not in journal
    assert "(assert (= x_c000 0))" not in journal
    assert "(assert (= x_c001 1))" not in journal


def test_area_and_source_row_ledgers_are_complete(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets[subject.TARGET_KEYS[0]]
    assert [tuple(row["triple"]) for row in system["strict_signed_areas"]] == list(
        itertools.combinations(system["order"], 3)
    )
    assert [row["row_id"] for row in system["source_row_equalities"]].count("T0") == 3
    assert [row["row_id"] for row in system["source_row_equalities"]].count("K1") == 2
    assert [row["row_id"] for row in system["source_row_equalities"]].count("K2") == 3
    assert [row["row_id"] for row in system["source_row_equalities"]].count("L") == 3


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
@pytest.mark.parametrize("branch_id", subject.BRANCH_IDS)
def test_only_the_two_forced_parent_rows_are_removed(
    prior: dict[str, object], order_id: str, branch_id: str
) -> None:
    parent = subject.predecessor._build_target_from_prior(
        prior["parent_custody"], order_id, branch_id
    )
    current = subject._build_target_from_prior(prior, order_id, branch_id)
    parent_keys = {
        (row["row_id"], row["other_support_role"])
        for row in parent["source_row_equalities"]
    }
    current_keys = {
        (row["row_id"], row["other_support_role"])
        for row in current["source_row_equalities"]
    }
    assert parent_keys - current_keys == {("T0", "c1"), ("K1", "a")}
    assert current_keys <= parent_keys
    assert all("(* 3 " in row["left"] for row in current["source_row_equalities"])
    assert all("(* 3 " in row["right"] for row in current["source_row_equalities"])


@pytest.mark.parametrize("order_id", subject.ORDER_IDS)
def test_constant_anchor_area_is_retained(
    order_id: str, prior: dict[str, object]
) -> None:
    system = subject._build_target_from_prior(prior, order_id, "lt")
    fixed_classes = set(subject.FRAME_SUBSTITUTIONS[order_id])
    constant_rows = [
        row
        for row in system["strict_signed_areas"]
        if set(row["triple"]) <= fixed_classes
    ]
    assert len(constant_rows) == 1
    assert (
        constant_rows[0]["triple"]
        == system["equilateral_frame"]["anchor_derivation"]["order_area_triple"]
    )
    expression = constant_rows[0]["expression"]
    assert all(variable not in expression for variable in subject.TARGET_VARIABLES)


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


def test_descriptor_has_20_values_and_binds_predecessor_sources(
    prior: dict[str, object], targets: dict[str, dict[str, object]]
) -> None:
    prepared = subject._prepare_query_with_prior(
        targets[subject.TARGET_KEYS[0]], prior, timeout_ms=1234
    )
    assert len(prepared.query.get_values) == 20
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


def test_exact_readback_reconstructs_the_equilateral_frame(
    targets: dict[str, dict[str, object]],
) -> None:
    system = targets[subject.TARGET_KEYS[0]]
    values = "(" + " ".join(f"({term} 0)" for term in system["variables"]) + ")"
    coords = subject._parse_coordinates(values, system["variables"], system["order_id"])
    assert coords["c000"] == (0, 0)
    assert coords["c001"] == (1, 0)
    assert coords["c003"] == (Fraction(1, 2), Fraction(-1, 2))
    assert len(coords) == 13
    replay = subject.check_coordinates(system, coords)
    assert replay["accepted"] is False
    assert replay["reason"] == "strict_fixed_order"


def test_vertical_change_is_exact_in_both_directions() -> None:
    sqrt3 = sympy.sqrt(3)
    ax, aY, bx, bY, cx, cY = sympy.symbols("ax aY bx bY cx cY", real=True)
    transformed_area = (bx - ax) * (cY - aY) - (bY - aY) * (cx - ax)
    original_area = (bx - ax) * (sqrt3 * cY - sqrt3 * aY) - (
        sqrt3 * bY - sqrt3 * aY
    ) * (cx - ax)
    assert sympy.expand(original_area - sqrt3 * transformed_area) == 0
    original_distance = (ax - bx) ** 2 + (sqrt3 * aY - sqrt3 * bY) ** 2
    weighted_distance = (ax - bx) ** 2 + 3 * (aY - bY) ** 2
    assert sympy.expand(original_distance - weighted_distance) == 0
    y = sympy.symbols("y", real=True)
    assert sympy.simplify(sqrt3 * (y / sqrt3) - y) == 0


def test_anchor_equations_force_x_and_squared_Y() -> None:
    x_a, Y_a = sympy.symbols("x_a Y_a", real=True)
    from_O = (x_a - 1) ** 2 + 3 * Y_a**2 - 1
    from_c1 = x_a**2 + 3 * Y_a**2 - 1
    assert sympy.expand(from_O - from_c1) == 1 - 2 * x_a
    assert sympy.solve(from_O - from_c1, x_a) == [sympy.Rational(1, 2)]
    at_half = sympy.expand(from_c1.subs(x_a, sympy.Rational(1, 2)))
    assert sympy.solve(at_half, Y_a) == [
        -sympy.Rational(1, 2),
        sympy.Rational(1, 2),
    ]


@pytest.mark.parametrize(
    ("order_id", "expected_Y", "triple"),
    [
        ("parent-z3-mirror", Fraction(-1, 2), ("c000", "c003", "c001")),
        ("parent-cvc5-direct", Fraction(1, 2), ("c000", "c001", "c003")),
    ],
)
def test_anchor_rows_and_order_sign_force_apex(
    order_id: str, expected_Y: Fraction, triple: tuple[str, str, str]
) -> None:
    fixed = subject._frame_coordinates(order_id)
    assert fixed["c003"] == (Fraction(1, 2), expected_Y)
    assert subject._distance_value(fixed, "c001", "c003") == 1
    assert subject._distance_value(fixed, "c001", "c000") == 1
    assert subject._distance_value(fixed, "c000", "c003") == 1
    assert subject._distance_value(fixed, "c000", "c001") == 1
    assert subject._area_value(fixed, *triple) == Fraction(1, 2)


def test_algebraic_model_values_fail_closed(
    prior: dict[str, object], targets: dict[str, dict[str, object]]
) -> None:
    system = targets[subject.TARGET_KEYS[0]]
    prepared = subject._prepare_query_with_prior(system, prior, timeout_ms=1000)
    values = (
        "("
        + " ".join(
            f"({term} (root-obj (+ (^ x 2) (- 2)) 1))" for term in system["variables"]
        )
        + ")"
    )
    replay = subject.verify_sat_model(prepared.query, "z3", "(model)", values)
    assert replay.accepted is False
    assert replay.evidence["reason"] == "exact_readback_unsupported"


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
    with pytest.raises(subject.Profile0034EquilateralFrameError, match="drifted"):
        subject._validate_system_current(changed, prior)


@pytest.mark.parametrize("timeout", [0, -1, 3_600_001, True, 1.5])
def test_prepare_rejects_invalid_timeout(timeout: object) -> None:
    with pytest.raises(subject.Profile0034EquilateralFrameError, match="timeout"):
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
    with pytest.raises(
        subject.Profile0034EquilateralFrameError, match="digest mismatch"
    ):
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
    with pytest.raises(subject.Profile0034EquilateralFrameError, match="workers"):
        subject.run_diagnostic(workers=5)


def test_prelaunch_manifest_is_current_and_has_no_solver_outputs() -> None:
    root, manifest = subject.ensure_run_root()
    assert manifest["manifest_sha256"] == subject._self_hash(
        manifest, "manifest_sha256"
    )
    assert manifest == subject._expected_run_manifest(manifest["created_utc"])
    assert manifest["base_head"] == "8a9e465584be89523b256f9838d40f89a6ff89ae"
    assert list((root / "artifacts").iterdir()) == []
    assert list((root / "events").iterdir()) == []
    assert list((root / "tmp").iterdir()) == []


def test_module_has_no_direct_solver_or_fallback() -> None:
    source = subject._read_regular(subject.Path(subject.__file__)).decode("utf-8")
    assert "import subprocess" not in source
    assert "subprocess." not in source
    assert "UrllibPiqdTransport" in source
    assert "fallback" not in source.lower()
