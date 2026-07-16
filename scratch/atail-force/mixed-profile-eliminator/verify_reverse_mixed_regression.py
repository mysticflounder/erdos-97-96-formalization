#!/usr/bin/env python3
"""Exact Q(sqrt(3)) regression for the surviving reverse-mixed profile.

This checker combines two deliberately separated layers:

1. exact Euclidean metric and strict-hull facts for the five named points;
2. an exact finite incidence shadow of the blocker outcome disjunctions used
   by ``MixedProfileEliminator.lean``.

It is not a ``CounterexampleData`` model, does not construct fourth support
members, and makes no global-K4/MEC/cap claim.  Its role is to prevent a local
metric or blocker-disjunction contradiction from being asserted where the
displayed data are satisfiable.
"""

from __future__ import annotations

from dataclasses import dataclass
from fractions import Fraction as F
from hashlib import sha256
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
PINNED = {
    "scratch/atail-force/joint-profile-geometry/verify_joint_profiles.py":
        "758c3b39e0ee303e94ce8cfa87eec8fb8df57e4b9e208a6f1d1c4e8e00cf18a2",
    "scratch/atail-force/joint-profile-elimination/JointProfilePacketAdapter.lean":
        "3959a0b7a0e9c8712b93cc46ad5066643c1c65be98c1b95ca5b1e3af681d5b21",
    "scratch/atail-force/joint-transition-core/JointTransitionCore.lean":
        "26a9e0b3afc206cf972ae835e1774f404d72e6bad3b8c93d1a19e8ec6e850f9f",
}


@dataclass(frozen=True, order=True)
class QS3:
    rat: F = F(0)
    root: F = F(0)

    def __add__(self, other: "QS3") -> "QS3":
        return QS3(self.rat + other.rat, self.root + other.root)

    def __neg__(self) -> "QS3":
        return QS3(-self.rat, -self.root)

    def __sub__(self, other: "QS3") -> "QS3":
        return self + (-other)

    def __mul__(self, other: "QS3") -> "QS3":
        return QS3(
            self.rat * other.rat + 3 * self.root * other.root,
            self.rat * other.root + self.root * other.rat,
        )

    def sign(self) -> int:
        """Exact sign of ``rat + root * sqrt(3)``."""
        a, b = self.rat, self.root
        if b == 0:
            return (a > 0) - (a < 0)
        if b > 0:
            if a >= 0:
                return 1
            return 1 if 3 * b * b > a * a else -1
        if a <= 0:
            return -1
        return 1 if a * a > 3 * b * b else -1

    def serial(self) -> str:
        return f"{self.rat}+({self.root})*sqrt(3)"


Point = tuple[QS3, QS3]


def q(value: int | F) -> QS3:
    return QS3(F(value), F(0))


def sqdist(left: Point, right: Point) -> QS3:
    dx, dy = left[0] - right[0], left[1] - right[1]
    return dx * dx + dy * dy


def orient(left: Point, right: Point, other: Point) -> QS3:
    return ((right[0] - left[0]) * (other[1] - left[1])
            - (right[1] - left[1]) * (other[0] - left[0]))


def check_pins() -> None:
    for relative, expected in PINNED.items():
        actual = sha256((ROOT / relative).read_bytes()).hexdigest()
        assert actual == expected, (relative, expected, actual)


