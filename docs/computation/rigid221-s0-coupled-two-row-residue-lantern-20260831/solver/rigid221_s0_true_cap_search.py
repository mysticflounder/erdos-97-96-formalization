# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Bounded exact search for a source-valid Rigid221 S0 true-cap repair.

The search covers a bounded coordinate-preserving repair family after the
fixed-cell MEC obstruction: it preserves every one of the twelve old rational
points and adds either one or two Moser-only carrier roles. Candidate MEC
circles pass through physical ``O``. Every coordinate, predicate, and
acceptance decision uses :class:`fractions.Fraction`; no floating-point
acceptance is present.

This is a finite discovery grid, not a decision procedure for arbitrary real
coordinates.  Exhaustion therefore reports ``ENCODING_BLOCKED``, never UNSAT.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from functools import lru_cache
from itertools import combinations, permutations
from pathlib import Path
from typing import Any

from rigid221_s0_coupled_two_row import KU, KV, ORDER, PHYSICAL, POINTS

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-true-cap-bounded-coordinate-search/v1"
STATUS = "ENCODING_BLOCKED"
EVIDENCE_LABEL = "EMPIRICALLY_VERIFIED_FINITE_EXACT_GRID_EXHAUSTION"

# All reduced n/d values represented by these bounds are tried.  Constructing
# the set first makes duplicate presentations (for example 1/2 and 2/4) count
# only once.
SLOPE_NUMERATOR_BOUND = 60
SLOPE_DENOMINATOR_BOUND = 12
ONE_ROLE_HALF_STEP_BOUND = 30

# These are exact circle centers, not floating starting guesses.  Every circle
# has radius squared |center|^2 because it passes through O=(0,0).
TWO_ROLE_CENTERS: tuple[Point, ...] = (
    (F(2), F(0)),
    (F(3), F(-1)),
    (F(3), F(0)),
    (F(4), F(-1)),
    (F(5), F(-2)),
    (F(5), F(-1)),
    (F(5), F(0)),
    (F(10), F(-5)),
)

SOURCE_ANCHORS = {
    "surplus_cap_packet": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332",
    "on_arc_opposite": "lean/Erdos9796Proof/P97/Foundation.lean:83",
    "opp_index2": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550",
    "opp_apex2": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305",
    "rotated_packet": "lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:273",
}


@dataclass(frozen=True)
class BoundaryCandidate:
    """A rational boundary point that preserves the old convex carrier alone."""

    slope: F
    point: Point
    insertion_edge: int


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def scale(value: F, point: Point) -> Point:
    return value * point[0], value * point[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: Point, second: Point) -> F:
    difference = sub(first, second)
    return dot(difference, difference)


