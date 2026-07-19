"""3-CENTER convex probe: the full forced SI1 point set (the config a9ec7b00
died attempting), order-free strict convex position.

8-core (SAT) was 2-center (c0,bc).  SI1's fresh point f forces a THIRD center
bf=centerAt(f) with shell(f).  This is dead-ends.md's "couple >=2 centers".

13 forced points (all in A by {1-8}), card-agnostic:
  centers c0=oppApex1, bc=blocker(g), bf=blocker(f);
  circle(c0,rad) card 5 = {s1,s2,fr3,fr4,f}  [card>=5 so g and f each survive-4
    at c0 on this circle: frontier\{g}, frontier\{f} both card 4];
  circle(bc,rb)   card 4 = {s1,s2,w1,w2}      [shell(g)];
  circle(bf,rbf)  card 4 = {f,u1,u2,u3}       [shell(f)].
f is shared by circle(c0) and circle(bf); s1,s2 shared by circle(c0),circle(bc).

UNSAT => the 3-center coupling is convexly impossible => D.convex closes SI1.
SAT   => D.convex does NOT close SI1; the finer lever is D.K4 (every point has
         4 equidistant), not bare convexity.
Gauge: s1=(0,0), s2=(1,0).
"""
import z3


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def dot(a, b):
    return a[0] * b[0] + a[1] * b[1]


def pt(n):
    return (z3.Real(n + 'x'), z3.Real(n + 'y'))


def build(straddle=True):
    s1 = (z3.RealVal(0), z3.RealVal(0))
    s2 = (z3.RealVal(1), z3.RealVal(0))
    c0, bc, bf = pt('c0'), pt('bc'), pt('bf')
    fr3, fr4, f = pt('fr3'), pt('fr4'), pt('f')
    w1, w2 = pt('w1'), pt('w2')
    u1, u2, u3 = pt('u1'), pt('u2'), pt('u3')
    pts = {'s1': s1, 's2': s2, 'c0': c0, 'bc': bc, 'bf': bf,
           'fr3': fr3, 'fr4': fr4, 'f': f, 'w1': w1, 'w2': w2,
           'u1': u1, 'u2': u2, 'u3': u3}
    C = []
    # circle(c0, rad): s1,s2,fr3,fr4,f  (card 5)
    R1 = d2(c0, s1)
    for q in (s2, fr3, fr4, f):
        C += [d2(c0, q) == R1]
    C += [R1 > 0]
    # circle(bc, rb): s1,s2,w1,w2  (shell g, card 4, equal blocker)
    R2 = d2(bc, s1)
    for q in (s2, w1, w2):
        C += [d2(bc, q) == R2]
    C += [R2 > 0]
    # circle(bf, rbf): f,u1,u2,u3  (shell f, card 4)
    R3 = d2(bf, f)
    for q in (u1, u2, u3):
        C += [d2(bf, q) == R3]
    C += [R3 > 0]
    # centers pairwise distinct
    for a, b in ((c0, bc), (c0, bf), (bc, bf)):
        C += [z3.Or(a[0] != b[0], a[1] != b[1])]
    # all pairwise distinct
    ns = list(pts)
    for i in range(len(ns)):
        for j in range(i + 1, len(ns)):
            a, b = pts[ns[i]], pts[ns[j]]
            C += [z3.Or(a[0] != b[0], a[1] != b[1])]
    if straddle:
        C += [c0[1] > 0, bc[1] < 0]  # apex above, collision blocker below chord
    # ORDER-FREE strict convex position
    for name, p in pts.items():
        n = (z3.Real('n_' + name + '_x'), z3.Real('n_' + name + '_y'))
        C += [z3.Or(n[0] != 0, n[1] != 0)]
        for oname, q in pts.items():
            if oname != name:
                C += [dot(n, p) > dot(n, q)]
    return C, pts


def run(label, straddle, tmo=300000):
    C, pts = build(straddle)
    s = z3.Tactic('qfnra-nlsat').solver()
    s.add(C)
    s.set('timeout', tmo)
    r = s.check()
    print(f'[{label}] 3-center strict convex position -> {r}')
    if r == z3.sat:
        m = s.model()
        for name, p in pts.items():
            v0 = m.eval(p[0], model_completion=True)
            v1 = m.eval(p[1], model_completion=True)
            print(f'     {name} = ({v0}, {v1})')
    return r


if __name__ == '__main__':
    print('=' * 66)
    print('13-point 3-center convex probe (order-free)')
    print('=' * 66)
    r = run('with straddle sign', straddle=True)
    if r == z3.unknown:
        print('  (timeout/unknown; retry free)')
        r = run('free', straddle=False)
    print('\nSUMMARY')
    print(f'  verdict: {r}')
    print('  UNSAT => 3-center coupling convexly impossible => D.convex closes SI1.')
    print('  SAT   => D.convex does NOT close SI1; finer lever is D.K4.')
