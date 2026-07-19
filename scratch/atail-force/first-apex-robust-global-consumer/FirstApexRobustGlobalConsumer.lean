/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# Global blocker-map consequence of first-apex deletion robustness

Assume the source-faithful frontier common-deletion residual has already been
turned into full single-deletion robustness at the first physical apex.  The
retained `CriticalShellSystem` can then never choose that apex as a blocker.

Because the chosen blocker map is a self-map of the finite carrier, omitting
one carrier value forces a nontrivial fiber collision.  Equal-center rigidity
then puts the two distinct sources in one common exact four-point shell.  This
is the strongest unconditional global consequence isolated here; no cap or
boundary placement of the collision sources is inferred.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstApexRobustGlobalConsumerScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailOrientedPhysicalApexIngress.CriticalPairFrontier

attribute [local instance] Classical.propDecidable

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

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Exact finite normal form forced by excluding the first apex from the
image of the retained blocker map.

The two rows have the same center, radius, and exact four-point support, and
that support contains both distinct source vertices. -/
structure FirstApexRobustGlobalBlockerNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  firstApex_robust : FullyDeletionRobustAt D S.oppApex1
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  source_points_ne : source₁.1 ≠ source₂.1
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂
  blocker_ne_firstApex :
    H.centerAt source₁.1 source₁.2 ≠ S.oppApex1
  commonBlocker_mem_A : H.centerAt source₁.1 source₁.2 ∈ D.A
  supports_eq :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  radii_eq :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius
  commonRadius_pos :
    0 < (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius
  source₁_mem_commonSupport :
    source₁.1 ∈
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₂_mem_commonSupport :
    source₂.1 ∈
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  commonSupport_card_eq_four :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support.card = 4
  commonBlocker_ne_source₁ :
    H.centerAt source₁.1 source₁.2 ≠ source₁.1
  commonBlocker_ne_source₂ :
    H.centerAt source₁.1 source₁.2 ≠ source₂.1
  source₁_deletion_critical :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₁.1)
      (H.centerAt source₁.1 source₁.2)
  source₂_deletion_critical :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₂.1)
      (H.centerAt source₁.1 source₁.2)

/-- Full deletion robustness at a carrier point removes that point from the
image of the chosen blocker self-map. -/
theorem blockerVertex_ne_of_fullyDeletionRobustAt
    {D : CounterexampleData} {center : ℝ²}
    (R : FullyDeletionRobustAt D center)
    (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenterA : center ∈ D.A) :
    H.blockerVertex source ≠
      (⟨center, hcenterA⟩ : CriticalShellSystem.CarrierVertex D.A) := by
  intro h
  have hval : H.centerAt source.1 source.2 = center :=
    congrArg Subtype.val h
  exact R.centerAt_ne H source.1 source.2 hval

/-- A robust carrier point omitted by the blocker self-map forces two
distinct sources with the same chosen blocker. -/
theorem exists_distinct_sources_same_blocker_of_fullyDeletionRobustAt
    {D : CounterexampleData} {center : ℝ²}
    (R : FullyDeletionRobustAt D center)
    (H : CriticalShellSystem D.A)
    (hcenterA : center ∈ D.A) :
    ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      source₁ ≠ source₂ ∧
        H.blockerVertex source₁ = H.blockerVertex source₂ := by
  let centerVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨center, hcenterA⟩
  have hnotSurjective : ¬ Function.Surjective H.blockerVertex := by
    intro hsurjective
    rcases hsurjective centerVertex with ⟨source, hsource⟩
    exact blockerVertex_ne_of_fullyDeletionRobustAt R H source hcenterA hsource
  have hnotInjective : ¬ Function.Injective H.blockerVertex := by
    intro hinjective
    exact hnotSurjective (Finite.injective_iff_surjective.mp hinjective)
  rcases Function.not_injective_iff.mp hnotInjective with
    ⟨source₁, source₂, hblockers, hsources⟩
  exact ⟨source₁, source₂, hsources, hblockers⟩

/-- Assemble the equal-center collision into one exact common-shell normal
form.  The robustness proof is an explicit input so this scratch theorem can
consume the concurrently developed first-apex robustness result without
duplicating its proof. -/
theorem nonempty_firstApexRobustGlobalBlockerNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_parent : FrontierCommonDeletionParentResidual F)
    (R : FullyDeletionRobustAt D S.oppApex1) :
    Nonempty (FirstApexRobustGlobalBlockerNormalForm (S := S) H) := by
  rcases exists_distinct_sources_same_blocker_of_fullyDeletionRobustAt
      R H (oppApex1_mem_A S) with
    ⟨source₁, source₂, hsources, hblockers⟩
  have hcenters :
      H.centerAt source₁.1 source₁.2 =
        H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  let K₂ : SelectedFourClass D.A (H.centerAt source₁.1 source₁.2) :=
    transportSelectedFourClass
      (H.selectedAt source₂.1 source₂.2).toSelectedFourClass
      hcenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  have hsupports :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
          K₂.support :=
        (H.selectedFourClass_support_eq_shell source₁.1 source₁.2 K₂).symm
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
        hK₂Support
  have hsource₁Own :
      source₁.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support :=
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Own :
      source₂.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
    (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hsource₁Common :
      source₁.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    rw [← hsupports]
    exact hsource₁Own
  have hsource₂Common :
      source₂.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact hsource₂Own
  have hradii :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
          dist (H.centerAt source₁.1 source₁.2) source₁.1 :=
        ((H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Own).symm
      _ = dist (H.centerAt source₂.1 source₂.2) source₁.1 := by
        rw [hcenters]
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius :=
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Common
  exact ⟨{
    firstApex_robust := R
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := fun hpoints ↦ hsources (Subtype.ext hpoints)
    blockers_eq := hblockers
    blocker_ne_firstApex := R.centerAt_ne H source₁.1 source₁.2
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := hsupports
    radii_eq := hradii
    commonRadius_pos :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius_pos
    source₁_mem_commonSupport := hsource₁Common
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    commonBlocker_ne_source₁ := by
      intro hcenterSource
      apply (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_not_mem_support
      simpa only [hcenterSource] using hsource₁Own
    commonBlocker_ne_source₂ := by
      intro hcenterSource
      apply (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_not_mem_support
      simpa only [hcenterSource] using hsource₂Common
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical := by
      simpa only [hcenters] using H.no_qfree_at source₂.1 source₂.2 }⟩

#print axioms blockerVertex_ne_of_fullyDeletionRobustAt
#print axioms exists_distinct_sources_same_blocker_of_fullyDeletionRobustAt
#print axioms nonempty_firstApexRobustGlobalBlockerNormalForm

end ATailFirstApexRobustGlobalConsumerScratch
end Problem97
