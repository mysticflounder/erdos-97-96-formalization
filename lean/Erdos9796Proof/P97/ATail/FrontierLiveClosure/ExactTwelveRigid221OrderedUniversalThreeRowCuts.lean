/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedThreeRowCuts

/-!
# Further universal three-row cuts for exact-twelve Rigid221

Several later ordered-v4 CEGAR records contain a single direct three-row
five-point core whose common orientation follows from the frozen cap blocks
alone.  The resulting consumers are cardinality-independent row-membership
schemas; they do not require exact row identities.

These theorems promote individual learned cuts.  They do not prove that the
finite search covers every source model and do not close the live Rigid221
residual by themselves.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- The direct three-row core shared by ordered-v4 iterations 6302 and 6303
has a common orientation in either frozen cap-block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_8_1_2_0_5
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 8 1 2 0 5 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- Seven row-membership facts replay both ordered-v4 iterations 6302 and
6303; every other selected row in those records is unnecessary. -/
theorem false_of_threeRows_core_8_1_2_0_5
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h18 : 8 ∈ row 1) (h12 : 2 ∈ row 1)
    (h58 : 8 ∈ row 5) (h52 : 2 ∈ row 5)
    (h02 : 2 ∈ row 0) (h01 : 1 ∈ row 0) (h05 : 5 ∈ row 0) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 8
      x := 1
      b := 2
      c := 0
      y := 5
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 8 2 h18 h12
      ya_yb := EdgeClosure.row 5 8 2 h58 h52
      cb_cx := EdgeClosure.row 0 2 1 h02 h01
      cb_cy := EdgeClosure.row 0 2 5 h02 h05 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_8_1_2_0_5

private theorem FrozenBoundaryOrder.position_ne_of_ne'
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

private theorem false_of_direct_threeRow_core
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    {a x b c y : Label}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hab : a ≠ b) (hxy : x ≠ y)
    (hxa : a ∈ row x) (hxb : b ∈ row x)
    (hya : a ∈ row y) (hyb : b ∈ row y)
    (hcb : b ∈ row c) (hcx : x ∈ row c) (hcy : y ∈ row c)
    (horient : CommonFiveOrientationAt order.position a x b c y) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := a
      x := x
      b := b
      c := c
      y := y
      hab := hab
      hxy := hxy
      xa_xb := EdgeClosure.row x a b hxa hxb
      ya_yb := EdgeClosure.row y a b hya hyb
      cb_cx := EdgeClosure.row c b x hcb hcx
      cb_cy := EdgeClosure.row c b y hcb hcy }
  exact order.false_of_convexFivePointCore hreal core horient

/-- Direct core of ordered-v4 iteration 6956. -/
theorem FrozenBoundaryOrder.commonOrientation_core_5_0_11_3_2
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 5 0 11 3 2 := by
  have h35 := order.position_ne_of_ne' (by decide : (3 : Label) ≠ 5)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_5_0_11_3_2
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h05 : 5 ∈ row 0) (h011 : 11 ∈ row 0)
    (h25 : 5 ∈ row 2) (h211 : 11 ∈ row 2)
    (h311 : 11 ∈ row 3) (h30 : 0 ∈ row 3) (h32 : 2 ∈ row 3) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h05 h011 h25 h211 h311 h30 h32
    order.commonOrientation_core_5_0_11_3_2

/-- Direct core of ordered-v4 iteration 7536. -/
theorem FrozenBoundaryOrder.commonOrientation_core_4_0_2_3_11
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 4 0 2 3 11 := by
  have h34 := order.position_ne_of_ne' (by decide : (3 : Label) ≠ 4)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_4_0_2_3_11
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h04 : 4 ∈ row 0) (h02 : 2 ∈ row 0)
    (h114 : 4 ∈ row 11) (h112 : 2 ∈ row 11)
    (h32 : 2 ∈ row 3) (h30 : 0 ∈ row 3) (h311 : 11 ∈ row 3) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h04 h02 h114 h112 h32 h30 h311
    order.commonOrientation_core_4_0_2_3_11

/-- Direct core of ordered-v4 iteration 7952. -/
theorem FrozenBoundaryOrder.commonOrientation_core_8_1_2_9_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 8 1 2 9 4 := by
  have h89 := order.position_ne_of_ne' (by decide : (8 : Label) ≠ 9)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_8_1_2_9_4
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h18 : 8 ∈ row 1) (h12 : 2 ∈ row 1)
    (h48 : 8 ∈ row 4) (h42 : 2 ∈ row 4)
    (h92 : 2 ∈ row 9) (h91 : 1 ∈ row 9) (h94 : 4 ∈ row 9) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h18 h12 h48 h42 h92 h91 h94
    order.commonOrientation_core_8_1_2_9_4

/-- Direct core of ordered-v4 iteration 8515. -/
theorem FrozenBoundaryOrder.commonOrientation_core_10_2_0_1_6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 10 2 0 1 6 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_10_2_0_1_6
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h210 : 10 ∈ row 2) (h20 : 0 ∈ row 2)
    (h610 : 10 ∈ row 6) (h60 : 0 ∈ row 6)
    (h10 : 0 ∈ row 1) (h12 : 2 ∈ row 1) (h16 : 6 ∈ row 1) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h210 h20 h610 h60 h10 h12 h16
    order.commonOrientation_core_10_2_0_1_6

