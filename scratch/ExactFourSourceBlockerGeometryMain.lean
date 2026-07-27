import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- A second strict-interior hit in the contextual source row localizes the
actual source blocker into the same strict second cap.  This is the geometric
step which the bare global-deletion/minimal-core interface was missing. -/
theorem exactFourSourceContext_sourceBlocker_mem_secondInterior_of_secondHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    {partner : ℝ²}
    (hpartnerRow :
      partner ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hpartnerClass :
      partner ∈ SelectedClass D.A S.oppApex2 rho)
    (hpartnerInterior :
      partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartnerNe : partner ≠ source.1) :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
      S.capInteriorByIndex S.oppIndex2 := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  have hsourceRow : source.1 ∈ K.support := by
    exact K.q_mem_support
  have hcenterA :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈ D.A := by
    exact (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) source.1 source.2
  have hcenterEq :
      dist ((lateFirstApexSystem R).centerAt source.1 source.2)
          source.1 =
        dist ((lateFirstApexSystem R).centerAt source.1 source.2)
          partner := by
    exact
      (K.support_eq_radius source.1 hsourceRow).trans
        (K.support_eq_radius partner (by simpa [K] using hpartnerRow)).symm
  have hphysicalEq :
      dist S.oppApex2 source.1 =
        dist S.oppApex2 partner := by
    exact
      ((mem_selectedClass.mp context.source_mem_class).2).trans
        ((mem_selectedClass.mp hpartnerClass).2).symm
  exact
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe context.source_mem_interior hpartnerInterior
      hpartnerNe.symm hcenterEq hphysicalEq

/-- The contextual source row has only two possible geometric shapes in the
physical strict interior: either its actual blocker is itself in that strict
interior, or the source is the row's unique strict-interior point on the
physical radius.  This is the direct localization fork needed by the rigid
five-cycle terminal. -/
theorem exactFourSourceContext_sourceBlockerInterior_or_uniquePhysicalInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v) :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        S.capInteriorByIndex S.oppIndex2 ∨
      ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2) =
        {source.1} := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let T :=
    K.support ∩
      (SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2)
  have hsourceT : source.1 ∈ T := by
    exact Finset.mem_inter.mpr
      ⟨K.q_mem_support,
        Finset.mem_inter.mpr
          ⟨context.source_mem_class, context.source_mem_interior⟩⟩
  by_cases hpartner :
      ∃ partner ∈ T, partner ≠ source.1
  · rcases hpartner with ⟨partner, hpartnerT, hpartnerNe⟩
    left
    have hpartnerData := Finset.mem_inter.mp hpartnerT
    have hpartnerPhysical := Finset.mem_inter.mp hpartnerData.2
    exact
      exactFourSourceContext_sourceBlocker_mem_secondInterior_of_secondHit
        R surface source other u v context
        (by simpa [K] using hpartnerData.1)
        hpartnerPhysical.1 hpartnerPhysical.2 hpartnerNe
  · right
    have hT : T = {source.1} := by
      ext z
      constructor
      · intro hz
        have hzEq : z = source.1 := by
          by_contra hzNe
          exact hpartner ⟨z, hz, hzNe⟩
        simpa [hzEq]
      · intro hz
        simp only [Finset.mem_singleton] at hz
        subst z
        exact hsourceT
    simpa [T, K] using hT

end ATailFrontierLiveClosure
end Problem97
