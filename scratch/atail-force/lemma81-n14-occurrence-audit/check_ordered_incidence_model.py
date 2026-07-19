#!/usr/bin/env python3
"""Find a Lemma-81-free n=14 cap-ordered incidence fixture.

This is an exact finite incidence/order check, not a Euclidean realization.
It enforces the (5,6,6) cap blocks, the sharp own-cap circle bounds, two
five-point physical-apex classes, bi-apex blocker omission, source-locked
exact-card-four critical rows, and the common-deletion row margins.  It then
checks every literal two-row occurrence of Lemma 81.
"""

from itertools import permutations


carrier = set(range(14))
boundary_order = (0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 4, 11, 12, 13)

v2_first_apex = 0
v3_second_apex = 1
v1_surplus_opposite = 2

surplus_cap = {0, 1, 5, 6, 7}
opposite_cap_1 = {1, 2, 3, 8, 9, 10}
opposite_cap_2 = {2, 0, 4, 11, 12, 13}
caps = (surplus_cap, opposite_cap_1, opposite_cap_2)

# Each physical apex has a full five-point radius class.  Deleting q leaves
# the selected four-point rows retained by the common-deletion packet.
q = 3
w = 8
first_apex_class = {3, 8, 9, 5, 4}
second_apex_class = {3, 4, 11, 12, 5}
# A different first-apex class survives simultaneous deletion of q and w,
# as required by the common-deletion parent's retained first-apex double row.
first_apex_double_row = {1, 2, 9, 10}
fixed_rows = {
    v2_first_apex: first_apex_class - {q},
    v3_second_apex: second_apex_class - {q},
}

# A deterministic exact witness found by a bounded coordinate search and then
# frozen here.  Centers 2--13 are actual blocker values.  Equal blocker values
# share the one displayed support, so the two collision fibers are locked.
rows = {
    0: {4, 5, 8, 9},
    1: {4, 5, 11, 12},
    2: {3, 5, 6, 13},
    3: {2, 4, 6, 7},
    4: {0, 5, 7, 12},
    5: {1, 2, 4, 7},
    6: {0, 1, 2, 13},
    7: {1, 4, 10, 13},
    8: {5, 7, 9, 10},
    9: {2, 4, 5, 8},
    10: {2, 4, 9, 11},
    11: {0, 2, 5, 10},
    12: {0, 1, 3, 11},
    13: {0, 6, 9, 12},
}

# The blocker map omits both physical apices and has two nontrivial fibers.
# The paired sources are placed so the sharp endpoint/interior own-cap bound
# can still hold at their common blocker.
blocker = {
    0: 4,
    1: 5,
    2: 6,
    3: 2,
    4: 3,
    5: 2,
    6: 3,
    7: 8,
    8: 9,
    9: 10,
    10: 11,
    11: 12,
    12: 13,
    13: 7,
}


def own_cap_bound(center: int, support: set[int]) -> bool:
    """Sharp cap-chain bound for a circle centered at center."""
    for cap in caps:
        if center not in cap:
            continue
        bound = 1 if center in {v1_surplus_opposite, v2_first_apex, v3_second_apex} else 2
        if len(support & cap) > bound:
            return False
    return True


def cyclic_between(start: int, *rest: int) -> bool:
    """Whether start, then rest occur in strict cyclic order."""
    n = len(boundary_order)
    pos = {point: index for index, point in enumerate(boundary_order)}
    offsets = [((pos[point] - pos[start]) % n) for point in rest]
    return all(left < right for left, right in zip(offsets, offsets[1:]))


def lemma81_witnesses(rows: dict[int, set[int]]) -> list[tuple[int, int, int, int, int]]:
    """List literal W,F,P,X,Z two-row Lemma 81 occurrences."""
    result = []
    for w_center, w_row in rows.items():
        for f, x, z in permutations(w_row, 3):
            for p in rows[z] - {w_center, f, x, z}:
                if x in rows[z] and cyclic_between(w_center, f, p, x, z):
                    result.append((w_center, f, p, x, z))
    return result


def schema_prefix_counts() -> tuple[int, int, int, int]:
    """Counts for raw, W<F<P, W<F<P<X, and the complete cyclic order."""
    pos = {point: index for index, point in enumerate(boundary_order)}
    n = len(boundary_order)

    def offset(start: int, point: int) -> int:
        return (pos[point] - pos[start]) % n

    counts = [0, 0, 0, 0]
    for w_center, w_row in rows.items():
        for z in w_row:
            for x in w_row & rows[z]:
                for f in w_row - {x, z}:
                    for p in rows[z] - {w_center, f, x, z}:
                        if len({w_center, f, p, x, z}) != 5:
                            continue
                        counts[0] += 1
                        if offset(w_center, f) >= offset(w_center, p):
                            continue
                        counts[1] += 1
                        if offset(w_center, p) >= offset(w_center, x):
                            continue
                        counts[2] += 1
                        if offset(w_center, x) >= offset(w_center, z):
                            continue
                        counts[3] += 1
    return tuple(counts)


def check_static_fields(rows: dict[int, set[int]]) -> None:
    assert set(rows) == carrier
    assert all(len(row) == 4 and center not in row for center, row in rows.items())
    assert tuple(map(len, caps)) == (5, 6, 6)
    assert caps[0] | caps[1] | caps[2] == carrier
    assert caps[0] & caps[1] == {v3_second_apex}
    assert caps[1] & caps[2] == {v1_surplus_opposite}
    assert caps[2] & caps[0] == {v2_first_apex}
    assert len(first_apex_class) == 5 and len(second_apex_class) == 5
    assert q in first_apex_class and w in first_apex_class
    assert q in second_apex_class and w not in second_apex_class
    assert rows[v2_first_apex] == {4, 5, 8, 9}
    assert rows[v3_second_apex] == {4, 5, 11, 12}
    assert len(rows[v2_first_apex] & rows[v3_second_apex]) == 2
    assert len(first_apex_double_row) == 4
    assert q not in first_apex_double_row and w not in first_apex_double_row
    assert v2_first_apex not in first_apex_double_row
    assert own_cap_bound(v2_first_apex, first_apex_double_row)
    frontier_marginal = first_apex_class - surplus_cap
    assert {q, w} <= frontier_marginal
    assert len(rows[v3_second_apex] & frontier_marginal) == 1
    assert v2_first_apex not in blocker.values()
    assert v3_second_apex not in blocker.values()
    assert all(source != center for source, center in blocker.items())
    for source, center in blocker.items():
        assert source in rows[center]
    for center, row in rows.items():
        assert own_cap_bound(center, row)


def main() -> None:
    check_static_fields(rows)
    witnesses = lemma81_witnesses(rows)
    assert not witnesses
    prefixes = schema_prefix_counts()
    assert prefixes == (254, 144, 40, 0)
    print("PASS: Lemma-81-free n=14 cap-ordered incidence fixture")
    print(f"boundary_order={boundary_order}")
    print("profile=(5,6,6), physical_class_sizes=(5,5), literal_motifs=0")
    print(f"raw/W<F<P/W<F<P<X/full-order counts={prefixes}")
    for center in sorted(rows):
        print(f"row[{center}]={sorted(rows[center])}")


if __name__ == "__main__":
    main()
