from __future__ import annotations

import freshthird_schema11_pinned_seed_probe as schema11


def test_self_check() -> None:
    result = schema11.self_check()
    assert result["status"] == "PASS"
    assert result["case_count"] == 16
    assert result["escape_canary"] == "UNSAT"
    assert result["solver_check_called_for_cases"] is False


def test_all_live_cases_build_with_exact_pinned_contract() -> None:
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                probe, _, _, _, _, _, stats = schema11.build(
                    schema11._args(
                        endpoint_mapping=mapping,
                        order_arm=arm,
                        query=query,
                    )
                )
                assert len(probe.solver.assertions()) > 0
                assert stats["direct"]["candidate_count"] == 4913
                assert stats["schema11"]["pinned_center_candidate_count"] == 17
                assert stats["schema11"]["radius_bound_count"] == 272
