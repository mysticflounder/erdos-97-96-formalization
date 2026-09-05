from __future__ import annotations

import cardge13_exact13_global_source_cell_boolean_slice_piqd as subject
import cardge13_exact13_global_source_cell_csp_piqd as base


def test_build_commands_omits_metric_and_appends_conflicts_and_pins(monkeypatch) -> None:
    monkeypatch.setattr(
        subject.base,
        "source_commands",
        lambda mode: ("(set-logic QF_LRA)", "(declare-const a Bool)"),
    )
    bank = ({"atoms": ("a", "b")},)
    monkeypatch.setattr(subject.base, "conflict_bank", lambda order: bank)
    commands, actual_bank = subject.build_commands(
        base.DIRECT_ORDER,
        (("b0", 9), ("b1", 2)),
        (("C0", (2, 4, 6, 11)),),
    )
    assert commands == (
        "(set-logic QF_UF)",
        "(declare-const a Bool)",
        "(assert (or (not a) (not b)))",
        "(assert is_b0_9)",
        "(assert is_b1_2)",
        "(assert m_C0_2)",
        "(assert m_C0_4)",
        "(assert m_C0_6)",
        "(assert m_C0_11)",
    )
    assert actual_bank == bank


def test_build_commands_rejects_source_logic_drift(monkeypatch) -> None:
    monkeypatch.setattr(subject.base, "source_commands", lambda mode: ())
    try:
        subject.build_commands(base.DIRECT_ORDER)
    except AssertionError as exc:
        assert "logic prelude" in str(exc)
    else:
        raise AssertionError("missing source-command drift rejection")
