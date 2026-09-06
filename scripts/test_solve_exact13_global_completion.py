# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""No-solver controls for fixed-base global completion."""

import json
import sys
from fractions import Fraction
from pathlib import Path

import pytest
import solve_exact13_global_completion as subject


def fixture():
    record = json.loads(subject.cone.INPUT.read_text())["survivors"][0]
    cert = json.loads(Path("docs/audits/2026-09-06-exact13-full-cone.json").read_text())["entries"][0]["certificate"]
    roots = subject.base.edge_roots_for_rows(subject.cone.rows_of(record))
    coordinates = sorted({e for v in subject.cone.projected(subject.cone.rows_of(record)) for e, _ in v})
    values = dict(zip(coordinates, map(Fraction, cert["values"]), strict=True))
    return record, tuple(values[roots[e]] for e in subject.EDGES)


def test_known_base_model_replays_without_global_claim():
    record, values = fixture()
    certificate = subject.replay(record, (), values)
    assert certificate["minimum_gap"] == "1"
    assert certificate["all_centers_covered"] is False


def test_base_model_is_not_automatically_global():
    record, values = fixture()
    with pytest.raises(ValueError, match="missing four-equal global row"):
        subject.replay(record, subject.active_centers(record), values)


def test_flat_distances_fail_strictness():
    record, _ = fixture()
    with pytest.raises(ValueError, match="strict gap failed"):
        subject.replay(record, (), (Fraction(1),) * 78)


def test_invalid_center_rejected():
    record, values = fixture()
    with pytest.raises(ValueError, match="invalid centers"):
        subject.replay(record, (0,), values)


def test_compact_real_cardinality_encoding():
    record, _ = fixture()
    centers = subject.active_centers(record)
    assert len(centers) == 9
    payload, names, count = subject.query(record, centers)
    assertions = subject.z3.parse_smt2_string(payload)
    assert len(names) == 78
    assert count == 1 + 78 + 9 * 13 + len(assertions)
    assert len(assertions) == 15 + 1430 + 9 * 13
    assert len(payload.encode()) < 480_000
    assert " Int)" not in payload
    assert all(f"g_{c}_{c}" not in payload for c in centers)


def test_completion_groups_preserve_active_centers():
    records = json.loads(subject.cone.INPUT.read_text())["survivors"]
    groups = subject.completion_groups(records)
    assert len(groups) == 234
    assert sum(map(len, groups)) == 468
    assert len({i for group in groups for i in group}) == 468
    for indices in groups:
        assert len({subject.active_centers(records[i]) for i in indices}) == 1


def test_report_rejects_duplicate_entry(tmp_path, monkeypatch):
    records = json.loads(subject.cone.INPUT.read_text())["survivors"]
    indices = subject.completion_groups(records)[0]
    result = {"centers": list(subject.active_centers(records[indices[0]])),
              "solved": {"status": "UNSAT"}, "classification": "UNCERTIFIED_UNSAT"}
    entry = {"record_index": indices[0], "indices": indices, "result": result}
    report = {"schema": "exact13-global-completion/v1", "input_sha256": subject.cone.INPUT_SHA256,
              "cone_sha256": subject.CONE_SHA256, "entries": [entry, entry]}
    path = tmp_path / "duplicate.json"
    path.write_text(json.dumps(report))
    monkeypatch.setattr(sys, "argv", ["completion", "--verify", str(path)])
    with pytest.raises(ValueError, match="invalid or duplicate record"):
        subject.main()
