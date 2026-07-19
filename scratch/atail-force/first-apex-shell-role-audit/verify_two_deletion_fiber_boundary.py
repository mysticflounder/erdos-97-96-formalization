#!/usr/bin/env python3
"""Exact finite-metric regression for the two-deletion/CSS overclaim.

This is deliberately not a Euclidean or cap realization.  It verifies that
the following finite metric interface is jointly satisfiable:

* global K4 and deletion minimality;
* a total source-indexed critical blocker map with same-center support lock;
* one six-point radius class at an omitted center O, hence survival after
  every prescribed double deletion at O;
* injective blocker values on the six named class sources; and
* no critical support containing two named class points.

Consequently the abstract data alone cannot force a blocker-fiber collision
inside the named six, a critical row through a named pair, or a distinguished
row-pair return to the frontier pair.
"""

from collections import Counter, defaultdict, deque
from fractions import Fraction
from itertools import combinations


O = 0
CLASS = tuple(range(1, 7))
OUTER = tuple(range(7, 25))
VERTICES = (O, *CLASS, *OUTER)


def edge(a: int, b: int) -> tuple[int, int]:
    assert a != b
    return (a, b) if a < b else (b, a)


def build_edges() -> set[tuple[int, int]]:
    edges: set[tuple[int, int]] = set()
    for c in CLASS:
        edges.add(edge(O, c))
    for i, c in enumerate(CLASS):
        for j in range(3):
            edges.add(edge(c, OUTER[3 * i + j]))
    for j, d in enumerate(OUTER):
        edges.add(edge(d, OUTER[(j + 1) % len(OUTER)]))
    for j in range(len(OUTER) // 2):
        edges.add(edge(OUTER[j], OUTER[j + len(OUTER) // 2]))
    return edges


EDGES = build_edges()
NEIGHBORS = {
    v: frozenset(w for w in VERTICES if w != v and edge(v, w) in EDGES)
    for v in VERTICES
}


def build_distances() -> dict[tuple[int, int], Fraction]:
    distances: dict[tuple[int, int], Fraction] = {}
    nonedge_index = 0
    for a, b in combinations(VERTICES, 2):
        pair = edge(a, b)
        if pair in EDGES:
            distances[pair] = Fraction(1)
        else:
            nonedge_index += 1
            distances[pair] = Fraction(3, 2) + Fraction(nonedge_index, 10000)
    return distances


DISTANCES = build_distances()


def dist(a: int, b: int) -> Fraction:
    return Fraction(0) if a == b else DISTANCES[edge(a, b)]


def radius_classes(carrier: frozenset[int], center: int) -> dict[Fraction, set[int]]:
    classes: dict[Fraction, set[int]] = defaultdict(set)
    for point in carrier:
        if point != center:
            classes[dist(center, point)].add(point)
    return classes


def has_k4_at(carrier: frozenset[int], center: int) -> bool:
    return any(len(points) >= 4 for points in radius_classes(carrier, center).values())


def blocker_map() -> dict[int, int]:
    blocker = {O: CLASS[0]}
    for i, c in enumerate(CLASS):
        blocker[c] = OUTER[3 * i]
    for j, d in enumerate(OUTER):
        blocker[d] = OUTER[(j + 1) % len(OUTER)]
    return blocker


BLOCKER = blocker_map()


def critical_support(source: int) -> frozenset[int]:
    return NEIGHBORS[BLOCKER[source]]


def connected() -> bool:
    seen = {O}
    queue = deque([O])
    while queue:
        v = queue.popleft()
        for w in NEIGHBORS[v] - seen:
            seen.add(w)
            queue.append(w)
    return seen == set(VERTICES)


def non_apex_connected() -> bool:
    allowed = set(VERTICES) - {O}
    start = next(iter(allowed))
    seen = {start}
    queue = deque([start])
    while queue:
        v = queue.popleft()
        for w in (NEIGHBORS[v] & allowed) - seen:
            seen.add(w)
            queue.append(w)
    return seen == allowed


def verify() -> None:
    carrier = frozenset(VERTICES)

    # Exact rational metric: all nonzero distances lie in [1, 2), so every
    # triangle inequality is strict; symmetry is built into unordered keys.
    for a, b, c in combinations(VERTICES, 3):
        assert dist(a, b) < dist(a, c) + dist(c, b)
        assert dist(a, c) < dist(a, b) + dist(b, c)
        assert dist(b, c) < dist(b, a) + dist(a, c)

    assert connected()
    assert non_apex_connected()
    assert NEIGHBORS[O] == frozenset(CLASS)
    assert len(NEIGHBORS[O]) == 6
    assert all(len(NEIGHBORS[v]) == 4 for v in VERTICES if v != O)
    assert all(has_k4_at(carrier, v) for v in VERTICES)

    # The six-point class loses at most two members under arbitrary double
    # deletion.  The formal HasN predicate does not require its center to
    # remain in the carrier, so O is allowed among a,b here as in Lean.
    for a in VERTICES:
        for b in VERTICES:
            assert has_k4_at(carrier - {a, b}, O)

    # Every proper globally-K4 subcarrier is impossible.  At a non-O center,
    # the only radius class of size four is its complete neighbor set.  Hence
    # a globally-K4 subcarrier containing a non-O vertex is neighbor-closed.
    # The non-O induced graph is connected, so this already forces every
    # non-O vertex, and their O edges force O too.  A subcarrier contained in
    # {O} plainly fails K4.  These assertions are the finite certificate for
    # that argument, avoiding an unnecessary 2^25 subset enumeration.
    for v in VERTICES:
        classes = radius_classes(carrier, v)
        large = [points for points in classes.values() if len(points) >= 4]
        assert large == [set(NEIGHBORS[v])]

    # Total source-exact critical map.  Every blocker is a distinct carrier
    # point adjacent to its source and is never O.  Its sole four-class has
    # exactly four members, so deleting the source destroys K4 there.
    assert set(BLOCKER) == set(VERTICES)
    for source, blocker in BLOCKER.items():
        assert blocker != source
        assert blocker != O
        assert source in NEIGHBORS[blocker]
        assert len(critical_support(source)) == 4
        assert not has_k4_at(carrier - {source}, blocker)

    # Same blocker means literally the same selected support.
    for s in VERTICES:
        for t in VERTICES:
            if BLOCKER[s] == BLOCKER[t]:
                assert critical_support(s) == critical_support(t)

    # The omitted O forces a collision somewhere, but not in the six named
    # class.  Moreover no chosen critical row contains a pair from that class.
    assert len({BLOCKER[c] for c in CLASS}) == len(CLASS)
    assert all(len(critical_support(s) & set(CLASS)) <= 1 for s in VERTICES)
    fibers: dict[int, list[int]] = defaultdict(list)
    for source, blocker in BLOCKER.items():
        fibers[blocker].append(source)
    assert any(len(fiber) >= 2 for fiber in fibers.values())

    # Source-faithful named rows at O and an abstract 4/1/1 cap-role split.
    q, w = CLASS[:2]
    t1 = frozenset(CLASS[2:])
    t0 = frozenset(CLASS[:4])
    roles = {CLASS[i]: "I" for i in range(4)} | {CLASS[4]: "S", CLASS[5]: "O"}
    assert len(t0) == len(t1) == 4
    assert q in t0 and w in t0 and q not in t1 and w not in t1
    assert all(dist(O, point) == 1 for point in {q, w} | set(t1))
    assert Counter(roles.values()) == Counter({"I": 4, "S": 1, "O": 1})

    # Three distinguished actual critical rows can have outside pairs wholly
    # disjoint from the named class; no return to {q,w} is forced.
    distinguished_pairs = []
    for source in (OUTER[0], OUTER[6], OUTER[12]):
        outside = sorted(critical_support(source) - set(CLASS) - {O})
        pair = frozenset(outside[:2])
        assert len(pair) == 2 and pair <= critical_support(source)
        assert pair.isdisjoint(CLASS) and pair != frozenset({q, w})
        distinguished_pairs.append(pair)

    print("PASS_EXACT_FINITE_METRIC_TWO_DELETION_FIBER_BOUNDARY")
    print(f"carrier_card={len(VERTICES)}")
    print(f"fixed_class_card={len(CLASS)}")
    print(f"blocker_fiber_sizes={sorted(len(f) for f in fibers.values())}")
    print(f"named_class_blockers={[BLOCKER[c] for c in CLASS]}")
    print(f"distinguished_pairs={sorted(tuple(sorted(p)) for p in distinguished_pairs)}")


if __name__ == "__main__":
    verify()
