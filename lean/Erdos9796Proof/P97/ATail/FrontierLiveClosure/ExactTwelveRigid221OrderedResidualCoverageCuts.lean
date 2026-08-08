/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedUniversalThreeRowCuts

/-!
# Residual multi-core ordered cuts for exact-twelve Rigid221

The ordered-v4 records 7808, 8077, and 8556 have no single direct three-row
core valid throughout the relevant frozen order universe.  Each does have a
small arithmetic coverage proof by two direct cores.  This file replays those
three records using only the row-membership facts consumed by the cores.

These are learned-cut consumers.  They neither establish source-exhaustive
finite coverage nor close the live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

private def directThreeRowCore
    {row : RowPattern Label} {a x b c y : Label}
    (hab : a ≠ b) (hxy : x ≠ y)
    (hxa : a ∈ row x) (hxb : b ∈ row x)
    (hya : a ∈ row y) (hyb : b ∈ row y)
    (hcb : b ∈ row c) (hcx : x ∈ row c) (hcy : y ∈ row c) :
    Census554.ConvexFivePointCore.Core row :=
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

private theorem FrozenBoundaryOrder.position_ne_of_ne''
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {left right : Label} (hne : left ≠ right) :
    order.position left ≠ order.position right := by
  intro heq
  exact hne (order.position_injective heq)

private theorem FrozenForcedSecondCapOrder.change_index
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    ((order.index 6).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 9).val) ∨
      ((order.index 9).val < (order.index 8).val ∧
        (order.index 8).val < (order.index 7).val ∧
        (order.index 7).val < (order.index 6).val) := by
  exact hforced

/-- Two-core orientation coverage for ordered-v4 iteration 7808. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_7808
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 8 7 3 0 11 ∨
      CommonFiveOrientationAt order.position 8 7 6 5 1 := by
  have hforced' := FrozenForcedSecondCapOrder.change_index order hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced' with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced' with hforward | hreverse <;> omega

theorem false_of_orderedCut_7808
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (h78 : 8 ∈ row 7) (h73 : 3 ∈ row 7)
    (h118 : 8 ∈ row 11) (h113 : 3 ∈ row 11)
    (h03 : 3 ∈ row 0) (h07 : 7 ∈ row 0) (h011 : 11 ∈ row 0)
    (h76 : 6 ∈ row 7) (h18 : 8 ∈ row 1) (h16 : 6 ∈ row 1)
    (h56 : 6 ∈ row 5) (h57 : 7 ∈ row 5) (h51 : 1 ∈ row 5) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h78 h73 h118 h113 h03 h07 h011
  let coreB : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h78 h76 h18 h16 h56 h57 h51
  rcases order.commonOrientationCoverage_orderedCut_7808 hforced with hA | hB
  · exact order.false_of_convexFivePointCore hreal coreA hA
  · exact order.false_of_convexFivePointCore hreal coreB hB

set_option maxHeartbeats 2000000 in
-- `omega` must enumerate the internal orders of three surplus labels and two
-- second-opposite labels while proving this two-core disjunction.
/-- Two-core orientation coverage for ordered-v4 iteration 8077.  This record
does not need the retained internal order of the second-opposite cap. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_8077
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    CommonFiveOrientationAt order.position 2 6 5 4 9 ∨
      CommonFiveOrientationAt order.position 4 5 2 6 3 := by
  have h34 := order.position_ne_of_ne'' (by decide : (3 : Label) ≠ 4)
  have h35 := order.position_ne_of_ne'' (by decide : (3 : Label) ≠ 5)
  have h45 := order.position_ne_of_ne'' (by decide : (4 : Label) ≠ 5)
  have h69 := order.position_ne_of_ne'' (by decide : (6 : Label) ≠ 9)
  change (order.index 3).val ≠ (order.index 4).val at h34
  change (order.index 3).val ≠ (order.index 5).val at h35
  change (order.index 4).val ≠ (order.index 5).val at h45
  change (order.index 6).val ≠ (order.index 9).val at h69
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h6 := hdirect.secondOpposite_between 6 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h6 := hmirror.secondOpposite_after 6 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    omega

