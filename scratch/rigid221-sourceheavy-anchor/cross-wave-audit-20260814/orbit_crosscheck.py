"""Independent differential check of the label-general common-five orbit.

Reimplements admissibility from the Lean definitions read directly from
source (CyclicTripleAt / CommonFiveOrientationAt in
ExactTwelveRigid221OrderedCoreConsumer.lean) against the production
48-order universe (source_boundary_orders in
census.card_head.exact12_v14_ordered_coverage).  Written without reading
the probe agent's enumerator, so agreement is a differential validation
of its EMPIRICAL orbit figures, not a re-run.

Expected (probe's figures):
  ordered admissible (a,x,b,c,y): 25,032
  unordered orbit (x<y, either assignment passes): 15,588
  distinct CNF rows: 641 pair + 1,944 triple = 2,585
"""

from __future__ import annotations

import sys
from itertools import permutations

sys.path.insert(0, "/Users/adam/projects/math-projects/erdos-97-96-formalization")

from census.card_head.exact12_v14_ordered_coverage import source_boundary_orders

LABELS = range(12)
SO = {6, 7, 8, 9}
SU = {3, 4, 5}
FO = {10, 11}

ORDERS = source_boundary_orders()
assert len(ORDERS) == 48
POSITIONS = []
for _orientation, order in ORDERS:
    pos = {label: index for index, label in enumerate(order)}
    assert len(pos) == 12
    POSITIONS.append(pos)


def cyclic_triple(pos, a, b, c):
    pa, pb, pc = pos[a], pos[b], pos[c]
    return (pa < pb < pc) or (pb < pc < pa) or (pc < pa < pb)


def common_five(pos, a, x, b, c, y):
    return (cyclic_triple(pos, a, x, b) and cyclic_triple(pos, b, c, y)) or (
        cyclic_triple(pos, a, b, x) and cyclic_triple(pos, b, y, c)
    )


def side_conditions(a, x, b, c, y):
    if a == b or x == y:
        return False
    if x in (a, b) or y in (a, b):
        return False
    if c in (b, x, y):
        return False
    return True


def admissible(a, x, b, c, y):
    if not side_conditions(a, x, b, c, y):
        return False
    return all(common_five(pos, a, x, b, c, y) for pos in POSITIONS)


ordered = [
    (a, x, b, c, y)
    for a, x, b, c, y in permutations(LABELS, 5)
    if admissible(a, x, b, c, y)
]
# permutations() gives pairwise-distinct tuples only; the side conditions do
# not force a=c or a=x distinctness by themselves, so enumerate the full
# product for non-pairwise-distinct role assignments too.
ordered_full = []
for a in LABELS:
    for x in LABELS:
        for b in LABELS:
            for c in LABELS:
                for y in LABELS:
                    if admissible(a, x, b, c, y):
                        ordered_full.append((a, x, b, c, y))

unordered = set()
for a, x, b, c, y in ordered_full:
    lo, hi = (x, y) if x < y else (y, x)
    unordered.add((a, lo, b, c, hi))

pair_rows = set()
triple_rows = set()
for a, x, b, c, y in unordered:
    pair_rows.add((x, frozenset((a, b))))
    pair_rows.add((y, frozenset((a, b))))
    triple_rows.add((c, frozenset((b, x, y))))

print(f"ordered (pairwise-distinct only): {len(ordered)}")
print(f"ordered (full product):           {len(ordered_full)}")
print(f"unordered orbit:                  {len(unordered)}")
print(f"pair rows:                        {len(pair_rows)}")
print(f"triple rows:                      {len(triple_rows)}")
print(f"total CNF rows:                   {len(pair_rows) + len(triple_rows)}")

# Oracles.
dominant = (1, 9, 7, 6, 11)
print(f"oracle dominant core {dominant}: {admissible(*dominant)} (expect True)")

v24_family = []
for x, b, c in permutations(sorted(SO), 3):
    if not ((x < b < c) or (c < b < x)):
        continue
    for y in sorted(FO):
        v24_family.append((1, x, b, c, y))
v24_ok = all(admissible(*t) for t in v24_family)
print(f"oracle v24 sixteen-member family: n={len(v24_family)}, "
      f"all admissible={v24_ok} (expect n=16, True)")

negative = (1, 3, 4, 6, 11)  # x=3, b=4 both surplus-internal
print(f"oracle negative {negative}: {admissible(*negative)} (expect False)")

non_between = (1, 7, 9, 6, 11)  # SO triple, b=9 not between 7 and 6
print(f"oracle non-between {non_between}: {admissible(*non_between)} "
      f"(expect False)")
