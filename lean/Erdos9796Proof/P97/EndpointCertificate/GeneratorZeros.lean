/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.MetricShadow
import Erdos9796Proof.P97.EndpointCertificate.NormalAxisVariables
import Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry

/-!
# Endpoint certificate generator zeros

This module records reusable zero-evaluation facts for endpoint certificate
generators after instantiating the endpoint normal-axis assignment.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- The Rabinowitsch slack used by the forced-collapse endpoint rows for the
pair `s1 = s3`. -/
noncomputable def endpointS1S3Slack
    (pointOf : ShadowBank.Label → ℝ²) : ℝ :=
  (((endpointNormalAxisCoord pointOf .s1 0 -
          endpointNormalAxisCoord pointOf .s3 0) ^ 2 +
      (endpointNormalAxisCoord pointOf .s1 1 -
          endpointNormalAxisCoord pointOf .s3 1) ^ 2)⁻¹)

/-- The endpoint normal-axis assignment with the forced-collapse `s1 = s3`
Rabinowitsch slack. -/
noncomputable def endpointS1S3Assignment
    (pointOf : ShadowBank.Label → ℝ²) : Nat → ℝ :=
  endpointNormalAxisAssignment pointOf (endpointS1S3Slack pointOf)

/-- Same finite-class membership at a variable center zeros the corresponding
endpoint squared-distance difference generator. -/
theorem evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {center a b : ShadowBank.Label} {cx cy ax ay bx b_y : EndpointVar}
    (hcx : endpointNormalAxisAssignment pointOf τ cx.index =
      endpointNormalAxisCoord pointOf center 0)
    (hcy : endpointNormalAxisAssignment pointOf τ cy.index =
      endpointNormalAxisCoord pointOf center 1)
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hbx : endpointNormalAxisAssignment pointOf τ bx.index =
      endpointNormalAxisCoord pointOf b 0)
    (hb_y : endpointNormalAxisAssignment pointOf τ b_y.index =
      endpointNormalAxisCoord pointOf b 1)
    (ha : shadow.classHas center a = true)
    (hb : shadow.classHas center b = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistToCenterDiffPoly cx.index cy.index ax.index ay.index bx.index
        b_y.index) = 0 := by
  refine evalPoly_sqDistToCenterDiffPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  have hdist := EndpointMetricShadow.coordSqDist_eq hmetric ha hb
  dsimp [coordSqDist] at hdist
  rw [hcx, hcy, hax, hay, hbx, hb_y]
  calc
    ((endpointNormalAxisCoord pointOf a 0 -
            endpointNormalAxisCoord pointOf center 0) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1 -
            endpointNormalAxisCoord pointOf center 1) ^ 2) =
        ((endpointNormalAxisCoord pointOf center 0 -
              endpointNormalAxisCoord pointOf a 0) ^ 2 +
          (endpointNormalAxisCoord pointOf center 1 -
              endpointNormalAxisCoord pointOf a 1) ^ 2) := by
        ring
    _ = ((endpointNormalAxisCoord pointOf center 0 -
            endpointNormalAxisCoord pointOf b 0) ^ 2 +
          (endpointNormalAxisCoord pointOf center 1 -
            endpointNormalAxisCoord pointOf b 1) ^ 2) := hdist
    _ = ((endpointNormalAxisCoord pointOf b 0 -
            endpointNormalAxisCoord pointOf center 0) ^ 2 +
          (endpointNormalAxisCoord pointOf b 1 -
            endpointNormalAxisCoord pointOf center 1) ^ 2) := by
        ring

/-- Same `.v`-class membership zeros the corresponding endpoint squared-norm
difference generator. -/
theorem evalPoly_endpoint_sqNormDiffPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a b : ShadowBank.Label} {ax ay bx b_y : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hbx : endpointNormalAxisAssignment pointOf τ bx.index =
      endpointNormalAxisCoord pointOf b 0)
    (hb_y : endpointNormalAxisAssignment pointOf τ b_y.index =
      endpointNormalAxisCoord pointOf b 1)
    (ha : shadow.classHas .v a = true)
    (hb : shadow.classHas .v b = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqNormDiffPoly ax.index ay.index bx.index b_y.index) = 0 := by
  refine evalPoly_sqNormDiffPoly_eq_zero_of_sqNorm_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay, hbx, hb_y]
  exact EndpointMetricShadow.sqnorm_coord_eq_of_v hmetric ha hb

