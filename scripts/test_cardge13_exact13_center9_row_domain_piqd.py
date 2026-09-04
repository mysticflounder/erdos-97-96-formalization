from __future__ import annotations

import cardge13_exact13_center9_row_domain_piqd as subject


def test_external_metric_exposes_three_strict_triangle_failures() -> None:
    assert subject.audit_external_metric() == {
        "triangle_count": 858,
        "minimum_triangle_slack": -2,
        "triangle_violation_count": 3,
        "kalmanson_count": 1430,
        "minimum_kalmanson_slack": 1,
    }


def test_all_center9_supports_have_short_cancellation_certificates() -> None:
    result = subject.classify_supports()
    assert result["support_count"] == 495
    assert result["certificate_length_counts"] == {"1": 455, "2": 32, "3": 8}


def test_piqd_query_has_one_faithful_nonexact_global_row() -> None:
    commands = subject.build_commands()
    assert "(assert (= (+ " in "\n".join(commands)
    assert sum(command.startswith("(declare-const m_G9_") for command in commands) == 12
    assert sum("(=> m_G9_" in command for command in commands) == 12
    assert not any("(not m_G9_" in command for command in commands)
    assert not any("m_G9_" in command for command in subject.build_commands(include_center9_k4=False))


def test_exact_fixed_rows_add_only_off_radius_exclusions() -> None:
    equality_base = subject.build_commands(include_center9_k4=False)
    exact_base = subject.build_commands(
        include_center9_k4=False, exact_fixed_rows=True
    )
    expected_exclusions = sum(
        12 - len(row) for _, row in subject.FIXED_ROWS
    )
    assert len(exact_base) == len(equality_base) + expected_exclusions
    assert all(command in exact_base for command in equality_base)
