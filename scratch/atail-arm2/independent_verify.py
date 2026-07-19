"""Independent EXACT verification (Fraction, no z3) of the arm2 SI1 witnesses
and the committed smoke test. Audits encoding faithfulness, not just solver output."""
from fractions import Fraction as Fr


def sA2(u, v, w):
    return (v[0]-u[0])*(w[1]-u[1]) - (w[0]-u[0])*(v[1]-u[1])


def d2(p, q):
    return (p[0]-q[0])**2 + (p[1]-q[1])**2


def P(*a):
    return tuple(Fr(x) for x in a)


def check(name, cond):
    print(f"  [{'PASS' if cond else 'FAIL'}] {name}")
    return cond


def order_all_pos(seq):
    ok = True
    n = len(seq)
    for i in range(n):
        for j in range(i+1, n):
            for k in range(j+1, n):
                v = sA2(seq[i], seq[j], seq[k])
                if not (v > 0):
                    ok = False
                    print(f"      triple({i},{j},{k}) sA2={v} !>0")
    return ok


print("=" * 60)
print("SMOKE TEST re-run (validate_straddle_encoding, banked '0202')")
cL, cR = P(0, 0), P(1, 0)
b = P(Fr(1, 2), Fr(-1, 8))
s1 = P(Fr(1, 148), Fr(-13, 592))
s2 = P(Fr(4953, 4964), Fr(-929, 19856))
rho2 = Fr(65, 256)
ok = True
ok &= check("d2(b,s1)==rho2", d2(b, s1) == rho2)
ok &= check("d2(b,s2)==rho2", d2(b, s2) == rho2)
ok &= check("half-disk H (p0^2+p1^2<=p0, p1<0) for b,s1,s2",
            all(p[0]**2+p[1]**2 <= p[0] and p[1] < 0 for p in (b, s1, s2)))
ok &= check("straddle order (cL,s1,b,s2,cR) all triples>0",
            order_all_pos([cL, s1, b, s2, cR]))
print(f"  SMOKE TEST {'PASSED' if ok else 'FAILED'}")

print("=" * 60)
print("S4 witness (SI1 straddle + opposite-apex) — exact check vs build_afar")
cL, cR = P(0, 0), P(1, 0)
s1, s2 = P(Fr(1, 6), Fr(-1, 5)), P(Fr(5, 6), Fr(-1, 5))
b = P(Fr(1, 2), Fr(-3, 10))
Af = P(Fr(1, 2), Fr(3, 5))
oy = Fr(11, 120)
rho2, rad2, R2 = Fr(109, 900), Fr(169, 225), Fr(3721, 14400)
half = Fr(1, 2)
Rmec2 = half*half + oy**2
s4 = True
s4 &= check("R2 == 1/4+oy^2", R2 == Rmec2)
s4 &= check("d2(b,s1)==rho2", d2(b, s1) == rho2)
s4 &= check("d2(b,s2)==rho2", d2(b, s2) == rho2)
s4 &= check("rho2>0", rho2 > 0)
s4 &= check("d2(Af,s1)==rad2", d2(Af, s1) == rad2)
s4 &= check("d2(Af,s2)==rad2", d2(Af, s2) == rad2)
s4 &= check("rad2>0", rad2 > 0)
s4 &= check("Af on MEC (Af0-1/2)^2+(Af1-oy)^2==R2",
           (Af[0]-half)**2 + (Af[1]-oy)**2 == Rmec2)
s4 &= check("Af1>0", Af[1] > 0)
s4 &= check("0<=Af0<=1", 0 <= Af[0] <= 1)
s4 &= check("non-obtuse at Af (cL-Af).(cR-Af)>=0",
           (cL[0]-Af[0])*(cR[0]-Af[0]) + (cL[1]-Af[1])*(cR[1]-Af[1]) >= 0)
for nm, p in [("b", b), ("s1", s1), ("s2", s2)]:
    s4 &= check(f"{nm} below axis", p[1] < 0)
    s4 &= check(f"{nm} in MEC disk", (p[0]-half)**2+(p[1]-oy)**2 <= Rmec2)
s4 &= check("straddle order (cL,s1,b,s2,cR) all triples>0",
            order_all_pos([cL, s1, b, s2, cR]))
print(f"  S4 WITNESS {'satisfies all encoded constraints' if s4 else 'FAILS'}")

print("=" * 60)
print("FE2 witness (SI1 straddle + escape) — exact check vs STATED constraints")
print("  NOTE: FE2 encoder was NOT saved as a script; checking witness vs the")
print("  constraints listed in si1_verdicts.json (encoding itself unauditable).")
cL, cR = P(0, 0), P(1, 0)
s1, s2 = P(Fr(1, 5), Fr(-1, 20)), P(Fr(4, 5), Fr(-1, 20))
b = P(Fr(1, 2), Fr(-1, 10))
Af = P(Fr(1, 2), Fr(4, 5))
e = P(Fr(0), Fr(1, 20))
oy = Fr(39, 160)
R2, rad2f = Fr(7921, 25600), Fr(13, 16)
Rmec2 = half*half + oy**2
fe = True
fe &= check("R2 == 1/4+oy^2", R2 == Rmec2)
fe &= check("d2(b,s1)==d2(b,s2) (blocker equal radius)", d2(b, s1) == d2(b, s2))
fe &= check("d2(Af,s1)==rad2f", d2(Af, s1) == rad2f)
fe &= check("d2(Af,s2)==rad2f", d2(Af, s2) == rad2f)
fe &= check("e on frontier circle d2(Af,e)==rad2f", d2(Af, e) == rad2f)
fe &= check("Af on MEC", (Af[0]-half)**2+(Af[1]-oy)**2 == Rmec2)
fe &= check("non-obtuse at Af", (cL[0]-Af[0])*(cR[0]-Af[0])+(cL[1]-Af[1])*(cR[1]-Af[1]) >= 0)
for nm, p in [("b", b), ("s1", s1), ("s2", s2)]:
    fe &= check(f"{nm} below axis", p[1] < 0)
    fe &= check(f"{nm} in MEC disk", (p[0]-half)**2+(p[1]-oy)**2 <= Rmec2)
fe &= check("straddle order (cL,s1,b,s2,cR) all triples>0",
            order_all_pos([cL, s1, b, s2, cR]))
# escape half-plane: e beyond chord [Af,cL] from the side opposite cR
side_cR = sA2(cL, Af, cR)
side_e = sA2(cL, Af, e)
print(f"      sA2(cL,Af,cR)={side_cR}  sA2(cL,Af,e)={side_e}  "
      f"(e opposite cR: {(side_cR>0) != (side_e>0)})")
print(f"  FE2 WITNESS {'satisfies all STATED constraints' if fe else 'FAILS'}")
