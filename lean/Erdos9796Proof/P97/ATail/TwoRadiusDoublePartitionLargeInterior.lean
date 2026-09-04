/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorEquidistant
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.ATail.TwoFourClassesTwoFourShells

/-!
# A large two-radius interior contradicts a double shell partition

This module closes the source-neutral finite-geometric branch in which two
selected four-classes are simultaneously partitioned by two critical
four-shells.  Five points from the two classes in one strict cap force three
onto one shell, and two of those three share a selected physical radius.
-/

namespace Problem97
namespace ATailTwoRadiusDoublePartitionLargeInterior

open ATailTwoCenterCapLocalization
open ATailTwoFourClassesTwoFourShells
open ATailCapInteriorEquidistant

open scoped EuclideanGeometry

private theorem false_of_shell_sameClass_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source center : ℝ²}
    (K : SelectedFourClass D.A S.oppApex2)
    (C : CriticalFourShell D.A source center)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    {x y z : ℝ²}
    (hxC : x ∈ C.support) (hyC : y ∈ C.support)
    (hzC : z ∈ C.support)
    (hxI : x ∈ S.capInteriorByIndex S.oppIndex2)
    (hyI : y ∈ S.capInteriorByIndex S.oppIndex2)
    (hzI : z ∈ S.capInteriorByIndex S.oppIndex2)
    (hxK : x ∈ K.support) (hyK : y ∈ K.support)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    False := by
  have hcenterEq : dist center x = dist center y :=
    (C.support_eq_radius x hxC).trans (C.support_eq_radius y hyC).symm
  have hphysicalEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (K.support_eq_radius x hxK).trans (K.support_eq_radius y hyK).symm
  have hcenterI : center ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe hxI hyI hxy hcenterEq hphysicalEq
  have hcenterZ : dist center x = dist center z :=
    (C.support_eq_radius x hxC).trans (C.support_eq_radius z hzC).symm
  have hcenterX : center ≠ x := fun h =>
    C.center_not_mem_support (h ▸ hxC)
  have hcenterY : center ≠ y := fun h =>
    C.center_not_mem_support (h ▸ hyC)
  have hcenterZne : center ≠ z := fun h =>
    C.center_not_mem_support (h ▸ hzC)
  exact false_of_capInterior_center_equidistant_three_points
    hcenterI hxI hyI hzI hxy hxz hyz hcenterX hcenterY hcenterZne
    hcenterEq hcenterZ

private theorem false_of_shell_threeInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source center : ℝ²}
    (K0 K1 : SelectedFourClass D.A S.oppApex2)
    (C : CriticalFourShell D.A source center)
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    (hsplit : C.support =
      (C.support ∩ K0.support) ∪ (C.support ∩ K1.support))
    (hthree : 3 ≤
      (C.support ∩ S.capInteriorByIndex S.oppIndex2).card) :
    False := by
  have htwo : 2 <
      (C.support ∩ S.capInteriorByIndex S.oppIndex2).card := by
    omega
  rcases Finset.two_lt_card.mp htwo with
    ⟨x, hx, y, hy, z, hz, hxy, hxz, hyz⟩
  have hxC := (Finset.mem_inter.mp hx).1
  have hxI := (Finset.mem_inter.mp hx).2
  have hyC := (Finset.mem_inter.mp hy).1
  have hyI := (Finset.mem_inter.mp hy).2
  have hzC := (Finset.mem_inter.mp hz).1
  have hzI := (Finset.mem_inter.mp hz).2
  have class_mem (w : ℝ²) (hw : w ∈ C.support) :
      w ∈ K0.support ∨ w ∈ K1.support := by
    rw [hsplit] at hw
    rcases Finset.mem_union.mp hw with hw | hw
    · exact Or.inl (Finset.mem_inter.mp hw).2
    · exact Or.inr (Finset.mem_inter.mp hw).2
  rcases class_mem x hxC with hxK0 | hxK1 <;>
    rcases class_mem y hyC with hyK0 | hyK1 <;>
    rcases class_mem z hzC with hzK0 | hzK1
  · exact false_of_shell_sameClass_pair K0 C hcenterA hcenterNe
      hxC hyC hzC hxI hyI hzI hxK0 hyK0 hxy hxz hyz
  · exact false_of_shell_sameClass_pair K0 C hcenterA hcenterNe
      hxC hyC hzC hxI hyI hzI hxK0 hyK0 hxy hxz hyz
  · exact false_of_shell_sameClass_pair K0 C hcenterA hcenterNe
      hxC hzC hyC hxI hzI hyI hxK0 hzK0 hxz hxy hyz.symm
  · exact false_of_shell_sameClass_pair K1 C hcenterA hcenterNe
      hyC hzC hxC hyI hzI hxI hyK1 hzK1 hyz hxy.symm hxz.symm
  · exact false_of_shell_sameClass_pair K0 C hcenterA hcenterNe
      hyC hzC hxC hyI hzI hxI hyK0 hzK0 hyz hxy.symm hxz.symm
  · exact false_of_shell_sameClass_pair K1 C hcenterA hcenterNe
      hxC hzC hyC hxI hzI hyI hxK1 hzK1 hxz hxy hyz.symm
  · exact false_of_shell_sameClass_pair K1 C hcenterA hcenterNe
      hxC hyC hzC hxI hyI hzI hxK1 hyK1 hxy hxz hyz
  · exact false_of_shell_sameClass_pair K1 C hcenterA hcenterNe
      hxC hyC hzC hxI hyI hzI hxK1 hyK1 hxy hxz hyz

