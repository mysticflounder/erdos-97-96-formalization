/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Scratch: critical-map classifier for a realizable shared pair

This file records the choice-safe continuation of the two realizable
equilateral second-generation profiles.  If two distinct carrier centers are
already equidistant from a carrier pair, a third carrier center on the same
perpendicular bisector is impossible by convex independence.  Consequently
the critical blocker chosen for either endpoint either preserves K4 after the
other endpoint is deleted, or is one of the two known centers.

No two-hit profile is declared impossible here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustClassifierTargetScratch

attribute [local instance] Classical.propDecidable

/-- A source blocker for a pair with two known carrier bisector centers either
survives deletion of the partner or coincides with one of those centers.

The omitted third branch is an immediate contradiction with
`Dumitrescu.perpBisector_apex_bound`. -/
theorem source_blocker_survives_or_eq_known_commonPair_center
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {source partner center₁ center₂ : ℝ²}
    (hsourceA : source ∈ D.A)
    (hpartnerA : partner ∈ D.A)
    (hsourcePartner : source ≠ partner)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : center₁ ≠ center₂)
    (hcenter₁ : dist center₁ source = dist center₁ partner)
    (hcenter₂ : dist center₂ source = dist center₂ partner) :
    HasNEquidistantPointsAt 4 (D.A.erase partner)
        (H.centerAt source hsourceA) ∨
      H.centerAt source hsourceA = center₁ ∨
      H.centerAt source hsourceA = center₂ := by
  by_cases hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase partner)
        (H.centerAt source hsourceA)
  · exact Or.inl hsurvives
  · have hpartnerShell :
        partner ∈
          (H.selectedAt source hsourceA).toCriticalFourShell.support :=
      ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
        (H.selectedAt source hsourceA) hsurvives
    have hblockerA : H.centerAt source hsourceA ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt source hsourceA).toCriticalFourShell.center_mem).2
    have hblocker :
        dist (H.centerAt source hsourceA) source =
          dist (H.centerAt source hsourceA) partner :=
      (H.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
          source
          (H.selectedAt source hsourceA).toCriticalFourShell.q_mem_support
        |>.trans
          ((H.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
            partner hpartnerShell).symm
    by_cases hfirst : H.centerAt source hsourceA = center₁
    · exact Or.inr (Or.inl hfirst)
    · by_cases hsecond : H.centerAt source hsourceA = center₂
      · exact Or.inr (Or.inr hsecond)
      · exfalso
        have hbound := Dumitrescu.perpBisector_apex_bound D.convex
          hsourceA hpartnerA hsourcePartner
        have hcenter₁Filter :
            center₁ ∈ D.A.filter
              (fun p => dist p source = dist p partner) :=
          Finset.mem_filter.mpr ⟨hcenter₁A, hcenter₁⟩
        have hcenter₂Filter :
            center₂ ∈ D.A.filter
              (fun p => dist p source = dist p partner) :=
          Finset.mem_filter.mpr ⟨hcenter₂A, hcenter₂⟩
        have hblockerFilter :
            H.centerAt source hsourceA ∈ D.A.filter
              (fun p => dist p source = dist p partner) :=
          Finset.mem_filter.mpr ⟨hblockerA, hblocker⟩
        have hthree :
            2 < (D.A.filter
              (fun p => dist p source = dist p partner)).card := by
          rw [Finset.two_lt_card]
          exact ⟨center₁, hcenter₁Filter,
            center₂, hcenter₂Filter,
            H.centerAt source hsourceA, hblockerFilter,
            hcenters, Ne.symm hfirst, Ne.symm hsecond⟩
        omega

/-- Selected-row interface for
`source_blocker_survives_or_eq_known_commonPair_center`. -/
theorem selected_commonPair_source_blocker_classifier
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {source partner center₁ center₂ : ℝ²}
    (K₁ : SelectedFourClass D.A center₁)
    (K₂ : SelectedFourClass D.A center₂)
    (hsourceK₁ : source ∈ K₁.support)
    (hpartnerK₁ : partner ∈ K₁.support)
    (hsourceK₂ : source ∈ K₂.support)
    (hpartnerK₂ : partner ∈ K₂.support)
    (hsourcePartner : source ≠ partner)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : center₁ ≠ center₂) :
    HasNEquidistantPointsAt 4 (D.A.erase partner)
        (H.centerAt source (K₁.support_subset_A hsourceK₁)) ∨
      H.centerAt source (K₁.support_subset_A hsourceK₁) = center₁ ∨
      H.centerAt source (K₁.support_subset_A hsourceK₁) = center₂ := by
  apply source_blocker_survives_or_eq_known_commonPair_center H
    (K₁.support_subset_A hsourceK₁)
    (K₁.support_subset_A hpartnerK₁)
    hsourcePartner hcenter₁A hcenter₂A hcenters
  · exact (K₁.support_eq_radius source hsourceK₁).trans
      (K₁.support_eq_radius partner hpartnerK₁).symm
  · exact (K₂.support_eq_radius source hsourceK₂).trans
      (K₂.support_eq_radius partner hpartnerK₂).symm

/-- Symmetric classifier for both endpoints of a realizable two-hit profile.
The result deliberately retains the deletion-survival arms. -/
theorem selected_commonPair_two_source_blocker_classifier
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {source partner center₁ center₂ : ℝ²}
    (K₁ : SelectedFourClass D.A center₁)
    (K₂ : SelectedFourClass D.A center₂)
    (hsourceK₁ : source ∈ K₁.support)
    (hpartnerK₁ : partner ∈ K₁.support)
    (hsourceK₂ : source ∈ K₂.support)
    (hpartnerK₂ : partner ∈ K₂.support)
    (hsourcePartner : source ≠ partner)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : center₁ ≠ center₂) :
    (HasNEquidistantPointsAt 4 (D.A.erase partner)
          (H.centerAt source (K₁.support_subset_A hsourceK₁)) ∨
        H.centerAt source (K₁.support_subset_A hsourceK₁) = center₁ ∨
        H.centerAt source (K₁.support_subset_A hsourceK₁) = center₂) ∧
      (HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt partner (K₁.support_subset_A hpartnerK₁)) ∨
        H.centerAt partner (K₁.support_subset_A hpartnerK₁) = center₁ ∨
        H.centerAt partner (K₁.support_subset_A hpartnerK₁) = center₂) := by
  constructor
  · exact selected_commonPair_source_blocker_classifier H K₁ K₂
      hsourceK₁ hpartnerK₁ hsourceK₂ hpartnerK₂
      hsourcePartner hcenter₁A hcenter₂A hcenters
  · exact selected_commonPair_source_blocker_classifier H K₁ K₂
      hpartnerK₁ hsourceK₁ hpartnerK₂ hsourceK₂
      hsourcePartner.symm hcenter₁A hcenter₂A hcenters

#print axioms source_blocker_survives_or_eq_known_commonPair_center
#print axioms selected_commonPair_source_blocker_classifier
#print axioms selected_commonPair_two_source_blocker_classifier

end ATailRobustClassifierTargetScratch
end Problem97
