# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""No-solver tests for full-cone encodings and exact witness verification."""

from fractions import Fraction

import pytest
import solve_exact13_quotient_cones as subject

E = (0, 1)


def test_exact_decimal_normalization():
    assert subject.read_values("((q_0 0.0) (q_1 (/ 1.0 2.0)) (q_2 (- 1.25)))",
                               ("q_0", "q_1", "q_2")) == (0, Fraction(1, 2), Fraction(-5, 4))


@pytest.mark.parametrize("value", ("1.23?", "(- 0.0)", "(/ 1 0)", "root-obj", "1e-3"))
def test_bad_readback(value):
    with pytest.raises(ValueError):
        subject.read_values(f"((q_0 {value}))", ("q_0",))


def test_distance_and_cancellation_replay():
    positive = (((E, 1),),)
    cert = subject.replay(positive, "distance", (Fraction(2),))
    assert subject.check_certificate(positive, cert)
    contradictory = (positive[0], ((E, -2),))
    cert = subject.replay(contradictory, "cancellation", (Fraction(2, 3), Fraction(1, 3)))
    assert subject.check_certificate(contradictory, cert)
    with pytest.raises(ValueError):
        subject.replay(contradictory, "cancellation", (Fraction(1, 2), Fraction(1, 2)))
    with pytest.raises(ValueError):
        subject.replay(positive, "distance", (Fraction(0),))


def test_query_parses_without_solving():
    vectors = (((E, 1),), ((E, -1),))
    for kind in ("distance", "cancellation"):
        payload, names, count = subject.query(vectors, kind)
        assertions = subject.z3.parse_smt2_string(payload)
        assert count == len(names) + len(assertions) + 1


def test_same_quotient_grouping():
    import json
    records = json.loads(subject.INPUT.read_text())["survivors"]
    groups = subject.groups_of(records)
    assert len(groups) == 270
    assert sorted(i for g in groups for i in g["indices"]) == list(range(540))


def test_real_queries_fit_single_transport_frame():
    import json
    records = json.loads(subject.INPUT.read_text())["survivors"]
    vectors = subject.projected(subject.groups_of(records)[0]["rows"])
    assert len(vectors) == 1430
    for kind in ("distance", "cancellation"):
        payload, names, count = subject.query(vectors, kind)
        assert len(payload.encode()) < 480_000
        assert count == 1 + len(names) + len(subject.z3.parse_smt2_string(payload))


def test_complete_gate_rejects_empty_coverage(tmp_path, monkeypatch):
    import json
    report = tmp_path / "empty.json"
    report.write_text(json.dumps({"schema": "exact13-full-cone/v1",
                                  "total_groups": 270, "total_records": 540,
                                  "input_sha256": subject.INPUT_SHA256, "entries": []}))
    monkeypatch.setattr(subject.sys, "argv", ["cone", "--verify", str(report), "--require-complete"])
    with pytest.raises(ValueError, match="coverage incomplete"):
        subject.main()


def test_duplicate_sparse_weight_rejected():
    vectors = (((E, 1),), ((E, -1),))
    with pytest.raises(ValueError, match="invalid weight index"):
        subject.check_certificate(vectors, {"kind": "cancellation", "weights": [[0, "1/2"], [0, "1/2"]]})
