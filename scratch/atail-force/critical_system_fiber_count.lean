/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# Critical-system blocker-fiber count

This scratch module isolates the finite counting content retained by one
`CriticalShellSystem`.  Every source assigned to one blocker center belongs
to the same exact four-point support, so every `centerAt` fiber has size at
most four.  Summing the fibers gives a lower bound on the number of distinct
blocker centers.

The final theorem records the strongest cap-placement consequence of this
count alone.  It deliberately exposes the complement-cap threshold; the
card-12 cap profiles do not meet that threshold.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CriticalShellSystem

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- Carrier sources whose chosen blocker is a fixed center. -/
noncomputable def centerFiber {A : Finset ℝ²} (H : CriticalShellSystem A)
    (center : ℝ²) : Finset (CarrierVertex A) :=
  A.attach.filter fun source => H.centerAt source.1 source.2 = center

/-- The finite image of the chosen blocker-center map. -/
noncomputable def centerImage {A : Finset ℝ²} (H : CriticalShellSystem A) :
    Finset ℝ² :=
  A.attach.image fun source => H.centerAt source.1 source.2

@[simp] theorem mem_centerFiber_iff
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (center : ℝ²) (source : CarrierVertex A) :
    source ∈ H.centerFiber center ↔
      H.centerAt source.1 source.2 = center := by
  simp [centerFiber]

