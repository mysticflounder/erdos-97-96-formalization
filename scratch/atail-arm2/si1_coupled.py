"""
SI1 mutual-omission coupled residual — card-agnostic decision of {constraints 1-8}
from scratch/atail-arm2/SI1_MUTUAL_OMISSION_COUPLED_SPEC.md.

Extends the PROVEN-SAT straddle base (collision_twocenter2.py / s4_witness.json).
Builds the encoding in stages; reports SAT/UNSAT at each stage with z3
qfnra-nlsat, then INDEPENDENTLY exact-rational-validates a hand witness for the
full {1-8} system (Fractions, no solver trust).

Faithfulness anchors (Lean sources):
  - HasNEquidistantPointsAt 4 (A.erase q) c  = "4 distinct A-pts != q, equidist from c"
  - cross_deletion_survives_iff_not_mem_selected_support:
        survives-4 at centerAt(x) after deleting y  <->  y not in shell(x)
    => mutual omission (#7) IS the survives-at-2nd-center content of #5/#6.
  - CommonDeletionTwoCenterPacket.overlap_le_two derived from centers_ne
    (inter_card_le_two): distinct centers => <=2 shared pts AUTOMATICALLY.
  - shell_inter_cap_eq_sources: shell(g) = {s1,s2} u {2 outside-cap pts}.

REGIME GUARD: card-agnostic. |A| is NOT fixed; the witness exhibits only the
finitely many named points. No (5,5,4) profile, no Census-554.
"""
from fractions import Fraction as Fr
import z3


# ---------- exact helpers ----------
def sA2(u, v, w):
    return (v[0] - u[0]) * (w[1] - u[1]) - (w[0] - u[0]) * (v[1] - u[1])


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def triples_pos_exact(seq, label=""):
    n = len(seq)
    ok = True
    for i in range(n):
        for j in range(i + 1, n):
            for k in range(j + 1, n):
                v = sA2(seq[i], seq[j], seq[k])
                if not (v > 0):
                    ok = False
                    print(f'   {label} TRIPLE ({i},{j},{k}) sA2={v} NOT >0')
    return ok


# ---------- Stage 0 smoke test: banked straddle "0202" (KEPT verbatim) ----------
def validate_straddle_encoding():
    cL = (Fr(0), Fr(0)); cR = (Fr(1), Fr(0))
    b = (Fr(1, 2), Fr(-1, 8))
    s1 = (Fr(1, 148), Fr(-13, 592))
    s2 = (Fr(4953, 4964), Fr(-929, 19856))
    rho2 = Fr(65, 256)
    print('[S0 smoke] validate straddle encoding on banked witness 0202:')
    eq = (d2(b, s1) == rho2) and (d2(b, s2) == rho2)
    hd = all((p[0] ** 2 + p[1] ** 2 <= p[0]) and (p[1] < 0) for p in (b, s1, s2))
    order = triples_pos_exact([cL, s1, b, s2, cR], "0202")
    print(f'   blocker-eq={eq}  half-disk={hd}  straddle-order={order}')
    ok = eq and hd and order
    print(f'   => straddle smoke {"PASS" if ok else "FAIL"}\n')
    return ok


# ======================================================================
# z3 staged builders.  Base coords FIXED to the (independently PROVEN-SAT)
# s4 witness; the NEW structure is FREE and found by z3.  Fixing an
# independently-SAT base is SOUND for an existential (SAT) search: any
# concrete extension is a genuine witness.  (Unsoundness only arises when a
# fixed frame is used to claim a universal/UNSAT verdict -- not done here.)
# ======================================================================
R = z3.Real
HALF = z3.RealVal(1) / 2

