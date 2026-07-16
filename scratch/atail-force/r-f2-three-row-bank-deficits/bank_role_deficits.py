#!/usr/bin/env python3
"""Role-faithful theorem-bank deficit audit for the exact F2 three-row packet.

This is intentionally not a finite-shadow matcher.  It parses only direct
class-facing U5 incidence consumers and compares their named

* dangerous-triple source, center, and support;
* q-critical versus q-deleted class roles;
* class centers and support variables; and
* explicit point-in-support and point-inequality hypotheses

against two source-faithful views of the F2 packet:

``deleted_source``
    deleted point ``d``; dangerous q-critical support ``K`` (notation for
    ``deletedCriticalSupport C |>.erase d``) centered at ``c``; exact rows
    ``L`` and ``B`` centered at ``p`` and ``a``.

``live_overlap``
    one point ``x`` of ``L ∩ B`` as the deleted point; dangerous q-critical
    support ``L \\ {x}`` centered at ``p``; q-critical support
    ``B \\ {x}`` centered at ``a``; exact row ``K`` centered at ``c``.

The matcher never invents a class, center equality, or support incidence.
Unknown center-in-support facts and possible ``L ∩ K`` incidences are reported
as producer deficits.  Known self-center exclusions, the dangerous-center
exclusion, and the empty triple intersection are treated as hard role-map
failures.

The full-bank ranking is only a declaration-level screen: an unmatched theorem
class has not yet been assigned to one of the actual strict F2 centers.  The
``curated_producer_targets`` output is the authoritative branch-aware result.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Any


TOKEN = r"[^\s(){}:]+"
QCRITICAL_RE = re.compile(
    rf"U5QCriticalTripleClass\s+D\s+q\s+({TOKEN})\s+({TOKEN})"
)
QDELETED_RE = re.compile(
    rf"U5QDeletedK4Class\s+D\s+q\s+({TOKEN})\s+({TOKEN})"
)
DANGEROUS_RE = re.compile(
    rf"U5DangerousTriple\s+D\s+({TOKEN})\s+({TOKEN})\s+({TOKEN})"
)
MEMBERSHIP_RE = re.compile(
    rf"\([^():]+:\s*({TOKEN})\s+∈\s+({TOKEN})\)"
)
NONMEMBERSHIP_RE = re.compile(
    rf"\([^():]+:\s*({TOKEN})\s+∉\s+({TOKEN})\)"
)
INEQUALITY_RE = re.compile(
    rf"\([^():]+:\s*({TOKEN})\s+≠\s+({TOKEN})\)"
)
SKELETON_RE = re.compile(
    rf"\([^():]+:\s*({TOKEN})\s+∈\s+\(D\.skeleton\s+q\)\.erase\s+p\)"
)


@dataclass(frozen=True)
class ClassRole:
    kind: str
    center: str
    support: str


@dataclass(frozen=True)
class ViewClass:
    name: str
    kind: str
    center: str
    support: str


@dataclass(frozen=True)
class View:
    name: str
    deleted: str
    dangerous_center: str
    dangerous_support: str
    classes: tuple[ViewClass, ...]
    support_sizes: dict[str, int]
    intersection_capacities: dict[frozenset[str], int | None]

    def normalized_support(self, support: str) -> str:
        if support == "T":
            return self.dangerous_support
        return support


VIEWS = (
    View(
        name="deleted_source",
        deleted="d",
        dangerous_center="c",
        dangerous_support="K",
        classes=(
            ViewClass("critical_deleted_support", "Q", "c", "K"),
            ViewClass("live_exact_row", "E", "p", "L"),
            ViewClass("second_apex_exact_row", "E", "a", "B"),
        ),
        support_sizes={"L": 4, "B": 4, "K": 3},
        intersection_capacities={
            frozenset(("L", "B")): 2,
            frozenset(("B", "K")): 2,
            # The exact packet gives only |L ∩ K| ≤ 1.  ``None`` means that
            # nonemptiness is a genuine additional producer field.
            frozenset(("L", "K")): None,
            frozenset(("L", "B", "K")): 0,
        },
    ),
    View(
        name="live_overlap",
        deleted="x",
        dangerous_center="p",
        dangerous_support="L",
        classes=(
            ViewClass("live_qcritical_row", "Q", "p", "L"),
            ViewClass("second_apex_qcritical_row", "Q", "a", "B"),
            ViewClass("deleted_support_exact_row", "E", "c", "K"),
        ),
        support_sizes={"L": 3, "B": 3, "K": 4},
        intersection_capacities={
            # Erasing one of the two L-B witnesses leaves exactly one.
            frozenset(("L", "B")): 1,
            frozenset(("B", "K")): 2,
            frozenset(("L", "K")): None,
            frozenset(("L", "B", "K")): 0,
        },
    ),
)


def parse_statement(statement: str) -> dict[str, Any]:
    qcritical = [
        ClassRole("Q", center, support)
        for center, support in QCRITICAL_RE.findall(statement)
    ]
    qdeleted = [
        ClassRole("E", center, support)
        for center, support in QDELETED_RE.findall(statement)
    ]
    dangerous_match = DANGEROUS_RE.search(statement)
    dangerous = None
    if dangerous_match is not None:
        dangerous = {
            "deleted": dangerous_match.group(1),
            "center": dangerous_match.group(2),
            "support": dangerous_match.group(3),
        }
    memberships = [
        {"point": point, "support": support}
        for point, support in MEMBERSHIP_RE.findall(statement)
    ]
    inequalities = [
        {"left": left, "right": right}
        for left, right in INEQUALITY_RE.findall(statement)
    ]
    nonmemberships = [
        {"point": point, "support": support}
        for point, support in NONMEMBERSHIP_RE.findall(statement)
    ]
    skeleton_memberships = list(dict.fromkeys(SKELETON_RE.findall(statement)))
    return {
        "classes": qcritical + qdeleted,
        "dangerous": dangerous,
        "memberships": memberships,
        "nonmemberships": nonmemberships,
        "inequalities": inequalities,
        "skeleton_memberships": skeleton_memberships,
        "selected_candidate_count": statement.count("U5SelectedCandidateSkeleton"),
        "propagation_row_count": statement.count("U5PropagationRowWitness"),
        "raw_metric_side_count": (
            statement.count("dist ")
            + statement.count("Collinear ")
        ),
    }


def class_type_deficit(roles: list[ClassRole], view: View) -> dict[str, int]:
    needed = Counter(role.kind for role in roles)
    available = Counter(role.kind for role in view.classes)
    return {
        kind: max(0, needed[kind] - available[kind])
        for kind in ("Q", "E")
    }


def enumerate_class_maps(
    roles: list[ClassRole], view: View
) -> list[dict[int, ViewClass]]:
    """Enumerate injective, kind-preserving maps into the three packet rows."""
    if len(roles) > len(view.classes):
        return []
    options = [
        [candidate for candidate in view.classes if candidate.kind == role.kind]
        for role in roles
    ]
    if any(not candidates for candidates in options):
        return []
    maps: list[dict[int, ViewClass]] = []
    for choices in itertools.product(*options):
        if len({choice.name for choice in choices}) != len(choices):
            continue
        maps.append(dict(enumerate(choices)))
    return maps


def enumerate_partial_class_maps(
    roles: list[ClassRole], view: View
) -> list[dict[int, ViewClass]]:
    """Enumerate kind-preserving maps that may leave theorem classes unproduced."""
    options = [
        [None] + [
            candidate for candidate in view.classes
            if candidate.kind == role.kind
        ]
        for role in roles
    ]
    maps: list[dict[int, ViewClass]] = []
    for choices in itertools.product(*options):
        actual = [choice for choice in choices if choice is not None]
        if len({choice.name for choice in actual}) != len(actual):
            continue
        maps.append(
            {
                index: choice
                for index, choice in enumerate(choices)
                if choice is not None
            }
        )
    return maps


def support_capacity(view: View, supports: frozenset[str]) -> int | None:
    supports = frozenset(view.normalized_support(item) for item in supports)
    if not supports:
        return 100
    if len(supports) == 1:
        return view.support_sizes[next(iter(supports))]
    return view.intersection_capacities.get(supports, 0)


def graph_colorable(vertices: list[str], edges: set[frozenset[str]], colors: int) -> bool:
    if colors <= 0:
        return not vertices
    adjacency = {
        vertex: {
            next(iter(edge - {vertex}))
            for edge in edges
            if vertex in edge and len(edge) == 2
        }
        for vertex in vertices
    }
    order = sorted(vertices, key=lambda item: -len(adjacency[item]))
    assigned: dict[str, int] = {}

    def search(index: int) -> bool:
        if index == len(order):
            return True
        vertex = order[index]
        forbidden = {
            assigned[neighbor]
            for neighbor in adjacency[vertex]
            if neighbor in assigned
        }
        for color in range(colors):
            if color in forbidden:
                continue
            assigned[vertex] = color
            if search(index + 1):
                return True
        assigned.pop(vertex, None)
        return False

    return search(0)


def evaluate_map(
    parsed: dict[str, Any],
    roles: list[ClassRole],
    view: View,
    class_map: dict[int, ViewClass],
) -> dict[str, Any]:
    point_map: dict[str, str] = {}
    support_map: dict[str, str] = {}
    failures: list[str] = []
    producer_fields: set[str] = set()
    role_map: list[dict[str, str]] = []

    def bind(mapping: dict[str, str], key: str, value: str, label: str) -> None:
        previous = mapping.get(key)
        if previous is not None and previous != value:
            failures.append(
                f"{label} `{key}` would have to be both `{previous}` and `{value}`"
            )
        else:
            mapping[key] = value

    dangerous = parsed["dangerous"]
    if dangerous is not None:
        bind(point_map, dangerous["deleted"], view.deleted, "deleted point")
        bind(point_map, dangerous["center"], view.dangerous_center, "dangerous center")
        bind(support_map, dangerous["support"], view.dangerous_support, "dangerous support")

    for index, actual in sorted(class_map.items()):
        role = roles[index]
        bind(point_map, role.center, actual.center, "class center")
        bind(support_map, role.support, actual.support, "class support")
        role_map.append(
            {
                "theorem_kind": role.kind,
                "theorem_center": role.center,
                "theorem_support": role.support,
                "packet_class": actual.name,
                "packet_center": actual.center,
                "packet_support": actual.support,
            }
        )

    new_class_specs = []
    for index, role in enumerate(roles):
        if index in class_map:
            continue
        required_members = sorted({
            item["point"]
            for item in parsed["memberships"]
            if item["support"] == role.support
        })
        required_nonmembers = sorted({
            item["point"]
            for item in parsed["nonmemberships"]
            if item["support"] == role.support
        })
        spec = {
            "theorem_kind": role.kind,
            "theorem_center": role.center,
            "theorem_support": role.support,
            "center_required_in_dangerous_support": any(
                item["point"] == role.center
                and item["support"] == (
                    dangerous["support"] if dangerous is not None else ""
                )
                for item in parsed["memberships"]
            ),
            "required_members": required_members,
            "required_nonmembers": required_nonmembers,
        }
        new_class_specs.append(spec)
        kind = "q-critical" if role.kind == "Q" else "q-deleted"
        member_text = ", ".join(required_members) if required_members else "no named members"
        producer_fields.add(
            f"produce {kind} class `{role.support}` centered at `{role.center}` "
            f"with required members [{member_text}]"
        )

    # Structural self-center and deleted-point exclusions.
    own_center = {actual.support: actual.center for actual in class_map.values()}
    required_supports: dict[str, set[str]] = defaultdict(set)
    for membership in parsed["memberships"]:
        point = membership["point"]
        theorem_support = membership["support"]
        actual_support = support_map.get(theorem_support)
        if actual_support is None and theorem_support == "T" and dangerous is not None:
            actual_support = view.dangerous_support
        if actual_support is None:
            # This belongs to an unmatched/opaque support producer.
            continue
        required_supports[point].add(actual_support)

    fixed_points = set(point_map)
    for theorem_point, supports in sorted(required_supports.items()):
        actual_point = point_map.get(theorem_point)
        normalized = frozenset(view.normalized_support(item) for item in supports)
        if actual_point is None:
            capacity = support_capacity(view, normalized)
            if capacity == 0:
                failures.append(
                    f"`{theorem_point}` would have to lie in empty packet intersection "
                    f"{sorted(normalized)}"
                )
            elif capacity is None:
                producer_fields.add(
                    f"produce a point `{theorem_point}` in L ∩ K "
                    "(the packet only proves card ≤ 1)"
                )
            continue

        if actual_point == view.deleted:
            failures.append(
                f"deleted point `{theorem_point}={actual_point}` cannot belong to "
                f"{sorted(normalized)}"
            )
            continue
        for support in sorted(normalized):
            if own_center.get(support) == actual_point:
                failures.append(
                    f"`{theorem_point}={actual_point}` is the center of its own "
                    f"support `{support}`"
                )
            elif support == view.dangerous_support and actual_point == view.dangerous_center:
                failures.append(
                    f"`{theorem_point}={actual_point}` is the dangerous center and "
                    "cannot lie in its dangerous triple"
                )
            else:
                producer_fields.add(
                    f"prove center `{actual_point}` belongs to packet support `{support}`"
                )
        if support_capacity(view, normalized) == 0:
            failures.append(
                f"fixed center `{actual_point}` would have to lie in empty packet "
                f"intersection {sorted(normalized)}"
            )

    for nonmembership in parsed["nonmemberships"]:
        theorem_point = nonmembership["point"]
        theorem_support = nonmembership["support"]
        actual_support = support_map.get(theorem_support)
        if actual_support is None and theorem_support == "T" and dangerous is not None:
            actual_support = view.dangerous_support
        if actual_support is None:
            continue
        actual_point = point_map.get(theorem_point)
        if actual_point is None:
            producer_fields.add(
                f"choose `{theorem_point}` outside packet support `{actual_support}`"
            )
        elif (
            actual_point == view.deleted
            or own_center.get(actual_support) == actual_point
            or (
                actual_support == view.dangerous_support
                and actual_point == view.dangerous_center
            )
        ):
            continue
        else:
            producer_fields.add(
                f"prove center `{actual_point}` is outside packet support `{actual_support}`"
            )

    inequality_edges: set[frozenset[str]] = set()
    for inequality in parsed["inequalities"]:
        left = inequality["left"]
        right = inequality["right"]
        left_fixed = point_map.get(left)
        right_fixed = point_map.get(right)
        if left_fixed is not None and right_fixed is not None:
            if left_fixed == right_fixed:
                failures.append(
                    f"inequality `{left} ≠ {right}` collapses to `{left_fixed} ≠ {left_fixed}`"
                )
            continue
        if left != right:
            inequality_edges.add(frozenset((left, right)))

    # Capacity-check free witnesses that are required in the same intersection.
    by_signature: dict[frozenset[str], list[str]] = defaultdict(list)
    for point, supports in required_supports.items():
        if point in fixed_points:
            continue
        signature = frozenset(view.normalized_support(item) for item in supports)
        by_signature[signature].append(point)
    for signature, points in by_signature.items():
        capacity = support_capacity(view, signature)
        if capacity is None:
            capacity = 1
        relevant_edges = {
            edge
            for edge in inequality_edges
            if edge <= set(points)
        }
        if not graph_colorable(points, relevant_edges, capacity):
            failures.append(
                f"explicit inequalities require too many distinct witnesses in "
                f"intersection {sorted(signature)} of capacity at most {capacity}"
            )

    for point in parsed["skeleton_memberships"]:
        actual_point = point_map.get(point)
        if actual_point in {view.deleted, view.dangerous_center}:
            failures.append(
                f"skeleton witness `{point}={actual_point}` is deleted or the "
                "dangerous center"
            )
        elif point not in required_supports:
            producer_fields.add(
                f"produce `{point} ∈ (D.skeleton q).erase p`"
            )

    if parsed["selected_candidate_count"]:
        producer_fields.add(
            "produce the theorem's U5SelectedCandidateSkeleton side packet"
        )
    if parsed["propagation_row_count"]:
        producer_fields.add(
            "produce the theorem's U5PropagationRowWitness side rows"
        )
    if parsed["raw_metric_side_count"]:
        producer_fields.add(
            "produce standalone metric/noncollinearity hypotheses not encoded "
            "by the named U5 class roles"
        )

    return {
        "view": view.name,
        "role_map": role_map,
        "new_class_specs": new_class_specs,
        "new_class_count": len(new_class_specs),
        "producer_fields": sorted(producer_fields),
        "hard_failures": sorted(set(failures)),
        "missing_field_count": len(producer_fields),
        "hard_failure_count": len(set(failures)),
    }


def classify_declaration(declaration: dict[str, Any]) -> dict[str, Any]:
    parsed = parse_statement(declaration["statement"])
    roles: list[ClassRole] = parsed["classes"]
    view_results: list[dict[str, Any]] = []

    if not roles:
        classification = "opaque_or_nonclass_interface"
    else:
        for view in VIEWS:
            deficit = class_type_deficit(roles, view)
            maps = enumerate_class_maps(roles, view)
            attempts = [
                evaluate_map(parsed, roles, view, class_map)
                for class_map in maps
            ]
            attempts.sort(
                key=lambda item: (
                    item["hard_failure_count"] != 0,
                    item["hard_failure_count"],
                    item["missing_field_count"],
                    json.dumps(item["role_map"], sort_keys=True),
                )
            )
            best = attempts[0] if attempts else None
            repair_attempts = [
                evaluate_map(parsed, roles, view, class_map)
                for class_map in enumerate_partial_class_maps(roles, view)
            ]
            repair_attempts.sort(
                key=lambda item: (
                    item["hard_failure_count"] != 0,
                    item["hard_failure_count"],
                    item["new_class_count"],
                    item["missing_field_count"],
                    json.dumps(item["role_map"], sort_keys=True),
                )
            )
            best_repair = repair_attempts[0] if repair_attempts else None
            view_results.append(
                {
                    "view": view.name,
                    "available_class_types": dict(
                        Counter(item.kind for item in view.classes)
                    ),
                    "required_class_types": dict(
                        Counter(item.kind for item in roles)
                    ),
                    "additional_class_producers": deficit,
                    "full_role_map_count": len(maps),
                    "best_full_role_map": best,
                    "best_repair": best_repair,
                }
            )

        viable = [
            result["best_full_role_map"]
            for result in view_results
            if result["best_full_role_map"] is not None
            and result["best_full_role_map"]["hard_failure_count"] == 0
        ]
        any_full = [
            result["best_full_role_map"]
            for result in view_results
            if result["best_full_role_map"] is not None
        ]
        if viable and min(item["missing_field_count"] for item in viable) == 0:
            classification = "direct_match"
        elif viable:
            classification = "conditional_match"
        elif any_full:
            classification = "impossible_role_map"
        else:
            classification = "additional_class_producers_required"

    return {
        "fq_name": declaration["fq_name"],
        "family": declaration["family"],
        "module": declaration["module"],
        "path": declaration["path"],
        "line": declaration["line"],
        "proof_status": declaration["proof_status"],
        "source_reachable": declaration["source_reachable"],
        "local_shape_match": declaration["local_shape_match"],
        "classification": classification,
        "parsed": {
            "dangerous": parsed["dangerous"],
            "classes": [
                {
                    "kind": role.kind,
                    "center": role.center,
                    "support": role.support,
                }
                for role in roles
            ],
            "memberships": parsed["memberships"],
            "nonmemberships": parsed["nonmemberships"],
            "inequalities": parsed["inequalities"],
            "skeleton_memberships": parsed["skeleton_memberships"],
            "selected_candidate_count": parsed["selected_candidate_count"],
            "propagation_row_count": parsed["propagation_row_count"],
            "raw_metric_side_count": parsed["raw_metric_side_count"],
        },
        "views": view_results,
        "statement": declaration["statement"],
    }


def is_relevant(declaration: dict[str, Any]) -> bool:
    return (
        declaration["family"] in {"U5GlobalIncidence", "U5"}
        and declaration["category"] == "ambient-data-uniform"
        and declaration["proof_status"] == "source-proved"
        and declaration["source_reachable"] is True
        and ": False" in declaration["statement"]
    )


def best_viable(result: dict[str, Any]) -> dict[str, Any] | None:
    candidates = [
        view["best_full_role_map"]
        for view in result["views"]
        if view["best_full_role_map"] is not None
        and view["best_full_role_map"]["hard_failure_count"] == 0
    ]
    if not candidates:
        return None
    return min(
        candidates,
        key=lambda item: (
            item["missing_field_count"],
            item["view"],
        ),
    )


def best_repair(result: dict[str, Any]) -> dict[str, Any] | None:
    candidates = [
        view["best_repair"]
        for view in result["views"]
        if view["best_repair"] is not None
        and view["best_repair"]["hard_failure_count"] == 0
    ]
    if not candidates:
        return None
    return min(
        candidates,
        key=lambda item: (
            item["new_class_count"],
            item["missing_field_count"],
            item["view"],
        ),
    )


def self_check(declarations: list[dict[str, Any]], results: list[dict[str, Any]]) -> None:
    global_all = [
        item for item in declarations
        if item["family"] == "U5GlobalIncidence"
    ]
    global_novel = [item for item in global_all if not item["local_shape_match"]]
    u5_all = [item for item in declarations if item["family"] == "U5"]
    if len(global_all) != 114:
        raise RuntimeError(f"expected 114 global class consumers, got {len(global_all)}")
    if len(global_novel) != 96:
        raise RuntimeError(f"expected 96 novel global consumers, got {len(global_novel)}")
    if len(u5_all) != 56:
        raise RuntimeError(f"expected 56 other U5 consumers, got {len(u5_all)}")

    by_name = {item["fq_name"]: item for item in results}
    mutual = by_name[
        "Problem97.U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility"
    ]
    mutual_types = Counter(
        role["kind"] for role in mutual["parsed"]["classes"]
    )
    if mutual_types != Counter({"Q": 2, "E": 1}):
        raise RuntimeError(f"mutual-no-p parser drift: {mutual_types}")

    tetrahedron = by_name[
        "Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility"
    ]
    tetrahedron_types = Counter(
        role["kind"] for role in tetrahedron["parsed"]["classes"]
    )
    if tetrahedron_types != Counter({"E": 3}):
        raise RuntimeError(f"tetrahedron parser drift: {tetrahedron_types}")

    adjacent = by_name[
        "Problem97.U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility"
    ]
    if adjacent["classification"] == "direct_match":
        raise RuntimeError("known adjacent-center negative control became a direct match")

    two_points = by_name[
        "Problem97.U5QCriticalTripleClass.two_triple_points_incompatibility"
    ]
    if two_points["parsed"]["dangerous"] != {
        "deleted": "q",
        "center": "p",
        "support": "T",
    }:
        raise RuntimeError("two-triple-points dangerous-source parser drift")
    if Counter(
        (item["point"], item["support"])
        for item in two_points["parsed"]["memberships"]
    ) != Counter({
        ("t₁", "T"): 1,
        ("t₂", "T"): 1,
        ("t₁", "B"): 1,
        ("t₂", "B"): 1,
    }):
        raise RuntimeError("two-triple-points membership parser drift")

    if support_capacity(VIEWS[1], frozenset(("L", "B"))) != 1:
        raise RuntimeError("live-overlap L-B capacity drift")
    if support_capacity(VIEWS[0], frozenset(("L", "B", "K"))) != 0:
        raise RuntimeError("triple-common-cell negative control drift")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "registry",
        nargs="?",
        type=Path,
        default=Path("certificates/p97_rvol_general_n_mining.json"),
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    raw = json.loads(args.registry.read_text())
    declarations = [
        declaration
        for declaration in raw["candidate_declarations"]
        if is_relevant(declaration)
    ]
    results = [classify_declaration(declaration) for declaration in declarations]
    if args.check:
        self_check(declarations, results)

    counts = Counter(item["classification"] for item in results)
    closest = []
    for item in results:
        viable = best_viable(item)
        if viable is None:
            continue
        closest.append(
            {
                "fq_name": item["fq_name"],
                "family": item["family"],
                "module": item["module"],
                "local_shape_match": item["local_shape_match"],
                "classification": item["classification"],
                "view": viable["view"],
                "missing_field_count": viable["missing_field_count"],
                "producer_fields": viable["producer_fields"],
                "role_map": viable["role_map"],
            }
        )
    closest.sort(
        key=lambda item: (
            item["missing_field_count"],
            item["fq_name"],
        )
    )

    repairs = []
    for item in results:
        repair = best_repair(item)
        if repair is None:
            continue
        repairs.append(
            {
                "fq_name": item["fq_name"],
                "family": item["family"],
                "module": item["module"],
                "local_shape_match": item["local_shape_match"],
                "classification": item["classification"],
                "view": repair["view"],
                "new_class_count": repair["new_class_count"],
                "missing_field_count": repair["missing_field_count"],
                "new_class_specs": repair["new_class_specs"],
                "producer_fields": repair["producer_fields"],
                "role_map": repair["role_map"],
            }
        )
    repairs.sort(
        key=lambda item: (
            item["new_class_count"],
            item["missing_field_count"],
            item["fq_name"],
        )
    )

    by_name = {item["fq_name"]: item for item in results}
    curated_producer_targets = [
        {
            "id": "UNIFORM-TWO-OFF-DELETED-DANGEROUS-TRIPLE",
            "epistemic_status": "kernel_checked_positive_producer",
            "source_faithful_input": {
                "q": "actual common deleted source",
                "p": "actual retained deleted-source blocker",
                "T": "(deletedCriticalSupport C).erase deleted",
                "center": "an actual strict support-only F2 witness z ∈ T",
                "output": (
                    "either an exact q-deleted support B of card four or an "
                    "exact q-critical support B of card three"
                ),
            },
            "conclusion": "2 ≤ (B \\ T).card",
            "reason": [
                (
                    "q-critical: two_triple_points_incompatibility gives "
                    "(B ∩ T).card ≤ 1, and B.card = 3"
                ),
                (
                    "q-deleted: the existing two-circle bound gives "
                    "(B ∩ T).card ≤ 2, and B.card = 4"
                ),
            ],
            "applies_to": [
                "support-heavy: all four q-deleted/q-critical split arms",
                (
                    "mixed strict-cell arm at its support-only witness, once "
                    "the standard global-K4 split is exposed"
                ),
            ],
            "lean_adapters": [
                (
                    "scratch/atail-force/r-f2-three-row-bank-deficits/"
                    "F2ThreeRowBankDeficitAdapters.lean::"
                    "qCritical_two_le_support_sdiff_dangerous_card"
                ),
                (
                    "scratch/atail-force/r-f2-three-row-bank-deficits/"
                    "F2ThreeRowBankDeficitAdapters.lean::"
                    "qDeleted_two_le_support_sdiff_dangerous_card"
                ),
            ],
            "remaining_bridge": (
                "classify these two off-T support points relative to the live "
                "row, cap/MEC placement, and retained critical provenance; "
                "off T is not yet the existing two-off-live antecedent"
            ),
            "priority": 1,
        },
        {
            "id": "Q-TWO-DANGEROUS-HITS",
            "epistemic_status": "conditional_terminal_do_not_mine_as_default",
            "consumer": (
                "Problem97.U5QCriticalTripleClass."
                "two_triple_points_incompatibility"
            ),
            "consumer_statement": by_name[
                "Problem97.U5QCriticalTripleClass."
                "two_triple_points_incompatibility"
            ]["statement"],
            "source_faithful_substitution": {
                "q": "actual common deleted source",
                "p": "actual retained deleted-source blocker",
                "T": "(deletedCriticalSupport C).erase deleted",
                "center": (
                    "an actual strict support-only F2 witness z, hence z ∈ T"
                ),
                "B": "the generated q-critical support at z",
            },
            "already_proved": [
                "the dangerous triple is dangerousTriple_at_commonDeletion C",
                "the strict support-only center z belongs to T",
                (
                    "z ≠ p follows from T ⊆ (D.skeleton q).erase p; "
                    "it is not an extra producer field"
                ),
                "global K4 supplies the q-deleted/q-critical split at z",
            ],
            "missing_fields": [
                "2 ≤ (B ∩ T).card",
            ],
            "applies_to": [
                "support-heavy: either mixed q-critical/q-deleted arm",
                "support-heavy: either side of the both-q-critical arm",
                (
                    "mixed strict-cell arm if its support-only witness takes "
                    "the q-critical branch"
                ),
            ],
            "does_not_cover": [
                "a branch in which every generated strict-center row is q-deleted",
                (
                    "a live-only q-critical center without an additional proof "
                    "that the center differs from the deleted-source blocker"
                ),
            ],
            "lean_adapter": (
                "scratch/atail-force/r-f2-three-row-bank-deficits/"
                "F2ThreeRowBankDeficitAdapters.lean::"
                "false_of_qCritical_inter_dangerous_card_ge_two"
            ),
            "interpretation": (
                "This is the forbidden side of the dichotomy.  Its useful "
                "default consequence is the positive two-off-T producer above, "
                "not a recommendation to mine for an impossible incidence."
            ),
            "priority": 2,
        },
        {
            "id": "Q-Q-ADJACENT-THREE-INCIDENCES",
            "epistemic_status": "conditional_consumer_kernel_checked",
            "consumer": (
                "Problem97.U5QCriticalTripleClass."
                "two_triple_centers_adjacent_incompatibility"
            ),
            "source_faithful_substitution": {
                "q": "actual common deleted source",
                "p": "actual retained deleted-source blocker c",
                "a,b": "the two strict support-only centers s,t",
                "Ba,Bb": "their generated q-critical supports",
            },
            "already_proved": [
                "s,t are distinct points of the actual dangerous triple",
                "both generated classes exist in the both-q-critical branch",
            ],
            "missing_fields": [
                "c ∈ support_at_s",
                "c ∈ support_at_t",
                "t ∈ support_at_s ∨ s ∈ support_at_t",
            ],
            "applies_to": [
                "support-heavy: both-q-critical arm only",
            ],
            "lean_adapter": (
                "scratch/atail-force/r-f2-supportheavy-k4-split/"
                "F2SupportHeavyK4Split.lean::"
                "BothQCriticalCase.false_of_adjacentBankAntecedents"
            ),
            "priority": 3,
        },
        {
            "id": "E-E-SELECTED-TETRAHEDRON",
            "epistemic_status": "conditional_consumer_kernel_checked",
            "consumer": (
                "Problem97.U5QDeletedK4Class."
                "three_exact_classes_tetrahedron_incompatibility"
            ),
            "local_weaker_adapter": (
                "scratch/atail-force/tetrahedron-bank-adapter/"
                "TetrahedronBankAdapter.lean::"
                "false_of_three_selected_classes_tetrahedron"
            ),
            "source_faithful_substitution": {
                "x,y": (
                    "two distinct strict middle-row centers whose generated "
                    "branches are q-deleted"
                ),
                "b": "the actual second-apex center",
                "Bb": "the actual middle row C.B₂",
                "a": "any third point w of C.B₂ distinct from x,y",
                "Bx,By": "the two generated q-deleted supports",
            },
            "already_proved": [
                "x,y,w ∈ C.B₂",
                "the actual middle row is a selected four-class at b",
                "C.B₂.card = 4, so a third point w exists",
            ],
            "missing_fields": [
                "y ∈ Bx",
                "w ∈ Bx",
                "x ∈ By",
                "w ∈ By",
                "b ∈ By",
            ],
            "applies_to": [
                "live-heavy: both-q-deleted arm",
                "support-heavy: both-q-deleted arm",
                "mixed strict-cell arm: both-q-deleted arm",
            ],
            "does_not_cover": [
                "either mixed q-deleted/q-critical arm",
            ],
            "priority": 4,
        },
        {
            "id": "LONGER-Q-Q-E-FAMILIES-DOMINATED",
            "epistemic_status": "screened_not_preferred",
            "consumers": [
                (
                    "Problem97.U5QCriticalTripleClass."
                    "mutual_no_p_exact_center_incompatibility"
                ),
                (
                    "Problem97.U5QCriticalTripleClass."
                    "rank_one_radius_child_incompatibility"
                ),
                (
                    "Problem97.U5QCriticalTripleClass."
                    "rank_two_mixed_short_incompatibility"
                ),
            ],
            "reason": (
                "After source-faithful substitution these require at least two "
                "generated class roles plus several directed center/support "
                "incidences.  They are strictly farther than Q-TWO-DANGEROUS-HITS "
                "on every q-critical support-heavy branch and do not cover the "
                "all-q-deleted branch."
            ),
            "priority": 5,
        },
    ]

    report = {
        "schema": "p97_f2_three_row_bank_role_deficits.v2",
        "scope": {
            "registry": str(args.registry),
            "source_proved_reachable_ambient_u5_false_consumers": len(declarations),
            "u5_global_incidence": sum(
                item["family"] == "U5GlobalIncidence" for item in declarations
            ),
            "u5_global_incidence_novel": sum(
                item["family"] == "U5GlobalIncidence"
                and not item["local_shape_match"]
                for item in declarations
            ),
            "other_u5": sum(item["family"] == "U5" for item in declarations),
        },
        "packet_views": [
            {
                "name": view.name,
                "deleted": view.deleted,
                "dangerous_center": view.dangerous_center,
                "dangerous_support": view.dangerous_support,
                "classes": [
                    {
                        "name": item.name,
                        "kind": item.kind,
                        "center": item.center,
                        "support": item.support,
                    }
                    for item in view.classes
                ],
                "support_sizes": view.support_sizes,
                "intersection_capacities": {
                    "&".join(sorted(key)): value
                    for key, value in view.intersection_capacities.items()
                },
            }
            for view in VIEWS
        ],
        "source_faithful_producer_boundary": {
            "live_heavy": {
                "strict_centers": ["x", "y"],
                "dangerous_triple_centers_for_original_deletion": [],
                "use": (
                    "the checked split can produce auxiliary q-deleted or "
                    "q-critical classes at x and y, but not the triple-centered "
                    "classes required by most bank families"
                ),
            },
            "support_heavy": {
                "strict_centers": ["s", "t"],
                "dangerous_triple_centers_for_original_deletion": ["s", "t"],
                "use": (
                    "the checked split can produce the missing triple-centered "
                    "classes, subject to choosing the required q-deleted or "
                    "q-critical branch and then proving the theorem's named "
                    "support incidences"
                ),
            },
            "mixed": {
                "strict_centers": ["one of x,y", "one of s,t"],
                "dangerous_triple_centers_for_original_deletion": ["one of s,t"],
                "use": (
                    "one auxiliary and one triple-centered split are available; "
                    "families needing two triple-centered new classes remain short "
                    "by one such producer"
                ),
            },
        },
        "classification_counts": dict(sorted(counts.items())),
        "direct_matches": [
            item["fq_name"]
            for item in results
            if item["classification"] == "direct_match"
        ],
        "curated_producer_targets": curated_producer_targets,
        "next_mining_object": {
            "object": (
                "the actual generated support at a named strict F2 center, "
                "with source, center, q-deleted/q-critical type, T-membership, "
                "live-row membership, and cap/MEC roles retained"
            ),
            "first_question": (
                "where do the two guaranteed points of B \\ T lie relative to "
                "the live row and the retained second-apex/common-deletion rows?"
            ),
            "success_outputs": [
                (
                    "two genuinely off-live sources that feed a checked "
                    "successor/second-center-alignment theorem"
                ),
                (
                    "the three explicit adjacent-center incidences on a "
                    "both-q-critical branch"
                ),
                (
                    "the five selected-class tetrahedron incidences on an "
                    "all-q-deleted branch"
                ),
            ],
            "do_not_mine": [
                "anonymous fixed-cardinality support hypergraphs",
                "the live_overlap change-of-deletion view as if it were current",
                "raw metric kernels without their source-faithful side fields",
            ],
        },
        "interpretation_limits": [
            (
                "closest_repairs is a declaration-level lower-bound screen, "
                "not an assignment of unmatched classes to actual F2 centers"
            ),
            (
                "raw metric/kernel declarations are kept in the census but "
                "are not producer routes unless their metric side hypotheses "
                "are separately derived"
            ),
            (
                "live_overlap is a diagnostic change-of-deletion view; it is "
                "not the current original-deletion producer boundary"
            ),
            (
                "only curated_producer_targets records branch-aware, "
                "source-faithful substitutions"
            ),
        ],
        "closest_conditional_matches": closest[:30],
        "closest_repairs": repairs[:50],
        "declarations": results,
    }
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered)


if __name__ == "__main__":
    main()
