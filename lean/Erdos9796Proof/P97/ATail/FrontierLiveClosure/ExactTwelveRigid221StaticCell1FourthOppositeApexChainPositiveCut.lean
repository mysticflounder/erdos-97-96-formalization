/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OppositeApexChainCommonFiveCertificate

/-!
# Exact-twelve static cell-1 opposite-block apex-chain cut

The survivor after the first two v7 source-order cuts realizes the
role-parametric opposite-block apex-chain obstruction with first-opposite
label `11` and second-opposite label `6`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- Named source-order adapter recorded in the authenticated bank entry. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1FourthOppositeApexChain
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 11 2 0 1 6 :=
  order.commonFiveOrientation_oppositeApexChain (by decide) (by decide)

/-- The four full selected rows occurring in the cell-1 survivor.  The checked
family proof uses only nine positive memberships. -/
def staticCell1FourthOppositeApexChainPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 2, 3, 4} }
  , { center := 1, support := {0, 3, 6, 8} }
  , { center := 2, support := {0, 1, 10, 11} }
  , { center := 6, support := {0, 2, 9, 11} } ]

/-- The survivor is one checked instance of the role-parametric
opposite-block apex-chain family. -/
def staticCell1FourthOppositeApexChainPositiveNogood : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofOppositeApexChainCommonFive
    staticCell1FourthOppositeApexChainPositiveChoices
    { a := 11, y := 6 }
    (by native_decide)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
