# Computational closure plan — remaining frontier (2026-07-28)

Premise: no further deep-thinker input is assumed. Every remaining obligation
is attacked with in-repo computational machinery (SAT, exact-rational
certificates, counting/Farkas certificates) feeding kernel-checked Lean
landings. This plan supersedes the round-2 solve-prompt lane as the primary
closure route; the bridge prompts remain valid side-channels if run, but
nothing below depends on them.

## 1. Baseline

18 direct open source obligations (source inventory refreshed 2026-07-30,
identical for
`Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`; kernel `#print axioms`
is the arbiter — the refs miner has a known dropped-edge bug). All in
`ATail/FrontierLiveClosure.lean` (FLC), namespace
`Problem97.ATailFrontierLiveClosure`. Recomposed 2026-07-28 by the landed
simplification refactor (`a0f73bc1`): initially 19 leaves, with A dropping 8→6
(two `blockerV` arms closed; `blockerVRowOther_*` renamed `blockerVRow_*`)
and B growing 1→3 (B2/B3 are live named leaves again). A later source-clean
F3 narrowing replaced one residual by two directly consumed theorems, taking
the live total to 20.  The 2026-07-30 canonical-row override/rebase closes the
aligned/nonbisector source leaf by reducing it to the already-open fresh-third
leaf, returning the direct total to 19.  The subsequent fixed-row same-cap
split closes the positive alignment branch and replaces the opaque fresh-third
leaf by one strictly narrower negative residual; the direct total remains 19.
The final cap-source consolidation observes that both the negative fresh-third
leaf and the one-sided-deletion leaf were called only after constructing the
same `CapSourceThirdCanonicalRowSurface` and after the coordinator had already
produced `GeometricMultiplicityResidual`.  Their branch-specific packets are
concrete refinements of that residual, rather than independent contradiction
interfaces.  They are now compatibility adapters to the single common
`false_of_capSourceThirdCanonicalRowSurface` obligation, which retains the
residual explicitly.  This reduces the direct total to 18 and the F-Γ frontier
from three leaves to two without discarding the finite blocker-fiber data.

| Pkg | Leaves | Declarations |
|---|---|---|
| A-core | 6 | `false_of_exactFourMutualOmissionRigid221_minimalCore`, `..._physicalApex_sourceEqU_blockerDeleted`, `..._blockerV_sourceRowHeavy`, `..._blockerVRow_{oppositeRowHeavy,sparseRows}`, `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` |
| C-core | 2 | `..._physicalApex_sourceNeU`, `..._nonphysicalCollision` |
| D-R | 2 | `false_of_exactFourPostCardElevenTwoRadiusBranch`, `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` |
| D-E | 2 | `false_of_firstApexUniqueRadiusExactFive{Distinct,Common}ObstructionCenter(s)Residual` |
| E | 1 | `false_of_retainedInteriorDirectedOmission_and_all_low_hits` |
| F-Γ | 2 | `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`, `...false_of_capSourceThirdCanonicalRowSurface` |
| B | 3 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`, `false_of_exactFourMutualOmission_fourCenterCommonDeletion_{blockerCoincidence,survivalSquare}` |

Notes: F4 (`freshOutsideSecondBlockerFiber`) is closed by the landed fiber
swap. Hypothesis lists must be re-read from the tree at encode time; the
solve-prompt family docs are the unfolded plain-math references. The B
package regains its banked B2/B3 normal forms as direct leaf targets
(`lean/scratch/b-family-bank/`).  The compatibility theorem
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector` is
source-clean and is not a separate leaf; it now delegates directly to
`false_of_capSourceThirdCanonicalRowSurface`.  The public
`false_of_freshCanonicalRowOverride`, fresh-third classifier, and one-sided
six-center route remain checked compatibility material, but no longer narrow
the live frontier.  This document records the consolidated source frontier
only; no focused Lean 4.27 elaboration or fresh kernel/blueprint verification
is claimed here.

