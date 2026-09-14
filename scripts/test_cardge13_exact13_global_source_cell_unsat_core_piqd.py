from __future__ import annotations

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_unsat_core_piqd as subject


def test_guarded_arithmetic_inventory_and_pins() -> None:
    commands, selector_map, bank = subject.guarded_arithmetic_commands(
        base.DIRECT_ORDER,
        {"b0": 9, "b1": 2},
        {"C0": (2, 4, 6, 11)},
    )
    kinds = [entry["kind"] for entry in selector_map]
    assert kinds.count("row-equality") == 2640
    assert kinds.count("strict-kalmanson") == 1430
    assert len(selector_map) == 4070
    assert len(bank) == 21842
    assert "(assert is_b0_9)" in commands
    assert "(assert is_b1_2)" in commands
    assert "(assert m_C0_11)" in commands
    assert any(command.startswith("(assert (=> arith_4069 ") for command in commands)


def test_core_records_preserve_solver_order() -> None:
    selector_map = (
        {"selector": "arith_0000", "kind": "row-equality"},
        {"selector": "arith_0001", "kind": "strict-kalmanson"},
    )
    assert subject.core_records(
        selector_map, {"status": "UNSAT", "core": ["arith_0001"]}
    ) == (selector_map[1],)
    assert subject.core_records(selector_map, {"status": "SAT"}) == ()
