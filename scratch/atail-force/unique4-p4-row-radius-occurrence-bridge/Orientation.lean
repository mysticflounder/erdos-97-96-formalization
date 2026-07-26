/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Main

/-!
# Both source orientations for the P4 selected-row/radius ledger slice

The 441 authenticated compact clauses are shape statements over P4's dense
row/equality variables.  Their source semantics therefore apply to either
card-eleven boundary orientation, provided the valuation is evaluated through
that orientation's proven index transport.  This file does not identify the
two packet structures or silently reflect a boundary; it chooses
`directIndex` or `mirrorIndex` explicitly.
-/

namespace Problem97
namespace P4RowRadiusOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

/-- The direct P4 source packet satisfies the exact 441-clause ledger slice. -/
theorem bridgeClauses_sat_direct
    (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P.core directIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause :=
  bridgeClauses_sat P.core directIndex hv

/-- The reflected P4 source packet satisfies the same exact 441-clause ledger
slice under the reflection transport `mirrorIndex`. -/
theorem bridgeClauses_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P.core mirrorIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause :=
  bridgeClauses_sat P.core mirrorIndex hv

end P4RowRadiusOccurrenceBridgeScratch
end Problem97
