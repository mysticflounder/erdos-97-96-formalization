# ATAIL-SUB2 report

Transcribed verbatim by the orchestrator from the prover agent's final
message (the agent's own REPORT.md write was guard-blocked, same as the
2026-07-07 probe precedent). All other artifacts in this directory are the
agent's. Status: PROVEN — adversarial skeptic audit PASS 2026-07-12
(`scratch/atail-sub2-audit/AUDIT.md`; independent identity re-derivation,
symbolic verification of all 11 conversion lemmas, full smoke re-run ALL
PASS). `smoke_results.json` regenerated 2026-07-12 from the checked-in
smoke.py (the previously committed copy predated the disclosed s5 atom-fix
and recorded a stale S5 failure). Residue: the Lean certificate theorem
(matrix row gate) remains open.

## Terminal outcome (i): PROVEN

SUB2-H is UNSAT — decided by hand proof with an exact, machine-checked
certificate.

## STEP 0 — statement reconstruction (no ambiguity)

`STATEMENT.md`. SUB2-H reconstructed verbatim from
`census/candidate_d_probe/`: kill_notes.md §K-D (definition + PROVEN
H-reduction), `encoder.py:489-518` (`build_sub2`),
`runs/SUB2_{left,right}.smt2` (the 8-variable ω-systems; SUB2-H = oy→0,
leaving 7 variables `xx,xy,wax,way,wbx,wby,rho2`), `float_probe_sub2.py`.
Statement: with v2=(0,0), v3=(1,0), H = {p : p₀²+p₁² ≤ p₀, p₁ < 0}, there
exist no x, w_a, w_b ∈ H, ρ² > 0 with ‖x−w_a‖² = ‖x−w_b‖² = ρ² and all 10
signed-area triples of (v2,w_a,w_b,x,v3) [left] or (v2,x,w_a,w_b,v3)
[right] strictly positive. Both systems claimed UNSAT.

## The decision — PROVEN (proof location: `proof.md`)

Bisector-frame argument: equal radii put x on the perpendicular bisector
of [w_a,w_b]; the chain triples convert exactly to: the chord midpoint M
sees [v2,v3] at a strictly acute angle — i.e. M strictly outside the
closed Thales disk D with diameter [v2,v3] — while w_a,w_b ∈ D forces
M ∈ D by convexity. Frame elimination yields one polynomial identity,
`T234²·T123·T235 + (c2²/4)·S2·S3 + (c2²/4)·T234² + (c2/2)·T234²·(g_a+g_b)
= λ·E` (E = equal-radius equality), whose left side is strictly positive
under the hypotheses — an exact Positivstellensatz-style certificate.
Verified (`verify_identity.py`, ALL PASS): sympy exact division AND an
independent from-scratch Fraction-polynomial division, plus 400
exact-rational frame checks of all 11 conversion lemmas. The proof
consumes only 7 of the 10 triples + the two w-disk memberships + E — so it
also kills the ω-carrying 8-variable SUB2 artifacts as they stand (their
constraints imply g_a, g_b ≥ 0), covering the closed-disk (strongest)
variant. It exactly explains the recorded infimum-zero float boundary: the
violated triple carries a 2τ factor → absolute margin → 0⁻ under member
collapse while the normalized violation stays bounded (the prior near-miss
reproduces as p = −0.006038, T123 margin −3.94e−6, matching the probe's
−4e−6).

## Smoke gate (mandate) — MET

- (a) three PROVEN probe cuts reproduced: m ≤ 2 → z3 unsat; vertex-pair
  ⇒ s=0 → `KC_pair_v2v3_s1` unsat monolithically, mixed pairs via the
  kill_notes-verbatim lemma split (K-B negations + K-A corner-max
  consequences: all four z3-unsat; monoliths unknown at 120 s, recorded).
  Third cut "s = 2 straddle-only": its kill direction had no pre-SUB2
  PROVEN content to reproduce — kill_notes/STATE mark it ride-SUB2 while
  report.md/dead-ends call it PROVEN (discrepancy documented in
  STATEMENT.md; mooted — this decision makes it PROVEN). Its realizable
  side is reproduced: straddle witnesses 0202/0211 PASS.
- (b) banked witnesses stay SAT: all 13 `witnesses.json` witnesses
  re-verified exactly through an independent full-window evaluator;
  witness scan finds zero SUB2 sub-configurations across W15/W16-tri/
  W16-sq (exact integers), two-ring families (float, 1e−9 band, zero
  in-band), and the 13 probe witnesses.
- Encoding fidelity: atom-identical transcription vs both smt2 artifacts
  (17 atoms/side; the one prior failure was a dyadic-float formatting
  artifact, fixed losslessly — `s5_atom_fix.json`), 24,000-sample
  agreement, exact all-but-one-constraint control (fails only T123).
- z3 corroboration (recorded, nothing rests on it): the agent's left
  encoding unsat, both original artifacts pinned oy=0 unsat, the right
  encoding unknown; raw ω-free artifacts unknown at 300 s (matches
  history).

## Downstream (PROVEN via kill_notes K-D dependency map)

Kills (0,3,0,1), (0,4,0,0), (1,3,0,0) outright; s=2 classes
straddle-only; (1,2,0,1) k∈{0,2}. (1,2,0,1) k=1 remains OPEN. Composition
unchanged: Q2/D1 evasions already granted exactly this kill set (K_plus),
which upgrades CONJECTURED → PROVEN tier; no Q2 rerun needed. Next
decider: ATAIL-Q3 with the enlarged PROVEN cut set. Matrix-gate residue:
the Lean theorem (blocked this session by the build freeze) — the
certificate is `ring`+`positivity`/`nlinarith`-shaped, no QE, no
`native_decide`.
