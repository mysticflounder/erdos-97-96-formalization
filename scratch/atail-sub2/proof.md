# ATAIL-SUB2 — SUB2-H is UNSAT (hand proof + exact certificate)

Statement as reconstructed in `STATEMENT.md`. Everything below is labeled.
Machine verification of every algebraic step: `verify_identity.py`
(sympy exact division + independent Fraction-polynomial division + 400
exact-rational frame checks; ALL PASS), `smoke.py`, `witness_scan.py`.

## Theorem (PROVEN)

Fix v2 = (0,0), v3 = (1,0) and let D = {p : p₀² + p₁² ≤ p₀} be the closed
disk with diameter [v2, v3]. There are NO points x, w_a, w_b ∈ ℝ² with

  (i)   ‖x − w_a‖ = ‖x − w_b‖            (equal radius; rho2 eliminated),
  (ii)  w_a, w_b ∈ D,
  (iii) the five signed-area conditions
        sA2(v2,w_a,w_b) > 0, sA2(w_a,w_b,v3) > 0, sA2(w_a,w_b,x) > 0,
        sA2(v2,w_a,x) + sA2(v2,w_b,x) > 0,
        sA2(w_a,x,v3) + sA2(w_b,x,v3) > 0
        — implied by the 10 positive triples of the left chain
        (v2, w_a, w_b, x, v3) — OR the right-chain variant
        sA2(v2,w_a,w_b) > 0, sA2(w_a,w_b,v3) > 0, sA2(x,w_a,w_b) > 0,
        sA2(v2,x,w_a) + sA2(v2,x,w_b) > 0,
        sA2(x,w_a,v3) + sA2(x,w_b,v3) > 0.

This is strictly stronger than SUB2-H UNSAT: it uses neither the
below-axis conditions, nor x ∈ D, nor rho2 > 0, and only 7 of the 10
triples (four of them only through their pairwise sums). Hence both
SUB2-H-left and
SUB2-H-right are UNSAT, and via the PROVEN H-reduction (kill_notes K-D)
the original ω-carrying SUB2 (both sides) is UNSAT.

## Proof

**Step 1 (frame; PROVEN).** By (i), x lies on the perpendicular bisector of
[w_a, w_b] once w_a ≠ w_b. From sA2(w_a,w_b,x) > 0 (identical to
sA2(x,w_a,w_b) by cyclic invariance): w_a ≠ w_b and x is not on the line
w_a w_b. Let M = (w_a + w_b)/2, h = ‖M − x‖ > 0, m̂ = (M − x)/h, and
n = rot90(m̂) = (−m̂₁, m̂₀). Since (i) gives (x − M) ⊥ (w_b − w_a), we may
write w_b = M + τ n, w_a = M − τ n with τ ∈ ℝ \ {0}. Then
sA2(w_a,w_b,x) = 2τh, so the orientation condition forces τ > 0.

**Step 2 (frame conversions; PROVEN — exact algebra, machine-checked on 400
random exact-rational frames, `verify_identity.py` check [3]).** Write
P = M − v2, Q = M − v3 and their frame coordinates
p = P·m̂, p′ = P·n, q = Q·m̂, q′ = Q·n. Then, identically on the variety
E = 0 (E := (x − M)·(w_b − w_a) = (‖x−w_a‖² − ‖x−w_b‖²)/2):

  sA2(v2,w_a,w_b) = 2τp                sA2(w_a,w_b,v3) = 2τq
  sA2(w_a,w_b,x)  = 2τh
  sA2(v2,w_a,x) + sA2(v2,w_b,x) = 2hp′
  sA2(w_a,x,v3) + sA2(w_b,x,v3) = 2hq′
  sA2(v2,x,w_a) + sA2(v2,x,w_b) = −2hp′
  sA2(x,w_a,v3) + sA2(x,w_b,v3) = −2hq′

**Step 3 (hypotheses in frame; PROVEN).**
Left chain: p > 0, q > 0, p′ > 0, q′ > 0.
Right chain: p > 0, q > 0, p′ < 0, q′ < 0.
In both cases p q + p′q′ > 0, i.e.

  (M − v2)·(M − v3) = P·Q = pq + p′q′ > 0,

so M sees the segment [v2, v3] at a strictly acute angle; by the Thales
inequality M lies strictly OUTSIDE D
((z − v2)·(z − v3) ≤ 0 ⟺ z ∈ D, since v2, v3 are the diameter endpoints).

**Step 4 (disk; PROVEN).** w_a, w_b ∈ D and D is convex, so
M = (w_a + w_b)/2 ∈ D, i.e. (M − v2)·(M − v3) ≤ 0. Quantitatively, summing
(w − v2)·(w − v3) ≤ 0 over w ∈ {w_a, w_b} gives P·Q ≤ −τ² < 0.

