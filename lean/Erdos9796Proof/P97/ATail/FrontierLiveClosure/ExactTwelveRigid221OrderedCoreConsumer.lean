/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Ordered five-point consumer for the exact-twelve Rigid221 lane

This file is the Lean-side consumer for ordered CEGAR cuts.  It keeps the
boundary realization supplied by `FrozenBoundaryOrder`, converts cyclic index
facts into the two signed-area hypotheses of `ConvexFivePointCore`, and checks
the first two ordered cuts emitted by the source-faithful exact-twelve run.

The final theorem below proves one learned cut.  It is not yet coverage of all
source-safe row families and therefore does not close the live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- Positive cyclic order of three labels in one zero-cut boundary indexing. -/
def CyclicTripleAt (position : Label → Nat) (a b c : Label) : Prop :=
  (position a < position b ∧ position b < position c) ∨
    (position b < position c ∧ position c < position a) ∨
    (position c < position a ∧ position a < position b)

/-- The two turns used by a five-point core have one common boundary
orientation. -/
def CommonFiveOrientationAt (position : Label → Nat)
    (a x b c y : Label) : Prop :=
  (CyclicTripleAt position a x b ∧ CyclicTripleAt position b c y) ∨
    (CyclicTripleAt position a b x ∧ CyclicTripleAt position b y c)

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_rotate (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_neg_of_cyclic
    {n : Nat} {boundary : Fin n → ℝ²}
    (hinjective : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i j k : Fin n}
    (hcyclic :
      (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)) :
    signedArea2 (boundary i) (boundary j) (boundary k) < 0 := by
  rcases hcyclic with hij | hjk | hki
  · exact hneg_of_ccw hinjective hccw hij.1 hij.2
  · rw [signedArea2_rotate]
    exact hneg_of_ccw hinjective hccw hjk.1 hjk.2
  · rw [signedArea2_rotate, signedArea2_rotate]
    exact hneg_of_ccw hinjective hccw hki.1 hki.2

theorem FrozenBoundaryOrder.signedArea2_neg_of_cyclicTripleAt
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c : Label} (hcyclic : CyclicTripleAt order.position a b c) :
    signedArea2 (pointOf a) (pointOf b) (pointOf c) < 0 := by
  rw [← order.point_eq a, ← order.point_eq b, ← order.point_eq c]
  apply signedArea2_neg_of_cyclic order.boundary_injective order.boundary_ccw
  simpa only [CyclicTripleAt, FrozenBoundaryOrder.position] using hcyclic

theorem FrozenBoundaryOrder.signedArea2_pos_of_reverseCyclicTripleAt
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {a b c : Label} (hcyclic : CyclicTripleAt order.position a c b) :
    0 < signedArea2 (pointOf a) (pointOf b) (pointOf c) := by
  rw [signedArea2_swap23]
  have hneg := order.signedArea2_neg_of_cyclicTripleAt hcyclic
  linarith

/-- A realized equality core whose two turns have the same cyclic orientation
in the retained boundary order is contradictory. -/
theorem FrozenBoundaryOrder.false_of_convexFivePointCore
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {row : RowPattern Label} (hreal : Realizes row pointOf)
    (core : Census554.ConvexFivePointCore.Core row)
    (horientation : CommonFiveOrientationAt order.position
      core.a core.x core.b core.c core.y) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_common_orientation
    hreal core
  rcases horientation with hforward | hreverse
  · right
    exact ⟨order.signedArea2_neg_of_cyclicTripleAt hforward.1,
      order.signedArea2_neg_of_cyclicTripleAt hforward.2⟩
  · left
    exact ⟨order.signedArea2_pos_of_reverseCyclicTripleAt hreverse.1,
      order.signedArea2_pos_of_reverseCyclicTripleAt hreverse.2⟩

