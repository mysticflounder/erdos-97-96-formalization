#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Audit the survival-cover output against the corrected Kalmanson bank.

This is a finite-shadow compatibility audit.  It reconstructs exactly the
source-indexed data supplied by ``BlockerCapSurvivalPair``:

* two distinct sources outside the known blocker fiber;
* their actual blocker centers in one closed cap; and
* one common deletion-survival color, represented by omission of ``q`` or
  ``w`` from both source-indexed selected rows.

It then asks whether the two actual rows, alone or together with the fixed
first-apex row, already contain an ordinal Kalmanson strict cycle.  No support
membership is inferred from deletion survival.
"""

from __future__ import annotations

import argparse
from collections import Counter, deque
import hashlib
import itertools
import json
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_CHECKPOINT = ROOT / (
    "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
EXPECTED_CHECKPOINT_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
HULL_ORDER = (
    "O",
    "t1",
    "I",
    "F",
    "A",
    "X",
    "Y",
    "Z",
    "D",
    "J",
    "E",
    "C",
    "G",
    "K",
)
CAPS = (
    frozenset(("O", "t1", "I", "F", "A")),
    frozenset(("A", "X", "Y", "Z", "D", "J", "E", "C")),
    frozenset(("C", "G", "K", "O")),
)
Q = "E"
W = "D"
FIRST_APEX = "O"
AMBIENT_FIRST_APEX_SUPPORT = frozenset(("A", "C", "D", "E", "J"))


def shortest_cycle_length(
    order: Sequence[str], rows: Iterable[tuple[str, Iterable[str]]]
) -> int | None:
    """Return the shortest ordinal Kalmanson cycle induced by selected rows."""

    positions = {label: index for index, label in enumerate(order)}
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge_id(left: str, right: str) -> int:
        edge = (left, right) if positions[left] < positions[right] else (right, left)
        return edge_index[edge]

    parent = list(range(len(edges)))

    def find(value: int) -> int:
        if parent[value] != value:
            parent[value] = find(parent[value])
        return parent[value]

    def union(left: int, right: int) -> None:
        left = find(left)
        right = find(right)
        if left != right:
            parent[right] = left

    for center, support in rows:
        selected = [edge_id(center, point) for point in support]
        if len(selected) < 2:
            raise ValueError(f"radius class at {center} has fewer than two points")
        for edge in selected[1:]:
            union(selected[0], edge)

    roots = sorted({find(index) for index in range(len(edges))})
    class_id = {root: index for index, root in enumerate(roots)}
    classes = [class_id[find(index)] for index in range(len(edges))]
    adjacency: dict[int, set[int]] = {}
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for terms in (
            ((a, c), (b, d), (a, b), (c, d)),
            ((a, c), (b, d), (a, d), (b, c)),
        ):
            values = [classes[edge_id(*edge)] for edge in terms]
            for left_index in (0, 1):
                for right_index in (0, 1):
                    if values[left_index] != values[2 + right_index]:
                        continue
                    smaller = values[2 + (1 - right_index)]
                    larger = values[1 - left_index]
                    if smaller == larger:
                        return 1
                    adjacency.setdefault(smaller, set()).add(larger)

    best: int | None = None
    for start in roots:
        start_class = class_id[start]
        distances = {start_class: 0}
        pending: deque[int] = deque([start_class])
        while pending:
            current = pending.popleft()
            for target in adjacency.get(current, ()):
                if target == start_class:
                    candidate = distances[current] + 1
                    best = candidate if best is None else min(best, candidate)
                    pending.clear()
                    break
                if target not in distances:
                    distances[target] = distances[current] + 1
                    pending.append(target)
    return best


def cap_indices(point: str) -> tuple[int, ...]:
    return tuple(index for index, cap in enumerate(CAPS) if point in cap)


def direct_five_point_matches(
    rows: Mapping[str, frozenset[str]], order: Sequence[str]
) -> tuple[dict[str, str], ...]:
    """Match the production five-point three-selected-row consumer exactly."""

    cyclic_order = tuple(order)
    matches = []
    for start in range(len(cyclic_order)):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        point_o = rotated[0]
        for positions in itertools.combinations(range(1, len(rotated)), 4):
            point_a, point_y, point_e, point_c = (
                rotated[position] for position in positions
            )
            if point_y not in rows or not {point_o, point_e} <= rows[point_y]:
                continue
            if point_o not in rows or not {point_e, point_c} <= rows[point_o]:
                continue
            if point_a not in rows or not {point_c, point_o} <= rows[point_a]:
                continue
            matches.append(
                {
                    "O": point_o,
                    "A": point_a,
                    "Y": point_y,
                    "E": point_e,
                    "C": point_c,
                }
            )
    return tuple(matches)


def audit_survivor(ordinal: int, survivor: Mapping[str, object]) -> dict[str, object]:
    blockers = {str(key): str(value) for key, value in survivor["blockers"].items()}
    rows = {
        str(row["center"]): frozenset(str(point) for point in row["support"])
        for row in survivor["rows"]
    }
    if set(rows) != set(HULL_ORDER) or set(blockers) != set(HULL_ORDER):
        raise ValueError("survivor does not carry all fourteen named rows and sources")
    for source, blocker in blockers.items():
        if source not in rows[blocker]:
            raise ValueError(f"source {source} is absent from its blocker row at {blocker}")

    q_blocker = blockers[Q]
    outside = tuple(source for source in HULL_ORDER if blockers[source] != q_blocker)
    cover_failures = []
    colors: dict[str, frozenset[str]] = {}
    for source in outside:
        support = rows[blockers[source]]
        source_colors = frozenset(
            deleted for deleted in (Q, W) if deleted not in support
        )
        if not source_colors:
            cover_failures.append(source)
        colors[source] = source_colors

    pairs = []
    for source_left, source_right in itertools.combinations(outside, 2):
        blocker_left = blockers[source_left]
        blocker_right = blockers[source_right]
        common_caps = sorted(set(cap_indices(blocker_left)) & set(cap_indices(blocker_right)))
        common_colors = sorted(colors[source_left] & colors[source_right])
        if not common_caps or not common_colors:
            continue
        pair_centers = tuple(dict.fromkeys((blocker_left, blocker_right)))
        pair_rows = tuple((center, rows[center]) for center in pair_centers)
        ambient_rows = ((FIRST_APEX, AMBIENT_FIRST_APEX_SUPPORT),) + pair_rows
        pair_cycle = shortest_cycle_length(HULL_ORDER, pair_rows)
        ambient_cycle = shortest_cycle_length(HULL_ORDER, ambient_rows)
        direct_rows = {FIRST_APEX: rows[FIRST_APEX]}
        direct_rows.update({center: rows[center] for center in pair_centers})
        direct_matches = direct_five_point_matches(direct_rows, HULL_ORDER)
        pairs.append(
            {
                "sources": [source_left, source_right],
                "blockers": [blocker_left, blocker_right],
                "common_caps": common_caps,
                "common_colors": common_colors,
                "pair_cycle_length": pair_cycle,
                "ambient_pair_cycle_length": ambient_cycle,
                "production_five_point_match_count": len(direct_matches),
                "first_production_five_point_match": (
                    direct_matches[0] if direct_matches else None
                ),
            }
        )

    cyclic_pairs = [pair for pair in pairs if pair["ambient_pair_cycle_length"] is not None]
    pair_only_cyclic = [pair for pair in pairs if pair["pair_cycle_length"] is not None]
    noncyclic_pairs = [pair for pair in pairs if pair["ambient_pair_cycle_length"] is None]
    direct_pairs = [pair for pair in pairs if pair["production_five_point_match_count"] > 0]
    nondirect_pairs = [pair for pair in pairs if pair["production_five_point_match_count"] == 0]
    same_color_distinct_blocker_pairs = []
    for source_left, source_right in itertools.combinations(outside, 2):
        blocker_left = blockers[source_left]
        blocker_right = blockers[source_right]
        if blocker_left == blocker_right:
            continue
        common_colors = sorted(colors[source_left] & colors[source_right])
        if common_colors:
            same_color_distinct_blocker_pairs.append(
                {
                    "sources": [source_left, source_right],
                    "blockers": [blocker_left, blocker_right],
                    "common_colors": common_colors,
                }
            )
    center_footprints = Counter(
        tuple(sorted(set(pair["blockers"]), key=HULL_ORDER.index)) for pair in cyclic_pairs
    )
    return {
        "survivor_ordinal": ordinal,
        "iteration": survivor["iteration"],
        "outside_fiber_card": len(outside),
        "cover_failures": cover_failures,
        "survival_cover_pair_count": len(pairs),
        "pair_only_cycle_count": len(pair_only_cyclic),
        "ambient_pair_cycle_count": len(cyclic_pairs),
        "ambient_pair_noncycle_count": len(noncyclic_pairs),
        "production_five_point_pair_count": len(direct_pairs),
        "production_five_point_nonmatch_pair_count": len(nondirect_pairs),
        "same_color_distinct_blocker_pair_count": len(
            same_color_distinct_blocker_pairs
        ),
        "cyclic_blocker_footprints": {
            "+".join(footprint): count for footprint, count in center_footprints.items()
        },
        "first_pair": pairs[0] if pairs else None,
        "first_cyclic_pair": cyclic_pairs[0] if cyclic_pairs else None,
        "first_noncyclic_pair": noncyclic_pairs[0] if noncyclic_pairs else None,
        "first_production_five_point_pair": direct_pairs[0] if direct_pairs else None,
        "first_same_color_distinct_blocker_pair": (
            same_color_distinct_blocker_pairs[0]
            if same_color_distinct_blocker_pairs
            else None
        ),
    }


def audit(checkpoint: Path) -> dict[str, object]:
    checkpoint_bytes = checkpoint.read_bytes()
    checkpoint_sha256 = hashlib.sha256(checkpoint_bytes).hexdigest()
    payload = json.loads(checkpoint_bytes)
    survivors = payload["structural_survivors"]
    records = [
        audit_survivor(ordinal, survivor)
        for ordinal, survivor in enumerate(survivors, start=1)
    ]

    pair_count_histogram = Counter(record["survival_cover_pair_count"] for record in records)
    cycle_count_histogram = Counter(record["ambient_pair_cycle_count"] for record in records)
    noncycle_count_histogram = Counter(record["ambient_pair_noncycle_count"] for record in records)
    direct_count_histogram = Counter(
        record["production_five_point_pair_count"] for record in records
    )
    no_pair = [
        record["survivor_ordinal"]
        for record in records
        if record["survival_cover_pair_count"] == 0
    ]
    no_cycle = [
        record["survivor_ordinal"]
        for record in records
        if record["ambient_pair_cycle_count"] == 0
    ]
    has_noncycle = [
        record["survivor_ordinal"]
        for record in records
        if record["ambient_pair_noncycle_count"] > 0
    ]
    no_direct = [
        record["survivor_ordinal"]
        for record in records
        if record["production_five_point_pair_count"] == 0
    ]
    has_nondirect = [
        record["survivor_ordinal"]
        for record in records
        if record["production_five_point_nonmatch_pair_count"] > 0
    ]
    no_distinct_generic_packet = [
        record["survivor_ordinal"]
        for record in records
        if record["same_color_distinct_blocker_pair_count"] == 0
    ]
    cover_failure_records = [
        {
            "survivor_ordinal": record["survivor_ordinal"],
            "iteration": record["iteration"],
            "sources": record["cover_failures"],
        }
        for record in records
        if record["cover_failures"]
    ]

    named_schema_footprints = {
        "ambientO+A+X": frozenset(("A", "X")),
        "ambientO+D+X": frozenset(("D", "X")),
        "ambientO+t1+X": frozenset(("t1", "X")),
    }
    named_schema_hits = {name: [] for name in named_schema_footprints}
    for survivor, record in zip(survivors, records, strict=True):
        blockers = {str(key): str(value) for key, value in survivor["blockers"].items()}
        rows = {
            str(row["center"]): frozenset(str(point) for point in row["support"])
            for row in survivor["rows"]
        }
        q_blocker = blockers[Q]
        outside = tuple(source for source in HULL_ORDER if blockers[source] != q_blocker)
        for source_left, source_right in itertools.combinations(outside, 2):
            centers = frozenset((blockers[source_left], blockers[source_right]))
            common_caps = set(cap_indices(blockers[source_left])) & set(
                cap_indices(blockers[source_right])
            )
            common_colors = {
                deleted
                for deleted in (Q, W)
                if deleted not in rows[blockers[source_left]]
                and deleted not in rows[blockers[source_right]]
            }
            if not common_caps or not common_colors:
                continue
            for name, footprint in named_schema_footprints.items():
                if centers != footprint:
                    continue
                cycle = shortest_cycle_length(
                    HULL_ORDER,
                    ((FIRST_APEX, AMBIENT_FIRST_APEX_SUPPORT),)
                    + tuple((center, rows[center]) for center in footprint),
                )
                if cycle is not None:
                    named_schema_hits[name].append(record["survivor_ordinal"])

    return {
        "schema": "p97-atail-survival-cover-kalmanson-audit-v1",
        "epistemic_status": "EXACT_WITHIN_CORRECTED_101_STRUCTURAL_SHADOWS",
        "checkpoint": str(checkpoint.relative_to(ROOT)),
        "checkpoint_sha256": checkpoint_sha256,
        "stored_survivors": len(survivors),
        "fixed_roles": {
            "hull_order": HULL_ORDER,
            "caps": [sorted(cap, key=HULL_ORDER.index) for cap in CAPS],
            "q": Q,
            "w": W,
            "first_apex": FIRST_APEX,
            "ambient_first_apex_support": sorted(
                AMBIENT_FIRST_APEX_SUPPORT, key=HULL_ORDER.index
            ),
        },
        "cover_failure_records": cover_failure_records,
        "survivors_without_survival_cover_pair": no_pair,
        "survivors_without_ambient_pair_cycle": no_cycle,
        "survivors_with_at_least_one_noncyclic_pair": has_noncycle,
        "survivors_without_production_five_point_pair": no_direct,
        "survivors_with_at_least_one_production_nonmatch_pair": has_nondirect,
        "survivors_without_same_color_distinct_blocker_pair": no_distinct_generic_packet,
        "pair_count_histogram": dict(sorted(pair_count_histogram.items())),
        "ambient_pair_cycle_count_histogram": dict(sorted(cycle_count_histogram.items())),
        "ambient_pair_noncycle_count_histogram": dict(sorted(noncycle_count_histogram.items())),
        "production_five_point_pair_count_histogram": dict(
            sorted(direct_count_histogram.items())
        ),
        "named_two_blocker_schema_survivor_hits": {
            name: sorted(set(iterations)) for name, iterations in named_schema_hits.items()
        },
        "records": records,
        "interpretation": {
            "source_valid_input": (
                "same-cap actual blocker centers, actual source-indexed rows, and "
                "common q/w support omission"
            ),
            "not_inferred": (
                "support membership, source cap placement, or a five-point role embedding"
            ),
            "direct_sink_gate": (
                "a direct sink would require every possible output pair, or an "
                "independently selectable canonical output pair, to carry a checked "
                "strict-cycle schema"
            ),
            "card_fourteen_counting_route": (
                "ten outside-fiber sources force five of one color; the "
                "four-source blocker-fiber bound then yields a generic common-"
                "deletion packet at two distinct actual blockers"
            ),
            "aligned_handler_gap": (
                "the generic packet does not identify its centers with the live "
                "center p and the physical second apex"
            ),
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument("--output", type=Path, default=HERE / "audit_results.json")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()
    result = audit(args.checkpoint)
    if args.check:
        if result["checkpoint_sha256"] != EXPECTED_CHECKPOINT_SHA256:
            raise AssertionError("corrected checkpoint hash drift")
        if result["stored_survivors"] != 101:
            raise AssertionError("corrected survivor count drift")
        if result["cover_failure_records"]:
            raise AssertionError("source-indexed deletion-survival cover drift")
        if result["survivors_without_survival_cover_pair"]:
            raise AssertionError("six-box survival-cover collision drift")
        if result["survivors_without_same_color_distinct_blocker_pair"]:
            raise AssertionError("card-fourteen distinct-blocker counting drift")
        if result["survivors_without_ambient_pair_cycle"] != [36]:
            raise AssertionError("ambient-plus-survival-pair cycle boundary drift")
        if len(result["survivors_with_at_least_one_noncyclic_pair"]) != 101:
            raise AssertionError("noncyclic survival-pair boundary drift")
        if len(result["survivors_without_production_five_point_pair"]) != 73:
            raise AssertionError("production five-point noncoverage drift")
        if len(result["survivors_with_at_least_one_production_nonmatch_pair"]) != 101:
            raise AssertionError("production five-point output ambiguity drift")
        schema_hits = result["named_two_blocker_schema_survivor_hits"]
        if len(schema_hits["ambientO+A+X"]) != 92:
            raise AssertionError("ambientO+A+X pair-footprint count drift")
        if schema_hits["ambientO+D+X"] or schema_hits["ambientO+t1+X"]:
            raise AssertionError("unexpected named two-blocker schema hit")
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if args.summary:
        result = {key: value for key, value in result.items() if key != "records"}
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
