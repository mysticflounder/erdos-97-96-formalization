# Fresh-third support/radius adapter audit (2026-08-02)

## Reachability check

The scratch import
`Erdos9796Proof.P97.ATail.FrontierLiveClosure` was checked with
`lake env lean ../scratch/freshthird_api_check.lean` from the Lean root.  The
declarations below elaborate through the current import graph; no production
files were edited.  The only output was the expected missing module-docstring
warning.

## Existing, source-clean APIs

* `Problem97.ATailBlockerMultiplicityGeometry.FreshThirdBlockerFiber`
  (`ATail/BlockerMultiplicityGeometry.lean`) carries the two fresh carrier
  vertices, equal blocker vertices, all endpoint exclusions, and mutual
  selected-shell support.  It has no explicit radius field.
* `TwoSourceExactCollisionRowsTerminal.CapSourceThirdCanonicalRowWitness`
  (`ATail/FrontierLiveClosure.lean`) carries cap-card/interior and exclusions,
  the source's own exact-four shell, and both `CrossPairDeletionView`s.  It
  does not state membership in a `SelectedClass` at `S.oppApex1`, so it cannot
  by itself supply a radius relative to that apex.
* `FreshThirdCrossRowHit` says the fresh pair lies in the selected shell of a
  cap source and that the cap-source center differs from the fresh center.
* `freshThirdEqualCenterExactFourRow_of_hits` is already the minimal useful
  support/radius adapter.  Given a two-source cap packet, a fresh fiber, two
  cross-row hits, and equality of the two cap-source centers, it proves
  `FreshThirdEqualCenterExactFourRow`.  Its proof derives equality of the two
  cap-source shell radii with `CriticalFourShell.support_eq_radius`, then
  equality of supports via `support_eq`, and finally the exact four-point
  support rows.  It is source-clean (no `sorry`).
* `false_of_two_freshThirdCrossRowHits_distinctCenters` is source-clean and
  eliminates the alternative in which the two cap-source centers are
  distinct.  Thus the both-hit residual arm can be reduced to the equal-center
  exact-four-row packet above.
* `Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
  has exact type
  `HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
   w ∉ (H.selectedAt q hq).support` for `hq : q ∈ A`.  This is the
  source-clean bridge from a `CrossPairDeletionView`/survival statement to
  shell non-membership (and conversely).
* `Problem97.mem_selectedClass` is the source-clean characterization
  `q ∈ SelectedClass A s d ↔ q ∈ A ∧ dist s q = d`.

## Radius limits and recommended use

The fresh fiber's mutual support plus `blockers_eq` gives a fresh-pair shell
radius equality by the same `support_eq_radius` calculation used in the
distinct-center obstruction.  This is a reusable primitive, but it is **not**
a common radius with either cap-source shell.

The cap-source witness does not contain the missing
`dist S.oppApex1 source.1 = commonRadius` premise.  Therefore no honest
source-clean theorem can infer `source ∈ SelectedClass D.A S.oppApex1 r` (or a
common cap-source radius) from `CapSourceThirdCanonicalRowWitness` alone.
The existing private producer
`exists_two_firstFiberCapSourceWitness_of_commonRadius` is the correct route:
it takes the explicit two-point `SelectedClass` cardinality and the exclusions
`commonRadius ≠ radius`, `commonRadius ≠ ρ`, then returns both witnesses.

Recommendation: make the normalized residual consumer reuse
`freshThirdEqualCenterExactFourRow_of_hits` after the distinct-center arm is
removed.  Do not add a duplicate wrapper merely to project its radius/support
facts; add a named projection only if a downstream interface genuinely needs
that narrower shape.  Any attempted “witness ⇒ common radius” adapter without
an explicit apex-radius hypothesis would be an unsound strengthening.
