from __future__ import annotations

import copy
import sys
from dataclasses import FrozenInstanceError
from fractions import Fraction

import pytest

from census.cap_configuration.encode import (
    NamedPolynomialAtom,
    PolynomialSystem,
    SparsePolynomial,
    SparseTerm,
)
from census.cap_configuration.replay import (
    SEMANTIC_REPLAY_SCHEMA,
    CapConfigurationReplayError,
    ExactRationalReadback,
    ReplayLimits,
    SemanticReplayRecord,
    parse_piqd_get_values,
    replay_ordered_readback,
    replay_piqd_sat_values,
    verify_replay_record,
)
from census.cap_configuration.schema import raw_sha256, structured_hash


def _linear(a: int | Fraction, b: int | Fraction) -> SparsePolynomial:
    terms = []
    if a:
        terms.append(SparseTerm(Fraction(a), (1,)))
    if b:
        terms.append(SparseTerm(Fraction(b), (0,)))
    return SparsePolynomial(("x",), tuple(terms))


def _atom(
    atom_id: str,
    relation: str,
    polynomials: tuple[SparsePolynomial, ...],
) -> NamedPolynomialAtom:
    return NamedPolynomialAtom(
        atom_id=atom_id,
        relation=relation,
        polynomials=polynomials,
        family="fixture",
        source_provenance=f"fixture.{atom_id}",
    )


def _system(
    relation: str,
    polynomials: tuple[SparsePolynomial, ...],
) -> PolynomialSystem:
    atom = _atom(f"atom_{relation}", relation, polynomials)
    return PolynomialSystem(
        variable_order=("x",),
        atoms=(atom,),
        enabled_atom_order=(atom.atom_id,),
        omitted_atom_order=(),
        omitted_source_predicates=(),
    )


def _readback(value: int | Fraction = 1) -> tuple[ExactRationalReadback, ...]:
    rational = Fraction(value)
    return (
        ExactRationalReadback(
            "x",
            rational.numerator,
            rational.denominator,
        ),
    )


def test_parse_complete_piqd_payload_preserves_declared_order_and_exact_values() -> (
    None
):
    records = parse_piqd_get_values(
        "((|x| (- (/ 3 5))) (y (/ (- 2) 7)) (z 0) (w (/ 4 1)))",
        ("x", "y", "z", "w"),
    )
    assert tuple(item.identifier for item in records) == ("x", "y", "z", "w")
    assert tuple(item.value for item in records) == (
        Fraction(-3, 5),
        Fraction(-2, 7),
        Fraction(0),
        Fraction(4),
    )
    assert [item.to_record() for item in records] == [
        {"denominator": 5, "id": "x", "numerator": -3},
        {"denominator": 7, "id": "y", "numerator": -2},
        {"denominator": 1, "id": "z", "numerator": 0},
        {"denominator": 1, "id": "w", "numerator": 4},
    ]


@pytest.mark.parametrize(
    ("payload", "order", "code"),
    [
        ("((x 1))", ("x", "y"), "identifier_inventory_mismatch"),
        ("((x 1) (x 2))", ("x",), "duplicate_identifier"),
        ("((x 1) (y 2))", ("x",), "identifier_inventory_mismatch"),
        ("((y 2) (x 1))", ("x", "y"), "identifier_order_mismatch"),
        ("((x 1) (|x| 2))", ("x",), "duplicate_identifier"),
    ],
)
def test_parse_rejects_missing_duplicate_extra_and_reordered_identifiers(
    payload: str,
    order: tuple[str, ...],
    code: str,
) -> None:
    with pytest.raises(CapConfigurationReplayError) as caught:
        parse_piqd_get_values(payload, order)
    assert caught.value.code == code


