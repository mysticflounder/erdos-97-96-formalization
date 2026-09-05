from __future__ import annotations

import hashlib
import json

import cardge13_exact13_global_source_cell_boolean_path_pair_resume_piqd as subject


def test_seed_cuts_deduplicates_and_binds_sources(tmp_path) -> None:
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    cut_a = "(assert (or (not a) (not b)))"
    cut_b = "(assert (or (not c) (not d)))"
    first.write_text(json.dumps({"solves": [{"iterations": [{"cut": cut_a}]}]}))
    second.write_text(
        json.dumps({"solves": [{"iterations": [{"cut": cut_a}, {"cut": cut_b}]}]})
    )
    cuts, sources = subject.seed_cuts((first, second))
    assert cuts == (cut_a, cut_b)
    assert [source["cut_occurrences"] for source in sources] == [1, 2]
    assert sources[0]["sha256"] == hashlib.sha256(first.read_bytes()).hexdigest()


def test_seed_cuts_loads_iterative_batches(tmp_path) -> None:
    event = tmp_path / "batch.json"
    cut_a = "(assert (or (not a) (not b)))"
    cut_b = "(assert (or (not c) (not d)))"
    event.write_text(
        json.dumps(
            {
                "solves": [
                    {
                        "iterations": [
                            {
                                "new_conflicts": [
                                    {"linear_conflict": {}, "cut": cut_a},
                                    {"linear_conflict": {}, "cut": cut_b},
                                ]
                            },
                            {"new_conflicts": [{"cut": cut_a}]},
                        ]
                    }
                ]
            }
        )
    )
    cuts, sources = subject.seed_cuts((event,))
    assert cuts == (cut_a, cut_b)
    assert sources[0]["cut_occurrences"] == 3


def test_seed_cuts_loads_direct_conic_solve_cut(tmp_path) -> None:
    event = tmp_path / "conic.json"
    cut = "(assert (or (not a) (not b)))"
    event.write_text(json.dumps({"solves": [{"solver": "z3", "cut": cut}]}))
    cuts, sources = subject.seed_cuts((event,))
    assert cuts == (cut,)
    assert sources[0]["cut_occurrences"] == 1
