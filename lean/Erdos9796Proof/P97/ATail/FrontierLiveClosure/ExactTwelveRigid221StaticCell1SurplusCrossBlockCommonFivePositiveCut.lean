/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SurplusCrossBlockCommonFiveCertificate

/-!
# Exact-twelve static cell-1 surplus-cross-block common-five cut

The fourth v7 cell-1 survivor realizes the role-parametric
surplus-cross-block obstruction with surplus labels `4` and `5`,
first-opposite label `11`, and second-opposite label `8`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- Named source-order adapter recorded in the authenticated bank entry. -/
theorem FrozenBoundaryOrder.sourceOrderCoverage_staticCell1SurplusCrossBlock
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 4 2 11 5 8 :=
  order.commonFiveOrientation_surplusCrossBlock
    (by decide) (by decide) (by decide) (by decide)

/-- The three full selected rows occurring in the cell-1 survivor.  The
checked family proof uses eight positive memberships. -/
def staticCell1SurplusCrossBlockPositiveChoices : List (RowChoice Label) :=
  [ { center := 2, support := {0, 4, 10, 11} }
  , { center := 5, support := {2, 3, 8, 11} }
  , { center := 8, support := {4, 6, 9, 11} } ]

/-- The survivor is one checked instance of the role-parametric
surplus-cross-block family. -/
def staticCell1SurplusCrossBlockPositiveNogood : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofSurplusCrossBlockCommonFive
    staticCell1SurplusCrossBlockPositiveChoices
    { a := 4, b := 11, c := 5, y := 8 }
    (by native_decide)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
