from __future__ import annotations

import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as subject
import cardge13_exact13_global_source_cell_csp_piqd as base

CELL: dict[str, object] = {
    "base_rows": {
        "C0": [2, 4, 6, 11],
        "C1": [0, 3, 5, 12],
        "K": [1, 7, 8, 10],
        "L": [2, 9, 11, 12],
        "T": [5, 6, 7, 9],
    },
    "global_rows": {
        "3": [0, 4, 10, 12],
        "4": [0, 3, 8, 9],
        "5": [3, 4, 6, 10],
        "6": [2, 4, 5, 8],
        "7": [0, 2, 6, 10],
        "8": [2, 7, 9, 10],
        "10": [1, 5, 8, 11],
        "11": [1, 4, 7, 12],
        "12": [3, 6, 8, 11],
    },
    "roles": {"b0": 9, "b1": 2, "d": 7, "s0": 4, "s1": 3, "z": 9},
}


def boolean_cells() -> list[dict[str, object]]:
    return [CELL]


def test_path_conflicts_are_smaller_than_full_three_row_pins() -> None:
    for cell in boolean_cells():
        conflict = subject.minimal_incidence_path_conflict(cell, base.DIRECT_ORDER)
        assert conflict is not None
        atoms = conflict["atoms"]
        assert isinstance(atoms, tuple)
        assert 0 < len(atoms) < 12
        assert conflict["kind"] == "transitive-incidence-path"
        assert len(conflict["pairings"]) == 2


def test_each_path_step_is_justified_by_its_recorded_atoms() -> None:
    conflict = subject.minimal_incidence_path_conflict(
        boolean_cells()[0], base.DIRECT_ORDER
    )
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
