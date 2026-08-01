# First-fiber bridge audit (2026-07-31)

## Result

No source-clean route from `FirstFiberOverlapDescent` currently proves either
the two direct terminal leaves or the aligned/nonbisector compatibility target.
The first-fiber module is kernel-clean, but it stops at a residual
disjunction; the live target immediately delegates to the still-unproved
cap-source obstruction.

## Relevant checked lemmas

`Problem97.ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour`
(`FirstFiberOverlapDescent.lean:156-190`) identifies the first collision shell
as `{P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint}`.
`exists_two_firstFiber_points_omitted_by_row` (`:192-274`) and
`false_of_firstFiber_explicit_overlap_card_ge_three` (`:772-803`) only give the
at-most-two overlap contradiction when three of those four points are known to
hit the source row.  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`
(`:804-897`) needs both Q off-cap points plus one P endpoint in the source row;
`false_of_firstFiber_twoOutsideHits_of_capCenter` (`:898-957`) needs both Q
points plus the source center in the first cap.

The strongest cycle result,
`firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`
(`:640-737`), requires `hcenters`, omission disjunctions `homitP` and
`homitPρ`, both localized common-deletion/cycle packets, and two robust centers.
It concludes only
`FirstFiberCycleAlignedResidual ∨ FirstFiberCollisionFiveCenterDeletionResidual`.
The aligned residual says P.source₁ and Pρ.source₁ hit the source row, their
partners are omitted, at least one Q point is omitted, and the cycle-selected
sources match; it does *not* supply the three-hit premise needed by the local
contradictions.  The deletion residual is only a five-center survival packet;
no checked consumer turns it into `False` in this target.

`secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (FrontierLiveClosure
`:7751+`) is source-clean and proves the nonbisector inequality from ordered-cap
uniqueness, but that inequality is not consumed by any source-clean terminal.

## Direct live leaves and exact dependencies

`TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`
(`FrontierLiveClosure.lean:7452-7456`) has the full section packet
(`hρne`, both exact-four hypotheses and cap-intersection equalities, tri-apex
residual `T`, disjoint source pairs, distinct blockers, two localized deletion
packets/cycles) plus
`hcoincidence : CrossBlockerCoincidence P Pρ` and
`hresidual : GeometricMultiplicityResidual P Pρ`; body is `sorry`.

`false_of_capSourceThirdCanonicalRowSurface`
(`:7491-7495`) has the same section packet plus
`hcapSource : CapSourceThirdCanonicalRowSurface P Pρ` and the same
`hresidual`; body is `sorry`.

The compatibility target
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
(`:11047-11069`) ignores `hsingleton`, `haligned`, and `hsecondNe` in its
body.  It packages `hsource : FirstFiberCapSourceWitness ...` as
`⟨hsource.1, source, hsource.2⟩`, packages the fresh Q arm as
`Or.inr (Or.inl ⟨Q⟩)`, and calls
`false_of_capSourceThirdCanonicalRowSurface`.  Therefore it can become
source-clean only after that direct cap-source leaf is proved; the extra
first-fiber/alignment/nonbisector hypotheses do not bridge the missing global
contradiction.

Similarly, `false_of_crossBlockerCoincidence` is not reachable from the
first-fiber cycle lemmas: those lemmas never produce any of the four center
equalities in `CrossBlockerCoincidence`.

## Axiom audit

`proof-blueprint axioms` reports:

* `ATailFirstFiberOverlapDescent.firstFiber_shell_eq_explicitFour`: only core
  axioms (`propext`, `Classical.choice`, `Quot.sound`).
* `ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`:
  only the same core axioms.
* `TwoSourceExactCollisionRowsTerminal.secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber`:
  only the same core axioms.
* `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`:
  core axioms plus unapproved `sorryAx`.
* `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`:
  core axioms plus unapproved `sorryAx`.
* `TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`:
  core axioms plus unapproved `sorryAx` (transitively through the cap-source
  leaf).

### Route/blocker

The exact currently viable route is: use the checked first-fiber lemmas to
derive an aligned/deletion residual, then supply a *new* global consumer for
that residual (or prove one of the two direct terminal sorries). Existing
first-fiber/cycle/alignment statements alone do not close either terminal.