/-- Five strict-cap points from two disjoint selected four-classes cannot be
distributed through two disjoint critical four-shells by a simultaneous
double partition. -/
theorem false_of_twoRadius_doublePartition_largeInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source0 source1 b0 b1 : ℝ²}
    (K0 K1 : SelectedFourClass D.A S.oppApex2)
    (C0 : CriticalFourShell D.A source0 b0)
    (C1 : CriticalFourShell D.A source1 b1)
    (hclassesDisjoint : Disjoint K0.support K1.support)
    (hb0A : b0 ∈ D.A) (hb1A : b1 ∈ D.A)
    (hb0ne : b0 ≠ S.oppApex2) (hb1ne : b1 ≠ S.oppApex2)
    (P : TwoFourClassesTwoFourShellsDoublePartition
      K0.support K1.support C0.support C1.support)
    (hlarge : 5 ≤
      ((K0.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
        (K1.support ∩ S.capInteriorByIndex S.oppIndex2)).card) :
    False := by
  have hinteriorClassesDisjoint : Disjoint
      (K0.support ∩ S.capInteriorByIndex S.oppIndex2)
      (K1.support ∩ S.capInteriorByIndex S.oppIndex2) :=
    hclassesDisjoint.mono Finset.inter_subset_left Finset.inter_subset_left
  have hlargeNormalized : 5 ≤
      ((K0.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
        (K1.support ∩ S.capInteriorByIndex S.oppIndex2)).card := by
    rw [Finset.card_union_of_disjoint hinteriorClassesDisjoint]
    rw [Finset.card_union_of_disjoint hinteriorClassesDisjoint] at hlarge
    exact hlarge
  have hcovered :
      (K0.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
          (K1.support ∩ S.capInteriorByIndex S.oppIndex2) ⊆
        (C0.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
          (C1.support ∩ S.capInteriorByIndex S.oppIndex2) := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · rcases Finset.mem_inter.mp hz with ⟨hzK, hzI⟩
      have hzSplit : z ∈
          (C0.support ∩ K0.support) ∪ (C1.support ∩ K0.support) := by
        rw [P.rho_traces_union_eq]
        exact hzK
      rcases Finset.mem_union.mp hzSplit with hzC | hzC
      · exact Finset.mem_union_left _
          (Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hzC).1, hzI⟩)
      · exact Finset.mem_union_right _
          (Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hzC).1, hzI⟩)
    · rcases Finset.mem_inter.mp hz with ⟨hzK, hzI⟩
      have hzSplit : z ∈
          (C0.support ∩ K1.support) ∪ (C1.support ∩ K1.support) := by
        rw [P.sigma_traces_union_eq]
        exact hzK
      rcases Finset.mem_union.mp hzSplit with hzC | hzC
      · exact Finset.mem_union_left _
          (Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hzC).1, hzI⟩)
      · exact Finset.mem_union_right _
          (Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hzC).1, hzI⟩)
  have hshellLarge : 5 ≤
      ((C0.support ∩ S.capInteriorByIndex S.oppIndex2) ∪
        (C1.support ∩ S.capInteriorByIndex S.oppIndex2)).card :=
    le_trans hlargeNormalized (Finset.card_le_card hcovered)
  have hshellSum : 5 ≤
      (C0.support ∩ S.capInteriorByIndex S.oppIndex2).card +
        (C1.support ∩ S.capInteriorByIndex S.oppIndex2).card :=
    le_trans hshellLarge (Finset.card_union_le _ _)
  by_cases hC0 : 3 ≤
      (C0.support ∩ S.capInteriorByIndex S.oppIndex2).card
  · exact false_of_shell_threeInterior K0 K1 C0 hb0A hb0ne
      P.b_eq_traces_union hC0
  · have hC1 : 3 ≤
        (C1.support ∩ S.capInteriorByIndex S.oppIndex2).card := by
      omega
    exact false_of_shell_threeInterior K0 K1 C1 hb1A hb1ne
      P.c_eq_traces_union hC1

end ATailTwoRadiusDoublePartitionLargeInterior
end Problem97
