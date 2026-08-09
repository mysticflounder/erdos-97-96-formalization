/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 twelfth positive cut

The source-43 cut targets the source-42-seeded cell-8 survivor. Five positive
selected rows force one of two convex-five-point cores, according to the
relative boundary order of surplus labels `3` and `5`. The equality from the
edge `(3, 5)` to `(3, 6)` or `(3, 11)` is replayed through centers `5`, `10`,
and `3`.

This is one finite learned cut. It does not prove terminal UNSAT, all-cell
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

/-- The five selected rows used by the source-43 cut. -/
def mixedV7Cell8TwelfthPositiveChoices : List (RowChoice Label) :=
  [ { center := 3, support := {1, 6, 10, 11} }
  , { center := 5, support := {1, 2, 3, 10} }
  , { center := 6, support := {0, 5, 9, 11} }
  , { center := 10, support := {3, 4, 5, 8} }
  , { center := 11, support := {0, 2, 5, 7} } ]

/-- The relative order of surplus labels `3` and `5` selects one of the two
source-42-seeded cell-8 cores in either frozen boundary orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Twelfth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 11 5 3 6 ∨
      CommonFiveOrientationAt order.position 0 6 5 3 11 := by
  have h35 : (order.index 3).val ≠ (order.index 5).val := by
    intro heq
    exact (show (3 : Label) ≠ 5 by decide) (order.position_injective heq)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    omega

/-- Five positive selected rows from the source-42-seeded survivor force one
of two convex-five-point equality cores in every frozen source order. -/
def mixedV7Cell8TwelfthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8TwelfthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow3 : ({1, 6, 10, 11} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 6, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8TwelfthPositiveChoices])
    have hrow5 : ({1, 2, 3, 10} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {1, 2, 3, 10} } : RowChoice Label)
        (by simp [mixedV7Cell8TwelfthPositiveChoices])
    have hrow6 : ({0, 5, 9, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 5, 9, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8TwelfthPositiveChoices])
    have hrow10 : ({3, 4, 5, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {3, 4, 5, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8TwelfthPositiveChoices])
    have hrow11 : ({0, 2, 5, 7} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {0, 2, 5, 7} } : RowChoice Label)
        (by simp [mixedV7Cell8TwelfthPositiveChoices])
    have h35_311 : EdgeClosure row (3, 5) (3, 11) :=
      EdgeClosure.trans (EdgeClosure.flip 3 5)
        (EdgeClosure.trans
          (EdgeClosure.row 5 3 10 (hrow5 (by decide)) (hrow5 (by decide)))
          (EdgeClosure.trans (EdgeClosure.flip 5 10)
            (EdgeClosure.trans
              (EdgeClosure.row 10 5 3 (hrow10 (by decide)) (hrow10 (by decide)))
              (EdgeClosure.trans (EdgeClosure.flip 10 3)
                (EdgeClosure.row 3 10 11
                  (hrow3 (by decide)) (hrow3 (by decide)))))))
    have h35_36 : EdgeClosure row (3, 5) (3, 6) :=
      EdgeClosure.trans (EdgeClosure.flip 3 5)
        (EdgeClosure.trans
          (EdgeClosure.row 5 3 10 (hrow5 (by decide)) (hrow5 (by decide)))
          (EdgeClosure.trans (EdgeClosure.flip 5 10)
            (EdgeClosure.trans
              (EdgeClosure.row 10 5 3 (hrow10 (by decide)) (hrow10 (by decide)))
              (EdgeClosure.trans (EdgeClosure.flip 10 3)
                (EdgeClosure.row 3 10 6
                  (hrow3 (by decide)) (hrow3 (by decide)))))))
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 11
        b := 5
        c := 3
        y := 6
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 11 0 5 (hrow11 (by decide)) (hrow11 (by decide))
        ya_yb := EdgeClosure.row 6 0 5 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cx := h35_311
        cb_cy := h35_36 }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 0
        x := 6
        b := 5
        c := 3
        y := 11
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 6 0 5 (hrow6 (by decide)) (hrow6 (by decide))
        ya_yb := EdgeClosure.row 11 0 5 (hrow11 (by decide)) (hrow11 (by decide))
        cb_cx := h35_36
        cb_cy := h35_311 }
    rcases order.commonOrientationCoverage_mixedV7Cell8Twelfth with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
