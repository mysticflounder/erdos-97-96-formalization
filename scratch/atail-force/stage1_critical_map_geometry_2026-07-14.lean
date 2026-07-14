/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# ATAIL Stage-I cap-local critical-map geometry

This scratch module combines the exact support locking of one
`CriticalShellSystem` with ordered-cap distance injectivity.  It proves that a
blocker center lying in an indexed cap can receive at most two sources from
that same cap.

The final arithmetic lemmas record the exact limit of this refinement.  If no
blocker center other than one distinguished point lies in a cap, then the cap
can still contain up to two sources mapped inside plus four sources for every
blocker center outside.  The card-12 cap profiles are far below that capacity,
so this cap-local theorem does not by itself produce a second same-cap center,
reciprocal source incidence, or a banked equality/order core.
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

/-- Sources in a fixed cap whose chosen blocker is a fixed center. -/
noncomputable def centerFiberIn
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (center : ℝ²) : Finset (CarrierVertex A) :=
  A.attach.filter fun source =>
    H.centerAt source.1 source.2 = center ∧ source.1 ∈ cap

/-- Carrier sources lying in a fixed cap. -/
noncomputable def sourcesIn
    {A : Finset ℝ²} (_H : CriticalShellSystem A)
    (cap : Finset ℝ²) : Finset (CarrierVertex A) :=
  A.attach.filter fun source => source.1 ∈ cap

/-- Blocker centers used by sources from a fixed cap. -/
noncomputable def centerImageOfSourcesIn
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) : Finset ℝ² :=
  (H.sourcesIn cap).image fun source => H.centerAt source.1 source.2

@[simp] theorem mem_centerFiberIn_iff
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (center : ℝ²) (source : CarrierVertex A) :
    source ∈ H.centerFiberIn cap center ↔
      H.centerAt source.1 source.2 = center ∧ source.1 ∈ cap := by
  simp [centerFiberIn]

theorem sourcesIn_filter_center_eq_centerFiberIn
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (center : ℝ²) :
    (H.sourcesIn cap).filter
        (fun source => H.centerAt source.1 source.2 = center) =
      H.centerFiberIn cap center := by
  classical
  ext source
  constructor
  · intro hsource
    rcases Finset.mem_filter.mp hsource with ⟨hsourceIn, hcenter⟩
    rcases Finset.mem_filter.mp hsourceIn with ⟨hsourceA, hsourceCap⟩
    exact Finset.mem_filter.mpr
      ⟨hsourceA, ⟨hcenter, hsourceCap⟩⟩
  · intro hsource
    rcases Finset.mem_filter.mp hsource with
      ⟨hsourceA, hcenter, hsourceCap⟩
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_filter.mpr ⟨hsourceA, hsourceCap⟩, hcenter⟩

/-- The subtype of sources in a carrier subset has the same cardinality as
that subset. -/
theorem sourcesIn_card_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (hcap : cap ⊆ A) :
    (H.sourcesIn cap).card = cap.card := by
  classical
  have himage :
      (H.sourcesIn cap).image (fun source => source.1) = cap := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨source, hsource, rfl⟩
      exact (Finset.mem_filter.mp hsource).2
    · intro hx
      exact Finset.mem_image.mpr
        ⟨⟨x, hcap hx⟩, by simp [sourcesIn, hx], rfl⟩
  calc
    (H.sourcesIn cap).card =
        ((H.sourcesIn cap).image (fun source => source.1)).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ = cap.card := congrArg Finset.card himage