# s4 base (exact) as z3 constants
CL = (z3.RealVal(0), z3.RealVal(0))
CR = (z3.RealVal(1), z3.RealVal(0))
S1 = (z3.RealVal(1) / 6, z3.RealVal(-1) / 5)      # = g
S2 = (z3.RealVal(5) / 6, z3.RealVal(-1) / 5)
BC = (z3.RealVal(1) / 2, z3.RealVal(-3) / 10)     # common blocker centerAt(g)
C0 = (z3.RealVal(1) / 2, z3.RealVal(3) / 5)       # oppApex1
OY = z3.RealVal(11) / 120
RAD2 = z3.RealVal(169) / 225                       # frontier radius^2
RB2 = z3.RealVal(109) / 900                        # blocker radius^2
RMEC2 = HALF * HALF + OY ** 2


def _ne(p, q):
    return z3.Or(p[0] != q[0], p[1] != q[1])


def _distinct(pts):
    C = []
    for i in range(len(pts)):
        for j in range(i + 1, len(pts)):
            C.append(_ne(pts[i], pts[j]))
    return C


def _pt(name):
    return (R(name + 'x'), R(name + 'y'))


def base_collision_constraints():
    """#1 (s1,s2 at radius from c0), #2 (blocker equal), #3 (straddle/MEC).
    Base coords are constants, so these are all identities -- included so the
    stage solver still *asserts* them (they must remain SAT)."""
    C = [d2(BC, S1) == RB2, d2(BC, S2) == RB2, RB2 > 0,
         d2(C0, S1) == RAD2, d2(C0, S2) == RAD2, RAD2 > 0,
         (C0[0] - HALF) ** 2 + (C0[1] - OY) ** 2 == RMEC2, C0[1] > 0,
         C0[0] >= 0, C0[0] <= 1,
         (CL[0] - C0[0]) * (CR[0] - C0[0]) + (CL[1] - C0[1]) * (CR[1] - C0[1]) >= 0]
    for p in (BC, S1, S2):
        C += [p[1] < 0, (p[0] - HALF) ** 2 + (p[1] - OY) ** 2 <= RMEC2]
    seq = [CL, S1, BC, S2, CR]
    for i in range(len(seq)):
        for j in range(i + 1, len(seq)):
            for k in range(j + 1, len(seq)):
                C.append(sA2(seq[i], seq[j], seq[k]) > 0)
    return C


def add_frontier(C, unique_radius=False):
    """#4: c0 frontier class card>=4 containing s1,s2.  Two more free pts."""
    fr3 = _pt('fr3'); fr4 = _pt('fr4')
    C += [d2(C0, fr3) == RAD2, d2(C0, fr4) == RAD2]
    C += _distinct([S1, S2, fr3, fr4])
    return {'fr3': fr3, 'fr4': fr4}