@pytest.mark.parametrize(
    ("value", "code"),
    [
        ("1.0", "approximate_value"),
        ("1e3", "approximate_value"),
        ("NaN", "approximate_value"),
        ("+inf", "approximate_value"),
        ("(/ 1.0 2)", "approximate_value"),
        ("(/ 1 0)", "zero_denominator"),
        ("(/ 1 (- 2))", "negative_denominator"),
        ("(/ 2 4)", "unreduced_rational"),
        ("(/ 0 2)", "unreduced_rational"),
        ("(- 0)", "malformed_rational"),
        ("(- (/ (- 1) 2))", "malformed_rational"),
        ("(root-obj (+ (^ x 2) (- 2)) 1)", "unsupported_value"),
        ("(to_real 1)", "unsupported_value"),
        ("(/ 1 (/ 2 3))", "malformed_rational"),
        ("(/ 1 2 3)", "unsupported_value"),
        ("01", "malformed_rational"),
        ("+1", "malformed_rational"),
    ],
)
def test_parse_rejects_nonexact_noncanonical_or_malformed_values(
    value: str,
    code: str,
) -> None:
    with pytest.raises(CapConfigurationReplayError) as caught:
        parse_piqd_get_values(f"((x {value}))", ("x",))
    assert caught.value.code == code


@pytest.mark.parametrize(
    "payload",
    [
        "",
        "x",
        "((x 1)",
        "((x))",
        "((x 1 2))",
        "(() 1)",
        "((|x 1))",
        "((x 1)) trailing",
        "((x \x00))",
    ],
)
def test_parse_rejects_malformed_payload_shapes(payload: str) -> None:
    with pytest.raises(CapConfigurationReplayError):
        parse_piqd_get_values(payload, ("x",))


def test_parser_rejects_non_ascii_payload_before_identifier_normalization() -> None:
    with pytest.raises(CapConfigurationReplayError) as caught:
        parse_piqd_get_values("((x ½))", ("x",))
    assert caught.value.code == "non_ascii_payload"


@pytest.mark.parametrize(
    ("limits", "code"),
    [
        (ReplayLimits(max_payload_bytes=5), "payload_budget_exceeded"),
        (ReplayLimits(max_tokens=5), "token_budget_exceeded"),
        (ReplayLimits(max_depth=1), "depth_budget_exceeded"),
        (ReplayLimits(max_integer_digits=1), "integer_budget_exceeded"),
        (ReplayLimits(max_denominator_bits=2), "denominator_budget_exceeded"),
    ],
)
def test_parser_enforces_byte_token_depth_digit_and_denominator_budgets(
    limits: ReplayLimits,
    code: str,
) -> None:
    payload = "((x (/ 1 55)))"
    with pytest.raises(CapConfigurationReplayError) as caught:
        parse_piqd_get_values(payload, ("x",), limits=limits)
    assert caught.value.code == code


@pytest.mark.parametrize("field", [True, 0, -1, 1.5])
def test_replay_limits_require_positive_exact_integers(field: object) -> None:
    with pytest.raises(ValueError):
        ReplayLimits(max_tokens=field)


@pytest.mark.parametrize(
    "overrides",
    [
        {"max_payload_bytes": 1_048_577},
        {"max_tokens": 100_001},
        {"max_depth": 33},
        {"max_integer_digits": 4097},
        {"max_denominator_bits": 4097},
    ],
)
def test_replay_limit_overrides_may_only_tighten_frozen_maxima(
    overrides: dict[str, int],
) -> None:
    with pytest.raises(ValueError, match="frozen maximum"):
        ReplayLimits(**overrides)


def test_parser_revalidates_tampered_limits_and_fails_before_recursing() -> None:
    limits = ReplayLimits()
    object.__setattr__(limits, "max_depth", 1_000_000)
    with pytest.raises(CapConfigurationReplayError) as caught:
        parse_piqd_get_values("((x 1))", ("x",), limits=limits)
    assert caught.value.code == "malformed_limits"


def test_deep_nesting_and_huge_integer_fail_with_typed_budget_errors() -> None:
    deeply_nested = "((x " + "(" * 2000 + "1" + ")" * 2000 + "))"
    with pytest.raises(CapConfigurationReplayError) as depth:
        parse_piqd_get_values(deeply_nested, ("x",))
    assert depth.value.code == "depth_budget_exceeded"

    huge_integer = "9" * 5000
    with pytest.raises(CapConfigurationReplayError) as digits:
        parse_piqd_get_values(f"((x {huge_integer}))", ("x",))
    assert digits.value.code == "integer_budget_exceeded"


def test_runtime_integer_digit_guard_is_converted_to_typed_rejection() -> None:
    previous = sys.get_int_max_str_digits()
    sys.set_int_max_str_digits(640)
    try:
        with pytest.raises(CapConfigurationReplayError) as caught:
            parse_piqd_get_values(f"((x {'9' * 700}))", ("x",))
    finally:
        sys.set_int_max_str_digits(previous)
    assert caught.value.code == "integer_budget_exceeded"


