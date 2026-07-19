/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionUniformConsumer
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Direct physical-apex bypass for the frontier common-deletion residual

The parent residual already stores a common-deletion packet whose second
center is the physical second apex.  Apply the checked uniform physical-apex
consumer before any strict-interior selector or collision/matching split.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierPhysicalApexBypassScratch

open ATailCommonDeletionUniformConsumerScratch
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRReciprocalSwapReductionScratch

/-- Every common-deletion parent residual reaches the robust physical-second-
apex frontier or the protected swapped unique-card-four frontier directly. -/
theorem parentResidual_robust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) :=
  physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
    R.common.packet

#print axioms parentResidual_robust_or_swappedUniqueFour

end ATailFrontierPhysicalApexBypassScratch
end Problem97
