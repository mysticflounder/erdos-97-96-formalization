"""Numerical discovery search for a strict-convex robust local extension.

Starting from the exact 14-point robust cap-local model, add three rational-
rotation copies of a hull vertex around each blocker-shell support center that
lacks K4.  The rotations make an exact four-point distance class at that
center.  This script only searches for parameters whose complete union stays
in strict convex position; exact certification is performed separately.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import importlib.util
from pathlib import Path

import numpy as np
from scipy.spatial import ConvexHull


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "cap-local-transport-model" / "check.py"


def load_base():
    spec = importlib.util.spec_from_file_location(
        "atail_cap_local_transport_model", BASE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


B = load_base()
POINTS = B.build_points()
ORDER = ["O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K"]
REQUIRED_CENTERS = ("F", "I", "X", "Y", "Z")


def as_float(point) -> np.ndarray:
    return np.asarray([float(point[0]), float(point[1])], dtype=float)


def rotate(point: np.ndarray, center: np.ndarray, t: float) -> np.ndarray:
    denominator = 1.0 + t * t
    cosine = (1.0 - t * t) / denominator
    sine = 2.0 * t / denominator
    vector = point - center
    return center + np.asarray(
        [cosine * vector[0] - sine * vector[1],
         sine * vector[0] + cosine * vector[1]]
    )


def all_strict_hull(points: list[np.ndarray]) -> bool:
    array = np.asarray(points)
    hull = ConvexHull(array)
    if len(hull.vertices) != len(points):
        return False
    order = list(hull.vertices)
    signs = []
    for index, current in enumerate(order):
        first = array[current]
        second = array[order[(index + 1) % len(order)]]
        third = array[order[(index + 2) % len(order)]]
        first_edge = second - first
        second_edge = third - second
        signs.append(
            first_edge[0] * second_edge[1] - first_edge[1] * second_edge[0]
        )
    return min(map(abs, signs)) > 1e-10 and (all(x > 0 for x in signs) or all(x < 0 for x in signs))


@dataclass(frozen=True)
class Candidate:
    center: str
    host: str
    denominator: int
    numerators: tuple[int, int, int]
    points: tuple[tuple[float, float], ...]


def candidates_for(center: str, require_mec_disk: bool) -> list[Candidate]:
    base_points = [as_float(POINTS[name]) for name in ORDER]
    center_point = as_float(POINTS[center])
    candidates: list[Candidate] = []
    layouts = (
        (1, 2, 3),
        (-1, -2, -3),
        (-2, -1, 1),
        (-1, 1, 2),
    )
    for host in ORDER:
        if host == center:
            continue
        host_point = as_float(POINTS[host])
        for denominator in (4000, 2000, 1000, 500, 250, 125, 80, 50, 30):
            for numerators in layouts:
                added = tuple(
                    rotate(host_point, center_point, numerator / denominator)
                    for numerator in numerators
                )
                if require_mec_disk:
                    mec_center = np.asarray([0.5, np.sqrt(3.0) / 6.0])
                    mec_radius_squared = 1.0 / 3.0
                    if any(
                        np.dot(point - mec_center, point - mec_center)
                        > mec_radius_squared + 1e-12
                        for point in added
                    ):
                        continue
                if all_strict_hull(base_points + list(added)):
                    candidates.append(
                        Candidate(
                            center,
                            host,
                            denominator,
                            numerators,
                            tuple(tuple(float(x) for x in point) for point in added),
                        )
                    )
    return candidates


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--require-mec-disk", action="store_true")
    args = parser.parse_args()
    candidate_map = {
        center: candidates_for(center, args.require_mec_disk)
        for center in REQUIRED_CENTERS
    }
    print({center: len(rows) for center, rows in candidate_map.items()}, flush=True)
    base_points = [as_float(POINTS[name]) for name in ORDER]
    reduced = candidate_map
    nodes = 0
    node_cap = 500_000

    def search(
        index: int,
        added: list[np.ndarray],
        chosen: list[Candidate],
    ) -> list[Candidate] | None:
        nonlocal nodes
        if index == len(REQUIRED_CENTERS):
            return chosen
        center = REQUIRED_CENTERS[index]
        for candidate in reduced[center]:
            nodes += 1
            if nodes > node_cap:
                return None
            candidate_points = [np.asarray(point) for point in candidate.points]
            if not all_strict_hull(base_points + added + candidate_points):
                continue
            answer = search(
                index + 1,
                added + candidate_points,
                chosen + [candidate],
            )
            if answer is not None:
                return answer
        return None

    answer = search(0, [], [])
    if answer is not None:
        added = [np.asarray(point) for candidate in answer for point in candidate.points]
        labels = ORDER + [
            f"{candidate.center}_k4_{index}"
            for candidate in answer
            for index in range(1, 4)
        ]
        hull = ConvexHull(np.asarray(base_points + added))
        for candidate in answer:
            print(
                candidate.center,
                candidate.host,
                candidate.denominator,
                candidate.numerators,
            )
        print(f"nodes={nodes}")
        print("hull_order=", [labels[index] for index in hull.vertices])
        return
    raise SystemExit(
        f"no combined strict-convex extension found in search budget; nodes={nodes}"
    )


if __name__ == "__main__":
    main()
