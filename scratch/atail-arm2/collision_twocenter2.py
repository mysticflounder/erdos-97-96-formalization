"""
Two-center forcing for the localizedCollision family (v2).
S3 validated exactly against banked straddle witness "0202"; S4 = the new
opposite-apex coupling, run with qfnra-nlsat.
"""
from fractions import Fraction as Fr
import z3


def sA2(u, v, w):
    return (v[0] - u[0]) * (w[1] - u[1]) - (w[0] - u[0]) * (v[1] - u[1])


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def triples_pos_exact(seq):
    n = len(seq)
    ok = True
    for i in range(n):
        for j in range(i + 1, n):
            for k in range(j + 1, n):
                v = sA2(seq[i], seq[j], seq[k])
                if not (v > 0):
                    ok = False
                    print(f'   TRIPLE ({i},{j},{k}) sA2={v} NOT >0')
    return ok


def validate_straddle_encoding():
    # banked witness "0202" (k=1 straddle) in the single-center gauge:
    # v2=(0,0)=cL, v3=(1,0)=cR, x=center=b, y1,y2 = same-radius members = s1,s2.
    cL = (Fr(0), Fr(0)); cR = (Fr(1), Fr(0))
    b = (Fr(1, 2), Fr(-1, 8))
    s1 = (Fr(1, 148), Fr(-13, 592))
    s2 = (Fr(4953, 4964), Fr(-929, 19856))
    rho2 = Fr(65, 256)
    print('[S3] validate straddle encoding on banked witness 0202:')
    print('   d2(b,s1)=', d2(b, s1), ' d2(b,s2)=', d2(b, s2), ' rho2=', rho2)
    eq = (d2(b, s1) == rho2) and (d2(b, s2) == rho2)
    print('   equalities hold:', eq)
    # half-disk membership H: p0^2+p1^2 <= p0, p1<0
    hd = all((p[0] ** 2 + p[1] ** 2 <= p[0]) and (p[1] < 0) for p in (b, s1, s2))
    print('   half-disk membership:', hd)
    # straddle order chain (cL, s1, b, s2, cR) all triples > 0
    order = triples_pos_exact([cL, s1, b, s2, cR])
    print('   straddle order-chain all-positive:', order)
    print('   => straddle encoding VALID:', eq and hd and order)
    print()


def build_afar():
    """straddle + full MEC + far apex v2=oppApex1 equidistance (NEW coupling)."""
    R = z3.Real
    cL = (z3.RealVal(0), z3.RealVal(0)); cR = (z3.RealVal(1), z3.RealVal(0))
    b = (R('bx'), R('by')); s1 = (R('s1x'), R('s1y')); s2 = (R('s2x'), R('s2y'))
    Af = (R('Afx'), R('Afy'))
    oy = R('oy'); rho2 = R('rho2'); rad2 = R('rad2')
    half = z3.RealVal(1) / 2
    Rmec2 = half * half + oy ** 2
    C = [d2(b, s1) == rho2, d2(b, s2) == rho2, rho2 > 0,
         d2(Af, s1) == rad2, d2(Af, s2) == rad2, rad2 > 0,
         # far apex on MEC, above axis, non-obtuse (cL,cR,Af):
         (Af[0] - half) ** 2 + (Af[1] - oy) ** 2 == Rmec2, Af[1] > 0,
         Af[0] >= 0, Af[0] <= 1,
         (cL[0] - Af[0]) * (cR[0] - Af[0]) + (cL[1] - Af[1]) * (cR[1] - Af[1]) >= 0]
    for p in (b, s1, s2):  # in lens: below axis, inside MEC disk
        C += [p[1] < 0, (p[0] - half) ** 2 + (p[1] - oy) ** 2 <= Rmec2]
    # STRADDLE order chain
    seq = [cL, s1, b, s2, cR]
    n = len(seq)
    for i in range(n):
        for j in range(i + 1, n):
            for k in range(j + 1, n):
                C.append(sA2(seq[i], seq[j], seq[k]) > 0)
    t = z3.Tactic('qfnra-nlsat')
    s = t.solver()
    s.add(C)
    return s


if __name__ == '__main__':
    validate_straddle_encoding()
    print('[S4] straddle + opposite-apex equidistance (qfnra-nlsat, 300s):')
    s = build_afar()
    s.set('timeout', 300000)
    r = s.check()
    print('   result:', r)
    if r == z3.sat:
        m = s.model()
        print('   model:', {str(d): str(m[d]) for d in m.decls()})
