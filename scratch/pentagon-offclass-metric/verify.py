#!/usr/bin/env python3
"""Exact-Fraction replay for the pentagon off-class local metric core.

This verifies a SAT witness for a deliberately bounded subset of the live
anchor.  It is not a verifier for CounterexampleData, the full cap packet, or
the theorem whose conclusion is False.
"""

from __future__ import annotations

import json
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent
WITNESS = HERE / "witness.json"
UPSTREAM_MODEL = HERE.parent / "pentagon-offclass-model" / "model.json"


def point(raw: list[str]) -> tuple[Q, Q]:
    return Q(raw[0]), Q(raw[1])


def d2(p: tuple[Q, Q], q: tuple[Q, Q]) -> Q:
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def area(a: tuple[Q, Q], b: tuple[Q, Q], c: tuple[Q, Q]) -> Q:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def replay(points: dict[str, tuple[Q, Q]]) -> dict[str, object]:
    labels = list(points)
    assert labels == ["u", "xu", "deleted", "v", "xv", "c", "a", "b", "e", "f", "g", "h"]
    assert len(set(points.values())) == 12

    physical = {"u", "xu", "deleted", "v", "xv"}
    circle = {q for q in labels if d2(points["h"], points[q]) == 1}
    assert circle == physical

    row_u_radius = d2(points["xv"], points["u"])
    row_u = {q for q in labels if d2(points["xv"], points[q]) == row_u_radius}
    assert row_u_radius == Q(4, 5)
    assert row_u == {"u", "xu", "e", "f"}

    row_xv_radius = d2(points["c"], points["xv"])
    row_xv = {q for q in labels if d2(points["c"], points[q]) == row_xv_radius}
    assert row_xv_radius == Q(2, 5)
    assert row_xv == {"u", "xv", "a", "b"}

    bis_u_xu = {q for q in labels if d2(points[q], points["u"]) == d2(points[q], points["xu"])}
    bis_u_xv = {q for q in labels if d2(points[q], points["u"]) == d2(points[q], points["xv"])}
    assert bis_u_xu == {"h", "xv"}
    assert bis_u_xv == {"h", "c"}

    assert points["c"] not in {points[q] for q in physical}
    assert d2(points["h"], points["c"]) != 1

    chain = ["u", "c", "xv", "xu"]
    direction = (
        points["xu"][0] - points["u"][0],
        points["xu"][1] - points["u"][1],
    )
    projection = {
        q: (points[q][0] - points["u"][0]) * direction[0]
        + (points[q][1] - points["u"][1]) * direction[1]
        for q in chain
    }
    assert projection["u"] < projection["c"] < projection["xv"] < projection["xu"]
    turns = [area(points[chain[i]], points[chain[i + 1]], points[chain[i + 2]]) for i in range(2)]
    assert all(turn < 0 for turn in turns)

    return {
        "physical_circle": sorted(circle),
        "row_u_radius_squared": str(row_u_radius),
        "row_u": sorted(row_u),
        "row_xv_radius_squared": str(row_xv_radius),
        "row_xv": sorted(row_xv),
        "bisector_u_xu": sorted(bis_u_xu),
        "bisector_u_xv": sorted(bis_u_xv),
        "projections": [str(projection[q]) for q in chain],
        "turns": [str(x) for x in turns],
    }


def audit_upstream_incidence_seed() -> list[str]:
    raw = json.loads(UPSTREAM_MODEL.read_text())
    rows = {q: set(support) for q, support in raw["rows"].items()}
    blockers = raw["blocker"]
    physical = set(raw["class"])
    mismatches = []
    if rows["u"] & physical != {"u", "xu"}:
        mismatches.append("row(u) class trace is not {u,xu}")
    if rows["v"] & physical != {"v", "xv"}:
        mismatches.append("row(v) class trace is not {v,xv}")
    if blockers["u"] != "xv":
        mismatches.append("blocker(u) is not xv")
    assert mismatches == [
        "row(u) class trace is not {u,xu}",
        "row(v) class trace is not {v,xv}",
        "blocker(u) is not xv",
    ]
    return mismatches


def main() -> None:
    raw = json.loads(WITNESS.read_text())
    points = {name: point(coords) for name, coords in raw["points"].items()}
    result = replay(points)
    mismatches = audit_upstream_incidence_seed()

    mutations = []
    for label, replacement in [
        ("c", points["xv"]),
        ("e", (Q(2), Q(2))),
        ("deleted", (Q(2), Q(0))),
    ]:
        changed = dict(points)
        changed[label] = replacement
        try:
            replay(changed)
        except AssertionError:
            mutations.append(label)
    assert mutations == ["c", "e", "deleted"]

    print("SAT_LOCAL_METRIC_CORE: exact rational witness replayed")
    print(json.dumps(result, sort_keys=True))
    print("SAT_INCIDENCE_SEED: upstream verifier passes, but exact-anchor mismatches are:")
    for mismatch in mismatches:
        print(f"- {mismatch}")
    print("SMOKE_MUTATIONS_REJECTED: 3/3")
    print("UNKNOWN_FULL_ANCHOR: omitted constraints prevent any closure claim")


if __name__ == "__main__":
    main()