theorem false_of_orderedCut_8077
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (h62 : 2 ∈ row 6) (h65 : 5 ∈ row 6)
    (h92 : 2 ∈ row 9) (h95 : 5 ∈ row 9)
    (h45 : 5 ∈ row 4) (h46 : 6 ∈ row 4) (h49 : 9 ∈ row 4)
    (h54 : 4 ∈ row 5) (h52 : 2 ∈ row 5)
    (h34 : 4 ∈ row 3) (h32 : 2 ∈ row 3)
    (h62' : 2 ∈ row 6) (h65' : 5 ∈ row 6) (h63 : 3 ∈ row 6) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h62 h65 h92 h95 h45 h46 h49
  let coreB : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h54 h52 h34 h32 h62' h65' h63
  rcases order.commonOrientationCoverage_orderedCut_8077 with hA | hB
  · exact order.false_of_convexFivePointCore hreal coreA hA
  · exact order.false_of_convexFivePointCore hreal coreB hB

/-- Two-core orientation coverage for ordered-v4 iteration 8556. -/
theorem FrozenBoundaryOrder.commonOrientationCoverage_orderedCut_8556
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position) :
    CommonFiveOrientationAt order.position 4 10 9 8 3 ∨
      CommonFiveOrientationAt order.position 5 2 11 9 7 := by
  have h34 := order.position_ne_of_ne'' (by decide : (3 : Label) ≠ 4)
  change (order.index 3).val ≠ (order.index 4).val at h34
  have hforced' := FrozenForcedSecondCapOrder.change_index order hforced
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hdirect.apex_order
    have h3 := hdirect.surplus_between 3 (by decide)
    have h4 := hdirect.surplus_between 4 (by decide)
    have h5 := hdirect.surplus_between 5 (by decide)
    have h7 := hdirect.secondOpposite_between 7 (by decide)
    have h8 := hdirect.secondOpposite_between 8 (by decide)
    have h9 := hdirect.secondOpposite_between 9 (by decide)
    have h10 := hdirect.firstOpposite_after 10 (by decide)
    have h11 := hdirect.firstOpposite_after 11 (by decide)
    rcases hforced' with hforward | hreverse <;> omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have hapex := hmirror.apex_order
    have h3 := hmirror.surplus_between 3 (by decide)
    have h4 := hmirror.surplus_between 4 (by decide)
    have h5 := hmirror.surplus_between 5 (by decide)
    have h7 := hmirror.secondOpposite_after 7 (by decide)
    have h8 := hmirror.secondOpposite_after 8 (by decide)
    have h9 := hmirror.secondOpposite_after 9 (by decide)
    have h10 := hmirror.firstOpposite_between 10 (by decide)
    have h11 := hmirror.firstOpposite_between 11 (by decide)
    rcases hforced' with hforward | hreverse <;> omega

theorem false_of_orderedCut_8556
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (h104 : 4 ∈ row 10) (h109 : 9 ∈ row 10)
    (h34 : 4 ∈ row 3) (h39 : 9 ∈ row 3)
    (h89 : 9 ∈ row 8) (h810 : 10 ∈ row 8) (h83 : 3 ∈ row 8)
    (h25 : 5 ∈ row 2) (h211 : 11 ∈ row 2)
    (h75 : 5 ∈ row 7) (h711 : 11 ∈ row 7)
    (h911 : 11 ∈ row 9) (h92 : 2 ∈ row 9) (h97 : 7 ∈ row 9) : False := by
  let coreA : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h104 h109 h34 h39 h89 h810 h83
  let coreB : Census554.ConvexFivePointCore.Core row :=
    directThreeRowCore (by decide) (by decide)
      h25 h211 h75 h711 h911 h92 h97
  rcases order.commonOrientationCoverage_orderedCut_8556 hforced with hA | hB
  · exact order.false_of_convexFivePointCore hreal coreA hA
  · exact order.false_of_convexFivePointCore hreal coreB hB

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
