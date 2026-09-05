# Exact-card-13 tight four-circle countermodel

**Date:** 2026-09-04  
**Target under study:** `false_of_cardGeThirteenUncoveredThreeCenterPacket`

## Result

The attached verifier constructs a **fully rational, exact 13-point strictly
convex configuration** satisfying the visible four-circle tight-cover geometry
of the exact-card-13 uncovered branch.

The carrier is partitioned as

```text
A = {z} ∪ C0 ∪ C1 ∪ K,
```

where `C0`, `C1`, and `K` are pairwise disjoint exact four-point rows. A fourth
exact four-point row `L`, centered at the same carrier point as `K` but at a
different positive radius, satisfies

```text
L = {z} ∪ (C0 ∩ L) ∪ (C1 ∩ L),
|C0 ∩ L| = 2,
|C1 ∩ L| = 1.
```

The exact supports are

```text
C0@b0 = {O,l0,l1,x0}
C1@b1 = {b0,l2,x1,x2}
K@O   = {b1,k1,k2,k3}
L@O   = {z,l0,l1,l2}.
```

Thus the center-role leaf is

```text
A2 = O ∈ C0,
b0 ∈ C1,
b1 ∈ K.
```

All four displayed supports are the complete distance classes of their centers
in the 13-point carrier—there are no accidental fifth points.

The exact CCW hull order is

```text
O < x1 < x2 < l2 < l1 < z < b1 < k1 < k2 < b0 < k3 < x0 < l0.
```

The open boundary interval from `x2` to `k2` contains exactly

```text
l2, l1, z, b1, k1,
```

with A2-class color profile `L,L,L,K,K`. This gives the desired five-point
`3+2` candidate strict-interior profile and includes the uncovered point `z`.

There are also two distinct deletion views using opposite named A2 rows:

```text
z is omitted by C0,C1,K;
d=k2 is omitted by C0,C1,L.
```

Sources may be named `source0=l0 ∈ C0` and `source1=l2 ∈ C1`; the two source
rows mutually omit the other source.

## Exact claim boundary

This is a negative control for the **local four-circle, tight-cover,
strict-convexity, and candidate cap-order packet**. It shows that those facts
alone do not prove `False`.

It is not a full P97 counterexample. The construction does not encode:

- actual-blocker failure semantics for the two named sources or deletions;
- global K4 and deletion minimality;
- the `CriticalPairFrontier` proof that `d` is one of the designated frontier
  points;
- fully deletion-robust apex packets;
- the MEC/Moser-triangle equations and side predicates identifying the displayed
  five-point boundary interval with the source `S.oppInterior2`.

Therefore the exact-card-13 terminal must consume at least one of those omitted
global/provenance fields. A Kalmanson, three-fan, two-circle, or tight-cover
theorem using only the four exact rows and convex order would be false.

## Consequence for route selection

The most promising remaining routes are now:

1. derive positive cross-row incidence from **actual-blocker/deletion-failure**
   semantics;
2. retain the full seven-good-source system and force an additional blocker row
   or common deletion;
3. exploit the source MEC/cap packet in a way not implied by a mere five-point
   contiguous convex block;
4. build a faithful finite classifier only after those source fields are
   represented.

The local exact-card-13 geometry should no longer be treated as the likely
terminal by itself.


## Embedded exact verifier

The following source is identical to `cardge13_exact13_tight_four_circle_countermodel.py`.

Verifier SHA-256: `7347a531c2310701da72ee5745b708844285b34d21c553ab7bd53c6b226e6829`

