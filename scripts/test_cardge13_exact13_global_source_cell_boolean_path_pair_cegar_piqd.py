from __future__ import annotations

import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as one_form
import cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd as subject
import cardge13_exact13_global_source_cell_csp_piqd as base

SURVIVOR: dict[str, object] = {
    "base_rows": {
        "C0": [2, 4, 6, 11],
        "C1": [0, 3, 5, 10],
        "K": [1, 7, 8, 12],
        "L": [2, 9, 10, 11],
        "T": [5, 6, 7, 9],
    },
    "global_rows": {
        "3": [0, 1, 4, 9],
        "4": [0, 6, 10, 12],
        "5": [0, 3, 8, 11],
        "6": [2, 3, 4, 7],
        "7": [4, 5, 8, 9],
        "8": [2, 3, 9, 12],
        "10": [5, 8, 11, 12],
        "11": [1, 3, 6, 8],
        "12": [1, 4, 7, 11],
    },
    "roles": {"b0": 9, "b1": 2, "d": 7, "s0": 4, "s1": 3, "z": 9},
}


def test_two_form_survivor_gets_incidence_path_conflict() -> None:
    assert one_form.minimal_incidence_path_conflict(SURVIVOR, base.DIRECT_ORDER) is None
    full = base.minimal_pair_cancellation_conflict(SURVIVOR, base.DIRECT_ORDER)
    assert full is not None
    conflict = subject.minimal_incidence_linear_conflict(SURVIVOR, base.DIRECT_ORDER)
    assert conflict is not None
    assert conflict["kind"] == "two-form-incidence-path"
    assert len(conflict["forms"]) == 2
    assert len(conflict["pairings"]) == 4
    assert 0 < len(conflict["atoms"]) < len(full["atoms"])


def test_two_form_paths_join_every_paired_edge() -> None:
    conflict = subject.minimal_incidence_linear_conflict(SURVIVOR, base.DIRECT_ORDER)
    assert conflict is not None
    atoms = set(conflict["atoms"])
    for pairing in conflict["pairings"]:
        current = tuple(pairing["left"])
        for step in pairing["steps"]:
            assert tuple(step["left_edge"]) == current
            required = set(
                base.row_pin_atoms(
                    step["row"],
                    step["center"],
                    (step["left_support"], step["right_support"]),
                )
            )
            assert required <= atoms
            current = tuple(step["right_edge"])
        assert current == tuple(pairing["right"])
