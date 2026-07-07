/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowBank
import Erdos9796Proof.P97.EndpointCertificate.Variables
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Endpoint normal-axis certificate variables

This module packages the normal-axis coordinate assignment used by the
endpoint certificates.  In this gauge the endpoint label `.v` is the origin and
`.w` is `(1,0)`, while the generated variables record the remaining endpoint
labels.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Normal-axis coordinates for an endpoint label, using `.v` as origin and
`.w` as witness. -/
noncomputable def endpointNormalAxisCoord
    (pointOf : ShadowBank.Label → ℝ²) (label : ShadowBank.Label) : ℝ² :=
  normalAxis (pointOf .v) (pointOf .w) (pointOf label)

@[simp] theorem endpointNormalAxisCoord_v
    (pointOf : ShadowBank.Label → ℝ²) :
    endpointNormalAxisCoord pointOf .v = 0 := by
  exact Problem97.normalAxis_self

@[simp] theorem endpointNormalAxisCoord_w
    {pointOf : ShadowBank.Label → ℝ²} (hvw : pointOf .v ≠ pointOf .w) :
    endpointNormalAxisCoord pointOf .w = !₂[(1 : ℝ), 0] := by
  exact Problem97.normalAxis_witness hvw

/-- The endpoint certificate assignment induced by a geometric ten-label
configuration in the `.v`, `.w` normal-axis gauge. -/
noncomputable def endpointNormalAxisAssignment
    (pointOf : ShadowBank.Label → ℝ²) (tau : ℝ) : Nat → ℝ :=
  assignment
    (endpointNormalAxisCoord pointOf .u)
    (endpointNormalAxisCoord pointOf .s1)
    (endpointNormalAxisCoord pointOf .s2)
    (endpointNormalAxisCoord pointOf .s3)
    (endpointNormalAxisCoord pointOf .Pw)
    (endpointNormalAxisCoord pointOf .Pu)
    (endpointNormalAxisCoord pointOf .Q1)
    (endpointNormalAxisCoord pointOf .Q2)
    tau

@[simp] theorem endpointNormalAxisAssignment_index
    (pointOf : ShadowBank.Label → ℝ²) (tau : ℝ) (v : EndpointVar) :
    endpointNormalAxisAssignment pointOf tau v.index =
      v.eval
        (endpointNormalAxisCoord pointOf .u)
        (endpointNormalAxisCoord pointOf .s1)
        (endpointNormalAxisCoord pointOf .s2)
        (endpointNormalAxisCoord pointOf .s3)
        (endpointNormalAxisCoord pointOf .Pw)
        (endpointNormalAxisCoord pointOf .Pu)
        (endpointNormalAxisCoord pointOf .Q1)
        (endpointNormalAxisCoord pointOf .Q2)
        tau := by
  simp [endpointNormalAxisAssignment]

/-- A geometric equal-distance fact becomes equality of endpoint normal-axis
coordinate squared distances. -/
theorem endpointNormalAxis_coordSqDist_eq_of_dist_eq
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w)
    {center member witness : ShadowBank.Label}
    (h :
      dist (pointOf center) (pointOf member) =
        dist (pointOf center) (pointOf witness)) :
    coordSqDist (endpointNormalAxisCoord pointOf center)
        (endpointNormalAxisCoord pointOf member) =
      coordSqDist (endpointNormalAxisCoord pointOf center)
        (endpointNormalAxisCoord pointOf witness) := by
  exact Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hvw h

/-- Equal distances from endpoint label `.v` become equal squared norms in the
endpoint normal-axis gauge. -/
theorem endpointNormalAxis_sqnorm_coord_eq_of_dist_eq
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w)
    {member witness : ShadowBank.Label}
    (h : dist (pointOf .v) (pointOf member) =
      dist (pointOf .v) (pointOf witness)) :
    (endpointNormalAxisCoord pointOf member 0) ^ 2 +
        (endpointNormalAxisCoord pointOf member 1) ^ 2 =
      (endpointNormalAxisCoord pointOf witness 0) ^ 2 +
        (endpointNormalAxisCoord pointOf witness 1) ^ 2 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_of_dist_eq hvw h

/-- Equal distances from endpoint label `.w` become equal squared distances
from `(1,0)` in the endpoint normal-axis gauge. -/
theorem endpointNormalAxis_unitX_sqdist_coord_eq_of_dist_eq
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w)
    {member witness : ShadowBank.Label}
    (h : dist (pointOf .w) (pointOf member) =
      dist (pointOf .w) (pointOf witness)) :
    (endpointNormalAxisCoord pointOf member 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf member 1) ^ 2 =
      (endpointNormalAxisCoord pointOf witness 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf witness 1) ^ 2 := by
  exact Problem97.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hvw h

/-- A point at the `.v`/`.w` gauge radius has squared norm one in endpoint
normal-axis coordinates. -/
theorem endpointNormalAxis_sqnorm_coord_eq_one_of_dist_eq
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w) {a : ShadowBank.Label}
    (h : dist (pointOf .v) (pointOf a) = dist (pointOf .v) (pointOf .w)) :
    (endpointNormalAxisCoord pointOf a 0) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 = 1 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hvw h

/-- A point at the `.w`/`.v` gauge radius has squared distance one from
`(1,0)` in endpoint normal-axis coordinates. -/
theorem endpointNormalAxis_unitX_sqdist_coord_eq_one_of_dist_eq
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w) {a : ShadowBank.Label}
    (h : dist (pointOf .w) (pointOf .v) = dist (pointOf .w) (pointOf a)) :
    (endpointNormalAxisCoord pointOf a 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 = 1 := by
  have hcoord :=
    Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hvw h
  rw [Problem97.normalAxis_witness hvw] at hcoord
  dsimp [coordSqDist, endpointNormalAxisCoord] at hcoord
  calc
    (normalAxis (pointOf .v) (pointOf .w) (pointOf a) 0 - 1) ^ 2 +
        (normalAxis (pointOf .v) (pointOf .w) (pointOf a) 1) ^ 2 =
        (1 - normalAxis (pointOf .v) (pointOf .w) (pointOf a) 0) ^ 2 +
          (0 - normalAxis (pointOf .v) (pointOf .w) (pointOf a) 1) ^ 2 := by
      ring
    _ = 1 := hcoord

/-- Distinct endpoint points have nonzero coordinate squared distance in the
endpoint normal-axis gauge. -/
theorem endpointNormalAxis_coord_sqdist_ne_zero
    {pointOf : ShadowBank.Label → ℝ²}
    (hvw : pointOf .v ≠ pointOf .w) {a b : ShadowBank.Label}
    (hab : pointOf a ≠ pointOf b) :
    (endpointNormalAxisCoord pointOf a 0 -
          endpointNormalAxisCoord pointOf b 0) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1 -
          endpointNormalAxisCoord pointOf b 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_coord_sqdist_ne_zero hvw hab

end Variables

end EndpointCertificate

end Problem97
