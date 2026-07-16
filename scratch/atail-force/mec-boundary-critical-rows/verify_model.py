"""Exact Q(sqrt(3)) checks for the MEC-boundary-row countermodels.

There are two related carriers:

* ``nine`` has a full CriticalShellSystem, but cap profile (4,4,4);
* ``two_large`` has cap profile (5,5,4), but its two added points have no
  critical shell.  It retains the exact three source-critical boundary rows.

Both deliberately fail global all-center K4 away from the three Moser points.
No floating-point arithmetic is used.
"""

from __future__ import annotations

from dataclasses import dataclass
from fractions import Fraction as F
from itertools import permutations


@dataclass(frozen=True)
class Q3:
    """The exact number a + b*sqrt(3)."""

    a: F = F(0)
    b: F = F(0)

    def __add__(self, other: Q3 | int | F) -> Q3:
        other = lift(other)
        return Q3(self.a + other.a, self.b + other.b)

    __radd__ = __add__

    def __neg__(self) -> Q3:
        return Q3(-self.a, -self.b)

    def __sub__(self, other: Q3 | int | F) -> Q3:
        return self + (-lift(other))

    def __rsub__(self, other: Q3 | int | F) -> Q3:
        return lift(other) - self

    def __mul__(self, other: Q3 | int | F) -> Q3:
        other = lift(other)
        return Q3(
            self.a * other.a + 3 * self.b * other.b,
            self.a * other.b + self.b * other.a,
        )

    __rmul__ = __mul__

    def __truediv__(self, other: int | F) -> Q3:
        other = F(other)
        return Q3(self.a / other, self.b / other)

    def __str__(self) -> str:
        return f"({self.a})+({self.b})sqrt(3)"


def lift(x: Q3 | int | F) -> Q3:
    return x if isinstance(x, Q3) else Q3(F(x), F(0))


def sign(x: Q3) -> int:
    """Exact sign, using one rational comparison after squaring if needed."""
    a, b = x.a, x.b
    if b == 0:
        return (a > 0) - (a < 0)
    if a == 0:
        return (b > 0) - (b < 0)
    if a > 0 and b > 0:
        return 1
    if a < 0 and b < 0:
        return -1
    if a > 0:  # b < 0
        return (a * a > 3 * b * b) - (a * a < 3 * b * b)
    return (3 * b * b > a * a) - (3 * b * b < a * a)


Point = tuple[Q3, Q3]
S3 = Q3(F(0), F(1))
ZERO: Point = (Q3(), Q3())


def sub(p: Point, q: Point) -> Point:
    return (p[0] - q[0], p[1] - q[1])


def dot(p: Point, q: Point) -> Q3:
    return p[0] * q[0] + p[1] * q[1]


def norm2(p: Point) -> Q3:
    return dot(p, p)


def dist2(p: Point, q: Point) -> Q3:
    return norm2(sub(p, q))


def cross(a: Point, b: Point, c: Point) -> Q3:
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def rotate120(p: Point) -> Point:
    x, y = p
    return (-x / 2 - S3 * y / 2, S3 * x / 2 - y / 2)


A: Point = (Q3(F(1)), Q3())
B: Point = (Q3(F(-1, 2)), Q3(F(0), F(1, 2)))
C: Point = (Q3(F(-1, 2)), Q3(F(0), F(-1, 2)))

# Two points on the circle centered at C of squared radius 3 through A,B.
xAB: Point = (Q3(F(-1, 2), F(4, 5)), Q3(F(0), F(1, 10)))
yAB: Point = (Q3(F(-1, 2), F(7, 25)), Q3(F(0), F(23, 50)))

# An off-shell point between xAB and yAB, used only to create a large cap.
wAB: Point = (Q3(F(2, 5)), Q3(F(0), F(2, 5)))

xBC, xCA = rotate120(xAB), rotate120(rotate120(xAB))
yBC, yCA = rotate120(yAB), rotate120(rotate120(yAB))
wBC = rotate120(wAB)

POINTS: dict[str, Point] = {
    "A": A,
    "xAB": xAB,
    "wAB": wAB,
    "yAB": yAB,
    "B": B,
    "xBC": xBC,
    "wBC": wBC,
    "yBC": yBC,
    "C": C,
    "xCA": xCA,
    "yCA": yCA,
}

ORDER_NINE = ["A", "xAB", "yAB", "B", "xBC", "yBC", "C", "xCA", "yCA"]
ORDER_TWO_LARGE = [
    "A", "xAB", "wAB", "yAB",
    "B", "xBC", "wBC", "yBC",
    "C", "xCA", "yCA",
]

# source -> (blocker center, exact full radius class)
ROWS = {
    "A": ("C", {"A", "B", "xAB", "yAB"}),
    "B": ("A", {"B", "C", "xBC", "yBC"}),
    "C": ("B", {"C", "A", "xCA", "yCA"}),
}


