/-
Read-only audit witness: the production frontier-coupled exact-two-four-radius
residual has the fields required by the existing production frontier closer.
This records statement compatibility only; the axiom print records trust
closure separately.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Two-radius bank audit

Statement-compatibility witness for the production coupled residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoRadiusBankAuditScratch

open ATailFrontierLiveClosure
open ATailOrientedPhysicalApexIngress

theorem false_of_frontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R :
      FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    False := by
  exact false_of_criticalPairFrontier
    R.frontier R.minimal R.noM44
    (by
      have hfourteen := R.physical.carrier_card_ge_fourteen
      omega)
    R.frontierRadius_class_card_ge_four

#print axioms false_of_frontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual

end ATailTwoRadiusBankAuditScratch
end Problem97
