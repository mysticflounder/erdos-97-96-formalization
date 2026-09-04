import cardge13_exact13_tight_cover_qfnra_piqd as producer


def test_survivor_cells_are_source_allowed() -> None:
    for cell in producer.CELLS.values():
        producer.validate_cell(cell)


def test_z3_survivor_keeps_blocker_equals_z_case() -> None:
    cell = producer.CELLS["z3-lra-survivor"]
    assert cell.b1 == cell.z


def test_qfnra_inventory() -> None:
    for cell in producer.CELLS.values():
        assert producer.inventory(cell) == {
            "commands": len(producer.build_commands(cell)),
            "coordinate_variables": 26,
            "radius_squared_variables": 4,
            "supporting_edge_strict_forms": 143,
            "row_equalities": 16,
            "a2_off_radius_disequalities": 16,
        }


def test_journal_has_no_solver_command() -> None:
    journal = producer.journal_bytes(producer.CELLS["z3-lra-survivor"])
    assert b"(check-sat)" not in journal
    assert b"(get-model)" not in journal
