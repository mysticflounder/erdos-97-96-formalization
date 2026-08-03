#!/usr/bin/env python3
"""Exhaust the cap-compatible cyclic orders of the 15-point equality shadow.

This is an exact finite equality/order computation.  It does not assert that
the equality shadow has a Euclidean realization, nor does it establish the
geometric hypotheses of any cited Lean theorem.
"""

from __future__ import annotations

import hashlib
import json
import runpy
from collections import Counter, defaultdict
from itertools import combinations, permutations, product
from pathlib import Path
from typing import Iterable


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
SHADOW_SOURCE = REPO / "scratch/triapex-incidence-obstruction/check_model.py"
LEAN_SOURCES = {
    "two_triple": REPO
    / "lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean",
    "sparse": REPO
    / "lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean",
    "kalmanson": REPO
    / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
}
MINER_SOURCES = {
    "miner": HERE / "mine_orders.py",
    "uv_project": HERE / "pyproject.toml",
}

POINTS = tuple(range(15))
STRICT_CAPS = (
    (0, 1, 2, 3),
    (4, 5, 6, 7),
    (8, 9, 10, 11),
)
APICES = (12, 13, 14)
RICH_CLASSES = (
    frozenset((*STRICT_CAPS[0], 13, 14)),
    frozenset((*STRICT_CAPS[1], 12, 14)),
    frozenset((*STRICT_CAPS[2], 12, 13)),
)
SHELLS = (
    frozenset((1, 6, 9, 14)),
    frozenset((2, 7, 10, 14)),
    frozenset((3, 7, 11, 13)),
    frozenset((0, 4, 10, 13)),
    frozenset((1, 5, 6, 8)),
    frozenset((3, 6, 10, 14)),
    frozenset((1, 7, 11, 14)),
    frozenset((3, 4, 11, 12)),
    frozenset((1, 5, 9, 11)),
    frozenset((1, 4, 11, 13)),
    frozenset((0, 7, 12, 13)),
    frozenset((3, 5, 12, 13)),
)

FAMILIES = (
    "two_triple_raw_equalities",
    "sparse_raw_equalities",
    "sparse_two_selected_rows",
    "kalmanson_two_selected_rows",
)


def edge(a: int, b: int) -> tuple[int, int]:
    assert a != b
    return (a, b) if a < b else (b, a)


class DSU:
    def __init__(self) -> None:
        self.parent = {pair: pair for pair in combinations(POINTS, 2)}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        while self.parent[item] != item:
            self.parent[item] = self.parent[self.parent[item]]
            item = self.parent[item]
        return item

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[right] = left


def equality_quotient() -> DSU:
    dsu = DSU()
    rows = tuple(enumerate(SHELLS)) + tuple(zip(APICES, RICH_CLASSES, strict=True))
    for center, support in rows:
        row_edges = [edge(center, point) for point in sorted(support)]
        for other in row_edges[1:]:
            dsu.union(row_edges[0], other)
    return dsu


def equality_fibers(dsu: DSU) -> dict[int, tuple[frozenset[int], ...]]:
    result = {}
    for center in POINTS:
        groups: dict[tuple[int, int], set[int]] = defaultdict(set)
        for point in POINTS:
            if point != center:
                groups[dsu.find(edge(center, point))].add(point)
        result[center] = tuple(
            sorted((frozenset(group) for group in groups.values()), key=lambda x: tuple(sorted(x)))
        )
    return result


def cap_orders() -> Iterable[tuple[int, ...]]:
    """One orientation/rotation convention for the three closed cap arcs.

    The rich row at apex 12 has closed cap endpoints 13,14 and strict interior
    STRICT_CAPS[0], and cyclically for apices 13 and 14.  Hence a representative
    global group order is 13,C0,14,C1,12,C2.  Reversal and rotation do not add
    cyclic orders; all 4!^3 internal label permutations are enumerated.
    """
    for cap0, cap1, cap2 in product(*(permutations(cap) for cap in STRICT_CAPS)):
        yield (13, *cap0, 14, *cap1, 12, *cap2)


