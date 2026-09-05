# `cardge13_five_good_source_coupling_classifier.py`

Original Python SHA-256: `18b185a73214ab21874af69d958820eff463574338fedbfe678067b7e13facc9`

```python
#!/usr/bin/env python3
"""
Exact finite classifier for the abstract five-good-source coupling used in the
cardGeThirteen route.

This checks only the source-neutral finite core. It does not assert that the
current Lean target supplies the good-source cardinality premise; that source
gate must be proved separately.
"""

from __future__ import annotations

import json
from itertools import product
from typing import Iterable, NamedTuple

Q = 1
W = 2
BOTH = Q | W
NONEMPTY_SUBSETS = (Q, W, BOTH)


def restricted_growth_strings(n: int) -> Iterable[tuple[int, ...]]:
    """Enumerate canonical set partitions of range(n)."""
    if n <= 0:
        yield ()
        return

    def rec(prefix: list[int], maximum: int) -> Iterable[tuple[int, ...]]:
        if len(prefix) == n:
            yield tuple(prefix)
            return
        for value in range(maximum + 2):
            yield from rec(prefix + [value], max(maximum, value))

    yield from rec([0], 0)


class Survivor(NamedTuple):
    n: int
    blocker_labels: tuple[int, ...]
    omission_sets: tuple[int, ...]
    fiber_sizes: tuple[int, ...]
    fiber_omissions: tuple[int, ...]


def has_three_center_opportunity(
    blockers: tuple[int, ...], omissions: tuple[int, ...]
) -> bool:
    for i in range(len(blockers)):
        for j in range(i + 1, len(blockers)):
            if blockers[i] != blockers[j] and omissions[i] & omissions[j]:
                return True
    return False


def support_cardinality_is_compatible(
    blockers: tuple[int, ...], omissions: tuple[int, ...]
) -> bool:
    """
    Enforce consequences of equal blocker -> equal support.

    Therefore O(s) is constant on a blocker fiber. If that common O is {q},
    the support also contains w; if it is {w}, it also contains q. A support
    has cardinality four.
    """
    for blocker in sorted(set(blockers)):
        indices = [i for i, value in enumerate(blockers) if value == blocker]
        fiber_omissions = {omissions[i] for i in indices}
        if len(fiber_omissions) != 1:
            return False
        omission = next(iter(fiber_omissions))
        forced_retained_points = 1 if omission in (Q, W) else 0
        if len(indices) + forced_retained_points > 4:
            return False
    return True


def classify(n: int) -> list[Survivor]:
    survivors: list[Survivor] = []
    for blockers in restricted_growth_strings(n):
        labels = sorted(set(blockers))
        sizes = {label: blockers.count(label) for label in labels}
        if max(sizes.values()) > 4:
            continue

        for omissions in product(NONEMPTY_SUBSETS, repeat=n):
            if has_three_center_opportunity(blockers, omissions):
                continue
            if not support_cardinality_is_compatible(blockers, omissions):
                continue

            fiber_omissions = tuple(
                omissions[blockers.index(label)] for label in labels
            )
            survivors.append(
                Survivor(
                    n=n,
                    blocker_labels=blockers,
                    omission_sets=omissions,
                    fiber_sizes=tuple(sizes[label] for label in labels),
                    fiber_omissions=fiber_omissions,
                )
            )

    return survivors


def verify_survivor(survivor: Survivor) -> None:
    sizes = sorted(survivor.fiber_sizes)
    omissions = sorted(survivor.fiber_omissions)

    assert len(sizes) == 2, survivor
    assert omissions == [Q, W], survivor
    assert max(sizes) <= 3, survivor
    assert survivor.n in (5, 6), survivor
    assert sizes in ([2, 3], [3, 3]), survivor


def main() -> dict[str, object]:
    per_n: dict[str, object] = {}
    all_survivors: list[Survivor] = []

    for n in range(5, 9):
        survivors = classify(n)
        for survivor in survivors:
            verify_survivor(survivor)
        all_survivors.extend(survivors)

        normalized_types = sorted(
            {
                (
                    tuple(sorted(survivor.fiber_sizes)),
                    tuple(sorted(survivor.fiber_omissions)),
                )
                for survivor in survivors
            }
        )
        per_n[str(n)] = {
            "survivor_count": len(survivors),
            "normalized_types": [
                {
                    "fiber_sizes": list(sizes),
                    "fiber_omission_bitsets": list(omissions),
                }
                for sizes, omissions in normalized_types
            ],
        }

    assert per_n["5"]["survivor_count"] > 0
    assert per_n["6"]["survivor_count"] > 0
    assert per_n["7"]["survivor_count"] == 0
    assert per_n["8"]["survivor_count"] == 0

    return {
        "schema": "cardge13-five-good-source-coupling-classifier-v1",
        "scope": (
            "source-neutral finite classifier; current Lean source must "
            "separately prove the good-source cardinality and omission APIs"
        ),
        "omission_bitsets": {"q": Q, "w": W, "both": BOTH},
        "per_n": per_n,
        "total_survivors": len(all_survivors),
        "theorem_checked": {
            "no_three_center_opportunity_implies_exactly_two_blockers": True,
            "blocker_omission_sets_are_complementary_singletons": True,
            "each_blocker_fiber_card_le_three": True,
            "ambient_good_source_card_is_five_or_six": True,
            "fiber_sizes_are_2_3_or_3_3": True,
            "card_at_least_seven_forces_three_center_opportunity": True,
        },
    }


if __name__ == "__main__":
    print(json.dumps(main(), indent=2, sort_keys=True))
```