/-- Direct core of ordered-v4 iteration 8674. -/
theorem FrozenBoundaryOrder.commonOrientation_core_3_6_0_11_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 3 6 0 11 4 := by
  have h34 := order.position_ne_of_ne' (by decide : (3 : Label) ≠ 4)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_3_6_0_11_4
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h63 : 3 ∈ row 6) (h60 : 0 ∈ row 6)
    (h43 : 3 ∈ row 4) (h40 : 0 ∈ row 4)
    (h110 : 0 ∈ row 11) (h116 : 6 ∈ row 11) (h114 : 4 ∈ row 11) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h63 h60 h43 h40 h110 h116 h114
    order.commonOrientation_core_3_6_0_11_4

/-- Direct core of ordered-v4 iteration 8713. -/
theorem FrozenBoundaryOrder.commonOrientation_core_2_6_0_10_1
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 6 0 10 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_2_6_0_10_1
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h62 : 2 ∈ row 6) (h60 : 0 ∈ row 6)
    (h12 : 2 ∈ row 1) (h10 : 0 ∈ row 1)
    (h100 : 0 ∈ row 10) (h106 : 6 ∈ row 10) (h101 : 1 ∈ row 10) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h62 h60 h12 h10 h100 h106 h101
    order.commonOrientation_core_2_6_0_10_1

/-- Direct three-row core with second-opposite label `9`.  This is the
membership-only form of the ordered-cut-4669 obstruction. -/
theorem FrozenBoundaryOrder.commonOrientation_core_2_9_0_10_1
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 9 0 10 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have hapex := hmirror.apex_order
    omega

/-- Any realized selected-row pattern containing the seven incidences of the
`(2,9,0,10,1)` core is impossible in a frozen boundary order. -/
theorem false_of_threeRows_core_2_9_0_10_1
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h92 : 2 ∈ row 9) (h90 : 0 ∈ row 9)
    (h12 : 2 ∈ row 1) (h10 : 0 ∈ row 1)
    (h100 : 0 ∈ row 10) (h109 : 9 ∈ row 10) (h101 : 1 ∈ row 10) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h92 h90 h12 h10 h100 h109 h101
    order.commonOrientation_core_2_9_0_10_1

/-- Direct core of ordered-v4 iteration 10182. -/
theorem FrozenBoundaryOrder.commonOrientation_core_2_3_0_4_1
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 3 0 4 1 := by
  have h34 := order.position_ne_of_ne' (by decide : (3 : Label) ≠ 4)
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_2_3_0_4_1
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h32 : 2 ∈ row 3) (h30 : 0 ∈ row 3)
    (h12 : 2 ∈ row 1) (h10 : 0 ∈ row 1)
    (h40 : 0 ∈ row 4) (h43 : 3 ∈ row 4) (h41 : 1 ∈ row 4) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h32 h30 h12 h10 h40 h43 h41
    order.commonOrientation_core_2_3_0_4_1

/-- Direct core of ordered-v4 iteration 9306.  Unlike the preceding cores,
its orientation uses the retained order of labels `6,7,8,9`; frozen cap-block
membership alone does not determine it. -/
theorem FrozenBoundaryOrder.commonOrientation_core_5_7_8_9_0
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 5 7 8 9 0 := by
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h5 := hdirect.surplus_between 5 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have hapex := hdirect.apex_order
    rcases hforced with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position at *
    have h5 := hmirror.surplus_between 5 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have hapex := hmirror.apex_order
    rcases hforced with hforward | hreverse <;> omega

theorem false_of_threeRows_core_5_7_8_9_0
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (h75 : 5 ∈ row 7) (h78 : 8 ∈ row 7)
    (h05 : 5 ∈ row 0) (h08 : 8 ∈ row 0)
    (h98 : 8 ∈ row 9) (h97 : 7 ∈ row 9) (h90 : 0 ∈ row 9) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h75 h78 h05 h08 h98 h97 h90
    (order.commonOrientation_core_5_7_8_9_0 hforced)

/-- Source-block-only direct core extracted from the source-43 cell-8 survivor. -/
theorem FrozenBoundaryOrder.commonOrientation_core_3_0_2_1_6
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 3 0 2 1 6 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hdirect.surplus_between 3 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have hapex := hdirect.apex_order
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h3 := hmirror.surplus_between 3 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have hapex := hmirror.apex_order
    omega

theorem false_of_threeRows_core_3_0_2_1_6
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h03 : 3 ∈ row 0) (h02 : 2 ∈ row 0)
    (h63 : 3 ∈ row 6) (h62 : 2 ∈ row 6)
    (h12 : 2 ∈ row 1) (h10 : 0 ∈ row 1) (h16 : 6 ∈ row 1) : False := by
  exact false_of_direct_threeRow_core hreal order (by decide) (by decide)
    h03 h02 h63 h62 h12 h10 h16
    order.commonOrientation_core_3_0_2_1_6

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