def add_fresh_and_shells(C):
    """#5 freshPacket, #6 collisionSourcePacket, #8 avoid-deleted.
    Q := shell(g) (4 pts at bc incl. s1,s2), N := shell(f) (4 pts at bf incl. f).
    P (4 pts at c0, != f), M (4 pts at c0, != g).  bf = centerAt(f)."""
    f = _pt('f')
    bf = _pt('bf'); rbf2 = R('rbf2')
    w1 = _pt('w1'); w2 = _pt('w2')                  # shell(g) extras
    u1 = _pt('u1'); u2 = _pt('u2'); u3 = _pt('u3')  # shell(f) extras
    P = [_pt(f'P{i}') for i in range(1, 5)]
    M = [_pt(f'M{i}') for i in range(1, 5)]
    rf0 = R('rf0'); rg0 = R('rg0')

    # f is a fresh oppCap1-interior point, distinct from s1,s2
    C += [f[1] < 0, (f[0] - HALF) ** 2 + (f[1] - OY) ** 2 <= RMEC2]
    C += [_ne(f, S1), _ne(f, S2)]

    # bf = centerAt(f): distinct from the two packet centers c0, bc
    C += [_ne(bf, C0), _ne(bf, BC)]

    # shell(g) = {s1,s2,w1,w2} at bc, radius rb  (Q class for f-survival at bc)
    C += [d2(BC, w1) == RB2, d2(BC, w2) == RB2]
    C += _distinct([S1, S2, w1, w2])
    C += [_ne(BC, w1), _ne(BC, w2)]                 # center not in own support

    # shell(f) = {f,u1,u2,u3} at bf, radius rbf  (N class for g-survival at bf)
    C += [d2(bf, f) == rbf2, d2(bf, u1) == rbf2,
          d2(bf, u2) == rbf2, d2(bf, u3) == rbf2, rbf2 > 0]
    C += _distinct([f, u1, u2, u3])
    C += [_ne(bf, u1), _ne(bf, u2), _ne(bf, u3)]

    # P: 4 distinct pts at c0, radius rf0>0, all != f  (f survives-4 at c0)
    C += [rf0 > 0]
    for p in P:
        C += [d2(C0, p) == rf0, _ne(p, f)]
    C += _distinct(P)

    # M: 4 distinct pts at c0, radius rg0>0, all != g=s1  (g survives-4 at c0)
    C += [rg0 > 0]
    for m in M:
        C += [d2(C0, m) == rg0, _ne(m, S1)]
    C += _distinct(M)

    return {'f': f, 'bf': bf, 'rbf2': rbf2, 'w1': w1, 'w2': w2,
            'u1': u1, 'u2': u2, 'u3': u3, 'P': P, 'M': M,
            'rf0': rf0, 'rg0': rg0,
            'shell_g': [S1, S2, w1, w2], 'shell_f': [f, u1, u2, u3]}


def add_mutual_omission(C, V):
    """#7: f not in shell(g), g=s1 not in shell(f).  (Equivalent by the Lean
    iff to the survives-at-second-center facts already in #5/#6, asserted
    explicitly here as non-membership.)"""
    for x in V['shell_g']:      # f not in {s1,s2,w1,w2}
        C.append(_ne(V['f'], x))
    for x in V['shell_f']:      # s1 not in {f,u1,u2,u3}
        C.append(_ne(S1, x))


def add_uniqueness(C, V, front):
    """PROBE (not in {1-8}): arm1 uniqueness -- single >=4-radius at c0.
    Force the P-class and M-class radii onto the frontier radius."""
    C += [V['rf0'] == RAD2, V['rg0'] == RAD2]


def add_uniqueness_card4(C, V, front):
    """PROBE: arm1 uniqueness AND frontier class card EXACTLY 4.
    Every A-point equidistant-at-c0 (the P's and M's) lies in the
    4-element frontier class {s1,s2,fr3,fr4}.  This is the pigeonhole
    regime: M (g=s1 survives-4 at c0) then needs 4 distinct pts in
    {s2,fr3,fr4} -> UNSAT."""
    C += [V['rf0'] == RAD2, V['rg0'] == RAD2]
    fr = [S1, S2, front['fr3'], front['fr4']]
    for p in V['P']:
        C.append(z3.Or(*[z3.And(p[0] == q[0], p[1] == q[1]) for q in fr]))
    for m in V['M']:
        C.append(z3.Or(*[z3.And(m[0] == q[0], m[1] == q[1]) for q in fr]))


def add_uniqueness_card5(C, V, front):
    """PROBE: arm1 uniqueness AND frontier class card EXACTLY 5.
    One extra point fr5 on circle(c0,rad2); P,M confined to the 5-set.
    M avoids s1 -> 4 distinct in {s2,fr3,fr4,fr5} -> SAT."""
    C += [V['rf0'] == RAD2, V['rg0'] == RAD2]
    fr5 = _pt('fr5')
    C += [d2(C0, fr5) == RAD2]
    C += _distinct([S1, S2, front['fr3'], front['fr4'], fr5])
    fr = [S1, S2, front['fr3'], front['fr4'], fr5]
    for p in V['P']:
        C.append(z3.Or(*[z3.And(p[0] == q[0], p[1] == q[1]) for q in fr]))
    for m in V['M']:
        C.append(z3.Or(*[z3.And(m[0] == q[0], m[1] == q[1]) for q in fr]))


