from __future__ import annotations

import json
from fractions import Fraction
from pathlib import Path

import cardge13_exact13_coarse_cell_batch_piqd as one_form_batch
import cardge13_exact13_coarse_cell_conic_batch_piqd as subject
import cardge13_exact13_coarse_cell_three_form_batch_piqd as three_form
import cardge13_exact13_global_source_cell_csp_piqd as base
import pytest

SOURCE_EVENT = Path(
    "scratch/runs/cardge13-exact13-three-form-resume-20260905/run-0001/"
    "cell-000-direct-z08-k09-10-three-form-resume.json"
)


def test_model_weights_and_primitive_scaling() -> None:
    model = """
    (model
      (define-fun w_0 () Real (/ 1.0 6.0))
      (define-fun w_1 () Real (/ 1.0 3.0))
      (define-fun w_2 () Real (/ 1.0 2.0)))
    """
    weights = subject.model_weights(model, 3)
    assert weights == (Fraction(1, 6), Fraction(1, 3), Fraction(1, 2))
    assert subject.primitive_natural_weights(weights) == (1, 2, 3)


def test_model_weights_rejects_missing_variable() -> None:
    model = "(model (define-fun w_0 () Real 1.0))"
    with pytest.raises(subject.ConicBatchError, match="omitted or added"):
        subject.model_weights(model, 2)


def test_cone_commands_are_normalized_and_coordinate_complete() -> None:
    forms = (
        ((((0, 1), 1), ((0, 2), -1)), {"form": (0, 1, 2, 3, 0)}),
        ((((0, 1), -1), ((0, 2), 1)), {"form": (0, 1, 2, 3, 1)}),
    )
    commands = subject.cone_commands(forms)
    assert commands[0] == "(set-logic QF_LRA)"
    assert "(assert (= (+ w_0 w_1) 1))" in commands
    assert sum("(* 1 w_0)" in command for command in commands) == 1
    assert sum("(* -1 w_0)" in command for command in commands) == 1


def test_actual_replayed_cell_zero_form_compiles_to_provider_cut() -> None:
    event = json.loads(SOURCE_EVENT.read_text())
    coarse_cell = one_form_batch.source_coarse_cell(event)
    cell = one_form_batch.final_replayed_cell(event)
    order = base.DIRECT_ORDER if coarse_cell.orientation == "direct" else base.MIRROR_ORDER
    forms = three_form.representative_projected_forms(cell, order)
    zero_index = next(index for index, (vector, _form) in enumerate(forms) if not vector)
    weights = tuple(1 if index == zero_index else 0 for index in range(len(forms)))
    conflict = subject.weighted_conflict(cell, forms, weights)
    assert conflict["kind"] == "positive-conic-incidence-path"
    assert conflict["terms"] == (
        {"form": forms[zero_index][1]["form"], "weight": 1},
    )
    assert len(conflict["pairings"]) == 2
    assert conflict["atoms"]
    cut = base.transitive_conflict_clause(conflict)
    assert cut.startswith("(assert (or ")


def test_replay_weighted_zero_rejects_nonzero_sum() -> None:
    forms = (
        ((((0, 1), 1),), {"form": (0, 1, 2, 3, 0)}),
    )
    with pytest.raises(subject.ConicBatchError, match="do not sum to zero"):
        subject.replay_weighted_zero(forms, (1,))


def test_compact_direct_solve_drops_full_model() -> None:
    compact = subject.compact_direct_solve(
        {
            "solver": "z3",
            "created": {"id": "session"},
            "asserted": {"commands": 3},
            "solved": {
                "status": "SAT",
                "solve_index": 1,
                "model": "large model",
                "model_replay": {"outcome": "SATISFIED"},
            },
            "receipts": {"count": 1, "session_id": "session", "extra": "drop"},
            "closed": {"state": "closed"},
        }
    )
    assert compact["solved"] == {
        "status": "SAT",
        "solve_index": 1,
        "model_replay": {"outcome": "SATISFIED"},
    }
    assert compact["receipts"] == {"count": 1, "session_id": "session"}
