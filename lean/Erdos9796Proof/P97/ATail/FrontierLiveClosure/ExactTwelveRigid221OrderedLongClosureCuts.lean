import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

private theorem FrozenBoundaryOrder.position_ne_of_ne
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

/-- Arithmetic coverage for ordered cut 4723. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_4723
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 3 4 7 6 ∨
      CommonFiveOrientationAt order.position 1 4 8 7 6 ∨
      CommonFiveOrientationAt order.position 1 4 3 7 8 ∨
      CommonFiveOrientationAt order.position 2 6 0 11 1 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  have h34 :
      (order.index 3).val < (order.index 4).val ∨
        (order.index 4).val < (order.index 3).val := by
    omega
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases h34 with h3_lt_4 | h4_lt_3 <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases h34 with h3_lt_4 | h4_lt_3 <;> omega

/-- Exact seven-row replay of ordered cut 4723, including its recorded
five-step equality-closure path for the second core. -/
theorem false_of_orderedCut_4723
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow3 : row 3 = {0, 1, 4, 9})
    (hrow4 : row 4 = {1, 2, 3, 8})
    (hrow6 : row 6 = {0, 2, 4, 5})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow11 : row 11 = {0, 1, 5, 6}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 3
      b := 4
      c := 7
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 3 0 4 (by simp [hrow3]) (by simp [hrow3])
      ya_yb := EdgeClosure.row 6 0 4 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 7 4 3 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 4 6 (by simp [hrow7]) (by simp [hrow7]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 8
      c := 7
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 8 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.trans (EdgeClosure.flip 6 1)
        (EdgeClosure.trans
          (EdgeClosure.row 1 6 8 (by simp [hrow1]) (by simp [hrow1]))
          (EdgeClosure.trans (EdgeClosure.flip 1 8)
            (EdgeClosure.trans
              (EdgeClosure.row 8 1 6 (by simp [hrow8]) (by simp [hrow8]))
              (EdgeClosure.flip 8 6))))
      cb_cx := EdgeClosure.row 7 8 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 8 6 (by simp [hrow7]) (by simp [hrow7]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 3
      c := 7
      y := 8
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 3 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 8 1 3 (by simp [hrow8]) (by simp [hrow8])
      cb_cx := EdgeClosure.row 7 3 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 3 8 (by simp [hrow7]) (by simp [hrow7]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 2
      x := 6
      b := 0
      c := 11
      y := 1
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 2 0 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 1 2 0 (by simp [hrow1]) (by simp [hrow1])
      cb_cx := EdgeClosure.row 11 0 6 (by simp [hrow11]) (by simp [hrow11])
      cb_cy := EdgeClosure.row 11 0 1 (by simp [hrow11]) (by simp [hrow11]) }
  rcases order.commonOrientationCoverage_orderedCut_4723 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 4898.  Its two certificates are
selected solely by the retained direction of the second-opposite cap. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_4898
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 8 1 2 10 4 ∨
      CommonFiveOrientationAt order.position 7 9 5 8 11 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- Exact seven-row replay of ordered cut 4898, including its recorded
five-step equality-closure path for the first core. -/
theorem false_of_orderedCut_4898
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow2 : row 2 = {0, 4, 10, 11})
    (hrow4 : row 4 = {2, 8, 10, 11})
    (hrow8 : row 8 = {5, 6, 9, 11})
    (hrow9 : row 9 = {0, 2, 5, 7})
    (hrow10 : row 10 = {1, 2, 6, 7})
    (hrow11 : row 11 = {1, 5, 7, 10}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 8
      x := 1
      b := 2
      c := 10
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 8 2 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 4 8 2 (by simp [hrow4]) (by simp [hrow4])
      cb_cx := EdgeClosure.row 10 2 1 (by simp [hrow10]) (by simp [hrow10])
      cb_cy := EdgeClosure.trans (EdgeClosure.flip 10 2)
        (EdgeClosure.trans
          (EdgeClosure.row 2 10 4 (by simp [hrow2]) (by simp [hrow2]))
          (EdgeClosure.trans (EdgeClosure.flip 2 4)
            (EdgeClosure.trans
              (EdgeClosure.row 4 2 10 (by simp [hrow4]) (by simp [hrow4]))
              (EdgeClosure.flip 4 10)))) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 7
      x := 9
      b := 5
      c := 8
      y := 11
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 9 7 5 (by simp [hrow9]) (by simp [hrow9])
      ya_yb := EdgeClosure.row 11 7 5 (by simp [hrow11]) (by simp [hrow11])
      cb_cx := EdgeClosure.row 8 5 9 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 5 11 (by simp [hrow8]) (by simp [hrow8]) }
  rcases order.commonOrientationCoverage_orderedCut_4898 hforced with hA | hB
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB


end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
