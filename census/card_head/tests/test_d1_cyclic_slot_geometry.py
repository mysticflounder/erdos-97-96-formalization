"""Pin the empirical numbers quoted in plan sections 67-69."""

import math

from census.card_head import d1_cyclic_slot_geometry as G


def test_criterion_forms_agree_with_brute_force():
    """Plan section 69's table: all three closed forms are exact on non-obtuse
    triangles."""
    total, trig, side, rad = G.criterion_agreement(n=300)
    assert total == 11473
    assert trig == side == rad == total


def test_cyclic_case_has_only_the_equilateral_solution():
    """Plan section 67: the three in-disk conditions force an equilateral
    triangle, which the cyclic case excludes as not scalene."""
    for sense in ("+", "-"):
        sols = G.cyclic_solutions(n=900, sense=sense)
        assert len(sols) == 1
        assert max(abs(x - math.pi / 3) for x in sols[0]) < 1e-12


def test_one_intersection_point_is_always_outside_the_disk():
    """Plan section 69's Case-1 check, which is what makes the criterion exact."""
    both, one, none = G.both_points_in_disk_counts(n=400)
    assert both == 0
    assert one == 6800
    assert none == 13498


def test_census_positive_and_negative_controls():
    """Guardrail 1: the machinery finds the census pattern, and rejects it
    under radii that do not fill the apex slots."""
    positive, negative = G.census_control(n=1200)
    assert positive == 99
    assert negative == 0


def test_sum_of_squares_identity_exactly():
    """The identity behind Problem97.prod_add_sub_eight_mul_prod_eq."""
    from fractions import Fraction as F
    import random
    random.seed(11)
    for _ in range(2000):
        x, y, z = (F(random.randint(-40, 40), random.randint(1, 9))
                   for _ in range(3))
        assert (x + y) * (y + z) * (z + x) - 8 * (x * y * z) == \
            x * (y - z) ** 2 + y * (z - x) ** 2 + z * (x - y) ** 2
