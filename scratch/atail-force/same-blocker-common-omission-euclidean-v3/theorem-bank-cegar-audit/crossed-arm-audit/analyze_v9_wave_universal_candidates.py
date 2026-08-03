#!/usr/bin/env python3
"""Read-only delta/orbit/co-occurrence audit for the source-at-common v9 wave."""

from __future__ import annotations

import collections
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
V8 = HERE / "source-at-common-full-metric-bank-v9-global-kalmanson-resume-v8/result.json"
V9 = HERE / "source-at-common-full-metric-bank-v9-global-kalmanson-resume-v9-1800s/result.json"

NAMES = (
    "a1", "t1", "t2", "t3", "t4", "a2", "p1", "p2", "r1",
    "r2", "q1", "q2", "a3", "s1", "s2", "s3", "s4",
)

LINEAR_EQUALITIES = {
    "kalmanson_013_412_523": ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
    "kalmanson_012_325_415": ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
    "kalmanson_012_124_314": ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
    "kalmanson_013_235_415": ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
    "five_kalmanson_three_shell_equalities": ((2, 0, 3), (0, 3, 4), (1, 4, 0)),
    "four_endpoint_centers_bisect_middle_pair": ((0, 1, 2), (3, 1, 2)),
    "four_middle_centers_bisect_endpoint_pair": ((1, 0, 3), (2, 0, 3)),
    "five_second_three_row_equalities": ((3, 0, 2), (3, 2, 4), (4, 0, 1)),
    "five_direct_three_row_equalities": ((1, 0, 4), (2, 0, 1), (2, 0, 3)),
    "six_sparse_row_equalities": ((0, 1, 3), (0, 1, 5), (2, 1, 3), (2, 1, 4)),
    "six_main_row_equalities": ((0, 1, 5), (0, 3, 5), (3, 0, 1), (2, 1, 4), (2, 3, 4)),
    "six_mirror_interleaving_equalities": ((0, 1, 5), (0, 2, 4), (3, 0, 2), (3, 0, 4), (4, 1, 5)),
    "six_two_triple_row_equalities": ((1, 0, 2), (1, 0, 3), (5, 0, 3), (5, 0, 4)),
}

LINEAR_ROWS = {
    "five_kalmanson_three_selected_rows": ((2, (0, 3)), (0, (3, 4)), (1, (4, 0))),
    "five_circle_isosceles_two_selected_rows": ((0, (1, 3, 4)), (4, (2, 3))),
    "six_sparse_two_selected_rows": ((0, (1, 3, 5)), (2, (1, 3, 4))),
    "six_k2_three_row_triangle": ((0, (3, 5)), (1, (4, 5)), (2, (3, 4))),
}

CYCLIC_ROWS = {
    "first": ((1, (0, 4)), (2, (0, 1, 3))),
    "second": ((3, (0, 2, 4)), (4, (0, 1))),
    "reversed_second": ((1, (0, 2, 4)), (0, (3, 4))),
}


def freeze(value):
    if isinstance(value, list):
        return tuple(freeze(x) for x in value)
    return value


def role(name: str) -> str:
    if name.startswith("t"):
        return "T"
    if name.startswith("s"):
        return "S"
    return name


def dihedral_orbit(tokens):
    tokens = tuple(tokens)
    variants = []
    for seq in (tokens, tuple(reversed(tokens))):
        variants.extend(seq[i:] + seq[:i] for i in range(len(seq)))
    return "-".join(min(variants))


def eq_requirements(family, points):
    return frozenset(
        (points[c], *sorted((points[x], points[y])))
        for c, x, y in LINEAR_EQUALITIES[family]
    )


def row_requirements(family, points, schemas):
    return tuple(
        (points[c], frozenset(points[i] for i in support))
        for c, support in schemas[family]
    )


def rows_imply_rows(stronger, weaker):
    return all(
        any(c0 == c1 and support0.issuperset(support1) for c0, support0 in stronger)
        for c1, support1 in weaker
    )