def test_exact_rational_record_round_trip_and_canonicality() -> None:
    value = ExactRationalReadback("x", -3, 5)
    assert ExactRationalReadback.from_record(value.to_record()) == value
    with pytest.raises(FrozenInstanceError):
        value.numerator = 3

    for record in (
        {"denominator": 0, "id": "x", "numerator": 1},
        {"denominator": -2, "id": "x", "numerator": 1},
        {"denominator": 4, "id": "x", "numerator": 2},
        {"denominator": 2, "id": "x", "numerator": 0},
        {"denominator": 1, "id": "x", "numerator": 1, "extra": 0},
    ):
        with pytest.raises(CapConfigurationReplayError):
            ExactRationalReadback.from_record(record)

    with pytest.raises(CapConfigurationReplayError) as mixed_keys:
        ExactRationalReadback.from_record({"id": "x", "numerator": 1, 1: 1})
    assert mixed_keys.value.code == "malformed_record"


@pytest.mark.parametrize(
    ("relation", "polynomials", "mutated"),
    [
        ("eq", (_linear(1, -1),), (_linear(1, -2),)),
        ("ge", (_linear(1, 0),), (_linear(-1, 0),)),
        ("gt", (_linear(1, 0),), (_linear(1, -1),)),
        ("ne", (_linear(1, 0),), (_linear(1, -1),)),
        (
            "or_ne",
            (_linear(1, -1), _linear(1, 0)),
            (_linear(1, -1), _linear(2, -2)),
        ),
    ],
)
def test_independent_replay_accepts_each_relation_and_catches_one_atom_mutation(
    relation: str,
    polynomials: tuple[SparsePolynomial, ...],
    mutated: tuple[SparsePolynomial, ...],
) -> None:
    accepted = replay_ordered_readback(_system(relation, polynomials), _readback())
    assert accepted.outcome == "accepted"
    assert accepted.adapter_classification == "SAT_SEMANTICALLY_REPLAYED"
    assert accepted.atom_results[0].satisfied is True

    rejected = replay_ordered_readback(_system(relation, mutated), _readback())
    assert rejected.outcome == "rejected"
    assert rejected.adapter_classification == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    assert rejected.issue is not None
    assert rejected.issue.code == "retained_atom_failure"
    assert rejected.atom_results[0].satisfied is False


@pytest.mark.parametrize(
    ("value", "expected_values"),
    [
        (Fraction(0), (Fraction(0), Fraction(-1))),
        (Fraction(1), (Fraction(1), Fraction(0))),
        (Fraction(2), (Fraction(2), Fraction(1))),
    ],
)
def test_or_ne_accepts_each_one_sided_case_and_the_both_nonzero_case(
    value: Fraction,
    expected_values: tuple[Fraction, Fraction],
) -> None:
    system = _system("or_ne", (_linear(1, 0), _linear(1, -1)))
    replay = replay_ordered_readback(system, _readback(value))
    assert replay.outcome == "accepted"
    assert replay.atom_results[0].polynomial_values == expected_values


def test_or_ne_rejects_only_when_both_sides_are_zero() -> None:
    system = _system("or_ne", (_linear(1, -1), _linear(2, -2)))
    replay = replay_ordered_readback(system, _readback(1))
    assert replay.outcome == "rejected"
    assert replay.atom_results[0].polynomial_values == (Fraction(0), Fraction(0))


def test_replay_checks_only_enabled_atoms_but_binds_complete_system() -> None:
    enabled = _atom("enabled", "eq", (_linear(1, -1),))
    omitted = _atom("omitted", "eq", (_linear(1, -2),))
    system = PolynomialSystem(
        variable_order=("x",),
        atoms=(enabled, omitted),
        enabled_atom_order=("enabled",),
        omitted_atom_order=("omitted",),
        omitted_source_predicates=("fixture.omitted_source_fact",),
    )
    replay = replay_ordered_readback(system, _readback(1))
    assert replay.outcome == "accepted"
    assert tuple(result.atom_id for result in replay.atom_results) == ("enabled",)