/-- If two sources have the same chosen blocker center, the first source lies
in the exact four-point shell selected for the second source. -/
theorem source_mem_selectedAt_of_centerAt_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source reference : CarrierVertex A}
    (hcenter : H.centerAt source.1 source.2 =
      H.centerAt reference.1 reference.2) :
    source.1 ∈
      (H.selectedAt reference.1 reference.2).toCriticalFourShell.support := by
  let Ksource : SelectedFourClass A (H.centerAt source.1 source.2) :=
    transportSelectedFourClass
      (H.selectedAt reference.1 reference.2).toSelectedFourClass
      hcenter.symm
  have hsource : source.1 ∈ Ksource.support :=
    H.source_mem_selectedFourClass source.1 source.2 Ksource
  have hsupport :
      Ksource.support =
        (H.selectedAt reference.1 reference.2).toCriticalFourShell.support := by
    simp [Ksource, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  rwa [hsupport] at hsource

/-- Every fiber of `centerAt` has cardinality at most four. -/
theorem centerFiber_card_le_four
    {A : Finset ℝ²} (H : CriticalShellSystem A) (center : ℝ²) :
    (H.centerFiber center).card ≤ 4 := by
  classical
  rcases (H.centerFiber center).eq_empty_or_nonempty with hempty | ⟨reference, href⟩
  · simp [hempty]
  · have hrefCenter : H.centerAt reference.1 reference.2 = center :=
      (H.mem_centerFiber_iff center reference).mp href
    calc
      (H.centerFiber center).card ≤
          (H.selectedAt reference.1 reference.2).toCriticalFourShell.support.card := by
        refine Finset.card_le_card_of_injOn
          (fun source : CarrierVertex A => source.1) ?_ ?_
        · intro source hsource
          have hsourceCenter : H.centerAt source.1 source.2 = center :=
            (H.mem_centerFiber_iff center source).mp hsource
          exact H.source_mem_selectedAt_of_centerAt_eq
            (hsourceCenter.trans hrefCenter.symm)
        · intro source₁ _ source₂ _ hsource
          exact Subtype.ext hsource
      _ = 4 :=
        (H.selectedAt reference.1 reference.2).toCriticalFourShell.support_card

/-- Every chosen blocker center is an ambient carrier point. -/
theorem centerImage_subset_A
    {A : Finset ℝ²} (H : CriticalShellSystem A) :
    H.centerImage ⊆ A := by
  classical
  intro center hcenter
  rcases Finset.mem_image.mp hcenter with ⟨source, _, rfl⟩
  exact (Finset.mem_erase.mp
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2

/-- The carrier has at most four sources for every distinct chosen blocker
center.  Equivalently, the image has size at least `ceil(|A| / 4)`. -/
theorem card_le_four_mul_centerImage_card
    {A : Finset ℝ²} (H : CriticalShellSystem A) :
    A.card ≤ 4 * H.centerImage.card := by
  classical
  have hcount := Finset.card_le_mul_card_image
    (f := fun source : CarrierVertex A => H.centerAt source.1 source.2)
    A.attach 4 (by
      intro center _
      simpa [centerFiber] using H.centerFiber_card_le_four center)
  simpa [centerImage] using hcount

/-- Threshold form of the blocker-image lower bound. -/
theorem lt_centerImage_card_of_four_mul_lt_card
    {A : Finset ℝ²} (H : CriticalShellSystem A) {n : ℕ}
    (hcard : 4 * n < A.card) :
    n < H.centerImage.card := by
  have hcount := H.card_le_four_mul_centerImage_card
  omega

/-- The live `9 < |A|` hypothesis already forces at least three distinct
chosen blocker centers. -/
theorem three_le_centerImage_card_of_nine_lt_card
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (hcard : 9 < A.card) :
    3 ≤ H.centerImage.card := by
  have h := H.lt_centerImage_card_of_four_mul_lt_card (n := 2) (by omega)
  omega

/-- This fiber count forces a fourth distinct chosen blocker center once the
carrier has strictly more than twelve points. -/
theorem four_le_centerImage_card_of_twelve_lt_card
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (hcard : 12 < A.card) :
    4 ≤ H.centerImage.card := by
  have h := H.lt_centerImage_card_of_four_mul_lt_card (n := 3) hcard
  omega

/-- Strongest generic same-cap placement consequence of the fiber count.

If the whole carrier is too large to be covered by four source fibers over
all centers outside `cap` together with one exceptional center `p` inside
`cap`, then a chosen blocker center in `cap` distinct from `p` exists. -/
theorem exists_centerImage_mem_cap_ne_of_count
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (p : ℝ²)
    (hcard : 4 * ((A \ cap).card + 1) < A.card) :
    ∃ center ∈ H.centerImage, center ∈ cap ∧ center ≠ p := by
  classical
  by_contra hnone
  have hall : ∀ center, center ∈ H.centerImage → center ∈ cap →
      center = p := by
    intro center hcenterImage hcenterCap
    by_contra hcenterNe
    exact hnone ⟨center, hcenterImage, hcenterCap, hcenterNe⟩
  have hinside :
      (H.centerImage.filter fun center => center ∈ cap).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro center₁ hcenter₁ center₂ hcenter₂
    rcases Finset.mem_filter.mp hcenter₁ with ⟨hcenter₁Image, hcenter₁Cap⟩
    rcases Finset.mem_filter.mp hcenter₂ with ⟨hcenter₂Image, hcenter₂Cap⟩
    exact (hall center₁ hcenter₁Image hcenter₁Cap).trans
      (hall center₂ hcenter₂Image hcenter₂Cap).symm
  have houtside :
      (H.centerImage.filter fun center => ¬ center ∈ cap).card ≤
        (A \ cap).card := by
    apply Finset.card_le_card
    intro center hcenter
    rcases Finset.mem_filter.mp hcenter with ⟨hcenterImage, hcenterCap⟩
    exact Finset.mem_sdiff.mpr ⟨H.centerImage_subset_A hcenterImage, hcenterCap⟩
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := H.centerImage) (fun center => center ∈ cap)
  have himage : H.centerImage.card ≤ (A \ cap).card + 1 := by
    omega
  have hcount := H.card_le_four_mul_centerImage_card
  omega

/-- For a twelve-point carrier and a cap of size at most six, the numerical
threshold needed by `exists_centerImage_mem_cap_ne_of_count` is false. -/
theorem card_twelve_cap_card_le_six_not_count_threshold
    {A cap : Finset ℝ²} (hcapSubset : cap ⊆ A)
    (hAcard : A.card = 12) (hcapCard : cap.card ≤ 6) :
    ¬ 4 * ((A \ cap).card + 1) < A.card := by
  intro hthreshold
  have hsplit := Finset.card_sdiff_add_card_eq_card hcapSubset
  omega

end CriticalShellSystem
end Problem97

#print axioms Problem97.CriticalShellSystem.centerFiber_card_le_four
#print axioms Problem97.CriticalShellSystem.card_le_four_mul_centerImage_card
#print axioms Problem97.CriticalShellSystem.exists_centerImage_mem_cap_ne_of_count
