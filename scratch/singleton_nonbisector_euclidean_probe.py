"""Order-free nonlinear probe for the local aligned-singleton geometry.

This is intentionally not a CounterexampleData model.  It tests whether bare
strict convexity plus all named circle incidences around the two collision
rows, the fresh first-fiber outside pair, and the singleton cap-source row
force the second blocker to bisect that outside pair.
"""

import z3


def point(name):
    return (z3.Real(name + "x"), z3.Real(name + "y"))


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def dot(p, q):
    return p[0] * q[0] + p[1] * q[1]


def build():
    c0 = (z3.RealVal(1) / 2, z3.RealVal(2))
    p = (z3.RealVal(1) / 2, z3.RealVal(-2))
    s1 = (z3.RealVal(0), z3.RealVal(0))
    s2 = (z3.RealVal(1), z3.RealVal(0))
    names = [
        "q", "fr1", "fr2", "u", "v", "t1", "t2", "gr1", "gr2",
        "w1", "w2", "f", "r", "k1", "k2", "k3", "z",
    ]
    pts = {name: point(name) for name in names}
    pts.update({"c0": c0, "p": p, "s1": s1, "s2": s2})
    q = pts["q"]
    constraints = []

    # First retained radius and first blocker shell share exactly the source pair.
    radius1 = d2(c0, s1)
    for name in ("s2", "fr1", "fr2"):
        constraints.append(d2(c0, pts[name]) == radius1)
    blocker1_radius = d2(p, s1)
    for name in ("s2", "u", "v"):
        constraints.append(d2(p, pts[name]) == blocker1_radius)

    # Second retained source pair lies on one c0-radius and one q-shell.
    radius2 = d2(c0, pts["t1"])
    constraints += [
        d2(c0, pts["t2"]) == radius2,
        d2(c0, pts["gr1"]) == radius2,
        d2(c0, pts["gr2"]) == radius2,
        radius2 > 0,
        radius2 != radius1,
    ]
    blocker2_radius = d2(q, pts["t1"])
    for name in ("t2", "w1", "w2"):
        constraints.append(d2(q, pts[name]) == blocker2_radius)
    constraints.append(blocker2_radius > 0)

    # The live non-bisection arm.
    constraints.append(d2(q, pts["u"]) != d2(q, pts["v"]))

    # Singleton source f and its independent canonical four-shell.
    source_radius = d2(c0, pts["f"])
    constraints += [source_radius > 0, source_radius != radius1, source_radius != radius2]
    source_shell_radius = d2(pts["r"], pts["f"])
    for name in ("k1", "k2", "k3"):
        constraints.append(d2(pts["r"], pts[name]) == source_shell_radius)
    constraints += [
        source_shell_radius > 0,
        z3.Or(d2(pts["r"], s1) != source_shell_radius,
              d2(pts["r"], s2) != source_shell_radius),
        z3.Or(d2(pts["r"], pts["t1"]) != source_shell_radius,
              d2(pts["r"], pts["t2"]) != source_shell_radius),
    ]

    # Stronger-than-alignment condition on the eight intended cap points:
    # the only repeated c0 radii are the two retained source pairs.
    cap_names = ["p", "q", "s1", "s2", "t1", "t2", "f", "z"]
    allowed = {frozenset(("s1", "s2")), frozenset(("t1", "t2"))}
    for i, a in enumerate(cap_names):
        for b in cap_names[i + 1:]:
            if frozenset((a, b)) not in allowed:
                constraints.append(d2(c0, pts[a]) != d2(c0, pts[b]))

    # Pairwise distinct points.
    point_names = list(pts)
    for i, a in enumerate(point_names):
        for b in point_names[i + 1:]:
            constraints.append(z3.Or(pts[a][0] != pts[b][0], pts[a][1] != pts[b][1]))

    # Order-free strict convexity: every named point has a strict supporting direction.
    for name, x in pts.items():
        normal = point("normal_" + name)
        constraints.append(z3.Or(normal[0] != 0, normal[1] != 0))
        for other_name, y in pts.items():
            if name != other_name:
                constraints.append(dot(normal, x) > dot(normal, y))

    return constraints, pts


if __name__ == "__main__":
    cs, points = build()
    solver = z3.Tactic("qfnra-nlsat").solver()
    solver.add(cs)
    solver.set("timeout", 600000)
    result = solver.check()
    print("verdict:", result)
    if result == z3.sat:
        model = solver.model()
        for name, p in points.items():
            print(name, model.eval(p[0], model_completion=True),
                  model.eval(p[1], model_completion=True))