/-- Every blocker center used by a source from `cap` is an ambient carrier
point. -/
theorem centerImageOfSourcesIn_subset_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) :
    H.centerImageOfSourcesIn cap ⊆ A := by
  classical
  intro center hcenter
  rcases Finset.mem_image.mp hcenter with ⟨source, _hsource, rfl⟩
  exact (Finset.mem_erase.mp
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2

private theorem source_mem_reference_support_of_centerAt_eq
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

/-- Restricting to sources in an arbitrary set preserves the generic
four-source blocker-fiber bound. -/
theorem centerFiberIn_card_le_four
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (cap : Finset ℝ²) (center : ℝ²) :
    (H.centerFiberIn cap center).card ≤ 4 := by
  classical
  rcases (H.centerFiberIn cap center).eq_empty_or_nonempty with
    hempty | ⟨reference, href⟩
  · simp [hempty]
  · have hrefCenter : H.centerAt reference.1 reference.2 = center :=
      (H.mem_centerFiberIn_iff cap center reference).mp href |>.1
    subst center
    calc
      (H.centerFiberIn cap (H.centerAt reference.1 reference.2)).card ≤
          (H.selectedAt reference.1 reference.2).toCriticalFourShell.support.card := by
        refine Finset.card_le_card_of_injOn
          (fun source : CarrierVertex A => source.1) ?_ ?_
        · intro source hsource
          have hsourceCenter :=
            (H.mem_centerFiberIn_iff cap
              (H.centerAt reference.1 reference.2) source).mp hsource |>.1
          exact H.source_mem_reference_support_of_centerAt_eq hsourceCenter
        · intro source₁ _ source₂ _ hsource
          exact Subtype.ext hsource
      _ = 4 :=
        (H.selectedAt reference.1 reference.2).toCriticalFourShell.support_card

/-- A blocker center in an indexed cap has at most two sources from that cap.

All sources in one blocker fiber lie in the same exact four-point support.
Ordered-cap distance injectivity bounds the intersection of that support with
the cap by two. -/
theorem centerFiberIn_capByIndex_card_le_two
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3) (center : ℝ²)
    (hcenter : center ∈ S.capByIndex i) :
    (H.centerFiberIn (S.capByIndex i) center).card ≤ 2 := by
  classical
  rcases (H.centerFiberIn (S.capByIndex i) center).eq_empty_or_nonempty with
    hempty | ⟨reference, href⟩
  · simp [hempty]
  · have hrefCenter : H.centerAt reference.1 reference.2 = center :=
      (H.mem_centerFiberIn_iff (S.capByIndex i) center reference).mp href |>.1
    subst center
    calc
      (H.centerFiberIn (S.capByIndex i)
          (H.centerAt reference.1 reference.2)).card ≤
          ((H.selectedAt reference.1 reference.2).toSelectedFourClass.support ∩
            S.capByIndex i).card := by
        refine Finset.card_le_card_of_injOn
          (fun source : CarrierVertex D.A => source.1) ?_ ?_
        · intro source hsource
          have hsourceData :=
            (H.mem_centerFiberIn_iff (S.capByIndex i)
              (H.centerAt reference.1 reference.2) source).mp hsource
          exact Finset.mem_inter.mpr ⟨
            H.source_mem_reference_support_of_centerAt_eq hsourceData.1,
            hsourceData.2⟩
        · intro source₁ _ source₂ _ hsource
          exact Subtype.ext hsource
      _ ≤ 2 :=
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex i
          (H.selectedAt reference.1 reference.2).toSelectedFourClass
          (by simpa using hcenter)

/-- Exact mixed fiber capacity for sources of one indexed cap.

An image center inside the cap contributes at most two cap sources.  An image
center outside the cap retains only the generic four-source bound. -/
theorem sourcesIn_capByIndex_card_le_mixed_center_capacity
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3) :
    (H.sourcesIn (S.capByIndex i)).card ≤
      ∑ center ∈ H.centerImageOfSourcesIn (S.capByIndex i),
        if center ∈ S.capByIndex i then 2 else 4 := by
  classical
  let f : CarrierVertex D.A → ℝ² :=
    fun source => H.centerAt source.1 source.2
  calc
    (H.sourcesIn (S.capByIndex i)).card =
        ∑ center ∈ H.centerImageOfSourcesIn (S.capByIndex i),
          ((H.sourcesIn (S.capByIndex i)).filter
            (fun source => f source = center)).card := by
      simpa [f, centerImageOfSourcesIn] using
        Finset.card_eq_sum_card_image f (H.sourcesIn (S.capByIndex i))
    _ ≤ ∑ center ∈ H.centerImageOfSourcesIn (S.capByIndex i),
        if center ∈ S.capByIndex i then 2 else 4 := by
      apply Finset.sum_le_sum
      intro center hcenter
      rw [show
        (H.sourcesIn (S.capByIndex i)).filter
            (fun source => f source = center) =
          H.centerFiberIn (S.capByIndex i) center by
        simpa [f] using
          H.sourcesIn_filter_center_eq_centerFiberIn
            (S.capByIndex i) center]
      by_cases hcenterCap : center ∈ S.capByIndex i
      · simpa [hcenterCap] using
          H.centerFiberIn_capByIndex_card_le_two S i center hcenterCap
      · simpa [hcenterCap] using
          H.centerFiberIn_card_le_four (S.capByIndex i) center

