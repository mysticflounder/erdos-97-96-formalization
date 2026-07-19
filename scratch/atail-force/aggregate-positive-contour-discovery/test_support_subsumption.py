#!/usr/bin/env python3
"""Focused exact checks for product-antichain support subsumption."""

from __future__ import annotations

import itertools
import random

import search_full_product_antichain as search


def brute_minimal(
    supports: list[frozenset[search.Arc]],
) -> tuple[frozenset[search.Arc], ...]:
    unique = set(supports)
    return tuple(
        sorted(
            (
                support
                for support in unique
                if not any(other < support for other in unique)
            ),
            key=lambda item: (len(item), tuple(sorted(item))),
        )
    )


def clauses_accept(
    supports: list[frozenset[search.Arc]] | tuple[frozenset[search.Arc], ...],
    true_arcs: frozenset[search.Arc],
) -> bool:
    return all(not support <= true_arcs for support in supports)


def main() -> None:
    universe = tuple((0, target) for target in range(1, 8))
    bank = [
        frozenset((universe[0], universe[1])),
        frozenset((universe[0], universe[1], universe[2])),
        frozenset((universe[2], universe[3], universe[4])),
        frozenset((universe[2], universe[3], universe[4], universe[5])),
        frozenset((universe[0], universe[1])),
    ]
    expected = brute_minimal(bank)
    assert search.inclusion_minimal_supports(bank) == expected
    assert search.inclusion_minimal_supports(reversed(bank)) == expected
    assert search.support_bank_sha256(bank) == search.support_bank_sha256(reversed(bank))

    for truth_bits in itertools.product((False, True), repeat=len(universe)):
        true_arcs = frozenset(
            arc for arc, value in zip(universe, truth_bits, strict=True) if value
        )
        assert clauses_accept(bank, true_arcs) == clauses_accept(expected, true_arcs)

    generator = random.Random(20260719)
    for _case in range(200):
        random_bank = [
            frozenset(generator.sample(universe, generator.randint(1, len(universe))))
            for _support in range(generator.randint(1, 80))
        ]
        assert search.inclusion_minimal_supports(random_bank) == brute_minimal(
            random_bank
        )

    print("support subsumption exact checks: PASS")


if __name__ == "__main__":
    main()
