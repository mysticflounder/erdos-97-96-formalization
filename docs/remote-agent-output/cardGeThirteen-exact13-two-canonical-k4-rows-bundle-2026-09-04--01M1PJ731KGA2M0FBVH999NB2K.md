# `cardGeThirteen`: two canonical global-K4 rows cannot coexist

Date: 2026-09-04

## Exact fixed-cell result

For the direct DR order

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7],
```

fix only four source rows:

```text
C0@6 = {0,1,4,9}
K@0  = {2,8,10,11}
C1@7 = {3,5,6,12}
T@1  = {0,6,7,8}.
```

Then no selected four-row can exist simultaneously at:

```text
center 2 = the canonical surplus apex A3,
center 5 = a canonical surplus-interior label.
```

The proof uses strict Kalmanson only.

## Row-domain reductions

At center `2`, 18 one-form pair no-goods reduce all 495 supports to exactly 27:

```text
{7,a,b,c},
a ∈ {1,4,9},
b ∈ {3,5,12},
c ∈ {8,10,11}.
```

At center `5`, 27 one/two-form pair no-goods reduce all 495 supports to 16 explicit supports.

Every one of the remaining

```text
27 × 16 = 432
```

support pairs is contradicted by at most three Kalmanson forms:

```text
144 pairs: one form
176 pairs: two forms
112 pairs: three forms
```

There are 63 unique cancellation tuples. No triangle inequality or nonlinear geometry is used.

## Significance

The previous shared-pair checkpoint selected three additional global rows and then challenged one center. This theorem needs none of those choices. The tight-cover rows plus the first-apex row already make two source-canonical K4 obligations incompatible.

A live source adapter for this fixed DR cell needs only:

1. identification of `C0`, `K`, `C1`, and `T` with the four displayed raw supports;
2. `D.K4` at the carrier points represented by raw labels `2` and `5`;
3. direct/mirror cell coverage.

## Lean architecture

```lean
center2_support_domain :
  arbitrary four-support at 2 → one of 27 supports

center5_support_domain :
  arbitrary four-support at 5 → one of 16 supports

false_of_center2_center5_normal_supports :
  one of 27 → one of 16 → False
```

The first two are pair-bank dispatchers. The final theorem can use an ordinary kernel classifier over 432 pairs or a 63-entry data table feeding the existing weighted-Kalmanson endpoint.

This is still a fixed-cell theorem until finite source coverage is proved.

## Verification

```text
center-2 candidate supports: 495
center-2 normal supports:      27
center-5 candidate supports: 495
center-5 normal supports:      16
joint normal pairs:           432
unique cancellation tuples:    63
```

Verifier SHA-256:

```text
3e83d41122beb4b16799356ec701bd7c7c8850e22c0d587ed78fe607128edd10
```

Canonical payload SHA-256:

```text
c00b213fbcce3737b39e68f16e168e3d1e14a9900d4d3e62ec45d7911ae1f77c
```

---

## Embedded exact verifier

```python
#!/usr/bin/env python3
"""Exact verifier for a two-canonical-global-K4 obstruction in one Fin13 cell.

Four source rows are fixed:
  C0@6={0,1,4,9},
  K@0={2,8,10,11},
  C1@7={3,5,6,12},
  T@1={0,6,7,8}.

No selected four-row can exist simultaneously at canonical centers 2 and 5
while all strict Kalmanson inequalities hold in the direct DR order.

All checks use exact integer arithmetic and the Python standard library.
This is a fixed-cell certificate, not a complete CardGeThirteen classifier.
"""

from __future__ import annotations

from collections import defaultdict
from itertools import combinations
import hashlib
import json

