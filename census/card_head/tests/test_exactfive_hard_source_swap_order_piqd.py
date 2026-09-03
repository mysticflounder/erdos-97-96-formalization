from __future__ import annotations

import math
from fractions import Fraction

import pytest

from census.card_head import exactfive_hard_source_swap_order_piqd as subject
from census.p97_search import phase3_piqd_smt_source_adapter as neutral


def _value_text(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def _readback_text(prepared: subject.PreparedQuery, values: dict[str, Fraction]) -> str:
    return (
        "("
        + " ".join(
            f"({term} {_value_text(values[term])})"
            for term in prepared.query.get_values
        )
        + ")"
    )


def _quartet_distances() -> dict[str, Fraction]:
    values = {
        ("O", "a"): 1,
        ("O", "d"): 1,
        ("e", "a"): 3,
        ("e", "d"): 1,
        ("O", "e"): 1,
        ("a", "d"): 1,
    }
    return {
        subject._distance_term(left, right): Fraction(value)
        for (left, right), value in values.items()
    }


def test_alias_profile_stream_is_exactly_indexed_and_quotiented() -> None:
    profiles = subject.indexed_profiles()

    assert len(profiles) == subject.EXPECTED_PROFILE_COUNT == 2_798
    index, profile = profiles[0]
    system = subject.build_profile_system(index, profile)
    assert system["profile_sha256"] == profile.profile_id
    assert system["profile_stream_sha256"] == subject.profile_stream_sha256()
    assert [row["roles"] for row in system["classes"]] == [
        list(klass) for klass in profile.classes
    ]
    for row in system["classes"]:
        for role in row["roles"]:
            assert system["role_class"][role] == row["id"]


def test_profile_selection_by_index_or_full_hash_is_deterministic() -> None:
    profiles = subject.indexed_profiles()
    digest = profiles[17][1].profile_id

    assert [row[0] for row in subject.select_profiles(indices=[17, 3, 17])] == [3, 17]
    assert subject.select_profiles(profile_hashes=[digest]) == (profiles[17],)
    assert len(subject.select_profiles(limit=5)) == 5
    with pytest.raises(
        subject.HardSourceSwapOrderPiqdError, match="mutually exclusive"
    ):
        subject.select_profiles(indices=[0], profile_hashes=[digest])


def test_direct_and_mirror_skeletons_are_both_admitted() -> None:
    system = subject.build_profile_system(*subject.indexed_profiles()[0])
    direct = subject.canonical_skeleton_ranks(system, "direct")
    mirror = subject.canonical_skeleton_ranks(system, "mirror")

    assert direct[system["anchor_class"]] == 0
    assert mirror[system["anchor_class"]] == 0
    assert subject.skeleton_orientation(system, direct) == "direct"
    assert subject.skeleton_orientation(system, mirror) == "mirror"


def test_mixed_fixed_role_class_fails_closed() -> None:
    classes = [
        ("U",),
        ("O", "a"),
        ("e",),
        ("c2",),
        ("d",),
        ("u",),
        ("v",),
        ("x",),
        ("y",),
    ]
    with pytest.raises(
        subject.HardSourceSwapOrderPiqdError, match="mixes incompatible"
    ):
        subject._fixed_class_groups(classes)


def test_alternation_is_cut_and_reversal_invariant() -> None:
    first = ("A", "C")
    second = ("B", "D")
    order = {"A": 0, "B": 1, "C": 2, "D": 3}
    rotated = {"C": 0, "D": 1, "A": 2, "B": 3}
    reversed_order = {"A": 0, "D": 1, "C": 2, "B": 3}

    assert subject.chords_alternate(order, first, second)
    assert subject.chords_alternate(rotated, first, second)
    assert subject.chords_alternate(reversed_order, first, second)
    assert not subject.chords_alternate(order, ("A", "B"), ("C", "D"))


def test_sorted_quartet_has_two_standard_strict_kalmanson_forms() -> None:
    ranks = {"A": 0, "B": 1, "C": 2, "D": 3}
    distances = {
        subject._distance_term("A", "B"): Fraction(1),
        subject._distance_term("A", "C"): Fraction(3),
        subject._distance_term("A", "D"): Fraction(1),
        subject._distance_term("B", "C"): Fraction(1),
        subject._distance_term("B", "D"): Fraction(3),
        subject._distance_term("C", "D"): Fraction(1),
    }

    result = subject.evaluate_kalmanson_quartet(ranks, distances, ("A", "B", "C", "D"))

    assert result["accepted"]
    assert result["crossing_matching"] == 1  # (A,C) and (B,D)
    assert len(result["forms"]) == 2
    assert {(row["lhs"], row["rhs"]) for row in result["forms"]} == {("6", "2")}


def test_formula_encodes_every_quartet_with_two_triggered_strict_forms() -> None:
    system = subject.build_profile_system(*subject.indexed_profiles()[0])
    inventory = subject.formula_inventory(system)
    commands = subject.build_smt_commands(system)
    encoded_quartets = sum(
        command.startswith("(assert (strict_kalmanson_quartet") for command in commands
    )

    assert encoded_quartets == inventory["quartets"]
    assert inventory["quartets"] == math.comb(len(system["classes"]), 4)
    assert inventory["kalmanson_conditional_cases"] == 3 * inventory["quartets"]
    assert inventory["kalmanson_triggered_strict_forms"] == 2 * inventory["quartets"]


def test_source_strict_and_kalmanson_prune_the_wrong_ad_side() -> None:
    distances = _quartet_distances()
    wrong = {"O": 0, "e": 1, "a": 2, "d": 3}
    right = {"O": 0, "e": 1, "d": 2, "a": 3}

    assert (
        distances[subject._distance_term("O", "a")]
        == distances[subject._distance_term("O", "d")]
    )
    assert (
        distances[subject._distance_term("e", "a")]
        > distances[subject._distance_term("e", "d")]
    )
    assert not subject.evaluate_kalmanson_quartet(
        wrong, distances, ("O", "e", "a", "d")
    )["accepted"]
    assert subject.evaluate_kalmanson_quartet(right, distances, ("O", "e", "a", "d"))[
        "accepted"
    ]


def test_positive_and_negative_controls_have_expected_exact_replays() -> None:
    positive = subject.replay_assignment(
        subject.build_control_system("positive"), subject.control_assignment("positive")
    )
    negative = subject.replay_assignment(
        subject.build_control_system("negative"), subject.control_assignment("negative")
    )

    assert positive.accepted
    assert positive.evidence["kalmanson_triggered_strict_forms_checked"] == 2
    assert not negative.accepted
    assert negative.evidence["reason"] == "kalmanson"


@pytest.mark.parametrize("solver", ["z3", "cvc5"])
def test_positive_control_sat_readback_replays_for_both_piqd_engines(
    solver: str,
) -> None:
    prepared = subject.prepare_control_query("positive", timeout_ms=1_000)
    values = subject.control_assignment("positive")
    verification = subject.verify_sat_model(
        prepared.query,
        solver,
        "(model)",
        _readback_text(prepared, values),
    )

    assert verification.accepted
    assert verification.evidence["solver"] == solver
    assert verification.evidence["all_asserted_atoms_replayed"] is True


def test_replay_fails_closed_on_missing_or_nonpositive_distance() -> None:
    system = subject.build_control_system("positive")
    values = subject.control_assignment("positive")
    missing = dict(values)
    missing.pop(next(term for term in missing if term.startswith("dist_")))
    invalid = dict(values)
    invalid[next(term for term in invalid if term.startswith("dist_"))] = Fraction(0)

    assert (
        subject.replay_assignment(system, missing).evidence["reason"]
        == "readback_term_set"
    )
    assert (
        subject.replay_assignment(system, invalid).evidence["reason"]
        == "distance_positivity"
    )


def test_query_and_descriptor_bytes_are_deterministic_and_adapter_loadable(
    tmp_path,
) -> None:
    first = subject.prepare_profile_query(0, timeout_ms=2_000)
    second = subject.prepare_profile_query(0, timeout_ms=2_000)

    assert first.query.descriptor_bytes == second.query.descriptor_bytes
    assert first.query.original_smt2 == second.query.original_smt2
    assert (
        first.query.descriptor["semantic_sha256"]
        == second.query.descriptor["semantic_sha256"]
    )
    (tmp_path / "descriptor.json").write_bytes(first.query.descriptor_bytes)
    (tmp_path / "query.smt2").write_bytes(first.query.original_smt2)
    for snapshot in first.query.source_files:
        (tmp_path / snapshot.path).write_bytes(snapshot.payload)
    loaded = neutral.load_source_semantic_query(tmp_path, "descriptor.json")
    assert loaded.descriptor_bytes == first.query.descriptor_bytes
    assert loaded.journal_smt2 == first.query.journal_smt2


def test_complete_profile_formula_contains_source_rows_strict_and_radius_disequality() -> (
    None
):
    prepared = subject.prepare_profile_query(0, timeout_ms=1_000)
    journal = prepared.query.journal_smt2.decode("ascii")

    assert prepared.query.descriptor["solver_profile"]["solvers"] == ["z3", "cvc5"]
    assert prepared.system["rows"] == [
        {"id": row["id"], "center": row["center"], "support": list(row["support"])}
        for row in subject.ROWS
    ]
    assert "(assert (distinct dist_" in journal
    assert "(assert (> (- dist_" in journal
    assert "strict_kalmanson_quartet" in journal


def test_worker_count_is_positive_and_capped_at_twenty() -> None:
    assert subject.normalize_workers(1) == 1
    assert subject.normalize_workers(20) == 20
    assert subject.normalize_workers(100) == 20
    with pytest.raises(subject.HardSourceSwapOrderPiqdError, match="positive"):
        subject.normalize_workers(0)


def test_terminal_engine_artifact_inventory_fails_closed() -> None:
    base = {
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        "solve",
        "closed_session",
    }
    engine = {
        "raw_status": "UNSAT",
        "response_lost": False,
        "reconciled_from_receipt": False,
    }

    subject._validate_engine_artifact_labels(engine, base)
    with pytest.raises(
        subject.HardSourceSwapOrderPiqdError, match="incomplete or cross-bound"
    ):
        subject._validate_engine_artifact_labels(engine, base - {"receipts"})

    sat = {**engine, "raw_status": "SAT"}
    with pytest.raises(
        subject.HardSourceSwapOrderPiqdError, match="incomplete or cross-bound"
    ):
        subject._validate_engine_artifact_labels(sat, base)
    subject._validate_engine_artifact_labels(sat, base | {"semantic"})

    recovered = {
        **engine,
        "response_lost": True,
        "reconciled_from_receipt": True,
    }
    subject._validate_engine_artifact_labels(
        recovered,
        (base - {"solve"}) | {"reconciled_solve", "reconciliation_session"},
    )
