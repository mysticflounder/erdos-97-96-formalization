#!/usr/bin/env python3
"""Audit the FreshThird cap-profile formulas through n=256."""

from __future__ import annotations

import json
from math import comb


def profiles(n: int) -> list[tuple[int, int, int]]:
    """Labelled cap triples; coordinate 1 is the designated oppIndex1 cap."""
    return [
        (c0, c1, n + 3 - c0 - c1)
        for c0 in range(6, n - 8)
        for c1 in range(6, n - c0 - 2)
        if n + 3 - c0 - c1 >= 6
    ]


def audit(n: int) -> dict[str, int]:
    ps = profiles(n)
    fixed = [p for p in ps if p[1] >= 8]
    s = n - 15
    c_pairs = sum((p[1] - 6) * (p[1] - 7) for p in fixed)
    cq_slots = sum(((p[1] - 6) * (p[1] - 7)) ** 2 for p in fixed)

    assert len(ps) == comb(n - 13, 2)
    assert len(fixed) == (comb(n - 15, 2) if n >= 17 else 0)
    assert c_pairs == 2 * comb(n - 13, 4)
    assert cq_slots == (
        s * (s - 1) * (s + 1) * (s + 2) * (s * s + s - 1) // 30
    )

    return {
        "all_labelled_profiles": len(ps),
        "fixed_designated_profiles": len(fixed),
        "canonical_classes": len({tuple(sorted(p)) for p in fixed}),
        "ordered_C_pairs": c_pairs,
        "raw_CQ_slots": cq_slots,
    }


def main() -> None:
    rows = {n: audit(n) for n in range(15, 257)}
    assert profiles(17) == [(6, 6, 8), (6, 7, 7), (6, 8, 6),
                            (7, 6, 7), (7, 7, 6), (8, 6, 6)]
    assert [p for p in profiles(17) if p[1] >= 8] == [(6, 8, 6)]
    assert [p for p in profiles(18) if p[1] >= 8] == [
        (6, 8, 7),
        (6, 9, 6),
        (7, 8, 6),
    ]
    assert sum(row["all_labelled_profiles"] for row in rows.values()) == 2_391_444
    assert sum(row["fixed_designated_profiles"] for row in rows.values()) == 2_332_880

    s = 256 - 15
    c_peak = max(range(2, s + 1), key=lambda m: m * (m - 1) * (s - m + 1))
    cq_peak = max(
        range(2, s + 1),
        key=lambda m: (m * (m - 1)) ** 2 * (s - m + 1),
    )
    print(
        json.dumps(
            {
                "checked_n": [15, 256],
                "n256": rows[256],
                "n256_C_peak_m": c_peak,
                "n256_CQ_peak_m": cq_peak,
                "status": "PASS",
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
