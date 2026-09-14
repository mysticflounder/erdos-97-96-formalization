from __future__ import annotations

import json

import cardge13_exact13_global_source_cell_unsat_core_refine_piqd as subject


def test_seed_selectors(tmp_path) -> None:
    path = tmp_path / "seed.json"
    path.write_text(
        json.dumps(
            {
                "core_records": [
                    {"selector": "arith_0004"},
                    {"selector": "arith_0012"},
                ]
            }
        )
    )
    assert subject.seed_selectors(path) == ("arith_0004", "arith_0012")


def test_refine_core_stops_when_selector_set_stabilizes(monkeypatch, tmp_path) -> None:
    selector_map = (
        {"selector": "arith_0000"},
        {"selector": "arith_0001"},
        {"selector": "arith_0002"},
    )
    answers = iter(
        [
            {"solved": {"status": "UNSAT", "core": ["arith_0002", "arith_0000"]}},
            {"solved": {"status": "UNSAT", "core": ["arith_0000", "arith_0002"]}},
        ]
    )
    monkeypatch.setattr(subject.core_driver, "run_piqd_core", lambda *args: next(answers))
    selected, rounds = subject.refine_core(
        tmp_path / "journal.smt2",
        ("(set-logic QF_LRA)",),
        selector_map,
        ("arith_0000", "arith_0001", "arith_0002"),
        "z3",
        100,
        4,
    )
    assert set(selected) == {"arith_0000", "arith_0002"}
    assert [row["output_size"] for row in rounds] == [2, 2]
