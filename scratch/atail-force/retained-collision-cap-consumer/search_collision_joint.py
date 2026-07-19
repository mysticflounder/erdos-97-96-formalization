#!/usr/bin/env python3
"""Joint row and boundary discovery for the finite collision regression."""

from __future__ import annotations

import itertools

import z3


N = 12
FIRST_APEX = 4
RETAINED = frozenset({1, 2, 6, 9, 11})
BLOCKER = (1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3)


def between(x: z3.ArithRef, y: z3.ArithRef, z: z3.ArithRef) -> z3.BoolRef:
    return z3.Or(z3.And(x < z, z < y), z3.And(y < z, z < x))


solver = z3.Solver()
row = [[z3.Bool(f"r_{c}_{x}") for x in range(N)] for c in range(N)]
pos = [z3.Int(f"p_{x}") for x in range(N)]

solver.add(*(z3.And(0 <= p, p < N) for p in pos))
solver.add(z3.Distinct(pos), pos[FIRST_APEX] == 0)
solver.add(
    pos[0] == 6,
    z3.Or(z3.And(pos[1] == 5, pos[2] == 7), z3.And(pos[1] == 7, pos[2] == 5)),
)

for center in range(N):
    solver.add(z3.PbEq([(row[center][x], 1) for x in range(N)], 4))
    solver.add(z3.Not(row[center][center]))
for source in range(N):
    solver.add(row[BLOCKER[source]][source])

for center in range(N):
    if center != FIRST_APEX:
        solver.add(z3.PbLe([(row[center][x], 1) for x in RETAINED], 2))

for first_center, second_center in itertools.combinations(range(N), 2):
    solver.add(
        z3.PbLe(
            [
                (z3.And(row[first_center][x], row[second_center][x]), 1)
                for x in range(N)
            ],
            2,
        )
    )

def member(center: int, point: int) -> z3.BoolRef:
    if center == FIRST_APEX:
        return z3.BoolVal(point in RETAINED)
    return row[center][point]


for first_center, second_center in itertools.combinations(range(N), 2):
    for first_point, second_point in itertools.combinations(range(N), 2):
        if second_point in {first_center, second_center}:
            first_point, second_point = second_point, first_point
        if second_point in {first_center, second_center}:
            continue
        shared = z3.And(
            member(first_center, first_point),
            member(second_center, first_point),
            member(first_center, second_point),
            member(second_center, second_point),
        )
        solver.add(
            z3.Implies(
                shared,
                between(pos[first_center], pos[second_center], pos[first_point])
                != between(pos[first_center], pos[second_center], pos[second_point]),
            )
        )

# Exact finite row-closure consequence of minimality.
for mask in range(1, (1 << N) - 1):
    inside = [x for x in range(N) if mask & (1 << x)]
    outside = [x for x in range(N) if not mask & (1 << x)]
    solver.add(z3.Or(*(row[center][point] for center in inside for point in outside)))

result = solver.check()
print(result)
if result == z3.sat:
    model = solver.model()
    rows = [
        [x for x in range(N) if z3.is_true(model.eval(row[c][x]))]
        for c in range(N)
    ]
    boundary = sorted(range(N), key=lambda x: model.eval(pos[x]).as_long())
    positions = [model.eval(pos[x]).as_long() for x in range(N)]
    print("rows=[")
    for support in rows:
        print(f"  {support},")
    print("]")
    print(f"boundary={boundary}")
    print(f"positions={positions}")
