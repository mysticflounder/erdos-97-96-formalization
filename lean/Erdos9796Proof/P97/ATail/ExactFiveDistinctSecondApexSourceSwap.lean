/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterContinuation
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Second-apex source-swap reduction for the distinct exact-five residual

This module isolates the source-faithful reselection step needed by the live
five-incidence endpoint.  Full deletion robustness at the second physical
apex supplies a four-row omitting the retained source.  Either that row also
omits the original deleted source, or it swaps the two sources against the
old second-apex row.

The reduction is intentionally nonterminal.  Its physical arm still needs the
independent physical common-deletion consumer, while its hard arm is the input
for the order/equality census.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveDistinctSecondApexSourceSwap

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailFiveCenterDeletionBoundary
open ExactFiveDistinctThreeCenterContinuation
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- A positive selected class containing at least five points has a selected
four-point subclass avoiding any two points at unequal center distances. -/
theorem exists_selectedFourClass_avoiding_two_of_five_le_selectedClass
    {A : Finset ℝ²} {center x y : ℝ²} {ρ : ℝ}
    (hcard : 5 ≤ (SelectedClass A center ρ).card)
    (hρ : 0 < ρ)
    (hxy : dist center x ≠ dist center y) :
    ∃ K : SelectedFourClass A center,
      K.radius = ρ ∧ x ∉ K.support ∧ y ∉ K.support := by
  classical
  let C := SelectedClass A center ρ
  let E := (C.erase x).erase y
  have hCcard : 5 ≤ C.card := by simpa [C] using hcard
  have hnotBoth : ¬ (x ∈ C ∧ y ∈ C) := by
    rintro ⟨hx, hy⟩
    apply hxy
    exact (mem_selectedClass.mp hx).2.trans (mem_selectedClass.mp hy).2.symm
  have hEcard : 4 ≤ E.card := by
    by_cases hx : x ∈ C
    · have hy : y ∉ C := by
        intro hy
        exact hnotBoth ⟨hx, hy⟩
      have hyErase : y ∉ C.erase x := by
        intro hy'
        exact hy (Finset.mem_erase.mp hy').2
      have hErase : E = C.erase x := by
        exact Finset.erase_eq_self.mpr hyErase
      rw [hErase]
      have hcardErase := Finset.card_erase_add_one hx
      omega
    · by_cases hy : y ∈ C
      · have hxErase : C.erase x = C := Finset.erase_eq_self.mpr hx
        have hErase : E = C.erase y := by simp only [E, hxErase]
        rw [hErase]
        have hcardErase := Finset.card_erase_add_one hy
        omega
      · have hxErase : C.erase x = C := Finset.erase_eq_self.mpr hx
        have hyErase : C.erase y = C := Finset.erase_eq_self.mpr hy
        simp only [E, hxErase, hyErase]
        omega
  rcases Finset.exists_subset_card_eq (s := E) hEcard with
    ⟨B, hBE, hBcard⟩
  let K : SelectedFourClass A center :=
    { support := B
      support_subset_A := by
        intro z hz
        have hzC : z ∈ C := by
          have hzE : z ∈ E := hBE hz
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzE).2).2
        exact (mem_selectedClass.mp hzC).1
      support_card := hBcard
      radius := ρ
      radius_pos := hρ
      support_eq_radius := by
        intro z hz
        have hzC : z ∈ C := by
          have hzE : z ∈ E := hBE hz
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzE).2).2
        exact (mem_selectedClass.mp hzC).2
      center_not_mem := by
        intro hcenter
        have hdist := (show dist center center = ρ from
          (by
            have hzE : center ∈ E := hBE hcenter
            exact (mem_selectedClass.mp
              ((Finset.mem_erase.mp (Finset.mem_erase.mp hzE).2).2)).2))
        rw [dist_self] at hdist
        linarith }
  refine ⟨K, rfl, ?_, ?_⟩
  · intro hxB
    have hxE : x ∈ E := hBE hxB
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxE).2).1 rfl
  · intro hyB
    have hyE : y ∈ E := hBE hyB
    exact (Finset.mem_erase.mp hyE).1 rfl

