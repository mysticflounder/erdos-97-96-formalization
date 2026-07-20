"""
Candidate-D convex-position probe for SI1 {1-8}  (CONVEX_PROBE_SPEC.md).

QUESTION: is there a STRICT-convex-position (ConvexIndep) witness of the
card-agnostic system {1-8}?  SAT => D.convex does NOT close SI1.

METHOD (spec): UNFIX the base (gauge only cL=(0,0), cR=(1,0)); every other point
a free real.  Add strict convex position as all-triples-CCW for a chosen cyclic
order.  Solve the CORE (c0 + card-5 frontier + collision straddle, all metric
constraints of #3 incl. MEC-disk / non-obtuse apex-on-MEC / below-axis) with z3
qfnra-nlsat.  If SAT, extract and EXACT-RATIONAL validate.  The full {1-8} adds
shell(g)={w1,w2}, f, bf, shell(f)={u1,u2,u3}; those are extended numerically.

Convex cyclic order for the core (from numeric hull, min-margin 0.022):
    [c0, cL, s1, fr4, bc, fr3, fr5, s2, cR]     (CCW nonagon)
The straddle subsequence (cL,s1,bc,s2,cR) is order-consistent with this hull.

Regime: CARD-AGNOSTIC.  Exhibits only the finitely many named points.  No |A|=11.
"""
from fractions import Fraction as Fr
import z3

def sA2(u, v, w):
    return (v[0]-u[0])*(w[1]-u[1]) - (w[0]-u[0])*(v[1]-u[1])
def d2(p, q):
    return (p[0]-q[0])**2 + (p[1]-q[1])**2

R = z3.Real
def pt(n): return (R(n+'x'), R(n+'y'))

def build_core():
    cL = (z3.RealVal(0), z3.RealVal(0)); cR = (z3.RealVal(1), z3.RealVal(0))
    half = z3.RealVal(1)/2
    oy = R('oy')
    c0 = pt('c0'); bc = pt('bc'); s1 = pt('s1'); s2 = pt('s2')
    fr3 = pt('fr3'); fr4 = pt('fr4'); fr5 = pt('fr5')
    Rmec2 = half*half + oy*oy
    rad2 = d2(c0, s1)
    C = []
    # gauge / MEC
    C += [oy > 0]
    # c0 = oppApex1 on MEC, above axis, non-obtuse Moser apex
    C += [(c0[0]-half)**2 + (c0[1]-oy)**2 == Rmec2, c0[1] > 0,
          c0[0] >= 0, c0[0] <= 1,
          (cL[0]-c0[0])*(cR[0]-c0[0]) + (cL[1]-c0[1])*(cR[1]-c0[1]) >= 0]
    # #1 collision at c0 (radius): s1,s2,fr3,fr4,fr5 on circle(c0,rad)
    for p in (s2, fr3, fr4, fr5):
        C += [d2(c0, p) == rad2]
    C += [rad2 > 0]
    # #2 equal blocker at bc
    C += [d2(bc, s1) == d2(bc, s2), d2(bc, s1) > 0]
    # #3 straddle: s1,s2,bc below axis, inside MEC disk
    for p in (s1, s2, bc):
        C += [p[1] < 0, (p[0]-half)**2 + (p[1]-oy)**2 <= Rmec2]
    # frontier extras inside MEC disk (they are A-points => in disk)
    for p in (fr3, fr4, fr5):
        C += [(p[0]-half)**2 + (p[1]-oy)**2 <= Rmec2]
    # straddle order (cL,s1,bc,s2,cR): all 10 triples > 0
    seq = [cL, s1, bc, s2, cR]
    for i in range(5):
        for j in range(i+1, 5):
            for k in range(j+1, 5):
                C += [sA2(seq[i], seq[j], seq[k]) > 0]
    # #4 frontier class card>=4 (here card 5): distinctness
    frontier = [s1, s2, fr3, fr4, fr5]
    for i in range(5):
        for j in range(i+1, 5):
            C += [z3.Or(frontier[i][0] != frontier[j][0],
                        frontier[i][1] != frontier[j][1])]
    # STRICT CONVEX POSITION: all-triples-CCW for the chosen cyclic order
    order = [c0, cL, s1, fr4, bc, fr3, fr5, s2, cR]
    n = len(order)
    for i in range(n):
        for j in range(i+1, n):
            for k in range(j+1, n):
                C += [sA2(order[i], order[j], order[k]) > 0]
    names = dict(oy=oy, c0=c0, bc=bc, s1=s1, s2=s2, fr3=fr3, fr4=fr4, fr5=fr5)
    return C, names

