import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import CardElevenUniqueFourCertificateCoordinator

namespace Problem97
namespace CardElevenProductionResidualAdapterProbe

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

theorem false_of_cardElevenFirstApexUniqueRadiusExactFourResidual
    (R : FirstApexUniqueRadiusExactFourResidual F)
    (hcard : D.A.card = 11) :
    False :=
  ATailUniqueFourCardElevenCertificateScratch
    .false_of_cardElevenOriginalUniqueFourResidual
      (toOriginalUniqueFourResidual R) hcard

end CardElevenProductionResidualAdapterProbe
end Problem97
