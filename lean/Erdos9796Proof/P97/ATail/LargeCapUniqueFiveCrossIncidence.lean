/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFive
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Exact-five cross-incidence terminal

This module isolates the source-faithful terminal packet for the physical
second-apex exact-five arm.  The unused cap source carries an actual
deletion-critical row.  If that row contains two distinct strict-cap members
of the physical exact-five class, two-center localization puts its blocker in
the same cap.  The row then has three same-cap support points, contradicting
the ordered-cap two-point bound.

The missing producer is deliberately not postulated here: it must construct
this packet from minimality and the full parent geometry.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFiveCrossIncidence

open ATailLargeCapUniqueFive
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

/-- Choice-invariant terminal data for the exact-five arm.  The packet names
the actual critical row and the two cross-incidences consumed immediately by
`false_of_largeCapUniqueFiveTwoHitCriticalRow`. -/
structure LargeCapUniqueFiveTwoHitCriticalRow
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  unused : LargeCapUniqueFiveUnusedPoint D S profile
  center : ℝ²
  row : CriticalSelectedFourClass D.A unused.point center
  sourceDeletionBlocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase unused.point) center
  x : ℝ²
  y : ℝ²
  x_ne_y : x ≠ y
  x_mem_physicalInterior :
    x ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
  y_mem_physicalInterior :
    y ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
  x_mem_row : x ∈ row.toCriticalFourShell.support
  y_mem_row : y ∈ row.toCriticalFourShell.support

/-- Two physical exact-five hits in the unused source's actual critical row
are impossible. -/
theorem false_of_largeCapUniqueFiveTwoHitCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoHitCriticalRow D S profile) :
    False := by
  classical
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase P.unused.point) S.oppApex2 := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    change 4 ≤
      (SelectedClass (D.A.erase P.unused.point)
        S.oppApex2 profile.radius).card
    rw [P.unused.erased_radiusClass_card_eq_five]
    omega
  have hcenterNe : P.center ≠ S.oppApex2 := by
    intro hcenter
    apply P.sourceDeletionBlocked
    simpa only [hcenter] using hphysicalSurvives
  have hcenterA : P.center ∈ D.A :=
    (Finset.mem_erase.mp P.row.toCriticalFourShell.center_mem).2
  have hcenterEq : dist P.center P.x = dist P.center P.y :=
    (P.row.toCriticalFourShell.support_eq_radius P.x P.x_mem_row).trans
      (P.row.toCriticalFourShell.support_eq_radius P.y P.y_mem_row).symm
  have hxPhysical := Finset.mem_inter.mp P.x_mem_physicalInterior
  have hyPhysical := Finset.mem_inter.mp P.y_mem_physicalInterior
  have hphysicalEq :
      dist S.oppApex2 P.x = dist S.oppApex2 P.y :=
    (mem_selectedClass.mp hxPhysical.1).2.trans
      (mem_selectedClass.mp hyPhysical.1).2.symm
  have hcenterInterior :
      P.center ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe
      hxPhysical.2 hyPhysical.2
      P.x_ne_y hcenterEq hphysicalEq
  have hcenterCap : P.center ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterInterior
  have hunused_ne_x : P.unused.point ≠ P.x := by
    intro h
    apply P.unused.point_not_mem_radiusClass
    rw [h]
    exact hxPhysical.1
  have hunused_ne_y : P.unused.point ≠ P.y := by
    intro h
    apply P.unused.point_not_mem_radiusClass
    rw [h]
    exact hyPhysical.1
  have htripleSubset :
      ({P.unused.point, P.x, P.y} : Finset ℝ²) ⊆
        P.row.toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨P.row.toCriticalFourShell.q_mem_support,
          P.unused.point_mem_capByIndex⟩
    · exact Finset.mem_inter.mpr
        ⟨P.x_mem_row,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            hxPhysical.2⟩
    · exact Finset.mem_inter.mpr
        ⟨P.y_mem_row,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            hyPhysical.2⟩
  have htripleCard :
      ({P.unused.point, P.x, P.y} : Finset ℝ²).card = 3 := by
    simp [hunused_ne_x, hunused_ne_y, P.x_ne_y]
  have hthree :
      3 ≤ (P.row.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2).card := by
    calc
      3 = ({P.unused.point, P.x, P.y} : Finset ℝ²).card :=
        htripleCard.symm
      _ ≤ (P.row.toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2).card :=
        Finset.card_le_card htripleSubset
  have htwo :
      (P.row.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2
        P.row.toCriticalFourShell.toSelectedFourClass hcenterCap
  omega

end ATailLargeCapUniqueFiveCrossIncidence
end Problem97
