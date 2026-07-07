/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.NormalAxisVariables

/-!
# Endpoint metric shadows

This module records the proof-facing metric meaning of an endpoint finite
shadow.  It is the abstraction needed by the row payload-zero bridge: labels in
the same finite selected class are equidistant from that class center.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Metric interpretation of an endpoint finite shadow. -/
structure EndpointMetricShadow
    (pointOf : ShadowBank.Label → ℝ²) (shadow : ShadowBank.Shadow) :
    Prop where
  injective : Function.Injective pointOf
  sameRadius :
    ∀ {center a b : ShadowBank.Label},
      shadow.classHas center a = true →
        shadow.classHas center b = true →
          dist (pointOf center) (pointOf a) =
            dist (pointOf center) (pointOf b)

namespace EndpointMetricShadow

/-- The normal-axis endpoints are distinct in a metric shadow. -/
theorem v_ne_w
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) :
    pointOf .v ≠ pointOf .w := by
  intro hvw
  have hlabels : (.v : ShadowBank.Label) = .w :=
    h.injective hvw
  cases hlabels

/-- Distinct labels denote distinct points in a metric shadow. -/
theorem point_ne
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a b : ShadowBank.Label}
    (hab : a ≠ b) :
    pointOf a ≠ pointOf b := by
  intro hpoints
  exact hab (h.injective hpoints)

/-- Same finite class membership gives equal coordinate squared distances in
the endpoint normal-axis gauge. -/
theorem coordSqDist_eq
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {center a b : ShadowBank.Label}
    (ha : shadow.classHas center a = true)
    (hb : shadow.classHas center b = true) :
    coordSqDist (endpointNormalAxisCoord pointOf center)
        (endpointNormalAxisCoord pointOf a) =
      coordSqDist (endpointNormalAxisCoord pointOf center)
        (endpointNormalAxisCoord pointOf b) := by
  exact endpointNormalAxis_coordSqDist_eq_of_dist_eq (h.v_ne_w)
    (h.sameRadius ha hb)

/-- Same `.v`-class membership gives equal squared norms in the endpoint
normal-axis gauge. -/
theorem sqnorm_coord_eq_of_v
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a b : ShadowBank.Label}
    (ha : shadow.classHas .v a = true) (hb : shadow.classHas .v b = true) :
    (endpointNormalAxisCoord pointOf a 0) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 =
      (endpointNormalAxisCoord pointOf b 0) ^ 2 +
        (endpointNormalAxisCoord pointOf b 1) ^ 2 := by
  exact endpointNormalAxis_sqnorm_coord_eq_of_dist_eq (h.v_ne_w)
    (h.sameRadius ha hb)

/-- Same `.w`-class membership gives equal squared distances from `(1,0)` in
the endpoint normal-axis gauge. -/
theorem unitX_sqdist_coord_eq_of_w
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a b : ShadowBank.Label}
    (ha : shadow.classHas .w a = true) (hb : shadow.classHas .w b = true) :
    (endpointNormalAxisCoord pointOf a 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 =
      (endpointNormalAxisCoord pointOf b 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf b 1) ^ 2 := by
  exact endpointNormalAxis_unitX_sqdist_coord_eq_of_dist_eq (h.v_ne_w)
    (h.sameRadius ha hb)

/-- A point in the `.v` class together with `.w` has unit squared norm in the
endpoint normal-axis gauge. -/
theorem sqnorm_coord_eq_one_of_v_w
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a : ShadowBank.Label}
    (ha : shadow.classHas .v a = true)
    (hw : shadow.classHas .v .w = true) :
    (endpointNormalAxisCoord pointOf a 0) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 = 1 := by
  exact endpointNormalAxis_sqnorm_coord_eq_one_of_dist_eq (h.v_ne_w)
    (h.sameRadius ha hw)

/-- A point in the `.w` class together with `.v` has unit squared distance from
`(1,0)` in the endpoint normal-axis gauge. -/
theorem unitX_sqdist_coord_eq_one_of_w_v
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a : ShadowBank.Label}
    (hv : shadow.classHas .w .v = true)
    (ha : shadow.classHas .w a = true) :
    (endpointNormalAxisCoord pointOf a 0 - 1) ^ 2 +
        (endpointNormalAxisCoord pointOf a 1) ^ 2 = 1 := by
  exact endpointNormalAxis_unitX_sqdist_coord_eq_one_of_dist_eq (h.v_ne_w)
    (h.sameRadius hv ha)

/-- A point whose finite class contains both endpoint anchors has first
normal-axis coordinate `1 / 2`. -/
theorem x_coord_eq_half_of_v_w
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    (h : EndpointMetricShadow pointOf shadow) {a : ShadowBank.Label}
    (hv : shadow.classHas a .v = true)
    (hw : shadow.classHas a .w = true) :
    endpointNormalAxisCoord pointOf a 0 = (1 : ℝ) / 2 := by
  have hdist := EndpointMetricShadow.coordSqDist_eq h hv hw
  dsimp [coordSqDist] at hdist
  rw [endpointNormalAxisCoord_v,
    endpointNormalAxisCoord_w (EndpointMetricShadow.v_ne_w h)] at hdist
  simp at hdist
  ring_nf at hdist ⊢
  linarith

end EndpointMetricShadow

end Variables

end EndpointCertificate

end Problem97
