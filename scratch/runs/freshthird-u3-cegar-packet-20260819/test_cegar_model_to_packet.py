"""Tests for the real v10 U3 SAT-model projection."""

from __future__ import annotations

import importlib.util
from pathlib import Path

import pytest

ROOT = Path(__file__).parent
spec = importlib.util.spec_from_file_location("u3_cegar_packet", ROOT / "cegar_model_to_packet.py")
assert spec and spec.loader
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def test_real_v10_model_is_clause_replayed_and_projected():
    wrapper = module.extract_packet(
        module.DEFAULT_CNF,
        module.DEFAULT_MAP,
        module.DEFAULT_MANIFEST,
        module.DEFAULT_STDOUT,
    )
    packet = wrapper["packet"]
    evidence = wrapper["evidence"]
    assert evidence["solver_status"] == "SATISFIABLE"
    assert evidence["replayed_clause_count"] == 728527
    assert evidence["source_total"] is False
    assert evidence["source_total_claim"] is False
    assert evidence["selected_obstruction_center"] == "u"
    assert packet["arm"] == "qDeleted"
    assert packet["roles"]["q"] == 12
    assert packet["roles"]["p"] == 16
    assert packet["roles"]["t1"] == 1
    assert packet["roles"]["t2"] == 2
    assert packet["roles"]["t3"] == 3
    assert packet["roles"]["u"] == 9
    assert packet["roles"]["a0"] == 10
    assert packet["roles"]["a1"] == 4
    assert packet["roles"]["x"] == 9
    assert packet["roles"]["z"] == 0
    assert packet["row"] == [0, 1, 2, 4]
    assert packet["bounded"] == [1, 2, 3, 4, 9, 10, 12, 16]


def test_model_parser_rejects_incomplete_model(tmp_path):
    path = tmp_path / "model.stdout"
    path.write_text("s SATISFIABLE\nv 1 0\n")
    with pytest.raises(ValueError, match="incomplete model"):
        module.parse_model(path, 2)


def test_stale_v10_log_is_rejected_against_current_cnf():
    stale = module.DEFAULT_STDOUT.parent / "u3-v10-cadical.stdout"
    with pytest.raises(ValueError, match="falsifies DIMACS clause"):
        module.extract_packet(
            module.DEFAULT_CNF,
            module.DEFAULT_MAP,
            module.DEFAULT_MANIFEST,
            stale,
        )
