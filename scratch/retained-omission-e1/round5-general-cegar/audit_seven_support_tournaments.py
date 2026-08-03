#!/usr/bin/env python3
"""Exhaustive audit of the seven 4-support tournament candidate.

Bit i,j (i < j) is 1 when i -> j and 0 when j -> i.  Once pair
coverage and the 21-incidence count have removed double directions, every
candidate is represented by exactly one of the 2^21 tournament bit strings.
"""

from itertools import permutations


N = 7
PAIRS = tuple((i, j) for i in range(N) for j in range(i + 1, N))


def encode(arcs: set[tuple[int, int]]) -> int:
    value = 0
    for bit, (i, j) in enumerate(PAIRS):
        if (i, j) in arcs:
            value |= 1 << bit
    return value


def out_masks(code: int) -> list[int]:
    outs = [0] * N
    for bit, (i, j) in enumerate(PAIRS):
        if (code >> bit) & 1:
            outs[i] |= 1 << j
        else:
            outs[j] |= 1 << i
    return outs


def paley_relabelings() -> set[int]:
    residues = {1, 2, 4}
    base = {(i, j) for i in range(N) for j in range(N) if i != j and (j - i) % N in residues}
    result: set[int] = set()
    for p in permutations(range(N)):
        result.add(encode({(p[i], p[j]) for (i, j) in base}))
    return result


def main() -> None:
    paley = paley_relabelings()
    regular = 0
    qualified: list[int] = []
    for code in range(1 << len(PAIRS)):
        outs = out_masks(code)
        if any(mask.bit_count() != 3 for mask in outs):
            continue
        regular += 1
        if all((outs[i] & outs[j]).bit_count() == 1 for i, j in PAIRS):
            qualified.append(code)

    qualified_set = set(qualified)
    print(f"all labeled tournaments: {1 << len(PAIRS)}")
    print(f"regular labeled tournaments: {regular}")
    print(f"qualified labeled tournaments: {len(qualified_set)}")
    print(f"distinct labeled Paley relabelings: {len(paley)}")
    print(f"qualified minus Paley: {len(qualified_set - paley)}")
    print(f"Paley minus qualified: {len(paley - qualified_set)}")
    print("isomorphism classes among qualified: 1" if qualified_set == paley else "classification mismatch")


if __name__ == "__main__":
    main()
