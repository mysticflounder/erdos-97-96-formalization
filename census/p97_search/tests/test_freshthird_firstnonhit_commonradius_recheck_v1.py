# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json

import pytest

import census.p97_search.freshthird_firstnonhit_commonradius_recheck_v1 as recheck


def _double_nonhit_readback(**overrides: object) -> dict[str, object]:
    readback: dict[str, object] = {
         "common_source_indices": {"one": 3, "two": 5},
         "common_blocker_indices": {"one": 7, "two": 7},
         "reduced_case_constructor": "double_nonhit",
         "reduced_case_details": {
              "first_nonhit": "source_omission",
              "second_nonhit": "same_blocker",
              "five_center_deletion": "delete_first_one",
          },
         "reduced_payload_validated": True,
         "all_30_payload_fields_validated": True,
         "faithful_six_center_boundary_encoded": False,
         "independent_g_surface": True,
     }
    readback.update(overrides)
    return readback


def test_recheck_reports_missing_boundary_and_route() -> None:
    result = recheck.recheck(_double_nonhit_readback())
    assert result["lane"] == recheck.LANE_ID
    assert result["reached"] is False
    assert result["missing"] == ["classAt", "SelectedFourClass"]
    assert result["route"] == recheck.SIX_CENTER_BRIDGE
    assert result["route_applicable"] is True
    ante = result["antecedents"]
    assert ante["common_radius_eq"] is True
    assert ante["common_blocker_center"] == 7
    assert ante["first_nonhit"] == "source_omission"
    assert ante["second_nonhit"] == "same_blocker"
    assert ante["five_center_deletion_survival"] == "delete_first_one"
    assert ante["faithful_six_center_boundary_encoded"] is False
    assert result["feasibility"]["pure_assignment_rederivation"] == "infeasible"


def test_recheck_rejects_unequal_blocker_centers() -> None:
    with pytest.raises(recheck.RecheckError, match="not equal"):
        recheck.reconstruct_sixcenter_antecedents(
             _double_nonhit_readback(common_blocker_indices={"one": 7, "two": 8})
        )


def test_recheck_rejects_unvalidated_payload() -> None:
    with pytest.raises(recheck.RecheckError, match="reduced payload"):
        recheck.reconstruct_sixcenter_antecedents(
             _double_nonhit_readback(reduced_payload_validated=False)
        )


def test_recheck_rejects_missing_key() -> None:
    readback = _double_nonhit_readback()
    del readback["common_blocker_indices"]
    with pytest.raises(recheck.RecheckError, match="missing required key"):
        recheck.reconstruct_sixcenter_antecedents(readback)


def test_recheck_rejects_double_nonhit_without_nonhit_arms() -> None:
    with pytest.raises(recheck.RecheckError, match="lacks non-hit arms"):
        recheck.reconstruct_sixcenter_antecedents(
             _double_nonhit_readback(
                  reduced_case_details={
                       "five_center_deletion": "delete_first_one",
                   }
             )
        )


def test_recheck_rejects_bool_blocker_center() -> None:
    with pytest.raises(recheck.RecheckError, match="not bools"):
        recheck.reconstruct_sixcenter_antecedents(
             _double_nonhit_readback(common_blocker_indices={"one": True, "two": True})
        )


def test_recheck_route_not_applicable_for_other_reduced_case() -> None:
    readback = _double_nonhit_readback(
         reduced_case_constructor="equal_cross_row_centers",
         reduced_case_details={},
     )
    result = recheck.recheck(readback)
    assert result["reached"] is False
    assert result["route_applicable"] is False
    assert result["route"] is None
    assert result["missing"] == ["classAt", "SelectedFourClass"]


def test_recheck_rejects_model_that_already_encodes_boundary() -> None:
    with pytest.raises(recheck.RecheckError, match="not needed"):
        recheck.recheck(
             _double_nonhit_readback(faithful_six_center_boundary_encoded=True)
        )


def test_module_is_solver_free() -> None:
    # The re-check must not pull in the runner or emit a solver dependency.
    for forbidden in (
         "freshthird_firstnonhit_common_only_v7_run",
         "cadical",
         "subprocess",
     ):
        assert forbidden not in recheck.__dict__
    assert "recheck" in recheck.__dict__


def test_main_prints_canonical_json(tmp_path) -> None:
    path = tmp_path / "readback.json"
    path.write_text(json.dumps(_double_nonhit_readback()))
    rc = recheck.main([str(path)])
    assert rc == 0
