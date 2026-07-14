#!/usr/bin/env python3
"""Deterministic validator for the ATAIL global-count boundary shadows.

The two saved assignments are finite equality/incidence shadows.  This module
checks them independently of the exploratory Z3 search that found them.  It is
deliberately fail-closed: successful validation has the status
``VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY`` and can never be promoted to a
Euclidean or live K-A verdict while the manifest omission list is nonempty.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from itertools import combinations
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
MANIFEST_SCHEMA = "p97-atail-global-count-boundary-manifest-v1"
SHADOW_SCHEMA = "p97-atail-global-count-boundary-shadows-v1"
CHECKPOINT_SCHEMA = "p97-atail-global-count-boundary-checkpoint-v1"
VALIDATED_STATUS = "VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY"
LABEL_NAMES = frozenset({"p", "q", "t1", "t2", "t3", "u"})


class ValidationError(AssertionError):
    """A fail-closed rejection of a malformed or overclaimed shadow."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValidationError(message)


def load_json(path: Path) -> object:
    with path.open() as handle:
        return json.load(handle)


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def choose_two(cardinality: int) -> int:
    return cardinality * (cardinality - 1) // 2


def parse_rows(raw: Mapping[str, Sequence[int]], n: int) -> dict[int, frozenset[int]]:
    require(set(raw) == {str(x) for x in range(n)}, "rows must name every center")
    rows: dict[int, frozenset[int]] = {}
    vertices = set(range(n))
    for center in range(n):
        support_list = [int(x) for x in raw[str(center)]]
        require(support_list == sorted(support_list), f"row {center} is not canonical")
        support = frozenset(support_list)
        require(len(support_list) == len(support), f"row {center} repeats a point")
        require(len(support) == 4, f"row {center} does not have cardinality four")
        require(support <= vertices, f"row {center} leaves the carrier")
        require(center not in support, f"row {center} contains its center")
        rows[center] = support
    return rows


def distance_label(
    rows: Mapping[int, frozenset[int]], x: int, y: int
) -> tuple[object, ...]:
    """Symmetric equality label for the abstract distance between two vertices.

    Reciprocal row membership is rejected before this function is used.  Thus
    an unordered edge belongs to at most one selected radius star.
    """

    if x == y:
        return ("zero",)
    if y in rows[x]:
        return ("radius", x)
    if x in rows[y]:
        return ("radius", y)
    return ("edge", min(x, y), max(x, y))


def classes_at(
    rows: Mapping[int, frozenset[int]],
    center: int,
    retained: Iterable[int],
) -> dict[tuple[object, ...], tuple[int, ...]]:
    classes: dict[tuple[object, ...], list[int]] = defaultdict(list)
    for point in retained:
        classes[distance_label(rows, center, point)].append(point)
    return {label: tuple(points) for label, points in classes.items()}


def validate_exact_distance_shadow(
    rows: Mapping[int, frozenset[int]], n: int
) -> None:
    for c, d in combinations(range(n), 2):
        require(
            not (d in rows[c] and c in rows[d]),
            f"reciprocal row edge {c}<->{d} merges abstract row radii",
        )
    for x in range(n):
        for y in range(n):
            require(
                distance_label(rows, x, y) == distance_label(rows, y, x),
                f"abstract distance labels are asymmetric at {x},{y}",
            )
    for center in range(n):
        classes = classes_at(rows, center, range(n))
        radius_points = frozenset(classes.get(("radius", center), ()))
        require(
            radius_points == rows[center],
            f"row {center} is not its complete abstract radius class",
        )
        require(
            max(len(points) for label, points in classes.items() if label != ("zero",))
            == 4,
            f"center {center} has an unexpected abstract radius multiplicity",
        )


