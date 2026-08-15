"""Exhaustive delta probe for the exact-16 BlockerV four-row core.

This extends the checked exact-15 abstraction by one anonymous point outside
the nine-point long cap.  It tests every insertion position of that point in
the two source-forced named orders and every choice of two outside hits in
each of the four rows.  The probe asks whether the existing sixteen metric
motifs still cover all pairwise-separated assignments.
"""

from itertools import combinations, product


OUTSIDE = (1, 3, 4, 5, 13, 14, 15)
CENTERS = (8, 9, 10, 11)
FIXED = ((6, 9), (6, 7), (8, 9), (8, 10))

# Inverse images of the two Lean `position` permutations.
BASE_ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 3, 4, 5, 1, 13, 14),
)

MOTIFS = (
    ((3, 3, 8), (2, 1, 8), (1, 1, 3)),
    ((3, 4, 8), (2, 1, 8), (1, 1, 4)),
    ((3, 5, 8), (2, 1, 8), (1, 1, 5)),
    ((3, 5, 8), (2, 8, 14), (1, 5, 14)),
    ((0, 1, 9), (3, 1, 8), (2, 8, 9)),
    ((0, 3, 9), (3, 3, 8), (2, 8, 9)),
    ((0, 4, 9), (3, 4, 8), (2, 8, 9)),
    ((0, 5, 9), (3, 5, 8), (2, 8, 9)),
    ((0, 6, 9), (2, 1, 9), (1, 1, 6)),
    ((0, 6, 9), (2, 3, 9), (1, 3, 6)),
    ((0, 6, 9), (2, 4, 9), (1, 4, 6)),
    ((0, 6, 9), (2, 5, 9), (1, 5, 6)),
    ((0, 6, 9), (2, 9, 13), (1, 6, 13)),
    ((0, 6, 9), (2, 9, 14), (1, 6, 14)),
    ((0, 9, 13), (3, 8, 13), (2, 8, 9)),
    ((0, 9, 14), (3, 8, 14), (2, 8, 9)),
)


def separated(order: tuple[int, ...], rows: tuple[frozenset[int], ...]) -> bool:
    pos = {point: index for index, point in enumerate(order)}
    for left in range(4):
        for right in range(left + 1, 4):
            common = rows[left] & rows[right]
            statuses = {
                min(pos[CENTERS[left]], pos[CENTERS[right]])
                < pos[point]
                < max(pos[CENTERS[left]], pos[CENTERS[right]])
                for point in common
            }
            if len(common) >= 2 and len(statuses) != len(common):
                return False
    return True


def covered(rows: tuple[frozenset[int], ...]) -> bool:
    return any(
        all(point1 in rows[row] and point2 in rows[row] for row, point1, point2 in motif)
        for motif in MOTIFS
    )


def main() -> None:
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    separated_count = 0
    uncovered_count = 0
    uncovered_using_extra = 0
    cover_all_seven = 0
    by_position: dict[tuple[int, int], list[int]] = {}
    examples: list[tuple[int, int, tuple[tuple[int, int], ...]]] = []
    for order_index, base in enumerate(BASE_ORDERS):
        for insertion in range(16):
            order = base[:insertion] + (15,) + base[insertion:]
            for chosen in product(outside_pairs, repeat=4):
                rows = tuple(
                    frozenset(FIXED[row] + chosen[row]) for row in range(4)
                )
                if not separated(order, rows):
                    continue
                separated_count += 1
                counts = by_position.setdefault((order_index, insertion), [0, 0, 0])
                counts[0] += 1
                if set().union(*(set(pair) for pair in chosen)) == set(OUTSIDE):
                    cover_all_seven += 1
                    counts[2] += 1
                if covered(rows):
                    continue
                uncovered_count += 1
                counts[1] += 1
                if any(15 in pair for pair in chosen):
                    uncovered_using_extra += 1
                if len(examples) < 20:
                    examples.append((order_index, insertion, chosen))
    print(f"separated={separated_count}")
    print(f"uncovered={uncovered_count}")
    print(f"uncovered_using_extra={uncovered_using_extra}")
    print(f"cover_all_seven={cover_all_seven}")
    for key in sorted(by_position):
        if key[1] >= 9:
            print(f"position={key} separated/uncovered/cover7={by_position[key]}")
    for example in examples:
        print(example)


if __name__ == "__main__":
    main()
