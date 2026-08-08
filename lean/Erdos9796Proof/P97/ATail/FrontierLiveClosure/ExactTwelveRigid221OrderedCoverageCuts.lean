/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer

/-!
# Arithmetic coverage for exact-twelve Rigid221 ordered cuts

This file separates finite boundary-order coverage from the metric replay used
by ordered CEGAR cuts.  The coverage statements are small Presburger facts
about the two frozen cap-block orders and the retained order of labels
`6,7,8,9`; their conclusions select one replayable five-point core.

Each theorem below proves only one learned cut.  It does not prove coverage of
all exact-twelve candidates or close the live universal residual.
-/

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

set_option maxHeartbeats 2000000 in
/-- Arithmetic coverage for ordered cut 1479.  Across both cap-block orders,
both retained second-cap orientations, and every internal order of the
three surplus labels, at least one of the five recorded cores has a common
two-turn orientation. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_1479
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 6 8 4 5 3 ∨
      CommonFiveOrientationAt order.position 5 11 1 3 4 ∨
      CommonFiveOrientationAt order.position 1 4 9 8 10 ∨
      CommonFiveOrientationAt order.position 9 10 6 7 8 ∨
      CommonFiveOrientationAt order.position 0 11 5 4 9 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h10ne11 : order.position 10 ≠ order.position 11 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  change (order.index 10).val ≠ (order.index 11).val at h10ne11
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
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      omega