/-- The first ordered CEGAR cut: the seven displayed concrete rows cannot all
occur in a source-faithful exact-twelve row pattern carrying the retained
same-boundary order.  Depending on the two cap orientations, one of three
replayed `ConvexFivePointCore`s is selected. -/
theorem false_of_orderedCut_706
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow2 : row 2 = {1, 7, 10, 11})
    (hrow5 : row 5 = {1, 2, 4, 11})
    (hrow6 : row 6 = {0, 2, 4, 5})
    (hrow7 : row 7 = {1, 5, 6, 8})
    (hrow9 : row 9 = {1, 2, 6, 7})
    (hrow11 : row 11 = {1, 3, 8, 10}) : False := by
  let core1 : Census554.ConvexFivePointCore.Core row :=
    { a := 10
      x := 11
      b := 1
      c := 5
      y := 2
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 10 1 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 2 10 1 (by simp [hrow2]) (by simp [hrow2])
      cb_cx := EdgeClosure.row 5 1 11 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 1 2 (by simp [hrow5]) (by simp [hrow5]) }
  let core2 : Census554.ConvexFivePointCore.Core row :=
    { a := 8
      x := 11
      b := 1
      c := 2
      y := 7
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 8 1 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 7 8 1 (by simp [hrow7]) (by simp [hrow7])
      cb_cx := EdgeClosure.row 2 1 11 (by simp [hrow2]) (by simp [hrow2])
      cb_cy := EdgeClosure.row 2 1 7 (by simp [hrow2]) (by simp [hrow2]) }
  let core3 : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 2
      c := 9
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 2 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 6 0 2 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 9 2 1 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 2 6 (by simp [hrow9]) (by simp [hrow9]) }
  have h10ne11 : (order.index 10).val ≠ (order.index 11).val := by
    intro h
    have hindex : order.index 10 = order.index 11 := Fin.ext h
    exact (by decide : (10 : Label) ≠ 11) (order.index_injective hindex)
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hsecondForward | hsecondReverse
    · apply order.false_of_convexFivePointCore hreal core3
      dsimp only [core3]
      right
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h0_2 := hdirect.apex_order.1
        have h2_1 := hdirect.apex_order.2
        omega
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h6 := hdirect.secondOpposite_between 6 (by decide)
        have h9 := hdirect.secondOpposite_between 9 (by decide)
        omega
    · rcases lt_or_gt_of_ne h10ne11 with h10_11 | h11_10
      · apply order.false_of_convexFivePointCore hreal core2
        dsimp only [core2]
        right
        constructor
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h8 := hdirect.secondOpposite_between 8 (by decide)
          have h11 := hdirect.firstOpposite_after 11 (by decide)
          have h2_1 := hdirect.apex_order.2
          omega
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h7 := hdirect.secondOpposite_between 7 (by decide)
          have h2_1 := hdirect.apex_order.2
          omega
      · apply order.false_of_convexFivePointCore hreal core1
        dsimp only [core1]
        right
        constructor
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h10 := hdirect.firstOpposite_after 10 (by decide)
          have h11 := hdirect.firstOpposite_after 11 (by decide)
          have h2_1 := hdirect.apex_order.2
          omega
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h5 := hdirect.surplus_between 5 (by decide)
          omega
  · rcases hforced with hsecondForward | hsecondReverse
    · rcases lt_or_gt_of_ne h10ne11 with h10_11 | h11_10
      · apply order.false_of_convexFivePointCore hreal core1
        dsimp only [core1]
        left
        constructor
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h10 := hmirror.firstOpposite_between 10 (by decide)
          have h11 := hmirror.firstOpposite_between 11 (by decide)
          omega
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h5 := hmirror.surplus_between 5 (by decide)
          omega
      · apply order.false_of_convexFivePointCore hreal core2
        dsimp only [core2]
        left
        constructor
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h8 := hmirror.secondOpposite_after 8 (by decide)
          have h11 := hmirror.firstOpposite_between 11 (by decide)
          exact Or.inr (Or.inl ⟨h11.2, hmirror.apex_order.2.trans h8⟩)
        · unfold CyclicTripleAt FrozenBoundaryOrder.position
          have h7 := hmirror.secondOpposite_after 7 (by decide)
          exact Or.inl ⟨hmirror.apex_order.2, h7⟩
    · apply order.false_of_convexFivePointCore hreal core3
      dsimp only [core3]
      left
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        exact Or.inl hmirror.apex_order
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h2_9 := hmirror.secondOpposite_after 9 (by decide)
        omega