def test_raw_piqd_replay_binds_values_bytes_and_round_trips_self_hash() -> None:
    system = _system("eq", (_linear(1, -1),))
    payload = "((|x| 1))\n"
    replay = replay_piqd_sat_values(system, payload)
    assert replay.outcome == "accepted"
    assert replay.values_raw_sha256 == raw_sha256(payload.encode("ascii"))
    assert replay.replay_sha256 == structured_hash(
        SEMANTIC_REPLAY_SCHEMA,
        {
            key: value
            for key, value in replay.to_record().items()
            if key != "replay_sha256"
        },
    )
    assert SemanticReplayRecord.from_record(replay.to_record()) == replay
    assert (
        verify_replay_record(
            system,
            replay.to_record(),
            raw_values_payload=payload,
        )
        == replay
    )
    assert (
        verify_replay_record(
            system,
            replay,
            raw_values_payload=payload.encode("utf-8"),
        )
        == replay
    )


def test_raw_digest_claim_requires_separately_retained_payload() -> None:
    system = _system("eq", (_linear(1, -1),))
    replay = replay_piqd_sat_values(system, "((x 1))")
    with pytest.raises(CapConfigurationReplayError) as missing:
        verify_replay_record(system, replay)
    assert missing.value.code == "raw_values_payload_required"


def test_forged_all_zero_raw_digest_is_not_authenticated_by_readback() -> None:
    system = _system("eq", (_linear(1, -1),))
    payload = "((x 1))"
    forged = replay_piqd_sat_values(system, payload).to_record()
    forged["values_raw_sha256"] = "0" * 64
    forged["replay_sha256"] = structured_hash(
        SEMANTIC_REPLAY_SCHEMA,
        {key: value for key, value in forged.items() if key != "replay_sha256"},
    )
    assert SemanticReplayRecord.from_record(forged).values_raw_sha256 == "0" * 64
    with pytest.raises(CapConfigurationReplayError) as caught:
        verify_replay_record(system, forged, raw_values_payload=payload)
    assert caught.value.code == "raw_values_hash_mismatch"


def test_readback_only_record_requires_explicit_safe_branch_and_no_raw_payload() -> (
    None
):
    system = _system("eq", (_linear(1, -1),))
    replay = replay_ordered_readback(system, _readback())
    assert replay.values_raw_sha256 is None
    with pytest.raises(CapConfigurationReplayError) as implicit:
        verify_replay_record(system, replay)
    assert implicit.value.code == "readback_only_not_authorized"
    with pytest.raises(CapConfigurationReplayError) as unexpected_raw:
        verify_replay_record(
            system,
            replay,
            raw_values_payload="((x 1))",
            allow_readback_only=True,
        )
    assert unexpected_raw.value.code == "unexpected_raw_values_payload"


def test_replay_record_rejects_old_digest_name_and_mixed_keys_without_type_error() -> (
    None
):
    record = replay_ordered_readback(
        _system("eq", (_linear(1, -1),)), _readback()
    ).to_record()
    old_name = copy.deepcopy(record)
    old_name["values_sha256"] = old_name.pop("values_raw_sha256")
    with pytest.raises(CapConfigurationReplayError) as obsolete:
        SemanticReplayRecord.from_record(old_name)
    assert obsolete.value.code == "malformed_record"

    mixed = copy.deepcopy(record)
    mixed[1] = "surprise"
    with pytest.raises(CapConfigurationReplayError) as mixed_keys:
        SemanticReplayRecord.from_record(mixed)
    assert mixed_keys.value.code == "malformed_record"


def test_replay_record_rejects_post_replay_mutation() -> None:
    replay = replay_ordered_readback(_system("eq", (_linear(1, -1),)), _readback())
    tampered = copy.deepcopy(replay.to_record())
    tampered["atom_results"][0]["polynomial_values"][0]["numerator"] = 1
    with pytest.raises(CapConfigurationReplayError) as caught:
        SemanticReplayRecord.from_record(tampered)
    assert caught.value.code == "self_hash_mismatch"


