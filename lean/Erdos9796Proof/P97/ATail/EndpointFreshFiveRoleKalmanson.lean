/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation

/-!
# Five-role Kalmanson consumers for endpoint cross hits

When either `A = J` or `X = C`, the six roles in the endpoint cross-hit
configuration reduce to five.  This module packages the four CCW placements in
each coincidence case that are direct instances of the two existing five-point
Kalmanson consumers.

The placement sums contain only boundary-order data.  The three metric
equalities are derived from the first-apex row, the critical fiber, and the
cross hit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace EndpointFreshFiveRoleKalmanson

open ATailCriticalPairFrontier
open ATailCriticalFiberClosingCore
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open CapCrossingKalmansonBridge

/-- Five named points in one strictly increasing CCW boundary placement. -/
structure CcwFivePointPlacement
    {A : Finset ℝ²} (p0 p1 p2 p3 p4 : ℝ²) : Type where
  boundary : Fin A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  i0 : Fin A.card
  i1 : Fin A.card
  i2 : Fin A.card
  i3 : Fin A.card
  i4 : Fin A.card
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3
  h34 : i3 < i4
  boundary_p0 : boundary i0 = p0
  boundary_p1 : boundary i1 = p1
  boundary_p2 : boundary i2 = p2
  boundary_p3 : boundary i3 = p3
  boundary_p4 : boundary i4 = p4

private theorem false_of_012_124_314
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {p0 p1 p2 p3 p4 : ℝ²}
    (P : CcwFivePointPlacement (A := A) p0 p1 p2 p3 p4)
    (h012 : dist p0 p1 = dist p0 p2)
    (h124 : dist p1 p2 = dist p1 p4)
    (h314 : dist p3 p1 = dist p3 p4) :
    False := by
  exact false_of_five_ccw_three_shell_equalities_012_124_314 hA
    P.boundary_injective P.boundary_image P.boundary_ccw
    P.h01 P.h12 P.h23 P.h34
    (by simpa only [P.boundary_p0, P.boundary_p1, P.boundary_p2] using h012)
    (by simpa only [P.boundary_p1, P.boundary_p2, P.boundary_p4] using h124)
    (by simpa only [P.boundary_p1, P.boundary_p3, P.boundary_p4] using h314)

private theorem false_of_OAYEC
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {pO pA pY pE pC : ℝ²}
    (P : CcwFivePointPlacement (A := A) pO pA pY pE pC)
    (hYO_YE : dist pY pO = dist pY pE)
    (hOE_OC : dist pO pE = dist pO pC)
    (hAC_AO : dist pA pC = dist pA pO) :
    False := by
  exact false_of_five_ccw_three_shell_equalities hA
    P.boundary_injective P.boundary_image P.boundary_ccw
    P.h01 P.h12 P.h23 P.h34
    (by simpa only [P.boundary_p0, P.boundary_p2, P.boundary_p3] using hYO_YE)
    (by simpa only [P.boundary_p0, P.boundary_p3, P.boundary_p4] using hOE_OC)
    (by simpa only [P.boundary_p0, P.boundary_p1, P.boundary_p4] using hAC_AO)

/-- Direct five-point CCW placements when the common endpoint blocker is the
fresh first-apex row source (`A = J`).  Up to cyclic recutting, the constructors
cover `O,A,C,X,K`, `O,C,X,A,K`, `O,X,K,C,A`, and `O,C,K,A,X`. -/
inductive FirstCenterEqFreshSourcePlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type
  | orderOACXK
      (placement : CcwFivePointPlacement (A := D.A)
        S.oppApex1
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        Q.C (H.centerAt Q.J Q.J_mem_A) Q.K)
  | orderXAKOC
      (placement : CcwFivePointPlacement (A := D.A)
        (H.centerAt Q.J Q.J_mem_A)
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        Q.K S.oppApex1 Q.C)
  | orderAOXKC
      (placement : CcwFivePointPlacement (A := D.A)
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        S.oppApex1 (H.centerAt Q.J Q.J_mem_A) Q.K Q.C)
  | orderAXOCK
      (placement : CcwFivePointPlacement (A := D.A)
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        (H.centerAt Q.J Q.J_mem_A) S.oppApex1 Q.C Q.K)

