/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate

/-!
# v18 source-heavy common-five anchor

The mined memberships have the source-role shape
`0 ⊇ {2,b}`, `y ⊇ {2,b}`, and `c ⊇ {b,0,y}`.  The role domain is
`b ∈ {3,4,5}`, `c ∈ {6,7,8,9}`, and `y ∈ {10,11}`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open ExactTwelveCarrierIngress

private theorem commonFiveOrientation_v18SourceHeavy
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf)
    {b c y : Label}
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels) :
    CommonFiveOrientationAt order.position 2 0 b c y := by
  rcases order.blocks with hdirect | hmirror
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h2 := hdirect.apex_order
    have hb' := hdirect.surplus_between b hb
    have hc' := hdirect.secondOpposite_between c hc
    have hy' := hdirect.firstOpposite_after y hy
    omega
  · unfold CommonFiveOrientationAt CyclicTripleAt FrozenBoundaryOrder.position
    have h2 := hmirror.apex_order
    have hb' := hmirror.surplus_between b hb
    have hc' := hmirror.secondOpposite_after c hc
    have hy' := hmirror.firstOpposite_between y hy
    omega

/-- The 24-role v18 source-heavy memberships force a common-five obstruction
in every frozen boundary order. -/
theorem false_of_v18SourceHeavyCommonFive
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    {b c y : Label}
    (hb : b ∈ surplusInteriorLabels)
    (hc : c ∈ secondOppositeInteriorLabels)
    (hy : y ∈ firstOppositeInteriorLabels)
    (h02 : 2 ∈ row 0) (h0b : b ∈ row 0)
    (hy2 : 2 ∈ row y) (hyb : b ∈ row y)
    (hcb : b ∈ row c) (hc0 : 0 ∈ row c) (hcy : y ∈ row c) : False := by
  have hab : (2 : Label) ≠ b := by
    have hb' := hb
    simp [surplusInteriorLabels] at hb'
    rcases hb' with rfl | rfl | rfl <;> decide
  have hxy : (0 : Label) ≠ y := by
    have hy' := hy
    simp [firstOppositeInteriorLabels] at hy'
    rcases hy' with rfl | rfl <;> decide
  let core : Census554.ConvexFivePointCore.Core row :=
    { a := 2
      x := 0
      b := b
      c := c
      y := y
      hab := hab
      hxy := hxy
      xa_xb := EdgeClosure.row 0 2 b h02 h0b
      ya_yb := EdgeClosure.row y 2 b hy2 hyb
      cb_cx := EdgeClosure.row c b 0 hcb hc0
      cb_cy := EdgeClosure.row c b y hcb hcy }
  exact order.false_of_convexFivePointCore hreal core (by
    dsimp only [core]
    exact commonFiveOrientation_v18SourceHeavy order hb hc hy)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
