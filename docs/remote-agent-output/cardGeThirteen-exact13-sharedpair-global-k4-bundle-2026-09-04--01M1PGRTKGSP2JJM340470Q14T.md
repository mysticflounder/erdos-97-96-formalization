# `cardGeThirteen`: exact-13 shared-pair/global-K4 checkpoint

Date: 2026-09-04

Live target:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

## Main finding

Three nontransversal global-K4 rows sharing pairs with the three tight-cover
base rows do **not** by themselves force a strict-Kalmanson contradiction.  A
fully integral strict metric realizes seven exact four-point rows, including
the first-apex exact class and three shared-pair rows.

However, the same cell cannot satisfy global K4 at the canonical surplus apex
`A3=2`: all 495 possible four-supports are eliminated by one or two exact
strict-Kalmanson cancellations.

This identifies a better finite proof architecture:

```text
exact-card-13 tight source cell
  → retain first-apex row
  → force three nontransversal K4 rows by counting
  → quotient all seven row equalities
  → challenge one canonical remaining center with D.K4
  → short exact row-domain certificate.
```

## Direct DR cell

```text
order = [2,8,9,10,11,12,1,3,4,5,0,6,7]
A3=2, A1=1, A2=0
I2={8,9,10,11,12}, I1={6,7}, z=7

C0@6 = {0,1,4,9}
K@0  = {2,8,10,11}
C1@7 = {3,5,6,12}
T@1  = {0,6,7,8}

E0@9  = {1,8,10,12}   -- shares {8,10} with K
E1@8  = {2,5,7,11}    -- shares {2,11} with K
E2@12 = {4,5,9,10}    -- shares {4,9} with C0
```

`C0,K,C1` are pairwise disjoint and partition `Fin 13 \ {z}`.  `T` is an
exact first-apex class containing both first-opposite interior labels.  Sources
`4∈C0` and `3∈C1` are mutually omitted, lie outside `T`, and deleting either
reduces the unique four-class at its displayed blocker to multiplicity three.
Deleting any member of `T` similarly destroys the first-apex four-class.

All seven rows are complete distance classes in the displayed metric.

## Exact integer metric

```text
 0 49 69 42 36 28 49 60 69 54 69 69 54
49  0 54 10 23 24 49 49 49 30 32 28  9
69 54  0 58 65 60 62 11 58 46 64 67 56
42 10 58  0 14 16 44 52 54 36 39 36 18
36 23 65 14  0  9 49 58 62 45 49 47 30
28 24 60 16  9  0 42 52 58 42 47 46 30
49 49 62 44 49 42  0 52 63 49 65 66 53
60 49 11 52 58 52 52  0 58 45 62 64 52
69 49 58 54 62 58 63 58  0 30 52 58 50
54 30 46 36 45 42 49 45 30  0 30 37 30
69 32 64 39 49 47 65 62 52 30  0 11 30
69 28 67 36 47 46 66 64 58 37 11  0 20
54  9 56 18 30 30 53 52 50 30 30 20  0
```

Exact replay verifies:

```text
858 / 858 strict triangle inequalities
1430 / 1430 strict Kalmanson inequalities
minimum triangle slack   = 1
minimum Kalmanson slack  = 1
```

Thus a theorem using only the seven positive row equalities and cyclic order
cannot close this cell.

## Global-K4 obstruction at the surplus apex

At raw center `2=A3`, global K4 must select one of `C(12,4)=495` supports.
After quotienting distance edges by the seven fixed row-equality classes:

```text
494 supports collapse one strict Kalmanson inequality to 0 > 0
  1 support requires two strict inequalities whose sum is 0 > 0
```

The unique two-form exception is:

```text
support {3,4,7,10}
forms  [[(2,8,0,7), outer], [(2,8,10,0), adjacent]]
```

The 495 leaves compress to exactly 28 certificate tuples: 27 one-form and one
two-form.  No triangle inequality or planar solver is used.

## Consequence for formalization

A fixed-cell source-clean theorem can be stated as:

```lean
theorem false_of_cell_sharedpair_A3_fourSupportRow
    (hfixed : FixedSevenRows boundary)
    (hA3 : FourSupportRow boundary 2 support) : False
```