def orient(first: Point, second: Point, third: Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (
        second[1] - first[1]
    ) * (third[0] - first[0])


def on_arc_opposite(vi: Point, vj: Point, vk: Point, point: Point) -> bool:
    """Exact transcription of ``Problem97.OnArcOpposite``."""

    return orient(point, vj, vk) * orient(vi, vj, vk) <= 0


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def slope_grid() -> tuple[F, ...]:
    return tuple(
        sorted(
            {
                F(numerator, denominator)
                for denominator in range(1, SLOPE_DENOMINATOR_BOUND + 1)
                for numerator in range(
                    -SLOPE_NUMERATOR_BOUND, SLOPE_NUMERATOR_BOUND + 1
                )
            }
        )
    )


def circle_point_through_origin(center: Point, slope: F) -> Point:
    """Second intersection of ``y=slope*x`` with the circle through O."""

    x = 2 * (center[0] + slope * center[1]) / (1 + slope * slope)
    return x, slope * x


def circle_slacks(points: Mapping[str, Point], center: Point) -> dict[str, F]:
    radius2 = dist2(center, points["O"])
    return {role: radius2 - dist2(center, point) for role, point in points.items()}


def strict_convexity_report(
    points: Mapping[str, Point], order: Sequence[str]
) -> tuple[F, int]:
    if len(order) != len(points) or set(order) != set(points):
        raise ValueError("cyclic order is not an enumeration of the carrier")
    values: list[F] = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for other in order:
            if other in (first, second):
                continue
            value = orient(points[first], points[second], points[other])
            if value <= 0:
                raise ValueError(
                    f"non-strict hull edge {first}->{second} at {other}: {value}"
                )
            values.append(value)
    return min(values), len(values)


def insertion_edge(point: Point) -> int | None:
    """Return the old edge split by one new strict-convex vertex, if any."""

    edge_values = [
        orient(POINTS[ORDER[index]], POINTS[ORDER[(index + 1) % len(ORDER)]], point)
        for index in range(len(ORDER))
    ]
    violated = [index for index, value in enumerate(edge_values) if value <= 0]
    if len(violated) != 1 or edge_values[violated[0]] == 0:
        return None
    edge = violated[0]
    points = dict(POINTS)
    points["new"] = point
    order = ORDER[: edge + 1] + ("new",) + ORDER[edge + 1 :]
    try:
        strict_convexity_report(points, order)
    except ValueError:
        return None
    return edge


def boundary_candidates(center: Point, slopes: Iterable[F]) -> tuple[BoundaryCandidate, ...]:
    candidates: dict[Point, BoundaryCandidate] = {}
    for slope in slopes:
        point = circle_point_through_origin(center, slope)
        if point == POINTS["O"] or point in POINTS.values():
            continue
        edge = insertion_edge(point)
        if edge is not None:
            candidates[point] = BoundaryCandidate(slope, point, edge)
    return tuple(sorted(candidates.values(), key=lambda item: (item.slope, item.point)))


def non_obtuse(points: Mapping[str, Point], triple: Sequence[str]) -> tuple[F, F, F]:
    v1, v2, v3 = (points[role] for role in triple)
    return (
        dot(sub(v2, v1), sub(v3, v1)),
        dot(sub(v3, v2), sub(v1, v2)),
        dot(sub(v1, v3), sub(v2, v3)),
    )


def cap_sets(
    points: Mapping[str, Point], triple: Sequence[str]
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    v1, v2, v3 = (points[role] for role in triple)
    frames = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    return tuple(
        frozenset(
            role
            for role, point in points.items()
            if on_arc_opposite(apex, first, second, point)
        )
        for apex, first, second in frames
    )  # type: ignore[return-value]


def cap_triple_valid(
    points: Mapping[str, Point], triple: Sequence[str], caps: Sequence[frozenset[str]]
) -> bool:
    moser = frozenset(triple)
    for role in points:
        multiplicity = sum(role in cap for cap in caps)
        if multiplicity != (2 if role in moser else 1):
            return False
    return True


def opp_index2(surplus_index: int) -> int:
    return (2, 0, 1)[surplus_index]


def cap_interior(
    caps: Sequence[frozenset[str]], triple: Sequence[str], index: int
) -> frozenset[str]:
    endpoint_indices = ((1, 2), (2, 0), (0, 1))
    first, second = endpoint_indices[index]
    return caps[index] - {triple[first], triple[second]}


def complete_fiber(
    points: Mapping[str, Point], center: str, radius2: F
) -> frozenset[str]:
    return frozenset(
        role for role, point in points.items() if dist2(points[center], point) == radius2
    )


def post_deletion_profile(
    points: Mapping[str, Point], center: str, deleted: str
) -> tuple[int, tuple[int, ...]]:
    multiplicities = Counter(
        dist2(points[center], point)
        for role, point in points.items()
        if role != deleted and dist2(points[center], point) > 0
    )
    profile = tuple(sorted(multiplicities.values(), reverse=True))
    return max(profile, default=0), profile


def pair_orders(first: BoundaryCandidate, second: BoundaryCandidate) -> tuple[tuple[str, ...], ...]:
    """All cyclic orders compatible with the two individually split old edges."""

    by_edge: dict[int, list[str]] = {}
    by_edge.setdefault(first.insertion_edge, []).append("m1")
    by_edge.setdefault(second.insertion_edge, []).append("m2")
    variants: list[tuple[str, ...]] = []
    same_edge = first.insertion_edge == second.insertion_edge
    local_orders = (("m1", "m2"), ("m2", "m1")) if same_edge else ((),)
    for local_order in local_orders:
        result: list[str] = []
        for index, role in enumerate(ORDER):
            result.append(role)
            inserted = by_edge.get(index, [])
            if same_edge and inserted:
                result.extend(local_order)
            else:
                result.extend(inserted)
        variants.append(tuple(result))
    return tuple(variants)


def exact_row_checks(points: Mapping[str, Point]) -> dict[str, Any]:
    physical_radius2 = dist2(points["O"], points["u"])
    ku_radius2 = dist2(points["cu"], points["u"])
    kv_radius2 = dist2(points["cv"], points["v"])
    if physical_radius2 <= 0 or complete_fiber(points, "O", physical_radius2) != PHYSICAL:
        raise ValueError("physical five-fiber is not complete")
    if complete_fiber(points, "cu", ku_radius2) != KU:
        raise ValueError("Ku is not the complete four-fiber")
    if complete_fiber(points, "cv", kv_radius2) != KV:
        raise ValueError("Kv is not the complete four-fiber")
    if (KU & PHYSICAL, KV & PHYSICAL) != ({"u", "xu"}, {"v", "xv"}):
        raise ValueError("the 2+2+1 residue traces changed")
    if PHYSICAL != (KU & PHYSICAL) | (KV & PHYSICAL) | {"delta"}:
        raise ValueError("the singleton residue changed")
    post_u_max, post_u_profile = post_deletion_profile(points, "cu", "u")
    post_v_max, post_v_profile = post_deletion_profile(points, "cv", "v")
    if post_u_max > 3 or post_v_max > 3:
        raise ValueError("singleton blocking failed")
    return {
        "physical_radius_squared": fraction_json(physical_radius2),
        "ku_radius_squared": fraction_json(ku_radius2),
        "kv_radius_squared": fraction_json(kv_radius2),
        "physical_roles": sorted(PHYSICAL),
        "Ku": sorted(KU),
        "Kv": sorted(KV),
        "mutual_omissions": {"v_not_in_Ku": "v" not in KU, "u_not_in_Kv": "u" not in KV},
        "residue_profile": "2+2+1",
        "post_u_max_positive_multiplicity": post_u_max,
        "post_u_profile": list(post_u_profile),
        "post_v_max_positive_multiplicity": post_v_max,
        "post_v_profile": list(post_v_profile),
    }


def verify_source_candidate(
    points: Mapping[str, Point],
    order: Sequence[str],
    center: Point,
    triple: Sequence[str],
    surplus_index: int,
) -> dict[str, Any]:
    """Replay every active L1 finite field and emit an exact certificate."""

    if len(points) not in (13, 14) or len(set(points.values())) != len(points):
        raise ValueError("candidate is not a distinct one/two-role extension")
    row = exact_row_checks(points)
    minimum_orientation, orientation_checks = strict_convexity_report(points, order)
    radius2 = dist2(center, points["O"])
    if radius2 <= 0:
        raise ValueError("MEC radius is not positive")
    slacks = circle_slacks(points, center)
    if any(value < 0 for value in slacks.values()):
        raise ValueError("candidate circle does not enclose the carrier")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    if boundary != frozenset(triple) or "O" not in boundary or len(boundary) != 3:
        raise ValueError("boundary is not the exact three-role set containing O")
    dots = non_obtuse(points, triple)
    if any(value < 0 for value in dots):
        raise ValueError("Moser boundary triple is obtuse")
    caps = cap_sets(points, triple)
    if not cap_triple_valid(points, triple, caps):
        raise ValueError("closed OnArcOpposite filters do not form a CapTriple")
    if len(caps[surplus_index]) <= 4:
        raise ValueError("selected cap is not surplus")
    j_index = opp_index2(surplus_index)
    if triple[j_index] != "O":
        raise ValueError("physical O is not definitionally oppApex2")
    j = cap_interior(caps, triple, j_index)
    if "u" not in j:
        raise ValueError("actual source u is not in rotated strict interior J")
    branch = "S0-I" if "xu" in j else "S0-N"
    rotated = tuple(triple[(j_index + offset) % 3] for offset in range(3))
    cap_frame = rotated[1], rotated[2], rotated[0]
    return {
        "schema": "rigid221-s0-true-cap-exact-witness/v1",
        "status": "SAT_EXACT",
        "arithmetic": "fractions.Fraction only",
        "points": {role: point_json(points[role]) for role in order},
        "cyclic_order": list(order),
        "row_core": row,
        "strict_convexity": {
            "orientation_checks": orientation_checks,
            "minimum_orientation": fraction_json(minimum_orientation),
        },
        "mec": {
            "center": point_json(center),
            "radius_squared": fraction_json(radius2),
            "boundary_roles": sorted(boundary),
            "boundary_cardinality": len(boundary),
            "strict_interior_slacks": {
                role: fraction_json(value)
                for role, value in slacks.items()
                if role not in boundary
            },
            "non_obtuse_dot_products": [fraction_json(value) for value in dots],
        },
        "cap_packet": {
            "moser_vertices": {f"v{index + 1}": role for index, role in enumerate(triple)},
            "cap_members": [sorted(cap) for cap in caps],
            "cap_cardinalities": [len(cap) for cap in caps],
            "surplus_index": surplus_index,
            "opp_index2": j_index,
            "oppApex2": triple[j_index],
            "circPacketByIndex_triangle": list(rotated),
            "capFramePacketByIndex_triangle": list(cap_frame),
            "rotated_packet_reuses_center_radius_and_cyclically_rotates_boundary_and_dot_fields": True,
            "J": sorted(j),
            "J_endpoint_erasure": sorted(
                set(caps[j_index]) - set(j)
            ),
            "source_u_in_J": True,
            "s0_branch": branch,
            "xu_in_J": "xu" in j,
        },
        "claim_scope": {
            "finite_exact_witness": True,
            "source_universal_claim": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
    }


def packet_search(
    points: Mapping[str, Point], order: Sequence[str], center: Point, boundary: Sequence[str]
) -> tuple[dict[str, Any] | None, int]:
    """Try all ordered triples/surplus indices with O as actual oppApex2."""

    reached = 0
    for triple in permutations(boundary):
        if any(value < 0 for value in non_obtuse(points, triple)):
            continue
        reached += 1
        for surplus_index in range(3):
            if triple[opp_index2(surplus_index)] != "O":
                continue
            try:
                return verify_source_candidate(points, order, center, triple, surplus_index), reached
            except ValueError:
                continue
    return None, reached


def search_one_added_role(slopes: Sequence[F]) -> tuple[dict[str, Any] | None, dict[str, int]]:
    stats = {
        "center_parameter_cells": 0,
        "exact_enclosing_circles_with_boundary_O_and_one_old_role": 0,
        "boundary_slope_values_tested": 0,
        "strict_convex_single_insertions": 0,
        "non_obtuse_boundary_triples": 0,
        "source_packet_candidates": 0,
    }
    for old_boundary in ORDER:
        if old_boundary == "O":
            continue
        old_point = POINTS[old_boundary]
        normal = (-old_point[1], old_point[0])
        for numerator in range(-ONE_ROLE_HALF_STEP_BOUND, ONE_ROLE_HALF_STEP_BOUND + 1):
            stats["center_parameter_cells"] += 1
            parameter = F(numerator, 2)
            center = add(scale(F(1, 2), old_point), scale(parameter, normal))
            slacks = circle_slacks(POINTS, center)
            boundary = frozenset(role for role, value in slacks.items() if value == 0)
            if any(value < 0 for value in slacks.values()) or boundary != {"O", old_boundary}:
                continue
            stats["exact_enclosing_circles_with_boundary_O_and_one_old_role"] += 1
            stats["boundary_slope_values_tested"] += len(slopes)
            for candidate in boundary_candidates(center, slopes):
                stats["strict_convex_single_insertions"] += 1
                points = dict(POINTS)
                points["m"] = candidate.point
                order = ORDER[: candidate.insertion_edge + 1] + ("m",) + ORDER[candidate.insertion_edge + 1 :]
                triple = ("O", old_boundary, "m")
                if any(value < 0 for value in non_obtuse(points, triple)):
                    continue
                stats["non_obtuse_boundary_triples"] += 1
                certificate, reached = packet_search(points, order, center, triple)
                stats["source_packet_candidates"] += reached
                if certificate is not None:
                    return certificate, stats
    return None, stats


def search_two_added_roles(slopes: Sequence[F]) -> tuple[dict[str, Any] | None, dict[str, int]]:
    stats = {
        "center_cells": len(TWO_ROLE_CENTERS),
        "exact_enclosing_circles_strict_on_old_non_O_roles": 0,
        "boundary_slope_values_tested": 0,
        "strict_convex_single_insertions": 0,
        "unordered_boundary_pairs": 0,
        "non_obtuse_boundary_pairs": 0,
        "strict_convex_pair_insertions": 0,
        "source_packet_candidates": 0,
    }
    for center in TWO_ROLE_CENTERS:
        slacks = circle_slacks(POINTS, center)
        if slacks["O"] != 0 or any(
            value <= 0 for role, value in slacks.items() if role != "O"
        ):
            raise ValueError(f"declared two-role center is not source-legal: {center}")
        stats["exact_enclosing_circles_strict_on_old_non_O_roles"] += 1
        candidates = boundary_candidates(center, slopes)
        stats["boundary_slope_values_tested"] += len(slopes)
        stats["strict_convex_single_insertions"] += len(candidates)
        for first, second in combinations(candidates, 2):
            stats["unordered_boundary_pairs"] += 1
            points = dict(POINTS)
            points.update({"m1": first.point, "m2": second.point})
            triple = ("m1", "m2", "O")
            if any(value < 0 for value in non_obtuse(points, triple)):
                continue
            stats["non_obtuse_boundary_pairs"] += 1
            for order in pair_orders(first, second):
                try:
                    strict_convexity_report(points, order)
                except ValueError:
                    continue
                stats["strict_convex_pair_insertions"] += 1
                certificate, reached = packet_search(points, order, center, triple)
                stats["source_packet_candidates"] += reached
                if certificate is not None:
                    return certificate, stats
    return None, stats


@lru_cache(maxsize=1)
def build_report() -> dict[str, Any]:
    # Independent positive control for everything inherited from the old row.
    old_row = exact_row_checks(POINTS)
    old_minimum, old_checks = strict_convexity_report(POINTS, ORDER)
    slopes = slope_grid()
    one_witness, one_stats = search_one_added_role(slopes)
    if one_witness is not None:
        return one_witness
    two_witness, two_stats = search_two_added_roles(slopes)
    if two_witness is not None:
        return two_witness

    return {
        "schema": SCHEMA,
        "status": STATUS,
        "evidence_label": EVIDENCE_LABEL,
        "arithmetic": "fractions.Fraction only; no floating-point acceptance",
        "solver_invoked": False,
        "witness": None,
        "fixed_input": {
            "points": {role: point_json(POINTS[role]) for role in ORDER},
            "cyclic_order": list(ORDER),
            "source_module": (
                "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-"
                "20260831/solver/rigid221_s0_coupled_two_row.py"
            ),
        },
        "smallest_hypothesis_changed": {
            "change": (
                "add one or two all-distinct Moser-only carrier roles while preserving "
                "all twelve old rational coordinates, the old cyclic order as a subsequence, "
                "and every old row/support designation"
            ),
            "old_coordinate_changes": 0,
            "maximum_new_roles": 2,
        },
        "preserved_positive_control": {
            "row_core": old_row,
            "old_strict_convexity": {
                "orientation_checks": old_checks,
                "minimum_orientation": fraction_json(old_minimum),
            },
        },
        "exact_search_bounds": {
            "boundary_parameterization": (
                "For rational center c and slope t, p=(x,t*x), "
                "x=2*(c_x+t*c_y)/(1+t^2), so |p-c|^2=|c|^2 exactly."
            ),
            "slope_grid": {
                "definition": "all distinct reduced n/d represented by |n|<=60 and 1<=d<=12",
                "numerator_bound": SLOPE_NUMERATOR_BOUND,
                "denominator_bound": SLOPE_DENOMINATOR_BOUND,
                "distinct_values": len(slopes),
                "minimum": fraction_json(slopes[0]),
                "maximum": fraction_json(slopes[-1]),
            },
            "one_added_role_centers": {
                "definition": (
                    "for each old e!=O, c=e/2+s*(-e_y,e_x), s=k/2, |k|<=30; "
                    "this is the full declared grid of circles through O and e"
                ),
                "half_step_numerator_bound": ONE_ROLE_HALF_STEP_BOUND,
            },
            "two_added_role_centers": [point_json(center) for center in TWO_ROLE_CENTERS],
        },
        "search_counts": {
            "one_added_role": one_stats,
            "two_added_roles": two_stats,
        },
        "strongest_discovered_scoped_obstruction": {
            "scope": "the exact finite grid above with all old coordinates fixed",
            "first_failed_source_field": (
                "the three nonnegative angle-dot-product fields of the genuine "
                "three-point MEC boundary (before CapTriple, surplus, rotation, or S0)"
            ),
            "one_role_non_obtuse_survivors": one_stats["non_obtuse_boundary_triples"],
            "two_role_non_obtuse_survivors": two_stats["non_obtuse_boundary_pairs"],
            "interpretation": (
                "The grid contains exact circles through O and exact strict-convex boundary "
                "insertions, but no enumerated insertion set forms a non-obtuse boundary "
                "triple containing O. Therefore no enumerated candidate reaches the cap tests."
            ),
        },
        "source_contract_not_reached": {
            "closed_OnArcOpposite_CapTriple": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
            "selected_surplus_cap_cardinality_gt_four": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
            "oppIndex2_and_oppApex2_mapping": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
            "rotated_circumscribed_packet": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
            "endpoint_erased_strict_interior_J": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
            "actual_S0_I_or_S0_N": "NOT_REACHED_NON_OBTUSE_BOUNDARY_FAILED",
        },
        "open_boundary": {
            "unrestricted_addition_only_family": "OPEN",
            "variable_old_coordinates": "ENCODING_BLOCKED",
            "exact_real_algebraic_coordinates_outside_the_rational_grid": "ENCODING_BLOCKED",
            "universal_unsat_claim": False,
            "reason": (
                "Finite rational-grid exhaustion does not cover other rational centers/slopes, "
                "real-algebraic boundary points, or deformations of the old row coordinates."
            ),
        },
        "source_anchors": SOURCE_ANCHORS,
        "claim_scope": {
            "finite_bounded_grid_exhausted": True,
            "unrestricted_family_decided": False,
            "l1_s0_i_decided": False,
            "l1_s0_n_decided": False,
            "source_universal_claim": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "replay": {
            "command": (
                "uv run python docs/computation/rigid221-s0-coupled-two-row-"
                "residue-lantern-20260831/solver/rigid221_s0_true_cap_search.py"
            ),
            "deterministic_json": True,
        },
    }


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--report-output", type=Path)
    args = parser.parse_args()
    report = build_report()
    if args.output is not None:
        write_json(args.output, report)
    if args.report_output is not None:
        write_json(args.report_output, report)
    if args.output is None and args.report_output is None:
        print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
