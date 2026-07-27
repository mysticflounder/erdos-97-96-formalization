"""Exact rational witness against the local blocker-cycle/Kalmanson bridge."""

from fractions import Fraction as F


def circle_point(center, base, slope):
    """The second intersection with the circle through `base`."""
    x, y = base
    h, k = center
    step = -2 * ((x - h) + (y - k) * slope) / (1 + slope * slope)
    return x + step, y + step * slope


def unit_point(t):
    return (1 - t * t) / (1 + t * t), 2 * t / (1 + t * t)


def scale(r, point):
    return r * point[0], r * point[1]


o = (F(0), F(0))
a = (F(9, 41), F(-40, 41))
b0 = (F(2057, 2050), F(-462, 1025))
b1 = (F(897, 1025), F(496, 1025))
d = (F(7777, 51250), F(27918, 25625))

named_points = [
    ("o", o),
    ("c0a", circle_point(b0, a, F(-15, 7))),
    ("c0b", circle_point(b0, a, F(-95, 49))),
    ("o0a", unit_point(F(-9, 11))),
    ("L", (F(459, 2191), F(-1711, 1748))),
    ("a", a),
    ("b0", b0),
    ("b1", b1),
    ("d", d),
    ("R", (F(163, 1322), F(1127, 1030))),
    ("o1a", scale(F(11, 10), unit_point(F(41, 44)))),
    ("o1b", scale(F(11, 10), unit_point(F(49, 50)))),
    ("o0b", unit_point(F(49, 48))),
    ("c1a", circle_point(b1, d, F(108, 49))),
    ("c1b", circle_point(b1, d, F(109, 41))),
]


def determinant(p, q, x):
    return ((q[0] - p[0]) * (x[1] - p[1])
            - (q[1] - p[1]) * (x[0] - p[0]))


def distance_sq(p, center):
    return (p[0] - center[0]) ** 2 + (p[1] - center[1]) ** 2


points = [point for _, point in named_points]
edge_tests = [
    (determinant(points[i], points[(i + 1) % len(points)], points[j]), i, j)
    for i in range(len(points))
    for j in range(len(points))
    if j not in (i, (i + 1) % len(points))
]
minimum, edge, point = min(edge_tests)
assert minimum > 0

circles = [
    ("o radius 1", o, F(1)),
    ("o radius 11/10", o, F(121, 100)),
    ("b0 radius sqrt(89)/10", b0, F(89, 100)),
    ("b1 radius sqrt(89)/10", b1, F(89, 100)),
]
ledgers = {
    label: [
        name
        for name, candidate in named_points
        if distance_sq(candidate, center) == radius_sq
    ]
    for label, center, radius_sq in circles
}

assert ledgers == {
    "o radius 1": ["o0a", "a", "b1", "o0b"],
    "o radius 11/10": ["b0", "d", "o1a", "o1b"],
    "b0 radius sqrt(89)/10": ["c0a", "c0b", "a", "b1"],
    "b1 radius sqrt(89)/10": ["b0", "d", "c1a", "c1b"],
}

print(
    "minimum determinant:",
    minimum,
    float(minimum),
    "edge",
    named_points[edge][0],
    "point",
    named_points[point][0],
)
for label, hits in ledgers.items():
    print(f"{label}: {hits}")
