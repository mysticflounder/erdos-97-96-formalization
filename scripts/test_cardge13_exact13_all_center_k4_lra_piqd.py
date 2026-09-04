import cardge13_exact13_all_center_k4_lra_piqd as producer


def test_inventory_and_determinism() -> None:
    commands = producer.build_commands()
    assert producer.journal_bytes() == producer.journal_bytes()
    assert producer.inventory(commands)["commands"] == len(commands)
    assert producer.inventory(commands)["global_k4_centers"] == 13
    assert producer.inventory(commands)["row_supports"] == 18


def test_every_center_gets_a_four_point_equidistant_witness() -> None:
    journal = producer.journal_bytes().decode("ascii")
    for center in producer.core.LABELS:
        assert f"(assert (not m_G{center}_{center}))" in journal
        assert f"(assert (= (+ (ite m_G{center}_0 1 0)" in journal
        for support in producer.core.LABELS:
            if support == center:
                continue
            distance = producer.core._distance(center, support)
            assert (
                f"(assert (=> m_G{center}_{support} (= {distance} r_G{center})))"
                in journal
            )


def test_global_rows_do_not_claim_exact_distance_classes() -> None:
    journal = producer.journal_bytes().decode("ascii")
    assert "(=> (not m_G" not in journal