/-- Exact replay of the five row cores selected by arithmetic coverage for
ordered cut 1479. -/
theorem false_of_orderedCut_1479
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow3 : row 3 = {1, 4, 6, 11})
    (hrow4 : row 4 = {1, 5, 9, 11})
    (hrow5 : row 5 = {2, 3, 4, 8})
    (hrow7 : row 7 = {5, 6, 8, 10})
    (hrow8 : row 8 = {4, 6, 9, 10})
    (hrow9 : row 9 = {0, 2, 5, 7})
    (hrow10 : row 10 = {1, 2, 6, 9})
    (hrow11 : row 11 = {0, 1, 3, 5}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 6
      x := 8
      b := 4
      c := 5
      y := 3
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 8 6 4 (by simp [hrow8]) (by simp [hrow8])
      ya_yb := EdgeClosure.row 3 6 4 (by simp [hrow3]) (by simp [hrow3])
      cb_cx := EdgeClosure.row 5 4 8 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 4 3 (by simp [hrow5]) (by simp [hrow5]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 11
      b := 1
      c := 3
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 5 1 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 4 5 1 (by simp [hrow4]) (by simp [hrow4])
      cb_cx := EdgeClosure.row 3 1 11 (by simp [hrow3]) (by simp [hrow3])
      cb_cy := EdgeClosure.row 3 1 4 (by simp [hrow3]) (by simp [hrow3]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 9
      c := 8
      y := 10
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 9 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 10 1 9 (by simp [hrow10]) (by simp [hrow10])
      cb_cx := EdgeClosure.row 8 9 4 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 9 10 (by simp [hrow8]) (by simp [hrow8]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 9
      x := 10
      b := 6
      c := 7
      y := 8
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 10 9 6 (by simp [hrow10]) (by simp [hrow10])
      ya_yb := EdgeClosure.row 8 9 6 (by simp [hrow8]) (by simp [hrow8])
      cb_cx := EdgeClosure.row 7 6 10 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 6 8 (by simp [hrow7]) (by simp [hrow7]) }
  let coreE : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 11
      b := 5
      c := 4
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 0 5 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 9 0 5 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 4 5 11 (by simp [hrow4]) (by simp [hrow4])
      cb_cy := EdgeClosure.row 4 5 9 (by simp [hrow4]) (by simp [hrow4]) }
  rcases order.commonOrientationCoverage_orderedCut_1479 hforced with
    hA | hB | hC | hD | hE
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD
  · apply order.false_of_convexFivePointCore hreal coreE
    exact hE

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 2118. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_2118
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 5 0 10 4 8 ∨
      CommonFiveOrientationAt order.position 0 11 7 3 6 := by
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- Exact replay of ordered cut 2118. -/
theorem false_of_orderedCut_2118
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow0 : row 0 = {3, 5, 7, 10})
    (hrow3 : row 3 = {6, 7, 9, 11})
    (hrow4 : row 4 = {0, 8, 9, 10})
    (hrow6 : row 6 = {0, 2, 3, 7})
    (hrow8 : row 8 = {5, 6, 9, 10})
    (hrow11 : row 11 = {0, 1, 7, 9}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 0
      b := 10
      c := 4
      y := 8
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 0 5 10 (by simp [hrow0]) (by simp [hrow0])
      ya_yb := EdgeClosure.row 8 5 10 (by simp [hrow8]) (by simp [hrow8])
      cb_cx := EdgeClosure.row 4 10 0 (by simp [hrow4]) (by simp [hrow4])
      cb_cy := EdgeClosure.row 4 10 8 (by simp [hrow4]) (by simp [hrow4]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 11
      b := 7
      c := 3
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 0 7 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 6 0 7 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 3 7 11 (by simp [hrow3]) (by simp [hrow3])
      cb_cy := EdgeClosure.row 3 7 6 (by simp [hrow3]) (by simp [hrow3]) }
  rcases order.commonOrientationCoverage_orderedCut_2118 hforced with hA | hB
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 2653. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_2653
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 3 11 8 9 ∨
      CommonFiveOrientationAt order.position 0 3 9 6 10 := by
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hdirect.surplus_between 3 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      omega

/-- Exact replay of ordered cut 2653. -/
theorem false_of_orderedCut_2653
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow3 : row 3 = {0, 1, 9, 11})
    (hrow6 : row 6 = {3, 5, 9, 10})
    (hrow8 : row 8 = {3, 6, 9, 11})
    (hrow9 : row 9 = {1, 4, 6, 11})
    (hrow10 : row 10 = {0, 7, 8, 9}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 3
      b := 11
      c := 8
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 3 1 11 (by simp [hrow3]) (by simp [hrow3])
      ya_yb := EdgeClosure.row 9 1 11 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 8 11 3 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 11 9 (by simp [hrow8]) (by simp [hrow8]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 3
      b := 9
      c := 6
      y := 10
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 3 0 9 (by simp [hrow3]) (by simp [hrow3])
      ya_yb := EdgeClosure.row 10 0 9 (by simp [hrow10]) (by simp [hrow10])
      cb_cx := EdgeClosure.row 6 9 3 (by simp [hrow6]) (by simp [hrow6])
      cb_cy := EdgeClosure.row 6 9 10 (by simp [hrow6]) (by simp [hrow6]) }
  rcases order.commonOrientationCoverage_orderedCut_2653 hforced with hA | hB
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB

set_option maxHeartbeats 2000000 in
/-- Arithmetic coverage for ordered cut 2751.  The discovery certificate
listed one core twice for different normalized orders; the disjunction below
retains only the five distinct cores. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_2751
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 11 0 4 9 2 ∨
      CommonFiveOrientationAt order.position 3 6 5 7 4 ∨
      CommonFiveOrientationAt order.position 3 4 5 7 6 ∨
      CommonFiveOrientationAt order.position 5 6 3 0 4 ∨
      CommonFiveOrientationAt order.position 4 2 8 3 7 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
    omega
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h11 := hdirect.firstOpposite_after 11 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h11 := hmirror.firstOpposite_between 11 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact replay of ordered cut 2751. -/
theorem false_of_orderedCut_2751
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow0 : row 0 = {3, 4, 6, 11})
    (hrow2 : row 2 = {4, 8, 10, 11})
    (hrow3 : row 3 = {2, 5, 7, 8})
    (hrow4 : row 4 = {0, 1, 3, 5})
    (hrow6 : row 6 = {2, 3, 4, 5})
    (hrow7 : row 7 = {4, 5, 6, 8})
    (hrow9 : row 9 = {0, 2, 4, 10}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 11
      x := 0
      b := 4
      c := 9
      y := 2
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 0 11 4 (by simp [hrow0]) (by simp [hrow0])
      ya_yb := EdgeClosure.row 2 11 4 (by simp [hrow2]) (by simp [hrow2])
      cb_cx := EdgeClosure.row 9 4 0 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 4 2 (by simp [hrow9]) (by simp [hrow9]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 6
      b := 5
      c := 7
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 3 5 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 4 3 5 (by simp [hrow4]) (by simp [hrow4])
      cb_cx := EdgeClosure.row 7 5 6 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 5 4 (by simp [hrow7]) (by simp [hrow7]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 4
      b := 5
      c := 7
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 3 5 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 6 3 5 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 7 5 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 5 6 (by simp [hrow7]) (by simp [hrow7]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 6
      b := 3
      c := 0
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 5 3 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 4 5 3 (by simp [hrow4]) (by simp [hrow4])
      cb_cx := EdgeClosure.row 0 3 6 (by simp [hrow0]) (by simp [hrow0])
      cb_cy := EdgeClosure.row 0 3 4 (by simp [hrow0]) (by simp [hrow0]) }
  let coreE : Census554.ConvexFivePointCore.Core row :=
    { a := 4
      x := 2
      b := 8
      c := 3
      y := 7
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 2 4 8 (by simp [hrow2]) (by simp [hrow2])
      ya_yb := EdgeClosure.row 7 4 8 (by simp [hrow7]) (by simp [hrow7])
      cb_cx := EdgeClosure.row 3 8 2 (by simp [hrow3]) (by simp [hrow3])
      cb_cy := EdgeClosure.row 3 8 7 (by simp [hrow3]) (by simp [hrow3]) }
  rcases order.commonOrientationCoverage_orderedCut_2751 hforced with
    hA | hB | hC | hD | hE
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD
  · apply order.false_of_convexFivePointCore hreal coreE
    exact hE

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 1601.  The retained direction of the
second-opposite cap alone selects one of its two cores. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_1601
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 6 8 9 ∨
      CommonFiveOrientationAt order.position 1 5 8 7 6 := by
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
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      omega

/-- Exact replay of ordered cut 1601.  Its second core records the only
non-direct equality derivation among the first seven v4 cuts: a five-step
flip/row/flip/row/flip path from `(6,1)` to `(6,8)`. -/
theorem false_of_orderedCut_1601
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow5 : row 5 = {1, 2, 3, 8})
    (hrow7 : row 7 = {5, 6, 8, 10})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow9 : row 9 = {0, 6, 10, 11}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 6
      c := 8
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 6 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 9 0 6 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 8 6 1 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 6 9 (by simp [hrow8]) (by simp [hrow8]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 5
      b := 8
      c := 7
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 5 1 8 (by simp [hrow5]) (by simp [hrow5])
      ya_yb := EdgeClosure.trans (EdgeClosure.flip 6 1)
        (EdgeClosure.trans
          (EdgeClosure.row 1 6 8 (by simp [hrow1]) (by simp [hrow1]))
          (EdgeClosure.trans (EdgeClosure.flip 1 8)
            (EdgeClosure.trans
              (EdgeClosure.row 8 1 6 (by simp [hrow8]) (by simp [hrow8]))
              (EdgeClosure.flip 8 6))))
      cb_cx := EdgeClosure.row 7 8 5 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 8 6 (by simp [hrow7]) (by simp [hrow7]) }
  rcases order.commonOrientationCoverage_orderedCut_1601 hforced with hA | hB
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB

/-- Ordered cut 5959 is stronger than the discovery interface recorded: one
three-row core has a common orientation in either frozen block order, without
using the retained internal order of the second-opposite cap. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_5959
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 1 2 9 10 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- Exact three-row replay of ordered cut 5959. -/
theorem false_of_orderedCut_5959
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow9 : row 9 = {1, 2, 5, 10})
    (hrow10 : row 10 = {0, 2, 4, 7}) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 2
      c := 9
      y := 10
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 2 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 10 0 2 (by simp [hrow10]) (by simp [hrow10])
      cb_cx := EdgeClosure.row 9 2 1 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 2 10 (by simp [hrow9]) (by simp [hrow9]) }
  apply order.false_of_convexFivePointCore hreal core
  exact order.commonOrientationCoverage_orderedCut_5959

/-- The second certificate recorded for ordered cut 6116 actually covers both
frozen block orders by itself; neither the other certificate nor the retained
internal order of the second-opposite cap is needed. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_6116
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 6 0 10 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- Three-row strengthening of the exact ordered-cut-6116 replay. -/
theorem false_of_orderedCut_6116
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow6 : row 6 = {0, 2, 3, 5})
    (hrow10 : row 10 = {0, 1, 5, 6}) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 2
      x := 6
      b := 0
      c := 10
      y := 1
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 2 0 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 1 2 0 (by simp [hrow1]) (by simp [hrow1])
      cb_cx := EdgeClosure.row 10 0 6 (by simp [hrow10]) (by simp [hrow10])
      cb_cy := EdgeClosure.row 10 0 1 (by simp [hrow10]) (by simp [hrow10]) }
  apply order.false_of_convexFivePointCore hreal core
  exact order.commonOrientationCoverage_orderedCut_6116