def solve_core(timeout_ms=90000):
    C, names = build_core()
    t = z3.Tactic('qfnra-nlsat'); s = t.solver()
    s.add(C); s.set('timeout', timeout_ms)
    r = s.check()
    print(f'[CORE z3 qfnra-nlsat] -> {r}')
    if r == z3.sat:
        m = s.model()
        def val(v):
            x = m.eval(v[0], model_completion=True); y = m.eval(v[1], model_completion=True)
            return (Fr(str(x.as_fraction())) if hasattr(x,'as_fraction') else Fr(str(x)),
                    Fr(str(y.as_fraction())) if hasattr(y,'as_fraction') else Fr(str(y)))
        wit = {}
        for k, v in names.items():
            if k == 'oy':
                xx = m.eval(v, model_completion=True)
                wit[k] = Fr(str(xx.as_fraction())) if hasattr(xx,'as_fraction') else Fr(str(xx))
            else:
                wit[k] = val(v)
        return r, wit
    return r, None

def exact_validate_core(wit):
    """Re-check all CORE constraints + strict convex position in exact rationals."""
    cL, cR = (Fr(0),Fr(0)), (Fr(1),Fr(0)); half = Fr(1,2)
    oy = wit['oy']; c0=wit['c0']; bc=wit['bc']; s1=wit['s1']; s2=wit['s2']
    fr3=wit['fr3']; fr4=wit['fr4']; fr5=wit['fr5']
    Rmec2 = half*half + oy*oy; rad2 = d2(c0, s1)
    fails = []
    def chk(nm, c):
        if not c: fails.append(nm)
    chk('oy>0', oy > 0)
    chk('c0 on MEC', (c0[0]-half)**2+(c0[1]-oy)**2 == Rmec2)
    chk('c0 above axis', c0[1] > 0)
    chk('non-obtuse', (cL[0]-c0[0])*(cR[0]-c0[0])+(cL[1]-c0[1])*(cR[1]-c0[1]) >= 0)
    for nm,p in [('s2',s2),('fr3',fr3),('fr4',fr4),('fr5',fr5)]:
        chk(f'd2(c0,{nm})=rad2', d2(c0,p)==rad2)
    chk('rad2>0', rad2>0)
    chk('blocker eq', d2(bc,s1)==d2(bc,s2)); chk('rb>0', d2(bc,s1)>0)
    for nm,p in [('s1',s1),('s2',s2),('bc',bc)]:
        chk(f'{nm} below axis', p[1]<0)
        chk(f'{nm} in disk', (p[0]-half)**2+(p[1]-oy)**2<=Rmec2)
    for nm,p in [('fr3',fr3),('fr4',fr4),('fr5',fr5)]:
        chk(f'{nm} in disk', (p[0]-half)**2+(p[1]-oy)**2<=Rmec2)
    seq=[cL,s1,bc,s2,cR]
    for i in range(5):
        for j in range(i+1,5):
            for k in range(j+1,5):
                chk(f'straddle({i},{j},{k})', sA2(seq[i],seq[j],seq[k])>0)
    order=[c0,cL,s1,fr4,bc,fr3,fr5,s2,cR]; n=len(order)
    for i in range(n):
        for j in range(i+1,n):
            for k in range(j+1,n):
                chk(f'convexCCW({i},{j},{k})', sA2(order[i],order[j],order[k])>0)
    return fails

if __name__ == '__main__':
    print('#'*70); print('# SI1 convex-position probe — CORE (card-5 frontier)'); print('#'*70)
    r, wit = solve_core()
    if wit is not None:
        print('\nEXACT witness (rationals):')
        for k,v in wit.items(): print(f'   {k} = {v}')
        fails = exact_validate_core(wit)
        print(f"\nEXACT-RATIONAL CORE validation: "
              f"{'ALL PASS (strict-convex CORE SAT)' if not fails else 'FAILURES: '+str(fails)}")
    else:
        print(f'\nCORE result: {r} (no witness extracted)')
