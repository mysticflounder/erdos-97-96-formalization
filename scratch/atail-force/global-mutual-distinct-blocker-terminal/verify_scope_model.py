#!/usr/bin/env python3
"""Exact finite-scope regression for the canonical distinct-blocker surface.

This is an incidence/cap model, not a Euclidean realization and not a model
of CounterexampleData.  It checks that the fields exposed by the kernel-
checked canonical-row normalization do not force the smallest source-pair
same-cap collision consumed in the accompanying Lean file.
"""

carrier = set(range(14))

surplus = {0, 1, 2, 3, 4}
opp1 = {4, 5, 6, 7, 8, 9}
opp2 = {9, 10, 11, 12, 13, 0}
caps = [surplus, opp1, opp2]

first_apex = 0
second_apex = 4
unused = 9
deleted = 10
partner = 11
continuation_blocker = 5
partner_blocker = 6
deleted_blocker = 7

physical_class = {0, 10, 11, 12, 13}
first_apex_class = {5, 6, 7, 8, 9}

# Complete source-indexed critical supports.
unused_row = {9, 1, 2, 3}
partner_row = {11, 1, 7, 8}
deleted_row = {10, 2, 3, 4}

# Canonical q-deleted rows for deletion of `deleted`.
apex_first_row = {5, 6, 7, 8}
apex_second_row = physical_class - {deleted}
blocker_first_row = unused_row
blocker_second_row = partner_row

assert len(carrier) == 14
assert len(surplus) == 5 and len(opp1) == 6 and len(opp2) == 6
assert surplus | opp1 | opp2 == carrier
assert surplus & opp1 == {4}
assert opp1 & opp2 == {9}
assert opp2 & surplus == {0}

assert len(physical_class) == 5
assert {deleted, partner, 12, 13} <= opp2 - {0, 9}
assert unused in opp2 and unused not in physical_class
assert deleted in physical_class and partner in physical_class

for center, row, source in [
    (continuation_blocker, unused_row, unused),
    (partner_blocker, partner_row, partner),
    (deleted_blocker, deleted_row, deleted),
]:
    assert len(row) == 4
    assert row <= carrier
    assert center not in row
    assert source in row

# Arbitrary mutual omission and the chosen-deletion orientation.
assert partner not in deleted_row
assert deleted not in partner_row
assert deleted not in unused_row
assert continuation_blocker != partner_blocker
assert {continuation_blocker, partner_blocker}.isdisjoint(
    {first_apex, second_apex}
)

# Exact canonical rows exposed by the Lean normalization.
assert blocker_first_row == unused_row
assert blocker_second_row == partner_row
assert apex_second_row == physical_class - {deleted}
for row in [apex_first_row, apex_second_row, blocker_first_row, blocker_second_row]:
    assert len(row) == 4
    assert deleted not in row
assert len(apex_first_row & apex_second_row) <= 2
assert len(blocker_first_row & blocker_second_row) <= 2
assert partner in apex_second_row and partner in blocker_second_row

# Ordered-cap support bounds in the cases where the row center belongs to a cap.
centered_rows = [
    (first_apex, apex_first_row),
    (second_apex, apex_second_row),
    (continuation_blocker, unused_row),
    (partner_blocker, partner_row),
    (deleted_blocker, deleted_row),
]
for center, row in centered_rows:
    for cap in caps:
        if center in cap:
            assert len(row & cap) <= 2

# No two displayed distinct-center circles share more than two points.
for i, (_, row_i) in enumerate(centered_rows):
    for _, row_j in centered_rows[i + 1 :]:
        assert len(row_i & row_j) <= 2

# The smallest checked positive terminal is absent: there is no cap containing
# both actual blockers while excluding both row sources and carrying reciprocal
# source incidences.  Here the reciprocal incidences are already both false.
partner_in_unused_row = partner in unused_row
unused_in_partner_row = unused in partner_row
source_pair_terminal_caps = [
    k
    for k, cap in enumerate(caps)
    if continuation_blocker in cap
    and partner_blocker in cap
    and unused not in cap
    and partner not in cap
    and partner_in_unused_row
    and unused_in_partner_row
]
assert not partner_in_unused_row
assert not unused_in_partner_row
assert source_pair_terminal_caps == []

print("PASS: canonical four-center incidence/cap scope is compatible")
print("blocker-row intersection =", sorted(unused_row & partner_row))
print("source-pair cross incidences =", partner_in_unused_row, unused_in_partner_row)
print("scope only: not Euclidean and not a CounterexampleData realization")
