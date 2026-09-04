/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.ConvexPerpendicularBisectorSides
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# Two-point selected-row deletion survival

If two distinct endpoints of one selected critical shell both block deletion
at a second source, the second source's center lies on the same perpendicular
bisector.  Dumitrescu's bound then forces that center to be the first source's
center or the distinguished carrier.  The selected-support comparison rules
out the first option for an outside source, and the center hypothesis rules
out the second.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoPointSelectedRowDeletionSurvival

attribute [local instance] Classical.propDecidable

open ATailDeletionRobustness
open ATailSurvivalCover
open ATAILStageOnePrescribedApexDichotomy

/-- For two distinct points in one selected critical shell, an outside source
survives deletion of at least one endpoint at any other non-distinguished
blocker center. -/
theorem two_point_row_deletion_survival
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (H : CriticalShellSystem A)
    {O s p q t : ℝ²}
    (hOA : O ∈ A) (hsA : s ∈ A) (htA : t ∈ A)
    (hpq : p ≠ q)
    (hp : p ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hq : q ∈ (H.selectedAt s hsA).toCriticalFourShell.support)
    (hOeq : dist O p = dist O q)
    (hsource_center_ne : H.centerAt s hsA ≠ O)
    (ht_outside :
      t ∉ (H.selectedAt s hsA).toCriticalFourShell.support)
    (ht_center_ne : H.centerAt t htA ≠ O) :
    HasNEquidistantPointsAt 4 (A.erase p) (H.centerAt t htA) ∨
      HasNEquidistantPointsAt 4 (A.erase q) (H.centerAt t htA) := by
  by_cases hp_survives :
      HasNEquidistantPointsAt 4 (A.erase p) (H.centerAt t htA)
  · exact Or.inl hp_survives
  by_cases hq_survives :
      HasNEquidistantPointsAt 4 (A.erase q) (H.centerAt t htA)
  · exact Or.inr hq_survives
  exfalso
  let Ks := (H.selectedAt s hsA).toCriticalFourShell
  let Kt := (H.selectedAt t htA).toCriticalFourShell
  have hpA : p ∈ A := Ks.support_subset_A hp
  have hqA : q ∈ A := Ks.support_subset_A hq
  have hs_centerA : H.centerAt s hsA ∈ A :=
    (Finset.mem_erase.mp Ks.center_mem).2
  have ht_centerA : H.centerAt t htA ∈ A :=
    (Finset.mem_erase.mp Kt.center_mem).2
  have hpKt : p ∈ Kt.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt t htA) hp_survives
  have hqKt : q ∈ Kt.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt t htA) hq_survives
  have hcenter_s_bisector :
      H.centerAt s hsA ∈ A.filter (fun z ↦ dist z p = dist z q) := by
    refine Finset.mem_filter.mpr ⟨hs_centerA, ?_⟩
    exact (Ks.support_eq_radius p hp).trans
      (Ks.support_eq_radius q hq).symm
  have hO_bisector :
      O ∈ A.filter (fun z ↦ dist z p = dist z q) :=
    Finset.mem_filter.mpr ⟨hOA, hOeq⟩
  have hcenter_t_bisector :
      H.centerAt t htA ∈ A.filter (fun z ↦ dist z p = dist z q) := by
    refine Finset.mem_filter.mpr ⟨ht_centerA, ?_⟩
    exact (Kt.support_eq_radius p hpKt).trans
      (Kt.support_eq_radius q hqKt).symm
  have hperp_card :
      (A.filter (fun z ↦ dist z p = dist z q)).card ≤ 2 :=
    Dumitrescu.perpBisector_apex_bound hconv hpA hqA hpq
  have hpair_subset :
      ({H.centerAt s hsA, O} : Finset ℝ²) ⊆
        A.filter (fun z ↦ dist z p = dist z q) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hcenter_s_bisector
    · exact hO_bisector
  have hfilter_eq :
      A.filter (fun z ↦ dist z p = dist z q) =
        ({H.centerAt s hsA, O} : Finset ℝ²) := by
    symm
    apply Finset.eq_of_subset_of_card_le hpair_subset
    simpa [hsource_center_ne] using hperp_card
  have hcenter_t_pair :
      H.centerAt t htA ∈ ({H.centerAt s hsA, O} : Finset ℝ²) := by
    rw [← hfilter_eq]
    exact hcenter_t_bisector
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcenter_t_pair
  rcases hcenter_t_pair with hcenter_ts | hcenter_tO
  · have hsupports : Kt.support = Ks.support :=
      selectedSupports_eq_of_actualBlockers_eq H htA hsA hcenter_ts
    apply ht_outside
    rw [← hsupports]
    exact Kt.q_mem_support
  · exact ht_center_ne hcenter_tO

/-- If one endpoint is omitted from a selected four-class at the target
center, its deletion supplies the corresponding branch of the survival
disjunction. -/
theorem two_point_row_deletion_survival_of_endpoint_omission
    {A : Finset ℝ²} {center p q : ℝ²}
    (K : SelectedFourClass A center)
    (homission : p ∉ K.support ∨ q ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase p) center ∨
      HasNEquidistantPointsAt 4 (A.erase q) center := by
  rcases homission with hp | hq
  · exact Or.inl (selectedFourClass_survives_erase_of_not_mem K hp)
  · exact Or.inr (selectedFourClass_survives_erase_of_not_mem K hq)

end ATailTwoPointSelectedRowDeletionSurvival
end Problem97
