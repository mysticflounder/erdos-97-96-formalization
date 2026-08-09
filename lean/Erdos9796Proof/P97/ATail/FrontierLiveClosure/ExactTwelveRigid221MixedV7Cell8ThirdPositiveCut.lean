/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 third positive cut

The source33-seeded cell-8 survivor contains three positive selected rows that
force one of two symmetric convex-five-point cores.  The direct-versus-mirror
boundary block order alone selects the core; the second-cap internal order is
not needed.

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

/-- The three selected rows used by the source33 cell-8 survivor cut. -/
def mixedV7Cell8ThirdPositiveChoices : List (RowChoice Label) :=
  [ { center := 5, support := {1, 3, 7, 10} }
  , { center := 9, support := {4, 5, 7, 10} }
  , { center := 10, support := {0, 1, 7, 8} } ]

/-- The direct and reflected frozen boundary blocks select one of the two
symmetric cell-8 cores. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Third
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 10 7 9 5 ∨
      CommonFiveOrientationAt order.position 1 5 7 9 10 := by
  have hne {a b : Label} (hab : a ≠ b) :
      (order.index a).val ≠ (order.index b).val := by
    intro heq
    exact hab (order.position_injective heq)
  have h15 := hne (a := (1 : Label)) (b := 5) (by decide)
  have h17 := hne (a := (1 : Label)) (b := 7) (by decide)
  have h19 := hne (a := (1 : Label)) (b := 9) (by decide)
  have h110 := hne (a := (1 : Label)) (b := 10) (by decide)
  have h57 := hne (a := (5 : Label)) (b := 7) (by decide)
  have h59 := hne (a := (5 : Label)) (b := 9) (by decide)
  have h510 := hne (a := (5 : Label)) (b := 10) (by decide)
  have h79 := hne (a := (7 : Label)) (b := 9) (by decide)
  have h710 := hne (a := (7 : Label)) (b := 10) (by decide)
  have h910 := hne (a := (9 : Label)) (b := 10) (by decide)
  clear hne
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h5 := hdirect.surplus_between 5 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h5 := hmirror.surplus_between 5 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- The three positive rows from the source33 cell-8 survivor force one of two
convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8ThirdPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8ThirdPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow5 : ({1, 3, 7, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 3, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirdPositiveChoices])
    have hrow9 : ({4, 5, 7, 10} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {4, 5, 7, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirdPositiveChoices])
    have hrow10 : ({0, 1, 7, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {0, 1, 7, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8ThirdPositiveChoices])
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 10
        b := 7
        c := 9
        y := 5
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 10 1 7 (hrow10 (by decide)) (hrow10 (by decide))
        ya_yb := EdgeClosure.row 5 1 7 (hrow5 (by decide)) (hrow5 (by decide))
        cb_cx := EdgeClosure.row 9 7 10 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 7 5 (hrow9 (by decide)) (hrow9 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 5
        b := 7
        c := 9
        y := 10
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 5 1 7 (hrow5 (by decide)) (hrow5 (by decide))
        ya_yb := EdgeClosure.row 10 1 7 (hrow10 (by decide)) (hrow10 (by decide))
        cb_cx := EdgeClosure.row 9 7 5 (hrow9 (by decide)) (hrow9 (by decide))
        cb_cy := EdgeClosure.row 9 7 10 (hrow9 (by decide)) (hrow9 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Third with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
