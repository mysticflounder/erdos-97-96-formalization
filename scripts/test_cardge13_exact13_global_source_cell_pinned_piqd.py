from __future__ import annotations

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_pinned_piqd as subject
import pytest


def test_validate_blocker_pair_accepts_source_admissible_ordered_pair() -> None:
    assert subject.validate_blocker_pair(9, 2) == (9, 2)


@pytest.mark.parametrize("pair", ((0, 2), (1, 2), (2, 0), (2, 1)))
def test_validate_blocker_pair_rejects_apex(pair: tuple[int, int]) -> None:
    with pytest.raises(ValueError, match="apex"):
        subject.validate_blocker_pair(*pair)


def test_validate_blocker_pair_rejects_equal_and_out_of_range() -> None:
    with pytest.raises(ValueError, match="distinct"):
        subject.validate_blocker_pair(2, 2)
    with pytest.raises(ValueError, match="must lie"):
        subject.validate_blocker_pair(13, 2)


def test_build_commands_is_exact_global_formula_plus_pair_split(monkeypatch) -> None:
    global_commands = ("(set-logic QF_LRA)", "(assert base)")
    global_bank = ({"atoms": ("base",)},)
    monkeypatch.setattr(
        subject.base,
        "build_commands",
        lambda order, linear_mode: (global_commands, global_bank),
    )
    commands, bank = subject.build_commands(base.DIRECT_ORDER, 9, 2, "strict")
    assert commands[:-2] == global_commands
    assert commands[-2:] == ("(assert is_b0_9)", "(assert is_b1_2)")
    assert bank == global_bank


def test_build_commands_is_deterministic_for_mirror_equality_mode(monkeypatch) -> None:
    monkeypatch.setattr(
        subject.base,
        "build_commands",
        lambda order, linear_mode: (((f"; {linear_mode} {order[0]}",)), ()),
    )
    first = subject.build_commands(base.MIRROR_ORDER, 3, 12, "equality")
    second = subject.build_commands(base.MIRROR_ORDER, 3, 12, "equality")
    assert first == second
