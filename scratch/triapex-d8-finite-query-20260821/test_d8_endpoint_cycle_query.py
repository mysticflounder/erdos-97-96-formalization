from __future__ import annotations

import importlib.util
from pathlib import Path
import sys

import z3


MODULE_PATH = Path(__file__).with_name("d8_endpoint_cycle_query.py")
SPEC = importlib.util.spec_from_file_location("d8_endpoint_cycle_query", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
QUERY = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = QUERY
SPEC.loader.exec_module(QUERY)


def test_avoiding_all_candidate_bridges_has_replayable_model() -> None:
    result = QUERY.solve()
    assert result["status"] == "SAT_ABSTRACTION"
    assert result["bridge_values"] == {name: False for name in QUERY.BRIDGES}
    QUERY.verify_result(result)


def test_named_source_incidence_is_not_optional() -> None:
    q = QUERY.build_query()
    q.solver.add(z3.Not(q.incident("c", "retained_o")))
    assert q.solver.check() == z3.unsat


def test_exact_row_slots_cannot_collapse() -> None:
    q = QUERY.build_query()
    q.solver.add(q.same("c", "d"))
    assert q.solver.check() == z3.unsat


def test_packet_deleted_source_cannot_enter_its_row() -> None:
    q = QUERY.build_query()
    q.solver.add(q.incident("j", "delete_j_at_o"))
    assert q.solver.check() == z3.unsat


def test_concentric_selected_witness_rows_may_partially_overlap() -> None:
    q = QUERY.build_query()
    q.solver.add(q.incident("c", "delete_j_at_o"))
    q.solver.add(z3.Not(q.incident("d", "delete_j_at_o")))
    assert q.solver.check() == z3.sat
