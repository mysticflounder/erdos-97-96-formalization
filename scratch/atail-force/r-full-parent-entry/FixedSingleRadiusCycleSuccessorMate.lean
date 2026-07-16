/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleSameCapEdge
import ActualBlockerMinimalCycleClassifier

/-!
# The actual blocker successor is a coherent robust mate

The fixed-single-radius terminal carrier retains four points on the fixed
first-apex circle and a four-point second-apex witness.  Both witnesses avoid
every erased cycle source.  Consequently any two distinct canonical cycle
sources survive simultaneous deletion at both apices and form an ambient
robust pair.

Applying this to the first source and its actual blocker successor removes
the independently-chosen-mate caveat: the mate is definitionally the next
blocker-cycle source, at the fixed radius.  Since a selected shell never
contains its own center, this coherent pair is always in the exact OMISSION
arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

/-- The first actual-blocker edge of a coherent fixed-radius cycle can be
used as the robust pair itself, and its exact classifier is OMISSION. -/
theorem SourceExactMinimalActualBlockerCycle.exists_fixedRadius_successorMate_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ Q : AmbientRobustHistoryPair D S T.carrier radius,
      Q.x = (K.source
        ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1 ∧
      Q.y = (K.source ⟨1, K.two_le_period⟩).1 ∧
      Q.y = H.centerAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1 ∧
      ActualBlockerOmissionOutcome Q H := by
  classical
  let i0 : Fin K.period :=
    ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
  let i1 : Fin K.period := ⟨1, K.two_le_period⟩
  let x := (K.source i0).1
  let y := (K.source i1).1
  have hedge : H.blockerVertex (K.source i0) = K.source i1 := by
    simp [i0, i1, SourceExactMinimalActualBlockerCycle.source]
  have hxy : x ≠ y := by
    intro h
    have hsources : K.source i0 = K.source i1 := Subtype.ext h
    have hindices := K.source_injective hsources
    have hvals := congrArg Fin.val hindices
    simp [i0, i1] at hvals
  have hxErased : x ∈ D.A \ T.carrier := by
    simpa [x] using K.source_mem_erased_at i0
  have hyErased : y ∈ D.A \ T.carrier := by
    simpa [y] using K.source_mem_erased_at i1
  have hxClass : x ∈ SelectedClass D.A S.oppApex1 radius := by
    simpa [x] using
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
        K i0
  have hyClass : y ∈ SelectedClass D.A S.oppApex1 radius := by
    simpa [y] using
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
        K i1
  have hxOff : x ∉ S.surplusCap := by
    simpa [x] using
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
        K i0
  have hyOff : y ∉ S.surplusCap := by
    simpa [y] using
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
        K i1
  have hstrict :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.one_of_distinct_sources_mem_strictOppCap1
      K (i := i0) (j := i1) (by
        intro h
        have hvals := congrArg Fin.val h
        simp [i0, i1] at hvals)
  rcases T.terminal with
    ⟨q, w, hradius, hqTerminal, hwTerminal, hqw, hfixedCard,
      hsecondTerminal⟩
  have hfirstDouble :
      HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex1 := by
    refine ⟨radius, hradius, ?_⟩
    have hfourCarrier :
        4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card := by
      rcases hfixedCard with h | h <;> omega
    have hsub :
        SelectedClass T.carrier S.oppApex1 radius ⊆
          SelectedClass ((D.A.erase x).erase y) S.oppApex1 radius := by
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzCarrier, hzdist⟩
      have hzx : z ≠ x := by
        intro hzx
        exact (Finset.mem_sdiff.mp hxErased).2 (by simpa [hzx] using hzCarrier)
      have hzy : z ≠ y := by
        intro hzy
        exact (Finset.mem_sdiff.mp hyErased).2 (by simpa [hzy] using hzCarrier)
      exact mem_selectedClass.mpr
        ⟨Finset.mem_erase.mpr
          ⟨hzy, Finset.mem_erase.mpr
            ⟨hzx, T.carrier_subset hzCarrier⟩⟩,
          hzdist⟩
    simpa [SelectedClass] using
      le_trans hfourCarrier (Finset.card_le_card hsub)
  have hsecondDouble :
      HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex2 := by
    apply equidistant_mono (h := hsecondTerminal)
    intro z hz
    have hzCarrier : z ∈ T.carrier := by
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    have hzx : z ≠ x := by
      intro hzx
      exact (Finset.mem_sdiff.mp hxErased).2 (by simpa [hzx] using hzCarrier)
    have hzy : z ≠ y := by
      intro hzy
      exact (Finset.mem_sdiff.mp hyErased).2 (by simpa [hzy] using hzCarrier)
    exact Finset.mem_erase.mpr
      ⟨hzy, Finset.mem_erase.mpr
        ⟨hzx, T.carrier_subset hzCarrier⟩⟩
  let Q : AmbientRobustHistoryPair D S T.carrier radius :=
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
      strict_endpoint := by simpa [x, y] using hstrict }
  have hQx : Q.x = (K.source i0).1 := rfl
  have hQy : Q.y = (K.source i1).1 := rfl
  have hQblocker :
      Q.y = H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 := by
    have hvalue := congrArg Subtype.val hedge
    simpa [Q, x, y, i0, CriticalShellSystem.blockerVertex] using hvalue.symm
  have hOmission : ActualBlockerOmissionOutcome Q H := by
    rcases
        ActualBlockerCapMetricOutcome.hit_or_omission
          (AmbientRobustHistoryPair.actualBlocker_capMetricClassifier Q H) with
      hhit | homission
    · exfalso
      let hxA := (mem_selectedClass.mp Q.x_mem_class).1
      let shell := (H.selectedAt Q.x hxA).toCriticalFourShell
      have hySupport : Q.y ∈ shell.support := by
        simpa [shell, hxA] using hhit.1
      have hyCenter : Q.y = H.centerAt Q.x hxA := by
        simpa [hxA] using hQblocker
      exact shell.center_not_mem_support (by simpa [hyCenter] using hySupport)
    · exact homission
  refine ⟨Q, ?_, ?_, hQblocker, hOmission⟩
  · simpa [i0] using hQx
  · simpa [i1] using hQy

#print axioms SourceExactMinimalActualBlockerCycle.exists_fixedRadius_successorMate_omission

end ATailRFullParentEntryScratch
end Problem97
