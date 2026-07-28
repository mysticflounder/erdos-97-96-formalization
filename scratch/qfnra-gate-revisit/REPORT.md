# QF_NRA (4,4,4) gate revisit — isolating the intractability (2026-07-28)

Question (Adam): the dead-ends claim "QF_NRA with K4-everywhere is
solver-undecidable in practice" doesn't really make sense — figure out why.

## Provenance of the original claim

`p97-rvol/scratch/u13_global/gen_global.py smoke1` (N=9, caps (4,4,4),
known verdict UNSAT): z3 4.17.0 and cvc5 1.3.3 both timed out at 1200–1500s.
Recorded in dead-ends.md as "free-frame + full-K4 not solver-decidable, even
the (4,4,4) known-result gate". That encoding carried: (a) unfixed
rotation+reflection symmetry; (b) separating-hyperplane convexity (18 extra
free reals → 45 total); (c) quartic onArcOpposite products; (d) per-point
boolean class selectors `s_i_j` with ≥4-of-8 cardinality; (e) a ¬U1.3 rider
that its own docstring notes is implied by the non-equilateral assertion.

## What was run here (`gen_clean.py`, same solvers/versions)

Clean re-encoding, identical hypothesis set: gauge fixed (v₂=(1,0),
orientation > 0), convexity as all-triples-ccw in the canonical cap-block
cyclic order (WLOG via ArcBlockContiguity; zero extra variables), caps
sign-resolved to bilinear form. 25 real vars (was 45), max degree 2.
Controls pass: sat-control (drop K4+rider) → `sat` instantly;
unsat-control (injected contradiction) → `unsat` < 1s.

| Experiment | Config | Result |
|---|---|---|
| gate, monolithic | clean, boolean K4 at all 9 pts, 1200s | z3 timeout, z3-nlsat timeout, cvc5 timeout |
| gate, monolithic | same, 3600s escalation | z3 timeout, cvc5 timeout |
| k-sweep | boolean K4 at only first k pts, k=1..9, 120s | **all 9 timeout — including k=1** |
| branch enum | explicit 4-subset class at v₂, no booleans anywhere, general non-equilateral frame, 70 branches, 120s each | **44 unsat / 4 sat / 22 timeout** |

SAT branches: {v₁,3,5,6}, {v₁,4,5,6}, {v₃,5,6,7}, {v₃,5,6,8} — all are
partial-K4 witnesses (K4 at v₂ only), the same artifact class as the
original's 4 SATs; not counterexamples to anything.

## Diagnosis

The killer is the **boolean class-selection layer inside the NRA query**,
full stop:

- Boolean-selector K4 at even ONE center times out (k=1, 120s) on the
  cleaned 25-var degree-2 frame.
- The same single-center constraint as an explicit class (zero booleans)
  resolves 44/70 branches inside 120s on the harder general
  (non-equilateral, both circle vertices free) frame — which the original
  campaign never ran at all (its branch data was equilateral-restricted).

Gauge fixing and the convexity encoding were real but secondary costs; with
booleans present they don't rescue the query, and with booleans absent the
query is mostly easy. "Free frame" and "full-K4-everywhere" were never the
operative difficulty — class selection was.

## Corrected statement (replaces the overbroad dead-ends reading)

QF_NRA is fine as a per-branch UNSAT engine on this geometry PROVIDED the
combinatorial choice (which points form each K4 class) is made outside the
solver. Any encoding that leaves class selection to the SMT solver — boolean
selectors, disjunctions over subsets — is dead on arrival, at any budget
tried. This is precisely the layered Layer-1/Layer-2 split of
`docs/computational-closure-plan-2026-07-28.md` §4: SAT/enumeration picks
incidence types, NRA/exact algebra decides each pure conjunction.

## Residue, honestly stated

- 22/70 general-frame branches still time out at 120s: per-branch QF_NRA is
  not a complete decision procedure at small budgets — stragglers need
  longer budgets, further case-splitting, or exact algebra (msolve real-root
  classification) per the plan's Layer-2.
- The 4 SAT branches would need exact-`Fraction` replay before being cited
  (precedent: `p97-rvol/scratch/u13_combo/validate_444_partialK4_sat.py`).
- Nothing here decides new mathematics; the gate's known UNSAT verdict is
  still supplied by the sibling-repo proof, not by these runs.

## Files

`gen_clean.py` (modes: gate | sat-control | unsat-control | k4sweep:k |
branch:i,j,k,l), `gate*.out`, `sweep_results.txt`, `branch_results.txt`,
generated `.smt2` files.