/-- Direct five-point CCW placements when the blocker selected at the fresh
source is the first fiber source (`X = C`).  Up to cyclic recutting, the
constructors cover `O,C,J,A,K`, `O,J,A,C,K`, `O,A,K,J,C`, and `O,J,K,C,A`. -/
inductive SecondCenterEqFirstSourcePlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type
  | orderOCJAK
      (placement : CcwFivePointPlacement (A := D.A) S.oppApex1 Q.C Q.J
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K)
  | orderACKOJ
      (placement : CcwFivePointPlacement (A := D.A)
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        Q.C Q.K S.oppApex1 Q.J)
  | orderCOAKJ
      (placement : CcwFivePointPlacement (A := D.A) Q.C S.oppApex1
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K Q.J)
  | orderCAOJK
      (placement : CcwFivePointPlacement (A := D.A) Q.C
        (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2)
        S.oppApex1 Q.J Q.K)

/-- The `A = J` endpoint cross-hit case is contradictory in each directly
supported five-point CCW placement. -/
theorem false_of_firstCenterEqFreshSource_of_crossHit_of_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hAJ : H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 = Q.J)
    (placement : FirstCenterEqFreshSourcePlacement Q) :
    False := by
  have hOJ_OC : dist S.oppApex1 Q.J = dist S.oppApex1 Q.C :=
    (Q.row.support_eq_radius Q.J Q.J_mem_row).trans
      (Q.row.support_eq_radius Q.C Q.C_mem_row).symm
  have hAC_AK :
      dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.C =
        dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K :=
    Q.fiber_orientation.commonBlocker_equidistant
  have hXJ_XK :
      dist (H.centerAt Q.J Q.J_mem_A) Q.J =
        dist (H.centerAt Q.J Q.J_mem_A) Q.K :=
    ((H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
      Q.J (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.q_mem_support).trans
    ((H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
      Q.K K_mem_J_shell).symm
  have hOA_OC :
      dist S.oppApex1
          (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) =
        dist S.oppApex1 Q.C := by
    simpa only [hAJ] using hOJ_OC
  have hXA_XK :
      dist (H.centerAt Q.J Q.J_mem_A)
          (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) =
        dist (H.centerAt Q.J Q.J_mem_A) Q.K := by
    simpa only [hAJ] using hXJ_XK
  cases placement with
  | orderOACXK P =>
      exact false_of_012_124_314 D.convex P hOA_OC hAC_AK hXA_XK
  | orderXAKOC P =>
      exact false_of_012_124_314 D.convex P hXA_XK hAC_AK.symm hOA_OC
  | orderAOXKC P =>
      exact false_of_OAYEC D.convex P hXA_XK hAC_AK.symm hOA_OC.symm
  | orderAXOCK P =>
      exact false_of_OAYEC D.convex P hOA_OC hAC_AK hXA_XK.symm

/-- The `X = C` endpoint cross-hit case is contradictory in each directly
supported five-point CCW placement. -/
theorem false_of_secondCenterEqFirstSource_of_crossHit_of_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hXC : H.centerAt Q.J Q.J_mem_A = Q.C)
    (placement : SecondCenterEqFirstSourcePlacement Q) :
    False := by
  have hOJ_OC : dist S.oppApex1 Q.J = dist S.oppApex1 Q.C :=
    (Q.row.support_eq_radius Q.J Q.J_mem_row).trans
      (Q.row.support_eq_radius Q.C Q.C_mem_row).symm
  have hAC_AK :
      dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.C =
        dist (H.centerAt E.fiber.source₁.1 E.fiber.source₁.2) Q.K :=
    Q.fiber_orientation.commonBlocker_equidistant
  have hXJ_XK :
      dist (H.centerAt Q.J Q.J_mem_A) Q.J =
        dist (H.centerAt Q.J Q.J_mem_A) Q.K :=
    ((H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
      Q.J (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.q_mem_support).trans
    ((H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
      Q.K K_mem_J_shell).symm
  have hCJ_CK : dist Q.C Q.J = dist Q.C Q.K := by
    simpa only [hXC] using hXJ_XK
  cases placement with
  | orderOCJAK P =>
      exact false_of_012_124_314 D.convex P hOJ_OC.symm hCJ_CK hAC_AK
  | orderACKOJ P =>
      exact false_of_012_124_314 D.convex P hAC_AK hCJ_CK.symm hOJ_OC.symm
  | orderCOAKJ P =>
      exact false_of_OAYEC D.convex P hAC_AK hCJ_CK.symm hOJ_OC
  | orderCAOJK P =>
      exact false_of_OAYEC D.convex P hOJ_OC.symm hCJ_CK hAC_AK.symm

end EndpointFreshFiveRoleKalmanson
end Problem97