/-- A selected four-row is the whole class at its radius whenever every
positive selected class at that center has cardinality below five. -/
private theorem support_eq_selectedClass_of_all_positive_classes_small
    {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center)
    (hsmall : ∀ ρ : ℝ, 0 < ρ → (SelectedClass A center ρ).card < 5) :
    K.support = SelectedClass A center K.radius := by
  have hsub : K.support ⊆ SelectedClass A center K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  apply Finset.eq_of_subset_of_card_le hsub
  have hclassSmall := hsmall K.radius K.radius_pos
  rw [K.support_card]
  omega

/-- The retained source belongs to the full exact-five first-apex class, not
only to the old four-row obtained by deleting the original source. -/
theorem retained_mem_firstApex_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    N.retained ∈ SelectedClass D.A S.oppApex1 radius := by
  have hretained :
      N.retained ∈ (SelectedClass D.A S.oppApex1 radius).erase deleted := by
    rw [← N.firstApexClass_support_eq]
    exact N.retained_mem_firstApexClass
  exact Finset.mem_of_mem_erase hretained

/-- The source erased from the old first-apex row still belongs to its full
exact-five radius class. -/
theorem deleted_mem_firstApex_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases N.orientation with ⟨hdeleted, _, _⟩ | ⟨hdeleted, _, _⟩
  · simpa only [hdeleted] using
      (Finset.mem_inter.mp R.interior.w_mem_interior).1
  · simpa only [hdeleted] using
      (Finset.mem_inter.mp R.interior.q_mem_interior).1

/-- The retained and deleted sources are distinct, as witnessed directly by
membership in the erased old row. -/
theorem retained_ne_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    N.retained ≠ deleted := by
  have hretained :
      N.retained ∈ (SelectedClass D.A S.oppApex1 radius).erase deleted := by
    rw [← N.firstApexClass_support_eq]
    exact N.retained_mem_firstApexClass
  exact (Finset.mem_erase.mp hretained).1

/-- The canonical first-apex source swap: erase the retained source from the
full exact-five class instead of erasing the original deleted source. -/
noncomputable def swappedFirstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    SelectedFourClass D.A S.oppApex1 :=
  ExactFiveCommonShellV7.selectedFourClassOfExactFiveErase
    R.interior.frontier.radius_pos R.class_card_eq_five
    (retained_mem_firstApex_selectedClass N)

/-- Swapping the erased source inserts the old deleted source and removes the
retained source from the old first-apex row. -/
theorem swappedFirstApexClass_support_eq_insert_deleted_erase_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    (swappedFirstApexClass R C N).support =
      insert deleted (N.firstApexClass.support.erase N.retained) := by
  classical
  simp only [swappedFirstApexClass,
    ExactFiveCommonShellV7.selectedFourClassOfExactFiveErase]
  rw [N.firstApexClass_support_eq]
  ext z
  by_cases hzd : z = deleted
  · subst z
    simp [deleted_mem_firstApex_selectedClass N,
      (retained_ne_deleted N).symm]
  · simp [hzd]

/-- The hard arm of second-apex reselection.  The old and replacement rows
are the two complete positive radius classes, and their source incidences are
swapped. -/
structure ExactFiveDistinctSecondApexHardSourceSwap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) : Type where
  replacement : SelectedFourClass D.A S.oppApex2
  old_radius_pos : 0 < N.secondApexClass.radius
  replacement_radius_pos : 0 < replacement.radius
  radii_ne : N.secondApexClass.radius ≠ replacement.radius
  old_full :
    N.secondApexClass.support =
      SelectedClass D.A S.oppApex2 N.secondApexClass.radius
  replacement_full :
    replacement.support = SelectedClass D.A S.oppApex2 replacement.radius
  supports_disjoint :
    Disjoint N.secondApexClass.support replacement.support
  retained_mem_old : N.retained ∈ N.secondApexClass.support
  deleted_not_mem_old : deleted ∉ N.secondApexClass.support
  retained_not_mem_replacement : N.retained ∉ replacement.support
  deleted_mem_replacement : deleted ∈ replacement.support
  every_positive_class_small :
    ∀ ρ : ℝ, 0 < ρ → (SelectedClass D.A S.oppApex2 ρ).card < 5

