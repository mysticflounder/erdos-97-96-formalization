/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Scratch interface: source-faithful first-apex shell roles

This is the exact packet that may be adjoined to an all-reverse finite or
Euclidean audit.  It deliberately mentions the retained original frontier
`F0`, not the independently reconstructed frontier stored by the exact-five
cycle residual.

In the fixed-core notation used by the current period-three audits,
`right = S.oppApex1` is the center of both rows below and
`o = S.oppApex2` is the physical exact-five apex.

The packet does not choose a common cyclic order.  Its cap fields are role
domains which a solver must enumerate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstApexShellRoleAuditScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The private part of the cap opposite the retained first apex. -/
def strictFirstOppositeCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Finset ℝ² :=
  S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

/-- Exact source-faithful first-apex data available from `F0` and
`R.common.firstApexDouble`.

An extractor is routine finite-set bookkeeping from the cited production
lemmas in `REPORT.md`; it is intentionally not added here while the production
build graph is owned by another lane. -/
structure FirstApexShellRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0) : Type where
  /- The retained radius and one four-point subrow preserving the frontier pair. -/
  retainedRadius_pos : 0 < radius
  retainedRow : SelectedFourClass D.A S.oppApex1
  retainedRow_radius : retainedRow.radius = radius
  q_mem_retainedRow : F0.pair.q ∈ retainedRow.support
  w_mem_retainedRow : F0.pair.w ∈ retainedRow.support
  retained_completion_card_eq_two :
    (retainedRow.support \ {F0.pair.q, F0.pair.w}).card = 2

  /- The retained row can be chosen to preserve two distinct strict-cap hits.
  They are not asserted to be the two completion points: either may be q or w. -/
  retainedInterior₁ : ℝ²
  retainedInterior₂ : ℝ²
  retainedInterior_ne : retainedInterior₁ ≠ retainedInterior₂
  retainedInterior₁_mem_row : retainedInterior₁ ∈ retainedRow.support
  retainedInterior₂_mem_row : retainedInterior₂ ∈ retainedRow.support
  retainedInterior₁_mem_cap :
    retainedInterior₁ ∈ S.capInteriorByIndex S.oppIndex1
  retainedInterior₂_mem_cap :
    retainedInterior₂ ∈ S.capInteriorByIndex S.oppIndex1

  /- Exact cap-role domain of every retained-row point. -/
  retainedRow_role_cover :
    retainedRow.support ⊆
      S.surplusCap ∪ S.oppCap2 ∪ strictFirstOppositeCap S

  /- The frontier sources have no more precise unconditional roles. -/
  q_role : F0.pair.q ∈ S.oppCap2 ∨
    F0.pair.q ∈ strictFirstOppositeCap S
  w_role : F0.pair.w ∈ S.oppCap2 ∨
    F0.pair.w ∈ strictFirstOppositeCap S
  one_frontier_source_strict :
    F0.pair.q ∈ strictFirstOppositeCap S ∨
      F0.pair.w ∈ strictFirstOppositeCap S

  /- A selected four-row extracted from the K4 witness after deleting q,w. -/
  doubleRadius : ℝ
  doubleRadius_pos : 0 < doubleRadius
  doubleRow : SelectedFourClass D.A S.oppApex1
  doubleRow_radius : doubleRow.radius = doubleRadius
  doubleRow_subset_doubleErase :
    doubleRow.support ⊆ (D.A.erase F0.pair.q).erase F0.pair.w
  doubleInterior₁ : ℝ²
  doubleInterior₂ : ℝ²
  doubleInterior_ne : doubleInterior₁ ≠ doubleInterior₂
  doubleInterior₁_mem_row : doubleInterior₁ ∈ doubleRow.support
  doubleInterior₂_mem_row : doubleInterior₂ ∈ doubleRow.support
  doubleInterior₁_mem_cap :
    doubleInterior₁ ∈ S.capInteriorByIndex S.oppIndex1
  doubleInterior₂_mem_cap :
    doubleInterior₂ ∈ S.capInteriorByIndex S.oppIndex1
  doubleRow_role_cover :
    doubleRow.support ⊆
      S.surplusCap ∪ S.oppCap2 ∪ strictFirstOppositeCap S

  /- The exhaustive radius split.  Equal radii give six distinct ambient
  co-radial points; unequal radii make the two selected supports disjoint. -/
  sameRadius_six : doubleRadius = radius →
    6 ≤ (SelectedClass D.A S.oppApex1 radius).card
  distinctRadius_disjoint : doubleRadius ≠ radius →
    Disjoint retainedRow.support doubleRow.support

  /- Prescribed-deletion facts retained by the full parent. -/
  firstApex_double_survives :
    HasNEquidistantPointsAt 4
      ((D.A.erase F0.pair.q).erase F0.pair.w) S.oppApex1
  secondApex_double_survives :
    HasNEquidistantPointsAt 4
      ((D.A.erase F0.pair.q).erase F0.pair.w) S.oppApex2
  q_firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase F0.pair.q) S.oppApex1
  w_firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase F0.pair.w) S.oppApex1
  q_secondApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase F0.pair.q) S.oppApex2
  w_secondApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase F0.pair.w) S.oppApex2

/-- The six named points in the equal-radius arm: the two retained frontier
sources and the entire four-point double-deletion row. -/
def sameRadiusNamedSix
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F0 : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F0}
    (P : FirstApexShellRolePacket F0 R) : Finset ℝ² :=
  insert F0.pair.q (insert F0.pair.w P.doubleRow.support)

/-- Strongest source-faithful refinement of the `doubleRadius = radius` arm.

The six named points lose at most two members under any prescribed double
deletion.  Independently, the two adjacent-cap one-hit bounds put at least
four of the named six in the strict interior of `oppCap1`.  If either
frontier source is the unique possible `oppCap2` hit, at least three of the
four double-row points are strict-interior points.

This is a solver/Lean-facing interface.  Its extractor is finite-cardinality
bookkeeping from the production lemmas cited in `REPORT.md`; no extractor is
built in this no-Lean-build scratch audit. -/
structure SameRadiusSixConsequencePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F0 : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F0}
    (P : FirstApexShellRolePacket F0 R) : Type where
  same_radius : P.doubleRadius = radius
  namedSix_card_eq_six : (sameRadiusNamedSix P).card = 6
  namedSix_subset_fixedClass :
    sameRadiusNamedSix P ⊆ SelectedClass D.A S.oppApex1 radius
  namedSix_strictInterior_card_ge_four :
    4 ≤ (sameRadiusNamedSix P ∩
      S.capInteriorByIndex S.oppIndex1).card
  doubleRow_strictInterior_card_ge_two :
    2 ≤ (P.doubleRow.support ∩
      S.capInteriorByIndex S.oppIndex1).card
  q_in_oppCap2_forces_three_doubleRow_strict :
    F0.pair.q ∈ S.oppCap2 →
      3 ≤ (P.doubleRow.support ∩
        S.capInteriorByIndex S.oppIndex1).card
  w_in_oppCap2_forces_three_doubleRow_strict :
    F0.pair.w ∈ S.oppCap2 →
      3 ≤ (P.doubleRow.support ∩
        S.capInteriorByIndex S.oppIndex1).card
  arbitrary_double_deletion_survives_firstApex :
    ∀ a b : ℝ²,
      HasNEquidistantPointsAt 4
        ((D.A.erase a).erase b) S.oppApex1

end

end ATailFirstApexShellRoleAuditScratch
end Problem97
