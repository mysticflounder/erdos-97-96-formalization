#!/usr/bin/env python3
"""Independent exact replay of the banked seven-orbit LRA witnesses."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from itertools import combinations
from pathlib import Path


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


def q(value: str) -> Fraction:
    return Fraction(value)


def verify_witness(witness: dict) -> dict[str, str]:
    boundary = tuple(witness["boundary"])
    cap_boundary = tuple(witness["cap_boundary"])
    supports = {center: tuple(points) for center, points in witness["supports"].items()}
    physical_card = int(witness["physical_card"])
    assert len(boundary) == len(set(boundary)) == 21
    assert boundary[:6] == cap_boundary
    assert len(cap_boundary) == 6

    ledger = {
        tuple(name.split("__")): q(value)
        for name, value in witness["distance_ledger"].items()
    }
    assert set(ledger) == {edge(a, b) for a, b in combinations(boundary, 2)}

    def distance(a: str, b: str) -> Fraction:
        return ledger[edge(a, b)]

    assert min(ledger.values()) >= 1
    triangle_margins = []
    for a, b, c in combinations(boundary, 3):
        triangle_margins.extend((
            distance(a, b) + distance(b, c) - distance(a, c),
            distance(a, b) + distance(a, c) - distance(b, c),
            distance(a, c) + distance(b, c) - distance(a, b),
        ))
    assert min(triangle_margins) >= 1

    kalmanson_margins = []
    for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
        a, b, c, d = (boundary[index] for index in (ia, ib, ic, id_))
        diagonal = distance(a, c) + distance(b, d)
        kalmanson_margins.extend((
            diagonal - distance(a, b) - distance(c, d),
            diagonal - distance(a, d) - distance(b, c),
        ))
    assert min(kalmanson_margins) >= 1

    for center, support in supports.items():
        radii = {distance(center, point) for point in support}
        assert len(radii) == 1
        radius = next(iter(radii))
        assert all(
            abs(distance(center, point) - radius) >= 1
            for point in boundary if point not in {*support, center}
        )

    apex_support = set(supports["o"])
    apex_outside = [point for point in boundary if point not in {*apex_support, "o"}]
    assert all(
        abs(distance("o", left) - distance("o", right)) >= 1
        for left, right in combinations(apex_outside, 2)
    )

    apex_index = boundary.index("o")
    physical_cap = set(cap_boundary)
    adjacent_before = set(boundary[5:apex_index + 1])
    adjacent_after = set(boundary[apex_index:]) | {cap_boundary[0]}
    assert not physical_cap & {"bu", "bs", "bt"}
    assert {"bu", "bs", "bt"} < adjacent_before
    if physical_card == 3:
        assert len(apex_support & adjacent_before) == 1
        assert len(apex_support & adjacent_after) == 1
    else:
        assert len(apex_support & (adjacent_before | adjacent_after)) == 1
    for center in ("bu", "bs", "bt"):
        assert len(set(supports[center]) & adjacent_before) <= 2

    physical = {f"p{index}" for index in range(physical_card)}
    roles = witness["roles"]
    assert {roles["first"], roles["second"], roles["source"], roles["target"]} <= physical
    assert roles["first"] != roles["second"]
    assert roles["source"] != roles["target"]
    expected_mutual_roles = {
        "continuationOrder": ("p0", "p1"),
        "reverseContinuationOrder": ("p1", "p0"),
        "sharesFirstAtSource": ("p0", "p2"),
        "sharesFirstAtTarget": ("p2", "p0"),
        "sharesSecondAtSource": ("p1", "p2"),
        "sharesSecondAtTarget": ("p2", "p1"),
        "fourDistinct": ("p2", "p3"),
    }
    assert (roles["source"], roles["target"]) == expected_mutual_roles[witness["orbit"]]
    assert set(supports["o"]) & physical_cap == physical
    assert len(set(supports["bu"]) & physical) == 0
    assert set(supports["bs"]) & physical == {roles["source"]}
    assert set(supports["bt"]) & physical == {roles["target"]}
    assert roles["target"] not in supports["bs"]
    assert roles["source"] not in supports["bt"]
    assert not set(supports["bs"]) & set(supports["bt"])

    return {
        "minimum_triangle_margin": str(min(triangle_margins)),
        "minimum_kalmanson_margin": str(min(kalmanson_margins)),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("result", type=Path)
    args = parser.parse_args()
    payload = json.loads(args.result.read_text())
    assert payload["smoke_tests"] == {
        "manual_strict_kalmanson": "PASS",
        "ordinal_unsat": "PASS",
    }
    summaries = {}
    for result in payload["orbit_results"]:
        assert result["statuses"] == {"sat": result["cell_count"]}
        assert result["non_sat_cells"] == []
        summaries[result["orbit"]] = verify_witness(result["exact_witness"])
    print(json.dumps({"status": "PASS", "orbits": summaries}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
