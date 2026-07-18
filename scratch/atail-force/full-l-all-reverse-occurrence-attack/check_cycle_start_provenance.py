#!/usr/bin/env python3
"""Exact finite-dynamics regression for cycle/start provenance.

This is deliberately not a geometric model.  It isolates the generic
fixed-point-free functional-graph normalization used by
PhysicalActualCriticalOmissionCycle.
"""

successor = {0: 2, 1: 2, 2: 3, 3: 4, 4: 2}
continuation_first = 0
continuation_second = 1

assert set(successor) == set(range(5))
assert all(successor[q] != q for q in successor)


def orbit(start: int, steps: int) -> list[int]:
    values = [start]
    for _ in range(steps):
        values.append(successor[values[-1]])
    return values


def normalized_cycle(start: int) -> tuple[int, list[int]]:
    seen: dict[int, int] = {}
    values: list[int] = []
    current = start
    while current not in seen:
        seen[current] = len(values)
        values.append(current)
        current = successor[current]
    entry_time = seen[current]
    return entry_time, values[entry_time:]


entry_time, cycle = normalized_cycle(continuation_first)

assert orbit(continuation_first, 4) == [0, 2, 3, 4, 2]
assert entry_time == 1
assert cycle == [2, 3, 4]
assert continuation_first not in cycle
assert continuation_second not in cycle

print("PASS")
print("status=EXACT_FINITE_DYNAMICS_REGRESSION_NOT_GEOMETRIC")
print(f"successor={successor}")
print(f"continuation_first={continuation_first}")
print(f"continuation_second={continuation_second}")
print(f"entry_time={entry_time}")
print(f"cycle={cycle}")
