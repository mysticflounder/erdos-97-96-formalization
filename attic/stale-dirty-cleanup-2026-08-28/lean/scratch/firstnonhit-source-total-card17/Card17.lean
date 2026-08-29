/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

/-! A source-clean cardinality floor for the first-non-hit two-source leaf. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailLargeOppositeCapsBiApexSurface
open ATailExactFifteenApexProfile
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailPhysicalSecondApexCommonDeletion
open TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    {Pρ : RetainedInteriorBlockerCollision Rρ}
    {B : FrontierBiApexRobustResidual R}

/-- The source cap-eight margin and the two all-large residual margins already
force the carrier cardinality floor; no tri-apex richness witness is needed. -/
theorem firstNonHit_source_total_card_ge_seventeen
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L) :
    17 ≤ D.A.card := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppIndex1, hi] using L.firstOppCap_card_ge_six
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
        SurplusCapPacket.oppIndex2, hi] using L.secondOppCap_card_ge_six
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi] using
        N.surplusCap_card_ge_six
  apply ATailExactFifteenApexProfile.card_ge_seventeen_of_one_cap_card_ge_eight
    S S.oppIndex1 C.cap_card_ge_eight
  intro i
  rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
  · exact hcap1
  · exact hcap2
  · exact hsurplus

#print axioms firstNonHit_source_total_card_ge_seventeen

end
end ATailFrontierLiveClosure
end Problem97
