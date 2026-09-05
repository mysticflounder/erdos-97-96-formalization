# `cardGeThirteen`: adjacent surplus-interior K4 obstruction

Date: 2026-09-04

## Fixed source-like cell

Use the direct exact-thirteen second-opposite order

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7]
```

and the five exact rows

```text
C0@11 = {1,4,5,7}
C1@5  = {0,3,6,11}
K@0   = {2,8,9,10}
L@0   = {4,7,11,12}
T@1   = {3,6,7,8}.
```

The rows satisfy the tight-cover/two-A2-class/first-apex incidence surface used
in the exact-card-13 campaign. The claim below is intentionally fixed-cell;
source occurrence remains a separate theorem.

## Exact K4 obstruction

Global K4 at the adjacent surplus-interior labels `3` and `4` would provide
one selected four-row at each center.

At center `3`, all 495 supports but two are killed by one or two exact strict
Kalmanson cancellations. The residual supports are

```text
{0,1,7,9}
{0,1,7,10}.
```

Center `4` has the same two-support residual domain.

All four residual support pairs die by a single strict Kalmanson inequality:

```text
[
  {
    "support3": [0, 1, 7, 9],
    "support4": [0, 1, 7, 9],
    "form": [9, 1, 3, 4, "outer"]
  },
  {
    "support3": [0, 1, 7, 9],
    "support4": [0, 1, 7, 10],
    "form": [1, 3, 4, 0, "adjacent"]
  },
  {
    "support3": [0, 1, 7, 10],
    "support4": [0, 1, 7, 9],
    "form": [1, 3, 4, 0, "adjacent"]
  },
  {
    "support3": [0, 1, 7, 10],
    "support4": [0, 1, 7, 10],
    "form": [10, 1, 3, 4, "outer"]
  }
]
```

Therefore the two source-canonical K4 rows cannot coexist. No triangle
inequality, floating-point computation, planar solver, or nonlinear theorem is
used.

## Formalization shape

A compact fixed-cell Lean terminal should contain:

```lean
center3_support_normalizer :
  arbitrary row at 3 -> support = {0,1,7,9} or support = {0,1,7,10}

center4_support_normalizer :
  arbitrary row at 4 -> support = {0,1,7,9} or support = {0,1,7,10}

false_of_center3_center4_normal_rows :
  one of two -> one of two -> False
