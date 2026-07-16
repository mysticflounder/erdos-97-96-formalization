"""Numerical discovery for a total-CSS completion of the 29-point model.

The exact total-CSS audit leaves only sources ``J`` and ``t1`` uncovered.
For each source, add three rational-rotation copies about a distinct center
which currently has no K4.  Source plus copies then form a candidate exact
four-shell at that center.  This script searches only for strict-convex/MEC-
disk-compatible parameters; a separate symbolic checker must certify the
result and re-enumerate all deletion-critical shells.
"""

from __future__ import annotations

from dataclasses import dataclass
import importlib.util
from pathlib import Path

import numpy as np
from scipy.spatial import ConvexHull


HERE = Path(__file__).resolve().parent
MODEL_PATH = HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"


def load_model():
    spec = importlib.util.spec_from_file_location("atail_29_model", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


R = load_model()
POINTS = R.build_points()
BASE_ORDER = R.HULL_ORDER
SOURCES = ("J", "t1")


def as_float(point) -> np.ndarray:
    return np.asarray([float(point[0]), float(point[1])], dtype=float)


def rotate(point: np.ndarray, center: np.ndarray, t: float) -> np.ndarray:
    denominator = 1.0 + t * t
    cosine = (1.0 - t * t) / denominator
    sine = 2.0 * t / denominator
    vector = point - center
    return center + np.asarray(
        [
            cosine * vector[0] - sine * vector[1],
            sine * vector[0] + cosine * vector[1],
        ]
    )


def all_strict_hull(points: list[np.ndarray]) -> bool:
    array = np.asarray(points)
    hull = ConvexHull(array)
    if len(hull.vertices) != len(points):
        return False
    order = list(hull.vertices)
    turns = []
    for index, current in enumerate(order):
        first = array[current]
        second = array[order[(index + 1) % len(order)]]
        third = array[order[(index + 2) % len(order)]]
        edge_1 = second - first
        edge_2 = third - second
        turns.append(edge_1[0] * edge_2[1] - edge_1[1] * edge_2[0])
    return min(map(abs, turns)) > 1e-12 and (
        all(x > 0 for x in turns) or all(x < 0 for x in turns)
    )


@dataclass(frozen=True)
class Candidate:
    source: str
    center: str
    denominator: int
    numerators: tuple[int, int, int]
    points: tuple[tuple[float, float], ...]


def candidate_rows(source: str, centers_without_k4: list[str]) -> list[Candidate]:
    base = [as_float(POINTS[name]) for name in BASE_ORDER]
    source_point = as_float(POINTS[source])
    mec_center = np.asarray([0.5, np.sqrt(3.0) / 6.0])
    mec_radius_squared = 1.0 / 3.0
    layouts = (
        (1, 2, 3),
        (-1, -2, -3),
        (1, 3, 5),
        (-1, -3, -5),
    )
    answers: list[Candidate] = []
    for center in centers_without_k4:
        if center == source:
            continue
        center_point = as_float(POINTS[center])
        for denominator in (
            1_000_000,
            500_000,
            200_000,
            100_000,
            50_000,
            20_000,
            10_000,
            5_000,
            2_000,
            1_000,
            500,
            250,
        ):
            for numerators in layouts:
                added = tuple(
                    rotate(source_point, center_point, numerator / denominator)
                    for numerator in numerators
                )
                if any(
                    np.dot(point - mec_center, point - mec_center)
                    >= mec_radius_squared - 1e-13
                    for point in added
                ):
                    continue
                if all_strict_hull(base + list(added)):
                    answers.append(
                        Candidate(
                            source,
                            center,
                            denominator,
                            numerators,
                            tuple(tuple(float(x) for x in point) for point in added),
                        )
                    )
    return answers


def main() -> None:
    points = R.build_points()
    profiles = {
        center: R.G.radius_profile(points, center) for center in sorted(points)
    }
    centers_without_k4 = sorted(
        center
        for center, profile in profiles.items()
        if max(map(len, profile.values()), default=0) < 4
    )
    rows = {
        source: candidate_rows(source, centers_without_k4) for source in SOURCES
    }
    print({source: len(candidates) for source, candidates in rows.items()})

    base = [as_float(POINTS[name]) for name in BASE_ORDER]
    for first in rows["J"]:
        first_points = [np.asarray(point) for point in first.points]
        for second in rows["t1"]:
            if first.center == second.center:
                continue
            second_points = [np.asarray(point) for point in second.points]
            if not all_strict_hull(base + first_points + second_points):
                continue
            chosen = (first, second)
            labels = BASE_ORDER + [
                f"{candidate.source}_css_{index}"
                for candidate in chosen
                for index in range(1, 4)
            ]
            hull = ConvexHull(np.asarray(base + first_points + second_points))
            for candidate in chosen:
                print(
                    candidate.source,
                    candidate.center,
                    candidate.denominator,
                    candidate.numerators,
                )
            print("hull_order=", [labels[index] for index in hull.vertices])
            return
    raise SystemExit("no combined strict-convex completion found")


if __name__ == "__main__":
    main()