/-- Same `.w`-class membership zeros the corresponding endpoint squared
distance-to-`(1,0)` difference generator. -/
theorem evalPoly_endpoint_sqDistToUnitXDiffPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a b : ShadowBank.Label} {ax ay bx b_y : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hbx : endpointNormalAxisAssignment pointOf τ bx.index =
      endpointNormalAxisCoord pointOf b 0)
    (hb_y : endpointNormalAxisAssignment pointOf τ b_y.index =
      endpointNormalAxisCoord pointOf b 1)
    (ha : shadow.classHas .w a = true)
    (hb : shadow.classHas .w b = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistToUnitXDiffPoly ax.index ay.index bx.index b_y.index) = 0 := by
  refine evalPoly_sqDistToUnitXDiffPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay, hbx, hb_y]
  exact EndpointMetricShadow.unitX_sqdist_coord_eq_of_w hmetric ha hb

/-- Membership in the `.v` class with `.w` zeros the corresponding endpoint
unit squared-norm generator. -/
theorem evalPoly_endpoint_sqNormMinusOnePoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a : ShadowBank.Label} {ax ay : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (ha : shadow.classHas .v a = true)
    (hw : shadow.classHas .v .w = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqNormMinusOnePoly ax.index ay.index) = 0 := by
  refine evalPoly_sqNormMinusOnePoly_eq_zero_of_sqNorm_eq_one
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay]
  exact EndpointMetricShadow.sqnorm_coord_eq_one_of_v_w hmetric ha hw

/-- Membership in the `.v` class with `.w` zeros the opposite-orientation
endpoint unit squared-norm generator. -/
theorem evalPoly_endpoint_oneMinusSqNormPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a : ShadowBank.Label} {ax ay : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (ha : shadow.classHas .v a = true)
    (hw : shadow.classHas .v .w = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (oneMinusSqNormPoly ax.index ay.index) = 0 := by
  refine evalPoly_oneMinusSqNormPoly_eq_zero_of_sqNorm_eq_one
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay]
  exact EndpointMetricShadow.sqnorm_coord_eq_one_of_v_w hmetric ha hw

/-- Membership in the `.w` class with `.v` zeros the corresponding endpoint
unit squared-distance-to-`(1,0)` generator. -/
theorem evalPoly_endpoint_sqDistToUnitXMinusOnePoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a : ShadowBank.Label} {ax ay : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hv : shadow.classHas .w .v = true)
    (ha : shadow.classHas .w a = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistToUnitXMinusOnePoly ax.index ay.index) = 0 := by
  refine evalPoly_sqDistToUnitXMinusOnePoly_eq_zero_of_sqDist_eq_one
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay]
  exact EndpointMetricShadow.unitX_sqdist_coord_eq_one_of_w_v hmetric hv ha

/-- Membership in the `.w` class with `.v` zeros the opposite-orientation
endpoint unit squared-distance-to-`(1,0)` generator. -/
theorem evalPoly_endpoint_oneMinusSqDistToUnitXPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a : ShadowBank.Label} {ax ay : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hv : shadow.classHas .w .v = true)
    (ha : shadow.classHas .w a = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (oneMinusSqDistToUnitXPoly ax.index ay.index) = 0 := by
  refine evalPoly_oneMinusSqDistToUnitXPoly_eq_zero_of_sqDist_eq_one
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax, hay]
  exact EndpointMetricShadow.unitX_sqdist_coord_eq_one_of_w_v hmetric hv ha

/-- Same finite-class membership comparing `.v` with a variable witness zeros
the corresponding endpoint mixed squared-distance generator. -/
theorem evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a b : ShadowBank.Label} {ax ay bx b_y : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hbx : endpointNormalAxisAssignment pointOf τ bx.index =
      endpointNormalAxisCoord pointOf b 0)
    (hb_y : endpointNormalAxisAssignment pointOf τ b_y.index =
      endpointNormalAxisCoord pointOf b 1)
    (hv : shadow.classHas a .v = true)
    (hb : shadow.classHas a b = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqNormFirstMinusSqDistPoly ax.index ay.index bx.index b_y.index) =
        0 := by
  refine evalPoly_sqNormFirstMinusSqDistPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  have hdist := EndpointMetricShadow.coordSqDist_eq hmetric hv hb
  dsimp [coordSqDist] at hdist
  rw [hax, hay, hbx, hb_y]
  calc
    (endpointNormalAxisCoord pointOf a 0 ^ 2 +
        endpointNormalAxisCoord pointOf a 1 ^ 2) =
        ((endpointNormalAxisCoord pointOf a 0 -
              endpointNormalAxisCoord pointOf .v 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
              endpointNormalAxisCoord pointOf .v 1) ^ 2) := by
        simp
    _ = ((endpointNormalAxisCoord pointOf a 0 -
            endpointNormalAxisCoord pointOf b 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
            endpointNormalAxisCoord pointOf b 1) ^ 2) := hdist
    _ = ((endpointNormalAxisCoord pointOf b 0 -
            endpointNormalAxisCoord pointOf a 0) ^ 2 +
          (endpointNormalAxisCoord pointOf b 1 -
            endpointNormalAxisCoord pointOf a 1) ^ 2) := by
        ring

