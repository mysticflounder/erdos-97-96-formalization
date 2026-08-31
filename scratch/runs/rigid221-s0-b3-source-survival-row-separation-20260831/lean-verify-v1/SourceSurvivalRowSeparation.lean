import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-! Scratch compile check for the B3 source-survival row separation. -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ P.v.1 ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∧
      (R.interior_q ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support ∨
        R.interior_w ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support) := by
  let K :=
    ((lateFirstApexSystem R).selectedAt P.v.1 P.v.2).toCriticalFourShell
  have hvSupport : P.v.1 ∈ K.support := by
    simpa [K] using K.q_mem_support
  have hvCenterNe :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ P.v.1 := by
    intro hCenter
    have hdist := K.support_eq_radius P.v.1 hvSupport
    have hzero : (0 : ℝ) = K.radius := by
      calc
        (0 : ℝ) = dist P.v.1 P.v.1 := by simp
        _ = dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) P.v.1 := by
          rw [hCenter]
        _ = K.radius := hdist
    linarith [K.radius_pos]
  refine ⟨hvCenterNe, ?_, ?_⟩
  · intro hCenters
    apply hvCenterNe
    calc
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
          (lateFirstApexSystem R).centerAt P.source.1 P.source.2 :=
        hCenters.symm
      _ = P.v.1 := hblocker
  · rcases P.context.source_survives_q_or_w with hq | hw
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) P.source.2).mp hq)
    · exact Or.inr
        ((cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) P.source.2).mp hw)

end ATailFrontierLiveClosure
end Problem97