/-- Closed form of the mixed source-fiber capacity. -/
theorem sourcesIn_capByIndex_card_le_two_mul_inside_add_four_mul_outside
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3) :
    (H.sourcesIn (S.capByIndex i)).card ≤
      2 * ((H.centerImageOfSourcesIn (S.capByIndex i)).filter
          (fun center => center ∈ S.capByIndex i)).card +
      4 * ((H.centerImageOfSourcesIn (S.capByIndex i)).filter
          (fun center => center ∉ S.capByIndex i)).card := by
  classical
  have hmixed :=
    H.sourcesIn_capByIndex_card_le_mixed_center_capacity S i
  calc
    (H.sourcesIn (S.capByIndex i)).card ≤
        ∑ center ∈ H.centerImageOfSourcesIn (S.capByIndex i),
          if center ∈ S.capByIndex i then 2 else 4 := hmixed
    _ = 2 * ((H.centerImageOfSourcesIn (S.capByIndex i)).filter
            (fun center => center ∈ S.capByIndex i)).card +
        4 * ((H.centerImageOfSourcesIn (S.capByIndex i)).filter
            (fun center => center ∉ S.capByIndex i)).card := by
      rw [Finset.sum_ite]
      simp [mul_comm]

/-- If at most one blocker center used by cap sources lies in the cap, then
the exact geometric improvement reduces to `|cap| ≤ 2 + 4|A \ cap|`. -/
theorem capByIndex_card_le_two_add_four_mul_complement_of_unique_inside_center
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3)
    (p : ℝ²)
    (hunique : ∀ center,
      center ∈ H.centerImageOfSourcesIn (S.capByIndex i) →
      center ∈ S.capByIndex i → center = p) :
    (S.capByIndex i).card ≤ 2 + 4 * (D.A \ S.capByIndex i).card := by
  classical
  let image := H.centerImageOfSourcesIn (S.capByIndex i)
  let inside := image.filter fun center => center ∈ S.capByIndex i
  let outside := image.filter fun center => center ∉ S.capByIndex i
  have hinside : inside.card ≤ 1 := by
    rw [Finset.card_le_one]
    intro center₁ hcenter₁ center₂ hcenter₂
    rcases Finset.mem_filter.mp hcenter₁ with ⟨hcenter₁Image, hcenter₁Cap⟩
    rcases Finset.mem_filter.mp hcenter₂ with ⟨hcenter₂Image, hcenter₂Cap⟩
    exact (hunique center₁ hcenter₁Image hcenter₁Cap).trans
      (hunique center₂ hcenter₂Image hcenter₂Cap).symm
  have houtside : outside.card ≤ (D.A \ S.capByIndex i).card := by
    apply Finset.card_le_card
    intro center hcenter
    rcases Finset.mem_filter.mp hcenter with ⟨hcenterImage, hcenterCap⟩
    exact Finset.mem_sdiff.mpr ⟨
      H.centerImageOfSourcesIn_subset_A (S.capByIndex i) hcenterImage,
      hcenterCap⟩
  have hcount :=
    H.sourcesIn_capByIndex_card_le_two_mul_inside_add_four_mul_outside S i
  have hsources :
      (H.sourcesIn (S.capByIndex i)).card = (S.capByIndex i).card :=
    H.sourcesIn_card_eq (S.capByIndex i) (S.capByIndex_subset i)
  change (H.sourcesIn (S.capByIndex i)).card ≤
    2 * inside.card + 4 * outside.card at hcount
  rw [hsources] at hcount
  omega

/-- Pure arithmetic threshold behind any attempt to force a second blocker
center into a cap from the cap-local fiber bounds alone.

At most one inside center contributes at most two sources, while every one of
`outsideCenters` outside centers can contribute at most four. -/
theorem one_inside_center_capacity
    {capSources outsideCenters : ℕ}
    (hcount : capSources ≤ 2 + 4 * outsideCenters) :
    ¬ 2 + 4 * outsideCenters < capSources := by
  omega

/-- For every card-12 cap size allowed by the current no-`IsM44` profiles, the
mixed `2 * inside + 4 * outside` capacity threshold is arithmetically false
even if every outside carrier point is used as a blocker center. -/
theorem card_twelve_cap_four_to_six_not_mixed_capacity_threshold
    {A cap : Finset ℝ²} (hcap : cap ⊆ A)
    (hAcard : A.card = 12)
    (hcapLower : 4 ≤ cap.card) (hcapUpper : cap.card ≤ 6) :
    ¬ 2 + 4 * (A \ cap).card < cap.card := by
  have hsplit := Finset.card_sdiff_add_card_eq_card hcap
  omega

end CriticalShellSystem
end Problem97

#print axioms Problem97.CriticalShellSystem.centerFiberIn_capByIndex_card_le_two
#print axioms
  Problem97.CriticalShellSystem.sourcesIn_capByIndex_card_le_two_mul_inside_add_four_mul_outside
#print axioms
  Problem97.CriticalShellSystem.capByIndex_card_le_two_add_four_mul_complement_of_unique_inside_center
#print axioms Problem97.CriticalShellSystem.one_inside_center_capacity
#print axioms
  Problem97.CriticalShellSystem.card_twelve_cap_four_to_six_not_mixed_capacity_threshold
