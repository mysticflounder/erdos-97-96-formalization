# FreshThird normalized residual branch audit (2026-08-03)

## Scope

Audited the `firstNonHit` and `secondNonHit` constructors of
`FreshThirdNormalizedResidualCase` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` (definitions around
9148–9240; intended consumer `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
around 9806, whose body is still `sorry`).  The question was whether either
branch already has a source-faithful contradiction/producer in
`FrontierLiveClosure` or imported modules.

## Exact payloads

`FreshThirdCapSourceNonHit` has only two surviving constructors after
`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (~9182):

| branch | payload | exact consequence | nearest reusable fact | status |
|---|---|---|---|---|
| `firstNonHit` | `data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q` | either `centerAt C.firstSource = centerAt Q.source₁` plus exact selected-shell support equality, or one of `Q.source₁/Q.source₂` is omitted from `C.firstSource`'s selected support and `HasNEquidistantPointsAt 4` survives its deletion at `C.firstSource` | `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` (SurvivalCover.lean:48), `cross_deletion_survives_iff_not_mem_selected_support` (CriticalPairFrontier.lean:781), `selectedFourClass_survives_erase_of_not_mem` (DeletionRobustness.lean:40) | no `False` consumer |
| `secondNonHit` | same packet with `C.secondSource` in place of `C.firstSource` | identical, with no additional asymmetric hypothesis | same three support/deletion lemmas | no `False` consumer |

The exact `deleted_eq`, `deleted_not_mem`, and `deletion_survives` fields are
already the conclusion of the support/deletion equivalence (or its direct
survival corollary), so those lemmas do not strengthen the packet.  They give
one endpoint deletion at one cap-source center, not full deletion robustness,
the opposite source's deletion, or a metric contradiction.

## `sameBlocker` arm

`center_eq` and `support_eq` are already supplied by the constructor.  Applying
`selectedSupports_eq_of_actualBlockers_eq` merely reproves `support_eq` when the
actual blocker-center equality is available.  Since `FreshThirdCrossRowHit`
requires unequal centers, this arm is an equal-blocker fiber and does not
contradict the `FreshThirdBlockerFiber` conditions.  The Q source-membership
fields can transport to the equal support, but no existing theorem turns that
transport into `False` without extra cap placement/common-radius/ordering data.

## `sourceRowOmission` arm

`deleted_eq` identifies `Q.source₁` or `Q.source₂`; `deleted_not_mem` and
`deletion_survives` are exactly the selected-support omission/deletion-survival
pair.  Existing consumers requiring two cap-source witnesses, mutual
cross-deletion, five/six robust centers, or a first-apex/radius-class packet do
not match this one-sided witness.  In particular, the six-center deletion
survival packets require deletion of one cap-source by the other, not deletion
of a Q endpoint at a cap-source center.

## Nearby source-clean routes checked

* `nonempty_freshThirdCapSourceInteraction_of_noAlignment` (~9594) and
  `nonHit_of_not_crossRowHit` (~9182) only produce the same-blocker or
  source-row-omission constructors (or a cross-row hit).
* `false_of_freshThird_sameCapCrossRowAlignment` (~8099) needs a stronger
  same-cap packet (both centers in one cap, unequal, Q sources outside that
  cap, and both Q sources in the source shell).
* `false_of_two_freshThirdCrossRowHits_distinctCenters` (~9430) handles two
  cross-row hits with distinct centers, not either nonhit branch.
* Retained-collision and equal-blocker consumers require
  `RetainedRadiusCollision`, cap-interior/complementary-membership, or two
  cap-source witness packets absent from `FreshThirdBlockerFiber`.
* The only direct intended consumer is
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` (~9806),
  and its `sorry` is therefore the first missing bridge; wrappers below it are
  not closure (their transitive audit reaches `sorryAx`).

An indexed Lean search (`nthdegree docs search --lean
"FreshThirdCapSourceNonHit sourceRowOmission sameBlocker FreshThirdBlockerFiber" --current-project --kind theorem`)
and a parallel source search found no additional theorem consuming either
constructor to derive `False`.

## Conclusion

No source-faithful contradiction or stronger producer for `firstNonHit` or
`secondNonHit` is currently imported.  The smallest honest next target is a new
adapter/terminal that preserves the missing cap-membership, common-radius, and
boundary-order (or equivalent metric) hypotheses and proves the normalized
residual contradiction.  Rewrapping `sameBlocker`, `sourceRowOmission`, or the
support/deletion equivalence would not advance the proof frontier.

No production Lean files were modified.
