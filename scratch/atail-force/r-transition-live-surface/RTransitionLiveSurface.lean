/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SubcarrierTerminalInvariant

/-!
# R-transition live-surface audit

This scratch module tests the proposed terminal transition for an ambient robust-history pair.
The pair can be oriented so that its source is the strict first-opposite-cap endpoint.  For that
orientation, the source blocker / mate-support interface has an exact dichotomy: either the mate
is selected and the blocker is outside the surplus cap, or the mate is omitted and its deletion
preserves K4 at the blocker.

The requested conjunction (blocker in the surplus cap and mate selected) is already terminal.  It
implies a selector-free packet in which a strict-surplus selected row contains the robust pair.
That packet contradicts ordered-cap outside-pair uniqueness.  Thus the selector-dependent
conjunction is not the weakest producer target; the selector-free row capture is.

No production module imports this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTransitionLiveSurfaceScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Reverse the source orientation of an ambient robust-history pair. -/
def swapAmbientRobustHistoryPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho) :
    AmbientRobustHistoryPair D S C rho where
  x := P.y
  y := P.x
  x_mem_erased := P.y_mem_erased
  y_mem_erased := P.x_mem_erased
  x_mem_class := P.y_mem_class
  y_mem_class := P.x_mem_class
  x_ne_y := P.x_ne_y.symm
  x_off_surplus := P.y_off_surplus
  y_off_surplus := P.x_off_surplus
  first_double := by
    simpa [Finset.erase_right_comm] using P.first_double
  second_double := by
    simpa [Finset.erase_right_comm] using P.second_double
  strict_endpoint := P.strict_endpoint.elim Or.inr Or.inl

/-- One orientation always has its source in strict `oppCap1`.  The final disjunction records
that no new pair was selected: it is either the original orientation or its reversal. -/
theorem exists_orientation_with_strict_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho) :
    ∃ Q : AmbientRobustHistoryPair D S C rho,
      Q.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (Q = P ∨ Q = swapAmbientRobustHistoryPair P) := by
  rcases P.strict_endpoint with hx | hy
  · exact ⟨P, hx, Or.inl rfl⟩
  · refine ⟨swapAmbientRobustHistoryPair P, ?_, Or.inr rfl⟩
    exact hy

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hsub : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzA, hzdist⟩

/-- Double survival at the first apex prevents that apex from being the source blocker. -/
theorem AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠ S.oppApex1 := by
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  apply actual_blocker_ne_of_deletion_survives H hxA
  apply equidistant_mono (B := D.A.erase P.x) _ P.first_double
  intro z hz
  exact (Finset.mem_erase.mp hz).2

/-- Double survival at the second apex prevents that apex from being the source blocker. -/
theorem AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠ S.oppApex2 := by
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  apply actual_blocker_ne_of_deletion_survives H hxA
  apply equidistant_mono (B := D.A.erase P.x) _ P.second_double
  intro z hz
  exact (Finset.mem_erase.mp hz).2

/-- A source blocker in the closed surplus cap is automatically in its strict interior: robust
double survival excludes both cap endpoints. -/
theorem AmbientRobustHistoryPair.sourceBlocker_mem_surplusInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hcenter : H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
      S.surplusCap) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
      S.capInteriorByIndex S.surplusIdx := by
  have hne1 := AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
  have hne2 := AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 P H
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, Finset.mem_erase] at hcenter hne1 hne2 ⊢
  all_goals exact ⟨hne2, hne1, hcenter⟩

/-- Selector-free form of the terminal R packet: one strict-surplus selected row contains both
members of an ambient robust-history pair. -/
structure InteriorSelectedRowCapturesPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho) where
  center : ℝ²
  center_mem_surplusInterior : center ∈ S.capInteriorByIndex S.surplusIdx
  row : SelectedFourClass D.A center
  x_mem_row : P.x ∈ row.support
  y_mem_row : P.y ∈ row.support