def validate_cap_frame(
    order: tuple[int, ...], caps: tuple[tuple[int, ...], ...], profile: tuple[int, ...]
) -> None:
    n = len(order)
    vertices = set(range(n))
    require(set(order) == vertices and len(order) == n, "cyclic order is not a permutation")
    position = {point: index for index, point in enumerate(order)}
    require(len(caps) == 3, "the frame must have exactly three closed caps")
    require(tuple(sorted(map(len, caps))) == profile, "cap lengths do not match profile")
    require(sum(map(len, caps)) == n + 3, "closed-cap sum is not n+3")
    require(set().union(*map(set, caps)) == vertices, "closed caps do not cover carrier")
    for index, cap in enumerate(caps):
        require(len(cap) == len(set(cap)), f"cap {index} repeats a vertex")
        for left, right in zip(cap, cap[1:]):
            require(
                position[right] == (position[left] + 1) % n,
                f"cap {index} is not a cyclic interval",
            )
    intersections = [set(caps[i]) & set(caps[j]) for i, j in combinations(range(3), 2)]
    require(all(len(points) == 1 for points in intersections), "cap pairs must share one endpoint")
    require(not (set(caps[0]) & set(caps[1]) & set(caps[2])), "three caps share a point")


def validate_one_sided_cap_rows(
    rows: Mapping[int, frozenset[int]], caps: tuple[tuple[int, ...], ...]
) -> None:
    for cap_index, cap in enumerate(caps):
        cap_set = set(cap)
        for center_index, center in enumerate(cap):
            hits = rows[center] & cap_set
            if center_index in (0, len(cap) - 1):
                require(
                    len(hits) <= 1,
                    f"endpoint one-hit fails in cap {cap_index} at center {center}",
                )
                continue
            left = set(cap[:center_index])
            right = set(cap[center_index + 1 :])
            require(
                len(hits & left) <= 1 and len(hits & right) <= 1,
                f"one-sided row injectivity fails in cap {cap_index} at center {center}",
            )


def in_open_cyclic_arc(
    order: Sequence[int], start: int, end: int, point: int
) -> bool:
    position = {value: index for index, value in enumerate(order)}
    n = len(order)
    point_delta = (position[point] - position[start]) % n
    end_delta = (position[end] - position[start]) % n
    return 0 < point_delta < end_delta


def cyclically_separated(
    order: Sequence[int], first: int, second: int, x: int, y: int
) -> bool:
    return in_open_cyclic_arc(order, x, y, first) != in_open_cyclic_arc(
        order, x, y, second
    )


def validate_row_intersections(
    rows: Mapping[int, frozenset[int]], order: tuple[int, ...]
) -> tuple[int, int]:
    shared_pair_count = 0
    max_overlap = 0
    for first, second in combinations(range(len(order)), 2):
        common = rows[first] & rows[second]
        max_overlap = max(max_overlap, len(common))
        require(
            len(common) <= 2,
            f"rows {first},{second} overlap in more than two points",
        )
        if len(common) == 2:
            shared_pair_count += 1
            x, y = sorted(common)
            require(
                cyclically_separated(order, first, second, x, y),
                f"shared pair {x},{y} does not cyclically separate centers {first},{second}",
            )
    return shared_pair_count, max_overlap


def validate_outside_pair_counts(
    rows: Mapping[int, frozenset[int]],
    caps: tuple[tuple[int, ...], ...],
    n: int,
) -> list[dict[str, int]]:
    reports: list[dict[str, int]] = []
    for cap_index, cap in enumerate(caps):
        cap_set = set(cap)
        seen: dict[tuple[int, int], int] = {}
        usage = 0
        for center in cap:
            outside = sorted(rows[center] - cap_set)
            for pair in combinations(outside, 2):
                require(
                    pair not in seen,
                    f"outside pair {pair} reused by cap-{cap_index} centers "
                    f"{seen.get(pair)} and {center}",
                )
                seen[pair] = center
                usage += 1
        lower = len(cap) + 4
        capacity = choose_two(n - len(cap))
        require(usage >= lower, f"cap {cap_index} misses the m+4 incidence lower bound")
        require(usage <= capacity, f"cap {cap_index} exceeds outside-pair capacity")
        reports.append(
            {
                "cap_index": cap_index,
                "cap_size": len(cap),
                "proven_lower": lower,
                "witness_usage": usage,
                "capacity": capacity,
            }
        )
    return reports


def functional_cycles(mapping: Mapping[int, int]) -> list[list[int]]:
    completed: set[int] = set()
    cycles: list[list[int]] = []
    for start in sorted(mapping):
        path: list[int] = []
        local_index: dict[int, int] = {}
        current = start
        while current not in completed and current not in local_index:
            local_index[current] = len(path)
            path.append(current)
            current = mapping[current]
        if current in local_index:
            cycle = path[local_index[current] :]
            least = min(range(len(cycle)), key=cycle.__getitem__)
            cycles.append(cycle[least:] + cycle[:least])
        completed.update(path)
    return sorted(cycles)


