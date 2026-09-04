import cardge13_exact13_retained_first_row_lra_piqd as producer


def test_inventory_and_determinism() -> None:
    commands = producer.build_commands()
    assert producer.journal_bytes() == producer.journal_bytes()
    assert producer.inventory(commands)["row_supports"] == 5
    assert producer.inventory(commands)["commands"] == len(commands)


def test_retained_first_apex_exact_row() -> None:
    journal = producer.journal_bytes().decode("ascii")
    assert "(assert m_T_6)" in journal
    assert "(assert m_T_7)" in journal
    assert "(assert (not m_T_1))" in journal
    assert "(assert (=> m_T_6 (= d_1_6 r_T)))" in journal
    assert "(assert (=> (not m_T_12)" in journal
