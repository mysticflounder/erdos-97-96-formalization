#!/usr/bin/env python3
"""Deformable-coordinate probe for the period-three all-reverse full-row leaf.

This is a theorem-discovery regression, not a decision procedure.  All metric
equalities are imposed by parameterization; the random search concerns only
the remaining strict inequalities.  A no-hit run is therefore UNKNOWN.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from dataclasses import dataclass

import numpy as np
from scipy.spatial import ConvexHull, QhullError


Point = np.ndarray


def point_on_unit_circle(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)])


def cross(a: Point, b: Point, c: Point) -> float:
    u = b - a
    v = c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    d = a - b
    return float(d @ d)


def hull_vertex_count(points: list[Point]) -> int:
    try:
        return len(ConvexHull(np.array(points)).vertices)
    except QhullError:
        return 0


def strict_hull_margin(points: list[Point]) -> float:
    """Minimum other-point left margin over CCW hull edges, or -inf."""
    try:
        hull = ConvexHull(np.array(points))
    except QhullError:
        return -math.inf
    if len(hull.vertices) != len(points):
        return -math.inf
    margin = math.inf
    order = list(hull.vertices)
    for k, i in enumerate(order):
        j = order[(k + 1) % len(order)]
        for ell in range(len(points)):
            if ell not in (i, j):
                margin = min(margin, cross(points[i], points[j], points[ell]))
    return margin


@dataclass
class Core:
    apex_angle: float
    source_angles: np.ndarray
    blocker_radii: np.ndarray
    o: Point
    left: Point
    right: Point
    sources: list[Point]
    blockers: list[Point]
    row_radii: list[float]
    mec_center: Point
    mec_radius_sq: float

    @property
    def points(self) -> list[Point]:
        return [self.o, self.left, self.right, *self.sources, *self.blockers]


ROW_SOURCE_PAIRS = ((0, 1), (1, 2), (2, 0))


def make_core(rng: np.random.Generator) -> Core | None:
    # Rotation and scale are fixed by o=(0,0), left=(1,0).  Nonobtuseness at
    # o gives apex_angle <= pi/2.  The separated intervals are sampling aids,
    # not a coverage claim.
    apex_angle = float(rng.uniform(1.20, math.pi / 2 - 0.002))
    q0 = float(rng.uniform(0.02, min(0.25, apex_angle - 0.50)))
    q1 = float(rng.uniform(0.38, min(0.90, apex_angle - 0.25)))
    q2 = float(rng.uniform(max(1.00, q1 + 0.15), apex_angle - 0.02))
    source_angles = np.array([q0, q1, q2])
    if not (q0 + 0.15 < q1 < q2 - 0.15):
        return None

    o = np.zeros(2)
    left = point_on_unit_circle(0.0)
    right = point_on_unit_circle(apex_angle)
    sources = [point_on_unit_circle(theta) for theta in source_angles]

    mec_center = (
        point_on_unit_circle(apex_angle / 2)
        / (2 * math.cos(apex_angle / 2))
    )
    mec_radius_sq = sqdist(mec_center, o)

    blockers: list[Point] = []
    row_radii: list[float] = []
    blocker_radii: list[float] = []
    for i, j in ROW_SOURCE_PAIRS:
        midpoint_angle = (source_angles[i] + source_angles[j]) / 2
        ray = point_on_unit_circle(midpoint_angle)
        # The first bound is the left/right chord: above it is the strict
        # physical cap.  The second is the circumdisk boundary on this ray.
        cap_floor = math.cos(apex_angle / 2) / math.cos(
            midpoint_angle - apex_angle / 2
        )
        disk_ceiling = 2 * float(mec_center @ ray)
        if cap_floor + 0.002 >= disk_ceiling - 0.002:
            return None
        radial = float(
            rng.uniform(cap_floor + 0.002, min(disk_ceiling - 0.002, cap_floor + 0.35))
        )
        blocker = radial * ray
        blockers.append(blocker)
        blocker_radii.append(radial)
        row_radii.append(math.sqrt(sqdist(blocker, sources[i])))

    return Core(
        apex_angle,
        source_angles,
        np.array(blocker_radii),
        o,
        left,
        right,
        sources,
        blockers,
        row_radii,
        mec_center,
        mec_radius_sq,
    )


def cap_side(core: Core, p: Point) -> float:
    # Positive is the side containing the physical apex; the physical cap is
    # the negative side.
    return cross(core.left, core.right, p)


def candidate_targets(core: Core, row: int, angle_count: int) -> list[Point]:
    center = core.blockers[row]
    radius = core.row_radii[row]
    result: list[Point] = []
    for k in range(angle_count):
        theta = 2 * math.pi * (k + 0.5) / angle_count
        target = center + radius * point_on_unit_circle(theta)
        if cap_side(core, target) <= 1e-6:
            continue
        if sqdist(core.mec_center, target) > core.mec_radius_sq + 1e-10:
            continue
        if hull_vertex_count([*core.points, target]) != len(core.points) + 1:
            continue
        result.append(target)
    return result


def exact_support_margins(core: Core, targets: list[Point]) -> tuple[float, float]:
    all_points = [*core.points, *targets]
    first_class_nonmembers = [*core.blockers, *targets]
    first_margin = min(abs(sqdist(core.o, p) - 1.0) for p in first_class_nonmembers)

    row_margin = math.inf
    for row, (i, j) in enumerate(ROW_SOURCE_PAIRS):
        center = core.blockers[row]
        radius_sq = core.row_radii[row] ** 2
        support_ids = {
            id(core.sources[i]),
            id(core.sources[j]),
            id(targets[2 * row]),
            id(targets[2 * row + 1]),
        }
        for p in all_points:
            if id(p) not in support_ids:
                row_margin = min(row_margin, abs(sqdist(center, p) - radius_sq))
    return first_margin, row_margin


def verify_full(core: Core, targets: list[Point]) -> dict[str, float] | None:
    if len(targets) != 6:
        return None
    points = [*core.points, *targets]
    hull_margin = strict_hull_margin(points)
    if hull_margin <= 1e-8:
        return None
    if min(cap_side(core, p) for p in targets) <= 1e-8:
        return None
    if max(cap_side(core, p) for p in [*core.sources, *core.blockers]) >= -1e-8:
        return None
    disk_margin = min(
        core.mec_radius_sq - sqdist(core.mec_center, p) for p in points
    )
    if disk_margin < -1e-10:
        return None
    distinct_sq = min(
        sqdist(points[i], points[j])
        for i in range(len(points))
        for j in range(i)
    )
    if distinct_sq <= 1e-10:
        return None
    first_margin, row_margin = exact_support_margins(core, targets)
    if first_margin <= 1e-8 or row_margin <= 1e-8:
        return None
    # Equalities are parameterized, but substitute them again for the witness
    # gate.  Each row has exactly its two named cap sources and two targets.
    equality_error = 0.0
    for row, (i, j) in enumerate(ROW_SOURCE_PAIRS):
        c = core.blockers[row]
        values = [
            sqdist(c, core.sources[i]),
            sqdist(c, core.sources[j]),
            sqdist(c, targets[2 * row]),
            sqdist(c, targets[2 * row + 1]),
        ]
        equality_error = max(equality_error, max(values) - min(values))
    if equality_error > 1e-10:
        return None
    return {
        "strict_hull_margin": hull_margin,
        "disk_margin": disk_margin,
        "distinct_sq_margin": distinct_sq,
        "first_class_exclusion_margin": first_margin,
        "row_exclusion_margin": row_margin,
        "equality_error": equality_error,
    }


def try_full_candidate(
    core: Core,
    candidates: list[list[Point]],
    rng: np.random.Generator,
    attempts: int,
) -> tuple[list[Point], dict[str, float]] | None:
    if any(len(row) < 2 for row in candidates):
        return None
    for _ in range(attempts):
        targets: list[Point] = []
        for row in candidates:
            indices = rng.choice(len(row), size=2, replace=False)
            targets.extend([row[int(indices[0])], row[int(indices[1])]])
        margins = verify_full(core, targets)
        if margins is not None:
            return targets, margins
    return None


def self_test() -> None:
    square = [
        np.array([0.0, 0.0]),
        np.array([1.0, 0.0]),
        np.array([1.0, 1.0]),
        np.array([0.0, 1.0]),
    ]
    assert hull_vertex_count(square) == 4
    assert strict_hull_margin(square) > 0
    assert hull_vertex_count([*square, np.array([0.5, 0.5])]) == 4


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cores", type=int, default=30_000)
    parser.add_argument("--angles", type=int, default=720)
    parser.add_argument("--pair-attempts", type=int, default=2_000)
    parser.add_argument("--seed", type=int, default=20_260_717)
    args = parser.parse_args()
    self_test()
    rng = np.random.default_rng(args.seed)

    accepted_cores = 0
    best_min_single = -1
    best_counts = [0, 0, 0]
    for sample in range(args.cores):
        core = make_core(rng)
        if core is None or hull_vertex_count(core.points) != len(core.points):
            continue
        accepted_cores += 1
        candidates = [candidate_targets(core, row, args.angles) for row in range(3)]
        counts = [len(row) for row in candidates]
        score = min(counts)
        if score > best_min_single:
            best_min_single = score
            best_counts = counts
        hit = try_full_candidate(core, candidates, rng, args.pair_attempts)
        if hit is not None:
            targets, margins = hit
            payload = {
                "status": "SAT_CANDIDATE_NUMERIC_VERIFIED",
                "sample": sample,
                "apex_angle": core.apex_angle,
                "source_angles": core.source_angles.tolist(),
                "blocker_radii": core.blocker_radii.tolist(),
                "targets": [p.tolist() for p in targets],
                "margins": margins,
            }
            print(json.dumps(payload, indent=2, sort_keys=True))
            return

    print(
        json.dumps(
            {
                "status": "UNKNOWN_NO_HIT",
                "seed": args.seed,
                "sampled_cores": args.cores,
                "strict_convex_cores": accepted_cores,
                "angles_per_row": args.angles,
                "best_min_single_target_extensions": best_min_single,
                "best_single_target_counts_by_row": best_counts,
                "coverage_complete": False,
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
