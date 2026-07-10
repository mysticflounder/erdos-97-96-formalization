"""Executable labeled cap-profile specification for fixed card sizes.

Only the arithmetic consequences ``a >= 5``, ``b >= 5``, ``c >= 4``, and
``a + b + c = n + 3`` are encoded here. This module does not assert that any
additional geometric or solver-side cut is necessary.
"""

from __future__ import annotations

import argparse
import json
from itertools import product


MINIMUM_PROFILE = (5, 5, 4)


def labeled_cap_profiles(
    n: int, minimum: tuple[int, int, int] = MINIMUM_PROFILE
) -> tuple[tuple[int, int, int], ...]:
    """Return all labeled profiles above ``minimum`` with sum ``n + 3``."""

    if n < 0:
        raise ValueError("n must be nonnegative")
    if len(minimum) != 3 or any(value < 0 for value in minimum):
        raise ValueError("minimum must contain three nonnegative values")
    total = n + 3
    profiles = [
        (first, second, third)
        for first, second, third in product(
            range(minimum[0], total + 1),
            range(minimum[1], total + 1),
            range(minimum[2], total + 1),
        )
        if first + second + third == total
    ]
    return tuple(profiles)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n-min", type=int, default=12)
    parser.add_argument("--n-max", type=int, default=14)
    args = parser.parse_args()
    if args.n_min > args.n_max:
        parser.error("--n-min must not exceed --n-max")
    result = {
        str(n): [list(profile) for profile in labeled_cap_profiles(n)]
        for n in range(args.n_min, args.n_max + 1)
    }
    print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
