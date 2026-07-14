#!/usr/bin/env python3
"""Exact Q(sqrt(3)) witness for the bare crossed two-apex-row packet.

The witness refutes only the Tier-A two-row geometric lemma.  It does not
encode MEC-boundary selection, the live closed-cap predicates, all-center K4,
or a critical shell system.
"""

from __future__ import annotations

import json
from collections import Counter
from typing import TypeAlias

import sympy as sp


Scalar = sp.Expr
Point: TypeAlias = tuple[Scalar, Scalar]
SQRT3 = sp.sqrt(3)

POINTS: dict[str, Point] = {
    "a": (sp.Integer(0), sp.Integer(0)),
    "b": (sp.Integer(1), sp.Integer(0)),
    "u30": (SQRT3 / 2, sp.Rational(1, 2)),
    "u60": (sp.Rational(1, 2), SQRT3 / 2),
    "u90": (sp.Integer(0), sp.Integer(1)),
    "l210": (1 - SQRT3 / 2, sp.Rational(-1, 2)),
    "l240": (sp.Rational(1, 2), -SQRT3 / 2),
    "l270": (sp.Integer(1), sp.Integer(-1)),
}

CYCLIC_ORDER = ("a", "l210", "l240", "l270", "b", "u30", "u60", "u90")
RA_EXPECTED = frozenset({"b", "u30", "u60", "u90", "l240"})
RB_EXPECTED = frozenset({"a", "l210", "l240", "l270", "u60"})
OLD_PAIR = ("u30", "u90")
MIRRORED_PAIR = ("l210", "l270")


def sqdist(p: Point, q: Point) -> Scalar:
    return sp.expand((p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2)


def orient(p: Point, q: Point, r: Point) -> Scalar:
    return sp.expand(
        (q[0] - p[0]) * (r[1] - p[1])
        - (q[1] - p[1]) * (r[0] - p[0])
    )


def _is_positive(value: Scalar) -> bool:
    verdict = sp.simplify(value) > 0
    return bool(verdict)


def _distance_class(center: str, radius_sq: Scalar) -> frozenset[str]:
    return frozenset(
        name
        for name, point in POINTS.items()
        if name != center and sp.simplify(sqdist(POINTS[center], point) - radius_sq) == 0
    )


def _multiplicities(center: str) -> Counter[str]:
    values = [
        sp.sstr(sp.simplify(sqdist(POINTS[center], point)))
        for name, point in POINTS.items()
        if name != center
    ]
    return Counter(values)


def check() -> dict[str, object]:
    assert len(set(POINTS.values())) == len(POINTS)

    turns = []
    for index, name in enumerate(CYCLIC_ORDER):
        p = POINTS[name]
        q = POINTS[CYCLIC_ORDER[(index + 1) % len(CYCLIC_ORDER)]]
        r = POINTS[CYCLIC_ORDER[(index + 2) % len(CYCLIC_ORDER)]]
        turn = sp.simplify(orient(p, q, r))
        assert _is_positive(turn), (name, turn)
        turns.append(sp.sstr(turn))

    ra = _distance_class("a", sp.Integer(1))
    rb = _distance_class("b", sp.Integer(1))
    assert ra == RA_EXPECTED
    assert rb == RB_EXPECTED
    assert ra & rb == {"u60", "l240"}

    ma = _multiplicities("a")
    mb = _multiplicities("b")
    assert ma["1"] == 5 and max(ma.values()) == 5
    assert mb["1"] == 5 and max(mb.values()) == 5
    assert sum(count >= 4 for count in ma.values()) == 1
    assert sum(count >= 4 for count in mb.values()) == 1

    q, w = OLD_PAIR
    x, y = MIRRORED_PAIR
    assert q in ra and w in ra and q not in rb and w not in rb
    assert x in rb and y in rb and x not in ra and y not in ra
    assert sqdist(POINTS["a"], POINTS[q]) == sqdist(POINTS["a"], POINTS[w])
    assert sqdist(POINTS["b"], POINTS[q]) != sqdist(POINTS["b"], POINTS[w])
    assert sqdist(POINTS["b"], POINTS[x]) == sqdist(POINTS["b"], POINTS[y])
    assert sqdist(POINTS["a"], POINTS[x]) != sqdist(POINTS["a"], POINTS[y])

    return {
        "status": "EXACT_TIER_A_WITNESS",
        "trust_boundary": (
            "exact Q(sqrt(3)) strict-convex crossed two-row witness; "
            "MEC/cap placement, all-center K4, and critical-shell fields omitted"
        ),
        "point_count": len(POINTS),
        "cyclic_order": list(CYCLIC_ORDER),
        "strict_turns": turns,
        "a_radius_one_class": sorted(ra),
        "b_radius_one_class": sorted(rb),
        "row_intersection": sorted(ra & rb),
        "old_pair": list(OLD_PAIR),
        "mirrored_pair": list(MIRRORED_PAIR),
        "a_squared_distance_multiplicities": dict(sorted(ma.items())),
        "b_squared_distance_multiplicities": dict(sorted(mb.items())),
        "first_missing_live_field": (
            "a cross-row or critical-row center z distinct from a with "
            "dist(z,q)=dist(z,w), plus its required cap-side placement"
        ),
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