def validate_blocker_system(
    rows: Mapping[int, frozenset[int]],
    raw_mapping: Mapping[str, int],
    labels: Mapping[str, int],
    n: int,
) -> tuple[dict[int, int], Counter[int], list[list[int]]]:
    require(set(raw_mapping) == {str(x) for x in range(n)}, "blocker map is not total")
    blocker = {int(source): int(center) for source, center in raw_mapping.items()}
    require(
        blocker[labels["t2"]] == labels["p"],
        "common dangerous-row provenance t2 -> p is missing",
    )
    for source, center in blocker.items():
        require(0 <= center < n, f"blocker center {center} leaves the carrier")
        require(center != source, f"source {source} is its own blocker")
        require(source in rows[center], f"blocker row {center} omits source {source}")
        after_delete = classes_at(rows, center, set(range(n)) - {source})
        nonzero_sizes = [
            len(points) for label, points in after_delete.items() if label != ("zero",)
        ]
        require(
            max(nonzero_sizes, default=0) <= 3,
            f"source {source} is not deletion-critical at blocker {center}",
        )
    fibers = Counter(blocker.values())
    require(max(fibers.values()) <= 4, "a blocker fiber exceeds its exact four-row")
    require(n <= 4 * len(fibers), "blocker-image cover inequality fails")
    return blocker, fibers, functional_cycles(blocker)


def validate_dangerous_packet(
    rows: Mapping[int, frozenset[int]],
    labels: Mapping[str, int],
    blocker: Mapping[int, int],
    surplus_cap: tuple[int, ...],
    n: int,
) -> None:
    require(set(labels) == LABEL_NAMES, "named-label set is incorrect")
    require(len(set(labels.values())) == 6, "named labels are not pairwise distinct")
    require(all(0 <= point < n for point in labels.values()), "a named label leaves carrier")
    p, q = labels["p"], labels["q"]
    dangerous = frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))
    require(rows[p] == dangerous, "the p-row is not exactly {q,t1,t2,t3}")
    require(blocker[labels["t2"]] == p, "t2 critical row is not the common p-row")
    require(q in surplus_cap[1:-1], "q is not strict-interior in the surplus cap")
    require(labels["u"] not in rows[p], "u is not off the dangerous p-radius")
    require(
        distance_label(rows, p, labels["u"]) != distance_label(rows, p, q),
        "u has the dangerous abstract p-radius",
    )
    q_deleted = set(range(n)) - {p, q}
    q_radius = distance_label(rows, p, q)
    survivors = {x for x in q_deleted if distance_label(rows, p, x) == q_radius}
    require(
        survivors == {labels["t1"], labels["t2"], labels["t3"]},
        "q-deleted dangerous radius class is not exactly the fixed triple",
    )


def validate_joint_fibers(
    rows: Mapping[int, frozenset[int]], surplus_cap: tuple[int, ...], n: int
) -> tuple[int, list[int]]:
    first_apex, second_apex = surplus_cap[0], surplus_cap[-1]
    off_surplus = set(range(n)) - set(surplus_cap)
    fibers: dict[tuple[tuple[object, ...], tuple[object, ...]], list[int]] = defaultdict(list)
    for point in sorted(off_surplus):
        signature = (
            distance_label(rows, first_apex, point),
            distance_label(rows, second_apex, point),
        )
        fibers[signature].append(point)
    max_fiber = max(map(len, fibers.values()), default=0)
    require(max_fiber <= 1, "an abstract two-point joint apex-radius fiber survives")
    selected_joint = sorted(
        (rows[first_apex] & rows[second_apex]) - set(surplus_cap)
    )
    require(len(selected_joint) <= 1, "selected apex rows share an off-surplus pair")
    return max_fiber, selected_joint


