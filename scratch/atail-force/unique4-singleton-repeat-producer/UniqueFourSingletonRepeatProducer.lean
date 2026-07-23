/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourSingletonCoreTerminal
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Actual-row occurrence at the singleton outside sources

The singleton shell contains two named sources outside the physical cap of
its center.  The fixed installed critical system therefore supplies one
actual row through each endpoint.  If those two source rows have a common
blocker, exact critical support locks put both endpoints in one actual row.

The common blocker is then either the singleton center itself or lies outside
the singleton center's cap.  A distinct common blocker inside the same cap is
exactly the already-refuted same-cap repeat.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourSingletonRepeatProducerScratch

open ATailCriticalPairFrontier
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourSingletonCoreTerminalScratch

/-- The two source-indexed actual rows through the singleton outside points
either have distinct blockers, or one common row contains the whole outside
pair.  In the common-blocker case that blocker is the singleton center or is
outside the singleton center's physical cap.

This is the unconditional actual-row occurrence supplied by the source.  It
does not force the contradictory same-cap distinct-center repeat. -/
theorem outsideSourceRows_distinct_or_common_at_center_or_outside_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q) :
    P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A ≠
        P.installedSystem.centerAt P.outside₂ P.outside₂_mem_A ∨
      (P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A = P.center ∧
        P.outside₁ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support ∧
        P.outside₂ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support) ∨
      (P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A ∉
          S.capByIndex P.capIndex ∧
        P.outside₁ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support ∧
        P.outside₂ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support) := by
  let center₁ :=
    P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A
  let center₂ :=
    P.installedSystem.centerAt P.outside₂ P.outside₂_mem_A
  by_cases hcenters : center₁ = center₂
  · have hsupports := selectedSupports_eq_of_actualBlockers_eq
      P.installedSystem P.outside₁_mem_A P.outside₂_mem_A hcenters
    have houtside₁ :
        P.outside₁ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support :=
      (P.installedSystem.selectedAt P.outside₁
        P.outside₁_mem_A).toCriticalFourShell.q_mem_support
    have houtside₂ :
        P.outside₂ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support := by
      rw [hsupports]
      exact
        (P.installedSystem.selectedAt P.outside₂
          P.outside₂_mem_A).toCriticalFourShell.q_mem_support
    by_cases hcenter : center₁ = P.center
    · exact Or.inr (Or.inl ⟨hcenter, houtside₁, houtside₂⟩)
    · have hcenterOutside : center₁ ∉ S.capByIndex P.capIndex := by
        intro hcenterCap
        exact false_of_hasSameCapActualRowRepeat P
          ⟨P.outside₁, P.outside₁_mem_A, hcenterCap, hcenter,
            houtside₁, houtside₂⟩
      exact Or.inr (Or.inr ⟨hcenterOutside, houtside₁, houtside₂⟩)
  · exact Or.inl hcenters

/-- Any actual critical row whose blocker returns to the installed singleton
center has the singleton row's exact support, and hence contains both named
outside points.  This records the full usable payload of either center-return
arm of `outsideSourceRows_normalForm`; it does not produce a second center. -/
theorem outsidePair_mem_actualRow_of_center_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter :
      P.installedSystem.centerAt source hsource = P.center) :
    P.outside₁ ∈
        (P.installedSystem.selectedAt source hsource).toCriticalFourShell.support ∧
      P.outside₂ ∈
        (P.installedSystem.selectedAt source hsource).toCriticalFourShell.support := by
  have hcenters :
      P.installedSystem.centerAt source hsource =
        P.installedSystem.centerAt P.source P.source_mem_A :=
    hcenter.trans P.installed_centerAt.symm
  have hsupports := selectedSupports_eq_of_actualBlockers_eq
    P.installedSystem hsource P.source_mem_A hcenters
  constructor
  · rw [hsupports]
    exact P.outside₁_mem_installedRow
  · rw [hsupports]
    exact P.outside₂_mem_installedRow

/-- Exact source-level normal form for the two outside-source rows.  Either
one outside source already belongs to the singleton-center blocker fiber, or
the two sources share an outside-cap blocker whose complete row contains the
pair, or the singleton row and the two source rows expose three distinct
centers with the displayed one-sided incidences.

The final three-center branch is the weakest unconditional multicenter
occurrence left after the same-cap repeat is removed. -/
theorem outsideSourceRows_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q) :
    let center₁ :=
      P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A
    let center₂ :=
      P.installedSystem.centerAt P.outside₂ P.outside₂_mem_A
    center₁ = P.center ∨ center₂ = P.center ∨
      (center₁ = center₂ ∧ center₁ ∉ S.capByIndex P.capIndex ∧
        P.outside₁ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support ∧
        P.outside₂ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support) ∨
      (center₁ ≠ center₂ ∧ center₁ ≠ P.center ∧ center₂ ≠ P.center ∧
        P.outside₁ ∈
          (P.installedSystem.selectedAt P.outside₁
            P.outside₁_mem_A).toCriticalFourShell.support ∧
        P.outside₂ ∈
          (P.installedSystem.selectedAt P.outside₂
            P.outside₂_mem_A).toCriticalFourShell.support) := by
  dsimp only
  let center₁ :=
    P.installedSystem.centerAt P.outside₁ P.outside₁_mem_A
  let center₂ :=
    P.installedSystem.centerAt P.outside₂ P.outside₂_mem_A
  have houtside₁ :
      P.outside₁ ∈
        (P.installedSystem.selectedAt P.outside₁
          P.outside₁_mem_A).toCriticalFourShell.support :=
    (P.installedSystem.selectedAt P.outside₁
      P.outside₁_mem_A).toCriticalFourShell.q_mem_support
  have houtside₂ :
      P.outside₂ ∈
        (P.installedSystem.selectedAt P.outside₂
          P.outside₂_mem_A).toCriticalFourShell.support :=
    (P.installedSystem.selectedAt P.outside₂
      P.outside₂_mem_A).toCriticalFourShell.q_mem_support
  by_cases hcenter₁ : center₁ = P.center
  · exact Or.inl hcenter₁
  · by_cases hcenter₂ : center₂ = P.center
    · exact Or.inr (Or.inl hcenter₂)
    · by_cases hcenters : center₁ = center₂
      · have hsupports := selectedSupports_eq_of_actualBlockers_eq
          P.installedSystem P.outside₁_mem_A P.outside₂_mem_A hcenters
        have houtside₂First :
            P.outside₂ ∈
              (P.installedSystem.selectedAt P.outside₁
                P.outside₁_mem_A).toCriticalFourShell.support := by
          rw [hsupports]
          exact houtside₂
        have hcenterOutside : center₁ ∉ S.capByIndex P.capIndex := by
          intro hcenterCap
          exact false_of_hasSameCapActualRowRepeat P
            ⟨P.outside₁, P.outside₁_mem_A, hcenterCap, hcenter₁,
              houtside₁, houtside₂First⟩
        exact Or.inr (Or.inr (Or.inl
          ⟨hcenters, hcenterOutside, houtside₁, houtside₂First⟩))
      · exact Or.inr (Or.inr (Or.inr
          ⟨hcenters, hcenter₁, hcenter₂, houtside₁, houtside₂⟩))

#print axioms outsideSourceRows_distinct_or_common_at_center_or_outside_cap
#print axioms outsidePair_mem_actualRow_of_center_eq_singleton
#print axioms outsideSourceRows_normalForm

end ATailUniqueFourSingletonRepeatProducerScratch
end Problem97
