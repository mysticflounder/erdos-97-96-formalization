# `cardGeThirteen`: canonical-four K4 countercontrol

Date: 2026-09-04

## Exact negative result for the current finite strategy

The conjecture that the exact-tight source rows plus global K4 at the canonical
set

```text
A3 and the three surplus-interior labels = {2,3,4,5}
```

must already contradict strict Kalmanson is false at the source-shaped metric
level.

The direct DR order is

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7].
```

The following seven supports are all **complete exact four-point distance
classes** in one integer metric:

```text
K@0   = {1,2,9,10}
L@0   = {5,8,11,12}
C0@4  = {3,5,6,11}
C1@5  = {0,4,7,12}
T@1   = {4,6,7,10}
R2@2  = {3,4,5,10}
R3@3  = {1,5,7,8}.
```

`C0` and `C1` already provide K4 at canonical centers `4` and `5`; `R2` and
`R3` provide K4 at `2` and `3`. Thus every center in `{2,3,4,5}` has an exact
four-class.

The first five rows also realize the tight-cover incidence surface with
`z=8`: `C0,C1,K` are pairwise disjoint and partition the other twelve labels;
`K,L` are disjoint A2 rows; `L\{z}` has trace `2+1`; `T` contains both
first-opposite labels `6,7`; blockers `4,5` avoid their own rows; and all
distinct-center row intersections have cardinality at most two.

The integer metric satisfies all 858 strict triangle inequalities and all 1,430
strict Kalmanson inequalities, with minimum slack exactly `2` in both families.
Therefore no proof using only those seven row equalities and convex-order linear
inequalities can close this cell.

## Where global K4 first becomes decisive

The same seven fixed rows make the entire K4 row domain empty at each of the
source-canonical labels `6`, `7`, and `10`:

```text
center 6: 486 one-form +  9 two-form cancellations = 495
center 7: 474 one-form + 21 two-form cancellations = 495
center10: 467 one-form + 28 two-form cancellations = 495
```

No triangle inequalities are needed for these row-domain certificates.

This redirects the finite campaign:

```text
not merely A3 + surplus-interior K4,
but all-center K4—or at least a source-proved challenge at I1/I2—is load-bearing.
```

It also explains why fixed-cell terminals at center 9 or adjacent surplus pairs
can be genuine without yielding a uniform source theorem.

## Claim boundary

This is an exact abstract metric control, not a Euclidean realization or a
P97 counterexample. It does not provide K4 at the remaining carrier centers,
CriticalShellSystem/no-qfree data, frontier-pair provenance, MEC/Moser geometry,
or minimality. Its purpose is to refute an overbroad finite strategy and locate
the next discriminating source layer.

Verifier SHA-256:

```text
38cb4e626c3ca714652ed39fbf03bc68ae6997488575e31023de771da75fc49e
```

Canonical payload SHA-256:

```text
03c991388267659233c48a089135d34b96077c612a96e40f4f75e423f480408e
```

---

## Embedded exact verifier

```python
#!/usr/bin/env python3
"""Exact integer control for the CardGeThirteen exact-13 K4 campaign.

This verifies a strict integer metric on the direct second-opposite DR order
with seven exact four-point distance classes:

  K@0   = {1,2,9,10}
  L@0   = {5,8,11,12}
  C0@4  = {3,5,6,11}
  C1@5  = {0,4,7,12}
  T@1   = {4,6,7,10}
  R2@2  = {3,4,5,10}
  R3@3  = {1,5,7,8}

The first five rows form the source-like tight-cover/two-radius/first-apex
surface with z=8.  Since C0 and C1 already provide K4 at surplus labels 4 and
5, the rows R2 and R3 complete K4 at A3=2 and the only remaining surplus label
3.  Hence all four canonical centers {2,3,4,5} possess exact K4 rows.

Nevertheless global K4 still fails: at each first-opposite label 6 and 7,
every one of the C(12,4)=495 candidate supports is eliminated by one or two
strict Kalmanson inequalities after quotienting by the seven fixed row
equalities.

The control is not Euclidean or CounterexampleData.  It proves that the
canonical A3/surplus K4 layer is insufficient and that further all-center K4,
MEC, or planar source structure is genuinely necessary.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from itertools import combinations
import hashlib
import json

N = 13
ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
Z = 8
FIXED_ROWS = (
    (0, frozenset({1, 2, 9, 10}), "K"),
    (0, frozenset({5, 8, 11, 12}), "L"),
    (4, frozenset({3, 5, 6, 11}), "C0"),
    (5, frozenset({0, 4, 7, 12}), "C1"),
    (1, frozenset({4, 6, 7, 10}), "T"),
    (2, frozenset({3, 4, 5, 10}), "R2"),
    (3, frozenset({1, 5, 7, 8}), "R3"),
)
DIST = (
    (0,261,261,230,217,202,164,179,202,261,261,202,202),
    (261,0,300,217,237,250,237,237,233,246,237,170,147),
    (261,300,0,282,282,282,225,210,206,271,282,229,235),
    (230,217,282,0,202,217,208,217,217,266,259,194,173),
    (217,237,282,202,0,202,202,213,219,270,265,202,191),
    (202,250,282,217,202,0,189,202,221,274,272,211,202),
    (164,237,225,208,202,189,0,17,168,229,231,174,176),
    (179,237,210,217,213,202,17,0,158,221,225,170,174),
    (202,233,206,217,219,221,168,158,0,67,80,147,166),
    (261,246,271,266,270,274,229,221,67,0,15,84,105),
    (261,237,282,259,265,272,231,225,80,15,0,71,94),
    (202,170,229,194,202,211,174,170,147,84,71,0,25),
    (202,147,235,173,191,202,176,174,166,105,94,25,0),
)


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


def neg_vector(vector: SparseVector) -> SparseVector:
    return tuple((key, -value) for key, value in vector)


def kalmanson_forms():
    forms = []
    for ia, ib, ic, id_ in combinations(range(N), 4):
        a, b, c, d = (ORDER[ia], ORDER[ib], ORDER[ic], ORDER[id_])
        forms.append(
            ((a,b,c,d,"adjacent"),
             ((edge(a,c),1),(edge(b,d),1),(edge(a,b),-1),(edge(c,d),-1)))
        )
        forms.append(
            ((a,b,c,d,"outer"),
             ((edge(a,c),1),(edge(b,d),1),(edge(a,d),-1),(edge(b,c),-1)))
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


def distance_class(center: int, representative: int) -> frozenset[int]:
    radius = DIST[center][representative]
    return frozenset(
        point for point in range(N)
        if point != center and DIST[center][point] == radius
    )


def verify_metric() -> tuple[int, int]:
    minimum_triangle = 10**9
    for i in range(N):
        assert DIST[i][i] == 0
        for j in range(N):
            assert DIST[i][j] == DIST[j][i]
            if i != j:
                assert DIST[i][j] > 0
    for a, b, c in combinations(range(N), 3):
        for x, y, z in ((a,b,c),(a,c,b),(b,c,a)):
            slack = DIST[x][y] + DIST[x][z] - DIST[y][z]
            assert slack > 0
            minimum_triangle = min(minimum_triangle, slack)

    minimum_kalmanson = 10**9
    for ia, ib, ic, id_ in combinations(range(N), 4):
        a, b, c, d = (ORDER[ia], ORDER[ib], ORDER[ic], ORDER[id_])
        adjacent = DIST[a][c] + DIST[b][d] - DIST[a][b] - DIST[c][d]
        outer = DIST[a][c] + DIST[b][d] - DIST[a][d] - DIST[b][c]
        assert adjacent > 0 and outer > 0
        minimum_kalmanson = min(minimum_kalmanson, adjacent, outer)
    return minimum_triangle, minimum_kalmanson


def verify_source_surface() -> None:
    universe = frozenset(range(N))
    rows = {name: support for _center, support, name in FIXED_ROWS}
    assert rows["K"].isdisjoint(rows["L"])
    assert rows["C0"].isdisjoint(rows["C1"])
    assert rows["C0"].isdisjoint(rows["K"])
    assert rows["C1"].isdisjoint(rows["K"])
    assert rows["C0"] | rows["C1"] | rows["K"] == universe - {Z}
    assert Z in rows["L"] and Z not in rows["K"]
    assert sorted((len((rows["L"]-{Z}) & rows["C0"]),
                   len((rows["L"]-{Z}) & rows["C1"]))) == [1,2]
    assert rows["T"] >= {6,7}
    assert 4 not in rows["C0"] and 5 not in rows["C1"]
    assert 0 not in rows["K"] | rows["L"]
    assert 1 not in rows["T"]
    for i, (center, support, name) in enumerate(FIXED_ROWS):
        assert distance_class(center, min(support)) == support, name
        for other_center, other_support, other_name in FIXED_ROWS[i+1:]:
            if center != other_center:
                assert len(support & other_support) <= 2, (name, other_name)


def row_domain(center: int):
    counts = Counter()
    survivors = []
    for support_tuple in combinations([x for x in range(N) if x != center], 4):
        support = frozenset(support_tuple)
        certificate = shortest_one_or_two(
            FIXED_ROWS + ((center, support, f"R{center}"),)
        )
        if certificate is None:
            survivors.append(support)
        else:
            counts[len(certificate)] += 1
    return counts, survivors


def main() -> dict[str, object]:
    minimum_triangle, minimum_kalmanson = verify_metric()
    verify_source_surface()
    count6, survivors6 = row_domain(6)
    count7, survivors7 = row_domain(7)
    count10, survivors10 = row_domain(10)
    assert not survivors6 and not survivors7 and not survivors10
    assert count6 == Counter({1:486, 2:9})
    assert count7 == Counter({1:474, 2:21})
    assert count10 == Counter({1:467, 2:28})

    result = {
        "schema": "cardge13-exact13-canonical-four-k4-countercontrol/v1",
        "order": list(ORDER),
        "z": Z,
        "fixed_rows": [
            {"center": center, "support": sorted(support), "name": name}
            for center, support, name in FIXED_ROWS
        ],
        "metric": {
            "minimum_triangle_slack": minimum_triangle,
            "minimum_kalmanson_slack": minimum_kalmanson,
            "distance_matrix": [list(row) for row in DIST],
        },
        "global_k4_failures": {
            "6": dict(sorted(count6.items())),
            "7": dict(sorted(count7.items())),
            "10": dict(sorted(count10.items())),
        },
        "claim_boundary": (
            "Exact abstract strict metric and exact row-domain certificates; "
            "not Euclidean, not a full all-center K4 system, and not a "
            "CounterexampleData realization."
        ),
    }
    payload = json.dumps(result, sort_keys=True, separators=(",", ":")).encode()
    result["canonical_payload_sha256_without_this_field"] = hashlib.sha256(payload).hexdigest()
    return result


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, sort_keys=True))
```