def count_legacy_wrong_side_rows(
    rows: Mapping[int, frozenset[int]], caps: tuple[tuple[int, ...], ...]
) -> int:
    count = 0
    for cap in caps:
        cap_set = set(cap)
        last = len(cap) - 1
        for center_position, center in enumerate(cap):
            for source in rows[center] & cap_set:
                source_position = cap.index(source)
                if cap[-1] in rows[center] and center_position < source_position < last:
                    count += 1
                if cap[0] in rows[center] and 0 < source_position < center_position:
                    count += 1
    return count


def validate_legacy_chain(
    chain: Mapping[str, object],
    rows: Mapping[int, frozenset[int]],
    blocker: Mapping[int, int],
    caps: tuple[tuple[int, ...], ...],
) -> None:
    cap_index = int(chain["cap_index"])
    require(0 <= cap_index < len(caps), "legacy chain cap index is invalid")
    cap = caps[cap_index]
    edges = [chain["first"], chain["second"]]
    require(
        str(edges[0]["used"]) != str(edges[1]["used"]),
        "legacy chain does not switch endpoint sides",
    )
    require(
        int(edges[0]["center"]) == int(edges[1]["source"]),
        "legacy edges are not consecutive",
    )
    for edge in edges:
        source = int(edge["source"])
        center = int(edge["center"])
        used = str(edge["used"])
        require(used in {"left", "right"}, "legacy edge has an invalid side")
        endpoint = cap[0] if used == "left" else cap[-1]
        require(source in cap and center in cap, "legacy edge is not same-cap")
        require(blocker[source] == center, "legacy edge is not a blocker edge")
        require(source in rows[center], "legacy edge row omits its source")
        require(endpoint in rows[center], "legacy edge row omits its spent endpoint")
        require(center not in {source, endpoint}, "legacy edge is degenerate")
        require(
            distance_label(rows, center, source)
            == distance_label(rows, center, endpoint),
            "legacy endpoint radius equality fails",
        )
        source_position = cap.index(source)
        center_position = cap.index(center)
        if used == "right":
            require(
                source_position < center_position < len(cap) - 1,
                "legacy right-edge pushout order fails",
            )
        else:
            require(
                0 < center_position < source_position,
                "legacy left-edge pushout order fails",
            )


def validate_case(case: Mapping[str, object]) -> dict[str, object]:
    name = str(case["name"])
    profile = tuple(int(x) for x in case["profile"])
    require(profile in {(4, 5, 6), (5, 5, 5)}, f"unsupported profile {profile}")
    order = tuple(int(x) for x in case["cyclic_order"])
    n = len(order)
    require(n == 12, f"{name} is not a card-12 shadow")
    caps = tuple(tuple(int(x) for x in cap) for cap in case["caps"])
    validate_cap_frame(order, caps, profile)
    surplus_index = int(case["surplus_cap_index"])
    require(0 <= surplus_index < 3, "surplus cap index is invalid")
    surplus_cap = caps[surplus_index]
    require(len(surplus_cap) >= 5, "declared surplus cap is not large")
    require(
        any(i != surplus_index and len(cap) >= 5 for i, cap in enumerate(caps)),
        "there is no distinct second large cap",
    )

    rows = parse_rows(case["rows"], n)
    validate_exact_distance_shadow(rows, n)
    validate_one_sided_cap_rows(rows, caps)
    shared_pair_count, max_overlap = validate_row_intersections(rows, order)
    cap_reports = validate_outside_pair_counts(rows, caps, n)

    labels = {str(key): int(value) for key, value in case["labels"].items()}
    blocker, fibers, cycles = validate_blocker_system(
        rows, case["critical_shell_blocker_map"], labels, n
    )
    validate_dangerous_packet(rows, labels, blocker, surplus_cap, n)
    max_joint_fiber, selected_joint = validate_joint_fibers(rows, surplus_cap, n)

    wrong_side_count = count_legacy_wrong_side_rows(rows, caps)
    require(wrong_side_count == 0, "a legacy wrong-side endpoint row survives")
    chains = list(case["legacy_opposite_endpoint_chains"])
    for chain in chains:
        validate_legacy_chain(chain, rows, blocker, caps)

    expected = case["expected"]
    require(
        [report["witness_usage"] for report in cap_reports]
        == list(expected["outside_pair_usage"]),
        "outside-pair usage drifted",
    )
    require(
        [report["capacity"] for report in cap_reports]
        == list(expected["outside_pair_capacity"]),
        "outside-pair capacity drifted",
    )
    require(
        shared_pair_count == int(expected["shared_two_point_row_pairs"]),
        "shared-pair count drifted",
    )
    require(cycles == expected["blocker_cycles"], "blocker cycles drifted")
    require(
        selected_joint == expected["joint_selected_radius_points_off_surplus"],
        "off-surplus selected joint fiber drifted",
    )

    return {
        "name": name,
        "profile": list(profile),
        "case_sha256": canonical_sha256(case),
        "row_count": len(rows),
        "shared_two_point_row_pairs": shared_pair_count,
        "maximum_row_overlap": max_overlap,
        "cap_pair_counts": cap_reports,
        "blocker_image_size": len(fibers),
        "maximum_blocker_fiber": max(fibers.values()),
        "blocker_cycles": cycles,
        "maximum_joint_off_surplus_fiber": max_joint_fiber,
        "joint_selected_radius_points_off_surplus": selected_joint,
        "legacy_wrong_side_count": wrong_side_count,
        "legacy_opposite_endpoint_chain_count": len(chains),
        "dangerous_labels": labels,
        "status": VALIDATED_STATUS,
    }


