# Exact two-Kalmanson certificate for the maximal card-14 profile

## Scope

This certificate refutes the authenticated maximal Boolean assignment for the
`firstOppositeO1Six` card-14 profile. It does **not** by itself establish
all-model coverage for that profile, the other five card-14 profiles, or the
arbitrary-cardinality `cardGeThirteen` theorem.

No coordinate realization, nonlinear SMT result, or numerical approximation is
used.

## Boundary order and three rows

The authenticated cyclic boundary order is

```text
[1, 3, 4, 5, 0, 6, 7, 8, 9, 2, 10, 11, 12, 13].
```

Three exact equal-distance rows provide:

```text
X,  center 0, support {3,9,10,11}:  d(0,9) = d(0,10)
U,  center 1, support {6,7,9,12}:   d(1,9) = d(1,12)
K6, center 6, support {0,4,10,12}:  d(6,10) = d(6,12)
```

These are the compressed equality components `C2`, `C8`, and `C5`,
respectively.

## Exact contradiction

The four labels `(1,0,9,10)` occur in this cyclic order. Strict convex
quadrilateral/Kalmanson inequality gives

```text
d(1,9) + d(0,10) > d(1,10) + d(0,9).
```

Cancelling `d(0,10)=d(0,9)` gives

```text
d(1,9) > d(1,10).                       (K1)
```

The four labels `(1,6,10,12)` also occur in cyclic order. Hence

```text
d(1,10) + d(6,12) > d(1,12) + d(6,10).
```

Cancelling `d(6,12)=d(6,10)` gives

```text
d(1,10) > d(1,12).                      (K2)
```

But the center-1 row gives `d(1,9)=d(1,12)`. Therefore

```text
d(1,9) > d(1,10) > d(1,12) = d(1,9),
```

a contradiction.

Equivalently, after quotienting distances by equality components,

```text
K1 = C8 - C3 > 0,
K2 = C3 - C8 > 0,
K1 + K2 = 0.
```

This is an exact two-row Farkas cancellation.

## Existing Lean theorem map

The source-clean generic sink is:

```text
Problem97.UniqueFourKalmansonOccurrenceScratch.
  false_of_two_k2_three_row_triangle
```

with its reflected companion in
`Support/Unique4KalmansonOccurrence/SixRoleKalmansonTriangle.lean`.

The role map for this assignment is:

```text
middle center = 1
first center  = 0
second center = 6
shared points = (9,10,12)
```

## Consequence for the closure program

The previous QF_NRA `UNKNOWN` result was unnecessary for this assignment. The
correct next finite step is to add the **universal**, relabeling- and
reflection-closed occurrence no-good for this six-role theorem to all six
card-14 profile encodings and rerun CEGAR. Rejecting only this one assignment is
not an all-model proof.

For arbitrary cardinality, this occurrence is not currently source-forced:
the center-6 row and the three shared-pair memberships arise from the finite
`k4_everywhere` choice. A separate source theorem must force one of the banked
Kalmanson motifs from the live deletion/blocker/cap packet.

## Executable exact verifier

The accompanying standalone verifier has SHA-256:

```text
434458485250c05d13c06f832cd96035b80122ace95d7f5219bfa54a7facb8d7
```

It checks the two cyclic orders, the three row equalities, and the exact
component-vector cancellation. Its successful output is:

```text
PASS: exact card-14 Kalmanson cancellation verified.
Cyclic quadruples: (1,0,9,10) and (1,6,10,12)
K1 quotient: {'C8': 1, 'C3': -1} > 0
K2 quotient: {'C3': 1, 'C8': -1} > 0
K1 + K2 quotient: 0
Contradiction: two strict positive quantities sum to zero.
Role map: middle center=1, first center=0, second center=6; shared points=(9,10,12).
```

