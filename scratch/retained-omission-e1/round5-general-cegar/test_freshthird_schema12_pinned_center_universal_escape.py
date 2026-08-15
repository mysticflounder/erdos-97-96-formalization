from __future__ import annotations

import freshthird_schema12_pinned_center_universal_escape as schema12


def test_self_check() -> None:
    result = schema12.self_check()
    assert result["status"] == "PASS"
    assert result["schema_version"] == 12
    assert result["positive_center"] == 0
    assert result["finite_only"] is True
    assert result["universal_lift_claim"] is False


def test_single_pinned_center_is_used_for_all_rows() -> None:
    instance = schema12.positive_instance()
    assert schema12.satisfies(instance)
    rows = instance.rows[0] + (schema12.FourRow(frozenset({0, 1, 8, 9})),)
    bad = schema12.Instance(**{**instance.__dict__, "rows": {0: rows}})
    assert not schema12.satisfies(bad)


def test_branch_A_requires_failed_deletion_robustness() -> None:
    instance = schema12.positive_instance()
    bad = schema12.Instance(
        **{**instance.__dict__, "deletion_robust": {**instance.deletion_robust, 0: True}}
    )
    assert schema12.witness(bad) is None


def test_branch_B_is_at_most_two() -> None:
    instance = schema12.positive_instance()
    bad = schema12.Instance(
        **{
            **instance.__dict__,
            "critical_support": {
                **instance.critical_support,
                8: frozenset({0, 1, 2, 8}),
            },
        }
    )
    assert schema12.witness(bad) is None
