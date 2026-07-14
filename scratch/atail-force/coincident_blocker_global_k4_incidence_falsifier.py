#!/usr/bin/env python3
"""Finite falsifier for the residual-point global-K4 incidence producer.

This is an exact combinatorial model, not a Euclidean realization.  It keeps:

* a selected four-row at every carrier center;
* center exclusion from its own row;
* the coincident blocker row ``{q,w,x,y}``;
* an apex row sharing exactly ``{q,w}`` with that blocker row;
* a shared cap containing ``q,z,w`` but not residuals ``x,y``; and
* the planar two-distinct-circles shadow: any two selected rows intersect in
  at most two carrier points.

Neither residual center's chosen global-K4 row contains both ``q`` and ``w``.
Consequently the desired third-bisector incidence cannot be derived at the
cardinality/incidence layer.  A proof must use a genuinely geometric coupling
between cap placement and the radius class selected at a residual point.
"""

from __future__ import annotations

import json
from itertools import combinations


NAMES = ("a", "z", "q", "w", "x", "y", "u", "v", "s", "t")

ROWS: dict[str, frozenset[str]] = {
    "a": frozenset(("q", "w", "u", "v")),
    "z": frozenset(("q", "w", "x", "y")),
    "q": frozenset(("a", "w", "u", "t")),
    "w": frozenset(("a", "u", "v", "s")),
    "x": frozenset(("w", "y", "v", "t")),
    "y": frozenset(("z", "w", "x", "t")),
    "u": frozenset(("a", "q", "y", "s")),
    "v": frozenset(("a", "q", "x", "t")),
    "s": frozenset(("z", "q", "u", "t")),
    "t": frozenset(("a", "z", "y", "u")),
}

SHARED_CAP = frozenset(("q", "z", "w"))
COMMON_PAIR = frozenset(("q", "w"))
RESIDUALS = frozenset(("x", "y"))


def check() -> dict[str, object]:
    carrier = frozenset(NAMES)
    assert frozenset(ROWS) == carrier
    assert all(len(row) == 4 for row in ROWS.values())
    assert all(row <= carrier for row in ROWS.values())
    assert all(center not in row for center, row in ROWS.items())

    assert ROWS["z"] == COMMON_PAIR | RESIDUALS
    assert ROWS["a"] & ROWS["z"] == COMMON_PAIR
    assert frozenset(("q", "z", "w")) <= SHARED_CAP
    assert RESIDUALS.isdisjoint(SHARED_CAP)

    intersections = {
        f"{left}:{right}": len(ROWS[left] & ROWS[right])
        for left, right in combinations(NAMES, 2)
    }
    assert max(intersections.values()) <= 2

    residual_target = {
        residual: COMMON_PAIR <= ROWS[residual] for residual in RESIDUALS
    }
    assert not any(residual_target.values())

    return {
        "status": "EXACT_FINITE_INCIDENCE_FALSIFIER",
        "trust_boundary": (
            "every-center selected-four incidence with pairwise row "
            "intersection at most two; no Euclidean distances, convex order, "
            "MEC side signs, or full radius-filter realizability"
        ),
        "carrier": list(NAMES),
        "rows": {center: sorted(row) for center, row in ROWS.items()},
        "shared_cap": sorted(SHARED_CAP),
        "common_pair": sorted(COMMON_PAIR),
        "residuals": sorted(RESIDUALS),
        "maximum_distinct_row_intersection": max(intersections.values()),
        "residual_row_contains_common_pair": residual_target,
        "first_missing_geometric_field": (
            "a cap/MEC radius-selection theorem forcing q and w into one "
            "residual-centered selected class, or an endpoint equality that "
            "feeds a banked cap pushout/two-circle consumer"
        ),
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