def rows_imply_equalities(rows, equalities):
    return all(
        any(c0 == center and endpoints.issubset(support) for c0, support in rows)
        for center, left, right in equalities
        for endpoints in (frozenset((left, right)),)
    )


def top(counter, n=15):
    return [[k, v] for k, v in counter.most_common(n)]


def main():
    old = json.loads(V8.read_text())
    new = json.loads(V9.read_text())
    old_theorems = {freeze(x) for x in old["learned_cuts"]["theorem"]}
    new_theorems = {freeze(x) for x in new["learned_cuts"]["theorem"]}
    fresh = sorted(new_theorems - old_theorems)
    old_structural = {freeze(x) for x in old["learned_cuts"]["structural"]}
    new_structural = {freeze(x) for x in new["learned_cuts"]["structural"]}
    fresh_structural = sorted(new_structural - old_structural)

    by_family = collections.Counter(key[1] for key in fresh)
    structural_by_family = collections.Counter(key[0] for key in fresh_structural)
    ordered_roles = collections.defaultdict(collections.Counter)
    dihedral_roles = collections.defaultdict(collections.Counter)
    role_multisets = collections.defaultdict(collections.Counter)
    point_frequency = collections.Counter()
    pointset_families = collections.defaultdict(set)
    pointset_key_count = collections.Counter()
    by_exact_points = collections.defaultdict(list)
    for key in fresh:
        family, points = key[1], key[2:]
        names = tuple(NAMES[p] for p in points)
        tokens = tuple(role(x) for x in names)
        ordered_roles[family]["-".join(tokens)] += 1
        dihedral_roles[family][dihedral_orbit(tokens)] += 1
        role_multisets[family]["-".join(sorted(tokens))] += 1
        point_frequency.update(names)
        pointset = tuple(sorted(points))
        pointset_families[pointset].add(family)
        pointset_key_count[pointset] += 1
        by_exact_points[points].append(family)

    familyset_clusters = collections.Counter(
        tuple(sorted(families))
        for pointset, families in pointset_families.items()
        if len(families) >= 2
    )
    first_points = {key[2:] for key in fresh if key[1] == "first"}
    reversed_points = {key[2:] for key in fresh if key[1] == "reversed_second"}
    first_pointsets = {tuple(sorted(points)) for points in first_points}
    reversed_pointsets = {tuple(sorted(points)) for points in reversed_points}

    wave_iterations = [
        # Resume imports learned cuts, not the source run's iteration log.  Every
        # record in the v9 result therefore belongs to this wave.
        item for item in new["iterations"]
        if item.get("result") == "sat" and "fresh_theorem_cuts" in item
    ]
    iteration_presence = collections.Counter()
    iteration_pairs = collections.Counter()
    iteration_cut_totals = collections.Counter()
    for item in wave_iterations:
        active = sorted(k for k, v in item["fresh_theorem_cuts"].items() if v)
        iteration_presence.update(active)
        iteration_pairs.update(itertools.combinations(active, 2))
        iteration_cut_totals.update(item["fresh_theorem_cuts"])
    pair_jaccard = []
    for (left, right), count in iteration_pairs.items():
        union = iteration_presence[left] + iteration_presence[right] - count
        pair_jaccard.append((count / union, count, left, right))
    pair_jaccard.sort(reverse=True)

    # Exact-point syntactic subsumption, restricted to equal guard kinds.
    subsumption = collections.Counter()
    for points, families in by_exact_points.items():
        for stronger_family, weaker_family in itertools.permutations(set(families), 2):
            # "weaker antecedent" cut subsumes "stronger antecedent" cut.
            if stronger_family in LINEAR_ROWS and weaker_family in LINEAR_ROWS:
                stronger = row_requirements(stronger_family, points, LINEAR_ROWS)
                weaker = row_requirements(weaker_family, points, LINEAR_ROWS)
                if rows_imply_rows(stronger, weaker):
                    subsumption[(weaker_family, stronger_family, "row-to-row")] += 1
            if stronger_family in LINEAR_ROWS and weaker_family in LINEAR_EQUALITIES:
                stronger = row_requirements(stronger_family, points, LINEAR_ROWS)
                weaker = eq_requirements(weaker_family, points)
                if rows_imply_equalities(stronger, weaker):
                    subsumption[(weaker_family, stronger_family, "raw-equality-to-row")] += 1
            if stronger_family in LINEAR_EQUALITIES and weaker_family in LINEAR_EQUALITIES:
                stronger = eq_requirements(stronger_family, points)
                weaker = eq_requirements(weaker_family, points)
                if weaker < stronger:
                    subsumption[(weaker_family, stronger_family, "equality-subset")] += 1
            if stronger_family in CYCLIC_ROWS and weaker_family in CYCLIC_ROWS:
                stronger = row_requirements(stronger_family, points, CYCLIC_ROWS)
                weaker = row_requirements(weaker_family, points, CYCLIC_ROWS)
                if rows_imply_rows(stronger, weaker):
                    subsumption[(weaker_family, stronger_family, "cyclic-row-to-row")] += 1

    output = {
        "inputs": {"v8": str(V8), "v9": str(V9)},
        "wave": {
            "old_iterations": len(old["iterations"]),
            "new_iterations_total": len(new["iterations"]),
            "new_sat_cut_iterations": len(wave_iterations),
            "fresh_theorem_keys": len(fresh),
            "fresh_structural_keys": len(fresh_structural),
            "fresh_theorem_by_family": dict(by_family.most_common()),
            "fresh_structural_by_family": dict(structural_by_family.most_common()),
            # Per-run counters, not cumulative resume counters; do not subtract.
            "theorem_matches_seen_v8_run": old["theorem_matches_seen"],
            "theorem_matches_seen_v9_run": new["theorem_matches_seen"],
        },
        "role_orbits": {
            family: {
                "distinct_ordered": len(ordered_roles[family]),
                "top_ordered": top(ordered_roles[family], 8),
                "distinct_dihedral_coarsenings": len(dihedral_roles[family]),
                "top_dihedral_coarsenings": top(dihedral_roles[family], 8),
                "distinct_role_multisets": len(role_multisets[family]),
                "top_role_multisets": top(role_multisets[family], 8),
            }
            for family in by_family
        },
        "point_frequency": top(point_frequency, len(point_frequency)),
        "same_pointset": {
            "pointsets_with_multiple_families": sum(
                1 for families in pointset_families.values() if len(families) >= 2
            ),
            "familyset_cluster_counts": top(familyset_clusters, 20),
            "first_reversed_second": {
                "first_exact_ordered": len(first_points),
                "reversed_exact_ordered": len(reversed_points),
                "exact_ordered_intersection": len(first_points & reversed_points),
                "first_unordered_pointsets": len(first_pointsets),
                "reversed_unordered_pointsets": len(reversed_pointsets),
                "unordered_pointset_intersection": len(
                    first_pointsets & reversed_pointsets
                ),
            },
        },
        "iteration_cooccurrence": {
            "family_presence": dict(iteration_presence.most_common()),
            "fresh_cut_totals_from_iterations": dict(iteration_cut_totals.most_common()),
            "top_pairs_by_count": [
                [list(pair), count] for pair, count in iteration_pairs.most_common(20)
            ],
            "top_pairs_by_jaccard": [
                {"families": [left, right], "count": count, "jaccard": round(score, 4)}
                for score, count, left, right in pair_jaccard[:20]
            ],
        },
        "syntactic_subsumption_same_exact_order": [
            {"subsuming": key[0], "subsumed": key[1], "kind": key[2], "count": value}
            for key, value in subsumption.most_common()
        ],
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
