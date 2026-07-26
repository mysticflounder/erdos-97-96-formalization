/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Certificate.CheckpointedRupCompactBoundary
import Erdos9796Proof.P97.Certificate.CheckpointedRupTextBoundary
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Coordinator
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual

/-!
# Card-eleven exact-four certificate ingress

The promoted certificate graph retains its checked internal declaration names.
This module identifies its exact-four input with the production frontier
residual, field for field. The two boundary imports state the source-side
prerequisites of the replay modules promoted into the main library.
-/

namespace Problem97
namespace ATailCardElevenUniqueFourCertificate

open ATailCriticalPairFrontier
open FirstApexUniqueRadiusResidual

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

private def toOriginalUniqueFourResidual
    (R : FirstApexUniqueRadiusExactFourResidual F) :
    ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_fourClass_radius
  every_class_member_blocks := R.every_class_member_obstructs
  interior_q := R.interior_q
  interior_w := R.interior_w
  interior_q_mem := R.interior_q_mem
  interior_w_mem := R.interior_w_mem
  interior_q_ne_w := R.interior_q_ne_w
  bisector_center_mem_interior := R.bisector_center_mem_interior

/-- The checked card-eleven certificate closes the production exact-four
first-apex unique-radius residual. -/
theorem false_of_firstApexUniqueRadiusExactFourResidual
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : D.A.card = 11) :
    False :=
  ATailUniqueFourCardElevenCertificateScratch.false_of_cardElevenOriginalUniqueFourResidual
      (toOriginalUniqueFourResidual R) hcard

end ATailCardElevenUniqueFourCertificate
end Problem97