def cyclically_ordered(roles: tuple[int, ...], positions: dict[int, int]) -> bool:
    """Whether roles occur in the displayed cyclic order, with roles[0] as start."""
    n = len(positions)
    start = positions[roles[0]]
    offsets = tuple((positions[point] - start) % n for point in roles[1:])
    return all(left < right for left, right in zip((0, *offsets), offsets))


def raw_patterns(
    fibers: dict[int, tuple[frozenset[int], ...]],
) -> dict[str, set[tuple[int, ...]]]:
    patterns = {family: set() for family in FAMILIES}

    # A < B < C < D < E < F; B:{A,C,D}, F:{A,D,E}.
    for b in POINTS:
        for fiber in fibers[b]:
            if len(fiber) < 3:
                continue
            for a, c, d in permutations(fiber, 3):
                used = {a, b, c, d}
                for f in POINTS:
                    if f in used:
                        continue
                    matching = next((group for group in fibers[f] if a in group), frozenset())
                    if d not in matching:
                        continue
                    for e in matching - used - {f}:
                        patterns["two_triple_raw_equalities"].add((a, b, c, d, e, f))

    # i0:{i1,i3,i5}, i2:{i1,i3,i4}.
    for i0 in POINTS:
        for fiber0 in fibers[i0]:
            if len(fiber0) < 3:
                continue
            for i1, i3, i5 in permutations(fiber0, 3):
                used = {i0, i1, i3, i5}
                for i2 in POINTS:
                    if i2 in used:
                        continue
                    matching = next((group for group in fibers[i2] if i1 in group), frozenset())
                    if i3 not in matching:
                        continue
                    for i4 in matching - used - {i2}:
                        patterns["sparse_raw_equalities"].add((i0, i1, i2, i3, i4, i5))

    # The same sparse schema, but both centers and all six incidences must come
    # from the 12 actual four-point selected rows.
    for i0, support0 in enumerate(SHELLS):
        for i1, i3, i5 in permutations(support0, 3):
            used = {i0, i1, i3, i5}
            for i2, support2 in enumerate(SHELLS):
                if i2 in used or not {i1, i3} <= support2:
                    continue
                for i4 in support2 - used - {i2}:
                    patterns["sparse_two_selected_rows"].add((i0, i1, i2, i3, i4, i5))

    # ia < ib < ic < id; selected rows ia,ib share the late pair ic,id.
    for ia, support_a in enumerate(SHELLS):
        for ib, support_b in enumerate(SHELLS):
            if ia == ib:
                continue
            for ic, id_ in permutations((support_a & support_b) - {ia, ib}, 2):
                patterns["kalmanson_two_selected_rows"].add((ia, ib, ic, id_))

    return patterns


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def pattern_key(item: tuple[str, tuple[int, ...]]) -> tuple[int, tuple[int, ...]]:
    family, roles = item
    return FAMILIES.index(family), roles


def greedy_cover(
    full_mask: int, coverage: dict[tuple[str, tuple[int, ...]], int]
) -> list[tuple[str, tuple[int, ...]]]:
    uncovered = full_mask
    chosen = []
    while uncovered:
        item, mask = max(
            coverage.items(),
            key=lambda kv: ((kv[1] & uncovered).bit_count(), tuple(-x for x in pattern_key(kv[0])[1])),
        )
        gain = mask & uncovered
        if not gain:
            raise AssertionError("pattern universe is not covered")
        chosen.append(item)
        uncovered &= ~mask
    return chosen


def irredundant_cover(
    full_mask: int,
    coverage: dict[tuple[str, tuple[int, ...]], int],
    initial: list[tuple[str, tuple[int, ...]]],
) -> list[tuple[str, tuple[int, ...]]]:
    chosen = list(initial)
    changed = True
    while changed:
        changed = False
        for item in reversed(chosen):
            trial = [other for other in chosen if other != item]
            union = 0
            for other in trial:
                union |= coverage[other]
            if union == full_mask:
                chosen = trial
                changed = True
                break
    return chosen