/-- The second ordered CEGAR cut admits a smaller replay than the discovery
certificate originally recorded.  Six concrete rows suffice: according to the
ambient cap orientation and the retained order of `6,7,8,9`, one of two
`ConvexFivePointCore`s has its two turns in one common cyclic orientation.

This theorem proves one learned cut only.  It does not assert finite coverage
of the exact-twelve branch or close the live universal residual. -/
theorem false_of_orderedCut_707
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow3 : row 3 = {0, 5, 9, 11})
    (hrow6 : row 6 = {0, 2, 4, 5})
    (hrow8 : row 8 = {3, 5, 6, 9})
    (hrow9 : row 9 = {1, 2, 6, 7})
    (hrow11 : row 11 = {3, 8, 9, 10}) : False := by
  let forwardSecondCore : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 8
      b := 9
      c := 11
      y := 3
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 8 5 9 (by simp [hrow8]) (by simp [hrow8])
      ya_yb := EdgeClosure.row 3 5 9 (by simp [hrow3]) (by simp [hrow3])
      cb_cx := EdgeClosure.row 11 9 8 (by simp [hrow11]) (by simp [hrow11])
      cb_cy := EdgeClosure.row 11 9 3 (by simp [hrow11]) (by simp [hrow11]) }
  let reverseSecondCore : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 2
      c := 9
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 2 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 6 0 2 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 9 2 1 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 2 6 (by simp [hrow9]) (by simp [hrow9]) }
  change
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) at hforced
  rcases order.blocks with hdirect | hmirror
  · rcases hforced with hsecondForward | hsecondReverse
    · apply order.false_of_convexFivePointCore hreal reverseSecondCore
      dsimp only [reverseSecondCore]
      right
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        exact Or.inl hdirect.apex_order
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h6 := hdirect.secondOpposite_between 6 (by decide)
        have h9 := hdirect.secondOpposite_between 9 (by decide)
        omega
    · apply order.false_of_convexFivePointCore hreal forwardSecondCore
      dsimp only [forwardSecondCore]
      right
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h5 := hdirect.surplus_between 5 (by decide)
        have h8 := hdirect.secondOpposite_between 8 (by decide)
        have h9 := hdirect.secondOpposite_between 9 (by decide)
        omega
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h9 := hdirect.secondOpposite_between 9 (by decide)
        have h3 := hdirect.surplus_between 3 (by decide)
        have h11 := hdirect.firstOpposite_after 11 (by decide)
        omega
  · rcases hforced with hsecondForward | hsecondReverse
    · apply order.false_of_convexFivePointCore hreal forwardSecondCore
      dsimp only [forwardSecondCore]
      left
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h5 := hmirror.surplus_between 5 (by decide)
        have h8 := hmirror.secondOpposite_after 8 (by decide)
        have h9 := hmirror.secondOpposite_after 9 (by decide)
        omega
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h9 := hmirror.secondOpposite_after 9 (by decide)
        have h11 := hmirror.firstOpposite_between 11 (by decide)
        have h3 := hmirror.surplus_between 3 (by decide)
        omega
    · apply order.false_of_convexFivePointCore hreal reverseSecondCore
      dsimp only [reverseSecondCore]
      left
      constructor
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        exact Or.inl hmirror.apex_order
      · unfold CyclicTripleAt FrozenBoundaryOrder.position
        have h6 := hmirror.secondOpposite_after 6 (by decide)
        have h9 := hmirror.secondOpposite_after 9 (by decide)
        omega

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
