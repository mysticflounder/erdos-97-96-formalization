/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourTwoRadiusNormalForm
import CommonDeletionUniformConsumer

/-!
# Successor continuation for the singleton common-deletion endpoint

Production deletion robustness at the physical second apex eliminates the
critical arm of the uniform common-deletion split.  Consequently the
singleton endpoint has an exact second-row successor.  No descent or
nonreturn property is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustLargeRadiusContinuationScratch

open ATailRobustTwoRadiusCenterLocalizationScratch
open ATailCommonDeletionUniformConsumerScratch

/-- A robust physical second apex eliminates the prescribed-critical arm of
the uniform common-deletion split, leaving its source-faithful successor. -/
theorem nonempty_secondRowCommonDeletionSuccessor_of_singletonEndpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D S.oppApex2)
    (E : StrictPairSingletonCommonDeletionEndpoint D S H) :
    Nonempty (SecondRowCommonDeletionSuccessor E.packet) := by
  let Rscratch := rtwoScratchRobust_of_production R
  rcases secondRowSuccessor_or_secondCenterCritical E.packet with
    hsuccessor | ⟨source, ⟨P⟩⟩
  · exact hsuccessor
  · exact False.elim
      (P.blocks
        (Rscratch.survives source P.shell.toCriticalFourShell.q_mem_A))

#print axioms nonempty_secondRowCommonDeletionSuccessor_of_singletonEndpoint

end ATailUniqueFourRobustLargeRadiusContinuationScratch
end Problem97