/-- Same finite-class membership comparing a variable witness with `.v` zeros
the corresponding opposite-orientation endpoint mixed squared-distance
generator. -/
theorem evalPoly_endpoint_sqDistMinusSqNormFirstPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a b : ShadowBank.Label} {ax ay bx b_y : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hbx : endpointNormalAxisAssignment pointOf τ bx.index =
      endpointNormalAxisCoord pointOf b 0)
    (hb_y : endpointNormalAxisAssignment pointOf τ b_y.index =
      endpointNormalAxisCoord pointOf b 1)
    (hb : shadow.classHas a b = true)
    (hv : shadow.classHas a .v = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistMinusSqNormFirstPoly ax.index ay.index bx.index b_y.index) =
        0 := by
  refine evalPoly_sqDistMinusSqNormFirstPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  have hdist := EndpointMetricShadow.coordSqDist_eq hmetric hb hv
  dsimp [coordSqDist] at hdist
  rw [hax, hay, hbx, hb_y]
  calc
    ((endpointNormalAxisCoord pointOf b 0 -
          endpointNormalAxisCoord pointOf a 0) ^ 2 +
        (endpointNormalAxisCoord pointOf b 1 -
          endpointNormalAxisCoord pointOf a 1) ^ 2) =
        ((endpointNormalAxisCoord pointOf a 0 -
              endpointNormalAxisCoord pointOf b 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
              endpointNormalAxisCoord pointOf b 1) ^ 2) := by
        ring
    _ = ((endpointNormalAxisCoord pointOf a 0 -
            endpointNormalAxisCoord pointOf .v 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
            endpointNormalAxisCoord pointOf .v 1) ^ 2) := hdist
    _ = (endpointNormalAxisCoord pointOf a 0 ^ 2 +
          endpointNormalAxisCoord pointOf a 1 ^ 2) := by
        simp

/-- Same finite-class membership comparing a variable center with `.w` zeros
the corresponding endpoint point-to-`(1,0)` difference generator. -/
theorem evalPoly_endpoint_sqDistPointToUnitXDiffPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {center a : ShadowBank.Label} {cx cy ax ay : EndpointVar}
    (hcx : endpointNormalAxisAssignment pointOf τ cx.index =
      endpointNormalAxisCoord pointOf center 0)
    (hcy : endpointNormalAxisAssignment pointOf τ cy.index =
      endpointNormalAxisCoord pointOf center 1)
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hc : shadow.classHas a center = true)
    (hw : shadow.classHas a .w = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistPointToUnitXDiffPoly cx.index cy.index ax.index ay.index) =
        0 := by
  refine evalPoly_sqDistPointToUnitXDiffPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  have hdist := EndpointMetricShadow.coordSqDist_eq hmetric hc hw
  dsimp [coordSqDist] at hdist
  rw [hcx, hcy, hax, hay]
  calc
    ((endpointNormalAxisCoord pointOf center 0 -
          endpointNormalAxisCoord pointOf a 0) ^ 2 +
        (endpointNormalAxisCoord pointOf center 1 -
          endpointNormalAxisCoord pointOf a 1) ^ 2) =
        ((endpointNormalAxisCoord pointOf a 0 -
              endpointNormalAxisCoord pointOf center 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
              endpointNormalAxisCoord pointOf center 1) ^ 2) := by
        ring
    _ = ((endpointNormalAxisCoord pointOf a 0 -
            endpointNormalAxisCoord pointOf .w 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
            endpointNormalAxisCoord pointOf .w 1) ^ 2) := hdist
    _ = ((1 - endpointNormalAxisCoord pointOf a 0) ^ 2 +
          endpointNormalAxisCoord pointOf a 1 ^ 2) := by
        rw [endpointNormalAxisCoord_w
          (EndpointMetricShadow.v_ne_w hmetric)]
        simp
        ring

