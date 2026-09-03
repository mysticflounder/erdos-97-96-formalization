"""Tests for :mod:`census.card_head.d1_arcmidpoint_circle_necessity`."""

from __future__ import annotations

from fractions import Fraction

from census.card_head.d1_arcmidpoint_circle_necessity import (
    ORIGIN,
    circumcircle_power,
    dist_sq,
    necessity_trial,
    perp_bisector_point,
    reflect,
    signed_area2,
    sufficiency_trial,
    unit_circle_point,
)


def q(numerator: int, denominator: int = 1) -> Fraction:
    return Fraction(numerator, denominator)


def test_signed_area2_detects_collinearity() -> None:
    assert signed_area2((q(0), q(0)), (q(1), q(1)), (q(2), q(2))) == 0
    assert signed_area2((q(0), q(0)), (q(1), q(0)), (q(0), q(1))) == 1


def test_reflection_is_an_involution_and_preserves_distance_to_the_line() -> None:
    base, direction = (q(1), q(2)), (q(3), q(-1))
    point = (q(-4), q(7))
    image = reflect(point, base, direction)
    assert reflect(image, base, direction) == point
    assert dist_sq(base, image) == dist_sq(base, point)


def test_reflection_across_a_line_through_a_point_fixes_that_point() -> None:
    base, direction = (q(5), q(-3)), (q(2), q(9))
    assert reflect(base, base, direction) == base


def test_circumcircle_power_vanishes_on_the_unit_circle() -> None:
    pts = [unit_circle_point(q(t)) for t in (0, 1, 2, 3)]
    for p in pts:
        assert dist_sq(p, ORIGIN) == 1
    assert circumcircle_power(pts[0], pts[1], pts[2], pts[3]) == 0


def test_circumcircle_power_is_nonzero_off_the_circle() -> None:
    pts = [unit_circle_point(q(t)) for t in (0, 1, 2)]
    assert circumcircle_power(pts[0], pts[1], pts[2], (q(1, 2), q(1, 2))) != 0


def test_perp_bisector_point_is_equidistant() -> None:
    a, p = (q(-3), q(4)), (q(5), q(-2))
    for t in (q(0), q(1), q(-7, 3)):
        k = perp_bisector_point(a, p, t)
        assert dist_sq(k, a) == dist_sq(k, p)


def test_unit_circle_point_is_rational_and_on_the_circle() -> None:
    for t in (q(0), q(1), q(-5, 2), q(11, 7)):
        assert dist_sq(unit_circle_point(t), ORIGIN) == 1


def test_necessity_trial_finds_no_disagreement() -> None:
    tally = necessity_trial(samples=1200, seed=101)
    assert tally.checked > 0
    assert tally.disagreed == 0
    assert tally.agreed == tally.checked
    assert tally.witnesses == ()


def test_sufficiency_trial_finds_no_counterexample() -> None:
    tally = sufficiency_trial(samples=400, seed=202)
    assert tally.checked > 0
    assert tally.disagreed == 0
    assert tally.agreed == tally.checked
    assert tally.witnesses == ()


def test_necessity_trial_actually_exercises_off_circle_configurations() -> None:
    """The necessity batch must not be agreeing vacuously on concyclic points."""
    tally = necessity_trial(samples=600, seed=303)
    assert tally.checked >= 500