/-- At the five-incidence endpoint, full robustness of the second apex either
reselects a row omitting both named sources, or produces the hard two-radius
source-swap packet. -/
theorem exactFiveDistinct_secondApex_physical_or_hardSourceSwap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hretained : N.retained ∈ N.secondApexClass.support) :
    (∃ K : SelectedFourClass D.A S.oppApex2,
        N.retained ∉ K.support ∧ deleted ∉ K.support) ∨
      Nonempty (ExactFiveDistinctSecondApexHardSourceSwap R C N) := by
  classical
  have hdist :
      dist S.oppApex2 N.retained ≠ dist S.oppApex2 deleted := by
    rcases N.orientation with ⟨hdeleted, hretainedEq, _⟩ |
        ⟨hdeleted, hretainedEq, _⟩
    · simpa [hdeleted, hretainedEq] using
        R.interior.frontier.pair.oppApex2_dist_ne
    · simpa [hdeleted, hretainedEq] using
        (Ne.symm R.interior.frontier.pair.oppApex2_dist_ne)
  by_cases hphysical :
      ∃ K : SelectedFourClass D.A S.oppApex2,
        N.retained ∉ K.support ∧ deleted ∉ K.support
  · exact Or.inl hphysical
  · right
    have hsurvives :
        HasNEquidistantPointsAt 4 (D.skeleton N.retained) S.oppApex2 := by
      simpa [CounterexampleData.skeleton] using
        N.secondApex_robust.survives N.retained N.retained_mem_A
    rcases
        U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
          hsurvives with ⟨B, ⟨Q⟩, hBcard⟩
    let L : SelectedFourClass D.A S.oppApex2 :=
      qDeletedK4ClassToSelectedFourClass Q hBcard
    have hretainedL : N.retained ∉ L.support := by
      simpa [L, qDeletedK4ClassToSelectedFourClass] using
        qDeletedK4Class_deleted_not_mem_support Q
    have hdeletedL : deleted ∈ L.support := by
      by_contra hdeletedL
      exact hphysical ⟨L, hretainedL, hdeletedL⟩
    have hdeletedOld : deleted ∉ N.secondApexClass.support := by
      rw [N.secondApexClass_support_eq]
      exact C.row₂.q_not_mem
    have hsmall :
        ∀ ρ : ℝ, 0 < ρ →
          (SelectedClass D.A S.oppApex2 ρ).card < 5 := by
      intro ρ hρ
      by_contra hnotSmall
      have hfive : 5 ≤ (SelectedClass D.A S.oppApex2 ρ).card := by omega
      rcases
          exists_selectedFourClass_avoiding_two_of_five_le_selectedClass
            hfive hρ hdist with ⟨K, _, hretainedK, hdeletedK⟩
      exact hphysical ⟨K, hretainedK, hdeletedK⟩
    have hradii : N.secondApexClass.radius ≠ L.radius := by
      intro hradii
      apply hdist
      calc
        dist S.oppApex2 N.retained = N.secondApexClass.radius :=
          N.secondApexClass.support_eq_radius N.retained hretained
        _ = L.radius := hradii
        _ = dist S.oppApex2 deleted :=
          (L.support_eq_radius deleted hdeletedL).symm
    have hdisjoint :
        Disjoint N.secondApexClass.support L.support := by
      rw [Finset.disjoint_left]
      intro z hzOld hzL
      apply hradii
      exact (N.secondApexClass.support_eq_radius z hzOld).symm.trans
        (L.support_eq_radius z hzL)
    exact ⟨
      { replacement := L
        old_radius_pos := N.secondApexClass.radius_pos
        replacement_radius_pos := L.radius_pos
        radii_ne := hradii
        old_full :=
          support_eq_selectedClass_of_all_positive_classes_small
            N.secondApexClass hsmall
        replacement_full :=
          support_eq_selectedClass_of_all_positive_classes_small L hsmall
        supports_disjoint := hdisjoint
        retained_mem_old := hretained
        deleted_not_mem_old := hdeletedOld
        retained_not_mem_replacement := hretainedL
        deleted_mem_replacement := hdeletedL
        every_positive_class_small := hsmall }⟩

end ExactFiveDistinctSecondApexSourceSwap
end Problem97
