from __future__ import annotations

import ast
from dataclasses import replace
from fractions import Fraction
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_hard_source_swap_adaptive_equality_core_collision_witness as witness,
)


@pytest.fixture(scope="module")
def authenticated() -> witness.AuthenticatedTargets:
    return witness.reconstruct_authenticated_targets()


def test_modulus_arithmetic_is_exact() -> None:
    z = witness.Z
    assert z * z == witness.QuotientElement(Fraction(3, 4))
    assert (2 + z) * (2 - z) == witness.QuotientElement(Fraction(13, 4))
    assert (1 + z) ** 3 == witness.QuotientElement(
        Fraction(13, 4), Fraction(15, 4)
    )
    assert witness.verify_modulus() == {
        "polynomial": "4*z^2-3",
        "degree": 2,
        "coefficients_low_to_high": ["-3", "0", "4"],
        "remainder": {"rational": "0", "z_coefficient": "0"},
    }


def test_modulus_must_be_nonconstant(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(witness, "MODULUS_COEFFICIENTS", (Fraction(-3),))
    with pytest.raises(witness.CollisionWitnessError, match="nonconstant"):
        witness.verify_modulus()


def test_all_26_authenticated_generator_remainders_are_zero(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    result = witness.verify_authenticated_witness(authenticated)
    assert result["generator_checks"] == 26
    assert [len(gauge["generator_remainders"]) for gauge in result["gauges"]] == [
        13,
        13,
    ]
    assert {
        tuple(sorted(remainder.items()))
        for gauge in result["gauges"]
        for remainder in gauge["generator_remainders"]
    } == {(('rational', '0'), ('z_coefficient', '0'))}


def test_both_gauge_anchors_are_checked(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    result = witness.verify_authenticated_witness(authenticated)
    assert [gauge["anchors"] for gauge in result["gauges"]] == [
        {"rank_zero": "c000", "rank_one": "c010"},
        {"rank_zero": "c000", "rank_one": "c008"},
    ]


def test_requested_witness_labels_name_all_eleven_classes() -> None:
    assert witness.WITNESS_LABEL_TO_CLASS == {
        "B": "c000",
        "O": "c001",
        "Q": "c002",
        "A": "c003",
        "D": "c004",
        "S": "c005",
        "E": "c006",
        "U": "c007",
        "V": "c008",
        "X": "c009",
        "Y": "c010",
    }
    assignment = witness.witness_assignment()

    def point(label: str) -> tuple[witness.QuotientElement, witness.QuotientElement]:
        class_id = witness.WITNESS_LABEL_TO_CLASS[label]
        return assignment[f"x_{class_id}"], assignment[f"y_{class_id}"]

    assert point("B") == point("Q") == (witness.ZERO, witness.ZERO)
    assert point("O") == point("U") == point("V") == point("Y") == (
        witness.ONE,
        witness.ZERO,
    )
    assert point("A") == point("D") == point("S") == point("E") == point("X") == (
        witness.QuotientElement(Fraction(1, 2)),
        witness.Z,
    )


def test_assignment_mutation_is_rejected(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    assignment = witness.witness_assignment()
    assignment["x_c003"] = witness.ZERO
    with pytest.raises(witness.CollisionWitnessError, match="nonzero remainder"):
        witness.verify_authenticated_witness(authenticated, assignment)


def test_anchor_mutation_is_rejected(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    assignment = witness.witness_assignment()
    assignment["x_c010"] = witness.ZERO
    with pytest.raises(witness.CollisionWitnessError, match="rank-one anchor"):
        witness.verify_authenticated_witness(authenticated, assignment)


def test_polynomial_drift_is_rejected(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    first, second = authenticated.queries
    changed = replace(
        first, polynomials=(first.polynomials[0] + "+1", *first.polynomials[1:])
    )
    drifted = replace(authenticated, queries=(changed, second))
    with pytest.raises(witness.CollisionWitnessError, match="polynomial or source"):
        witness.verify_authenticated_witness(drifted)


def test_producer_source_drift_is_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(witness, "EXPECTED_PRODUCER_SHA256", "0" * 64)
    with pytest.raises(witness.CollisionWitnessError, match="source drifted"):
        witness.reconstruct_authenticated_targets()


def test_reconstruction_never_calls_transport_helpers(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport-capable producer helper was called")

    monkeypatch.setattr(witness.equality_core, "run_diagnostic", forbidden)
    monkeypatch.setattr(
        witness.equality_core, "revalidate_prior_adaptive_run", forbidden
    )
    rebuilt = witness.reconstruct_authenticated_targets()
    assert tuple(query.key for query in rebuilt.queries) == tuple(
        witness.EXPECTED_TARGET_HASHES
    )


def test_missing_completed_tree_fails_without_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport-capable producer helper was called")

    monkeypatch.setattr(witness.equality_core, "RUN_ROOT", tmp_path / "missing")
    monkeypatch.setattr(witness.equality_core, "run_diagnostic", forbidden)
    with pytest.raises(witness.CollisionWitnessError, match="cannot read required"):
        witness.reconstruct_authenticated_targets()


def test_source_context_drift_is_rejected(
    authenticated: witness.AuthenticatedTargets,
) -> None:
    first, second = authenticated.queries
    context = dict(first.source_context)
    context["producer_version"] = "drifted"
    drifted = replace(authenticated, queries=(replace(first, source_context=context), second))
    with pytest.raises(witness.CollisionWitnessError, match="polynomial or source"):
        witness.verify_authenticated_witness(drifted)


@pytest.mark.parametrize(
    "payload",
    [
        ("[" * 2_000 + "0" + "]" * 2_000).encode("ascii"),
        b'{"integer":' + b"9" * 5_000 + b"}",
    ],
    ids=("deep-nesting", "oversized-integer"),
)
def test_hostile_json_fails_with_controlled_error(payload: bytes) -> None:
    with pytest.raises(witness.CollisionWitnessError, match="hostile JSON"):
        witness._strict_json_object(payload, "hostile JSON")


@pytest.mark.parametrize(
    "expression",
    [
        "__import__('os')",
        "x_c000.__class__",
        "[x_c000][0]",
        "x_c000/2",
        "x_c000 and x_c001",
        "(lambda: 0)()",
        "x_c000 if 1 else x_c001",
        "x_c000**2",
        "x_c000^x_c001",
        "'text'",
    ],
)
def test_unsafe_ast_constructs_are_rejected(expression: str) -> None:
    with pytest.raises(witness.CollisionWitnessError):
        witness.evaluate_polynomial(expression, witness.witness_assignment())


def test_checker_source_never_calls_eval_or_exec() -> None:
    tree = ast.parse(Path(witness.__file__).read_text(encoding="utf-8"))
    forbidden = {
        node.func.id
        for node in ast.walk(tree)
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name)
        and node.func.id in {"eval", "exec"}
    }
    assert forbidden == set()


def test_cli_is_sparse_by_default_and_verbose_on_request(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    payload = {"schema": witness.SCHEMA, "generator_checks": 26}
    monkeypatch.setattr(witness, "verify_collision_witness", lambda: payload)
    assert witness.main([]) == 0
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == ""

    assert witness.main(["--verbose"]) == 0
    captured = capsys.readouterr()
    assert captured.err == ""
    assert captured.out.strip() == witness.json.dumps(
        payload, sort_keys=True, separators=(",", ":")
    )


def test_cli_always_prints_errors(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    def fail() -> dict[str, object]:
        raise witness.CollisionWitnessError("broken witness")

    monkeypatch.setattr(witness, "verify_collision_witness", fail)
    assert witness.main([]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: broken witness\n"
