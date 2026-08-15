from fractions import Fraction as F


POINTS = [
    (F(-1), F(0)),
    (F(-13, 17), F(16, 17)),
    (F(-3, 5), F(6, 5)),
    (F(-1, 5), F(8, 5)),
    (F(1), F(0)),
    (F(13, 17), F(-16, 17)),
    (F(3, 5), F(-6, 5)),
    (F(1, 5), F(-8, 5)),
]


def cross(a, b, c):
    return (b[0] - a[0]) * (c[1] - b[1]) - (b[1] - a[1]) * (c[0] - b[0])


def squared_distance(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def distance_classes(center_index, deleted_index=None):
    classes = {}
    for point_index, point in enumerate(POINTS):
        if point_index in {center_index, deleted_index}:
            continue
        distance = squared_distance(POINTS[center_index], point)
        classes.setdefault(distance, []).append(point_index)
    return classes


turns = [
    cross(POINTS[index - 2], POINTS[index - 1], POINTS[index])
    for index in range(len(POINTS))
]
assert all(turn < 0 for turn in turns)

# Source 0 has blocker center 4 and exact shell {0,1,2,3}.
assert distance_classes(4)[F(4)] == [0, 1, 2, 3]
assert max(map(len, distance_classes(4, deleted_index=0).values())) == 3

# Source 4 has blocker center 0 and exact shell {4,5,6,7}.
assert distance_classes(0)[F(4)] == [4, 5, 6, 7]
assert max(map(len, distance_classes(0, deleted_index=4).values())) == 3

print("PASS: exact convex 8-gon realizes a genuine two-cycle of critical four-shells")
