/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch

/-!
# Exact-four cardinality boundary

The current exact-four source residual forces a lower, not an upper,
cardinality bound.  This small adapter records the exact consequence of the
cap-sum identity and the no-`(m,4,4)` hypothesis.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourUniformRouteAuditScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

/-- The exact-four residual cannot occur on a carrier of cardinality ten.

Both opposite caps have at least four vertices and the surplus cap has at
least five.  At cardinality ten the closed-cap sum forces both opposite caps
to have cardinality exactly four, contradicting the residual's no-`IsM44`
field. -/
theorem carrier_card_ge_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    11 ≤ D.A.card := by
  have hopposite := oppositeCaps_card_ge_four D S
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hopp1 : 4 ≤ S.oppCap1.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppCap1, hi] using hopposite.1
  have hopp2 : 4 ≤ S.oppCap2.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi] using hopposite.2
  by_contra hnot
  have hcard : D.A.card = 10 := by omega
  have hcap1 : S.oppCap1.card = 4 := by omega
  have hcap2 : S.oppCap2.card = 4 := by omega
  exact R.noM44 ⟨S, hcap1, hcap2⟩

/-- A future source theorem proving the missing upper bound would reduce the
exact-four residual to the fixed cardinality-eleven surface. -/
theorem carrier_card_eq_eleven_of_card_le_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (hupper : D.A.card ≤ 11) :
    D.A.card = 11 := by
  have hlower := carrier_card_ge_eleven R
  omega

end ATailUniqueFourUniformRouteAuditScratch
end Problem97

#print axioms Problem97.ATailUniqueFourUniformRouteAuditScratch.carrier_card_ge_eleven
#print axioms Problem97.ATailUniqueFourUniformRouteAuditScratch.carrier_card_eq_eleven_of_card_le_eleven
