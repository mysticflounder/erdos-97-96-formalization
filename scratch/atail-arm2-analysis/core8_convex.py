"""DECISIVE core probe: can the 8 FORCED points of the SI1 collision be in
strict convex position?  (Takes over the dead a9ec7b00 convex probe with a
sharper reduction.)

The 8 points are all forced members of A by {1-8}:
  c0=oppApex1, bc=collision blocker (distinct centers, in A);
  s1,s2 = the two circle intersections (equidistant from c0 AND bc);
  fr3,fr4 = 2 more on circle(c0,rad)  [frontier class card>=4 contains s1,s2];
  w1,w2   = 2 more on circle(bc,rb)   [shell(g) card 4 contains s1,s2].
Under D.convex (ConvexIndep A) ALL of A is in strict convex position, so these
8 must be.  If they CANNOT be -> D.convex + {1-8} UNSAT -> SI1 closes.

Strict convex position encoded ORDER-FREE: p is a vertex iff it has a supporting
direction n_p with <n_p,p> > <n_p,q> for every other q.  All 8 vertices <=> all
8 supporting directions exist.  This is definitive (no cyclic-order enumeration).

Card-agnostic: only these 8 named points; |A| unconstrained.
Gauge: s1=(0,0), s2=(1,0).
"""
import z3


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def dot(a, b):
    return a[0] * b[0] + a[1] * b[1]


def R(n):
    return z3.Real(n)


def pt(n):
    return (R(n + 'x'), R(n + 'y'))


def build(straddle=False):
    s1 = (z3.RealVal(0), z3.RealVal(0))
    s2 = (z3.RealVal(1), z3.RealVal(0))
    c0 = pt('c0'); bc = pt('bc')
    fr3 = pt('fr3'); fr4 = pt('fr4')
    w1 = pt('w1'); w2 = pt('w2')
    pts = {'s1': s1, 's2': s2, 'c0': c0, 'bc': bc,
           'fr3': fr3, 'fr4': fr4, 'w1': w1, 'w2': w2}
    C = []
    # circle(c0): s1,s2,fr3,fr4 equidistant from c0
    R1 = d2(c0, s1)
    C += [d2(c0, s2) == R1, d2(c0, fr3) == R1, d2(c0, fr4) == R1, R1 > 0]
    # circle(bc): s1,s2,w1,w2 equidistant from bc  (equal blocker)
    R2 = d2(bc, s1)
    C += [d2(bc, s2) == R2, d2(bc, w1) == R2, d2(bc, w2) == R2, R2 > 0]
    # distinct centers
    C += [z3.Or(c0[0] != bc[0], c0[1] != bc[1])]
    # all 8 pairwise distinct
    names = list(pts)
    for i in range(len(names)):
        for j in range(i + 1, len(names)):
            a, b = pts[names[i]], pts[names[j]]
            C += [z3.Or(a[0] != b[0], a[1] != b[1])]
    # optional straddle orientation: c0 above the s1s2 chord, bc below
    if straddle:
        C += [c0[1] > 0, bc[1] < 0]
    # ORDER-FREE strict convex position: each point has a supporting direction
    for name, p in pts.items():
        n = (R('n_' + name + '_x'), R('n_' + name + '_y'))
        # nondegenerate direction
        C += [z3.Or(n[0] != 0, n[1] != 0)]
        for oname, q in pts.items():
            if oname != name:
                C += [dot(n, p) > dot(n, q)]
    return C, pts


def run(label, straddle):
    C, pts = build(straddle)
    s = z3.Tactic('qfnra-nlsat').solver()
    s.add(C)
    s.set('timeout', 180000)
    r = s.check()
    print(f'[{label}] strict convex position of the 8 forced pts -> {r}')
    if r == z3.sat:
        m = s.model()
        print('   convex witness:')
        for name, p in pts.items():
            def val(x):
                v = m.eval(x, model_completion=True)
                return v.as_fraction() if hasattr(v, 'as_fraction') else v
            print(f'     {name} = ({val(p[0])}, {val(p[1])})')
    return r


if __name__ == '__main__':
    print('=' * 66)
    print('8-point core convex-position probe (order-free, definitive)')
    print('=' * 66)
    r_free = run('free (no straddle sign)', straddle=False)
    r_str = run('with straddle sign (c0 above, bc below chord)', straddle=True)
    print('\nSUMMARY')
    print(f'  free            : {r_free}')
    print(f'  +straddle sign  : {r_str}')
    print('  UNSAT => the 8 forced pts cannot be convex => D.convex closes SI1.')
    print('  SAT   => this core tension does NOT close it (need more pts / D.K4).')
