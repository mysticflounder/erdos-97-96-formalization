"""Slot geometry for the D1 TriApex cyclic exclusion (plan sections 63-69).

Reproduces every empirical number quoted in plan sections 67-69.  No solver
is used: the only operations are circle-circle intersection in closed form
and the source cap-membership predicate.

Source conventions this module mirrors
--------------------------------------
* cap m is ``{v : OnArcOpposite A_m A_j A_k v}``, and ``OnArcOpposite`` is the
  CLOSED half-plane test ``signedArea2 v vj vk * signedArea2 vi vj vk <= 0``
  (``lean/Erdos9796Proof/P97/Foundation.lean:83``).
* ``capInteriorByIndex`` erases exactly the two chord-endpoint Moser vertices
  (``lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:496``).
* every carrier point lies in the closed MEC disk
  (``lean/Erdos9796Proof/P97/MEC/Basic.lean:291`` ``dist_mecSphere_center_le``).
* the three apices lie on the MEC boundary
  (``lean/Erdos9796Proof/P97/Moser/Triangle.lean:74,76,78``), so the MEC is the
  circumcircle of the Moser triangle.
* ``SurplusCapPacket`` carries a non-obtuse triangle
  (``lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:339``
  ``triangleNonObtuse``), so all three inscribed angles are at most pi/2.

Scope: this is the ONE-RADIUS arm, where cap j's whole interior lies on the
class at A_j, so a foreign hit satisfies two distance equations and lies on a
pair of class circles.  The two-radii arm is not modelled here.

Gauge: the MEC is the unit circle at the origin and ``A0`` sits at angle 0, so
a configuration is two angles ``(u, v)``.
"""

from __future__ import annotations

import math

__all__ = [
    "dist", "signed_area2", "circle_intersections", "in_cap_interior",
    "apices", "non_obtuse", "THIRD_INDEX", "slot_hits", "cap_arc_samples",
    "in_disk_criterion_trig", "in_disk_criterion_sides",
    "in_disk_criterion_circumradius",
    "criterion_agreement", "cyclic_solutions", "census_control",
    "both_points_in_disk_counts",
]

TOL = 1e-9

# slot (i, j) has a single apex candidate, the apex of the third index
THIRD_INDEX = {(0, 1): 2, (0, 2): 1, (1, 0): 2, (1, 2): 0, (2, 0): 1, (2, 1): 0}

CYCLIC_FOREIGN = {(0, 1), (1, 2), (2, 0)}
ANTICYCLIC_FOREIGN = {(0, 2), (1, 0), (2, 1)}
CENSUS_FOREIGN = {(0, 1), (2, 1)}


def dist(p, q):
    return math.hypot(p[0] - q[0], p[1] - q[1])


def signed_area2(v, vj, vk):
    """``Problem97.signedArea2`` (Foundation.lean:75)."""
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def circle_intersections(c0, r0, c1, r1):
    """Both intersection points of two circles, or ``[]``."""
    dx, dy = c1[0] - c0[0], c1[1] - c0[1]
    d = math.hypot(dx, dy)
    if d == 0.0 or d > r0 + r1 or d < abs(r0 - r1):
        return []
    a = (r0 * r0 - r1 * r1 + d * d) / (2 * d)
    h2 = r0 * r0 - a * a
    if h2 < 0:
        return []
    h = math.sqrt(h2)
    xm, ym = c0[0] + a * dx / d, c0[1] + a * dy / d
    return [(xm + h * dy / d, ym - h * dx / d), (xm - h * dy / d, ym + h * dx / d)]


def in_cap_interior(p, apex_pts, m, tol=TOL):
    """Closed cap membership, inside the closed MEC disk, not a chord endpoint."""
    if p[0] * p[0] + p[1] * p[1] > 1.0 + tol:
        return False
    j, k = [q for q in range(3) if q != m]
    if dist(p, apex_pts[j]) < 1e-7 or dist(p, apex_pts[k]) < 1e-7:
        return False
    return signed_area2(p, apex_pts[j], apex_pts[k]) * \
        signed_area2(apex_pts[m], apex_pts[j], apex_pts[k]) <= tol