def render_pattern(item: tuple[str, tuple[int, ...]], count: int) -> dict[str, object]:
    family, roles = item
    return {"family": family, "roles": list(roles), "orders_covered": count}


def main() -> None:
    shadow = runpy.run_path(str(SHADOW_SOURCE))
    assert tuple(shadow["STRICT_CAPS"]) == tuple(map(frozenset, STRICT_CAPS))
    assert tuple(shadow["RICH_CLASSES"]) == RICH_CLASSES
    assert tuple(shadow["SHELLS"]) == SHELLS

    dsu = equality_quotient()
    fibers = equality_fibers(dsu)
    patterns = raw_patterns(fibers)
    orders = tuple(cap_orders())
    assert len(orders) == 24**3 == 13_824
    assert len(set(orders)) == len(orders)
    assert all(set(order) == set(POINTS) for order in orders)

    family_masks = {family: 0 for family in FAMILIES}
    coverage: dict[tuple[str, tuple[int, ...]], int] = {}
    first_witnesses: dict[str, dict[str, object]] = {}
    order_hits: list[tuple[str, ...]] = []
    for order_index, order in enumerate(orders):
        positions = {point: i for i, point in enumerate(order)}
        hits = []
        for family in FAMILIES:
            witnesses = sorted(
                roles for roles in patterns[family] if cyclically_ordered(roles, positions)
            )
            if witnesses:
                hits.append(family)
                family_masks[family] |= 1 << order_index
                first_witnesses.setdefault(
                    family, {"order": list(order), "roles": list(witnesses[0])}
                )
                for roles in witnesses:
                    coverage[(family, roles)] = coverage.get((family, roles), 0) | (
                        1 << order_index
                    )
        order_hits.append(tuple(hits))

    full_mask = (1 << len(orders)) - 1
    union_mask = 0
    for mask in family_masks.values():
        union_mask |= mask
    survivors = [list(orders[i]) for i in range(len(orders)) if not (union_mask >> i) & 1]

    cover_data: dict[str, object] | None = None
    if not survivors:
        # This is a deterministic greedy set cover, followed by deletion of any
        # redundant selected patterns.  The report labels it IRREDUNDANT, not
        # minimum, unless its size meets the elementary maximum-coverage bound.
        greedy = greedy_cover(full_mask, coverage)
        cover = irredundant_cover(full_mask, coverage, greedy)
        max_pattern_coverage = max(mask.bit_count() for mask in coverage.values())
        lower_bound = (len(orders) + max_pattern_coverage - 1) // max_pattern_coverage
        cover_data = {
            "status": "minimum" if len(cover) == lower_bound else "irredundant_upper_bound",
            "lower_bound": lower_bound,
            "maximum_single_pattern_coverage": max_pattern_coverage,
            "size": len(cover),
            "pairwise_overlap_orders": (
                (coverage[cover[0]] & coverage[cover[1]]).bit_count()
                if len(cover) == 2
                else None
            ),
            "patterns": [
                render_pattern(item, coverage[item].bit_count()) for item in cover
            ],
        }

    hit_profile = Counter(order_hits)
    source_paths = {"shadow": SHADOW_SOURCE, **LEAN_SOURCES, **MINER_SOURCES}
    result = {
        "schema_version": 1,
        "order_convention": {
            "cyclic_groups": [13, list(STRICT_CAPS[0]), 14, list(STRICT_CAPS[1]), 12, list(STRICT_CAPS[2])],
            "quotient": "one representative up to global rotation and reversal",
            "within_cap_permutations": "4!^3",
        },
        "total_orders": len(orders),
        "candidate_patterns": {family: len(patterns[family]) for family in FAMILIES},
        "killed_by_family": {family: family_masks[family].bit_count() for family in FAMILIES},
        "killed_by_union": union_mask.bit_count(),
        "survivors": len(survivors),
        "survivor_orders": survivors,
        "first_witness_by_family": first_witnesses,
        "family_hit_profile": [
            {"families": list(families), "orders": count}
            for families, count in sorted(hit_profile.items(), key=lambda item: (len(item[0]), item[0]))
        ],
        "finite_pattern_cover": cover_data,
        "sources": {
            name: {"path": str(path.relative_to(REPO)), "sha256": sha256(path)}
            for name, path in source_paths.items()
        },
        "epistemic_scope": {
            "status": "EMPIRICALLY VERIFIED by exhaustive exact finite enumeration",
            "included": [
                "the exact equality closure of the 12 SHELLS and 3 RICH_CLASSES",
                "all 4!^3 within-strict-cap permutations in the stated cyclic group order",
                "raw equality hypotheses of the two six-point theorem schemas",
                "full-shell membership hypotheses for selected-row consumers",
            ],
            "excluded": [
                "Lean elaboration or kernel checking in this run",
                "existence of a planar or Euclidean realization",
                "MEC, convex-independence, minimality, robustness, and production-spine closure",
            ],
        },
    }

    json_path = HERE / "results.json"
    md_path = HERE / "REPORT.md"
    json_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")

    lines = [
        "# Exact 15-point cyclic-order kernel mine",
        "",
        f"Exhausted **{len(orders)} = 4!^3** cap-compatible cyclic orders. "
        f"The checked families kill **{union_mask.bit_count()}** orders; "
        f"**{len(survivors)} survive**.",
        "",
        "## Family counts",
        "",
        "Counts overlap; each row means that at least one concrete instance of that schema fires.",
        "",
        "| Family | Candidate role patterns | Orders killed |",
        "|---|---:|---:|",
    ]
    for family in FAMILIES:
        lines.append(f"| `{family}` | {len(patterns[family])} | {family_masks[family].bit_count()} |")
    lines += ["", "## Witnesses", ""]
    for family in FAMILIES:
        witness = first_witnesses.get(family)
        if witness is None:
            lines.append(f"- `{family}`: no occurrence.")
        else:
            lines.append(
                f"- `{family}`: roles `{witness['roles']}` in order `{witness['order']}`."
            )
    if cover_data is not None:
        lines += [
            "",
            "## Finite pattern cover",
            "",
            f"Status: **{cover_data['status']}**; size {cover_data['size']}; "
            f"elementary lower bound {cover_data['lower_bound']}. The largest single-pattern "
            f"coverage is {cover_data['maximum_single_pattern_coverage']} orders, and the two "
            f"listed cover patterns overlap on {cover_data['pairwise_overlap_orders']} orders.",
            "",
        ]
        for pattern in cover_data["patterns"]:
            lines.append(
                f"- `{pattern['family']}` roles `{pattern['roles']}` "
                f"covers {pattern['orders_covered']} orders."
            )
    else:
        lines += ["", "## Survivors", "", "See `results.json` for all surviving orders."]
    lines += [
        "",
        "## Sources",
        "",
    ]
    for name, path in source_paths.items():
        lines.append(f"- `{path.relative_to(REPO)}`: SHA-256 `{sha256(path)}`")
    lines += [
        "",
        "## Epistemic scope",
        "",
        "**EMPIRICALLY VERIFIED by exhaustive exact finite enumeration.** This run checks only the "
        "stated equality/order abstraction. It did not run Lean/Lake and does not establish a "
        "planar realization, convex/MEC hypotheses, or production proof closure.",
        "",
        "The raw-equality families may use equalities induced by any of the 12 shell rows or 3 "
        "rich rows. The selected-row families use only the 12 full shell rows, exactly matching "
        "their membership-bearing hypotheses.",
    ]
    md_path.write_text("\n".join(lines) + "\n")
    print(f"orders={len(orders)} killed={union_mask.bit_count()} survivors={len(survivors)}")
    for family in FAMILIES:
        print(f"{family}={family_masks[family].bit_count()}")
    if cover_data is not None:
        print(
            f"cover_status={cover_data['status']} cover_size={cover_data['size']} "
            f"lower_bound={cover_data['lower_bound']}"
        )
    print(f"json={json_path.relative_to(REPO)}")
    print(f"markdown={md_path.relative_to(REPO)}")


if __name__ == "__main__":
    main()