def run_stage(name, build, timeout_ms=120000):
    C = base_collision_constraints()
    build(C)
    t = z3.Tactic('qfnra-nlsat')
    s = t.solver()
    s.add(C)
    s.set('timeout', timeout_ms)
    r = s.check()
    print(f'[{name}] qfnra-nlsat -> {r}')
    if r == z3.sat:
        m = s.model()
        # print a few key decls
        keys = sorted(str(d) for d in m.decls())
        print('   model vars:', ', '.join(keys[:12]), ('...' if len(keys) > 12 else ''))
    return r


def stage0(C):
    pass  # base only


def stage1(C):
    add_frontier(C)


def stage2(C):
    add_frontier(C)
    add_fresh_and_shells(C)


def stage3(C):
    front = add_frontier(C)
    V = add_fresh_and_shells(C)
    add_mutual_omission(C, V)


def stage4_uniqueness(C):
    front = add_frontier(C)
    V = add_fresh_and_shells(C)
    add_mutual_omission(C, V)
    add_uniqueness(C, V, front)


def stage4b_unique_card4(C):
    front = add_frontier(C)
    V = add_fresh_and_shells(C)
    add_mutual_omission(C, V)
    add_uniqueness_card4(C, V, front)


def stage4c_unique_card5(C):
    front = add_frontier(C)
    V = add_fresh_and_shells(C)
    add_mutual_omission(C, V)
    add_uniqueness_card5(C, V, front)


# ======================================================================
# Authoritative EXACT-RATIONAL validation of the hand witness for {1-8}.
# ======================================================================
def P(*a):
    return tuple(Fr(x) for x in a)


