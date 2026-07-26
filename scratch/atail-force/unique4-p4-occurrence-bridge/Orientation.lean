/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Main

/-!
# Both source orientations for the P4 mutual-transport ledger slice

The clause records are transport-generic.  The direct and reflected P4
packets therefore use the same authenticated 392 compact occurrences with
their respective proven transports; this makes no equality claim between the
two oriented boundaries.
-/

namespace Problem97
namespace P4MutualTransportOccurrenceBridgeScratch

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

theorem bridgeClauses_sat_direct
    (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P.core directIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause :=
  bridgeClauses_sat P.core directIndex hv

theorem bridgeClauses_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P.core mirrorIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause :=
  bridgeClauses_sat P.core mirrorIndex hv

end P4MutualTransportOccurrenceBridgeScratch
end Problem97
