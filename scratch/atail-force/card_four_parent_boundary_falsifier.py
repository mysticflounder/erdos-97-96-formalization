# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna

"""Exact finite incidence falsifier for the card-four parent producer.

The seven-vertex model retains only the fields relevant to the attempted
common-system extraction: one four-point apex row, two off-cap sources in
that row, exact four-point blocker shells, deletion-critical source incidence,
and a surplus cap of cardinality five containing the apex.  No non-apex
center in that cap has a shell containing the chosen pair.  Seven vertices
are minimal for this interface: the strict surplus lower bound needs five cap
points and the requested pair contributes two distinct points outside it.

This is an exact finite incidence model, not a Euclidean/convex/MEC model.
"""

from __future__ import annotations

import json


VERTICES = frozenset(range(7))
APEX = 0
Q = 1
W = 2
SURPLUS_CAP = frozenset({0, 3, 4, 5, 6})

# Each center has one declared exact four-point shell.  The two selected
# sources share the apex row, but their chosen blockers need not provide a
# second cap-local bisector.
SUPPORT = {
    0: frozenset({1, 2, 3, 4}),
    1: frozenset({2, 3, 4, 5}),
    2: frozenset({0, 1, 4, 5}),
    3: frozenset({0, 1, 4, 5}),
    4: frozenset({0, 2, 3, 5}),
    5: frozenset({0, 1, 3, 6}),
    6: frozenset({0, 2, 4, 5}),
}
BLOCKER = {0: 2, 1: 0, 2: 1, 3: 0, 4: 2, 5: 4, 6: 5}


def check() -> dict[str, object]:
    assert all(len(SUPPORT[c]) == 4 for c in VERTICES)
    assert all(c not in SUPPORT[c] for c in VERTICES)
    assert all(source in SUPPORT[center] for source, center in BLOCKER.items())

    assert Q in SUPPORT[APEX] and W in SUPPORT[APEX]
    assert len(SURPLUS_CAP) == 5
    assert Q not in SURPLUS_CAP and W not in SURPLUS_CAP and Q != W
    assert BLOCKER[Q] == APEX
    assert BLOCKER[W] == 1 and 1 not in SURPLUS_CAP

    witnesses = [
        center
        for center in SURPLUS_CAP
        if center != APEX and {Q, W} <= SUPPORT[center]
    ]
    assert witnesses == []

    return {
        "status": "PASS",
        "cardinality": len(VERTICES),
        "minimality": "5 surplus-cap points plus 2 distinct outside points",
        "apex": APEX,
        "pair": [Q, W],
        "surplus_cap": sorted(SURPLUS_CAP),
        "apex_support": sorted(SUPPORT[APEX]),
        "blockers": BLOCKER,
        "nonapex_surplus_pair_shell_centers": witnesses,
        "trust_boundary": (
            "exact finite incidence model; omits Euclidean distances, "
            "convexity, cap order, and MEC geometry"
        ),
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