def distance_classes(center: str, names: list[str]) -> dict[Q3, set[str]]:
    ans: dict[Q3, set[str]] = {}
    for name in names:
        if name == center:
            continue
        ans.setdefault(dist2(POINTS[center], POINTS[name]), set()).add(name)
    return ans


def audit(order: list[str], profile: tuple[int, int, int], full_css: bool) -> None:
    assert len(set(order)) == len(order)

    # The displayed order is a strict counterclockwise convex polygon.
    turns = [
        cross(POINTS[order[i - 1]], POINTS[order[i]], POINTS[order[(i + 1) % len(order)]])
        for i in range(len(order))
    ]
    assert all(sign(t) > 0 for t in turns)

    # Unit MEC disk; exactly the equilateral Moser triangle is on its boundary.
    disk = {name: norm2(POINTS[name]) for name in order}
    assert all(sign(Q3(F(1)) - value) >= 0 for value in disk.values())
    assert {name for name, value in disk.items() if value == Q3(F(1))} == {"A", "B", "C"}
    for q, r, s in [("A", "B", "C"), ("B", "C", "A"), ("C", "A", "B")]:
        assert sign(dot(sub(POINTS[r], POINTS[q]), sub(POINTS[s], POINTS[q]))) > 0

    assert profile == (
        order.index("B") - order.index("A") + 1,
        order.index("C") - order.index("B") + 1,
        len(order) - order.index("C") + 1,
    )

    # The three exact radius-3 rows are genuinely source-critical.
    for source, (center, support) in ROWS.items():
        classes = distance_classes(center, order)
        assert classes[Q3(F(3))] == support
        assert source in support and center not in support
        after_delete = distance_classes(center, [x for x in order if x != source])
        assert max(map(len, after_delete.values())) <= 3

        # Sharp MEC power signs and failure of strict straddling.
        power_signs = []
        side_signs = []
        for z in support:
            power = dot(POINTS[center], sub(POINTS[z], POINTS[source]))
            assert sign(power) <= 0
            power_signs.append(sign(power))
            if z != source:
                side_signs.append(sign(cross(POINTS[source], POINTS[center], POINTS[z])))
        assert 0 in power_signs and -1 in power_signs
        assert len(set(side_signs)) == 1 and side_signs[0] != 0

    # The cross-hit graph is the bare directed cycle A->B->C->A.
    hits = {
        (q, r)
        for q, (_, support) in ROWS.items()
        for r in ("A", "B", "C")
        if q != r and r in support
    }
    assert hits == {("A", "B"), ("B", "C"), ("C", "A")}

    # No NestedEqualChord metric antecedent even before imposing cyclic order.
    nested_metric_candidates = []
    for _, (center, support) in ROWS.items():
        radius2 = Q3(F(3))
        for a, b, c, d in permutations(support):
            if dist2(POINTS[a], POINTS[d]) == radius2 and dist2(POINTS[b], POINTS[c]) == radius2:
                nested_metric_candidates.append((center, a, b, c, d))
    assert not nested_metric_candidates

    # No six-label arc-overtake equality pattern from these three rows.
    by_center = {center: support for center, support in ROWS.values()}
    arc_candidates = []
    for o, a, d in permutations(by_center):
        for c, e in permutations(by_center[o] - {a, d}, 2):
            if o not in by_center[a] or c not in by_center[a]:
                continue
            if a not in by_center[d] or e not in by_center[d]:
                continue
            for f in by_center[d] - {a, e}:
                labels = (o, a, d, e, f, c)
                if len(set(labels)) == 6:
                    arc_candidates.append(labels)
    assert not arc_candidates

    k4_centers = {
        center
        for center in order
        if max(map(len, distance_classes(center, order).values())) >= 4
    }
    assert k4_centers == {"A", "B", "C"}

    shell_union = set().union(*(support for _, support in ROWS.values()))
    # Every covered point can use any one of these exact shells as its
    # CriticalShellSystem witness: deleting that point leaves no 4-class at
    # the chosen center.
    for q in shell_union:
        center, support = next(
            (center, support)
            for center, support in ROWS.values()
            if q in support and q != center
        )
        after_delete = distance_classes(center, [x for x in order if x != q])
        assert max(map(len, after_delete.values())) <= 3
    if full_css:
        assert shell_union == set(order)
    else:
        assert set(order) - shell_union == {"wAB", "wBC"}

    print(
        f"{len(order)} points: strict convexity; unit MEC; nonobtuse Moser triangle; "
        f"cap profile {profile}; three exact source-critical rows; cross hits A->B->C->A"
    )
    print(f"  global K4 centers exactly: {sorted(k4_centers)}")
    print(f"  points not covered by the three shells: {sorted(set(order) - shell_union)}")
    print("  MEC-straddling, nested-equal-chord, and arc-overtake antecedents: absent")


if __name__ == "__main__":
    audit(ORDER_NINE, (4, 4, 4), full_css=True)
    audit(ORDER_TWO_LARGE, (5, 5, 4), full_css=False)
    print("all exact Q(sqrt(3)) checks passed")