```python
#!/usr/bin/env python3
"""
Exact symbolic certificate for the maximal card-14 firstOppositeO1Six model.

This verifier uses no floating-point coordinates and no SMT/NRA solver. It checks:
  1. the two required cyclic quadrilateral orders;
  2. the three source-row equal-distance identities;
  3. cancellation of the two strict Kalmanson inequalities after quotienting
     by the authenticated distance-equality components.

Mathematical conclusion:
    K1 > 0 and K2 > 0, but K1 + K2 = 0,
so the Boolean card-14 assignment has no strictly convex Euclidean realization.
"""

from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
from typing import Iterable

ORDER = [1, 3, 4, 5, 0, 6, 7, 8, 9, 2, 10, 11, 12, 13]

COMPONENTS: dict[str, set[tuple[int, int]]] = {
    "C2": {(0, 3), (0, 9), (0, 10), (0, 11), (2, 11), (9, 11), (11, 13)},
    "C3": {(0, 4), (1, 10)},
    "C5": {(0, 6), (4, 6), (6, 10), (6, 12)},
    "C8": {(1, 6), (1, 7), (1, 9), (1, 12)},
}

ROWS: dict[str, tuple[int, set[int]]] = {
    "X": (0, {3, 9, 10, 11}),
    "U": (1, {6, 7, 9, 12}),
    "K6": (6, {0, 4, 10, 12}),
}


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("distance edge must have distinct endpoints")
    return (a, b) if a < b else (b, a)


EDGE_TO_COMPONENT: dict[tuple[int, int], str] = {}
for component, edges in COMPONENTS.items():
    for raw_edge in edges:
        normalized = edge(*raw_edge)
        if normalized in EDGE_TO_COMPONENT:
            raise AssertionError(f"edge {normalized} occurs in two components")
        EDGE_TO_COMPONENT[normalized] = component


def is_cyclic_ordered(vertices: Iterable[int]) -> bool:
    values = list(vertices)
    if len(values) < 2 or len(values) != len(set(values)):
        return False
    positions = [ORDER.index(v) for v in values]
    n = len(ORDER)
    deltas = [
        (positions[(i + 1) % len(positions)] - positions[i]) % n
        for i in range(len(positions))
    ]
    return all(delta > 0 for delta in deltas) and sum(deltas) == n


@dataclass(frozen=True)
class Term:
    coefficient: int
    endpoints: tuple[int, int]

    @property
    def component(self) -> str:
        normalized = edge(*self.endpoints)
        try:
            return EDGE_TO_COMPONENT[normalized]
        except KeyError as exc:
            raise AssertionError(
                f"certificate edge {normalized} has no equality component"
            ) from exc


K1 = (
    Term(+1, (1, 9)),
    Term(+1, (0, 10)),
    Term(-1, (1, 10)),
    Term(-1, (0, 9)),
)
K2 = (
    Term(+1, (1, 10)),
    Term(+1, (6, 12)),
    Term(-1, (1, 12)),
    Term(-1, (6, 10)),
)


def signed_quotient_vector(terms: Iterable[Term]) -> dict[str, int]:
    result: Counter[str] = Counter()
    for term in terms:
        result[term.component] += term.coefficient
    return {component: coefficient for component, coefficient in result.items()
            if coefficient != 0}


def add_vectors(*vectors: dict[str, int]) -> dict[str, int]:
    result: Counter[str] = Counter()
    for vector in vectors:
        result.update(vector)
    return {component: coefficient for component, coefficient in result.items()
            if coefficient != 0}


def assert_row_pair(row_name: str, p: int, q: int) -> None:
    center, support = ROWS[row_name]
    assert p in support and q in support, (row_name, p, q, support)
    cp = EDGE_TO_COMPONENT[edge(center, p)]
    cq = EDGE_TO_COMPONENT[edge(center, q)]
    assert cp == cq, (
        f"{row_name} does not certify the requested equality: {cp} != {cq}"
    )


def main() -> None:
    assert is_cyclic_ordered((1, 0, 9, 10))
    assert is_cyclic_ordered((1, 6, 10, 12))

    assert_row_pair("X", 9, 10)
    assert_row_pair("K6", 10, 12)
    assert_row_pair("U", 9, 12)

    q1 = signed_quotient_vector(K1)
    q2 = signed_quotient_vector(K2)
    total = add_vectors(q1, q2)

    assert q1 == {"C8": 1, "C3": -1}, q1
    assert q2 == {"C3": 1, "C8": -1}, q2
    assert total == {}, total

    print("PASS: exact card-14 Kalmanson cancellation verified.")
    print("Cyclic quadruples: (1,0,9,10) and (1,6,10,12)")
    print("K1 quotient:", q1, "> 0")
    print("K2 quotient:", q2, "> 0")
    print("K1 + K2 quotient: 0")
    print("Contradiction: two strict positive quantities sum to zero.")
    print(
        "Role map: middle center=1, first center=0, second center=6; "
        "shared points=(9,10,12)."
    )


if __name__ == "__main__":
    main()
```