def validate_manifest(manifest: Mapping[str, object]) -> None:
    require(manifest["schema"] == MANIFEST_SCHEMA, "manifest schema mismatch")
    scope = manifest["scope"]
    require(scope["cardinality"] == 12, "manifest cardinality drifted")
    require(
        {tuple(profile) for profile in scope["profiles"]} == {(4, 5, 6), (5, 5, 5)},
        "manifest profile scope drifted",
    )
    require(scope["target_faithful"] is False, "manifest attempts target-faithful promotion")
    require(scope["verdict"] == "STRENGTHENED_FINITE_SHADOW_ONLY", "manifest verdict drifted")
    require(bool(manifest["unimplemented_fail_closed"]), "manifest omission list is empty")
    require(
        manifest["verdict_policy"]["validated"] == VALIDATED_STATUS,
        "manifest verdict policy drifted",
    )


def validate_artifact() -> dict[str, object]:
    manifest = load_json(HERE / "manifest.json")
    shadows = load_json(HERE / "shadows.json")
    require(isinstance(manifest, dict), "manifest is not an object")
    require(isinstance(shadows, dict), "shadow artifact is not an object")
    validate_manifest(manifest)
    require(shadows["schema"] == SHADOW_SCHEMA, "shadow schema mismatch")
    cases = list(shadows["cases"])
    require(len(cases) == 2, "artifact must contain exactly two card-12 cases")
    require(
        {tuple(case["profile"]) for case in cases} == {(4, 5, 6), (5, 5, 5)},
        "artifact does not cover both card-12 profiles",
    )
    reports = [validate_case(case) for case in cases]
    return {
        "schema": CHECKPOINT_SCHEMA,
        "status": VALIDATED_STATUS,
        "target_faithful": False,
        "manifest_sha256": canonical_sha256(manifest),
        "shadows_sha256": canonical_sha256(shadows),
        "case_count": len(reports),
        "cases": reports,
    }


def check_checkpoint(report: Mapping[str, object]) -> None:
    checkpoint = load_json(HERE / "checkpoint.json")
    require(report == checkpoint, "checkpoint does not match deterministic replay")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="validate and compare checkpoint")
    parser.add_argument(
        "--print-checkpoint",
        action="store_true",
        help="print the canonical checkpoint JSON",
    )
    args = parser.parse_args()
    report = validate_artifact()
    if args.print_checkpoint:
        print(json.dumps(report, indent=2, sort_keys=True))
        return
    check_checkpoint(report)
    print(f"status: {report['status']}")
    print(f"checkpoint: MATCH ({report['case_count']} cases)")
    for case in report["cases"]:
        counts = ", ".join(
            f"{row['witness_usage']}/{row['capacity']}"
            for row in case["cap_pair_counts"]
        )
        print(
            f"{tuple(case['profile'])}: cap-pairs {counts}; "
            f"max-joint {case['maximum_joint_off_surplus_fiber']}; "
            f"wrong-side {case['legacy_wrong_side_count']}"
        )


if __name__ == "__main__":
    main()
