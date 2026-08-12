/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexCrossBlockCommonFiveCertificate

/-!
# Exact-twelve static cell-1 apex-cross-block common-five cut

The first survivor after the post-ThreeTriad common-five cut realizes the
role-parametric apex-cross-block obstruction with first-opposite label `10`,
second-opposite label `9`, and surplus label `5`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- Named source-order adapter recorded in the authenticated bank entry. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1AfterApexCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 2 10 9 5 :=
  order.commonFiveOrientation_apexCrossBlock (by decide) (by decide) (by decide)

/-- The three full selected rows occurring in the cell-1 survivor.  The
checked family proof uses only seven positive memberships. -/
def staticCell1AfterApexCrossBlockPositiveChoices : List (RowChoice Label) :=
  [ { center := 2, support := {0, 1, 10, 11} }
  , { center := 5, support := {0, 7, 9, 10} }
  , { center := 9, support := {2, 4, 5, 10} } ]

/-- The survivor is one checked instance of the role-parametric
apex-cross-block family. -/
def staticCell1AfterApexCrossBlockPositiveNogood : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofApexCrossBlockCommonFive
    staticCell1AfterApexCrossBlockPositiveChoices
    { b := 10, c := 9, y := 5 }
    (by native_decide)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
