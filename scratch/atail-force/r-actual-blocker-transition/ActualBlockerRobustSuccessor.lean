/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerCapMetricClassifier

/-!
# R actual-blocker successor from retained erasure history

The robust descent history already reconstructs the complete ambient R
invariant at every erased point. The earlier public export forgot which named
erased point became the returned pair's source. This leaf restores that
provenance and applies it to the actual blocker.

The remaining branch is exact: either the blocker belongs to the terminal
carrier, or it is the source of a new ambient robust-history pair. No rank or
lap progress is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem strictOppCap1_of_class_mem_off_surplus_not_oppCap2
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {rho : ℝ} {x : ℝ²}
    (hxClass : x ∈ SelectedClass D.A S.oppApex1 rho)
    (hxOffSurplus : x ∉ S.surplusCap)
    (hxOffOpp2 : x ∉ S.oppCap2) :
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hxFilter :
      x ∈ D.A.filter fun z => dist z S.oppApex1 = rho := by
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxdist⟩
    exact Finset.mem_filter.mpr
      ⟨hxA, by simpa [dist_comm] using hxdist⟩
  have hxCover :=
    U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover DS rho hxFilter
  simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
  rcases hxCover with (hxSurplus | hxOpp2) | hxStrict
  · exact False.elim (hxOffSurplus hxSurplus)
  · exact False.elim (hxOffOpp2 hxOpp2)
  · simpa [DS] using hxStrict

/-- Named-source strengthening of
`exists_ambientRobustHistoryPair_of_erased`. The returned pair retains the
input erased point as its source rather than forgetting that equality behind
an unindexed existential. -/
theorem exists_ambientRobustHistoryPair_with_source_of_erased
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {C : Finset ℝ²}
    (Hhist : RobustPairedErasureHistory D S D.A C)
    {x : ℝ²} (hxErased : x ∈ D.A \ C) :
    ∃ rho : ℝ, ∃ P : AmbientRobustHistoryPair D S C rho,
      P.x = x := by
  rcases Hhist x hxErased with
    ⟨rho, y, _hrho, hxMarginal, hyMarginal, hyErased, hxy,
      hfirstDouble, hsecondDouble⟩
  have hxClass : x ∈ SelectedClass D.A S.oppApex1 rho := by
    rcases Finset.mem_sdiff.mp hxMarginal with ⟨hxFilter, _⟩
    rcases Finset.mem_filter.mp hxFilter with ⟨hxA, hxr⟩
    exact mem_selectedClass.mpr
      ⟨hxA, by simpa [dist_comm] using hxr⟩
  have hyClass : y ∈ SelectedClass D.A S.oppApex1 rho := by
    rcases Finset.mem_sdiff.mp hyMarginal with ⟨hyFilter, _⟩
    rcases Finset.mem_filter.mp hyFilter with ⟨hyA, hyr⟩
    exact mem_selectedClass.mpr
      ⟨hyA, by simpa [dist_comm] using hyr⟩
  have hxOff : x ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hxMarginal).2
  have hyOff : y ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hyMarginal).2
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS rho
  have hnotBoth : x ∉ S.oppCap2 ∨ y ∉ S.oppCap2 := by
    by_contra hboth
    push_neg at hboth
    rw [Finset.card_le_one] at hone
    have hxeq : x = y := hone x
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr
          ⟨(mem_selectedClass.mp hxClass).1,
            by simpa [dist_comm] using
              (mem_selectedClass.mp hxClass).2⟩,
        hboth.1⟩)
      y
      (Finset.mem_inter.mpr ⟨
        Finset.mem_filter.mpr
          ⟨(mem_selectedClass.mp hyClass).1,
            by simpa [dist_comm] using
              (mem_selectedClass.mp hyClass).2⟩,
        hboth.2⟩)
    exact hxy hxeq
  have hstrict :
      x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
        y ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
    rcases hnotBoth with hxNot | hyNot
    · exact Or.inl
        (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
          D S hxClass hxOff hxNot)
    · exact Or.inr
        (strictOppCap1_of_class_mem_off_surplus_not_oppCap2
          D S hyClass hyOff hyNot)
  let P : AmbientRobustHistoryPair D S C rho :=
    { x := x
      y := y
      x_mem_erased := hxErased
      y_mem_erased := hyErased
      x_mem_class := hxClass
      y_mem_class := hyClass
      x_ne_y := hxy
      x_off_surplus := hxOff
      y_off_surplus := hyOff
      first_double := hfirstDouble
      second_double := hsecondDouble
      strict_endpoint := hstrict }
  exact ⟨rho, P, rfl⟩

/-- The actual blocker is either retained by the terminal carrier or is the
named source of a fully reconstructed ambient robust successor. This is the
exact preservation split supplied by the existing descent history. -/
theorem AmbientRobustHistoryPair.actualBlocker_mem_terminalCarrier_or_robustSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C) :
    let hxA := (mem_selectedClass.mp P.x_mem_class).1
    let b := H.centerAt P.x hxA
    b ∈ C ∨
      ∃ rho' : ℝ, ∃ P' : AmbientRobustHistoryPair D S C rho',
        P'.x = b := by
  let hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  change b ∈ C ∨
    ∃ rho' : ℝ, ∃ P' : AmbientRobustHistoryPair D S C rho',
      P'.x = b
  by_cases hbC : b ∈ C
  · exact Or.inl hbC
  · right
    have hbA : b ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt P.x hxA).toCriticalFourShell.center_mem).2
    exact exists_ambientRobustHistoryPair_with_source_of_erased
      D S Hhist (Finset.mem_sdiff.mpr ⟨hbA, hbC⟩)

#print axioms exists_ambientRobustHistoryPair_with_source_of_erased
#print axioms AmbientRobustHistoryPair.actualBlocker_mem_terminalCarrier_or_robustSuccessor

end ATailRActualBlockerTransitionScratch
end Problem97
