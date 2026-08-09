/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v4 cell-1 fourth positive cut

The post-bank cell-1 survivor contains a three-row convex-five-point core
whose common orientation holds in both frozen boundary orders. This file
packages that finite obstruction as a proof-carrying source-order nogood.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three selected rows used by the fourth mixed-v4 cell-1 cut. -/
def mixedV4Cell1FourthPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {2, 4, 5, 10} }
  , { center := 2, support := {4, 7, 10, 11} }
  , { center := 6, support := {0, 2, 4, 7} } ]

/-- The cell-1 core has one common orientation in either frozen cap-block
order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_10_0_4_6_2
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 10 0 4 6 2 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- Three positive selected rows from the fourth mixed-v4 cell-1 survivor
force a convex five-point equality core. -/
def mixedV4Cell1FourthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV4Cell1FourthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow0 : ({2, 4, 5, 10} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {2, 4, 5, 10} } : RowChoice Label)
        (by simp [mixedV4Cell1FourthPositiveChoices])
    have hrow2 : ({4, 7, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {4, 7, 10, 11} } : RowChoice Label)
        (by simp [mixedV4Cell1FourthPositiveChoices])
    have hrow6 : ({0, 2, 4, 7} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 4, 7} } : RowChoice Label)
        (by simp [mixedV4Cell1FourthPositiveChoices])
    let core : Census554.ConvexFivePointCore.Core row :=
      { a := 10
        x := 0
        b := 4
        c := 6
        y := 2
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 0 10 4 (hrow0 (by decide)) (hrow0 (by decide))
        ya_yb := EdgeClosure.row 2 10 4 (hrow2 (by decide)) (hrow2 (by decide))
        cb_cx := EdgeClosure.row 6 4 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 4 2 (hrow6 (by decide)) (hrow6 (by decide)) }
    exact order.false_of_convexFivePointCore hreal core
      order.commonOrientation_core_10_0_4_6_2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