def main() -> None:
    check_pins()

    half = q(F(1, 2))
    sqrt3_half = QS3(F(0), F(1, 2))
    points: dict[str, Point] = {
        "x": (q(0), q(0)),
        "y": (q(1), q(0)),
        "a": (half, sqrt3_half),
        # Adapter convention: b=v is the row(y) member with profile {x,a}.
        "v": (q(1) - sqrt3_half, half),
        # Adapter convention: c=u is the row(x) member with profile {y,a}.
        "u": (sqrt3_half, half),
    }

    one = q(1)
    small = q(2) - QS3(F(0), F(1))

    # Old equilateral rows and the reverse-mixed generated profiles.
    assert sqdist(points["x"], points["y"]) == one
    assert sqdist(points["x"], points["a"]) == one
    assert sqdist(points["x"], points["u"]) == one
    assert sqdist(points["x"], points["v"]) != one
    assert sqdist(points["y"], points["x"]) == one
    assert sqdist(points["y"], points["a"]) == one
    assert sqdist(points["y"], points["v"]) == one
    assert sqdist(points["y"], points["u"]) != one
    assert sqdist(points["u"], points["y"]) == small
    assert sqdist(points["u"], points["a"]) == small
    assert sqdist(points["u"], points["x"]) != small
    assert sqdist(points["v"], points["x"]) == small
    assert sqdist(points["v"], points["a"]) == small
    assert sqdist(points["v"], points["y"]) != small

    # Every point is a strict hull vertex in the adapter's surviving order.
    hull = ("x", "y", "u", "a", "v")
    edge_signs: list[int] = []
    for index, left_name in enumerate(hull):
        right_name = hull[(index + 1) % len(hull)]
        signs = {
            orient(points[left_name], points[right_name], points[name]).sign()
            for name in hull
            if name not in (left_name, right_name)
        }
        assert signs == {1}
        edge_signs.append(1)

    # Among the five named carrier points, each mixed common pair has exactly
    # the two already-known bisector centers and no third one.
    ya_centers = sorted(
        name for name, point in points.items()
        if sqdist(point, points["y"]) == sqdist(point, points["a"])
    )
    xa_centers = sorted(
        name for name, point in points.items()
        if sqdist(point, points["x"]) == sqdist(point, points["a"])
    )
    assert ya_centers == ["u", "x"]
    assert xa_centers == ["v", "y"]

    # Partial selected-support facts used by the live reverse-mixed packet.
    support_hits = {
        "x": {"y", "a", "u"},
        "y": {"x", "a", "v"},
        "u": {"y", "a"},
        "v": {"x", "a"},
    }
    support_omits = {
        "x": {"x", "v"},
        "y": {"y", "u"},
        "u": {"u", "x"},
        "v": {"v", "y"},
    }
    for center in support_hits:
        assert support_hits[center].isdisjoint(support_omits[center])

    # One exact finite shadow of the retained endpoint outcomes.  The shell
    # sourced at y uses center x, the shell sourced at x uses center y, and
    # the shell sourced at a uses center x.  At source a, deletion of x
    # survives because x is omitted from the x-centered shell, while deletion
    # of y does not.  This satisfies all four endpoint disjunctions.
    blocker = {"y": "x", "x": "y", "a": "x"}

    def survives(source: str, deleted: str) -> bool:
        return deleted in support_omits[blocker[source]]

    def endpoint_outcome(
        source: str, deleted: str, generated: str, old: str
    ) -> bool:
        return survives(source, deleted) or blocker[source] in {generated, old}

    assert endpoint_outcome("y", "a", "u", "x")
    assert endpoint_outcome("a", "y", "u", "x")
    assert endpoint_outcome("x", "a", "v", "y")
    assert endpoint_outcome("a", "x", "v", "y")
    assert survives("a", "x")
    assert not survives("a", "y")

    result = {
        "rigor": "exact Q(sqrt(3)) metric plus exact finite incidence shadow",
        "scope": "not CounterexampleData; no global K4, MEC, cap, or full CSS model",
        "strict_hull_order": list(hull),
        "edge_signs": edge_signs,
        "squared_radii": {"old": one.serial(), "generated": small.serial()},
        "named_pair_bisector_centers": {
            "{y,a}": ya_centers,
            "{x,a}": xa_centers,
        },
        "blocker_shadow": blocker,
        "apex_cross_survival": {"delete_x": True, "delete_y": False},
        "pins": PINNED,
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
