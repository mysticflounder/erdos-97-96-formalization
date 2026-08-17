# Post-V49 global-producer closure plan

Status: **active execution plan, not a closure claim** (2026-08-17).

## Starting facts

The V49 V6--V9 exact-17 waves are source-valid finite banks and
SAT/replay-checked artifacts. They did not close a production `sorry`: their
Lean declarations remain private successor-chain nodes, and their receipts
explicitly record `exact17_closure = false`, `lean_closure = false`, and
`universal_lift = false`.

The V8 bookkeeping discrepancy is resolved. The published V8 suffix is a
68-clause bank generated from the **17 size-eight supports in the V7 source
mine**. The V8 SAT model has a separate postsolve mine with **16
inclusion-minimal supports** (20 unique supports; size distribution
`8:4, 10:9, 12:2, 14:1`). These are different artifacts with different
roles; neither count is being substituted for the other.

The final V49 local wave, V9, was SAT and independently replayed with zero
clause failures. It produced three additional size-eight diagnostic
supports. This is evidence that the local two-Kalmanson refinement family is
not converging to a finite exact-17 UNSAT certificate. No further V49 local
motif wave is authorized without a new source-level consumer and a measured
reduction in the live obligation frontier.

## Target

Produce an import-reachable, general-cardinality consumer bridge that
feeds one of the adjacent live terminals
`false_of_capSource_firstFiber_outsidePairDeletionExactRows` or
`false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`.
The B3/B4 terminology names the four retained-pair cuts, not four currently
named spine declarations. The blocker-image cardinality route is not the
immediate target:

* `Problem97.ATailMinimalUniqueFourCover.card_le_four_mul_notRobustCenters`
  is already source-proved and on the proof spine. It is the import-reachable
  form of the older scratch theorem
  `Problem97.MDBlockerClosed.card_le_four_mul_card_blockerImage`.
* The existing `FiveSurvivorExactRowsBoundary.toFaithfulCarrierBoundary` and
  `FiveSurvivorFaithfulCarrierBoundary.toActualBlockerSixCenterBoundary`
  adapters already supply the generic five-to-six-center lift. The
  source-clean `collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual`
  packages the first-fiber version, but it is off-spine and has no contradiction
  consumer.
* The missing work is therefore a source-level consumer bridge: preserve the
  first-fiber source witness, blocker-in-cap membership, and role identification
  while converting the faithful six-center boundary into one of the two live
  terminal interfaces. The existing
  `physicalRows_inter_retainedPairs_card_le_one` specialization remains only a
  diagnostic ≤1 cut; it is not the missing producer.
* The proposed global overlap-two census and three-pin quadratic constraints
  are not yet usable: at exact `n = 17` the former is vacuous, and the current
  Boolean `SourceModel` has no numeric atoms for the latter. They remain
  conjecture-generation inputs, not production clauses.

## Execution stages

1. **Ingress audit.** Record the exact live residual, available minimality,
   deletion-robustness, unique-four-cover, and pinned-multiplicity hypotheses;
   name the immediate terminal consumer and identify the first missing
   antecedent. The current audit identifies the missing theorem as forcing one
   of `P ⊆ B3`, `P ⊆ B4`, `Pρ ⊆ B3`, or `Pρ ⊆ B4`, or an equivalent direct
   lift of the five-center bound.
2. **Consumer bridge.** Build a small import-reachable P97 module that
   consumes the existing faithful six-center adapter and supplies the missing
   first-fiber role/source data to one live terminal. Do not introduce a
   `sorry` or a local axiom. If the terminal requires a genuinely new
   cap-wide theorem, stop with that precise contract failure rather than
   weakening the theorem or creating an orphan producer.
3. **Consumer check.** Elaborate the bridge and its intended terminal in a
   targeted build. Verify import reachability, the fresh blueprint edge, and
   transitive axioms. A green helper module without a spine edge is not proof
   progress.
4. **Only then compute.** If the bridge supplies a complete source-faithful
   finite predicate, run one bounded CEGAR/PIQD check against it. SAT is
   theorem-mining evidence; UNSAT is promotable only after exact replay and a
   Lean coverage theorem. Do not launch a successor merely because a V49
   model remains SAT.
5. **Close or reclassify.** A successful bridge must either reduce the
   on-spine frontier or be recorded as a reusable producer with its missing
   consumer stated explicitly. Update the closure matrix and blueprint in the
   same checkpoint.

## Success criterion

The first meaningful checkpoint is a kernel-checked, import-reachable theorem
whose hypotheses are supplied by the live residual and whose conclusion is
accepted by one of the adjacent live consumers. Until that theorem exists, the V49
banks remain regression assets and exact-17 is still open.

## Execution checkpoint (2026-08-17)

The documentation checkpoint was committed and pushed as `2c7b88a1`. The
targeted `TwoSourceClosure` build completed successfully; its only relevant
diagnostic is the expected `sorry` at
`false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`.
The proof-blueprint search confirms that
`card_le_four_mul_notRobustCenters` is on-spine while that terminal remains a
live sorry. The read-only bridge search also confirmed that the existing
five-to-six-center adapter is source-clean but off-spine; no consumer currently
converts its faithful boundary into a live terminal. No new helper has been
promoted merely for being compilable. The target is now explicitly
consumer-first: preserve `FirstFiberCapSourceWitness`, blocker-in-cap
membership, and role identity while attempting that terminal bridge.

## Candidate direct bridge discovered

The live sorry
`false_of_capSource_firstFiber_outsidePairDeletionExactRows` already has all
the inputs needed by the source-clean theorem
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`, except for its
four-way outside-pair residual. After splitting
`deleted_eq_outsidePoint`, the supplied `outsideExactRows` is exactly the
first constructor: use `Or.inl ⟨outsideExactRows⟩` for `deleted = Q.source.1`,
and `Or.inr (Or.inl ⟨outsideExactRows⟩)` for
`deleted = Q.otherOutsidePoint`. Then call the existing terminal with the
unchanged source, omission, and `hexactRows` hypotheses. This must be tested
by the owner of the foreign-dirty
`TwoSourceFirstFiberCollision.lean`; no shared-file edit is being made here.
