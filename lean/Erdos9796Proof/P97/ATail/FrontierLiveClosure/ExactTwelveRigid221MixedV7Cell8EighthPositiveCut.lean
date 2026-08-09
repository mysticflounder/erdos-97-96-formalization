/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer

/-!
# Exact-twelve mixed-v7 cell-8 eighth positive cut

The source-39 cut targets the source-38-seeded cell-8 survivor.  Six positive
selected rows force one of two convex-five-point cores, according to the
relative boundary order of surplus labels `3` and `5`.

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

/-- The six selected rows used by the source-39 cut. -/
def mixedV7Cell8EighthPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {1, 6, 10, 11} }
  , { center := 3, support := {1, 5, 8, 9} }
  , { center := 5, support := {0, 9, 10, 11} }
  , { center := 6, support := {0, 3, 5, 11} }
  , { center := 10, support := {2, 3, 5, 8} } ]

/-- The relative order of surplus labels `3` and `5` selects one of the two
source-38-seeded cell-8 cores in either frozen boundary orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eighth
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 0 5 6 3 ∨
      CommonFiveOrientationAt order.position 1 3 5 6 0 := by
  have h35 : (order.index 3).val ≠ (order.index 5).val := by
    intro heq
    exact (show (3 : Label) ≠ 5 by decide) (order.position_injective heq)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    omega

/-- The six positive rows from the source-38-seeded survivor force one of two
convex-five-point equality cores in every frozen boundary order. -/
def mixedV7Cell8EighthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8EighthPositiveChoices
  refutes := by
    intro row pointOf hreal order _hforced _hconv hpositive
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have hrow2 : ({1, 6, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {1, 6, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have hrow3 : ({1, 5, 8, 9} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 5, 8, 9} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have hrow5 : ({0, 9, 10, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 9, 10, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have hrow6 : ({0, 3, 5, 11} : Finset Label) ⊆ row 6 :=
      hpositive ({ center := 6, support := {0, 3, 5, 11} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have hrow10 : ({2, 3, 5, 8} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {2, 3, 5, 8} } : RowChoice Label)
        (by simp [mixedV7Cell8EighthPositiveChoices])
    have h01_05 : EdgeClosure row (0, 1) (0, 5) :=
      EdgeClosure.trans (EdgeClosure.flip 0 1)
        (EdgeClosure.trans
          (EdgeClosure.row 1 0 2 (hrow1 (by decide)) (hrow1 (by decide)))
          (EdgeClosure.trans (EdgeClosure.flip 1 2)
            (EdgeClosure.trans
              (EdgeClosure.row 2 1 10 (hrow2 (by decide)) (hrow2 (by decide)))
              (EdgeClosure.trans (EdgeClosure.flip 2 10)
                (EdgeClosure.trans
                  (EdgeClosure.row 10 2 5
                    (hrow10 (by decide)) (hrow10 (by decide)))
                  (EdgeClosure.trans (EdgeClosure.flip 10 5)
                    (EdgeClosure.trans
                      (EdgeClosure.row 5 10 0
                        (hrow5 (by decide)) (hrow5 (by decide)))
                      (EdgeClosure.flip 5 0))))))))
    let coreA : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 0
        b := 5
        c := 6
        y := 3
        hab := by decide
        hxy := by decide
        xa_xb := h01_05
        ya_yb := EdgeClosure.row 3 1 5 (hrow3 (by decide)) (hrow3 (by decide))
        cb_cx := EdgeClosure.row 6 5 0 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 5 3 (hrow6 (by decide)) (hrow6 (by decide)) }
    let coreB : Census554.ConvexFivePointCore.Core row :=
      { a := 1
        x := 3
        b := 5
        c := 6
        y := 0
        hab := by decide
        hxy := by decide
        xa_xb := EdgeClosure.row 3 1 5 (hrow3 (by decide)) (hrow3 (by decide))
        ya_yb := h01_05
        cb_cx := EdgeClosure.row 6 5 3 (hrow6 (by decide)) (hrow6 (by decide))
        cb_cy := EdgeClosure.row 6 5 0 (hrow6 (by decide)) (hrow6 (by decide)) }
    rcases order.commonOrientationCoverage_mixedV7Cell8Eighth with hA | hB
    · exact order.false_of_convexFivePointCore hreal coreA hA
    · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
