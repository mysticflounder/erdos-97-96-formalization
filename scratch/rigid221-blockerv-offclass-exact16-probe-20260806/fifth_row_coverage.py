"""Test the live fifth selected row against the exact-16 four-row survivors.

The fifth row is centered at the actual blocker ``d`` of the row selected at
the off-class point ``c`` (label 11).  Source facts used here are deliberately
limited to:

* the row has four points and contains ``c``;
* its center is not in its support;
* it meets the physical five-class (labels 6--10) in at most one point;
* distinct equal-radius centers separate every common support pair;
* all twelve banked Kalmanson three-equality schemas.

This remains a finite theorem-discovery probe, not a proof artifact.
"""

from collections import Counter
from itertools import combinations, product

from exact16_delta import BASE_ORDERS, CENTERS, FIXED, OUTSIDE, separated
from schema_coverage import concrete_motifs


PHYSICAL = frozenset((6, 7, 8, 9, 10))
C = 11
POINTS = tuple(range(16))


def mask(points) -> int:
    return sum(1 << point for point in points)


def rows_separated_with_fifth(
    row_masks: tuple[int, ...],
    support_mask: int,
    between_masks: tuple[int, ...],
) -> bool:
    for old_mask, between in zip(row_masks, between_masks, strict=True):
        common = old_mask & support_mask
        common_card = common.bit_count()
        if common_card < 2:
            continue
        if common_card != 2 or (common & between).bit_count() != 1:
            return False
    return True


def motifs_with_fifth(order: tuple[int, ...], center: int):
    """All banked schema occurrences which genuinely use the fifth row."""
    centers = CENTERS + (center,)
    center_to_row = {point: row for row, point in enumerate(centers)}
    found: set[tuple[tuple[int, int], ...]] = set()

    # Reuse the schemas through the existing generator by temporarily replacing
    # its four-center restriction with the same finite expansion here.
    from schema_coverage import SCHEMAS

    for _name, (size, equations) in SCHEMAS.items():
        for chosen in combinations(order, size):
            requirements: dict[int, int] = {}
            for center_index, left_index, right_index in equations:
                row = center_to_row.get(chosen[center_index])
                if row is None:
                    break
                required = (1 << chosen[left_index]) | (1 << chosen[right_index])
                requirements[row] = requirements.get(row, 0) | required
            else:
                if 4 in requirements:
                    found.add(tuple(sorted(requirements.items())))
    return tuple(found)


def split_motifs(motifs):
    result = []
    for motif in motifs:
        requirements = dict(motif)
        fifth = requirements.pop(4)
        result.append((tuple(requirements.items()), fifth))
    return tuple(result)


def main() -> None:
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    for order_index, base in enumerate(BASE_ORDERS):
        for insertion in range(9, 16):
            order = base[:insertion] + (15,) + base[insertion:]
            pos = {point: index for index, point in enumerate(order)}
            old_motifs = concrete_motifs(order)
            fifth_by_center = {
                center: (
                    split_motifs(motifs_with_fifth(order, center)),
                    tuple(
                        mask((C,) + rest)
                        for rest in combinations(
                            tuple(point for point in POINTS if point not in (C, center)),
                            3,
                        )
                        if len(PHYSICAL & frozenset(rest)) <= 1
                    ),
                    tuple(
                        mask(
                            point
                            for point in POINTS
                            if min(pos[old_center], pos[center])
                            < pos[point]
                            < max(pos[old_center], pos[center])
                        )
                        for old_center in CENTERS
                    ),
                )
                for center in POINTS
                if center not in CENTERS and center != C
            }
            four_row_survivors = 0
            survivors_with_fifth = 0
            fifth_candidates = 0
            surviving_fifth_candidates = 0
            center_hits: Counter[int] = Counter()
            examples = []
            for chosen in product(outside_pairs, repeat=4):
                rows = tuple(frozenset(FIXED[row] + chosen[row]) for row in range(4))
                if not separated(order, rows):
                    continue
                row_masks = tuple(mask(row) for row in rows)
                if any(
                    all(row_masks[row] & required == required for row, required in requirements)
                    for requirements in old_motifs
                ):
                    continue
                four_row_survivors += 1
                assignment_survives = False
                for center, (motifs, supports, between_masks) in fifth_by_center.items():
                    forbidden = {
                        fifth
                        for old_requirements, fifth in motifs
                        if all(
                            row_masks[row] & required == required
                            for row, required in old_requirements
                        )
                    }
                    for support_mask in supports:
                        if not rows_separated_with_fifth(
                            row_masks, support_mask, between_masks
                        ):
                            continue
                        fifth_candidates += 1
                        if any(support_mask & required == required for required in forbidden):
                            continue
                        surviving_fifth_candidates += 1
                        center_hits[center] += 1
                        assignment_survives = True
                        if len(examples) < 3:
                            support = tuple(
                                point for point in POINTS if support_mask & (1 << point)
                            )
                            examples.append((chosen, center, support))
                if assignment_survives:
                    survivors_with_fifth += 1
            print(
                f"order={order_index} insertion={insertion} "
                f"four={four_row_survivors} assignments={survivors_with_fifth} "
                f"fifth={surviving_fifth_candidates}/{fifth_candidates} "
                f"centers={dict(center_hits)} examples={examples}"
            )


if __name__ == "__main__":
    main()
