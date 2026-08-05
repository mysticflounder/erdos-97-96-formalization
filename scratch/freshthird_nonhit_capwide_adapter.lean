import Erdos9796Proof.P97.ATail.FrontierLiveClosure
/-! Source-clean adapter audit for FreshThird non-hit arms. -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailCommonDeletionTwoCenter

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/- Existing cap-wide alignment is exactly the missing producer.  Either
   non-hit constructor contradicts it without any geometric assumptions. -/
theorem false_of_freshThird_firstNonHit_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.firstSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

theorem false_of_freshThird_secondNonHit_capWideAlignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ C.secondSource Q)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q C.secondSource) :
    False := by
  rcases halign with
    ⟨capIndex, hqCap, hsCap, hcentersNe,
      hq1Off, hq2Off, hq1Mem, hq2Mem⟩
  cases data with
  | sameBlocker center_eq _ =>
      exact hcentersNe center_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem _ =>
      rcases deleted_eq with rfl | rfl
      · exact deleted_not_mem hq1Mem
      · exact deleted_not_mem hq2Mem

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
