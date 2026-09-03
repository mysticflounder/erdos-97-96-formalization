from census.card_head import dr_card14_metric_realizability as subject


def test_polynomial_atoms_and_state_only_journal() -> None:
    journal, counts = subject.build_journal(((((0, 2), (1, 3))),))
    text = journal.decode("ascii")
    assert "(assert (= (+ (* (- x0 x2)" in text
    assert "check-sat" not in text
    assert "get-model" not in text
    assert counts == {
        "declarations": 28,
        "gauge_equalities": 4,
        "positive_distance_equalities": 1,
        "strict_convexity_atoms": 168,
    }


def test_recorded_order_is_the_frozen_profile() -> None:
    assert subject.PROFILE.cyclic_order == (1, 3, 4, 5, 0, 6, 7, 8, 9, 2, 10, 11, 12, 13)


def test_equality_basis_is_one_star_per_component() -> None:
    a, b, c, d, e = (0, 1), (0, 2), (0, 3), (1, 2), (1, 3)
    assert subject.equality_basis(((a, b), (b, c), (d, e))) == ((a, b), (a, c), (d, e))