```python
#!/usr/bin/env python3
"""
Exact rational negative control for the local exact-card-13 tight-cover residue
inside `false_of_cardGeThirteenUncoveredThreeCenterPacket`.

The verifier proves, using Fraction arithmetic only, that a 13-point carrier
can simultaneously have:

* all 13 points in strict convex position;
* two disjoint exact four-point classes K,L centered at one carrier point O,
  at distinct positive radii;
* two exact four-point rows C0,C1 centered at distinct carrier points b0,b1;
* C0,C1,K pairwise disjoint and A = {z} ∪ C0 ∪ C1 ∪ K;
* L = {z} ∪ two points of C0 ∪ one point of C1;
* center roles O ∈ C0, b0 ∈ C1, b1 ∈ K;
* five consecutive boundary points forming a candidate strict-cap interior
  block, with K/L color profile 2+3 and containing z;
* source roles s0 ∈ C0 and s1 ∈ C1 with mutual omission;
* two distinct deletion views:
    - z is omitted by C0,C1,K;
    - d ∈ K is omitted by C0,C1,L.

This is deliberately NOT a `CounterexampleData` model. It does not encode
actual-blocker failure semantics, global K4/minimality, the CriticalPairFrontier
identity of d, or the MEC/Moser-triangle conditions identifying the candidate
five-point boundary block with `S.oppInterior2`.
"""

from __future__ import annotations

from fractions import Fraction as Q
import json
from typing import Iterable

Point = tuple[Q, Q]


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def rotate(v: Point, t: Q) -> Point:
    """Rational rotation with t = tan(theta / 2)."""
    c = (1 - t * t) / (1 + t * t)
    s = 2 * t / (1 + t * t)
    return (c * v[0] - s * v[1], s * v[0] + c * v[1])


def dist_sq(a: Point, b: Point) -> Q:
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    return dx * dx + dy * dy


def orient(a: Point, b: Point, c: Point) -> Q:
    return (
        (b[0] - a[0]) * (c[1] - a[1])
        - (b[1] - a[1]) * (c[0] - a[0])
    )


def encode_q(x: Q) -> str:
    if x.denominator == 1:
        return str(x.numerator)
    return f"{x.numerator}/{x.denominator}"


def encode_point(p: Point) -> list[str]:
    return [encode_q(p[0]), encode_q(p[1])]


def monotone_hull(points: list[Point]) -> list[int]:
    ordered = sorted(range(len(points)), key=lambda i: points[i])

    def half(indices: Iterable[int]) -> list[int]:
        hull: list[int] = []
        for i in indices:
            while (
                len(hull) >= 2
                and orient(points[hull[-2]], points[hull[-1]], points[i]) <= 0
            ):
                hull.pop()
            hull.append(i)
        return hull

    lower = half(ordered)
    upper = half(reversed(ordered))
    return lower[:-1] + upper[:-1]


def exact_distance_class(
    labels: list[str],
    points: dict[str, Point],
    center: str,
    representative: str,
) -> set[str]:
    radius_sq = dist_sq(points[center], points[representative])
    return {
        label
        for label in labels
        if dist_sq(points[center], points[label]) == radius_sq
    }


def main() -> dict[str, object]:
    O: Point = (Q(0), Q(0))
    r = Q(29, 20)
    t_hinge = Q(7, 12)
    c_hinge = (1 - t_hinge * t_hinge) / (1 + t_hinge * t_hinge)
    s_hinge = 2 * t_hinge / (1 + t_hinge * t_hinge)
    radius_L = 2 * r * c_hinge

    b0: Point = (r, Q(0))
    l0: Point = (radius_L * c_hinge, radius_L * s_hinge)
    l1: Point = (radius_L * c_hinge, -radius_L * s_hinge)

    t_l2 = Q(-16, 19)
    c_l2 = (1 - t_l2 * t_l2) / (1 + t_l2 * t_l2)
    s_l2 = 2 * t_l2 / (1 + t_l2 * t_l2)
    l2: Point = (radius_L * c_l2, radius_L * s_l2)

    b1_x = Q(43, 40)
    dx = l2[0] - b0[0]
    dy = l2[1] - b0[1]
    rhs = radius_L * radius_L - r * r
    b1_y = (rhs / 2 - b1_x * dx) / dy
    b1: Point = (b1_x, b1_y)

    x0 = add(b0, rotate(sub(O, b0), Q(-29, 40)))
    base_b1 = sub(b0, b1)
    x1 = add(b1, rotate(base_b1, Q(23, 15)))
    x2 = add(b1, rotate(base_b1, Q(23, 11)))

    k1 = rotate(b1, Q(3, 25))
    k2 = rotate(b1, Q(7, 32))
    k3 = rotate(b1, Q(17, 29))

    t_z = Q(-8, 17)
    c_z = (1 - t_z * t_z) / (1 + t_z * t_z)
    s_z = 2 * t_z / (1 + t_z * t_z)
    z: Point = (radius_L * c_z, radius_L * s_z)

    labels = [
        "O", "l0", "l1", "x0", "b0", "l2", "x1", "x2", "b1",
        "k1", "k2", "k3", "z",
    ]
    point_list = [O, l0, l1, x0, b0, l2, x1, x2, b1, k1, k2, k3, z]
    points = dict(zip(labels, point_list, strict=True))

    C0 = {"O", "l0", "l1", "x0"}
    C1 = {"b0", "l2", "x1", "x2"}
    K = {"b1", "k1", "k2", "k3"}
    L = {"z", "l0", "l1", "l2"}

    assert C0.isdisjoint(C1)
    assert C0.isdisjoint(K)
    assert C1.isdisjoint(K)
    assert ({"z"} | C0 | C1 | K) == set(labels)
    assert len({"z"} | C0 | C1 | K) == 13
    assert K.isdisjoint(L)
    assert C0 & L == {"l0", "l1"}
    assert C1 & L == {"l2"}
    assert L == {"z"} | (C0 & L) | (C1 & L)

    assert "O" in C0
    assert "b0" in C1
    assert "b1" in K
    assert "b0" not in C0
    assert "b1" not in C1
    assert "O" not in K
    assert "O" not in L

    assert exact_distance_class(labels, points, "b0", "O") == C0
    assert exact_distance_class(labels, points, "b1", "b0") == C1
    assert exact_distance_class(labels, points, "O", "b1") == K
    assert exact_distance_class(labels, points, "O", "z") == L

    radius_K_sq = dist_sq(O, b1)
    radius_L_sq = dist_sq(O, z)
    assert 0 < radius_K_sq
    assert 0 < radius_L_sq
    assert radius_K_sq != radius_L_sq

    multiplicities: dict[Q, int] = {}
    for label in labels:
        if label == "O":
            continue
        d2 = dist_sq(O, points[label])
        multiplicities[d2] = multiplicities.get(d2, 0) + 1
    assert max(multiplicities.values()) == 4

    hull = monotone_hull(point_list)
    expected_hull = [
        "O", "x1", "x2", "l2", "l1", "z", "b1", "k1", "k2",
        "b0", "k3", "x0", "l0",
    ]
    hull_labels = [labels[i] for i in hull]
    assert hull_labels == expected_hull
    assert len(hull) == 13

    edge_side_slacks: list[Q] = []
    for i, a_label in enumerate(expected_hull):
        b_label = expected_hull[(i + 1) % len(expected_hull)]
        for p_label in expected_hull:
            if p_label in {a_label, b_label}:
                continue
            slack = orient(points[a_label], points[b_label], points[p_label])
            assert slack > 0
            edge_side_slacks.append(slack)

    i_x2 = expected_hull.index("x2")
    i_k2 = expected_hull.index("k2")
    candidate_interior = expected_hull[i_x2 + 1 : i_k2]
    assert candidate_interior == ["l2", "l1", "z", "b1", "k1"]
    assert len(set(candidate_interior) & K) == 2
    assert len(set(candidate_interior) & L) == 3
    assert "z" in candidate_interior

    source0 = "l0"
    source1 = "l2"
    assert source0 in C0 and source1 in C1
    assert source0 not in C1 and source1 not in C0

    assert "z" not in C0 and "z" not in C1 and "z" not in K

    d = "k2"
    assert d != "z"
    assert d in K
    assert d not in C0 and d not in C1 and d not in L

    return {
        "schema": "cardge13-exact13-tight-four-circle-countermodel/v1",
        "claim_boundary": (
            "Exact rational model of the local four-circle/tight-cover/"
            "candidate-cap-order packet; not a CounterexampleData or "
            "SurplusCapPacket realization."
        ),
        "carrier_card": len(labels),
        "coordinates": {label: encode_point(points[label]) for label in labels},
        "hull_order_ccw": expected_hull,
        "candidate_oppInterior2": candidate_interior,
        "supports": {
            "C0_at_b0": sorted(C0),
            "C1_at_b1": sorted(C1),
            "K_at_O": sorted(K),
            "L_at_O": sorted(L),
        },
        "center_roles": {
            "A2": "O",
            "blocker0": "b0",
            "blocker1": "b1",
            "A2_in": "C0",
            "blocker0_in": "C1",
            "blocker1_in": "K",
        },
        "source_roles": {"source0": source0, "source1": source1},
        "deletion_views": {
            "z": {"point": "z", "surviving_rows": ["C0", "C1", "K"]},
            "d": {"point": d, "surviving_rows": ["C0", "C1", "L"]},
        },
        "intersection_matrix": {
            "C0_C1": len(C0 & C1),
            "C0_K": len(C0 & K),
            "C1_K": len(C1 & K),
            "K_L": len(K & L),
            "C0_L": len(C0 & L),
            "C1_L": len(C1 & L),
        },
        "minimum_exact_edge_side_slack": encode_q(min(edge_side_slacks)),
        "verified": {
            "strict_convex_13_point_carrier": True,
            "four_exact_card_four_distance_classes": True,
            "two_distinct_positive_A2_radii": True,
            "no_five_point_positive_distance_class_at_A2": True,
            "tight_cover_C0_C1_K_plus_z": True,
            "pairwise_disjoint_C0_C1_K": True,
            "opposite_class_trace_2_plus_1_plus_z": True,
            "candidate_interior_K_L_profile_2_plus_3": True,
            "two_distinct_opposite_named_A2_deletion_views": True,
        },
        "not_encoded": [
            "actual-blocker failure semantics for source0/source1/z/d",
            "global CounterexampleData.K4 and minimality",
            "CriticalPairFrontier proof that d is one of its frontier pair",
            "fully deletion-robust first/second apex packets",
            "MEC/Moser-triangle equations and cap-side predicates identifying "
            "the candidate interval with S.oppInterior2",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, sort_keys=True))
```
