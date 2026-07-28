# Computational closure plan — remaining frontier (2026-07-28)

Premise: no further deep-thinker input is assumed. Every remaining obligation
is attacked with in-repo computational machinery (SAT, exact-rational
certificates, counting/Farkas certificates) feeding kernel-checked Lean
landings. This plan supersedes the round-2 solve-prompt lane as the primary
closure route; the bridge prompts remain valid side-channels if run, but
nothing below depends on them.

## 1. Baseline

19 open spine obligations (live blueprint 2026-07-28, identical for
`Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`; kernel `#print axioms`
is the arbiter — the refs miner has a known dropped-edge bug). All in
`ATail/FrontierLiveClosure.lean` (FLC), namespace
`Problem97.ATailFrontierLiveClosure`. Line numbers drift under the in-flight
refactor — declaration names are the stable keys.

| Pkg | Leaves | Declarations |
|---|---|---|
| A-core | 8 | `false_of_exactFourMutualOmissionRigid221_minimalCore`, `..._physicalApex_sourceEqU_blockerDeleted`, `..._blockerV_{sourceRowHeavy,oppositeRowHeavy,neitherRowHeavy}`, `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`, `..._blockerVRowOther_{oppositeRowHeavy,sparseRows}` |
| C-core | 2 | `..._physicalApex_sourceNeU`, `..._nonphysicalCollision` |
| D-R | 2 | `false_of_exactFourPostCardElevenTwoRadiusBranch`, `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` |
| D-E | 2 | `false_of_firstApexUniqueRadiusExactFive{Distinct,Common}ObstructionCenter(s)Residual` |
| E | 1 | `false_of_retainedInteriorDirectedOmission_and_all_low_hits` |
| F-Γ | 3 | `TwoSourceExactCollisionRowsTerminal.false_of_{crossBlockerCoincidence,capSource_freshThirdBlockerFiber,capSource_firstFiber_collisionFiveCenterDeletion}` |
| B1 | 1 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` |

Notes: F4 (`freshOutsideSecondBlockerFiber`) is closed by the landed fiber
swap; old B2/B3 no longer exist as named theorems in the current tree.
Hypothesis lists must be re-read from the tree at encode time (the refactor
may consolidate further); the solve-prompt family docs are the unfolded
plain-math references.

## 2. Ground rules (binding)

1. **Encoding smoke test before any production run** — every encoder must
   reproduce a known result first (per-package gates listed in §5).
2. **Forbidden modalities** (dead-ends (D-msolve), revised per
   `scratch/qfnra-gate-revisit/REPORT.md`): leaving combinatorial class
   selection to the SMT solver (boolean selectors / subset disjunctions
   inside an NRA query — times out even at one center); decimal-literal
   frames (spurious ~1e-16 SAT); reading complex Gröbner non-emptiness as
   real-satisfiability. Exact-rational / symbolic only. Per-branch QF_NRA
   over an explicitly enumerated incidence type IS permitted as a Layer-2
   UNSAT engine (44/70 general-frame gate branches resolve in 120s).
3. **Trust boundary**: msolve/Singular/cvc5/floating probes are untrusted
   proposal generators only; every kill is re-verified in exact `Fraction`
   arithmetic; every Lean landing is kernel-checked (`decide` preferred,
   `native_decide` allowed under the bv_decide standard).
4. **Spine discipline**: every Lean landing names its target leaf and is
   wired in the same change. No off-spine banks.
5. **Branch-B (realizability) certificates are adversarially audited before
   any route is declared dead**, then reported to Adam — an upstream
   re-split is a pivot decision. {{NEEDS_ADAM_INPUT}} at that gate.
6. FLC is a moving surface while the simplification refactor is in flight —
   coordinate before any FLC edit; computational artifacts live under
   `census/` and `scratch/`, Lean landings go through the normal gate.

## 3. What prior computation already fixes

These results shape where compute is spent; do not re-run them.

- **Local metric layers are realizable to substantial depth.** The 15-point
  rational witness (`scratch/full-local-euclidean-model-complete/`) realizes
  all four required 4-point distance classes simultaneously in strict convex
  position; the 8-point two-circle model
  (`scratch/full-local-circle-terminal/`) realizes the shared-chord packet.
  Consequence: no leaf closes on local circle geometry alone; the
  contradiction must use the incidence/counting layer or global structure
  (cap growth, cover bounds, minimality). The banked B1 normal form
  (`lean/scratch/b-family-bank/`) proves the same thing on the Lean side:
  B1's local bisector geometry is exactly saturated.
- **F3's real core is Γ + (F3a) + (F3b)** — (F3c) is redundant
  (`lean/scratch/f3c-redundancy-bank/`), and the sharpened form
  `f3c_joint_sharp` (two simultaneous five-center survivals) is free
  ammunition for the F encoding.
- **Equality-arm routes are dead** (`scratch/collision-equality-arms/`):
  the four collision equality alternatives all produce
  center-not-in-own-support, the opposite of the needed cross-row
  membership. Encodings must not expect a contradiction there.
- **The consolidated metric question (Q)** (dead-ends): the global
  per-vertex-K4 forced-repeated-circle incidence is irreducibly metric /
  ∃ℝ-flavoured. The plan does not attempt to decide (Q) wholesale; it
  attacks the 19 leaves' finite case structure, where each leaf's
  hypothesis stack is strictly richer than (Q).

## 4. The engine: two-layer CEGAR per package

One pipeline, applied per shared package (7 packages, §1), leaf supplements
as clause deltas. This is the same loop `census-554` already runs
(CEGAR-to-UNSAT with exact certificate replay), retargeted at the frontier
packages.

**Layer 1 — incidence/counting CNF.** Finite relational abstraction of the
package: ground set = the named points (T/Γ₂ five-sets, apexes a₀ a₁ a₂,
sources, blockers, CD-packet members) plus bounded anonymous slots; boolean
atoms for row membership (`x ∈ Row(y)`), cap membership (incl. strict
interiors), blocker map values (β(x) = y), class cardinalities (rows exactly
4, |T| = 5, |Λ| ∈ {4,5}), survival/omission arms, and the counting
trichotomies (cap-growth arithmetic |C₁|+|C₂|+|C₃| = n+3, |O₁|+|O₂|+2 = n,
cover bound |A| ≤ 4|N|, row-heaviness counts N_u, N_v). Every clause must be
IMPLIED by the package hypotheses (soundness is one-directional; the
abstraction may omit hypotheses — minimality and no-(m,4,4) in particular
are not finitely expressible and are omitted). CaDiCaL via
`census/card_head/` conventions; DIMACS + drat proofs retained.

- **UNSAT** ⇒ the package (or leaf delta) is contradictory at the incidence
  layer ⇒ Lean-close it by certificate replay (§6). This is the good
  outcome; A/C's row-heaviness splits and E's cover-bound structure are the
  most likely candidates. {{NEEDS_PROOF}} — no package verdict is assumed
  in advance.
- **SAT** ⇒ enumerate satisfying incidence types up to symmetry (blocked
  clauses over the model's orbit); proceed to Layer 2 per type.

**Layer 2 — exact-rational realization per incidence type.** Extend the
15-point witness scaffold: fix the incidence type, search ℚ² coordinates
satisfying every metric constraint exactly (`Fraction` arithmetic, msolve /
Singular / sympy as untrusted proposers, `check_model.py`-style exact
verification). Two outcomes:

- **Realized** ⇒ Branch-B candidate for that package. Verify every leaf
  hypothesis exactly except minimality/no-(m,4,4) (not finite); this is a
  *conditional route-kill* in the D-doc sense. Adversarial audit, then STOP
  and report (§2.5).
- **Not realized, with an identified small-support obstruction** (an exact
  polynomial certificate that some ≤10-point sub-configuration is
  impossible) ⇒ prove that obstruction as a Lean metric kernel (the
  88-metric-point-kernel pattern; opus prover agents, no subagents), add it
  to Layer 1 as a new clause, re-run. This is the CEGAR refinement step —
  each iteration strictly shrinks Layer 1's model space, and each kernel is
  a permanent on-spine asset once its replay lands.

Termination is not guaranteed (the loop can stall if realization neither
succeeds nor yields a finite-support obstruction — that residue is exactly
the (Q)-flavoured content); the stall condition is itself reportable: it
names the minimal open metric fact for that package.

## 5. Package work orders and smoke gates

Ordered by leverage (leaves closed or killed per verdict), with the shared
base encoder built once and instantiated per family — A and C share blocker
semantics, D/E share the residual frame.

| Order | Pkg | CNF seed (from the family docs' combinatorial sub-constraints) | Smoke gate |
|---|---|---|---|
| 1 | A-core (8) | Partition T = {z_d} ∪ I_u ∪ I_v, |I_u| = |I_v| = 2 disjoint; β-pattern with β(x) = a₁ iff x ∈ Cl(a₁,r); CD overlap ≤ 2; cap-growth trichotomy; leaf deltas A2–A8 (β(source) placement × N_u/N_v row-heaviness) | Encoder must find SAT on the 15-point witness's incidence type restricted to the layers it realizes; leaf-delta consistency: A3–A5 and A7–A8 deltas mutually exclusive by construction |
| 2 | C-core (2) | Same skeleton as A (Γ₂ = {z*} ∪ I_u ∪ I_v); C1 placement trichotomy; C2 explicit collision arm | Same witness gate; C1 trichotomy exhaustiveness checked against A's version |
| 3 | E (1) | Cover bound |A| ≤ 4|N|; cap-sum identity; derived n ≥ 15; unique-four shell cover as functional map x ↦ Row(x) into 4-blocks; directed-omission arm choice; E9 low-hit ≤ 2 clauses | Reproduce the kernel-checked low-hit consumers' arithmetic on a hand-built 15-point pattern |
| 4 | F-Γ (3) | Γ restated in `lean/scratch/f3c-redundancy-bank/F3cRedundancy.lean` (machine-readable); `f3c_joint_sharp` as given constraint; pairs-disjointness; shell ∩ cap = sources; F1/F2/F3 leaf deltas | Encoding must PROVE (be UNSAT with) the negation of the two kernel-checked sharpened terminals (`FirstFiberOverlapDescent.lean` `:772`, `:901`) — they are incidence-layer facts |
| 5 | D-R (2) | Two disjoint selected 4-classes K₁ ∩ K₂ = ∅; no-five-row at a₂; D2's five role-swap equalities S ↔ S′ | Role-swap involution sanity (S′′ = S); disjointness on the witness |
| 6 | D-E (2) | Exact-five class; D3 distinct-centers vs D4 common-center arm; D4's exactly-2-on-bisector cardinality | D4's bisector-2 clause must be consistent with the banked `b1_bisectorSet_eq_pair` mechanism (Dumitrescu L1 bound ≤ 2) |
| 7 | B1 (1) | Banked normal form as given clauses: K ∩ C = {z₁,z₂}, bisector set exactly {b,a₂}, β(u)/β(v) non-bisecting (`lean/scratch/b-family-bank/`) | Encoder must refute a third-bisector configuration (mirror of `b1_false_of_third_bisector_carrier`) |

All seven encoders are {{UNVALIDATED}} until their smoke gate passes.
Rationale for the order: A-core is the largest single lever (8 leaves close
or die together on the package verdict before any leaf delta is touched);
C amortizes A's encoder; E is the most counting-flavoured (best UNSAT
odds per effort); F-Γ has the most pre-built structure; D and B1 are
small and partly pre-constrained by banked facts.

## 6. Lean ingress (landing verdicts on the spine)

Three validated routes, chosen per artifact size:

1. **Small case trees** (≲ dozens of cases): direct Lean case analysis /
   `decide` over the finite abstraction, stated as a lemma whose hypotheses
   are re-derived from the leaf's actual binders (the b3_gap_refuted
   pattern: hypothesis instances, no new axioms).
2. **Trimmed-CNF valuation bridge** (thousands of clauses): the
   `IndexedSource` precedent — 8,703 trimmed clauses proven satisfied by an
   explicit valuation, all kernel-checked. Reuse its layout for any package
   whose UNSAT core is large; drat-trim first, replay the trimmed core.
3. **Farkas / counting certificates**: the 802-schema precedent for
   cardinality layers (cap growth, cover bounds, row-heaviness pigeonholes)
   — certificates land as cardinality-free lemmas parameterized over n.

Metric kernels from Layer-2 obstructions land as standalone theorems with
exact rational data inlined (Nullstellensatz replay, `Fraction`-verified
before formalization), then get consumed by the leaf's case tree.

## 7. Compute substrate

Budget (Adam, 2026-07-28): all of flux plus 24 cores on this box.

- **Local (24 cores)**: Layer-1 CNF verdict runs (CaDiCaL parallel over
  leaf deltas and symmetry-blocked type enumeration), sympy + `Fraction`
  certificate verification, drat-trim. All seven package verdicts are
  local-scale work.
- **flux (16 slots, dedicated)**: Layer-2 realization sweeps and
  mining-oracle batches via the census-554 NFS work queue
  (`/opt/nfs/erdos9796-flux-bridge/`, driver `CENSUS554_QUEUE=1`,
  heartbeat-sized deadlines, local fallback). Size batches to ~40 total
  slots (flux 16 + local overflow); known gotchas: run driver/workers
  outside the sandbox (NFS EPERM), skip AppleDouble `._*` files.
- **Optional escalation**: the SAT-Modulo-Symmetries + co-certificate
  learning lane (`docs/notes/sms-ccl-application-recommendation-2026-07-13.md`)
  fits Layer 1's symmetry blowup exactly but is explicitly not authorized —
  {{NEEDS_ADAM_INPUT}} before adopting.

## 8. Sequencing (sessions, not wall-clock)

- **Session 1**: base incidence encoder + A-core instantiation + A smoke
  gate; A-core package verdict run. Deliverable: verdict or a concrete
  encoding blocker.
- **Session 2**: C, E, F-Γ instantiations + smoke gates + verdicts (encoder
  amortized); begin leaf-delta runs for whichever package returned UNSAT.
- **Session 3**: D-R, D-E, B1; full 19-leaf triage matrix. Decision gate
  with Adam: replay-ingress queue vs realization sweeps per package.
- **Sessions 4+**: per verdict — certificate replay landings (§6) for UNSAT
  cores, fleet realization sweeps + CEGAR iterations for SAT packages.
  Kernel spine re-census after every landing batch; convo post per
  checkpoint.

## 9. Honest limits

- A package-level incidence-SAT verdict does not kill the package — only an
  audited exact realization does, and even that is conditional on
  minimality/no-(m,4,4) (not finitely checkable). Both hypotheses are
  omitted from Layer 1, which is sound for the UNSAT direction.
- The CEGAR loop's stall residue is the (Q)-flavoured metric content; if
  every package stalls there, the plan's output is the exact minimal open
  metric statement per package — named, not hand-waved — and that becomes
  the single target for whatever comes next.
- Verdicts here say nothing about hypothesis-package *consistency* in the
  vacuous sense: an UNSAT package closes its leaves regardless of whether
  upstream ever instantiates it.
