#!/usr/bin/env python3
"""Artifact-only replay of the dual-row witness; imports neither Z3 nor CEGAR."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent


def rotations(points):
    return tuple(points[i:] + points[:i] for i in range(len(points)))


def atoms(family, points):
    a, b, c, d, e = points
    if family == "first":
        return b, {a, e}, c, {a, b, d}
    if family == "second":
        return d, {a, c, e}, e, {a, b}
    if family == "reversed_second":
        return b, {a, c, e}, a, {d, e}
    raise AssertionError(family)


KALMANSON_FAMILIES = {
    "kalmanson_013_412_523": (6, ((0, 1, 3), (4, 1, 2), (5, 2, 3))),
    "kalmanson_012_325_415": (6, ((0, 1, 2), (3, 2, 5), (4, 1, 5))),
    "kalmanson_012_124_314": (5, ((0, 1, 2), (1, 2, 4), (3, 1, 4))),
    "kalmanson_013_235_415": (6, ((0, 1, 3), (2, 3, 5), (4, 1, 5))),
}

SIX_POINT_ROW_FAMILIES = {
    "six_sparse_two_selected_rows": (6, ((0, (1, 3, 5)), (2, (1, 3, 4)))),
}

LINEAR_ROW_FAMILIES = {
    "five_kalmanson_three_selected_rows": (5, ((2, (0, 3)), (0, (3, 4)), (1, (4, 0)))),
    "five_circle_isosceles_two_selected_rows": (5, ((0, (1, 3, 4)), (4, (2, 3)))),
    **SIX_POINT_ROW_FAMILIES,
}

RAW_EQUALITY_FAMILIES = {
    "five_kalmanson_three_shell_equalities": (5, ((2, 0, 3), (0, 3, 4), (1, 4, 0))),
    "four_endpoint_centers_bisect_middle_pair": (4, ((0, 1, 2), (3, 1, 2))),
    "four_middle_centers_bisect_endpoint_pair": (4, ((1, 0, 3), (2, 0, 3))),
    "five_second_three_row_equalities": (5, ((3, 0, 2), (3, 2, 4), (4, 0, 1))),
    "five_direct_three_row_equalities": (5, ((1, 0, 4), (2, 0, 1), (2, 0, 3))),
}

SIX_POINT_EQUALITY_FAMILIES = {
    "six_sparse_row_equalities": (6, ((0, 1, 3), (0, 1, 5), (2, 1, 3), (2, 1, 4))),
    "six_main_row_equalities": (6, ((0, 1, 5), (0, 3, 5), (3, 0, 1), (2, 1, 4), (2, 3, 4))),
    "six_mirror_interleaving_equalities": (6, ((0, 1, 5), (0, 2, 4), (3, 0, 2), (3, 0, 4), (4, 1, 5))),
    "six_two_triple_row_equalities": (6, ((1, 0, 2), (1, 0, 3), (5, 0, 3), (5, 0, 4))),
}


def replay(witness_path: Path):
    data = json.loads(witness_path.read_text())
    order = tuple(data["cyclic_order"])
    position = {point: i for i, point in enumerate(order)}
    centers = data["row_centers"]
    supports = {name: set(support) for name, support in data["row_supports"].items()}
    row_names = tuple(sorted(supports))
    base = data["base_semantic_replay"]
    blockers = base["blockers"]
    base_rows = {name: set(support) for name, support in base["rows"].items()}

    radius_classes = data["radius_classes"]
    if set(radius_classes) != set(order):
        raise AssertionError(("radius-class-centers", set(radius_classes), set(order)))
    radius_class_index = {}
    for center, classes in radius_classes.items():
        seen = set()
        for class_index, members_list in enumerate(classes):
            members = set(members_list)
            if not members or center in members or seen & members:
                raise AssertionError(("radius-class-partition", center, members, seen & members))
            for point in members:
                radius_class_index[center, point] = class_index
            seen.update(members)
        if seen != set(order) - {center}:
            raise AssertionError(("radius-class-coverage", center, seen))

    def equal_at(center, left, right):
        if left == right:
            return True
        if center in {left, right}:
            return False
        return radius_class_index[center, left] == radius_class_index[center, right]

    for name in row_names:
        if len(supports[name]) != 4 or centers[name] in supports[name]:
            raise AssertionError(("exact-row", name, centers[name], supports[name]))
        if any(
            not equal_at(centers[name], left, right)
            for left, right in itertools.combinations(supports[name], 2)
        ):
            raise AssertionError(("exact-row-radius-class", name))
    for center, support in base_rows.items():
        name = f"base.{center}"
        if centers.get(name) != center or supports.get(name) != support:
            raise AssertionError(("base-row-map", name))
    # Every collision row is the imported layer's chosen witness.  Only the
    # two outside blocker rows normalize; its three apex rows stay independent.
    for name in ("collision.common", "collision.opposite", "collision.apex1", "collision.apex2", "collision.apex3"):
        if supports[name] != base_rows[centers[name]]:
            raise AssertionError(("collision-row-map", name))
    for name in ("outside.common", "outside.opposite"):
        if supports[name] != base_rows[centers[name]]:
            raise AssertionError(("outside-canonical-map", name))
    for name in ("outside.apex1", "outside.apex2", "outside.apex3"):
        center = centers[name]
        if center in blockers.values() and supports[name] != base_rows[center]:
            raise AssertionError(("outside-incidental-blocker-map", name, center))

    outside = data["outside_choice"]
    qsource, qother, outside_deleted = outside["Q.source"], outside["Q.otherOutsidePoint"], outside["deleted"]
    if qsource == qother or blockers[qsource] != blockers["p1"]:
        raise AssertionError("FreshOutsideFirstBlockerFiber source map")
    if not {qsource, qother}.issubset(base_rows[blockers["p1"]]):
        raise AssertionError("outside pair missing from first shell")
    for name in row_names:
        if name.startswith("outside.") and outside_deleted in supports[name]:
            raise AssertionError(("outside deletion", name, outside_deleted))
        if name.startswith("outside.") and blockers[outside_deleted] == centers[name]:
            raise AssertionError(("outside actual blocker", name))

    collision_deleted = base["five_center_deletion_residual"]["deleted"]
    for name in row_names:
        if name.startswith("collision.") and collision_deleted in supports[name]:
            raise AssertionError(("collision deletion", name, collision_deleted))
        if name.startswith("collision.") and blockers[collision_deleted] == centers[name]:
            raise AssertionError(("collision actual blocker", name))

    # Packet aliases of canonical rows do not create new selected classes.
    # Deduplicate them before enumerating metric theorem substitutions.
    semantic_rows = []
    seen_rows = set()
    for name in row_names:
        signature = (centers[name], frozenset(supports[name]))
        if signature not in seen_rows:
            seen_rows.add(signature)
            semantic_rows.append(name)
    semantic_rows = tuple(semantic_rows)

    pair_rows_checked = 0
    shared_point_pairs_checked = 0
    active_shared_pairs = 0
    circle_triples_checked = 0
    for left, right in itertools.combinations(semantic_rows, 2):
        c, d = centers[left], centers[right]
        if c == d:
            continue
        pair_rows_checked += 1
        common = supports[left] & supports[right]
        circle_triples_checked += sum(1 for _ in itertools.combinations(common, 3))
        if len(common) >= 3:
            raise AssertionError(("circle overlap", left, right, common))
        for x, y in itertools.combinations(sorted(common), 2):
            shared_point_pairs_checked += 1
            active_shared_pairs += 1
            bx = (position[c] < position[x] < position[d]) or (position[d] < position[x] < position[c])
            by = (position[c] < position[y] < position[d]) or (position[d] < position[y] < position[c])
            if bx == by:
                raise AssertionError(("shared-pair separation", left, right, x, y))

    row_triples_checked = 0
    common_pairs_at_three_centers = 0
    for first, second, third in itertools.combinations(semantic_rows, 3):
        if len({centers[first], centers[second], centers[third]}) != 3:
            continue
        row_triples_checked += 1
        common = supports[first] & supports[second] & supports[third]
        common_pairs_at_three_centers += sum(1 for _ in itertools.combinations(common, 2))
        if len(common) >= 2:
            raise AssertionError(("perpendicular bisector", first, second, third, common))

    family_matches = {family: 0 for family in ("first", "second", "reversed_second")}
    subsets_checked = 0
    cyclic_orders_checked = 0
    for subset in itertools.combinations(order, 5):
        subsets_checked += 1
        for points in rotations(subset):
            cyclic_orders_checked += 1
            for family in family_matches:
                c1, need1, c2, need2 = atoms(family, points)
                for row1 in semantic_rows:
                    if centers[row1] != c1 or not need1.issubset(supports[row1]):
                        continue
                    for row2 in semantic_rows:
                        if row1 == row2:
                            continue
                        if centers[row2] == c2 and need2.issubset(supports[row2]):
                            family_matches[family] += 1
    if any(family_matches.values()):
        raise AssertionError(("cyclic theorem", family_matches))

    def equality_matches(families):
        matches = {family: 0 for family in families}
        subsets_checked = 0
        for family, (arity, equalities) in families.items():
            for points in itertools.combinations(order, arity):
                subsets_checked += 1
                if all(
                    equal_at(points[center], points[left], points[right])
                    for center, left, right in equalities
                ):
                    matches[family] += 1
        return matches, subsets_checked

    kalmanson_matches, kalmanson_subsets_checked = equality_matches(KALMANSON_FAMILIES)
    if any(kalmanson_matches.values()):
        raise AssertionError(("Kalmanson theorem", kalmanson_matches))

    linear_row_matches = {family: 0 for family in LINEAR_ROW_FAMILIES}
    linear_row_subsets_checked = 0
    for family, (arity, rows) in LINEAR_ROW_FAMILIES.items():
        for points in itertools.combinations(order, arity):
            linear_row_subsets_checked += 1
            providers = []
            for center_index, support_indices in rows:
                center = points[center_index]
                support = {points[index] for index in support_indices}
                providers.append(tuple(
                    row for row in semantic_rows
                    if centers[row] == center and support.issubset(supports[row])
                ))
            if all(providers):
                linear_row_matches[family] += sum(1 for _ in itertools.product(*providers))
    if any(linear_row_matches.values()):
        raise AssertionError(("linear-order selected-row theorem", linear_row_matches))

    raw_equality_matches, raw_equality_subsets_checked = equality_matches(RAW_EQUALITY_FAMILIES)
    if any(raw_equality_matches.values()):
        raise AssertionError(("raw equality theorem", raw_equality_matches))

    six_point_equality_matches, six_point_equality_subsets_checked = equality_matches(
        SIX_POINT_EQUALITY_FAMILIES
    )
    if any(six_point_equality_matches.values()):
        raise AssertionError(("six-point equality theorem", six_point_equality_matches))

    return {
        "status": "PASS",
        "method": "artifact-only Python replay; no Z3 or CEGAR import",
        "exact_rows_checked": len(row_names),
        "semantic_rows_checked": len(semantic_rows),
        "distinct_center_row_pairs_checked": pair_rows_checked,
        "active_shared_point_pairs_checked": active_shared_pairs,
        "circle_overlap_active_triples": circle_triples_checked,
        "distinct_center_row_triples_checked": row_triples_checked,
        "common_pairs_at_three_centers": common_pairs_at_three_centers,
        "five_subsets_checked": subsets_checked,
        "positive_cyclic_orders_checked": cyclic_orders_checked,
        "theorem_family_active_matches": family_matches,
        "kalmanson_subsets_checked": kalmanson_subsets_checked,
        "kalmanson_theorem_active_matches": kalmanson_matches,
        "linear_row_subsets_checked": linear_row_subsets_checked,
        "linear_row_theorem_active_matches": linear_row_matches,
        "raw_equality_subsets_checked": raw_equality_subsets_checked,
        "raw_equality_theorem_active_matches": raw_equality_matches,
        "six_point_equality_subsets_checked": six_point_equality_subsets_checked,
        "six_point_equality_theorem_active_matches": six_point_equality_matches,
        "reflection_generated": False,
        "collision_deleted": collision_deleted,
        "outside_deleted": outside_deleted,
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=HERE / "n17-profile-6-8-6" / "witness.json")
    parser.add_argument("--output", type=Path, default=HERE / "n17-profile-6-8-6" / "independent-replay.json")
    args = parser.parse_args()
    result = replay(args.witness)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