/-- The third certificate recorded for ordered cut 4669 has the same
block-order invariant shape as cut 6116 and covers both frozen orders alone. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_4669
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 9 0 10 1 := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    omega

/-- Three-row strengthening of the exact ordered-cut-4669 replay. -/
theorem false_of_orderedCut_4669
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow9 : row 9 = {0, 2, 7, 10})
    (hrow10 : row 10 = {0, 1, 7, 9}) : False := by
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 2
      x := 9
      b := 0
      c := 10
      y := 1
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 9 2 0 (by simp [hrow9]) (by simp [hrow9])
      ya_yb := EdgeClosure.row 1 2 0 (by simp [hrow1]) (by simp [hrow1])
      cb_cx := EdgeClosure.row 10 0 9 (by simp [hrow10]) (by simp [hrow10])
      cb_cy := EdgeClosure.row 10 0 1 (by simp [hrow10]) (by simp [hrow10]) }
  apply order.false_of_convexFivePointCore hreal core
  exact order.commonOrientationCoverage_orderedCut_4669

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 4927.  Only the relative order of the
three surplus labels is relevant; the cap-internal orders disappear. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_4927
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 0 10 5 4 6 ∨
      CommonFiveOrientationAt order.position 4 2 11 6 0 ∨
      CommonFiveOrientationAt order.position 3 0 4 2 11 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
    omega
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact six-row replay of ordered cut 4927. -/
theorem false_of_orderedCut_4927
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hrow0 : row 0 = {3, 4, 8, 11})
    (hrow2 : row 2 = {0, 4, 10, 11})
    (hrow4 : row 4 = {2, 5, 6, 10})
    (hrow6 : row 6 = {0, 2, 5, 11})
    (hrow10 : row 10 = {0, 1, 3, 5})
    (hrow11 : row 11 = {1, 3, 4, 9}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 10
      b := 5
      c := 4
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 10 0 5 (by simp [hrow10]) (by simp [hrow10])
      ya_yb := EdgeClosure.row 6 0 5 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 4 5 10 (by simp [hrow4]) (by simp [hrow4])
      cb_cy := EdgeClosure.row 4 5 6 (by simp [hrow4]) (by simp [hrow4]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 4
      x := 2
      b := 11
      c := 6
      y := 0
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 2 4 11 (by simp [hrow2]) (by simp [hrow2])
      ya_yb := EdgeClosure.row 0 4 11 (by simp [hrow0]) (by simp [hrow0])
      cb_cx := EdgeClosure.row 6 11 2 (by simp [hrow6]) (by simp [hrow6])
      cb_cy := EdgeClosure.row 6 11 0 (by simp [hrow6]) (by simp [hrow6]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 0
      b := 4
      c := 2
      y := 11
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 0 3 4 (by simp [hrow0]) (by simp [hrow0])
      ya_yb := EdgeClosure.row 11 3 4 (by simp [hrow11]) (by simp [hrow11])
      cb_cx := EdgeClosure.row 2 4 0 (by simp [hrow2]) (by simp [hrow2])
      cb_cy := EdgeClosure.row 2 4 11 (by simp [hrow2]) (by simp [hrow2]) }
  rcases order.commonOrientationCoverage_orderedCut_4927 with hA | hB | hC
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 3881. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_3881
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 6 8 9 ∨
      CommonFiveOrientationAt order.position 0 6 2 5 1 ∨
      CommonFiveOrientationAt order.position 4 7 3 2 10 ∨
      CommonFiveOrientationAt order.position 5 4 0 9 6 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
    omega
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
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hdirect.apex_order
      have h3 := hdirect.surplus_between 3 (by decide)
      have h4 := hdirect.surplus_between 4 (by decide)
      have h5 := hdirect.surplus_between 5 (by decide)
      have h6 := hdirect.secondOpposite_between 6 (by decide)
      have h7 := hdirect.secondOpposite_between 7 (by decide)
      have h8 := hdirect.secondOpposite_between 8 (by decide)
      have h9 := hdirect.secondOpposite_between 9 (by decide)
      have h10 := hdirect.firstOpposite_after 10 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · rcases hforced with hforward | hreverse
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
    · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
      have hapex := hmirror.apex_order
      have h3 := hmirror.surplus_between 3 (by decide)
      have h4 := hmirror.surplus_between 4 (by decide)
      have h5 := hmirror.surplus_between 5 (by decide)
      have h6 := hmirror.secondOpposite_after 6 (by decide)
      have h7 := hmirror.secondOpposite_after 7 (by decide)
      have h8 := hmirror.secondOpposite_after 8 (by decide)
      have h9 := hmirror.secondOpposite_after 9 (by decide)
      have h10 := hmirror.firstOpposite_between 10 (by decide)
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact nine-row replay of ordered cut 3881. -/
theorem false_of_orderedCut_3881
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow2 : row 2 = {3, 7, 10, 11})
    (hrow4 : row 4 = {0, 1, 5, 7})
    (hrow5 : row 5 = {1, 2, 6, 7})
    (hrow6 : row 6 = {0, 2, 3, 5})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow9 : row 9 = {0, 4, 6, 7})
    (hrow10 : row 10 = {0, 1, 3, 4}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 6
      c := 8
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 6 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 9 0 6 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 8 6 1 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 6 9 (by simp [hrow8]) (by simp [hrow8]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 6
      b := 2
      c := 5
      y := 1
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 0 2 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 1 0 2 (by simp [hrow1]) (by simp [hrow1])
      cb_cx := EdgeClosure.row 5 2 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 2 1 (by simp [hrow5]) (by simp [hrow5]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 4
      x := 7
      b := 3
      c := 2
      y := 10
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 7 4 3 (by simp [hrow7]) (by simp [hrow7])
      ya_yb := EdgeClosure.row 10 4 3 (by simp [hrow10]) (by simp [hrow10])
      cb_cx := EdgeClosure.row 2 3 7 (by simp [hrow2]) (by simp [hrow2])
      cb_cy := EdgeClosure.row 2 3 10 (by simp [hrow2]) (by simp [hrow2]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 4
      b := 0
      c := 9
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 5 0 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 6 5 0 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 9 0 4 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 0 6 (by simp [hrow9]) (by simp [hrow9]) }
  rcases order.commonOrientationCoverage_orderedCut_3881 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 3882. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_3882
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 1 6 8 9 ∨
      CommonFiveOrientationAt order.position 0 6 2 5 1 ∨
      CommonFiveOrientationAt order.position 4 7 3 0 10 ∨
      CommonFiveOrientationAt order.position 5 4 0 9 6 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
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
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact nine-row replay of ordered cut 3882. -/
theorem false_of_orderedCut_3882
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow0 : row 0 = {3, 5, 7, 10})
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow4 : row 4 = {0, 1, 5, 7})
    (hrow5 : row 5 = {1, 2, 6, 7})
    (hrow6 : row 6 = {0, 2, 3, 5})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow9 : row 9 = {0, 4, 6, 7})
    (hrow10 : row 10 = {0, 1, 3, 4}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 6
      c := 8
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 6 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 9 0 6 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 8 6 1 (by simp [hrow8]) (by simp [hrow8])
      cb_cy := EdgeClosure.row 8 6 9 (by simp [hrow8]) (by simp [hrow8]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 6
      b := 2
      c := 5
      y := 1
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 0 2 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 1 0 2 (by simp [hrow1]) (by simp [hrow1])
      cb_cx := EdgeClosure.row 5 2 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 2 1 (by simp [hrow5]) (by simp [hrow5]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 4
      x := 7
      b := 3
      c := 0
      y := 10
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 7 4 3 (by simp [hrow7]) (by simp [hrow7])
      ya_yb := EdgeClosure.row 10 4 3 (by simp [hrow10]) (by simp [hrow10])
      cb_cx := EdgeClosure.row 0 3 7 (by simp [hrow0]) (by simp [hrow0])
      cb_cy := EdgeClosure.row 0 3 10 (by simp [hrow0]) (by simp [hrow0]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 5
      x := 4
      b := 0
      c := 9
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 5 0 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 6 5 0 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 9 0 4 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 0 6 (by simp [hrow9]) (by simp [hrow9]) }
  rcases order.commonOrientationCoverage_orderedCut_3882 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 6012.  Its four-way certificate choice
depends only on the direction of the second cap and on whether surplus label
`3` or `4` occurs first. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_6012
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 8 11 4 2 7 ∨
      CommonFiveOrientationAt order.position 1 4 3 7 8 ∨
      CommonFiveOrientationAt order.position 3 4 2 9 6 ∨
      CommonFiveOrientationAt order.position 2 4 3 7 6 := by
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

/-- Exact seven-row replay of ordered cut 6012. -/
theorem false_of_orderedCut_6012
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow2 : row 2 = {4, 7, 10, 11})
    (hrow4 : row 4 = {1, 2, 3, 11})
    (hrow6 : row 6 = {0, 2, 3, 10})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow9 : row 9 = {2, 4, 5, 6})
    (hrow11 : row 11 = {1, 2, 4, 8}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 8
      x := 11
      b := 4
      c := 2
      y := 7
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 11 8 4 (by simp [hrow11]) (by simp [hrow11])
      ya_yb := EdgeClosure.row 7 8 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cx := EdgeClosure.row 2 4 11 (by simp [hrow2]) (by simp [hrow2])
      cb_cy := EdgeClosure.row 2 4 7 (by simp [hrow2]) (by simp [hrow2]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
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
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 4
      b := 2
      c := 9
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 3 2 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 6 3 2 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 9 2 4 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 2 6 (by simp [hrow9]) (by simp [hrow9]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 2
      x := 4
      b := 3
      c := 7
      y := 6
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 2 3 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 6 2 3 (by simp [hrow6]) (by simp [hrow6])
      cb_cx := EdgeClosure.row 7 3 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cy := EdgeClosure.row 7 3 6 (by simp [hrow7]) (by simp [hrow7]) }
  rcases order.commonOrientationCoverage_orderedCut_6012 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 5404. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_5404
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 0 2 3 6 4 ∨
      CommonFiveOrientationAt order.position 1 4 5 0 9 ∨
      CommonFiveOrientationAt order.position 3 6 4 5 7 ∨
      CommonFiveOrientationAt order.position 0 1 6 9 5 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
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
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact eight-row replay of ordered cut 5404. -/
theorem false_of_orderedCut_5404
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow0 : row 0 = {4, 5, 9, 10})
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow2 : row 2 = {0, 3, 10, 11})
    (hrow4 : row 4 = {0, 1, 3, 5})
    (hrow5 : row 5 = {0, 4, 6, 7})
    (hrow6 : row 6 = {2, 3, 4, 10})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow9 : row 9 = {1, 2, 5, 6}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 2
      b := 3
      c := 6
      y := 4
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 2 0 3 (by simp [hrow2]) (by simp [hrow2])
      ya_yb := EdgeClosure.row 4 0 3 (by simp [hrow4]) (by simp [hrow4])
      cb_cx := EdgeClosure.row 6 3 2 (by simp [hrow6]) (by simp [hrow6])
      cb_cy := EdgeClosure.row 6 3 4 (by simp [hrow6]) (by simp [hrow6]) }
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 5
      c := 0
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 5 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 9 1 5 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 0 5 4 (by simp [hrow0]) (by simp [hrow0])
      cb_cy := EdgeClosure.row 0 5 9 (by simp [hrow0]) (by simp [hrow0]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 6
      b := 4
      c := 5
      y := 7
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 3 4 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 7 3 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cx := EdgeClosure.row 5 4 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 4 7 (by simp [hrow5]) (by simp [hrow5]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 6
      c := 9
      y := 5
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 6 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 5 0 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cx := EdgeClosure.row 9 6 1 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 6 5 (by simp [hrow9]) (by simp [hrow9]) }
  rcases order.commonOrientationCoverage_orderedCut_5404 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
/-- Arithmetic coverage for ordered cut 5406. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_5406
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 1 4 3 7 8 ∨
      CommonFiveOrientationAt order.position 1 4 5 0 9 ∨
      CommonFiveOrientationAt order.position 3 6 4 5 7 ∨
      CommonFiveOrientationAt order.position 0 1 6 9 5 := by
  have h3ne4 : order.position 3 ≠ order.position 4 :=
    order.position_ne_of_ne (by decide)
  have h3ne5 : order.position 3 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  have h4ne5 : order.position 4 ≠ order.position 5 :=
    order.position_ne_of_ne (by decide)
  change (order.index 3).val ≠ (order.index 4).val at h3ne4
  change (order.index 3).val ≠ (order.index 5).val at h3ne5
  change (order.index 4).val ≠ (order.index 5).val at h4ne5
  have hsurplus :
      ((order.index 3).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 5).val) ∨
        ((order.index 3).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 4).val) ∨
        ((order.index 4).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 5).val) ∨
        ((order.index 4).val < (order.index 5).val ∧
          (order.index 5).val < (order.index 3).val) ∨
        ((order.index 5).val < (order.index 3).val ∧
          (order.index 3).val < (order.index 4).val) ∨
        ((order.index 5).val < (order.index 4).val ∧
          (order.index 4).val < (order.index 3).val) := by
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
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    rcases hforced with hforward | hreverse <;>
      rcases hsurplus with h345 | h354 | h435 | h453 | h534 | h543 <;> omega