def test_verify_replay_record_parses_and_recomputes_accepted_and_rejected_records() -> (
    None
):
    accepted = replay_ordered_readback(
        _system("eq", (_linear(1, -1),)),
        _readback(),
    )
    assert (
        verify_replay_record(
            _system("eq", (_linear(1, -1),)),
            accepted.to_record(),
            allow_readback_only=True,
        )
        == accepted
    )
    assert (
        verify_replay_record(
            _system("eq", (_linear(1, -1),)),
            accepted,
            allow_readback_only=True,
        )
        == accepted
    )

    rejected = replay_ordered_readback(
        _system("eq", (_linear(1, -2),)),
        _readback(),
    )
    assert rejected.outcome == "rejected"
    assert (
        verify_replay_record(
            _system("eq", (_linear(1, -2),)),
            rejected.to_record(),
            allow_readback_only=True,
        )
        == rejected
    )


def test_verify_replay_record_detects_self_hashed_semantic_mutations() -> None:
    system = _system("eq", (_linear(1, -1),))
    original = replay_ordered_readback(system, _readback()).to_record()
    mutations = []

    changed_readback = copy.deepcopy(original)
    changed_readback["readback"][0]["numerator"] = 2
    mutations.append(changed_readback)

    changed_atom_value = copy.deepcopy(original)
    changed_atom_value["atom_results"][0]["polynomial_values"][0]["numerator"] = 1
    mutations.append(changed_atom_value)

    for mutated in mutations:
        mutated["replay_sha256"] = structured_hash(
            SEMANTIC_REPLAY_SCHEMA,
            {key: value for key, value in mutated.items() if key != "replay_sha256"},
        )
        with pytest.raises(CapConfigurationReplayError) as caught:
            verify_replay_record(system, mutated, allow_readback_only=True)
        assert caught.value.code == "replay_record_mismatch"


def test_verify_replay_record_rejects_wrong_system_and_regenerates_parse_failure() -> (
    None
):
    first_system = _system("eq", (_linear(1, -1),))
    accepted = replay_ordered_readback(first_system, _readback())
    with pytest.raises(CapConfigurationReplayError) as wrong_system:
        verify_replay_record(_system("eq", (_linear(1, -2),)), accepted)
    assert wrong_system.value.code == "system_hash_mismatch"

    payload = "((x 1.0))"
    parse_rejection = replay_piqd_sat_values(first_system, payload)
    assert (
        verify_replay_record(
            first_system,
            parse_rejection,
            raw_values_payload=payload,
        )
        == parse_rejection
    )


@pytest.mark.parametrize(
    ("records", "code"),
    [
        ((), "identifier_inventory_mismatch"),
        (
            (ExactRationalReadback("x", 1, 1), ExactRationalReadback("x", 2, 1)),
            "duplicate_identifier",
        ),
        ((ExactRationalReadback("y", 1, 1),), "identifier_inventory_mismatch"),
    ],
)
def test_ordered_record_replay_returns_rejected_outcome_for_bad_inventory(
    records: tuple[ExactRationalReadback, ...],
    code: str,
) -> None:
    result = replay_ordered_readback(_system("eq", (_linear(1, -1),)), records)
    assert result.outcome == "rejected"
    assert result.issue is not None and result.issue.code == code


def test_raw_parse_failure_is_retained_as_rejected_replay() -> None:
    system = _system("eq", (_linear(1, -1),))
    result = replay_piqd_sat_values(system, "((x 1.0))")
    assert result.outcome == "rejected"
    assert result.issue is not None and result.issue.code == "approximate_value"
    assert result.readback == ()
    assert result.atom_results == ()
    assert SemanticReplayRecord.from_record(result.to_record()) == result


def test_unexpected_atom_evaluator_exception_is_verifier_failure(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def explode(self, values):
        raise RuntimeError("fixture evaluator fault")

    monkeypatch.setattr(SparsePolynomial, "evaluate", explode)
    result = replay_ordered_readback(
        _system("eq", (_linear(1, -1),)),
        _readback(),
    )
    assert result.outcome == "verifier_failure"
    assert result.adapter_classification == "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"
    assert result.issue is not None
    assert result.issue.code == "semantic_verifier_failure"
    assert result.atom_results == ()


def test_ordered_record_replay_enforces_denominator_budget() -> None:
    result = replay_ordered_readback(
        _system("eq", (_linear(1, -Fraction(1, 5)),)),
        _readback(Fraction(1, 5)),
        limits=ReplayLimits(max_denominator_bits=2),
    )
    assert result.outcome == "rejected"
    assert result.issue is not None
    assert result.issue.code == "denominator_budget_exceeded"
