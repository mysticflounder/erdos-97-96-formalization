"""Coverage of the exact-16 full-cover residual by a seven-point schema.

For increasing points a<b<c<d<e<f<g, the schema requires

  row(b) hits a,e,g; row(c) hits b,f;
  row(d) hits b,e;   row(e) hits a,f.

The companion metric theorem is the five-equality consequence discovered by
the exact QF_LRA core shrinker.  This file checks only finite occurrence
coverage; it does not certify the metric theorem.
"""

from __future__ import annotations

from itertools import combinations, product

from exact16_delta import BASE_ORDERS, CENTERS, FIXED, OUTSIDE, separated
from full_kalmanson_residual import missed_by_schemas
from schema_coverage import concrete_motifs


def five_equality_motifs(order: tuple[int, ...]):
    center_to_row = {center: row for row, center in enumerate(CENTERS)}
    motifs: set[tuple[tuple[int, int], ...]] = set()
    for a, b, c, d, e, f, g in combinations(order, 7):
        if {b, c, d, e} != set(CENTERS):
            continue
        requirements: dict[int, int] = {}
        for center, hits in (
            (b, (a, e, g)),
            (c, (b, f)),
            (d, (b, e)),
            (e, (a, f)),
        ):
            row = center_to_row[center]
            mask = sum((1 << point for point in hits), 0)
            requirements[row] = requirements.get(row, 0) | mask
        possible = True
        for row, required in requirements.items():
            if not any(
                required & ~sum((1 << point for point in FIXED[row] + pair), 0) == 0
                for pair in combinations(OUTSIDE, 2)
            ):
                possible = False
                break
        if possible:
            motifs.add(tuple(sorted(requirements.items())))
    return motifs


def seven_equality_motifs(order: tuple[int, ...]):
    """Nine-point schema mined from the first five-equality survivor.

    For a<b<c<d<e<f<g<h<i, require

      row(b) hits a,e,h; row(c) hits b,i;
      row(d) hits b,e,g; row(e) hits a,f,i.
    """
    center_to_row = {center: row for row, center in enumerate(CENTERS)}
    motifs: set[tuple[tuple[int, int], ...]] = set()
    for a, b, c, d, e, f, g, h, i in combinations(order, 9):
        if {b, c, d, e} != set(CENTERS):
            continue
        requirements: dict[int, int] = {}
        for center, hits in (
            (b, (a, e, h)),
            (c, (b, i)),
            (d, (b, e, g)),
            (e, (a, f, i)),
        ):
            row = center_to_row[center]
            mask = sum((1 << point for point in hits), 0)
            requirements[row] = requirements.get(row, 0) | mask
        if all(
            any(
                required & ~sum((1 << point for point in FIXED[row] + pair), 0) == 0
                for pair in combinations(OUTSIDE, 2)
            )
            for row, required in requirements.items()
        ):
            motifs.add(tuple(sorted(requirements.items())))
    return motifs


def alternate_five_equality_motifs(order: tuple[int, ...]):
    """The second seven-point/five-equality orientation.

    For a<b<c<d<e<f<g, require

      row(b) hits a,e,f; row(c) hits b,g;
      row(d) hits b,e;   row(e) hits a,g.
    """
    center_to_row = {center: row for row, center in enumerate(CENTERS)}
    motifs: set[tuple[tuple[int, int], ...]] = set()
    for a, b, c, d, e, f, g in combinations(order, 7):
        if {b, c, d, e} != set(CENTERS):
            continue
        requirements: dict[int, int] = {}
        for center, hits in (
            (b, (a, e, f)),
            (c, (b, g)),
            (d, (b, e)),
            (e, (a, g)),
        ):
            row = center_to_row[center]
            mask = sum((1 << point for point in hits), 0)
            requirements[row] = requirements.get(row, 0) | mask
        if all(
            any(
                required & ~sum((1 << point for point in FIXED[row] + pair), 0) == 0
                for pair in combinations(OUTSIDE, 2)
            )
            for row, required in requirements.items()
        ):
            motifs.add(tuple(sorted(requirements.items())))
    return motifs


def main() -> None:
    outside_pairs = tuple(combinations(OUTSIDE, 2))
    total_residual = 0
    total_five_covered = 0
    total_combined_covered = 0
    for order_index, base in enumerate(BASE_ORDERS):
        for insertion in range(9, 16):
            order = base[:insertion] + (15,) + base[insertion:]
            old_motifs = concrete_motifs(order)
            five_motifs = five_equality_motifs(order)
            seven_motifs = seven_equality_motifs(order)
            alternate_motifs = alternate_five_equality_motifs(order)
            residual = 0
            five_covered = 0
            combined_covered = 0
            examples = []
            for chosen in product(outside_pairs, repeat=4):
                rows = tuple(frozenset(FIXED[row] + chosen[row]) for row in range(4))
                if not separated(order, rows) or not missed_by_schemas(old_motifs, rows):
                    continue
                residual += 1
                masks = tuple(sum((1 << point for point in row), 0) for row in rows)
                five_hit = any(
                    all(masks[row] & required == required for row, required in motif)
                    for motif in five_motifs
                )
                seven_hit = any(
                    all(masks[row] & required == required for row, required in motif)
                    for motif in seven_motifs
                )
                alternate_hit = any(
                    all(masks[row] & required == required for row, required in motif)
                    for motif in alternate_motifs
                )
                five_covered += int(five_hit)
                combined_covered += int(five_hit or seven_hit or alternate_hit)
                if not (five_hit or seven_hit or alternate_hit) and len(examples) < 3:
                    examples.append(chosen)
            total_residual += residual
            total_five_covered += five_covered
            total_combined_covered += combined_covered
            print(
                f"order={order_index} insertion={insertion} "
                f"five_motifs={len(five_motifs)} seven_motifs={len(seven_motifs)} "
                f"alternate_motifs={len(alternate_motifs)} "
                f"residual={residual} five_covered={five_covered} "
                f"combined_covered={combined_covered} examples={examples}"
            )
    print(
        f"total_residual={total_residual} "
        f"total_five_covered={total_five_covered} "
        f"total_combined_covered={total_combined_covered}"
    )


if __name__ == "__main__":
    main()
