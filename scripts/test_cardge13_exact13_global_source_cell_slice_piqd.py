from __future__ import annotations

import argparse

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as subject
import pytest


def test_parse_role_and_row_pins() -> None:
    assert subject.parse_role_pin("b0=9") == ("b0", 9)
    assert subject.parse_row_pin("C0=11,2,6,4") == ("C0", (2, 4, 6, 11))


@pytest.mark.parametrize("value", ("bad", "bad=2", "b0=13"))
def test_parse_role_pin_rejects_invalid_value(value: str) -> None:
    with pytest.raises(argparse.ArgumentTypeError):
        subject.parse_role_pin(value)


@pytest.mark.parametrize("value", ("bad", "G2=1,2,3,4", "C0=1,1,2,3"))
def test_parse_row_pin_rejects_invalid_value(value: str) -> None:
    with pytest.raises(argparse.ArgumentTypeError):
        subject.parse_row_pin(value)


def test_normalize_pins_rejects_duplicate_and_aliases() -> None:
    with pytest.raises(ValueError, match="duplicate role"):
        subject.normalize_pins((("b0", 9), ("b0", 2)), ())
    with pytest.raises(ValueError, match="blocker labels"):
        subject.normalize_pins((("b0", 9), ("b1", 9)), ())
    with pytest.raises(ValueError, match="source labels"):
        subject.normalize_pins((("s0", 4), ("s1", 4)), ())


def test_build_commands_appends_deterministic_role_and_row_slice(monkeypatch) -> None:
    bank = ({"atoms": ("base",)},)
    monkeypatch.setattr(
        subject.base,
        "build_commands",
        lambda order, linear_mode: (((f"; {linear_mode} {order[0]}",)), bank),
    )
    commands, actual_bank = subject.build_commands(
        base.DIRECT_ORDER,
        (("s1", 3), ("b0", 9), ("s0", 4), ("b1", 2)),
        (("T", (0, 6, 7, 10)), ("C0", (2, 4, 6, 11))),
        "strict",
    )
    assert commands[-12:] == (
        "(assert is_b0_9)",
        "(assert is_b1_2)",
        "(assert is_s0_4)",
        "(assert is_s1_3)",
        "(assert m_C0_2)",
        "(assert m_C0_4)",
        "(assert m_C0_6)",
        "(assert m_C0_11)",
        "(assert m_T_0)",
        "(assert m_T_6)",
        "(assert m_T_7)",
        "(assert m_T_10)",
    )
    assert actual_bank == bank
