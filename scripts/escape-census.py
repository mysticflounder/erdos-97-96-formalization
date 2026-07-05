#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Incidence census for the Problem 97 surplus-cap escape model.

This is a combinatorial/token census.  It does not decide metric feasibility of
the rows it emits.
"""

from __future__ import annotations

import argparse
import itertools
import math
from collections import Counter


TOKENS = ("0", "E", "I")
N9_MOSER_TOKEN_TYPES = {
    (2, "E", "I", 4),
    (2, "I", "E", 4),
    (2, "I", "I", 4),
}


def partitions3(total: int) -> list[tuple[int, int, int]]:
    """Partitions of total into at most three parts, as nonincreasing triples."""
    out: list[tuple[int, int, int]] = []
    for a in range(total, -1, -1):
        for b in range(min(a, total - a), -1, -1):
            c = total - a - b
            if b >= c >= 0:
                out.append((a, b, c))
    return out


def labeled_permutations(e: tuple[int, int, int]) -> list[tuple[int, int, int]]:
    return sorted(set(itertools.permutations(e)), reverse=True)


def cap_category(e: tuple[int, int, int]) -> str:
    nz = sum(x > 0 for x in e)
    return ("zero", "m44", "two", "three")[nz]


def token_choices(token: str, interior_size: int) -> int:
    if token == "0":
        return 1
    if token == "E":
        return 1
    if token == "I":
        return interior_size
    raise ValueError(f"unknown token {token!r}")


def moser_rows_for_apex(
    own_interior: int, left_interior: int, right_interior: int
) -> list[tuple[int, str, str, int, int]]:
    """Rows for one Moser apex.

    Returns (own_count, left_token, right_token, class_size, named_placements).
    """
    rows: list[tuple[int, str, str, int, int]] = []
    for own_count in range(own_interior + 1):
        for left_token, right_token in itertools.product(TOKENS, repeat=2):
            class_size = own_count + (left_token != "0") + (right_token != "0")
            escaped = left_token == "I" or right_token == "I"
            if class_size < 4 or not escaped:
                continue
            named = (
                math.comb(own_interior, own_count)
                * token_choices(left_token, left_interior)
                * token_choices(right_token, right_interior)
            )
            rows.append((own_count, left_token, right_token, class_size, named))
    return rows


def moser_rows_for_labeled_vector(
    e: tuple[int, int, int],
) -> list[tuple[int, str, str, int, int]]:
    interiors = [2 + x for x in e]
    rows: list[tuple[int, str, str, int, int]] = []
    for i in range(3):
        rows.extend(
            moser_rows_for_apex(
                interiors[i], interiors[(i + 1) % 3], interiors[(i + 2) % 3]
            )
        )
    return rows


def moser_named_count_for_apex(
    own_interior: int, left_interior: int, right_interior: int
) -> int:
    """Total named placements for one Moser apex.

    This is the closed form for ``sum(named)`` over ``moser_rows_for_apex``.
    """
    # Rows (h,E,I), (h,I,E), (h,I,I) occur for 2 <= h <= O.
    two_or_more = (1 << own_interior) - 1 - own_interior
    # Rows (h,0,I), (h,I,0) occur for 3 <= h <= O.
    three_or_more = two_or_more - math.comb(own_interior, 2)
    return (
        two_or_more * (left_interior + right_interior + left_interior * right_interior)
        + three_or_more * (left_interior + right_interior)
    )


def moser_named_count_for_labeled_vector(e: tuple[int, int, int]) -> int:
    interiors = [2 + x for x in e]
    return sum(
        moser_named_count_for_apex(
            interiors[i], interiors[(i + 1) % 3], interiors[(i + 2) % 3]
        )
        for i in range(3)
    )


def n8_tuples_for_apex(
    own_interior: int,
    left_interior: int,
    right_interior: int,
    *,
    same_one_hit: bool,
    moser_max: int = 2,
) -> set[tuple[int, int, int, int]]:
    """N8 distribution tuples (m, s, l, r) for one non-Moser apex."""
    same_max = max(0, own_interior - 1)
    if same_one_hit:
        same_max = min(same_max, 1)
    out: set[tuple[int, int, int, int]] = set()
    for m in range(moser_max + 1):
        for s in range(same_max + 1):
            for left in range(left_interior + 1):
                for right in range(right_interior + 1):
                    if m + s + left + right >= 4:
                        out.add((m, s, left, right))
    return out


def n8_tuples_for_labeled_vector(
    e: tuple[int, int, int], *, same_one_hit: bool
) -> set[tuple[int, int, int, int]]:
    interiors = [2 + x for x in e]
    out: set[tuple[int, int, int, int]] = set()
    for i in range(3):
        out |= n8_tuples_for_apex(
            interiors[i],
            interiors[(i + 1) % 3],
            interiors[(i + 2) % 3],
            same_one_hit=same_one_hit,
        )
    return out


def n8_tuple_count_for_surplus(total_surplus: int, *, same_one_hit: bool) -> int:
    """Count unique N8 tuples over all labeled cap vectors with given surplus.

    A tuple (m,s,l,r) is possible for some labeled vector e1+e2+e3=p iff the
    minimum surplus needed to support its same/left/right counts is at most p.
    """
    p = total_surplus
    if same_one_hit:
        if p == 0:
            return 27
        return 3 * p * p + 33 * p + 25
    if p == 0:
        return 27
    if p == 1:
        return 84
    return (p**3 + 21 * p * p + 104 * p + 40) // 2


def moser_reflection_type_count(total_surplus: int) -> int:
    """Moser token rows modulo left/right reflection."""
    return 2 + 3 * total_surplus


def moser_primitive_type_count(total_surplus: int, *, reflect: bool) -> int:
    """Four-point primitive Moser escape rows.

    This quotients by subset dominance: any larger same-radius class contains a
    four-point subwitness of one of these types.
    """
    if reflect:
        return 2 if total_surplus == 0 else 3
    return 3 if total_surplus == 0 else 5


def surplus_support_needed(same: int, left: int, right: int) -> int:
    """Minimum surplus needed for an N8 count tuple.

    Base strict-interior capacities are same <= 1 and left/right <= 2.  Larger
    counts require the displayed surplus.
    """
    return max(0, same - 1) + max(0, left - 2) + max(0, right - 2)


def reflected_n8_fixed_count(total_surplus: int, *, same_one_hit: bool) -> int:
    """Rows fixed by the left/right reflection `(m,s,l,r) -> (m,s,r,l)`."""
    p = total_surplus
    if same_one_hit:
        max_lr = 2 + p // 2
        return 6 * max_lr - 3

    total = 0
    for left_right in range(0, 2 + p // 2 + 1):
        remaining = p - 2 * max(0, left_right - 2)
        same_max = remaining + 1
        for moser_count in range(3):
            same_min = max(0, 4 - moser_count - 2 * left_right)
            if same_min <= same_max:
                total += same_max - same_min + 1
    return total


def n8_reflection_count_for_surplus(total_surplus: int, *, same_one_hit: bool) -> int:
    """N8 count-distribution tuples modulo left/right reflection."""
    ordered = n8_tuple_count_for_surplus(total_surplus, same_one_hit=same_one_hit)
    fixed = reflected_n8_fixed_count(total_surplus, same_one_hit=same_one_hit)
    return (ordered + fixed) // 2


def n8_primitive_tuple_count_for_surplus(
    total_surplus: int, *, same_one_hit: bool, reflect: bool
) -> int:
    """Four-point primitive N8 tuples.

    These are the `m+s+l+r = 4` tuples supported by some surplus vector.  The
    optional reflection quotient identifies `(m,s,l,r)` with `(m,s,r,l)`.
    """
    p = total_surplus
    rows: set[tuple[int, int, int, int]] = set()
    for moser_count in range(3):
        for same in range(5):
            if same_one_hit and same > 1:
                continue
            for left in range(5):
                for right in range(5):
                    if moser_count + same + left + right != 4:
                        continue
                    if surplus_support_needed(same, left, right) > p:
                        continue
                    row = (moser_count, same, left, right)
                    if reflect:
                        row = min(row, (moser_count, same, right, left))
                    rows.add(row)
    return len(rows)


def branch_counts(tuples: set[tuple[int, int, int, int]]) -> Counter[str]:
    counts: Counter[str] = Counter()
    for m, s, left, right in tuples:
        if left >= 2 or right >= 2:
            counts["adjacent-heavy"] += 1
        elif m >= 2:
            counts["Moser-pair"] += 1
        elif s >= 2:
            counts["same-cap-heavy"] += 1
        else:
            counts["terminal-1111"] += 1
    return counts


def aggregate_for_n(n: int) -> dict[str, object]:
    p = n - 9
    cap_vectors = partitions3(p)
    categories: Counter[str] = Counter(cap_category(e) for e in cap_vectors)
    moser_named_wlog = 0

    for e in cap_vectors:
        moser_named_wlog += moser_named_count_for_labeled_vector(e)

    return {
        "n": n,
        "surplus": p,
        "cap_vectors": len(cap_vectors),
        "zero": categories["zero"],
        "m44": categories["m44"],
        "two": categories["two"],
        "three": categories["three"],
        "moser_types": 3 + 5 * p,
        "new_moser_types": 5 * p,
        "moser_named_wlog": moser_named_wlog,
        "n8_cardinality": n8_tuple_count_for_surplus(p, same_one_hit=False),
        "n8_same_one_hit": n8_tuple_count_for_surplus(p, same_one_hit=True),
    }


def finite_table_rows(min_n: int, max_n: int) -> list[dict[str, object]]:
    return [aggregate_for_n(n) for n in range(min_n, max_n + 1)]


def dedup_for_n(n: int) -> dict[str, object]:
    p = n - 9
    return {
        "n": n,
        "surplus": p,
        "moser_ordered": 3 + 5 * p,
        "moser_reflect": moser_reflection_type_count(p),
        "moser_primitive": moser_primitive_type_count(p, reflect=False),
        "moser_primitive_reflect": moser_primitive_type_count(p, reflect=True),
        "n8_ordered": n8_tuple_count_for_surplus(p, same_one_hit=False),
        "n8_reflect": n8_reflection_count_for_surplus(p, same_one_hit=False),
        "n8_primitive": n8_primitive_tuple_count_for_surplus(
            p, same_one_hit=False, reflect=False
        ),
        "n8_primitive_reflect": n8_primitive_tuple_count_for_surplus(
            p, same_one_hit=False, reflect=True
        ),
        "n8_same_ordered": n8_tuple_count_for_surplus(p, same_one_hit=True),
        "n8_same_reflect": n8_reflection_count_for_surplus(p, same_one_hit=True),
        "n8_same_primitive": n8_primitive_tuple_count_for_surplus(
            p, same_one_hit=True, reflect=False
        ),
        "n8_same_primitive_reflect": n8_primitive_tuple_count_for_surplus(
            p, same_one_hit=True, reflect=True
        ),
    }


def dedup_table_rows(min_n: int, max_n: int) -> list[dict[str, object]]:
    return [dedup_for_n(n) for n in range(min_n, max_n + 1)]


def print_finite_table(min_n: int, max_n: int, *, table_format: str) -> None:
    rows = finite_table_rows(min_n, max_n)
    if table_format == "markdown":
        headers = [
            "n",
            "surplus",
            "capVec",
            "zero",
            "m44",
            "two",
            "three",
            "moserTypes",
            "newMoser",
            "namedWLOG",
            "n8Card",
            "n8SameHit",
        ]
        print("| " + " | ".join(headers) + " |")
        print("|" + "|".join("---:" for _ in headers) + "|")
        for row in rows:
            print(
                "| "
                + " | ".join(
                    str(row[key])
                    for key in [
                        "n",
                        "surplus",
                        "cap_vectors",
                        "zero",
                        "m44",
                        "two",
                        "three",
                        "moser_types",
                        "new_moser_types",
                        "moser_named_wlog",
                        "n8_cardinality",
                        "n8_same_one_hit",
                    ]
                )
                + " |"
            )
        return

    print("Finite incidence table")
    print("Scope: combinatorial/token census; not metric feasibility.")
    print("N8 columns use m <= 2; n8SameHit additionally imposes s <= 1.")
    print(
        "n surplus capVec zero m44 two three "
        "moserTypes newMoser namedWLOG n8Card n8SameHit"
    )
    for row in rows:
        print(
            f"{row['n']:3d} {row['surplus']:7d} {row['cap_vectors']:6d}"
            f" {row['zero']:4d} {row['m44']:3d} {row['two']:3d} {row['three']:5d}"
            f" {row['moser_types']:10d} {row['new_moser_types']:8d}"
            f" {row['moser_named_wlog']:9d} {row['n8_cardinality']:7d}"
            f" {row['n8_same_one_hit']:10d}"
        )


def print_dedup_table(min_n: int, max_n: int, *, table_format: str) -> None:
    rows = dedup_table_rows(min_n, max_n)
    if table_format == "markdown":
        headers = [
            "n",
            "surplus",
            "moserOrdered",
            "moserRefl",
            "moserPrim",
            "moserPrimRefl",
            "n8Ordered",
            "n8Refl",
            "n8Prim",
            "n8PrimRefl",
            "n8SameOrdered",
            "n8SameRefl",
            "n8SamePrim",
            "n8SamePrimRefl",
        ]
        print("| " + " | ".join(headers) + " |")
        print("|" + "|".join("---:" for _ in headers) + "|")
        for row in rows:
            print(
                "| "
                + " | ".join(
                    str(row[key])
                    for key in [
                        "n",
                        "surplus",
                        "moser_ordered",
                        "moser_reflect",
                        "moser_primitive",
                        "moser_primitive_reflect",
                        "n8_ordered",
                        "n8_reflect",
                        "n8_primitive",
                        "n8_primitive_reflect",
                        "n8_same_ordered",
                        "n8_same_reflect",
                        "n8_same_primitive",
                        "n8_same_primitive_reflect",
                    ]
                )
                + " |"
            )
        return

    print("Deduplication quotient table")
    print("Scope: incidence/token quotients; not metric feasibility.")
    print(
        "n surplus moserOrdered moserRefl moserPrim moserPrimRefl "
        "n8Ordered n8Refl n8Prim n8PrimRefl "
        "n8SameOrdered n8SameRefl n8SamePrim n8SamePrimRefl"
    )
    for row in rows:
        print(
            f"{row['n']:3d} {row['surplus']:7d}"
            f" {row['moser_ordered']:12d} {row['moser_reflect']:10d}"
            f" {row['moser_primitive']:10d} {row['moser_primitive_reflect']:15d}"
            f" {row['n8_ordered']:9d} {row['n8_reflect']:7d}"
            f" {row['n8_primitive']:7d} {row['n8_primitive_reflect']:12d}"
            f" {row['n8_same_ordered']:13d} {row['n8_same_reflect']:11d}"
            f" {row['n8_same_primitive']:11d} {row['n8_same_primitive_reflect']:16d}"
        )


def print_parametric_families() -> None:
    print("Parametric families for a labeled surplus vector")
    print()
    print("Let |Ci| = 4 + ei with ei >= 0 and p = e1 + e2 + e3 = n - 9.")
    print("Let Oi = |Ii| = 2 + ei be the strict cap-interior sizes.")
    print()
    print("Moser-apex escape rows for apex i:")
    print("  own interior size O = Oi; adjacent interior sizes L, R.")
    print("  h ranges over the number of own-cap interior points in the class.")
    print()
    print("  For 2 <= h <= O:")
    print("    (h, E, I), named placements C(O,h) * R")
    print("    (h, I, E), named placements C(O,h) * L")
    print("    (h, I, I), named placements C(O,h) * L * R")
    print()
    print("  For 3 <= h <= O:")
    print("    (h, 0, I), named placements C(O,h) * R")
    print("    (h, I, 0), named placements C(O,h) * L")
    print()
    print("  Per fixed apex, token-row count is 3 + 5*ei.")
    print("  Per labeled cap vector, apex-labeled token-row count is 9 + 5*p.")
    print("  For fixed n, quotienting only by row token shape gives 3 + 5*p")
    print("  possible Moser-apex token shapes across all cap vectors.")
    print()
    print("N8 count-distribution family for a non-Moser apex in cap i:")
    print("  (m, s, l, r) with")
    print("    0 <= m <= 2")
    print("    0 <= s <= Oi - 1  (or s <= 1 under a same-cap one-hit assumption)")
    print("    0 <= l <= O_left")
    print("    0 <= r <= O_right")
    print("    m + s + l + r >= 4")
    print()
    print("  Branch classes:")
    print("    adjacent-heavy: l >= 2 or r >= 2")
    print("    Moser-pair:     l <= 1, r <= 1, m >= 2")
    print("    same-cap-heavy: l <= 1, r <= 1, m <= 1, s >= 2")
    print("    terminal-1111:  remaining cover case")


def print_n10_detail() -> None:
    print("n = 10 detail, WLOG e = (1,0,0), interiors (3,2,2)")
    print()
    print("Surplus apex rows:")
    print("own left right classSize named")
    for row in moser_rows_for_apex(3, 2, 2):
        own_count, left_token, right_token, class_size, named = row
        print(f"{own_count:3d} {left_token:>4s} {right_token:>5s} {class_size:9d} {named:5d}")
    print()
    print("Short apex rows, per short apex:")
    print("own left right classSize named")
    for row in moser_rows_for_apex(2, 3, 2):
        own_count, left_token, right_token, class_size, named = row
        print(f"{own_count:3d} {left_token:>4s} {right_token:>5s} {class_size:9d} {named:5d}")
    print()
    for same_one_hit in (False, True):
        tuples = n8_tuples_for_labeled_vector((1, 0, 0), same_one_hit=same_one_hit)
        label = "same one-hit" if same_one_hit else "cardinality"
        print(f"N8 {label}: {len(tuples)} tuples {dict(branch_counts(tuples))}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--min-n", type=int, default=9)
    parser.add_argument("--max-n", type=int, default=20)
    parser.add_argument("--format", choices=("plain", "markdown"), default="plain")
    parser.add_argument("--families", action="store_true", help="print parametric families first")
    parser.add_argument("--dedup", action="store_true", help="print an additional deduplication table")
    parser.add_argument("--n10-detail", action="store_true", help="print the n=10 detailed table")
    args = parser.parse_args()

    if args.min_n < 9:
        raise SystemExit("--min-n must be at least 9 for this surplus-vector model")
    if args.max_n < args.min_n:
        raise SystemExit("--max-n must be at least --min-n")

    if args.families:
        print_parametric_families()
        print()
    print_finite_table(args.min_n, args.max_n, table_format=args.format)
    if args.dedup:
        print()
        print_dedup_table(args.min_n, args.max_n, table_format=args.format)
    if args.n10_detail:
        print()
        print_n10_detail()


if __name__ == "__main__":
    main()
