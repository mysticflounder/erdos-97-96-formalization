/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Source-faithful first-apex shell roles

This packet retains the original-frontier first-apex rows needed by the
all-reverse parent closure.  It deliberately mentions the retained original frontier
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
namespace ATailFirstApexShellRole

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

The packet is extracted source-faithfully by
`nonempty_firstApexShellRolePacket` in `FirstApexShellRoleExtractor`. -/
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

end

end ATailFirstApexShellRole
end Problem97
