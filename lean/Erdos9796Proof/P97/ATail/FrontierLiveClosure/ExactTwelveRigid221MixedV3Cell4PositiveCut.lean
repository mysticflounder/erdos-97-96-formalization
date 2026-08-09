/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v3 cell-4 positive cut

This file turns the four-row convex-five-point certificates found at the
terminal survivor of mixed-v3 schedule cell 4 into one proof-carrying
`SourceOrderPositiveNogood`.

It proves one finite learned cut.  It does not prove terminal UNSAT,
all-cell coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four selected rows used by the mixed-v3 cell-4 survivor cut. -/
def mixedV3Cell4PositiveChoices : List (RowChoice Label) :=
  [ { center := 5, support := {0, 4, 6, 7} }
  , { center := 6, support := {0, 2, 3, 5} }
  , { center := 8, support := {4, 5, 6, 9} }
  , { center := 9, support := {0, 4, 5, 8} } ]

set_option maxHeartbeats 1000000

/-- The cell-4 survivor has one of three common orientations in either frozen
cap-block order.  The alternatives are the three convex-five-point cores
selected by the 48 source-order coverage replay. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_core_0_4_8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 5 4 8 9 ∨
      CommonFiveOrientationAt order.position 0 6 5 8 9 ∨
      CommonFiveOrientationAt order.position 0 9 4 8 5 := by
  have h45 : order.position 4 ≠ order.position 5 := by
    intro heq
    exact (by decide : (4 : Label) ≠ 5) (order.position_injective heq)
  have h69 : order.position 6 ≠ order.position 9 := by
    intro heq
    exact (by decide : (6 : Label) ≠ 9) (order.position_injective heq)
  change (order.index 4).val ≠ (order.index 5).val at h45
  change (order.index 6).val ≠ (order.index 9).val at h69
  have hne {a b : Label} (hab : a ≠ b) :
      (order.index a).val ≠ (order.index b).val := by
    intro heq
    exact hab (order.position_injective heq)
  have h04 := hne (a := (0 : Label)) (b := 4) (by decide)
  have h05 := hne (a := (0 : Label)) (b := 5) (by decide)
  have h06 := hne (a := (0 : Label)) (b := 6) (by decide)
  have h08 := hne (a := (0 : Label)) (b := 8) (by decide)
  have h09 := hne (a := (0 : Label)) (b := 9) (by decide)
  have h48 := hne (a := (4 : Label)) (b := 8) (by decide)
  have h49 := hne (a := (4 : Label)) (b := 9) (by decide)
  have h56 := hne (a := (5 : Label)) (b := 6) (by decide)
  have h58 := hne (a := (5 : Label)) (b := 8) (by decide)
  have h59 := hne (a := (5 : Label)) (b := 9) (by decide)
  have h68 := hne (a := (6 : Label)) (b := 8) (by decide)
  have h69' := hne (a := (6 : Label)) (b := 9) (by decide)
  have h89 := hne (a := (8 : Label)) (b := 9) (by decide)
  clear hne h69'
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- The four positive selected rows at the mixed-v3 cell-4 survivor force a
convex five-point equality core, contradicting either frozen boundary order. -/
def mixedV3Cell4PositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV3Cell4PositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow5 : ({0, 4, 6, 7} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 4, 6, 7} } : RowChoice Label)
        (by simp [mixedV3Cell4PositiveChoices])
    have hrow6 : ({0, 2, 3, 5} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 2, 3, 5} } : RowChoice Label)
        (by simp [mixedV3Cell4PositiveChoices])
    have hrow8 : ({4, 5, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {4, 5, 6, 9} } : RowChoice Label)
        (by simp [mixedV3Cell4PositiveChoices])
    have hrow9 : ({0, 4, 5, 8} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {0, 4, 5, 8} } : RowChoice Label)
        (by simp [mixedV3Cell4PositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 5
        b := 4
        c := 8
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 0 4
          (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 9 0 4
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 8 4 5
          (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 4 9
          (hrow8 (by decide)) (hrow8 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 6
        b := 5
        c := 8
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 0 5
          (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 9 0 5
          (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 8 5 6
          (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 5 9
          (hrow8 (by decide)) (hrow8 (by decide)) }
    let coreC : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 9
        b := 4
        c := 8
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 9 0 4
          (hrow9 (by decide)) (hrow9 (by decide))
        ya_yb := EdgeClosure.row 5 0 4
          (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 8 4 9
          (hrow8 (by decide)) (hrow8 (by decide))
        cb_cy := EdgeClosure.row 8 4 5
          (hrow8 (by decide)) (hrow8 (by decide)) }
    rcases order.commonOrientationCoverage_core_0_4_8 with hcore | hcore | hcore
    · exact order.false_of_convexFivePointCore hreal coreA hcore
    · exact order.false_of_convexFivePointCore hreal coreB hcore
    · exact order.false_of_convexFivePointCore hreal coreC hcore

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
