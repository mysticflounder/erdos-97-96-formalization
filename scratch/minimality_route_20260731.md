# Minimality/deletion route audit (2026-07-31)

Read-only audit of `ATail/FrontierLiveClosure.lean`; no production Lean files
were edited.  The requested terminal route does not currently close either
leaf.  The exact first missing bridge is recorded below.

## Parent residual and terminal interfaces

`ATail/OrientedPhysicalApexIngress.lean:251-263` defines
`FrontierCommonDeletionParentResidual F` with fields

* `minimal : D.Minimal`;
* `noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44`;
* `carrier_card_gt_nine : 9 < D.A.card`;
* `frontierRadius_class_card_ge_four`;
* `common : FrontierCommonDeletionResidual F` (the source-faithful
  first-apex double deletion and common packet).

The parent does not expose a ready-made minimality contradiction.  Its checked
robustness consequence is
`FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust` (same file,
around lines 286-360), which gives `FullyDeletionRobustAt D S.oppApex1`.

In `FrontierLiveClosure.lean` the namespace
`TwoSourceExactCollisionRowsTerminal` fixes two residuals/collisions `P` and
`Pρ`, distinct radii and exact-four classes, disjoint interior source pairs,
the tri-apex residual `T`, and two localized common-deletion/mutual-omission
cycles (`LPρ/MPρ`, `LP/MP`).  The only load-bearing leaves are:

* `false_of_crossBlockerCoincidence` (lines 7452-7456):
  `CrossBlockerCoincidence P Pρ → GeometricMultiplicityResidual P Pρ → False`.
  `CrossBlockerCoincidence` is exactly the four equalities in
  `ATail/TwoCollisionGlobalProducer.lean:478-492`.
* `false_of_capSourceThirdCanonicalRowSurface` (lines 7491-7495):
  `CapSourceThirdCanonicalRowSurface P Pρ → GeometricMultiplicityResidual P Pρ → False`.
  `CapSourceThirdCanonicalRowSurface` carries an 8-point cap, a source in the
  strict cap interior outside all four named sources, source-blocker
  inequalities from both collision blockers and both Moser apices, a
  source-row exact-four support, and two `CrossPairDeletionView`s.

Both bodies are `sorry`; their direct consumer is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`FrontierLiveClosure.lean:11343-11373`).

## Source-clean deletion/minimality facts that can be reached

The following are checked, but stop short of `False`:

* `exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion` (private,
  around 9408) chooses one endpoint from each collision pair omitted by a
  cap-source row, proves the cap-source row survives deletion of both, and
  proves first-apex K4 is destroyed under the aligned-radii hypothesis.
* `firstApex_minimalDeletionCore_of_crossRetainedEndpoints` (private, around
  9647) packages that two-point deletion as
  `Nonempty (MinimalDeletionCore D.A {x,y} S.oppApex1)`.  It uses only the
  distinct radii, the two exact-four intersection equations, first-apex
  robustness (from `T.oppApex1_rich`), and the double-deletion obstruction.
  There is no consumer from this `MinimalDeletionCore` to either live
  terminal.
* `sixCenterDeletionSurvivalPacket_of_oneSided` (around 9042) yields a
  disjunction of `SixCenterDeletionSurvivalPacket`s: five named centers plus
  the cap-source blocker survive one common deletion, with six distinct
  centers.  This is only survival/cardinality data; no theorem turns it into
  an `IsM44` witness or a contradiction with `R.noM44`.
* `exists_secondRowOutsidePoint_ne_firstOutsidePair` and
  `freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint` (private, around
  9569/9781) produce a genuinely new second-row off-cap point and, when its
  blocker is the second collision blocker, a fresh second-fiber packet.  No
  terminal consumes that packet.
* `exists_globalK4Row_and_sourceFaithfulCriticalCover` (around 10093) and
  `firstFiber_sourceFaithfulCriticalCover_eq_firstShell` (around 10160) give a
  source-faithful unique-four cover and identify its center/support with the
  first collision shell.  They remain positive ingress only.
* `false_of_twoCapSources_complementaryMembership` and
  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` (around
  8860/8940) are source-clean ordered-cap contradictions, but require two
  cap-source rows with distinct blockers and explicit mutual/complementary
  cross-membership.  The live coincidence leaf has equal cross blockers, and
  `GeometricMultiplicityResidual` supplies only a disjunction of fresh-third,
  fresh-first, or fresh-second fibers; it does not provide these hypotheses.

`R.minimal` and `R.noM44` are consumed elsewhere by old/global deletion
constructors (for example `ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion`), but no such constructor is wired from the current two-source residual to either terminal.  `T` contributes `oppApex1/2/surplusApex_rich`, `notRobustCover_card`, and
`no_center_covers_all_apices`; none alone contradicts a six-center survival
packet.

## First missing bridge

There is no non-circular source-clean path from the currently available
minimality/deletion packets to either target.  A valid next obligation must
consume one of the stranded objects above and prove a genuine global
contradiction, e.g. a theorem of shape

```text
CapSourceThirdCanonicalRowSurface P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False

CrossBlockerCoincidence P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False
```

To avoid restating the `sorry`, that bridge must either (i) derive an
`IsM44` packet from the six-center/minimal-deletion data, (ii) feed a
minimal-deletion core into a proved global descent theorem, or (iii) strengthen
the residual to the explicit distinct-blocker/mutual-cross-membership fields
needed by the ordered-cap contradictions.  No current theorem supplies any of
these producers.