def exact_full_witness_check():
    print('=' * 70)
    print('EXACT-RATIONAL validation of hand witness for FULL system {1-8}')
    print('=' * 70)
    cL, cR = P(0, 0), P(1, 0)
    s1 = P(Fr(1, 6), Fr(-1, 5)); s2 = P(Fr(5, 6), Fr(-1, 5))    # g = s1
    bc = P(Fr(1, 2), Fr(-3, 10))                                  # centerAt(g)
    c0 = P(Fr(1, 2), Fr(3, 5))                                    # oppApex1
    oy = Fr(11, 120); R2 = Fr(3721, 14400)
    rb2 = Fr(109, 900); rad2 = Fr(169, 225)
    fr3 = P(Fr(41, 30), Fr(3, 5)); fr4 = P(Fr(-11, 30), Fr(3, 5))
    f = P(Fr(1, 2), Fr(-1, 5))                                    # fresh cap-interior
    bf = P(Fr(1, 2), Fr(-1)); rbf2 = Fr(16, 25)                   # centerAt(f)
    u1 = P(Fr(13, 10), Fr(-1)); u2 = P(Fr(-3, 10), Fr(-1)); u3 = P(Fr(1, 2), Fr(-9, 5))
    w1 = P(Fr(1, 6), Fr(-2, 5)); w2 = P(Fr(5, 6), Fr(-2, 5))
    rf0 = Fr(1)
    P1 = P(Fr(3, 2), Fr(3, 5)); P2 = P(Fr(-1, 2), Fr(3, 5))
    P3 = P(Fr(1, 2), Fr(8, 5)); P4 = P(Fr(1, 2), Fr(-2, 5))
    rg0 = Fr(4, 9)
    M1 = P(Fr(7, 6), Fr(3, 5)); M2 = P(Fr(-1, 6), Fr(3, 5))
    M3 = P(Fr(1, 2), Fr(19, 15)); M4 = P(Fr(1, 2), Fr(-1, 15))

    half = Fr(1, 2)
    Rmec2 = half * half + oy ** 2
    shell_g = [s1, s2, w1, w2]        # Q class (f-survival at bc)
    shell_f = [f, u1, u2, u3]         # N class (g-survival at bf)
    frontier = [s1, s2, fr3, fr4]
    Pcls = [P1, P2, P3, P4]
    Mcls = [M1, M2, M3, M4]

    fails = []

    def chk(name, cond):
        print(f"  [{'PASS' if cond else 'FAIL'}] {name}")
        if not cond:
            fails.append(name)

    def all_distinct(pts):
        return len(set(pts)) == len(pts)

    print('-- gauge / MEC --')
    chk('R2 == 1/4 + oy^2', R2 == Rmec2)

    print('-- #1 collision at c0 (radius), radius>0 --')
    chk('d2(c0,s1)==rad2', d2(c0, s1) == rad2)
    chk('d2(c0,s2)==rad2', d2(c0, s2) == rad2)
    chk('rad2>0', rad2 > 0)

    print('-- #2 equal blocker at bc, rb>0 --')
    chk('d2(bc,s1)==rb2', d2(bc, s1) == rb2)
    chk('d2(bc,s2)==rb2', d2(bc, s2) == rb2)
    chk('rb2>0', rb2 > 0)

    print('-- #3 straddle order + half-disk + MEC + apex --')
    chk('straddle (cL,s1,bc,s2,cR) all 10 triples >0',
        triples_pos_exact([cL, s1, bc, s2, cR], 'wit'))
    for nm, p in [('s1', s1), ('s2', s2), ('bc', bc)]:
        chk(f'{nm} below axis', p[1] < 0)
        chk(f'{nm} inside MEC disk', (p[0] - half) ** 2 + (p[1] - oy) ** 2 <= Rmec2)
    chk('c0 on MEC', (c0[0] - half) ** 2 + (c0[1] - oy) ** 2 == Rmec2)
    chk('c0 above axis', c0[1] > 0)
    chk('non-obtuse at c0',
        (cL[0] - c0[0]) * (cR[0] - c0[0]) + (cL[1] - c0[1]) * (cR[1] - c0[1]) >= 0)

    print('-- #4 frontier class card>=4 at radius, contains s1,s2 --')
    for nm, p in [('fr3', fr3), ('fr4', fr4)]:
        chk(f'd2(c0,{nm})==rad2', d2(c0, p) == rad2)
    chk('frontier {s1,s2,fr3,fr4} distinct (card 4)', all_distinct(frontier))

    print('-- #5 freshPacket: P at c0 (rf0), Q=shell(g) at bc, overlap<=2 --')
    chk('rf0>0', rf0 > 0)
    for i, p in enumerate(Pcls, 1):
        chk(f'd2(c0,P{i})==rf0', d2(c0, p) == rf0)
    chk('P class distinct (card 4)', all_distinct(Pcls))
    chk('P avoids f (#8)', all(p != f for p in Pcls))
    for i, q in enumerate(shell_g, 1):
        chk(f'd2(bc,Q{i})==rb2', d2(bc, q) == rb2)
    chk('Q=shell(g) distinct (card 4)', all_distinct(shell_g))
    chk('Q avoids f (#8)', all(q != f for q in shell_g))
    overlapPQ = len(set(Pcls) & set(shell_g))
    chk(f'|P cap Q|={overlapPQ} <= 2 (auto: c0!=bc)', overlapPQ <= 2)

    print('-- #6 collisionSourcePacket: M at c0 (rg0), N=shell(f) at bf, overlap<=2 --')
    chk('rg0>0', rg0 > 0)
    for i, mm in enumerate(Mcls, 1):
        chk(f'd2(c0,M{i})==rg0', d2(c0, mm) == rg0)
    chk('M class distinct (card 4)', all_distinct(Mcls))
    chk('M avoids g=s1 (#8)', all(mm != s1 for mm in Mcls))
    chk('rbf2>0', rbf2 > 0)
    for i, nn in enumerate(shell_f, 1):
        chk(f'd2(bf,N{i})==rbf2', d2(bf, nn) == rbf2)
    chk('N=shell(f) distinct (card 4)', all_distinct(shell_f))
    chk('N avoids g=s1 (#8)', all(nn != s1 for nn in shell_f))
    overlapMN = len(set(Mcls) & set(shell_f))
    chk(f'|M cap N|={overlapMN} <= 2 (auto: c0!=bf)', overlapMN <= 2)

    print('-- #7 mutual omission --')
    chk('f not in shell(g)', f not in set(shell_g))
    chk('g=s1 not in shell(f)', s1 not in set(shell_f))

    print('-- object distinctness (centers, sources, fresh) --')
    chk('s1 != s2', s1 != s2)
    chk('bc != bf (blockers_ne)', bc != bf)
    chk('c0 != bc, c0 != bf, bc != bf (centers distinct)',
        c0 != bc and c0 != bf and bc != bf)
    chk('f != s1, f != s2 (f fresh)', f != s1 and f != s2)
    chk('f in oppCap1 lens (below axis, in MEC)',
        f[1] < 0 and (f[0] - half) ** 2 + (f[1] - oy) ** 2 <= Rmec2)
    chk('center not in own support: bc notin shell(g)', bc not in set(shell_g))
    chk('center not in own support: bf notin shell(f)', bf not in set(shell_f))
    chk('actual_blocker_ne_center (freshPacket): bf!=c0, bf!=bc',
        bf != c0 and bf != bc)
    chk('actual_blocker_ne_center (collSrcPacket): bc!=c0, bc!=bf',
        bc != c0 and bc != bf)

    # count distinct named A-points (card-agnostic: works for any |A| >= this)
    named = set([s1, s2, bc, c0, f, bf] + frontier + Pcls + Mcls + shell_g + shell_f
                + [fr3, fr4, w1, w2, u1, u2, u3])
    print(f"\n  distinct named A-points in witness: {len(named)} "
          f"(card-agnostic: exhibits local pts only, |A| unconstrained)")
    print(f"\n  EXACT VALIDATION: {'ALL PASS' if not fails else 'FAILURES: ' + str(fails)}")
    return not fails