using the generic weighted-Kalmanson endpoint already being factored in
`CardGeThirteenCenter9K4RowDomain.lean`.  The source occurrence theorem must
still classify an arbitrary exact-tight packet into this or another finite
cell; this checkpoint does not justify wiring a fixed cell to the live sorry.

The stronger computational goal is now clear: enumerate every normalized
source-compatible exact-13 cell after the counting theorem chooses three
nontransversal rows, and ask whether at least one canonical unused carrier
center has an empty four-support row domain.  Preserve a survivor only when a
row exists at every remaining center.

## Reproduction

```bash
python3 cardge13_exact13_sharedpair_global_k4_verifier.py
```

The verifier uses only the Python standard library.

Verifier SHA-256:

```text
afb17bdc7ce90eb5a407bd52a7e0e8e9214bf59359efc898217aa3a7a579df8f
```

Canonical payload SHA-256:

```text
ccda5c8a095d9cfd92b28b779930395d9129309ba2457b59074c0163a0aaf592
```

---

## Embedded exact verifier

```python
#!/usr/bin/env python3
"""Exact verifier for a source-like exact-card-13 shared-pair cell.

This checks, using integer arithmetic only:

* a 13-point strict metric satisfying every strict triangle inequality;
* every strict Kalmanson inequality in the fixed DR direct order;
* seven displayed exact four-point distance classes;
* the exact tight-cover, first-apex, two good-source, and three shared-pair
  incidence surface described in the checkpoint;
* global K4 impossibility at the canonical surplus apex, raw label 2:
  every one of the C(12,4)=495 supports collapses one or two strict Kalmanson
  inequalities after quotienting by the seven fixed row equalities.

The metric is an exact positive control for the local row surface. It is not a
Euclidean or CounterexampleData realization. The row-domain obstruction is an
exact finite strict-Kalmanson certificate for this one discrete source cell,
not a complete classifier of the cardGeThirteen branch.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from itertools import combinations
import hashlib
import json

N = 13
ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
A3 = 2
A1 = 1
A2 = 0
I2 = frozenset({8, 9, 10, 11, 12})
I1 = frozenset({6, 7})
Z = 7

C0_CENTER = 6
C1_CENTER = 7
K_CENTER = A2
T_CENTER = A1

C0 = frozenset({0, 1, 4, 9})
K = frozenset({2, 8, 10, 11})
C1 = frozenset({3, 5, 6, 12})
T = frozenset({0, 6, 7, 8})

E0_CENTER = 9
E1_CENTER = 8
E2_CENTER = 12
E0 = frozenset({1, 8, 10, 12})
E1 = frozenset({2, 5, 7, 11})
E2 = frozenset({4, 5, 9, 10})

FIXED_ROWS = (
    (C0_CENTER, C0, 'C0'),
    (K_CENTER, K, 'K'),
    (C1_CENTER, C1, 'C1'),
    (T_CENTER, T, 'T'),
    (E0_CENTER, E0, 'E0'),
    (E1_CENTER, E1, 'E1'),
    (E2_CENTER, E2, 'E2'),
)

SOURCE0 = 4
SOURCE1 = 3
COMMON_DELETION = 2
OTHER_FRONTIER = 8
CHALLENGE_CENTER = A3

DIST = (
    (0, 49, 69, 42, 36, 28, 49, 60, 69, 54, 69, 69, 54),
    (49, 0, 54, 10, 23, 24, 49, 49, 49, 30, 32, 28, 9),
    (69, 54, 0, 58, 65, 60, 62, 11, 58, 46, 64, 67, 56),
    (42, 10, 58, 0, 14, 16, 44, 52, 54, 36, 39, 36, 18),
    (36, 23, 65, 14, 0, 9, 49, 58, 62, 45, 49, 47, 30),
    (28, 24, 60, 16, 9, 0, 42, 52, 58, 42, 47, 46, 30),
    (49, 49, 62, 44, 49, 42, 0, 52, 63, 49, 65, 66, 53),
    (60, 49, 11, 52, 58, 52, 52, 0, 58, 45, 62, 64, 52),
    (69, 49, 58, 54, 62, 58, 63, 58, 0, 30, 52, 58, 50),
    (54, 30, 46, 36, 45, 42, 49, 45, 30, 0, 30, 37, 30),
    (69, 32, 64, 39, 49, 47, 65, 62, 52, 30, 0, 11, 30),
    (69, 28, 67, 36, 47, 46, 66, 64, 58, 37, 11, 0, 20),
    (54, 9, 56, 18, 30, 30, 53, 52, 50, 30, 30, 20, 0),
)


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError('distance edge needs distinct endpoints')
    return (a, b) if a < b else (b, a)


EDGES = tuple(combinations(range(N), 2))
EDGE_INDEX = {e: i for i, e in enumerate(EDGES)}


class UnionFind:
    def __init__(self, n: int) -> None:
        self.parent = list(range(n))

    def find(self, x: int) -> int:
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, a: int, b: int) -> None:
        ra = self.find(a)
        rb = self.find(b)
        if ra != rb:
            self.parent[rb] = ra


def quotient(rows: tuple[tuple[int, frozenset[int], str], ...]) -> UnionFind:
    uf = UnionFind(len(EDGES))
    for center, support, _name in rows:
        points = sorted(support)
        base = EDGE_INDEX[edge(center, points[0])]
        for point in points[1:]:
            uf.union(base, EDGE_INDEX[edge(center, point)])
    return uf


SparseVector = tuple[tuple[int, int], ...]
KTag = tuple[tuple[int, int, int, int], str]


def vector_neg(v: SparseVector) -> SparseVector:
    return tuple((k, -c) for k, c in v)


def kalmanson_tags():
    tags = []
    for ia, ib, ic, id_ in combinations(range(N), 4):
        a, b, c, d = (ORDER[ia], ORDER[ib], ORDER[ic], ORDER[id_])
        tags.append(
            (((a, b, c, d), 'adjacent'),
             ((edge(a, c), 1), (edge(b, d), 1),
              (edge(a, b), -1), (edge(c, d), -1)))
        )
        tags.append(
            (((a, b, c, d), 'outer'),
             ((edge(a, c), 1), (edge(b, d), 1),
              (edge(a, d), -1), (edge(b, c), -1)))
        )
    return tuple(tags)


KALMANSON_TAGS = kalmanson_tags()


def quotient_vector(uf: UnionFind, terms) -> SparseVector:
    values = defaultdict(int)
    for raw_edge, coefficient in terms:
        root = uf.find(EDGE_INDEX[raw_edge])
        values[root] += coefficient
    return tuple(sorted((root, value) for root, value in values.items() if value))


def shortest_one_or_two_form_certificate(support: frozenset[int]):
    rows = FIXED_ROWS + ((CHALLENGE_CENTER, support, 'challenge'),)
    uf = quotient(rows)
    by_vector = {}
    for tag, terms in KALMANSON_TAGS:
        vector = quotient_vector(uf, terms)
        if not vector:
            return (tag,)
        by_vector.setdefault(vector, tag)
    for vector, tag in by_vector.items():
        opposite = vector_neg(vector)
        if opposite in by_vector:
            return tuple(sorted((tag, by_vector[opposite]), key=str))
    raise AssertionError(f'no one/two-form certificate for {sorted(support)}')


def distance_class(center: int, representative: int) -> frozenset[int]:
    radius = DIST[center][representative]
    return frozenset(
        point for point in range(N)
        if point != center and DIST[center][point] == radius
    )


def max_multiplicity_after_delete(center: int, deleted: int) -> int:
    counts = Counter(
        DIST[center][point]
        for point in range(N)
        if point != center and point != deleted
    )
    return max(counts.values(), default=0)


def verify_metric():
    assert all(len(row) == N for row in DIST)
    minimum_triangle = 10**9
    for i in range(N):
        assert DIST[i][i] == 0
        for j in range(N):
            assert DIST[i][j] == DIST[j][i]
            if i != j:
                assert DIST[i][j] > 0
    triangle_count = 0
    for a, b, c in combinations(range(N), 3):
        for x, y, z in ((a, b, c), (b, a, c), (c, a, b)):
            slack = DIST[x][y] + DIST[x][z] - DIST[y][z]
            assert slack > 0
            minimum_triangle = min(minimum_triangle, slack)
            triangle_count += 1
    assert triangle_count == 858
    minimum_kalmanson = 10**9
    count = 0
    for (a, b, c, d), kind in (tag for tag, _terms in KALMANSON_TAGS):
        diagonal = DIST[a][c] + DIST[b][d]
        side = DIST[a][b] + DIST[c][d] if kind == 'adjacent' else DIST[a][d] + DIST[b][c]
        slack = diagonal - side
        assert slack > 0
        minimum_kalmanson = min(minimum_kalmanson, slack)
        count += 1
    assert count == 1430
    return minimum_triangle, minimum_kalmanson


def verify_source_like_surface():
    universe = frozenset(range(N))
    assert C0.isdisjoint(K) and C0.isdisjoint(C1) and K.isdisjoint(C1)
    assert C0 | K | C1 == universe - {Z}
    assert I1 <= T and T_CENTER not in T
    assert E0 & K == {8, 10}
    assert E1 & K == {2, 11}
    assert E2 & C0 == {4, 9}
    assert SOURCE0 in C0 and SOURCE1 in C1
    assert SOURCE0 not in C1 and SOURCE1 not in C0
    assert SOURCE0 not in T and SOURCE1 not in T
    assert COMMON_DELETION in K and COMMON_DELETION not in C0 | C1
    assert OTHER_FRONTIER in K and OTHER_FRONTIER not in C0 | C1
    assert COMMON_DELETION != OTHER_FRONTIER
    fixed_exact = {}
    for center, support, name in FIXED_ROWS:
        actual = distance_class(center, min(support))
        assert actual == support
        fixed_exact[name] = {'center': center, 'support': sorted(support), 'radius': DIST[center][min(support)]}
    assert max_multiplicity_after_delete(C0_CENTER, SOURCE0) == 3
    assert max_multiplicity_after_delete(C1_CENTER, SOURCE1) == 3
    for source in T:
        assert max_multiplicity_after_delete(T_CENTER, source) == 3
    return fixed_exact


def verify_challenge_row_domain():
    points = [point for point in range(N) if point != CHALLENGE_CENTER]
    counts = Counter()
    groups = defaultdict(list)
    for support_tuple in combinations(points, 4):
        support = frozenset(support_tuple)
        certificate = shortest_one_or_two_form_certificate(support)
        counts[len(certificate)] += 1
        groups[certificate].append(support)
    assert sum(counts.values()) == 495
    assert counts == Counter({1: 494, 2: 1})
    two_form = [(certificate, supports) for certificate, supports in groups.items() if len(certificate) == 2]
    assert len(two_form) == 1
    certificate, supports = two_form[0]
    assert supports == [frozenset({3, 4, 7, 10})]
    return {
        'candidate_support_count': 495,
        'certificate_length_counts': dict(sorted(counts.items())),
        'unique_certificate_tuples': len(groups),
        'two_form_exception': {'support': sorted(supports[0]), 'forms': [list(tag) for tag in certificate]},
    }


def main():
    minimum_triangle, minimum_kalmanson = verify_metric()
    fixed_exact = verify_source_like_surface()
    challenge = verify_challenge_row_domain()
    result = {
        'schema': 'cardge13-exact13-sharedpair-global-k4/v1',
        'order': list(ORDER),
        'metric': {
            'strict_triangle_count': 858,
            'strict_kalmanson_count': 1430,
            'minimum_triangle_slack': minimum_triangle,
            'minimum_kalmanson_slack': minimum_kalmanson,
            'distance_matrix': [list(row) for row in DIST],
        },
        'fixed_exact_rows': fixed_exact,
        'challenge_global_k4_row_domain': challenge,
    }
    payload = json.dumps(result, sort_keys=True, separators=(',', ':')).encode()
    result['canonical_payload_sha256_without_this_field'] = hashlib.sha256(payload).hexdigest()
    return result


if __name__ == '__main__':
    print(json.dumps(main(), indent=2, sort_keys=True))
```
