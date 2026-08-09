/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 fourth positive cut

The source34-seeded cell-8 survivor contains six positive selected rows that
force one of two convex-five-point cores.  The frozen boundary blocks and the
forced second-cap direction cover all 48 source orders.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The six selected rows used by the source34 cell-8 survivor cut. -/
def mixedV7Cell8FourthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {0, 5, 10, 11} }
  , { center := 3, support := {1, 2, 9, 10} }
  , { center := 6, support := {2, 4, 8, 10} }
  , { center := 7, support := {1, 6, 8, 11} }
  , { center := 9, support := {4, 5, 7, 10} } ]

/-- Two source34 cell-8 cores cover both directions of the forced second cap
in both frozen boundary orientations. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fourth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 2 1 8 7 6 ∨
      CommonFiveOrientationAt order.position 5 2 10 3 9 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  have hne {a b : Label} (hab : a ≠ b) :
      (order.index a).val ≠ (order.index b).val := by
    intro heq
    exact hab (order.position_injective heq)
  have h12 := hne (a := (1 : Label)) (b := 2) (by decide)
  have h13 := hne (a := (1 : Label)) (b := 3) (by decide)
  have h15 := hne (a := (1 : Label)) (b := 5) (by decide)
  have h16 := hne (a := (1 : Label)) (b := 6) (by decide)
  have h17 := hne (a := (1 : Label)) (b := 7) (by decide)
  have h18 := hne (a := (1 : Label)) (b := 8) (by decide)
  have h19 := hne (a := (1 : Label)) (b := 9) (by decide)
  have h110 := hne (a := (1 : Label)) (b := 10) (by decide)
  have h23 := hne (a := (2 : Label)) (b := 3) (by decide)
  have h25 := hne (a := (2 : Label)) (b := 5) (by decide)
  have h26 := hne (a := (2 : Label)) (b := 6) (by decide)
  have h27 := hne (a := (2 : Label)) (b := 7) (by decide)
  have h28 := hne (a := (2 : Label)) (b := 8) (by decide)
  have h29 := hne (a := (2 : Label)) (b := 9) (by decide)
  have h210 := hne (a := (2 : Label)) (b := 10) (by decide)
  have h35 := hne (a := (3 : Label)) (b := 5) (by decide)
  have h36 := hne (a := (3 : Label)) (b := 6) (by decide)
  have h37 := hne (a := (3 : Label)) (b := 7) (by decide)
  have h38 := hne (a := (3 : Label)) (b := 8) (by decide)
  have h39 := hne (a := (3 : Label)) (b := 9) (by decide)
  have h310 := hne (a := (3 : Label)) (b := 10) (by decide)
  have h56 := hne (a := (5 : Label)) (b := 6) (by decide)
  have h57 := hne (a := (5 : Label)) (b := 7) (by decide)
  have h58 := hne (a := (5 : Label)) (b := 8) (by decide)
  have h59 := hne (a := (5 : Label)) (b := 9) (by decide)
  have h510 := hne (a := (5 : Label)) (b := 10) (by decide)
  have h67 := hne (a := (6 : Label)) (b := 7) (by decide)
  have h68 := hne (a := (6 : Label)) (b := 8) (by decide)
  have h69 := hne (a := (6 : Label)) (b := 9) (by decide)
  have h610 := hne (a := (6 : Label)) (b := 10) (by decide)
  have h78 := hne (a := (7 : Label)) (b := 8) (by decide)
  have h79 := hne (a := (7 : Label)) (b := 9) (by decide)
  have h710 := hne (a := (7 : Label)) (b := 10) (by decide)
  have h89 := hne (a := (8 : Label)) (b := 9) (by decide)
  have h810 := hne (a := (8 : Label)) (b := 10) (by decide)
  have h910 := hne (a := (9 : Label)) (b := 10) (by decide)
  clear hne
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      omega

/-- The six positive rows from the source34 cell-8 survivor force one of two
convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8FourthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8FourthPositiveChoices
  refutes := by
    intro row pointOf hreal order hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    have hrow2 : ({0, 5, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {0, 5, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    have hrow3 : ({1, 2, 9, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 9, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    have hrow6 : ({2, 4, 8, 10} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {2, 4, 8, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    have hrow7 : ({1, 6, 8, 11} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 6, 8, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    have hrow9 : ({4, 5, 7, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {4, 5, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8FourthPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 2
        x := 1
        b := 8
        c := 7
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 1 2 8 (hrow1 (by decide)) (hrow1 (by decide))
        ya_yb := EdgeClosure.row 6 2 8 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := EdgeClosure.row 7 8 1 (hrow7 (by decide)) (hrow7 (by decide))
        cb_cy := EdgeClosure.row 7 8 6 (hrow7 (by decide)) (hrow7 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 5
        x := 2
        b := 10
        c := 3
        y := 9
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 2 5 10 (hrow2 (by decide)) (hrow2 (by decide))
        ya_yb := EdgeClosure.row 9 5 10 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cx := EdgeClosure.row 3 10 2 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cy := EdgeClosure.row 3 10 9 (hrow3 (by decide)) (hrow3 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Fourth hforced with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
