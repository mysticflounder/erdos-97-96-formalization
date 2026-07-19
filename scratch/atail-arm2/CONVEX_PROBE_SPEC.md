# Candidate-D convex-position probe for SI1 {1-8}

Decides the crux's single remaining open question (verified reduction, memory
"arm2 SI1 crux VERIFIED REDUCTION"): does `D.convex` close SI1?

> Does `D.convex` (= ConvexIndep A, strict convex position) together with the
> local system {1-8} force UNSAT? Equivalently: **is there a strict-convex-
> position witness of {1-8}?**

- SAT (a convex witness exists) ⇒ `D.convex` alone does NOT close SI1; the crux
  is the genuinely open finer coupling (K4/Kalmanson, "couple ≥2 centers").
- UNSAT (no convex witness) ⇒ SI1 (and SI×{FE1,FE2,FE3}) closes via `D.convex`.

## The two hard traps (do not fall in)

1. **DO NOT fix the base to the s4 witness.** That witness is grossly non-convex
   (17/23 pts interior). Fixing it forces a spurious UNSAT. **Unfix every point.**
   Gauge = only cL=(0,0), cR=(1,0) (similarity). All other points free reals.
2. **Convexity = ConvexIndep A = STRICT convex position** of ALL named points:
   no named point lies in the convex hull of the others. Encode as: there is a
   cyclic order of the named points in which every consecutive triple turns the
   same way (all CCW), i.e. a strictly convex polygon; equivalently every point
   is a hull vertex. (A chosen order + all-triples-same-sign is sufficient for a
   SAT witness.)

## The system {1-8} (card-agnostic; see SI1_MUTUAL_OMISSION_COUPLED_SPEC.md)

Points (all FREE now): c0=oppApex1, bc=centerAt(g), bf=centerAt(f),
s1=g, s2, f, and the class members. Constraints, verbatim from the SI1 spec:
1. dist(c0,s1)=dist(c0,s2)=radius (>0).
2. dist(bc,s1)=dist(bc,s2)=rb (>0)  [equal blocker].
3. collision straddle: s1,s2,bc in oppCap1 interior; order (cL,s1,bc,s2,cR)
   convex; s1,s2,bc below the cL–cR axis; c0 the apex (non-obtuse, above axis).
4. frontier class at c0 (radius) card ≥ 4 ⊇ {s1,s2}.
5. freshPacket: f survives-4 at c0 (class P, radius rf0) AND at bc (class Q);
   |P∩Q| ≤ 2.
6. collisionSourcePacket: g=s1 survives-4 at c0 (class M, radius rg0) AND at bf
   (class N=shell(f)); |M∩N| ≤ 2.
7. mutual omission f∉shell(g), g∉shell(f).
8. classes avoid their deleted point; centers ≠ own support.

## Predicted structure of a convex witness (test this FIRST)

The **card-5 robust sub-case** is the natural convex candidate:
- Put the frontier class at c0 as card 5: {s1,s2,fr3,fr4,fr5} on ONE arc of the
  circle(c0,radius), on the cap side (below c0).
- Then "g=s1 survives-4 at c0" is witnessed by M = {s2,fr3,fr4,fr5} — the SAME
  circle, no inner concentric arc ⇒ no interior point at c0. (rg0 = radius.)
- Similarly if f is placed on the frontier circle, "f survives-4 at c0" uses
  P = frontier∖{f}. (rf0 = radius.)
- Remaining: the equal-blocker bc (with its shell(g)={s1,s2,w1,w2} on circle
  (bc,rb)), and bf with shell(f). These are arcs around OTHER hull vertices
  (bc, bf ∈ A). The whole question is whether ALL these arcs (around c0, bc, bf)
  co-embed in ONE strictly convex polygon.

**Construct** such a witness explicitly (place points on the arcs, pick the
global CCW order, solve/adjust the free radii and angles), then exact-rational
validate {1-8} + strict convex position. If it validates ⇒ SAT.

If no convex witness can be constructed and z3 (with the chosen order) returns
UNSAT, report UNSAT with the order(s) covered and argue why the concentric-arc /
multi-center obstruction is order-independent (that is the hard/open direction).

## Method

- Unfix base; gauge cL,cR only. Build in Python+z3 (qfnra-nlsat) with a chosen
  convex cyclic order (consecutive-triple CCW). Save to
  `scratch/atail-arm2/si1_convex.py`. Keep the {1-8} constraints identical to
  `si1_coupled.py` (import/reuse), only ADD ConvexIndep and unfix the base.
- Prefer CONSTRUCTING an explicit convex witness (guided above) over blind NRA
  UNSAT search. Exact-rational validate any SAT witness (Fractions): re-check all
  of {1-8} AND strict convex position (no interior point, no collinear triple).
- Report per-stage (core c0+classes+collision convex; then +f/bf/N; then full).

## Deliverable

VERDICT: SAT (exact convex witness, fully validated) | UNSAT (order coverage +
obstruction argument) | OPEN (timeout; what was tried). Regime: card-agnostic,
no |A|=11. Artifacts under `scratch/atail-arm2/`. Do NOT edit `lean/`.
