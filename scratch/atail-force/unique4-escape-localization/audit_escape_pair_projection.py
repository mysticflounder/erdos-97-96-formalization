#!/usr/bin/env python3
"""Replay the smallest retained exact-four escape-localization projection.

This is an exact finite incidence audit, not a Euclidean realization and not
a model of ``OriginalUniqueFourResidual``.  It retains the layers needed to
test whether one source-shaped escaping row automatically enters either a
two-center parity terminal or ``CriticalFiberClosingCore``:

* one four-point selected row at every one of twelve cyclic centers;
* displayed-cap interior/endpoint row-hit bounds;
* selected-row strong connectivity;
* pairwise row intersection at most two;
* a total fixed-point-free blocker map with each source in its blocker row;
* the exact first-apex blocker fiber;
* omission of the physical second apex from the blocker image; and
* the complete nonalternating shared-pair terminal family.

The table is the exact ``p4`` projection independently stored by
``unique4-occurrence-feasibility``.  It is embedded here so this audit has a
small self-contained replay boundary.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict, deque
from pathlib import Path


HERE = Path(__file__).resolve().parent
AUDIT_PATH = HERE / "audit.json"

N = 12
FIRST_APEX = 0
SECOND_APEX = 4

CAPS = (
    frozenset({0, 1, 2, 3, 4}),
    frozenset({4, 5, 6, 7}),
    frozenset({0, 7, 8, 9, 10, 11}),
)
CAP_ENDPOINTS = (
    frozenset({0, 4}),
    frozenset({4, 7}),
    frozenset({0, 7}),
)

ROWS = {
    0: frozenset({1, 5, 6, 8}),
    1: frozenset({0, 4, 6, 11}),
    2: frozenset({1, 3, 8, 10}),
    3: frozenset({0, 1, 5, 9}),
    4: frozenset({2, 5, 10, 11}),
    5: frozenset({1, 3, 6, 7}),
    6: frozenset({2, 5, 7, 9}),
    7: frozenset({2, 3, 6, 8}),
    8: frozenset({3, 4, 9, 10}),
    9: frozenset({0, 3, 5, 7}),
    10: frozenset({1, 4, 9, 11}),
    11: frozenset({2, 4, 7, 10}),
}

BLOCKER = {
    0: 1,
    1: 0,
    2: 11,
    3: 9,
    4: 1,
    5: 0,
    6: 0,
    7: 11,
    8: 0,
    9: 10,
    10: 11,
    11: 1,
}

ESCAPE_CENTER = 6


def cyclically_alternating(
    first: frozenset[int], second: frozenset[int]
) -> bool:
    """Whether two two-point sets alternate in the fixed cyclic order."""
    assert len(first) == 2 and len(second) == 2 and first.isdisjoint(second)
    labels = [
        (point, 0 if point in first else 1)
        for point in sorted(first | second)
    ]
    kinds = [kind for _, kind in labels]
    return all(kinds[index] != kinds[(index + 1) % 4] for index in range(4))


def strongly_connected() -> bool:
    for source in range(N):
        seen = {source}
        queue = deque([source])
        while queue:
            center = queue.popleft()
            for target in ROWS[center]:
                if target not in seen:
                    seen.add(target)
                    queue.append(target)
        if len(seen) != N:
            return False
    return True


def compute() -> dict[str, object]:
    assert set(ROWS) == set(range(N))
    assert set(BLOCKER) == set(range(N))
    assert all(len(ROWS[center]) == 4 for center in range(N))
    assert all(center not in ROWS[center] for center in range(N))

    for left in range(N):
        for right in range(left + 1, N):
            assert len(ROWS[left] & ROWS[right]) <= 2

    for center in range(N):
        for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
            if center not in cap:
                continue
            bound = 1 if center in endpoints else 2
            assert len(ROWS[center] & cap) <= bound

    assert strongly_connected()
    assert all(BLOCKER[source] != source for source in range(N))
    assert all(source in ROWS[BLOCKER[source]] for source in range(N))
    assert SECOND_APEX not in set(BLOCKER.values())

    fibers: dict[int, set[int]] = defaultdict(set)
    for source, center in BLOCKER.items():
        fibers[center].add(source)
    assert all(len(fiber) <= 4 for fiber in fibers.values())
    assert fibers[FIRST_APEX] == set(ROWS[FIRST_APEX])

    # This is the sharper protected set: the two displayed apex rows plus
    # the two physical apex centers.  The third Moser vertex is unnecessary.
    protected = (
        set(ROWS[FIRST_APEX])
        | set(ROWS[SECOND_APEX])
        | {FIRST_APEX, SECOND_APEX}
    )
    assert len(protected) == 9
    assert ESCAPE_CENTER in protected
    escape_targets = set(ROWS[ESCAPE_CENTER]) - protected
    assert escape_targets == {7, 9}

    # Every selected pair shared by two distinct row centers is alternating;
    # hence none enters the four nonalternating parity terminals.
    shared_pairs: list[dict[str, object]] = []
    for left in range(N):
        for right in range(left + 1, N):
            pair = ROWS[left] & ROWS[right]
            if len(pair) != 2:
                continue
            centers = frozenset({left, right})
            assert pair.isdisjoint(centers)
            assert cyclically_alternating(pair, centers)
            shared_pairs.append(
                {
                    "centers": [left, right],
                    "pair": sorted(pair),
                }
            )

    # The escape row does contain one actual repeated-blocker pair.  Its
    # common blocker and the escape center again alternate with that pair.
    escape_fibers: dict[int, set[int]] = defaultdict(set)
    for target in ROWS[ESCAPE_CENTER]:
        escape_fibers[BLOCKER[target]].add(target)
    repeated = [
        (center, frozenset(targets))
        for center, targets in escape_fibers.items()
        if len(targets) >= 2
    ]
    assert repeated == [(11, frozenset({2, 7}))]
    common_blocker, repeated_pair = repeated[0]
    assert cyclically_alternating(
        repeated_pair, frozenset({ESCAPE_CENTER, common_blocker})
    )

    # The escaping center is not an actual blocker value.  Consequently the
    # repeated pair cannot use it as the source-faithful second center in
    # CriticalFiberClosingCore.  The robust first apex does not contain the
    # pair either.
    assert ESCAPE_CENTER not in set(BLOCKER.values())
    assert not repeated_pair <= ROWS[FIRST_APEX]

    # The same-cap constructor also fails for this repeated pair: there is no
    # displayed cap containing both centers while excluding both pair points.
    same_cap_candidates = [
        index
        for index, cap in enumerate(CAPS)
        if ESCAPE_CENTER in cap
        and common_blocker in cap
        and repeated_pair.isdisjoint(cap)
    ]
    assert same_cap_candidates == []

    return {
        "schema": "p97-unique4-one-escape-localization-projection-v1",
        "epistemic_status": (
            "exact finite incidence replay; not a Euclidean realization, "
            "CounterexampleData, complete critical-shell system, full "
            "minimality model, MEC packet, or no-M44 model"
        ),
        "carrier_card": N,
        "rows": {
            str(center): sorted(support)
            for center, support in sorted(ROWS.items())
        },
        "blocker": {
            str(source): center
            for source, center in sorted(BLOCKER.items())
        },
        "closed_caps": [sorted(cap) for cap in CAPS],
        "first_apex": FIRST_APEX,
        "second_apex": SECOND_APEX,
        "first_apex_fiber": sorted(fibers[FIRST_APEX]),
        "protected": sorted(protected),
        "escape_center": ESCAPE_CENTER,
        "escape_row": sorted(ROWS[ESCAPE_CENTER]),
        "escape_targets": sorted(escape_targets),
        "escape_repeated_blocker_pair": {
            "pair": sorted(repeated_pair),
            "common_blocker": common_blocker,
            "escape_center_in_blocker_image": False,
            "cyclic_placement": "alternating",
            "same_cap_terminal_candidates": same_cap_candidates,
        },
        "shared_pair_count": len(shared_pairs),
        "all_shared_pairs_alternating": True,
        "shared_pairs": shared_pairs,
        "encoded_source_projection": [
            "one nonself four-row at every carrier center",
            "selected-witness strong connectivity",
            "displayed-cap endpoint/interior row-hit bounds",
            "pairwise selected-row intersection at most two",
            "total fixed-point-free blocker map",
            "every source belongs to its blocker row",
            "first-apex blocker fiber equals the displayed exact row",
            "second physical apex omitted from blocker image",
            "all shared row pairs cyclically alternate",
        ],
        "deliberately_omitted": [
            "complete ambient radius partitions and no_qfree_at",
            "universal minimality over every possible selected row",
            "full rational Kalmanson metric feasibility",
            "nonlinear planar Euclidean realizability",
            "MEC boundary and nonobtuse support-triangle geometry",
            "global alternative-triangle content of noM44",
        ],
    }


def canonical_bytes(payload: dict[str, object]) -> bytes:
    return (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    encoded = canonical_bytes(compute())
    digest = hashlib.sha256(encoded).hexdigest()
    if args.check:
        if AUDIT_PATH.read_bytes() != encoded:
            raise AssertionError("stored audit drifted")
        print(f"PASS_ESCAPE_PAIR_PROJECTION {digest}")
    else:
        AUDIT_PATH.write_bytes(encoded)
        print(f"WROTE_ESCAPE_PAIR_PROJECTION {digest}")


if __name__ == "__main__":
    main()
