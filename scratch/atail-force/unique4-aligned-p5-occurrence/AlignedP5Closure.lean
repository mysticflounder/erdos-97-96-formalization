/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5DirectClosure
import AlignedP5MirrorClosure

/-!
# Aligned-p5 source closure

The source boundary normalization yields either the direct or mirror card-eleven
layout.  Both layouts are closed by their native occurrence theorem and the
common geometric Kalmanson decoder.
-/

namespace Problem97
namespace ATailUniqueFourAlignedP5BoundaryScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch

/-- The aligned exact-two complement at profile `(5,5,4)` is impossible in
either cyclic macro orientation. -/
theorem false_of_alignedInteriorFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) :
    False := by
  rcases nonempty_alignedP5BoundaryPacket_or_mirror R profile P with
    hdirect | hmirror
  · rcases hdirect with ⟨Q⟩
    exact AlignedP5BoundaryPacket.false_of_boundaryPacket Q
  · rcases hmirror with ⟨Q⟩
    exact AlignedP5MirrorBoundaryPacket.false_of_mirrorBoundaryPacket Q

end ATailUniqueFourAlignedP5BoundaryScratch
end Problem97