Cardinality scopes must not be conflated.  The all-large tri-apex parent has
cap floor `(6,6,6)` and therefore carrier floor `|A| ≥ 15`; its first
cardinality search order is `15, 16, 17, 18`.  The F-Γ cap-source target is a
strict subbranch whose surface additionally assumes the first indexed cap has
cardinality at least eight, giving floor `(8,6,6)` and `|A| ≥ 17`.  Thus the
17-point F3 incidence shadow below does not raise the parent theorem's lower
bound from 15, and a 15- or 16-point parent survivor need not instantiate the
cap-source packet.

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
  ammunition for the F encoding.  The production five-center coordinator now
  closes the branch where the second collision blocker bisects the explicit
  first-fiber outside pair, using ordered-cap uniqueness.  The former strict
  non-bisector child is source-clean.  Its former compatibility proof used the
  universal selected-row escape to supply a carrier point outside both
  collision rows and the cap-source row.
  That selected row is used only to certify carrier membership; the row used
  by the override is the canonical selected four-class at the escaped point.
  A second point outside both collision pairs is installed with
  `CriticalShellSystem.overrideAt`, and the frontier, residual, collision,
  localized-cycle, and cap-source packets are rebased to the overridden
  system, then invoked the fresh-third blocker terminal.  The live coordinator
  now stops at the common cap-source/blocker-multiplicity target: it retains
  the original cap-source surface together with the already-produced
  `GeometricMultiplicityResidual`, and therefore all three blocker-fiber
  constructors.  On the enlarged first-fiber
  constructor, the checked
  `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` decomposition
  does not create a useful deletion leaf, because the deletion disjunct is
  already a consequence of the cap-source witness.  The smallest
  terminal-reaching incidence target for its cycle-aligned disjunct is to put
  both `Q.source` and `Q.otherOutsidePoint` in the cap-source selected support.
  Together with the cycle packet's retained `P.source₁` hit, these memberships
  close through
  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`.  Computational work
  on this arm should therefore search for the missing outside hit(s), not for
  another derivation of the five-center deletion residual.  The six-row
  algebraic collision alternative remains the broader all-arms route.
  A completed producer audit (2026-07-31) found no production constructor for
  `Census554.GeneralCarrierBridge.ShellMetricCoreAlternative` from the live
  cap-source packet.
  The only concrete constructor is the scratch theorem
  `shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding` in
  `scratch/atail-force/uniform-live-metric-core-producer/UniformProducerBoundary.lean`;
  its `OrderedFrontSchemaEmbedding` antecedent requires five-role cyclic order
  and positive row incidences that no production theorem currently supplies.
  The cap-source packet supplies omission data instead.  Therefore a
  `FaithfulCarrierPattern` adapter alone does not advance the frontier: this
  fallback needs an ordered-schema occurrence theorem or a direct
  `ShellMetricCoreAlternative` producer.
  The override and the later legacy
  sub-classifiers are not load-bearing, but the residual itself is.  The
  cardinal-minimal
  17-point incidence shadow in
  `scratch/f3-unbounded-counting-audit/REPORT.md` satisfies all remaining
  abstract F3 constraints and extends unboundedly; this explains the failure
  of the superseded direct fixed-slot/incidence route.
  The v17 mirror-interleaving six-point cut refutes the exact frozen v16 local
  survivor, but the resumed 100,000-cut outer ledger timed out fail-closed.
  The smaller local/critical/reuse-second projection completed at 5,933 cuts
  with an 18-class survivor.  Its exact full-coordinate probe timed out
  fail-closed at 600 seconds; exhaustive four- and five-class subset mining
  found no UNSAT core, while the complete six-class traversal retained 205
  solver-`UNKNOWN` cases and no validated core.  The custom v18 projection
  with both a global K4 row and a minimal cover at `q` returned an induced
  necessary-condition survivor after 14,740 cuts, but that survivor separates
  `cover_q` from `b1` and is incompatible with the subsequently extracted
  source-faithful Lean equality.  The v19 projection asserts
  `cover_q = b1`, derives equality of the two unique-row supports through
  existing coherence, and excludes the escape center from `b1`, `b2`, and
  `bs` in both continuation arms.  Its schema rejects v18 checkpoints, and
  the bounded self-test plus replay-metadata tests pass.  The resumed v19
  round returned `ALIVE`, with epistemic status
  `INDUCED_NECESSARY_CONDITION_ONLY`, after 20 outer calls, 14,740 resumed
  cuts, 2,434 newly banked cuts, and 17,174 total cuts.  Its survivor has an
  exact strict-Kalmanson metric on the induced quotient; it is neither a
  Euclidean countermodel nor an UNSAT result.  A source-faithful replay of
  that exact 22-class survivor generated 37 positive quotient-distance
  equations, 440 strict-convexity support assertions, and four gauge
  assertions.  Z3 reached its hard timeout and the probe returned
  `UNKNOWN_FAIL_CLOSED`; this adds no Euclidean realizability or
  nonrealizability conclusion.  A direct equality-closure scan also found no
  `DuplicateCenterCore` instance in the 62 recorded true row equalities.
  A separate fixed-`n = 17` Boolean CEGAR lane now generates checked
  unordered-edge equality closure and duplicate-center nogoods dynamically,
  including the exact 14-literal Phase-3 motif.  Five focused tests and both
  smoke SAT/UNSAT gates pass, with the smoke UNSAT proof checked by DRAT
  replay.  The exact fixed-17 QF_FD-to-CNF lowering took 9.34 seconds and
  produced 116,393 variables and 1,435,449 clauses (31.4 MB).  CaDiCaL
  returned timeout/UNKNOWN after 600 seconds in its default mode and after
  300 seconds with `--sat -n`; the 567 MB interrupted production DRAT stream
  is incomplete and non-certifying.  Even a certified fixed-17 result would
  address only the first cardinal stratum: the cap-source leaf gives the
  profile bound `8 + 6 + 6 - 3 = 17`, while its abstract incidence shadow
  admits `17 + k` extensions.  None of these results closes the remaining
  common cap-source/blocker-multiplicity obstruction; see the current
  K-A-LIVE checkpoint in
  `docs/closure-matrix-2026-07-09.md`.
- **The generic cap classifier is now a historical diagnostic, not a live
  split** — `exists_blockerCenter_mem_capInteriorByIndex` localizes each actual
  blocker separately to some strict indexed cap, but the negative
  `FreshThirdBlockerFiber` packet does not prove that the fresh blocker differs
  from the cap-source blocker, that either fresh source lies outside the
  blocker's cap, or that either fresh source belongs to the cap-source row.
  Its positive incidence only places the two fresh sources in one another's
  own selected rows.  Even a joint same-cap localization lemma would therefore
  leave those row-membership and distinctness fields open; the needed producer
  must couple cap localization to the cap-source row rather than merely
  classify the two centers independently.  The sorry-free scratch theorem
  `SevenBranchClassifier.lean` now typechecks an exhaustive seven-way split:
  equal blockers; a cap-source-row miss; one cross-row hit; two hits with
  different cap indices; same-cap with the first source inside; same-cap with
  only the second source inside; or the already-closed positive alignment
  branch.  The v5 necessary-condition probe found exact SAT witnesses for the
  equal-blocker, different-index, first-inside, and second-inside branches;
  found strict SAT-witness subcases for both the row-miss and one-hit branches
  while their cold unrefined runs timed out; and returned UNSAT only for the
  positive alignment branch already closed in Lean.  Those SAT subcases imply
  SAT for their respective parent branches.  These are models of an explicitly
  incomplete projection, not carrier countermodels or Lean refutations.  The
  classifier described what would be needed after the former fresh-third
  split, but it did not narrow the common cap-source/blocker-multiplicity
  obstruction and is no longer on the coordinator interface.
- **The equal-blocker mutual branch now has one checked terminal** —
  `commonCollisionEndpointOmission_or_complementaryMembership` gives an exact
  split for the two collision pairs.  In the complementary arm, equal actual
  blockers identify the two selected supports; the two distinct cap sources
  and all four pairwise-disjoint collision endpoints would then be six
  distinct members of one support of cardinality four.
  `false_of_equalBlockers_complementaryMembership` formalizes this
  contradiction on the production spine.  Only the common-endpoint-omission
  arm still entered the generic fresh-third terminal from this caller.  This
  remains a checked subbranch of a compatibility route, not a live frontier
  split.
- **The former one-sided deletion leaf exposes six synchronized centers** —
  `sixCenterDeletionSurvivalPacket_of_oneSided` produces, in either deletion
  arm, exact-four survival at the two collision blockers, all three robust
  Moser apices, and the surviving cap-source blocker, with the six centers
  pairwise distinct.  Each packet component directly instantiates
  `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`, so
  materializing the six deleted-carrier four-rows is mechanical and is not the
  missing mathematics.  The closest checked terminal is
  `U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses`; it still
  needs one fixed U3 audit frame and confinement of all six rows to a common
  eight-point `U5BoundedSupport`.  No theorem-bank declaration derives that
  confinement from deletion survival alone.  This identifies the first
  missing adapter for that historical route, but the route is no longer a
  separate obligation because its cap-source witness already feeds the common
  surface.
- **Cross-blocker equality needs a global bridge, not a local alias
  contradiction.**  A source audit of all four
  `CrossBlockerCoincidence` aliases shows that each alias supplies at most one
  direction of the reciprocal row incidence needed by the existing
  duplicate-center terminals; the localized and mutual-omission packets add
  only negative incidence.  The exact follow-up in
  `scratch/atail-force/cross-blocker-euclidean-audit/` gives a checked rational
  coordinate witness for each of the `4 × 3 = 12` alias/residual branches in
  the encoded named Euclidean projection.  This is not a model of the complete
  Lean hypotheses.  It rules out only the proposed local route: closure must
  use an omitted global consequence such as common support/frame confinement,
  full cap order, carrier-wide K4/minimality, or the no-`(m,4,4)` hypothesis.
- **The consolidated metric question (Q)** (dead-ends): the global
  per-vertex-K4 forced-repeated-circle incidence is irreducibly metric /
  ∃ℝ-flavoured. The plan does not attempt to decide (Q) wholesale; it
  attacks the 18 live leaves' finite case structure, where each leaf's
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
| 1 | A-core (6) | Partition T = {z_d} ∪ I_u ∪ I_v, |I_u| = |I_v| = 2 disjoint; β-pattern with β(x) = a₁ iff x ∈ Cl(a₁,r); CD overlap ≤ 2; cap-growth trichotomy; leaf deltas A2–A8 (β(source) placement × N_u/N_v row-heaviness) | Encoder must find SAT on the 15-point witness's incidence type restricted to the layers it realizes; leaf-delta consistency: A3–A5 and A7–A8 deltas mutually exclusive by construction |
| 2 | C-core (2) | Same skeleton as A (Γ₂ = {z*} ∪ I_u ∪ I_v); C1 placement trichotomy; C2 explicit collision arm | Same witness gate; C1 trichotomy exhaustiveness checked against A's version |
| 3 | E (1) | Cover bound |A| ≤ 4|N|; cap-sum identity; derived n ≥ 15; unique-four shell cover as functional map x ↦ Row(x) into 4-blocks; directed-omission arm choice; E9 low-hit ≤ 2 clauses | Reproduce the kernel-checked low-hit consumers' arithmetic on a hand-built 15-point pattern |
| 4 | F-Γ (2) | Γ restated in `lean/scratch/f3c-redundancy-bank/F3cRedundancy.lean`; pairs-disjointness; shell ∩ cap = sources; deltas for cross-blocker coincidence and the common cap-source surface together with the blocker-multiplicity residual. The former fresh-third, one-sided-deletion, and aligned/nonbisector branches are compatibility adapters | Fixed-slot completeness is unavailable: a 17-point shadow and an unbounded four-point-block extension survive. Route the remaining leaves through geometric/global bridges, not a closed named universe |
| 5 | D-R (2) | Two disjoint selected 4-classes K₁ ∩ K₂ = ∅; no-five-row at a₂; D2's five role-swap equalities S ↔ S′ | Verify the five syntactic role/cap aliases under the double renaming; do not assert `S′′ = S` or packet equality |
| 6 | D-E (2) | Exact-five class; D3 distinct-centers vs D4 common-center arm; D4's exactly-2-on-bisector cardinality | D4's bisector-2 clause must be consistent with the banked `b1_bisectorSet_eq_pair` mechanism (Dumitrescu L1 bound ≤ 2) |
| 7 | B (3) | B2 canonical-row forcing + mutual-omission survival; B3 removable-iff-survival (`lean/scratch/b-family-bank/`). The live B1 leaf does not currently expose the bank's support equality, two cross-memberships, and exact two-point intersection prerequisites | Refute a third-bisector configuration; classify B1 as ingress-missing rather than importing unavailable bank consequences |

Validation status 2026-07-28: A, C, E, D-R, D-E, and B encoders pass their
smoke gates. F-Γ has no sound fixed-slot encoder; its separate unbounded
counting audit is the applicable gate result.
Rationale for the order: A-core is the largest single lever (6 leaves close
or die together on the package verdict before any leaf delta is touched);
C amortizes A's encoder; E is the most counting-flavoured (best UNSAT
odds per effort); F-Γ has the most pre-built structure; D and B are
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
  encoding blocker. DONE 2026-07-28: all gates pass; verdict = SAT on all
  8 runs (base, base+P, five leaf deltas, A1) at the seed layer —
  `census/frontier-packages/a_core/RESULTS.md`. Next per §4: CEGAR
  iteration 2 (add omitted families — E8 bisector localization, E5 radius
  uniqueness, survival arms) before Layer-2 type enumeration; (EQ4)
  transitivity landed as spec v1.1 (validated `8f27d00a`).
  Iteration 2 spec'd as v1.2 §9 (`dc2e7d65`) and dispatched 2026-07-28:
  families (E8a–d), (E5a/b), (DEL3) |Δ|=2 under 𝔓, (N8) n≥14 from the
  F chain, (FB) frontier-pair selector, (CD4)/(CD5) B-set structure,
  (R1'), gamma cap atoms; four new UNSAT probes. DONE (`9e8ed3d5`):
  verdict still SAT ×8; base+P now pins |Δ|=2 exactly.
  F-Γ note: FrontierLedger's `census/f_gamma` (convo #2455–#2456) found
  fixed-slot completeness UNAVAILABLE for F-Γ (unbounded n=17+k family
  survives) — session-2 F work must route through their lane, not a new
  fixed-slot encoder.
- **Session 2**: C, E, F-Γ instantiations + smoke gates + verdicts (encoder
  amortized); begin leaf-delta runs for whichever package returned UNSAT.
  C and E DONE 2026-07-28 (specs `d7fedf4e`, `75e9c6a0`; encoders
  `6e2b82e5`, `ff02082b`): C-core SAT ×3 (base 920/19727, base+C1,
  base+C2) with all gates + 8 orchestrator probes passing, BM6 ruled
  not-carried (no (P2) analogue in the C doc — unsound to assert); E SAT
  ×3 (551/18080) as its spec expected — the 15-point shadow satisfies
  the counting core, G-SHADOW witness gate passes with a faithful
  point-by-point mapping, five UNSAT probes DRAT-verified. F-Γ remains
  FrontierLedger's lane. New third lane green-lit at design level: the
  P97-level bounded counterexample search (shell-hypergraph census,
  k-parameterized, banked theorems as pruning rules, census-554 per-cell
  engine as chassis; refutation branch is self-certifying, k=3 arm =
  end-to-end positive control). Design doc next.
- **Session 3**: D-R, D-E, B; full live-frontier triage matrix. DONE
  2026-07-28: D-R SAT ×3, D-E SAT ×4, B2/B3 plus pinned arms SAT; all
  negative smoke probes DRAT-verified. B1 is
  `OMITTED_PREREQUISITE_INGRESS_MISSING`, not an official SAT verdict.
  Independent cross-audits passed; D-E's one composite provenance label was
  corrected without changing its CNF. The live frontier is now 20 after the
  F3 split; see
  `census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md`.
- **Sessions 4+**: no package produced a live-leaf UNSAT core for replay.
  Continue with the Phase-3 exact-shell census and independently certified
  realization/infeasibility work on survivors; add CEGAR clauses only after
  proving the corresponding metric/global consequence. Kernel spine
  re-census after every landing batch; convo post per checkpoint. Phase-3
  gates are now green, including exact tiny enumeration, terminal DRAT,
  resume/tamper, and interruption controls. The first bounded runs are
  `PARTIAL`: `(3,9)` has 100 raw / 29 canonical OPEN survivors and combined
  `(4,10,(4,4,5))` has 100 raw / 100 canonical OPEN survivors. This rules out
  treating more Layer-1 enumeration by itself as the next closing step; the
  next compute consumer is the realization arm, with numeric failures kept
  `UNRESOLVED` unless independently certified.
  The original 100-model `(4,10,(4,4,5))` artifact later became stale after
  the rule-bank hash changed. It was regenerated under the current bank as
  `k4-n10-profile-445-combined-bounded100-current-20260728`; strict artifact
  verification passes and all 100 canonical digests agree with the original
  prefix. The fail-closed realization adapter expands this current prefix into
  all 24 cap-compatible hull orders per survivor: 2,400 deterministic local
  leaves across 24 shards.  Their current screened outcomes and trust scope
  are recorded in `census/p97_search/PHASE3-RESULTS.md`; the initial
  all-`UNRESOLVED` state is historical only. `flux.local` is no
  longer in the compute plan after a crash; the campaign is local-only with at
  most 24 single-threaded solver workers.

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
