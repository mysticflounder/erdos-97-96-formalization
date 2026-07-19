"""
Two-center forcing for the localizedCollision family of
FrontierCoupledStrictInteriorNormalForm.

Geometry (PROVEN from Lean, see RetainedStrictInteriorPairSelector.lean:94-115
and RetainedInteriorBlockerCollision.blocker_mem_capInterior):
  - b, s1, s2 all lie in the interior of cap oppCap1 = C2 (corners v1, v3).
  - dist(b,s1) = dist(b,s2) = rho_b       (b is the common blocker/center)
  - dist(v2,s1) = dist(v2,s2) = rad        (v2 = oppApex1 = OPPOSITE apex;
                                            both sources at frontier radius)
  - the Moser triangle (v1,v3,v2) is on the MEC, non-obtuse; disk contains all.

Gauge (b's own-cap C2 frame): corners cL=(0,0), cR=(1,0) are {v3,v1};
lens is y<0 (opposite apex above). Far apex A_far = v2 is above the axis.

SUB2-H (PROVEN UNSAT, scratch/atail-sub2): same lens, center + two members on
ONE side of the center, half-disk H = {p0^2+p1^2 <= p0, p1<0}, order chain.
SUB2-H does NOT see the far apex.  Straddle (center between the two members) is
NOT killed by SUB2-H -- banked realizable.

This script:
  (S1) reproduces SUB2-H-left  UNSAT   [smoke test: validates the encoding]
  (S2) reproduces SUB2-H-right UNSAT   [smoke test]
  (S3) straddle, half-disk, NO far apex -> SAT [banked; validates 'straddle survives']
  (S4) straddle + full MEC + far-apex equidistance (the NEW two-center coupling)
"""
import z3


def sA2(u, v, w):
    return (v[0] - u[0]) * (w[1] - u[1]) - (w[0] - u[0]) * (v[1] - u[1])


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def order_chain_pos(seq):
    """all i<j<k triples of seq have signedArea2 > 0 (convex CCW)."""
    C = []
    n = len(seq)
    for i in range(n):
        for j in range(i + 1, n):
            for k in range(j + 1, n):
                C.append(sA2(seq[i], seq[j], seq[k]) > 0)
    return C


def half_disk(p):
    """p in H = {p0^2 + p1^2 <= p0, p1 < 0} (omega=0 lower half-disk, closed circle)."""
    return [p[0] ** 2 + p[1] ** 2 <= p[0], p[1] < 0]


def build(mode):
    s = z3.Solver()
    R = z3.Real
    cL = (z3.RealVal(0), z3.RealVal(0))
    cR = (z3.RealVal(1), z3.RealVal(0))
    b = (R('bx'), R('by'))
    s1 = (R('s1x'), R('s1y'))
    s2 = (R('s2x'), R('s2y'))
    rho2 = R('rho2')
    C = []
    # common-radius (blocker) equalities + positivity
    C += [d2(b, s1) == rho2, d2(b, s2) == rho2, rho2 > 0]

    if mode in ('sub2_left', 'sub2_right', 'straddle_noafar'):
        # SUB2-H frame: omega = 0 half-disk on b, s1, s2. corners cL,cR are the
        # own-cap corners of b (=v3,v1). No far apex.
        for p in (b, s1, s2):
            C += half_disk(p)
        if mode == 'sub2_left':
            seq = [cL, s1, s2, b, cR]        # both members left of center b
        elif mode == 'sub2_right':
            seq = [cL, b, s1, s2, cR]        # both members right of center b
        else:
            seq = [cL, s1, b, s2, cR]        # STRADDLE: b between s1 and s2
        C += order_chain_pos(seq)

    elif mode == 'straddle_afar':
        # Full MEC with far apex A_far = v2 (=oppApex1) above the axis.
        Af = (R('Afx'), R('Afy'))
        oy = R('oy')
        Rmec2 = z3.RealVal(1) / 4 + oy ** 2         # O=(1/2,oy) through cL,cR
        rad2 = R('rad2')
        # far apex on the MEC, above axis, non-obtuse triangle (cL,cR,Af)
        C += [(Af[0] - z3.RealVal(1) / 2) ** 2 + (Af[1] - oy) ** 2 == Rmec2,
              Af[1] > 0]
        C += [Af[0] >= 0, Af[0] <= 1]                # non-obtuse at cL and cR
        C += [sA2(cL, Af, cR) != 0]                  # non-degenerate (implied)
        # inner-product non-obtuse at Af: <cL-Af, cR-Af> >= 0
        C += [(cL[0] - Af[0]) * (cR[0] - Af[0]) + (cL[1] - Af[1]) * (cR[1] - Af[1]) >= 0]
        # b, s1, s2 strictly below axis and inside the MEC disk
        for p in (b, s1, s2):
            C += [p[1] < 0,
                  (p[0] - z3.RealVal(1) / 2) ** 2 + (p[1] - oy) ** 2 <= Rmec2]
        # NEW coupling: s1, s2 equidistant from the far apex v2 = oppApex1
        C += [d2(Af, s1) == rad2, d2(Af, s2) == rad2, rad2 > 0]
        # STRADDLE order
        seq = [cL, s1, b, s2, cR]
        C += order_chain_pos(seq)
    else:
        raise ValueError(mode)

    s.add(C)
    return s


if __name__ == '__main__':
    z3.set_param('timeout', 120000)
    for mode in ('sub2_left', 'sub2_right', 'straddle_noafar', 'straddle_afar'):
        s = build(mode)
        s.set('timeout', 120000)
        r = s.check()
        print(f'{mode:20s} -> {r}')
        if r == z3.sat and mode in ('straddle_noafar', 'straddle_afar'):
            m = s.model()
            print('   model:', {str(d): str(m[d]) for d in m.decls()})
