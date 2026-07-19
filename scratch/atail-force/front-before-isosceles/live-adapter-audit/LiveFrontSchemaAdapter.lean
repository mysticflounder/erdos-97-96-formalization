/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderBridge
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Live whole-carrier adapter for the front-before-isosceles schema

This scratch file packages the exact source-facing antecedent of the compact
five-role schema.  It deliberately consumes the production geometric core and
CCW boundary bridge rather than reproving either one.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace WholeCarrierFrontSchemaAdapterAudit

open Census554.EqualityCore
open Census554.GeneralCarrierBridge

/-- One occurrence of the transported five-role schema in a complete CCW
carrier row system.  The semantic role order is `W,F,P,X,Z`; the five row
memberships are `W-F`, `W-X`, `W-Z`, `Z-P`, and `Z-X`. -/
structure OrderedFrontSchemaEmbedding
    {A : Finset ℝ²} (R : RowPattern (CarrierLabel A))
    (boundary : Fin A.card → ℝ²) where
  w : CarrierLabel A
  f : CarrierLabel A
  p : CarrierLabel A
  x : CarrierLabel A
  z : CarrierLabel A
  iw : Fin A.card
  iF : Fin A.card
  iP : Fin A.card
  iX : Fin A.card
  iZ : Fin A.card
  point_w : boundary iw = pointOf w
  point_f : boundary iF = pointOf f
  point_p : boundary iP = pointOf p
  point_x : boundary iX = pointOf x
  point_z : boundary iZ = pointOf z
  w_before_f : iw < iF
  f_before_p : iF < iP
  p_before_x : iP < iX
  x_before_z : iX < iZ
  f_mem_w : f ∈ R w
  x_mem_w : x ∈ R w
  z_mem_w : z ∈ R w
  p_mem_z : p ∈ R z
  x_mem_z : x ∈ R z

/-- A realized whole-carrier row system is contradictory as soon as it
contains one ordered occurrence of the compact front-before-isosceles schema.