if __name__ == '__main__':
    print('#' * 70)
    print('# SI1 coupled residual — staged decision (card-agnostic)')
    print('#' * 70 + '\n')
    smoke = validate_straddle_encoding()

    print('=== PER-STAGE z3 (base fixed to s4; new structure free) ===')
    r0 = run_stage('Stage 0  straddle collision (1-3,#1)', stage0)
    r1 = run_stage('Stage 1  + frontier class #4', stage1)
    r2 = run_stage('Stage 2  + freshPacket #5 + collisionSourcePacket #6', stage2)
    r3 = run_stage('Stage 3  + mutual omission #7  = FULL {1-8}', stage3)
    r4 = run_stage('Stage 4  PROBE + arm1 uniqueness (rf0=rg0=rad2)', stage4_uniqueness)
    r4b = run_stage('Stage 4b PROBE + uniqueness & card EXACTLY 4', stage4b_unique_card4)
    r4c = run_stage('Stage 4c PROBE + uniqueness & card EXACTLY 5', stage4c_unique_card5)
    print()

    ok = exact_full_witness_check()

    print('\n' + '#' * 70)
    print('# SUMMARY')
    print('#' * 70)
    print(f'  smoke(0202)         : {"PASS" if smoke else "FAIL"}')
    print(f'  Stage 0 (1-3,#1)    : {r0}')
    print(f'  Stage 1 (+#4)       : {r1}')
    print(f'  Stage 2 (+#5,#6)    : {r2}')
    print(f'  Stage 3 (FULL 1-8)  : {r3}')
    print(f'  Stage 4 (+uniqueness): {r4}')
    print(f'  Stage 4b (+unique,card4): {r4b}   <- pigeonhole kill (arm1 must pin card=4)')
    print(f'  Stage 4c (+unique,card5): {r4c}   <- card 5 escapes the pigeonhole')
    print(f'  EXACT witness {{1-8}} : {"VALIDATED" if ok else "FAILED"}')
