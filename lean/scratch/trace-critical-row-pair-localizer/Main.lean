import Erdos9796Proof.P97.ATail.RetainedCollisionCapLocalization

/-!
# Trace: critical-row pair localizer

This scratch file separates the local consequence for a bare named critical
four-class from the stronger production theorem for an actual system row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace TraceCriticalRowPairLocalizer

open ATailDeletionRobustness
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailRetainedCollisionCapLocalization

attribute [local instance] Classical.propDecidable

/-- A bare critical selected four-class through both collision sources has only
two possible centers: the robust first apex or the collision's common blocker. -/
theorem criticalSelectedFourClass_center_eq_firstApex_or_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {q center : ℝ²} (C : CriticalSelectedFourClass D.A q center)
    (hsource₁ : Q.fiber.source₁.1 ∈ C.toCriticalFourShell.support)
    (hsource₂ : Q.fiber.source₂.1 ∈ C.toCriticalFourShell.support) :
    center = S.oppApex1 ∨
      center = H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  classical
  by_cases hfirst : center = S.oppApex1
  · exact Or.inl hfirst
  right
  by_contra hcommon
  let o := S.oppApex1
  let a := H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  have hoA : o ∈ D.A := by
    simpa [o] using R.common.packet.center₁_mem_A
  have haA : a ∈ D.A := by
    simpa [a] using Q.fiber.commonBlocker_mem_A
  have hcenterA : center ∈ D.A :=
    (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
  have ha_ne_o : a ≠ o := by
    simpa [a, o] using Q.fiber.commonBlocker_ne_firstApex
  have hcenter_ne_o : center ≠ o := by
    simpa [o] using hfirst
  have hcenter_ne_a : center ≠ a := by
    simpa [a] using hcommon
  have hoEq :
      dist o Q.fiber.source₁.1 = dist o Q.fiber.source₂.1 := by
    simpa [o] using Q.firstApex_equidistant
  have haEq :
      dist a Q.fiber.source₁.1 = dist a Q.fiber.source₂.1 := by
    simpa [a] using Q.commonBlocker_equidistant
  have hcenterEq :
      dist center Q.fiber.source₁.1 =
        dist center Q.fiber.source₂.1 :=
    (C.toCriticalFourShell.support_eq_radius
      Q.fiber.source₁.1 hsource₁).trans
      (C.toCriticalFourShell.support_eq_radius
        Q.fiber.source₂.1 hsource₂).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    Q.fiber.source₁.2 Q.fiber.source₂.2 Q.fiber.source_points_ne
  have hoFilter :
      o ∈ D.A.filter (fun z ↦
        dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have haFilter :
      a ∈ D.A.filter (fun z ↦
        dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hcenterFilter :
      center ∈ D.A.filter (fun z ↦
        dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hcenterA, hcenterEq⟩
  have hthree :
      2 < (D.A.filter (fun z ↦
        dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, a, haFilter, center, hcenterFilter,
      ha_ne_o.symm, hcenter_ne_o.symm, hcenter_ne_a.symm⟩
  exact False.elim ((not_lt_of_ge hbound) hthree)

/-- The missing deletion-critical hypothesis eliminates the first-apex branch
of the bare-class dichotomy by first-apex deletion robustness. -/
theorem criticalSelectedFourClass_center_eq_commonBlocker_of_no_qfree
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {q center : ℝ²} (C : CriticalSelectedFourClass D.A q center)
    (hnoQFree : ¬ HasNEquidistantPointsAt 4 (D.A.erase q) center)
    (hsource₁ : Q.fiber.source₁.1 ∈ C.toCriticalFourShell.support)
    (hsource₂ : Q.fiber.source₂.1 ∈ C.toCriticalFourShell.support) :
    center = H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  rcases criticalSelectedFourClass_center_eq_firstApex_or_commonBlocker
      Q C hsource₁ hsource₂ with hfirst | hcommon
  · have hqA : q ∈ D.A :=
      C.toCriticalFourShell.support_subset_A
        C.toCriticalFourShell.q_mem_support
    exact False.elim (hnoQFree (by
      rw [hfirst]
      exact R.firstApexFullyDeletionRobust.survives q hqA))
  · exact hcommon

/-- An arbitrary named presentation of an actual selected row has the same
support as the system row, so the production localizer applies unchanged. -/
theorem actualCriticalSelectedFourClass_center_eq_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {q : ℝ²} (hq : q ∈ D.A)
    (C : CriticalSelectedFourClass D.A q (H.centerAt q hq))
    (hsource₁ : Q.fiber.source₁.1 ∈ C.toCriticalFourShell.support)
    (hsource₂ : Q.fiber.source₂.1 ∈ C.toCriticalFourShell.support) :
    H.centerAt q hq =
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  have hsupport :
      C.toCriticalFourShell.support =
        (H.selectedAt q hq).toCriticalFourShell.support :=
    H.selectedFourClass_support_eq_shell q hq C.toSelectedFourClass
  exact actualRow_center_eq_commonBlocker_of_contains_collisionSources
    Q hq (hsupport ▸ hsource₁) (hsupport ▸ hsource₂)

end TraceCriticalRowPairLocalizer
end Problem97