This is the narrow adapter used by the outer schema semantics.  In the live
surface, instantiate `rows` with `W.rows` and `boundary` with
`W.indexing.boundary`; every remaining hypothesis is already a field of that
surface or of the schema embedding. -/
theorem false_of_orderedFrontSchemaEmbedding
    {A : Finset ℝ²} (hA : ConvexIndep A)
    (rows : FaithfulCarrierPattern A)
    {boundary : Fin A.card → ℝ²}
    (boundary_injective : Function.Injective boundary)
    (boundary_image : Finset.univ.image boundary = A)
    (boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (schema : OrderedFrontSchemaEmbedding (rowPattern rows) boundary) :
    False := by
  have hfz : schema.f ≠ schema.z := by
    intro h
    have hindices : schema.iF = schema.iZ := by
      apply boundary_injective
      rw [schema.point_f, schema.point_z, h]
    exact (ne_of_lt
      (schema.f_before_p.trans (schema.p_before_x.trans schema.x_before_z))) hindices
  have hpx : schema.p ≠ schema.x := by
    intro h
    have hindices : schema.iP = schema.iX := by
      apply boundary_injective
      rw [schema.point_p, schema.point_x, h]
    exact (ne_of_lt schema.p_before_x) hindices
  have hxz : schema.x ≠ schema.z := by
    intro h
    have hindices : schema.iX = schema.iZ := by
      apply boundary_injective
      rw [schema.point_x, schema.point_z, h]
    exact (ne_of_lt schema.x_before_z) hindices
  let core : Census554.FivePointCircleIsoscelesOrderCore.Core (rowPattern rows) := {
    W := schema.w
    F := schema.f
    P := schema.p
    X := schema.x
    Z := schema.z
    hFZ := hfz
    hPX := hpx
    hXZ := hxz
    WF_WX := EdgeClosure.row schema.w schema.f schema.x
      schema.f_mem_w schema.x_mem_w
    WF_WZ := EdgeClosure.row schema.w schema.f schema.z
      schema.f_mem_w schema.z_mem_w
    PZ_XZ := (EdgeClosure.flip schema.p schema.z).trans
      ((EdgeClosure.row schema.z schema.p schema.x
        schema.p_mem_z schema.x_mem_z).trans
        (EdgeClosure.flip schema.z schema.x)) }
  apply Census554.FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw
    (realizes rows) core hA boundary_injective boundary_image boundary_ccw
    schema.point_w schema.point_f schema.point_p schema.point_x schema.point_z
    schema.w_before_f schema.f_before_p schema.p_before_x schema.x_before_z

/-- The exact reflection-canonical representation stored by the outer schema
bank.  For increasing boundary roles `v0,...,v4`, its memberships are
`v0-v1`, `v0-v2`, `v4-v0`, `v4-v1`, and `v4-v3`.

It is the reflection of the human order `W,F,P,X,Z`, under the assignment
`(W,F,P,X,Z) = (v4,v3,v2,v1,v0)`. -/
structure CanonicalFrontSchemaEmbedding
    {A : Finset ℝ²} (R : RowPattern (CarrierLabel A))
    (boundary : Fin A.card → ℝ²) where
  v0 : CarrierLabel A
  v1 : CarrierLabel A
  v2 : CarrierLabel A
  v3 : CarrierLabel A
  v4 : CarrierLabel A
  i0 : Fin A.card
  i1 : Fin A.card
  i2 : Fin A.card
  i3 : Fin A.card
  i4 : Fin A.card
  point0 : boundary i0 = pointOf v0
  point1 : boundary i1 = pointOf v1
  point2 : boundary i2 = pointOf v2
  point3 : boundary i3 = pointOf v3
  point4 : boundary i4 = pointOf v4
  index01 : i0 < i1
  index12 : i1 < i2
  index23 : i2 < i3
  index34 : i3 < i4
  v1_mem_v0 : v1 ∈ R v0
  v2_mem_v0 : v2 ∈ R v0
  v0_mem_v4 : v0 ∈ R v4
  v1_mem_v4 : v1 ∈ R v4
  v3_mem_v4 : v3 ∈ R v4

/-- The reflection-canonical outer-bank schema is contradictory on any live
whole-carrier CCW boundary.  This theorem is the exact Lean consumer of the
stored five-role schema, without an implicit orientation convention. -/
theorem false_of_canonicalFrontSchemaEmbedding
    {A : Finset ℝ²} (hA : ConvexIndep A)
    (rows : FaithfulCarrierPattern A)
    {boundary : Fin A.card → ℝ²}
    (boundary_injective : Function.Injective boundary)
    (boundary_image : Finset.univ.image boundary = A)
    (boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (schema : CanonicalFrontSchemaEmbedding (rowPattern rows) boundary) :
    False := by
  have hv30 : schema.v3 ≠ schema.v0 := by
    intro h
    have hindices : schema.i3 = schema.i0 := by
      apply boundary_injective
      rw [schema.point3, schema.point0, h]
    exact (ne_of_lt
      (schema.index01.trans (schema.index12.trans schema.index23))) hindices.symm
  have hv21 : schema.v2 ≠ schema.v1 := by
    intro h
    have hindices : schema.i2 = schema.i1 := by
      apply boundary_injective
      rw [schema.point2, schema.point1, h]
    exact (ne_of_lt schema.index12) hindices.symm
  have hv10 : schema.v1 ≠ schema.v0 := by
    intro h
    have hindices : schema.i1 = schema.i0 := by
      apply boundary_injective
      rw [schema.point1, schema.point0, h]
    exact (ne_of_lt schema.index01) hindices.symm
  let core : Census554.FivePointCircleIsoscelesOrderCore.Core (rowPattern rows) := {
    W := schema.v4
    F := schema.v3
    P := schema.v2
    X := schema.v1
    Z := schema.v0
    hFZ := hv30
    hPX := hv21
    hXZ := hv10
    WF_WX := EdgeClosure.row schema.v4 schema.v3 schema.v1
      schema.v3_mem_v4 schema.v1_mem_v4
    WF_WZ := EdgeClosure.row schema.v4 schema.v3 schema.v0
      schema.v3_mem_v4 schema.v0_mem_v4
    PZ_XZ := (EdgeClosure.flip schema.v2 schema.v0).trans
      ((EdgeClosure.row schema.v0 schema.v2 schema.v1
        schema.v2_mem_v0 schema.v1_mem_v0).trans
        (EdgeClosure.flip schema.v0 schema.v1)) }
  have h034 : schema.i0 < schema.i3 :=
    schema.index01.trans (schema.index12.trans schema.index23)
  have h013 : schema.i1 < schema.i3 :=
    schema.index12.trans schema.index23
  have h034Area :
      signedArea2 (boundary schema.i0) (boundary schema.i3) (boundary schema.i4) < 0 :=
    hneg_of_ccw boundary_injective boundary_ccw h034 schema.index34
  have hWFZ :
      0 < signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) := by
    have hsign :
        signedArea2 (boundary schema.i4) (boundary schema.i3) (boundary schema.i0) =
          -signedArea2 (boundary schema.i0) (boundary schema.i3) (boundary schema.i4) := by
      simp only [signedArea2]
      ring
    dsimp only [core]
    rw [← schema.point4, ← schema.point3, ← schema.point0, hsign]
    linarith
  have h013Area :
      signedArea2 (boundary schema.i0) (boundary schema.i1) (boundary schema.i3) < 0 :=
    hneg_of_ccw boundary_injective boundary_ccw schema.index01 h013
  have hXFZ :
      signedArea2 (pointOf core.X) (pointOf core.F) (pointOf core.Z) < 0 := by
    have hrotate :
        signedArea2 (boundary schema.i1) (boundary schema.i3) (boundary schema.i0) =
          signedArea2 (boundary schema.i0) (boundary schema.i1) (boundary schema.i3) := by
      simp only [signedArea2]
      ring
    dsimp only [core]
    rw [← schema.point1, ← schema.point3, ← schema.point0, hrotate]
    exact h013Area
  obtain ⟨q, hq02, hq13⟩ :=
    CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
      hA boundary_injective boundary_image boundary_ccw
      schema.index01 schema.index12 schema.index23
  apply Census554.FivePointCircleIsoscelesOrderCore.false_of_core
    (realizes rows) core
  · exact mul_neg_of_pos_of_neg hWFZ hXFZ
  · refine ⟨q, ?_, ?_⟩
    · dsimp only [core]
      rw [← schema.point3, ← schema.point1, openSegment_symm]
      exact hq13
    · dsimp only [core]
      rw [← schema.point2, ← schema.point0, openSegment_symm]
      exact hq02

#print axioms false_of_orderedFrontSchemaEmbedding
#print axioms false_of_canonicalFrontSchemaEmbedding

end WholeCarrierFrontSchemaAdapterAudit
end Problem97
