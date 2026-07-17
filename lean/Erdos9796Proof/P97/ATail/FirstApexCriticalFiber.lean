/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Source-faithful first-apex critical fiber

A frontier common-deletion parent makes the first physical apex robust under
every single deletion.  The retained critical blocker map therefore omits
that apex, so finite self-map pigeonhole forces two distinct sources with the
same actual blocker.

This module packages the full source-indexed consequence.  In particular, it
retains both deletion-critical facts instead of weakening the collision to one
anonymous selected row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstApexCriticalFiber

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress

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

/-- Complete source-indexed normal form forced by one frontier
common-deletion parent residual.

The two distinct sources have one actual blocker and one exact four-point
critical shell.  Both sources lie in that shell, and deletion of either source
destroys K4 at the common blocker. -/
structure FrontierCommonDeletionCriticalFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  firstApex_robust : FullyDeletionRobustAt D S.oppApex1
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  source_points_ne : source₁.1 ≠ source₂.1
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂
  commonBlocker_ne_firstApex :
    H.centerAt source₁.1 source₁.2 ≠ S.oppApex1
  commonBlocker_mem_A : H.centerAt source₁.1 source₁.2 ∈ D.A
  supports_eq :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  radii_eq :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius
  source₁_mem_commonSupport :
    source₁.1 ∈
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₂_mem_commonSupport :
    source₂.1 ∈
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  commonSupport_card_eq_four :
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support.card = 4
  source₁_deletion_critical :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₁.1)
      (H.centerAt source₁.1 source₁.2)
  source₂_deletion_critical :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source₂.1)
      (H.centerAt source₁.1 source₁.2)

/-- Every frontier common-deletion parent residual has a source-faithful
two-source deletion-critical fiber. -/
theorem nonempty_frontierCommonDeletionCriticalFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FrontierCommonDeletionCriticalFiber R) := by
  have hrobust : FullyDeletionRobustAt D S.oppApex1 :=
    R.firstApexFullyDeletionRobust
  rcases hrobust.exists_distinct_sources_same_blocker
      H (oppApex1_mem_A S) with
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
    firstApex_robust := hrobust
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := fun hpoints ↦ hsources (Subtype.ext hpoints)
    blockers_eq := hblockers
    commonBlocker_ne_firstApex :=
      hrobust.centerAt_ne H source₁.1 source₁.2
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := hsupports
    radii_eq := hradii
    source₁_mem_commonSupport := hsource₁Common
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical := by
      simpa only [hcenters] using H.no_qfree_at source₂.1 source₂.2 }⟩

end ATailFirstApexCriticalFiber
end Problem97
