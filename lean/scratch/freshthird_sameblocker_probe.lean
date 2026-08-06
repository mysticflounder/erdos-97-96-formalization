/- PARKED-SPEC: source-clean interface audit; no production obligation. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open Problem97
open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector ATailSurvivalCover
open ATailPhysicalSecondApexCommonDeletion ATailLargeOppositeCapsBiApexSurface

section
variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/- Both positive non-hit constructors imply only the negated cross-row hit.
   This is the erased `hnot` information; it is not itself a contradiction. -/
example (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) :
    ¬ FreshThirdCrossRowHit P Pρ source Q := by
  intro h
  cases data with
  | sameBlocker center_eq _ => exact h.1 center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem h.2.1
      · exact deleted_not_mem h.2.2

/- The same-blocker packet gives the opposite center equality to the hit's
   strict center inequality.  No equality of the two cap-source centers
   follows, and no contradiction is derivable from this packet alone. -/
example (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (d : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q) :
    d = d := by
  rfl

/- A source-row omission is stronger than the erased non-hit flag: it
   separates the omitted source's blocker from the omitted row's center. -/
example (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deleted_not_mem :
      deleted.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    H.centerAt Q.source₁.1 Q.source₁.2 ≠
      H.centerAt source.1 source.2 := by
  have hQCenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 :=
    congrArg Subtype.val Q.blockers_eq
  rcases deleted_eq with rfl | rfl
  · exact blocker_centers_ne_of_not_mem_other_selected_support
      H Q.source₁.2 source.2 deleted_not_mem
  · intro hEq
    have hne := blocker_centers_ne_of_not_mem_other_selected_support
      H Q.source₂.2 source.2 deleted_not_mem
    exact hne (hQCenters.symm.trans hEq)

/- The same omission also gives the exact-shell overlap bound.  If the
   omitted point is Q.source₂, transport the selected support along the
   common blocker equality before applying the one-sided bound. -/
example (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
    (deleted_not_mem :
      deleted.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    (((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∩
      (H.selectedAt source.1 source.2).toCriticalFourShell.support).card ≤ 2) := by
  rcases deleted_eq with rfl | rfl
  · exact selected_support_inter_card_le_two_of_not_mem_other_selected_support
      H Q.source₁.2 source.2 deleted_not_mem
  · have hQCenters :
        H.centerAt Q.source₁.1 Q.source₁.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 :=
      congrArg Subtype.val Q.blockers_eq
    have hsupports :
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₂.1 Q.source₂.2).toCriticalFourShell.support :=
      selectedSupports_eq_of_actualBlockers_eq H Q.source₁.2 Q.source₂.2 hQCenters
    have hbound :=
      selected_support_inter_card_le_two_of_not_mem_other_selected_support
        H Q.source₂.2 source.2 deleted_not_mem
    simpa [hsupports] using hbound

#check false_of_two_freshThirdCrossRowHits_distinctCenters
#check false_of_freshThird_sameCapCrossRowAlignment
#check FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit
#check FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase

end
end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