/-- Same finite-class membership comparing `.w` with a variable center zeros
the corresponding endpoint point-to-center difference generator. -/
theorem
    evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {center a : ShadowBank.Label} {cx cy ax ay : EndpointVar}
    (hcx : endpointNormalAxisAssignment pointOf τ cx.index =
      endpointNormalAxisCoord pointOf center 0)
    (hcy : endpointNormalAxisAssignment pointOf τ cy.index =
      endpointNormalAxisCoord pointOf center 1)
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hay : endpointNormalAxisAssignment pointOf τ ay.index =
      endpointNormalAxisCoord pointOf a 1)
    (hw : shadow.classHas a .w = true)
    (hc : shadow.classHas a center = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistUnitXToPointMinusCenterDistPoly cx.index cy.index ax.index
        ay.index) = 0 := by
  refine evalPoly_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_sqDist_eq
    (endpointNormalAxisAssignment pointOf τ) ?_
  have hdist := EndpointMetricShadow.coordSqDist_eq hmetric hw hc
  dsimp [coordSqDist] at hdist
  rw [hcx, hcy, hax, hay]
  calc
    ((1 - endpointNormalAxisCoord pointOf a 0) ^ 2 +
        endpointNormalAxisCoord pointOf a 1 ^ 2) =
        ((endpointNormalAxisCoord pointOf a 0 -
              endpointNormalAxisCoord pointOf .w 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
              endpointNormalAxisCoord pointOf .w 1) ^ 2) := by
        rw [endpointNormalAxisCoord_w
          (EndpointMetricShadow.v_ne_w hmetric)]
        simp
        ring
    _ = ((endpointNormalAxisCoord pointOf a 0 -
            endpointNormalAxisCoord pointOf center 0) ^ 2 +
          (endpointNormalAxisCoord pointOf a 1 -
            endpointNormalAxisCoord pointOf center 1) ^ 2) := hdist
    _ = ((endpointNormalAxisCoord pointOf center 0 -
            endpointNormalAxisCoord pointOf a 0) ^ 2 +
          (endpointNormalAxisCoord pointOf center 1 -
            endpointNormalAxisCoord pointOf a 1) ^ 2) := by
        ring

/-- Same finite-class membership comparing `.v` and `.w` zeros the endpoint
frame equation generator. -/
theorem evalPoly_endpoint_twiceVarMinusOnePoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    {τ : ℝ}
    {a : ShadowBank.Label} {ax : EndpointVar}
    (hax : endpointNormalAxisAssignment pointOf τ ax.index =
      endpointNormalAxisCoord pointOf a 0)
    (hv : shadow.classHas a .v = true)
    (hw : shadow.classHas a .w = true) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (twiceVarMinusOnePoly ax.index) = 0 := by
  refine evalPoly_twiceVarMinusOnePoly_eq_zero_of_eq_half
    (endpointNormalAxisAssignment pointOf τ) ?_
  rw [hax]
  exact EndpointMetricShadow.x_coord_eq_half_of_v_w hmetric hv hw

/-- The generated `s1 = s3` Rabinowitsch generator evaluates to zero under the
forced-collapse slack assignment. -/
theorem evalPoly_endpointS1S3_rabinowitschSqDistPoly_eq_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w)
    (hs13 : pointOf .s1 ≠ pointOf .s3) :
    evalPoly (endpointS1S3Assignment pointOf)
      (rabinowitschSqDistPoly EndpointVar.tau.index EndpointVar.s1x.index
        EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index) =
      0 := by
  refine evalPoly_rabinowitschSqDistPoly_eq_zero_of_inverse
    (endpointS1S3Assignment pointOf) ?_ ?_
  · simp [endpointS1S3Assignment, endpointS1S3Slack,
      endpointNormalAxisAssignment, EndpointVar.eval]
  · simpa [EndpointVar.index, endpointS1S3Assignment,
      endpointNormalAxisAssignment, EndpointVar.eval] using
      endpointNormalAxis_coord_sqdist_ne_zero hvw hs13

/-- The generated `s1 = s3` Rabinowitsch generator is zero for every endpoint
metric shadow. -/
theorem evalPoly_endpointS1S3_rabinowitschSqDistPoly_eq_zero_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow) :
    evalPoly (endpointS1S3Assignment pointOf)
      (rabinowitschSqDistPoly EndpointVar.tau.index EndpointVar.s1x.index
        EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index) =
      0 := by
  exact evalPoly_endpointS1S3_rabinowitschSqDistPoly_eq_zero
    (EndpointMetricShadow.v_ne_w hmetric)
    (EndpointMetricShadow.point_ne hmetric (by decide))

end Variables

end EndpointCertificate

end Problem97
