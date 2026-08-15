"""Test all banked Kalmanson three-equality schemas on the exact-16 delta."""

from collections import Counter
from itertools import combinations, product

from exact16_delta import BASE_ORDERS, CENTERS, FIXED, OUTSIDE, separated


# A code `abc` denotes d(a,b) = d(a,c) in the theorem's ordered coordinates.
SCHEMAS = {
    "six_013_412_523": (6, ((0, 1, 3), (4, 1, 2), (5, 2, 3))),
    "six_012_325_415": (6, ((0, 1, 2), (3, 2, 5), (4, 1, 5))),
    "five_012_124_314": (5, ((0, 1, 2), (1, 2, 4), (3, 1, 4))),
    "six_013_235_415": (6, ((0, 1, 3), (2, 3, 5), (4, 1, 5))),
    "six_140_250_354": (6, ((1, 4, 0), (2, 5, 0), (3, 5, 4))),
    "six_415_305_201": (6, ((4, 1, 5), (3, 0, 5), (2, 0, 1))),
    "five_043_140_203": (5, ((0, 4, 3), (1, 4, 0), (2, 0, 3))),
    "five_410_304_241": (5, ((4, 1, 0), (3, 0, 4), (2, 4, 1))),
    "five_103_243_340": (5, ((1, 0, 3), (2, 4, 3), (3, 4, 0))),
    "five_341_201_104": (5, ((3, 4, 1), (2, 0, 1), (1, 0, 4))),
    "four_012_102_301": (4, ((0, 1, 2), (1, 0, 2), (3, 0, 1))),
    "five_012_123_413": (5, ((0, 1, 2), (1, 2, 3), (4, 1, 3))),
}


def concrete_motifs(order: tuple[int, ...]):
    center_to_row = {center: row for row, center in enumerate(CENTERS)}
    found: dict[tuple[tuple[int, int], ...], set[str]] = {}
    for name, (size, equations) in SCHEMAS.items():
        for chosen in combinations(order, size):
            requirements: dict[int, int] = {}
            possible = True
            for center_index, left_index, right_index in equations:
                center = chosen[center_index]
                row = center_to_row.get(center)
                if row is None:
                    possible = False
                    break
                required = (1 << chosen[left_index]) | (1 << chosen[right_index])
                requirements[row] = requirements.get(row, 0) | required
            if not possible:
                continue
            # A requirement is useful only if one of the 21 possible rows can realize it.
            for row, required in requirements.items():
                if not any(
                    required & ~sum((1 << point for point in FIXED[row] + pair), 0) == 0
                    for pair in combinations(OUTSIDE, 2)
                ):
                    possible = False
                    break
            if possible:
                key = tuple(sorted(requirements.items()))
                found.setdefault(key, set()).add(name)
    return found


def main() -> None:
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    for order_index, base in enumerate(BASE_ORDERS):
        for insertion in range(9, 16):
            order = base[:insertion] + (15,) + base[insertion:]
            motifs = concrete_motifs(order)
            uncovered = 0
            uncovered_cover_all = 0
            schema_hits: Counter[str] = Counter()
            examples = []
            for chosen in product(outside_pairs, repeat=4):
                rows = tuple(frozenset(FIXED[row] + chosen[row]) for row in range(4))
                if not separated(order, rows):
                    continue
                masks = tuple(sum((1 << point for point in row), 0) for row in rows)
                hits = [
                    (requirements, names)
                    for requirements, names in motifs.items()
                    if all(masks[row] & required == required for row, required in requirements)
                ]
                if not hits:
                    uncovered += 1
                    if set().union(*(set(pair) for pair in chosen)) == set(OUTSIDE):
                        uncovered_cover_all += 1
                    if len(examples) < 3:
                        examples.append(chosen)
                else:
                    for name in set().union(*(names for _, names in hits)):
                        schema_hits[name] += 1
            print(
                f"order={order_index} insertion={insertion} motifs={len(motifs)} "
                f"uncovered={uncovered} uncovered_cover_all={uncovered_cover_all} "
                f"hits={dict(schema_hits.most_common())} "
                f"examples={examples}"
            )


if __name__ == "__main__":
    main()