/-- Exact eight-row replay of ordered cut 5406. -/
theorem false_of_orderedCut_5406
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hrow0 : row 0 = {4, 5, 9, 10})
    (hrow1 : row 1 = {0, 2, 6, 8})
    (hrow4 : row 4 = {0, 1, 3, 5})
    (hrow5 : row 5 = {0, 4, 6, 7})
    (hrow6 : row 6 = {2, 3, 4, 10})
    (hrow7 : row 7 = {3, 4, 6, 8})
    (hrow8 : row 8 = {1, 3, 6, 9})
    (hrow9 : row 9 = {1, 2, 5, 6}) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
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
  let coreB : Census554.ConvexFivePointCore.Core row :=
    { a := 1
      x := 4
      b := 5
      c := 0
      y := 9
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 4 1 5 (by simp [hrow4]) (by simp [hrow4])
      ya_yb := EdgeClosure.row 9 1 5 (by simp [hrow9]) (by simp [hrow9])
      cb_cx := EdgeClosure.row 0 5 4 (by simp [hrow0]) (by simp [hrow0])
      cb_cy := EdgeClosure.row 0 5 9 (by simp [hrow0]) (by simp [hrow0]) }
  let coreC : Census554.ConvexFivePointCore.Core row :=
    { a := 3
      x := 6
      b := 4
      c := 5
      y := 7
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 6 3 4 (by simp [hrow6]) (by simp [hrow6])
      ya_yb := EdgeClosure.row 7 3 4 (by simp [hrow7]) (by simp [hrow7])
      cb_cx := EdgeClosure.row 5 4 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cy := EdgeClosure.row 5 4 7 (by simp [hrow5]) (by simp [hrow5]) }
  let coreD : Census554.ConvexFivePointCore.Core row :=
    { a := 0
      x := 1
      b := 6
      c := 9
      y := 5
      hab := by decide
      hxy := by decide
      xa_xb := EdgeClosure.row 1 0 6 (by simp [hrow1]) (by simp [hrow1])
      ya_yb := EdgeClosure.row 5 0 6 (by simp [hrow5]) (by simp [hrow5])
      cb_cx := EdgeClosure.row 9 6 1 (by simp [hrow9]) (by simp [hrow9])
      cb_cy := EdgeClosure.row 9 6 5 (by simp [hrow9]) (by simp [hrow9]) }
  rcases order.commonOrientationCoverage_orderedCut_5406 hforced with hA | hB | hC | hD
  · apply order.false_of_convexFivePointCore hreal coreA
    exact hA
  · apply order.false_of_convexFivePointCore hreal coreB
    exact hB
  · apply order.false_of_convexFivePointCore hreal coreC
    exact hC
  · apply order.false_of_convexFivePointCore hreal coreD
    exact hD

set_option maxHeartbeats 1000000 in
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
