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