/-- The proposed source-blocker conjunction collapses to the weaker selector-free row capture. -/
def AmbientRobustHistoryPair.interiorSelectedRowCapture_of_sourceTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hcenter : H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
      S.surplusCap)
    (hyCross : P.y ∈
      (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support) :
    InteriorSelectedRowCapturesPair P where
  center := H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1
  center_mem_surplusInterior :=
    AmbientRobustHistoryPair.sourceBlocker_mem_surplusInterior P H hcenter
  row := (H.selectedAt P.x
    (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.toSelectedFourClass
  x_mem_row :=
    (H.selectedAt P.x
      (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.q_mem_support
  y_mem_row := hyCross

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_ne_of_mem_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) {z : ℝ²}
    (hz : z ∈ S.capInteriorByIndex S.surplusIdx) :
    S.oppApex1 ≠ z := by
  intro h
  subst z
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, hi] at hz

/-- The selector-free row capture is already contradictory by ordered-cap outside-pair
uniqueness. -/
theorem false_of_interiorSelectedRowCapturesPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    (L : InteriorSelectedRowCapturesPair P) : False := by
  classical
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  have hyA : P.y ∈ D.A := (mem_selectedClass.mp P.y_mem_class).1
  have hapexEq : dist S.oppApex1 P.x = dist S.oppApex1 P.y :=
    (mem_selectedClass.mp P.x_mem_class).2.trans
      (mem_selectedClass.mp P.y_mem_class).2.symm
  have hcenterEq : dist L.center P.x = dist L.center P.y :=
    (L.row.support_eq_radius P.x L.x_mem_row).trans
      (L.row.support_eq_radius P.y L.y_mem_row).symm
  have hcenterCapIndex : L.center ∈ S.capByIndex S.surplusIdx :=
    S.capInteriorByIndex_subset_capByIndex S.surplusIdx
      L.center_mem_surplusInterior
  have hcenterCap : L.center ∈ S.surplusCap := by
    rwa [capByIndex_surplusIdx_eq_surplusCap S] at hcenterCapIndex
  have hapexCap : S.oppApex1 ∈ S.surplusCap := oppApex1_mem_surplusCap S
  have hcentersNe : S.oppApex1 ≠ L.center :=
    oppApex1_ne_of_mem_surplusInterior S L.center_mem_surplusInterior
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, cap, packet, _hside, hordered, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap :=
    capByIndex_surplusIdx_eq_surplusCap S
  have hapexImage : S.oppApex1 ∈ Finset.univ.image cap.points := by
    rw [hcap, hcapSurplus]
    exact hapexCap
  have hcenterImage : L.center ∈ Finset.univ.image cap.points := by
    rw [hcap, hcapSurplus]
    exact hcenterCap
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  rcases Finset.mem_image.mp hcenterImage with ⟨ic, _hic, hic⟩
  have hindicesNe : ia ≠ ic := by
    intro h
    apply hcentersNe
    calc
      S.oppApex1 = cap.points ia := hia.symm
      _ = cap.points ic := by simp [h]
      _ = L.center := hic
  have hxOutside : P.x ∉ Finset.univ.image cap.points := by
    rw [hcap, hcapSurplus]
    exact P.x_off_surplus
  have hyOutside : P.y ∉ Finset.univ.image cap.points := by
    rw [hcap, hcapSurplus]
    exact P.y_off_surplus
  rcases lt_or_gt_of_ne hindicesNe with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hordered packet.mem_A hlt hxA hyA hxOutside hyOutside
      P.x_ne_y (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcenterEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex hordered packet.mem_A hgt hxA hyA hxOutside hyOutside
      P.x_ne_y (by simpa [hic] using hcenterEq)
      (by simpa [hia] using hapexEq)

/-- Exact source transition split.  A cross hit forces the chosen blocker outside the surplus
cap; a cross omission is equivalent to survival after deleting the mate at that blocker. -/
theorem AmbientRobustHistoryPair.sourceTransition_exact_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    (P.y ∈
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉ S.surplusCap) ∨
    (P.y ∉
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.y)
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1)) := by
  by_cases hyCross : P.y ∈
      (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support
  · left
    refine ⟨hyCross, ?_⟩
    intro hcenter
    exact false_of_interiorSelectedRowCapturesPair
      (AmbientRobustHistoryPair.interiorSelectedRowCapture_of_sourceTransition
        P H hcenter hyCross)
  · right
    exact ⟨hyCross,
      (cross_deletion_survives_iff_not_mem_selected_support H
        (mem_selectedClass.mp P.x_mem_class).1).mpr hyCross⟩

set_option linter.unusedVariables false in
/-- The exact split remains available after explicitly adding the two-large-cap and no-`IsM44`
live hypotheses.  Global K4 and the promoted MEC packet are already fields of `D` and `S`; this
proof does not consume either added outer hypothesis. -/
theorem sourceTransition_exact_split_under_live_outer_surface
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (hsecondLarge : 5 ≤ S.oppCap1.card ∨ 5 ≤ S.oppCap2.card)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    (P.y ∈
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉ S.surplusCap) ∨
    (P.y ∉
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.y)
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1)) :=
  AmbientRobustHistoryPair.sourceTransition_exact_split P H

/-- Choose the strict-source orientation and expose its exact transition branch. -/
theorem exists_strictSource_orientation_with_transition_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    ∃ Q : AmbientRobustHistoryPair D S C rho,
      Q.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (Q = P ∨ Q = swapAmbientRobustHistoryPair P) ∧
      ((Q.y ∈
          (H.selectedAt Q.x
            (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support ∧
        H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 ∉ S.surplusCap) ∨
      (Q.y ∉
          (H.selectedAt Q.x
            (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase Q.y)
          (H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1))) := by
  rcases exists_orientation_with_strict_source P with ⟨Q, hQstrict, hQorient⟩
  exact ⟨Q, hQstrict, hQorient,
    AmbientRobustHistoryPair.sourceTransition_exact_split Q H⟩

#print axioms swapAmbientRobustHistoryPair
#print axioms exists_orientation_with_strict_source
#print axioms AmbientRobustHistoryPair.sourceBlocker_mem_surplusInterior
#print axioms AmbientRobustHistoryPair.interiorSelectedRowCapture_of_sourceTransition
#print axioms false_of_interiorSelectedRowCapturesPair
#print axioms AmbientRobustHistoryPair.sourceTransition_exact_split
#print axioms sourceTransition_exact_split_under_live_outer_surface
#print axioms exists_strictSource_orientation_with_transition_split

end ATailRTransitionLiveSurfaceScratch
end Problem97