def apices(u, v):
    return [(math.cos(t), math.sin(t)) for t in (0.0, u, u + v)]


def sides(apex_pts):
    """``(a, b, c)`` = ``(|A1A2|, |A0A2|, |A0A1|)``."""
    return (dist(apex_pts[1], apex_pts[2]), dist(apex_pts[0], apex_pts[2]),
            dist(apex_pts[0], apex_pts[1]))


def non_obtuse(a, b, c, tol=TOL):
    return (b * b + c * c >= a * a - tol and a * a + c * c >= b * b - tol
            and a * a + b * b >= c * c - tol)


def slot_hits(apex_pts, rho, foreign, tol=TOL, atol=1e-7):
    """Fill all six slots.  ``foreign`` slots need a cap-interior intersection
    point; the rest must be apex-filled.  Returns ``None`` on failure."""
    hits = {}
    for i in range(3):
        for j in range(3):
            if i == j:
                continue
            if (i, j) in foreign:
                ok = [p for p in circle_intersections(apex_pts[i], rho[i],
                                                      apex_pts[j], rho[j])
                      if in_cap_interior(p, apex_pts, j, tol)]
                if not ok:
                    return None
                hits[(i, j)] = ok[0]
            else:
                if abs(dist(apex_pts[i], apex_pts[THIRD_INDEX[(i, j)]])
                       - rho[i]) > atol:
                    return None
                hits[(i, j)] = apex_pts[THIRD_INDEX[(i, j)]]
    return hits


def cap_arc_samples(apex_pts, m, rho_m, tol=TOL, n=4000):
    """Sampled length of ``circle(A_m, rho_m)`` inside cap m.  Cap m must host
    four interior points, so this has to be nonzero."""
    return sum(1 for s in range(n)
               for th in (2 * math.pi * s / n,)
               if in_cap_interior((apex_pts[m][0] + rho_m * math.cos(th),
                                   apex_pts[m][1] + rho_m * math.sin(th)),
                                  apex_pts, m, tol))


# --- the three interchangeable forms of the in-disk criterion ---------------
# All are for slot (0,1): circle(A0, c) meets circle(A1, a) inside the MEC disk.
# alp/bet/gam are the inscribed angles at A0/A1/A2; R the circumradius.
# Each REQUIRES gam <= pi/2; on obtuse triangles the arccos branch inverts.

def in_disk_criterion_trig(alp, gam, tol=TOL):
    return math.sin(2 * gam) >= math.sin(alp) - tol


def in_disk_criterion_sides(a, b, c, tol=TOL):
    return a * a * b <= c * (a * a + b * b - c * c) + tol


def in_disk_criterion_circumradius(a, c, radius, tol=TOL):
    return radius * radius * (4 * c * c - a * a) >= c ** 4 - tol


def _brute_in_disk(alp, gam, tol=TOL):
    a0 = (1.0, 0.0)
    a1 = (math.cos(2 * gam), math.sin(2 * gam))
    a2 = (math.cos(2 * gam + 2 * alp), math.sin(2 * gam + 2 * alp))
    return any(p[0] ** 2 + p[1] ** 2 <= 1.0 + tol
               for p in circle_intersections(a0, dist(a0, a1), a1, dist(a1, a2)))


def criterion_agreement(n=300):
    """Plan section 69's table: each closed form vs direct circle intersection,
    over the non-obtuse angle grid.  Returns ``(samples, trig, sides, radius)``."""
    total = trig = side = rad = 0
    for i in range(1, n):
        for j in range(1, n):
            alp, gam = math.pi * i / n, math.pi * j / n
            bet = math.pi - alp - gam
            if bet <= 1e-6 or max(alp, bet, gam) > math.pi / 2 + 1e-12:
                continue
            total += 1
            a, b, c = 2 * math.sin(alp), 2 * math.sin(bet), 2 * math.sin(gam)
            truth = _brute_in_disk(alp, gam)
            trig += in_disk_criterion_trig(alp, gam) == truth
            side += in_disk_criterion_sides(a, b, c) == truth
            rad += in_disk_criterion_circumradius(a, c, 1.0) == truth
    return total, trig, side, rad


