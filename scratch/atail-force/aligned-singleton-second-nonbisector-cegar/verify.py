#!/usr/bin/env python3
"""Independent semantic verifier for the Boolean survivor payload."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


N = 17
APICES = (0, 5, 12)
CAPS = {
    "surplus": frozenset(range(0, 6)),
    "first_opposite": frozenset(range(5, 13)),
    "second_opposite": frozenset({12, 13, 14, 15, 16, 0}),
}
CAP_ENDPOINTS = {
    "surplus": frozenset({0, 5}),
    "first_opposite": frozenset({5, 12}),
    "second_opposite": frozenset({12, 0}),
}
FIRST_STRICT = frozenset(range(6, 12))
OUTSIDE_FIRST = frozenset(range(N)) - CAPS["first_opposite"]


def fail(message: str) -> None:
    raise ValueError(message)


def verify(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-aligned-singleton-second-nonbisector-outer-v1":
        fail("unexpected schema")
    if payload.get("status") != "SAT":
        fail("payload is not SAT")
    if payload.get("n") != N or tuple(payload.get("apices", ())) != APICES:
        fail("carrier normalization mismatch")
    if {
        name: frozenset(points) for name, points in payload.get("caps", {}).items()
    } != CAPS:
        fail("cap profile mismatch")

    rows = {
        int(center): tuple(points)
        for center, points in payload["rows"].items()
    }
    blockers = {
        int(source): int(center)
        for source, center in payload["blockers"].items()
    }
    raw_classes = {
        int(center): [frozenset(block) for block in blocks]
        for center, blocks in payload["equality_classes"].items()
    }
    roles = {name: int(point) for name, point in payload["roles"].items()}
    vertices = frozenset(range(N))

    if set(rows) != set(range(N)) or set(blockers) != set(range(N)):
        fail("rows or blockers are not total")
    if set(raw_classes) != set(range(N)):
        fail("equality partitions are not total")

    class_of: dict[tuple[int, int], frozenset[int]] = {}
    for center, blocks in raw_classes.items():
        union = frozenset().union(*blocks)
        if union != vertices or sum(len(block) for block in blocks) != N:
            fail(f"classes at center {center} do not partition the carrier")
        for block in blocks:
            if not block:
                fail(f"empty class at center {center}")
            for point in block:
                if (center, point) in class_of:
                    fail(f"overlapping classes at center {center}")
                class_of[center, point] = block
        if class_of[center, center] != frozenset({center}):
            fail(f"zero-distance class at center {center} is not singleton")

    def same(center: int, left: int, right: int) -> bool:
        return class_of[center, left] == class_of[center, right]

    for center, row in rows.items():
        if len(row) != 4 or len(set(row)) != 4 or center in row:
            fail(f"row {center} is not a nonself four-set")
        if any(not same(center, row[0], point) for point in row[1:]):
            fail(f"row {center} is not contained in one radius class")

    for source, center in blockers.items():
        if center in APICES or center == source:
            fail(f"forbidden blocker {source}->{center}")
        if source not in rows[center]:
            fail(f"blocker row {center} omits source {source}")
        if frozenset(rows[center]) != class_of[center, source]:
            fail(f"critical row {center} is not source {source}'s full class")
        for block in raw_classes[center]:
            remaining = block - {source}
            if len(remaining) >= 4:
                fail(f"no_qfree fails for source {source} at center {center}")

    for left, right in itertools.combinations(range(N), 2):
        if len(set(rows[left]) & set(rows[right])) > 2:
            fail(f"rows {left},{right} share more than two points")
        centers = [
            center
            for center in range(N)
            if same(center, left, right)
        ]
        if len(centers) > 2:
            fail(f"pair {left},{right} occurs at more than two centers")
        if len(centers) == 2:
            c1, c2 = sorted(centers)
            alternates = (c1 < left < c2) != (c1 < right < c2)
            if left not in {c1, c2} and right not in {c1, c2} and not alternates:
                fail(f"shared pair {left},{right} does not alternate with {c1},{c2}")

    for center_left, center_right in itertools.combinations(range(N), 2):
        for left_class in raw_classes[center_left]:
            if center_left in left_class:
                continue
            for right_class in raw_classes[center_right]:
                if center_right in right_class:
                    continue
                if len(left_class & right_class) > 2:
                    fail(
                        f"full classes at centers {center_left},{center_right} "
                        "share more than two points"
                    )

    for name, cap in CAPS.items():
        for center in cap:
            hits = len(set(rows[center]) & set(cap))
            if hits > 2:
                fail(f"row {center} has too many hits in cap {name}")
            if center in CAP_ENDPOINTS[name] and hits > 1:
                fail(f"endpoint row {center} has too many hits in cap {name}")

    def rich(center: int) -> bool:
        positive = [
            block for block in raw_classes[center] if center not in block
        ]
        return any(len(block) >= 6 for block in positive) or (
            sum(len(block) >= 4 for block in positive) >= 2
        )

    if any(not rich(apex) for apex in APICES):
        fail("one of the three physical apices is not rich")
    for center in range(N):
        if same(center, APICES[0], APICES[1]) and same(
            center, APICES[0], APICES[2]
        ):
            fail(f"center {center} covers all three apices")

    def not_robust(center: int) -> bool:
        for deleted in range(N):
            if deleted == center:
                continue
            if all(len(block - {deleted}) <= 3 for block in raw_classes[center]):
                return True
        return False

    computed_not_robust = [
        center for center in range(N) if not_robust(center)
    ]
    if computed_not_robust != payload["not_robust_centers"]:
        fail("reported non-robust centers do not match the partitions")
    if 4 * len(computed_not_robust) < N:
        fail("not-robust cover inequality fails")

    # Strong connectivity of the selected-row digraph.
    reached = {0}
    frontier = [0]
    while frontier:
        source = frontier.pop()
        for target in rows[source]:
            if target not in reached:
                reached.add(target)
                frontier.append(target)
    if reached != set(range(N)):
        fail("selected-row digraph is not strongly reachable from 0")
    reverse = {point: set() for point in range(N)}
    for source, row in rows.items():
        for target in row:
            reverse[target].add(source)
    reached = {0}
    frontier = [0]
    while frontier:
        target = frontier.pop()
        for source in reverse[target]:
            if source not in reached:
                reached.add(source)
                frontier.append(source)
    if reached != set(range(N)):
        fail("selected-row digraph is not strongly co-reachable to 0")

    p1, p2 = roles["p1"], roles["p2"]
    r1, r2 = roles["r1"], roles["r2"]
    source = roles["source"]
    q, other = roles["q"], roles["other"]
    b1, b2, bsource = roles["b1"], roles["b2"], roles["bsource"]
    cycle_p, cycle_r = roles["cycle_p"], roles["cycle_r"]

    if not {p1, p2, r1, r2, source, b1, b2} <= FIRST_STRICT:
        fail("a strict-cap role lies outside the strict cap")
    if q not in OUTSIDE_FIRST or other not in OUTSIDE_FIRST:
        fail("an outside role lies in the first closed cap")
    if len({p1, p2, r1, r2, source}) != 5:
        fail("retained/singleton strict-cap sources are not distinct")
    if len({q, other, p1, p2, r1, r2, source}) != 7:
        fail("outside/source roles are not distinct")
    if b1 == b2 or bsource in {b1, b2}:
        fail("named blocker distinctness fails")

    if class_of[0, p1] != class_of[0, p2] or len(class_of[0, p1]) != 4:
        fail("first retained first-apex class is not exact four")
    if class_of[0, r1] != class_of[0, r2] or len(class_of[0, r1]) != 4:
        fail("second retained first-apex class is not exact four")
    if same(0, p1, r1):
        fail("the two retained radii coincide")
    if class_of[0, p1] & FIRST_STRICT != frozenset({p1, p2}):
        fail("first retained class has the wrong strict-cap trace")
    if class_of[0, r1] & FIRST_STRICT != frozenset({r1, r2}):
        fail("second retained class has the wrong strict-cap trace")
    if class_of[0, source] & FIRST_STRICT != frozenset({source}):
        fail("singleton source class has the wrong strict-cap trace")
    for left, right in itertools.combinations(FIRST_STRICT, 2):
        if same(0, left, right) and not (
            same(0, left, p1) or same(0, left, r1)
        ):
            fail("an unaligned strict-cap multipoint radius survives")

    expected_blockers = {
        p1: b1,
        p2: b1,
        r1: b2,
        r2: b2,
        q: b1,
        source: bsource,
    }
    if any(blockers[src] != center for src, center in expected_blockers.items()):
        fail("a named blocker fiber is wrong")
    if frozenset(rows[b1]) != frozenset({p1, p2, q, other}):
        fail("first blocker row is not the explicit four-set")
    if frozenset(rows[b2]) & FIRST_STRICT != frozenset({r1, r2}):
        fail("second blocker row has the wrong strict-cap trace")
    if {p1, p2} <= set(rows[bsource]) or {r1, r2} <= set(rows[bsource]):
        fail("singleton source fails a cross-pair deletion view")
    if cycle_p not in {p1, p2} or cycle_r not in {r1, r2}:
        fail("cycle choices are not collision sources")
    if blockers[cycle_p] != b1 or blockers[cycle_r] != b2:
        fail("cycle blocker identities fail")
    if set(rows[b2]) & {p1, p2} or set(rows[b1]) & {r1, r2}:
        fail("the checked cross-omission rectangle fails")

    target_same = same(b2, q, other)
    if payload["target"] == "second_blocker_nonbisector":
        if target_same:
            fail("non-bisection target is false")
    elif payload["target"] == "second_blocker_bisector_control":
        if not target_same:
            fail("bisection control is false")
    else:
        fail("unknown target")

    return {
        "schema": "p97-aligned-singleton-second-nonbisector-verification-v1",
        "verified": True,
        "input": str(path),
        "n": N,
        "row_count": len(rows),
        "blocker_count": len(blockers),
        "not_robust_count": len(computed_not_robust),
        "target": payload["target"],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("payload", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify(args.payload)
    if args.output:
        args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
