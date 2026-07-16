"""Exact rational regression for the first strict-arm common-support target.

The model combines the native two-center metric hinge with a strict structural
cap shadow and an exact MEC disk.  It deliberately checks, and reports, the
one binding that fails: the structural triangle used for the strict cap shadow
is not the MEC-promoted triangle whose vertex must be the live parent apex.
It also does not claim global K4 or a total critical-shell system.
"""

from fractions import Fraction as Q
from pathlib import Path
import runpy


BASE = runpy.run_path(
    str(
        Path(__file__).resolve().parents[1]
        / "non-equilateral-continuation"
        / "verify_exact_local_regression.py"
    )
)

POINTS = dict(BASE["POINTS"])


def unit_lower(t):
    """Rational parametrization of the unit circle centered at z1."""
    return ((1 - t * t) / (1 + t * t), -2 * t / (1 + t * t))


# Insert a five-vertex arc between a3 and z2.  Every inserted point is another
# ambient radius-one point at z1, but none belongs to the selected four-subset
# ROW1.  This makes the row-selection gap executable.
for name, parameter in [
    ("U", Q(1, 16)),
    ("d1", Q(1, 20)),
    ("d2", Q(1, 24)),
    ("d3", Q(1, 28)),
    ("V", Q(1, 32)),
]:
    POINTS[name] = unit_lower(parameter)

ROW1 = BASE["ROW1"]
ROW2 = BASE["ROW2"]
PARENT_SUPPORT = BASE["K_SUPPORT"]

# Structural cap shadow with triangle vertices (b3,V,U).  With surplus index
# zero, these sets have the intended names.  The live oppApex2 would be U,
# rather than the independently realized parent center O2.
SURPLUS = {"U", "d1", "d2", "d3", "V"}
OPP_CAP1 = {"b3", "b2", "b1", "O2", "a1", "a2", "a3", "U"}
OPP_CAP2 = {"V", "z2", "kR", "kL", "z1", "b3"}
STRICT_OPP_CAP1 = OPP_CAP1 - (SURPLUS | OPP_CAP2)
STRICT_OPP_CAP2 = OPP_CAP2 - (SURPLUS | OPP_CAP1)


def squared_distance(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def signed_area2(v, vj, vk):
    return BASE["cross"](POINTS[v], POINTS[vj], POINTS[vk])


def on_arc_opposite(vi, vj, vk, v):
    return signed_area2(v, vj, vk) * signed_area2(vi, vj, vk) <= 0


def distance_multiplicities(center):
    counts = {}
    for name, point in POINTS.items():
        if name == center:
            continue
        d2 = squared_distance(POINTS[center], point)
        if d2 > 0:
            counts[d2] = counts.get(d2, 0) + 1
    return counts


def main():
    assert len(set(POINTS.values())) == len(POINTS)
    hull = BASE["strict_convex_hull"](POINTS)
    assert len(hull) == len(POINTS)
    assert all(
        BASE["cross"](
            hull[i], hull[(i + 1) % len(hull)], hull[(i + 2) % len(hull)]
        )
        > 0
        for i in range(len(hull))
    )

    # Exact parent and native-row metric data.
    parent_radius_sq = squared_distance(POINTS["O2"], POINTS["z1"])
    assert parent_radius_sq == Q(269, 400)
    assert all(
        squared_distance(POINTS["O2"], POINTS[name]) == parent_radius_sq
        for name in PARENT_SUPPORT
    )
    row_radius_sq = squared_distance(POINTS["z1"], POINTS["z2"])
    assert row_radius_sq == 1 and row_radius_sq != parent_radius_sq
    assert all(
        squared_distance(POINTS["z1"], POINTS[name]) == row_radius_sq
        for name in ROW1
    )
    assert all(
        squared_distance(POINTS["z2"], POINTS[name]) == row_radius_sq
        for name in ROW2
    )
    assert ROW1.isdisjoint(ROW2)

    # Exact metric-hinge witnesses x=a1 and y=b1.
    assert "a1" in ROW1 and "a1" not in ROW2
    assert "b1" in ROW2 and "b1" not in ROW1
    assert squared_distance(POINTS["a1"], POINTS["z1"]) == 1
    assert squared_distance(POINTS["a1"], POINTS["z2"]) == Q(2, 5)
    assert squared_distance(POINTS["b1"], POINTS["z2"]) == 1
    assert squared_distance(POINTS["b1"], POINTS["z1"]) == Q(2, 5)

    # Exact structural cap shadow, no-(m,4,4), strict center placement, and
    # the non-surplus-heavy strict arm.
    frames = [
        ("b3", "V", "U", SURPLUS),
        ("V", "U", "b3", OPP_CAP1),
        ("U", "b3", "V", OPP_CAP2),
    ]
    for vi, vj, vk, cap in frames:
        for name in POINTS:
            assert (name in cap) == on_arc_opposite(vi, vj, vk, name)
    assert [len(SURPLUS), len(OPP_CAP1), len(OPP_CAP2)] == [5, 8, 6]
    assert not (len(OPP_CAP1) == 4 and len(OPP_CAP2) == 4)
    assert {"z1", "z2"} <= STRICT_OPP_CAP2
    assert {"a1", "b1"} <= STRICT_OPP_CAP1
    assert len(ROW1 & SURPLUS) == 0
    assert len(ROW2 & SURPLUS) == 0

    # Exact MEC disk: center (1/2,-1/6), squared radius 5/18.  The acute
    # boundary triple z1,z2,a1 circumscribes every point; b1 is a fourth
    # boundary point.  Thus the ambient set has an exact MEC promotion, but
    # not with the structural triangle (b3,V,U) used above.
    mec_center = (Q(1, 2), Q(-1, 6))
    mec_radius_sq = Q(5, 18)
    assert all(
        squared_distance(mec_center, point) <= mec_radius_sq
        for point in POINTS.values()
    )
    assert {
        name
        for name, point in POINTS.items()
        if squared_distance(mec_center, point) == mec_radius_sq
    } == {"z1", "z2", "a1", "b1"}
    triangle_side_sq = [
        squared_distance(POINTS["z1"], POINTS["z2"]),
        squared_distance(POINTS["z2"], POINTS["a1"]),
        squared_distance(POINTS["a1"], POINTS["z1"]),
    ]
    assert all(
        triangle_side_sq[i]
        <= triangle_side_sq[(i + 1) % 3] + triangle_side_sq[(i + 2) % 3]
        for i in range(3)
    )

    # The load-bearing omitted binding is explicit and exact.
    assert POINTS["O2"] != POINTS["U"]
    assert squared_distance(POINTS["U"], POINTS["z1"]) == 1
    assert squared_distance(POINTS["U"], POINTS["z2"]) != 1
    assert "U" not in ROW1

    # Local K4 holds at the two continuation centers and the parent center,
    # but the property is not global on the sixteen-point carrier.
    assert max(distance_multiplicities("z1").values()) >= 4
    assert max(distance_multiplicities("z2").values()) >= 4
    assert max(distance_multiplicities("O2").values()) >= 4
    global_failures = [
        name
        for name in POINTS
        if max(distance_multiplicities(name).values(), default=0) < 4
    ]
    assert global_failures

    print("PASS: exact 16-point strict-arm structural/MEC regression")
    print("native selected-row overlap:", len(ROW1 & ROW2))
    print("cap profile:", len(SURPLUS), len(OPP_CAP1), len(OPP_CAP2))
    print("MEC boundary: a1 b1 z1 z2")
    print("omitted live binding: structural oppApex2=U, parent center=O2")
    print("global-K4 failures:", " ".join(global_failures))


if __name__ == "__main__":
    main()
