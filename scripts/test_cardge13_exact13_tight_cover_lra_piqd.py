import cardge13_exact13_tight_cover_lra_piqd as producer


def test_inventory_and_determinism() -> None:
    commands = producer.build_commands()
    assert producer.journal_bytes() == producer.journal_bytes()
    assert producer.inventory(commands) == {
        "commands": len(commands),
        "distance_variables": 78,
        "triangle_strict_forms": 858,
        "kalmanson_strict_forms": 1430,
        "point_labels": 13,
        "row_supports": 4,
    }


def test_direct_order_and_corrected_trace_profile() -> None:
    assert set(producer.DIRECT_ORDER) == set(producer.LABELS)
    journal = producer.journal_bytes().decode("ascii")
    assert "2+2+1" not in journal
    assert "(<= (+ (ite (and m_C0_0 m_L_0) 1 0)" in journal
    assert "(<= (+ (ite (and m_C1_0 m_L_0) 1 0)" in journal


def test_blocker_centers_may_equal_z() -> None:
    journal = producer.journal_bytes().decode("ascii")
    for i in producer.SECOND_OPPOSITE_INTERIOR:
        assert f"(and is_b0_{i} is_z_{i})" not in journal
        assert f"(and is_b1_{i} is_z_{i})" not in journal


def test_all_metric_variables_are_positive() -> None:
    journal = producer.journal_bytes().decode("ascii")
    for i in producer.LABELS:
        for j in producer.LABELS:
            if i < j:
                assert f"(assert (>= d_{i}_{j} 1))" in journal