```

The normalizers can use a transparent finite support classifier and the
existing weighted-Kalmanson endpoint. The final dispatcher has only four
one-form leaves.

This cell is useful because labels `3` and `4` are canonical members of the
surplus-interior block in both the source profile and its reflected boundary
order. A complete exact-tight source classifier should test whether a
symmetry-equivalent adjacent surplus pair closes every cell.

## Exact verification

```text
center-3 supports checked: 495
center-3 supports killed:  493
center-4 supports checked: 495
center-4 supports killed:  493
joint residual pairs:        4
joint certificate length:    1 in every case
```

Verifier SHA-256:

```text
fdbf13ae255145041558afdd3808fcab0024cb18836d4e773eef81f1b78b95d6
```

Canonical payload SHA-256:

```text
48de500f9729a860f9d71549268798621ab591ff03f03f99273238092833b8e8
```


---

## Embedded exact verifier

```python
#!/usr/bin/env python3
"""Exact strict-Kalmanson verifier for one source-like Fin13 tight cell.

The fixed selected rows are:
  C0@11 = {1,4,5,7}
  C1@5  = {0,3,6,11}
  K@0   = {2,8,9,10}
  L@0   = {4,7,11,12}
  T@1   = {3,6,7,8}

The boundary order is the DR exact-thirteen direct second-opposite order:
  [2,8,9,10,11,12,1,3,4,5,0,6,7].

The verifier proves that arbitrary selected four-support equal-distance rows at
both surplus-interior labels 3 and 4 cannot coexist.  It uses exact integer
quotients of the distance-edge variables and searches only cancellations of
one or two strict Kalmanson inequalities for the individual row domains, then
one strict Kalmanson inequality for each of the four residual support pairs.

This is a fixed-cell certificate. It is not a complete source-cell classifier,
a Euclidean realization, or closure of the cardGeThirteen branch.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from itertools import combinations
import hashlib
import json

N = 13
ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
FIXED_ROWS = (
    (11, frozenset({1, 4, 5, 7}), "C0"),
    (5, frozenset({0, 3, 6, 11}), "C1"),
    (0, frozenset({2, 8, 9, 10}), "K"),
    (0, frozenset({4, 7, 11, 12}), "L"),
    (1, frozenset({3, 6, 7, 8}), "T"),
)
CENTER3_DOMAIN = (
    frozenset({0, 1, 7, 9}),
    frozenset({0, 1, 7, 10}),
)
CENTER4_DOMAIN = CENTER3_DOMAIN


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("distance edge needs distinct endpoints")
    return (a, b) if a < b else (b, a)


EDGES = tuple(combinations(range(N), 2))
EDGE_INDEX = {value: index for index, value in enumerate(EDGES)}


class UnionFind:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, value: int) -> int:
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def quotient(rows) -> UnionFind:
    uf = UnionFind(len(EDGES))
    for center, support, _name in rows:
        points = sorted(support)
        base = EDGE_INDEX[edge(center, points[0])]
        for point in points[1:]:
            uf.union(base, EDGE_INDEX[edge(center, point)])
    return uf


SparseVector = tuple[tuple[int, int], ...]
KTag = tuple[int, int, int, int, str]


def add_vectors(left: SparseVector, right: SparseVector) -> SparseVector:
    values: dict[int, int] = defaultdict(int)
    for key, coefficient in left:
        values[key] += coefficient
    for key, coefficient in right:
        values[key] += coefficient
    return tuple(sorted((key, value) for key, value in values.items() if value))


def neg_vector(vector: SparseVector) -> SparseVector:
    return tuple((key, -value) for key, value in vector)


def kalmanson_forms():
    forms = []
    for ia, ib, ic, id_ in combinations(range(N), 4):
        a, b, c, d = (ORDER[ia], ORDER[ib], ORDER[ic], ORDER[id_])
        forms.append(
            (
                (a, b, c, d, "adjacent"),
                ((edge(a, c), 1), (edge(b, d), 1),
                 (edge(a, b), -1), (edge(c, d), -1)),
            )
        )
        forms.append(
            (
                (a, b, c, d, "outer"),
                ((edge(a, c), 1), (edge(b, d), 1),
                 (edge(a, d), -1), (edge(b, c), -1)),
            )
        )
    return tuple(forms)


KALMANSON_FORMS = kalmanson_forms()


def form_vector(uf: UnionFind, terms) -> SparseVector:
    values: dict[int, int] = defaultdict(int)
    for raw_edge, coefficient in terms:
        values[uf.find(EDGE_INDEX[raw_edge])] += coefficient
    return tuple(sorted((key, value) for key, value in values.items() if value))


def shortest_one_or_two(rows):
    uf = quotient(rows)
    by_vector: dict[SparseVector, KTag] = {}
    for tag, terms in KALMANSON_FORMS:
        vector = form_vector(uf, terms)
        if not vector:
            return (tag,)
        by_vector.setdefault(vector, tag)
    for vector, tag in by_vector.items():
        opposite = neg_vector(vector)
        if opposite in by_vector:
            return tuple(sorted((tag, by_vector[opposite]), key=str))
    return None


def row_domain(center: int):
    killed = {}
    survivors = []
    points = [point for point in range(N) if point != center]
    for support_tuple in combinations(points, 4):
        support = frozenset(support_tuple)
        certificate = shortest_one_or_two(
            FIXED_ROWS + ((center, support, f"R{center}"),)
        )
        if certificate is None:
            survivors.append(support)
        else:
            killed[support] = certificate
    return killed, tuple(survivors)


def verify_joint_one_form(support3, support4):
    uf = quotient(
        FIXED_ROWS
        + ((3, support3, "R3"),)
        + ((4, support4, "R4"),)
    )
    for tag, terms in KALMANSON_FORMS:
        if not form_vector(uf, terms):
            return tag
    raise AssertionError((support3, support4))


def main() -> dict[str, object]:
    killed3, domain3 = row_domain(3)
    killed4, domain4 = row_domain(4)

    assert set(domain3) == set(CENTER3_DOMAIN)
    assert set(domain4) == set(CENTER4_DOMAIN)
    assert len(killed3) == len(killed4) == 493

    joint = {}
    for support3 in domain3:
        for support4 in domain4:
            joint[(tuple(sorted(support3)), tuple(sorted(support4)))] = (
                verify_joint_one_form(support3, support4)
            )

    result = {
        "schema": "cardge13-exact13-surplus-pair-k4/v1",
        "order": list(ORDER),
        "fixed_rows": [
            {"center": center, "support": sorted(support), "name": name}
            for center, support, name in FIXED_ROWS
        ],
        "center3": {
            "candidate_support_count": 495,
            "killed_support_count": len(killed3),
            "certificate_length_counts": dict(
                sorted(Counter(map(len, killed3.values())).items())
            ),
            "normal_domain": [sorted(support) for support in domain3],
        },
        "center4": {
            "candidate_support_count": 495,
            "killed_support_count": len(killed4),
            "certificate_length_counts": dict(
                sorted(Counter(map(len, killed4.values())).items())
            ),
            "normal_domain": [sorted(support) for support in domain4],
        },
        "joint_one_form_routes": [
            {
                "support3": list(support3),
                "support4": list(support4),
                "form": list(tag),
            }
            for (support3, support4), tag in sorted(joint.items())
        ],
        "triangle_inequalities_used": False,
        "conclusion": "no simultaneous selected four-rows at centers 3 and 4",
    }
    payload = json.dumps(result, sort_keys=True, separators=(",", ":")).encode()
    result["canonical_payload_sha256_without_this_field"] = hashlib.sha256(payload).hexdigest()
    return result


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, sort_keys=True))
```
