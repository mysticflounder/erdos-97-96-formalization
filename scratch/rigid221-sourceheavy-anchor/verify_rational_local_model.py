from fractions import Fraction as Q


Point = tuple[Q, Q]


def mul(z: Point, w: Point) -> Point:
    return (z[0] * w[0] - z[1] * w[1], z[0] * w[1] + z[1] * w[0])


def power(z: Point, n: int) -> Point:
    if n < 0:
        return power((z[0], -z[1]), -n)
    out = (Q(1), Q(0))
    for _ in range(n):
        out = mul(out, z)
    return out


def scale(a: Q, z: Point) -> Point:
    return (a * z[0], a * z[1])


def cross(a: Point, b: Point, c: Point) -> Q:
    return ((b[0] - a[0]) * (c[1] - b[1])
            - (b[1] - a[1]) * (c[0] - b[0]))


def dist2(a: Point, b: Point) -> Q:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


r = (Q(312, 313), Q(25, 313))
points: dict[str, Point] = {
    "O": (Q(0), Q(0)),
    "X": power(r, 0),
    "Y": power(r, 8),
    "E": power(r, 10),
    "V": power(r, 12),
    "U": power(r, 16),
    "e": scale(Q(10001, 10000), power(r, 5)),
    "c": scale(Q(10001, 10000), power(r, 11)),
    "L": scale(Q(10001, 10000), power(r, -1)),
    "R": scale(Q(10001, 10000), power(r, 17)),
}

order = ["O", "L", "X", "e", "Y", "E", "c", "V", "U", "R"]
turns = [
    cross(points[order[i - 1]], points[name], points[order[(i + 1) % len(order)]])
    for i, name in enumerate(order)
]
assert all(turn > 0 for turn in turns)

# The circle through O,L,R is the minimum enclosing circle of this named set:
# its center is strictly inside triangle OLR and every other named point is
# strictly inside the circle.
origin, left, right = points["O"], points["L"], points["R"]
det = left[0] * right[1] - left[1] * right[0]
left_norm2 = dist2(origin, left)
right_norm2 = dist2(origin, right)
mec_center = (
    (left_norm2 * right[1] - left[1] * right_norm2) / (2 * det),
    (left[0] * right_norm2 - left_norm2 * right[0]) / (2 * det),
)
mec_radius2 = dist2(origin, mec_center)
assert cross(origin, left, mec_center) > 0
assert cross(left, right, mec_center) > 0
assert cross(right, origin, mec_center) > 0
assert all(
    dist2(points[name], mec_center) < mec_radius2
    for name in ["X", "e", "Y", "E", "c", "V", "U"]
)

class_names = ["X", "Y", "E", "V", "U"]
expected = {
    "Y": {"X", "U"},
    "V": {"Y", "U"},
    "E": {"Y", "V"},
    "c": {"E", "V"},
    "e": {"X", "E"},
}
for center, pair in expected.items():
    radius2 = dist2(points[center], points[next(iter(pair))])
    hits = {
        name for name in class_names
        if name != center and dist2(points[center], points[name]) == radius2
    }
    assert hits == pair

assert dist2(points["O"], points["c"]) != 1
assert dist2(points["O"], points["e"]) != 1

print("verified exact rational MEC cap, convex order, and five exact class traces")
