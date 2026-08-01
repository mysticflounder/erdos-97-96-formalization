#!/usr/bin/env python3
"""Independent structural checks for r2_probe.py's encoding."""

from __future__ import annotations

import json

import numpy as np

from r2_probe import points_c1, points_c2, supporting_crosses


def dist(p: np.ndarray, q: np.ndarray) -> float:
    return float(np.linalg.norm(p - q))


def main() -> None:
    rng = np.random.default_rng(20260728)
    worst_distance_error = 0.0
    for _ in range(1000):
        x2 = rng.uniform(-np.pi, np.pi, 5)
        n2, p2 = points_c2(x2)
        d2 = dict(zip(n2, p2))
        for s, t in (
            ("b", "e1"),
            ("e1", "a"),
            ("a", "p"),
            ("p", "d"),
            ("d", "e2"),
            ("e2", "c"),
        ):
            worst_distance_error = max(
                worst_distance_error, abs(dist(d2[s], d2[t]) - 1.0)
            )
        assert len(supporting_crosses(p2, 1.0)) == 7 * 5

        x1 = rng.uniform(-np.pi, np.pi, 7)
        n1, p1 = points_c1(x1)
        d1 = dict(zip(n1, p1))
        for s, t in (
            ("ek", "a"),
            ("a", "e1"),
            ("e1", "b"),
            ("c", "e2"),
            ("e2", "d"),
            ("d", "eh"),
        ):
            worst_distance_error = max(
                worst_distance_error, abs(dist(d1[s], d1[t]) - 1.0)
            )
        assert len(supporting_crosses(p1, 1.0)) == 8 * 6

    # Positive control: a regular heptagon in boundary order passes every
    # supporting-line test for one sign.
    theta = np.arange(7) * 2.0 * np.pi / 7.0
    regular = np.column_stack((np.cos(theta), np.sin(theta)))
    regular_min = float(np.min(supporting_crosses(regular, 1.0)))
    assert regular_min > 0.0

    # Star-polygon trap: every consecutive turn of this regular pentagram has
    # the same sign, yet the full supporting-line predicate rejects it.
    pent = np.column_stack(
        (
            np.cos(np.arange(5) * 2.0 * np.pi / 5.0),
            np.sin(np.arange(5) * 2.0 * np.pi / 5.0),
        )
    )
    star = pent[[0, 2, 4, 1, 3]]
    local = []
    for i in range(5):
        e1 = star[(i + 1) % 5] - star[i]
        e2 = star[(i + 2) % 5] - star[(i + 1) % 5]
        local.append(float(e1[0] * e2[1] - e1[1] * e2[0]))
    assert min(local) > 0.0
    star_full_min = float(np.min(supporting_crosses(star, 1.0)))
    assert star_full_min < 0.0

    print(
        json.dumps(
            {
                "status": "PASS",
                "random_parameter_samples_per_case": 1000,
                "worst_required_distance_error": worst_distance_error,
                "c2_supporting_inequality_count": 35,
                "c1_supporting_inequality_count": 48,
                "regular_heptagon_min_cross": regular_min,
                "pentagram_min_local_turn": min(local),
                "pentagram_min_full_support_cross": star_full_min,
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