Steps 3 and 4 contradict each other. ∎

## Positivstellensatz certificate (PROVEN, machine-checked exactly)

Eliminating the frame gives one polynomial identity in the six coordinates
(a0,a1,b0,b1,x0,x1) := (w_a, w_b, x). With

  T123 = sA2(v2,w_a,w_b), T235 = sA2(w_a,w_b,v3), T234 = sA2(w_a,w_b,x),
  S2 = sA2(v2,w_a,x) + sA2(v2,w_b,x), S3 = sA2(w_a,x,v3) + sA2(w_b,x,v3),
  g_a = a0 − a0² − a1², g_b = b0 − b0² − b1², c2 = ‖w_b − w_a‖²,
  E = (x − (w_a+w_b)/2)·(w_b − w_a):

  T234²·T123·T235 + (c2²/4)·S2·S3 + (c2²/4)·T234² + (c2/2)·T234²·(g_a + g_b)
    = λ · E                                                          (IDENT)

for an explicit polynomial λ (printed by `verify_identity.py`; divisibility
verified by exact polynomial division in TWO independent implementations —
sympy and a from-scratch Fraction-based routine). Under the left-chain
constraints: E = 0, T123, T235, T234, S2, S3 > 0, g_a, g_b ≥ 0, c2 ≥ 0
(a square sum) — the first term is strictly positive and the other three
are nonnegative, so the left side is > 0 while the right side is 0.
Contradiction. Under the right-chain constraints S2, S3 < 0 but only the
product S2·S3 appears; identical contradiction. This certificate is
`ring` + `positivity`-shaped and directly Lean-ready.

**Extension to the ω-carrying SUB2 artifacts (PROVEN).** The original
8-variable systems `runs/SUB2_{left,right}.smt2` assert the ω-disk
inequalities g_a + 2·oy·a1 ≥ 0, g_b + 2·oy·b1 ≥ 0 together with oy ≥ 0
and a1 < 0, b1 < 0; hence g_a ≥ 2·oy·(−a1) ≥ 0 and g_b ≥ 0, and the same
certificate applies verbatim: both artifacts are UNSAT as they stand
(ω free), independently of the kill_notes K-D H-reduction.

## Consistency with all prior recorded evidence

- The float near-miss (`float_refine_sub2.py:48`, x=(0.075,−0.1844),
  ρ=0.0375, θ_a=3.2987, θ_b=3.3161) satisfies every constraint EXCEPT
  T123 = sA2(v2,w_a,w_b): there p = (M−v2)·m̂ ≈ −0.006 < 0 while
  T123 = 2τp with τ = ρ sin((θ_b−θ_a)/2) ≈ 3.3e−4, giving
  T123 ≈ −3.9e−6 — exactly the probe's best grid margin (−4e−6), and the
  θ_a → θ_b "member collapse" is τ → 0 shrinking the ABSOLUTE margin of
  this one violated constraint to 0⁻ while the normalized violation p < 0
  stays bounded. This explains the infimum-zero boundary and the
  z3/cvc5 failures (the gap is zero in the raw monomial basis; the
  certificate divides out 2τ). Verified through `smoke.py` (S4).
- No banked realizable witness contains a SUB2-H sub-configuration
  (`witness_scan.py`: 13 probe witnesses and the W15/W16 lattice families
  in exact integer/rational arithmetic; the two-ring families at stored
  float precision with a 1e-9 margin band, zero in-band cases): the new
  cut keeps all banked witnesses SAT, as the theorem requires.

## Rigor summary

- Statement reconstruction: PROVEN (verbatim from probe artifacts).
- Steps 1–4, frame conversions, IDENT divisibility: PROVEN
  (hand algebra + exact machine verification, two independent engines).
- SUB2-H UNSAT (left and right, closed-disk version): PROVEN.
- ω-carrying SUB2 UNSAT: PROVEN (via kill_notes K-D H-reduction, PROVEN
  there; also directly — the proof never uses ω).
- Downstream kills (0,3,0,1), (0,4,0,0), (1,3,0,0); s=2 k∈{0,2};
  (1,2,0,1) k∈{0,2}: PROVEN, conditional only on the probe's PROVEN
  constraint-subset map (kill_notes K-D dependency map + formulation §3
  exclusion-soundness), which was independently hand-checked by the
  2026-07-07 orchestrator verification (report.md header).
- (1,2,0,1) k = 1 (straddle) remains OPEN — unchanged by this decider.
- Composition consequence: none new — Q2/D1 already showed per-type kills
  including exactly these do not compose at n = 12..16 (K_plus tier);
  the K_plus tier simply becomes PROVEN-tier. Next decider: ATAIL-Q3.
