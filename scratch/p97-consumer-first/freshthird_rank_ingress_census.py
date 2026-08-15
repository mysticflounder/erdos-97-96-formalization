#!/usr/bin/env python3
"""Source-ingress census for the next FreshThird rank probe.

This is deliberately a cheap pre-run audit.  It does not claim a solver
round: it counts the six carrier points exposed by the two-shell seed, the
six permitted off-endpoint centre locations, and every row-to-seed alias
pattern allowed by the named outside witness.  The resulting dimensions and
the contract for one symbolic rank/distance SMT instance are reported before
any expensive solve is attempted.
"""

from __future__ import annotations

from itertools import permutations
from math import comb


SEED = ("qOutside", "qBetween", "canonicalSource", "c2", "f1", "f2")
OUTSIDE = "outside"


def row_alias_pattern_count() -> int:
    """One designated outside point plus 0..3 distinct seed aliases."""

    return sum(
        comb(3, k) * sum(1 for _ in permutations(SEED, k))
        for k in range(4)
    )


def row_alias_breakdown() -> tuple[int, ...]:
    return tuple(comb(3, k) * sum(1 for _ in permutations(SEED, k)) for k in range(4))


def self_check() -> None:
    # C(3,k) chooses which row positions alias the seed and P(6,k) assigns
    # distinct seed roles.  The remaining positions are anonymous points.
    assert row_alias_breakdown() == (1, 18, 90, 120)
    assert sum(row_alias_breakdown()) == 229


SYMBOLIC_CONTRACT = (
    "Int rank per carrier role; rank equality iff physical identity and "
    "distance=0",
    "six-valued pinned-center choice over the two-shell seed",
    "seed shell supports and each row's internal support positions are "
    "rank-distinct; center is excluded from its own support",
    "row/DRow alias selectors: one named outside witness, 0..3 seed aliases; "
    "cross-row aliases permitted",
    "exact blocker partition equalities; noncollision representatives rank-distinct "
    "from pinned center",
    "conditional strict triangle only under the source-distinct rank guard",
    "both Kalmanson inequalities for every four distinct carrier roles in "
    "compressed cyclic-rank order",
)


def set_partitions(items: tuple[int, ...]) -> list[tuple[tuple[int, ...], ...]]:
    if not items:
        return [()]
    first, *rest = items
    out: list[tuple[tuple[int, ...], ...]] = []
    for partition in set_partitions(tuple(rest)):
        for i in range(len(partition)):
            blocks = [list(block) for block in partition]
            blocks[i].insert(0, first)
            out.append(tuple(tuple(block) for block in blocks))
        out.append(((first,),) + partition)
    return out


def shell_pattern_count(partitions: list[tuple[tuple[int, ...], ...]]) -> int:
    """Count exact shell∩W choices without importing the Z3 probe."""

    total = 0
    for partition in partitions:
        for collision_block in [None, *range(len(partition))]:
            count = 1
            for block_index, block in enumerate(partition):
                if block_index == collision_block:
                    options = 1
                elif len(block) > 2:
                    options = 0
                else:
                    # Base contains the equality-class W points; add 0 or 1
                    # extras while keeping a distinct blocker intersection
                    # of size at most two.
                    options = sum(
                        comb(4 - len(block), extra)
                        for extra in range(0, 3 - len(block))
                    )
                count *= options
            total += count
    return total


def main() -> None:
    self_check()
    partitions = set_partitions((0, 1, 2, 3))
    assert len(partitions) == 15
    shell_cases = shell_pattern_count(partitions)
    assert shell_cases == 778
    center_locations = len(SEED)
    row_cases = row_alias_pattern_count()
    drow_cases = row_alias_pattern_count()
    joint_one_arm = shell_cases * center_locations * row_cases * drow_cases
    print(f"seed_roles={len(SEED)} roles={SEED}")
    print(f"offEndpoint_center_locations={center_locations}")
    print(f"row_to_seed_alias_patterns={row_cases} (w0 external + 0..3 aliases)")
    print(f"drow_to_seed_alias_patterns={drow_cases} (e0 external + 0..3 aliases)")
    print(f"row_alias_breakdown_k0_k3={row_alias_breakdown()}")
    print(f"shell_intersection_cases={shell_cases}")
    print(f"joint_one_arm_cases={joint_one_arm}")
    print("symbolic_contract:")
    for clause in SYMBOLIC_CONTRACT:
        print(f"  - {clause}")
    print("rank_encoding_status=design_only; no_expensive_solve_started")
    print(
        "remaining_omissions=cap-assignment layer; anonymous filler identities "
        "remain existential; source-specific rank arms; universal Lean lift"
    )


if __name__ == "__main__":
    main()
