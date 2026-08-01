# Local bridge audit: retained cap-source collision terminals

Scope: source inspection only (no production Lean edits), 2026-07-31.  Files
audited: `FrontierLiveClosure.lean`, `TwoCollisionGlobalProducer.lean`,
`BlockerMultiplicityGeometry.lean`, `RetainedCollisionCapLocalization.lean`,
`FirstFiberOverlapDescent.lean`, and the RetainedMatching/ExactFour theorem
banks.

## Target theorem and immediate dependency

In `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11047-11069`,
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
accepts `Q`, `source`, `hsource`, `hsingleton`, `haligned`, and `hsecondNe`, but
its body ignores `hsingleton`, `haligned`, and `hsecondNe`.  It converts
`hsource : FirstFiberCapSourceWitness ...` to
`CapSourceThirdCanonicalRowSurface` and calls
`false_of_capSourceThirdCanonicalRowSurface` with residual
`Or.inr (Or.inl ⟨Q⟩)`.  The called theorem is a load-bearing `sorry` at
`FrontierLiveClosure.lean:7491-7495`.

The adapter at `FrontierLiveClosure.lean:11076-11095` obtains the ignored
nonbisector fact source-clean from
`secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (the theorem starts at
`FrontierLiveClosure.lean:7751`), but this fact still does not enter the target
proof.  The singleton fact can be proved by the private
`firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned` development
around `FrontierLiveClosure.lean:9268-9325`, again without changing the target
terminal.

## What the cap-source witness actually supplies

`FirstFiberCapSourceWitness` is an abbreviation for
`CapSourceThirdCanonicalRowWitness` (`FrontierLiveClosure.lean:7626-7628`).
The witness contains the cap-card lower bound, source in strict cap interior,
source outside all four collision sources, center inequalities to both blockers
and both apices, own selected shell support/cardinality four, and two
`CrossPairDeletionView`s.  The private bridge
`capSourceSurface_of_firstFiberWitness` (`FrontierLiveClosure.lean:8102-8106`)
is source-clean and packages this witness as the surface consumed by the
terminal.  Thus the positive surface packet is available, but no contradiction
follows from it without a proved residual terminal.

`CapSourceThirdCanonicalRowSurface` is defined in
`TwoCollisionGlobalProducer.lean:547-577`; its residual partner is
`GeometricMultiplicityResidual` (`BlockerMultiplicityGeometry.lean:337-350`).
The direct surface terminal remains `sorry`, and the alternate direct terminal
`false_of_crossBlockerCoincidence` is also `sorry` at
`FrontierLiveClosure.lean:7452-7456`; it requires a
`CrossBlockerCoincidence` plus a `GeometricMultiplicityResidual`.

## Source-clean positive/negative facts nearby

* `false_of_freshThird_sameCapCrossRowAlignment` is source-clean
  (`FrontierLiveClosure.lean:7501-7570`).  It derives a two-point overlap in
  two distinct cap-centered selected-four supports and contradicts the
  outside-overlap card bound.  No inspected producer derives its alignment
  hypothesis from `FirstFiberCapSourceWitness` and a fresh fiber.
* `FirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour`
  (`FirstFiberOverlapDescent.lean:154-187`) identifies the first collision
  shell support with the two collision sources plus a fresh outside pair.
  The subsequent source-clean descent theorems
  `firstFiber_firstSourceHit_or_fiveCenterDeletion`
  (`FirstFiberOverlapDescent.lean:386-431`),
  `firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion`
  (`FirstFiberOverlapDescent.lean:528-633`), and
  `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`
  (`FirstFiberOverlapDescent.lean:640-737`) produce hit/omission or five-center
  deletion disjunctions.  They do not construct a
  `GeometricMultiplicityResidual` contradiction from the target packet.
* `RetainedCollisionCapLocalization.lean:129-151,153-170,172-304,306-412`
  contains source-clean cap separation, source-in-cap, row-center localization,
  common-blocker interior localization, and exact shell/interior intersection
  lemmas.  These are stated for `RetainedRadiusCollision`; no inspected adapter
  transports them to `RetainedInteriorBlockerCollision` in the target.
* `RetainedMatchingSourceReturnRadiusSplit.lean` supplies exact-four shell/radius
  partitions and omission facts, while
  `RetainedMatchingCommonDeletionCycle.lean:95-138,155-245,358-465` supplies
  blocker inequalities and matching-cycle normalization.  These structures are
  not definitionally the target `P/Pρ` pair, and no direct cap-source residual
  producer was found.
* `ExactFourRobustCapExpansion.lean:1085-1116,1313-1363,1369+,1413-1445`
  provides source-clean exact-four/positive-class and robust-cap producers, but
  likewise no bridge to the target surface-plus-residual terminal.

## Audit conclusion

No source-clean bridge was found from the target hypotheses to either direct
terminal.  The live target is a compatibility wrapper: `hsource` supplies the
surface, `Q` supplies the residual arm, and the contradiction is delegated to
the still-unproved `false_of_capSourceThirdCanonicalRowSurface`.  The
singleton-radius, alignment, and second-blocker-nonbisector hypotheses are
currently bookkeeping only.  Promotion to a source-clean bridge requires a
new proof of the surface terminal or a source-clean producer/consumer for
`GeometricMultiplicityResidual`; neither is present in the audited banks.