N = 13
ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
BASE_ROWS = ((6, (0, 1, 4, 9), 'C0'), (0, (2, 8, 10, 11), 'K'), (7, (3, 5, 6, 12), 'C1'), (1, (0, 6, 7, 8), 'T'))
CENTER2_DOMAIN = ((1, 3, 7, 8), (1, 3, 7, 10), (1, 3, 7, 11), (1, 5, 7, 8), (1, 5, 7, 10), (1, 5, 7, 11), (1, 7, 8, 12), (1, 7, 10, 12), (1, 7, 11, 12), (3, 4, 7, 8), (3, 4, 7, 10), (3, 4, 7, 11), (4, 5, 7, 8), (4, 5, 7, 10), (4, 5, 7, 11), (4, 7, 8, 12), (4, 7, 10, 12), (4, 7, 11, 12), (3, 7, 8, 9), (3, 7, 9, 10), (3, 7, 9, 11), (5, 7, 8, 9), (5, 7, 9, 10), (5, 7, 9, 11), (7, 8, 9, 12), (7, 9, 10, 12), (7, 9, 11, 12))
CENTER5_DOMAIN = ((0, 3, 4, 10), (0, 3, 4, 11), (0, 3, 9, 10), (0, 3, 9, 11), (0, 4, 10, 12), (0, 4, 11, 12), (0, 9, 10, 12), (0, 9, 11, 12), (3, 6, 9, 10), (3, 6, 9, 11), (4, 7, 10, 12), (4, 7, 11, 12), (6, 9, 10, 12), (6, 9, 11, 12), (7, 9, 10, 12), (7, 9, 11, 12))
CENTER2_PAIR_CERTIFICATES = {(0, 1): (((2, 1, 0, 6), 'adjacent'),), (0, 4): (((2, 4, 0, 6), 'adjacent'),), (0, 6): (((2, 1, 0, 6), 'outer'),), (0, 7): (((2, 1, 0, 7), 'outer'),), (0, 9): (((2, 9, 0, 6), 'adjacent'),), (1, 4): (((2, 1, 4, 6), 'adjacent'),), (1, 9): (((2, 9, 1, 6), 'adjacent'),), (3, 5): (((2, 3, 5, 7), 'adjacent'),), (3, 6): (((2, 3, 6, 7), 'adjacent'),), (3, 12): (((2, 12, 3, 7), 'adjacent'),), (4, 9): (((2, 9, 4, 6), 'adjacent'),), (5, 6): (((2, 5, 6, 7), 'adjacent'),), (5, 12): (((2, 12, 5, 7), 'adjacent'),), (6, 7): (((2, 1, 6, 7), 'outer'),), (6, 12): (((2, 12, 6, 7), 'adjacent'),), (8, 10): (((2, 8, 10, 0), 'adjacent'),), (8, 11): (((2, 8, 11, 0), 'adjacent'),), (10, 11): (((2, 10, 11, 0), 'adjacent'),)}
CENTER5_PAIR_CERTIFICATES = {(0, 2): (((2, 1, 5, 0), 'adjacent'), ((2, 8, 1, 0), 'outer')), (0, 6): (((1, 5, 0, 6), 'outer'),), (0, 7): (((1, 5, 0, 7), 'outer'),), (0, 8): (((8, 1, 5, 0), 'adjacent'),), (1, 2): (((2, 1, 5, 0), 'outer'), ((8, 1, 0, 6), 'adjacent')), (1, 4): (((1, 4, 5, 6), 'outer'),), (1, 6): (((1, 5, 0, 6), 'adjacent'),), (1, 7): (((1, 5, 0, 6), 'adjacent'), ((1, 5, 6, 7), 'outer')), (1, 8): (((8, 1, 0, 6), 'adjacent'), ((8, 1, 5, 0), 'outer')), (1, 9): (((9, 1, 5, 6), 'outer'),), (1, 10): (((10, 1, 5, 0), 'outer'), ((8, 1, 0, 6), 'adjacent')), (1, 11): (((11, 1, 5, 0), 'outer'), ((8, 1, 0, 6), 'adjacent')), (2, 6): (((2, 1, 5, 6), 'adjacent'), ((2, 8, 1, 0), 'outer')), (2, 7): (((2, 1, 5, 7), 'adjacent'), ((2, 8, 1, 0), 'outer')), (2, 8): (((2, 8, 5, 0), 'outer'),), (2, 10): (((2, 10, 5, 0), 'outer'),), (2, 11): (((2, 11, 5, 0), 'outer'),), (3, 7): (((1, 3, 5, 7), 'outer'), ((1, 5, 6, 7), 'adjacent')), (3, 12): (((12, 3, 5, 7), 'outer'),), (4, 6): (((1, 4, 5, 6), 'outer'), ((1, 5, 0, 6), 'adjacent')), (4, 9): (((9, 4, 5, 6), 'outer'),), (6, 7): (((1, 5, 6, 7), 'outer'),), (6, 8): (((8, 1, 5, 6), 'adjacent'),), (7, 8): (((8, 1, 5, 7), 'adjacent'),), (8, 10): (((8, 10, 5, 0), 'outer'),), (8, 11): (((8, 11, 5, 0), 'outer'),), (10, 11): (((10, 11, 5, 0), 'outer'),)}
JOINT_CERTIFICATES = ((((2, 10, 12, 5), 'adjacent'),), (((2, 10, 3, 5), 'adjacent'),), (((2, 10, 4, 5), 'adjacent'),), (((2, 11, 12, 5), 'adjacent'),), (((2, 11, 3, 5), 'adjacent'),), (((2, 11, 4, 5), 'adjacent'),), (((2, 12, 4, 5), 'adjacent'),), (((2, 12, 5, 7), 'outer'),), (((2, 3, 4, 5), 'adjacent'),), (((2, 9, 10, 5), 'adjacent'),), (((2, 9, 11, 5), 'adjacent'),), (((2, 9, 12, 5), 'adjacent'),), (((2, 9, 3, 5), 'adjacent'),), (((2, 10, 1, 5), 'adjacent'), ((1, 4, 5, 6), 'outer')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 3, 5), 'adjacent')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 4, 5), 'adjacent')), (((2, 10, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 10, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 10, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 10, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 11, 1, 5), 'adjacent'), ((1, 4, 5, 6), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 11, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 11, 3, 5), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 11, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 11, 4, 5), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 12, 5), 'adjacent')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 3, 5), 'adjacent')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 4, 5), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 3, 5), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 4, 5), 'adjacent')), (((2, 9, 10, 5), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 9, 10, 5), 'adjacent'), ((2, 10, 11, 0), 'adjacent')), (((2, 9, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 9, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 9, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 9, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 1, 5), 'adjacent'), ((1, 4, 5, 6), 'outer')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 10, 11, 0), 'adjacent'), ((2, 11, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 11, 1, 5), 'adjacent'), ((10, 11, 5, 0), 'outer'), ((1, 4, 5, 6), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((10, 11, 5, 0), 'outer'), ((12, 3, 5, 7), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 11, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 11, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent'), ((10, 11, 5, 0), 'outer')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 1, 5), 'adjacent'), ((1, 4, 5, 6), 'outer')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 8, 10, 0), 'adjacent'), ((2, 10, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 1, 5), 'adjacent'), ((1, 4, 5, 6), 'outer')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((12, 3, 5, 7), 'outer')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((2, 12, 3, 7), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 12, 5), 'adjacent'), ((2, 12, 5, 7), 'adjacent')), (((2, 8, 11, 0), 'adjacent'), ((2, 11, 3, 5), 'adjacent'), ((2, 3, 5, 7), 'adjacent')), (((2, 8, 9, 0), 'adjacent'), ((9, 10, 0, 6), 'outer'), ((10, 4, 5, 6), 'outer')), (((2, 8, 9, 0), 'adjacent'), ((9, 11, 0, 6), 'outer'), ((11, 4, 5, 6), 'outer')))
JOINT_CERTIFICATE_MATRIX = ((30, 33, 30, 33, 53, 58, 53, 58, 30, 33, 53, 58, 53, 58, 53, 58), (1, 15, 1, 15, 18, 43, 18, 43, 1, 15, 18, 43, 18, 43, 18, 43), (26, 4, 26, 4, 48, 24, 48, 24, 26, 4, 48, 24, 48, 24, 48, 24), (51, 56, 55, 60, 54, 59, 54, 59, 55, 60, 7, 7, 54, 59, 7, 7), (13, 41, 20, 45, 19, 44, 19, 44, 20, 45, 7, 7, 19, 44, 7, 7), (46, 21, 50, 27, 49, 25, 49, 25, 50, 27, 7, 7, 49, 25, 7, 7), (52, 57, 52, 57, 29, 32, 29, 32, 52, 57, 29, 32, 29, 32, 29, 32), (17, 42, 17, 42, 0, 14, 0, 14, 17, 42, 0, 14, 0, 14, 0, 14), (47, 23, 47, 23, 22, 3, 22, 3, 47, 23, 22, 3, 22, 3, 22, 3), (8, 8, 30, 33, 31, 34, 53, 58, 30, 33, 31, 34, 53, 58, 53, 58), (1, 8, 1, 15, 2, 16, 18, 43, 1, 15, 2, 16, 18, 43, 18, 43), (8, 4, 26, 4, 28, 5, 48, 24, 26, 4, 28, 5, 48, 24, 48, 24), (31, 34, 55, 60, 31, 34, 54, 59, 55, 60, 7, 7, 54, 59, 7, 7), (2, 16, 20, 45, 2, 16, 19, 44, 20, 45, 2, 7, 19, 44, 7, 7), (28, 5, 50, 27, 28, 5, 49, 25, 50, 27, 7, 5, 49, 25, 7, 7), (31, 34, 52, 57, 6, 6, 29, 32, 52, 57, 6, 6, 29, 32, 29, 32), (2, 16, 17, 42, 0, 6, 0, 14, 17, 42, 0, 6, 0, 14, 0, 14), (28, 5, 47, 23, 6, 3, 22, 3, 47, 23, 6, 3, 22, 3, 22, 3), (30, 33, 12, 12, 61, 62, 38, 38, 12, 12, 61, 62, 38, 38, 38, 38), (1, 15, 9, 12, 18, 43, 9, 35, 9, 12, 18, 43, 9, 35, 9, 35), (26, 4, 12, 10, 48, 24, 36, 10, 12, 10, 48, 24, 36, 10, 36, 10), (61, 62, 40, 40, 61, 62, 39, 39, 40, 40, 7, 7, 39, 39, 7, 7), (20, 45, 9, 35, 19, 44, 9, 35, 9, 35, 7, 7, 9, 35, 9, 7), (50, 27, 36, 10, 49, 25, 36, 10, 36, 10, 7, 7, 36, 10, 7, 10), (61, 62, 37, 37, 29, 32, 11, 11, 37, 37, 29, 32, 11, 11, 11, 11), (17, 42, 9, 35, 0, 14, 9, 11, 9, 35, 0, 14, 9, 11, 9, 11), (47, 23, 36, 10, 22, 3, 11, 10, 36, 10, 22, 3, 11, 10, 11, 10))


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


def add_row_equalities(uf, center, support) -> None:
    points = sorted(support)
    base = EDGE_INDEX[edge(center, points[0])]
    for point in points[1:]:
        uf.union(base, EDGE_INDEX[edge(center, point)])


def quotient_for_rows(rows) -> UnionFind:
    uf = UnionFind(len(EDGES))
    for center, support, _name in rows:
        add_row_equalities(uf, center, support)
    return uf


SparseVector = tuple[tuple[int, int], ...]


def add_vectors(left: SparseVector, right: SparseVector) -> SparseVector:
    values: dict[int, int] = defaultdict(int)
    for key, coefficient in left:
        values[key] += coefficient
    for key, coefficient in right:
        values[key] += coefficient
    return tuple(sorted((key, value) for key, value in values.items() if value))


def form_vector(tag, uf: UnionFind) -> SparseVector:
    (a, b, c, d), kind = tag
    positions = {value: index for index, value in enumerate(ORDER)}
    assert positions[a] < positions[b] < positions[c] < positions[d]
    terms = [(edge(a, c), 1), (edge(b, d), 1)]
    if kind == "adjacent":
        terms.extend(((edge(a, b), -1), (edge(c, d), -1)))
    elif kind == "outer":
        terms.extend(((edge(a, d), -1), (edge(b, c), -1)))
    else:
        raise ValueError(kind)
    values: dict[int, int] = defaultdict(int)
    for raw_edge, coefficient in terms:
        values[uf.find(EDGE_INDEX[raw_edge])] += coefficient
    return tuple(sorted((key, value) for key, value in values.items() if value))


def verify_certificate(rows, certificate) -> None:
    uf = quotient_for_rows(rows)
    total: SparseVector = ()
    for tag in certificate:
        total = add_vectors(total, form_vector(tag, uf))
    assert not total, (rows, certificate, total)


def contains_certified_pair(support, bank) -> bool:
    return any(frozenset(pair) <= support for pair in bank)


def main() -> dict[str, object]:
    base_rows = tuple(
        (center, frozenset(support), name)
        for center, support, name in BASE_ROWS
    )

    for pair, certificate in CENTER2_PAIR_CERTIFICATES.items():
        verify_certificate(
            base_rows + ((2, frozenset(pair), "center2_pair"),),
            certificate,
        )
    for pair, certificate in CENTER5_PAIR_CERTIFICATES.items():
        verify_certificate(
            base_rows + ((5, frozenset(pair), "center5_pair"),),
            certificate,
        )

    center2_domain = set(map(frozenset, CENTER2_DOMAIN))
    center5_domain = set(map(frozenset, CENTER5_DOMAIN))

    for support_tuple in combinations([x for x in range(N) if x != 2], 4):
        support = frozenset(support_tuple)
        assert (
            contains_certified_pair(support, CENTER2_PAIR_CERTIFICATES)
            or support in center2_domain
        )
    for support_tuple in combinations([x for x in range(N) if x != 5], 4):
        support = frozenset(support_tuple)
        assert (
            contains_certified_pair(support, CENTER5_PAIR_CERTIFICATES)
            or support in center5_domain
        )

    joint_length_counts: dict[str, int] = defaultdict(int)
    for i, support2 in enumerate(CENTER2_DOMAIN):
        for j, support5 in enumerate(CENTER5_DOMAIN):
            certificate = JOINT_CERTIFICATES[JOINT_CERTIFICATE_MATRIX[i][j]]
            verify_certificate(
                base_rows
                + ((2, frozenset(support2), "R2"),)
                + ((5, frozenset(support5), "R5"),),
                certificate,
            )
            joint_length_counts[str(len(certificate))] += 1

    assert dict(sorted(joint_length_counts.items())) == {
        "1": 144,
        "2": 176,
        "3": 112,
    }

    result = {
        "schema": "cardge13-exact13-two-canonical-k4-rows/v1",
        "order": list(ORDER),
        "center2": {
            "candidate_support_count": 495,
            "pair_certificate_count": len(CENTER2_PAIR_CERTIFICATES),
            "normal_domain_count": len(CENTER2_DOMAIN),
        },
        "center5": {
            "candidate_support_count": 495,
            "pair_certificate_count": len(CENTER5_PAIR_CERTIFICATES),
            "normal_domain_count": len(CENTER5_DOMAIN),
        },
        "joint": {
            "normal_pair_count": 432,
            "unique_certificate_count": len(JOINT_CERTIFICATES),
            "certificate_length_counts": dict(sorted(joint_length_counts.items())),
        },
        "triangle_inequalities_used": False,
        "conclusion": "no simultaneous selected four-rows at centers 2 and 5",
    }
    payload = json.dumps(result, sort_keys=True, separators=(",", ":")).encode()
    result["canonical_payload_sha256_without_this_field"] = hashlib.sha256(payload).hexdigest()
    return result


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, sort_keys=True))
```
