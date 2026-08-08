/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer

/-!
# Three-row ordered obstructions for the exact-twelve Rigid221 lane

The ordered CEGAR records at iterations 8391 and 8922 have the same metric
core.  Their fourth row-9 support label differs, but that label is unused.
This file records the stronger common theorem: seven row-membership facts,
not three exact row identities, force the contradiction in either frozen
boundary block order.  No retained order of labels `6,7,8,9` is needed.

This remains an exact-twelve boundary-order consumer.  It does not provide
finite coverage or the universal lift to the live Rigid221 leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- The common five-point core of ordered cuts 8391 and 8922 has the same
cyclic orientation in both frozen cap-block orders. -/
theorem FrozenBoundaryOrder.commonOrientation_core_0_1_2_9_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 1 2 9 4 := by
  rcases order.blocks with hdirect | hmirror
  · right
    constructor
    · exact Or.inl hdirect.apex_order
    · have h4 := hdirect.surplus_between 4 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      exact Or.inr (Or.inr ⟨h9.2, h4.1⟩)
  · left
    constructor
    · exact Or.inl hmirror.apex_order
    · have h4 := hmirror.surplus_between 4 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      exact Or.inr (Or.inr ⟨h4.2, h9⟩)

/-- Cardinality-independent row-membership replay of the common obstruction
mined at ordered CEGAR iterations 8391 and 8922. -/
theorem false_of_threeRows_core_0_1_2_9_4
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h10 : 0 ∈ row 1) (h12 : 2 ∈ row 1)
    (h40 : 0 ∈ row 4) (h42 : 2 ∈ row 4)
    (h92 : 2 ∈ row 9) (h91 : 1 ∈ row 9) (h94 : 4 ∈ row 9) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 2
      c := 9
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 2 h10 h12
      ya_yb := EdgeClosure.row 4 0 2 h40 h42
      cb_cx := EdgeClosure.row 9 2 1 h92 h91
      cb_cy := EdgeClosure.row 9 2 4 h92 h94 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_0_1_2_9_4

/-- The analogous core with first-opposite center `10`, mined at iteration
9976, also has a common orientation in either frozen block order. -/
theorem FrozenBoundaryOrder.commonOrientation_core_0_1_2_10_4
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 1 2 10 4 := by
  rcases order.blocks with hdirect | hmirror
  · right
    constructor
    · exact Or.inl hdirect.apex_order
    · have h4 := hdirect.surplus_between 4 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      exact Or.inl ⟨h4.1, h4.2.trans h10⟩
  · left
    constructor
    · exact Or.inl hmirror.apex_order
    · have h4 := hmirror.surplus_between 4 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      exact Or.inr (Or.inl ⟨h10.2.trans h4.1, h4.2⟩)

/-- Seven row-membership facts replay the iteration-9976 obstruction. -/
theorem false_of_threeRows_core_0_1_2_10_4
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h10 : 0 ∈ row 1) (h12 : 2 ∈ row 1)
    (h40 : 0 ∈ row 4) (h42 : 2 ∈ row 4)
    (h102 : 2 ∈ row 10) (h101 : 1 ∈ row 10)
    (h104 : 4 ∈ row 10) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 2
      c := 10
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 2 h10 h12
      ya_yb := EdgeClosure.row 4 0 2 h40 h42
      cb_cx := EdgeClosure.row 10 2 1 h102 h101
      cb_cy := EdgeClosure.row 10 2 4 h102 h104 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_0_1_2_10_4

/-- One of the two cores recorded at iterations 10137 and 10138 already has a
common orientation in every frozen block order; the second recorded core and
its three rows are unnecessary. -/
theorem FrozenBoundaryOrder.commonOrientation_core_1_4_0_10_5
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 1 4 0 10 5 := by
  rcases order.blocks with hdirect | hmirror
  · right
    constructor
    · have h4 := hdirect.surplus_between 4 (by decide)
      exact Or.inr (Or.inl ⟨hdirect.apex_order.1.trans h4.1,
        h4.2⟩)
    · have h5 := hdirect.surplus_between 5 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      exact Or.inl ⟨hdirect.apex_order.1.trans h5.1,
        h5.2.trans h10⟩
  · left
    constructor
    · have h4 := hmirror.surplus_between 4 (by decide)
      exact Or.inr (Or.inr ⟨hmirror.apex_order.1,
        h4.1⟩)
    · have h5 := hmirror.surplus_between 5 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      exact Or.inl ⟨h10.1, h10.2.trans h5.1⟩

/-- Seven row-membership facts replay both iterations 10137 and 10138. -/
theorem false_of_threeRows_core_1_4_0_10_5
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h41 : 1 ∈ row 4) (h40 : 0 ∈ row 4)
    (h51 : 1 ∈ row 5) (h50 : 0 ∈ row 5)
    (h100 : 0 ∈ row 10) (h104 : 4 ∈ row 10)
    (h105 : 5 ∈ row 10) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 0
      c := 10
      y := 5
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 0 h41 h40
      ya_yb := EdgeClosure.row 5 1 0 h51 h50
      cb_cx := EdgeClosure.row 10 0 4 h100 h104
      cb_cy := EdgeClosure.row 10 0 5 h100 h105 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_1_4_0_10_5

/-- One core from iteration 10349 has a common orientation in every frozen
block order.  The other four certificate cores are unnecessary. -/
theorem FrozenBoundaryOrder.commonOrientation_core_0_9_1_8_3
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 9 1 8 3 := by
  rcases order.blocks with hdirect | hmirror
  · left
    constructor
    · unfold CyclicTripleAt FrozenBoundaryOrder.position
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have hapex := hdirect.apex_order
      omega
    · unfold CyclicTripleAt FrozenBoundaryOrder.position
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have hapex := hdirect.apex_order
      omega
  · right
    constructor
    · unfold CyclicTripleAt FrozenBoundaryOrder.position
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have hapex := hmirror.apex_order
      omega
    · unfold CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      omega

/-- Seven row-membership facts replay the iteration-10349 obstruction. -/
theorem false_of_threeRows_core_0_9_1_8_3
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h90 : 0 ∈ row 9) (h91 : 1 ∈ row 9)
    (h30 : 0 ∈ row 3) (h31 : 1 ∈ row 3)
    (h81 : 1 ∈ row 8) (h89 : 9 ∈ row 8)
    (h83 : 3 ∈ row 8) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 9
      b := 1
      c := 8
      y := 3
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 9 0 1 h90 h91
      ya_yb := EdgeClosure.row 3 0 1 h30 h31
      cb_cx := EdgeClosure.row 8 1 9 h81 h89
      cb_cy := EdgeClosure.row 8 1 3 h81 h83 }
  exact order.false_of_convexFivePointCore hreal core
    order.commonOrientation_core_0_9_1_8_3

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