def cyclic_solutions(n=900, sense="+"):
    """Angle triples satisfying all three cyclic in-disk conditions.  Plan
    section 67 predicts exactly one, the equilateral point."""
    out = []
    for i in range(1, n):
        for j in range(1, n):
            alp, gam = math.pi * i / n, math.pi * j / n
            bet = math.pi - alp - gam
            if bet <= 1e-9 or max(alp, bet, gam) > math.pi / 2 + 1e-12:
                continue
            trio = ((gam, alp), (alp, bet), (bet, gam)) if sense == "+" \
                else ((alp, gam), (bet, alp), (gam, bet))
            if all(math.sin(2 * x) >= math.sin(y) - 1e-12 for x, y in trio):
                out.append((alp, bet, gam))
    return out


def both_points_in_disk_counts(n=400):
    """Plan section 69's Case-1 check: the larger root always exceeds R^2, so
    both intersection points are never simultaneously in the disk.
    Returns ``(both, exactly_one, none)``."""
    both = one = none = 0
    for i in range(1, n):
        for j in range(1, n):
            alp, gam = math.pi * i / n, math.pi * j / n
            bet = math.pi - alp - gam
            if bet <= 1e-6 or max(alp, bet, gam) > math.pi / 2 + 1e-12:
                continue
            a0 = (1.0, 0.0)
            a1 = (math.cos(2 * gam), math.sin(2 * gam))
            a2 = (math.cos(2 * gam + 2 * alp), math.sin(2 * gam + 2 * alp))
            k = sum(1 for p in circle_intersections(a0, dist(a0, a1),
                                                    a1, dist(a1, a2))
                    if p[0] ** 2 + p[1] ** 2 <= 1.0 + TOL)
            both += k == 2
            one += k == 1
            none += k == 0
    return both, one, none


def census_control(n=1200):
    """Positive control: the census slot pattern with rho_0=rho_1=rho_2=a=c,
    on the isosceles line v=u, requiring a live cap arc at all three indices.
    Also the wrong-radius negative control.  Returns ``(positive, negative)``."""
    pos = neg = 0
    for i in range(1, n):
        u = 2 * math.pi * i / n
        v = u                                   # forces a = c, apex at A1
        if u + v >= 2 * math.pi:
            break
        pts = apices(u, v)
        if abs(signed_area2(pts[0], pts[1], pts[2])) < 1e-7:
            continue
        a, b, c = sides(pts)
        if not non_obtuse(a, b, c):
            continue
        if abs(b - a) < 1e-6 and abs(c - a) < 1e-6:
            continue                            # skip equilateral
        if slot_hits(pts, (a, a, a), CENSUS_FOREIGN) is not None and \
                min(cap_arc_samples(pts, m, a) for m in range(3)) > 0:
            pos += 1
        if slot_hits(pts, (a, b, c), CENSUS_FOREIGN) is not None:
            neg += 1
    return pos, neg


if __name__ == "__main__":                      # pragma: no cover
    total, trig, side, rad = criterion_agreement()
    print(f"non-obtuse samples {total}: trig {trig}, sides {side}, radius {rad}")
    for sense in ("+", "-"):
        sols = cyclic_solutions(sense=sense)
        dev = max(max(abs(x - math.pi / 3) for x in t) for t in sols) if sols else None
        print(f"cyclic sense {sense}: {len(sols)} solution(s), max deviation {dev}")
    print("both/one/none in disk:", both_points_in_disk_counts())
    print("census positive, negative control:", census_control())
