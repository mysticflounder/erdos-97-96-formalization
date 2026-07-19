/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderBridge
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Exact uniform-producer boundary

This file proves the source-independent adapter from one ordered occurrence of
the five-role front schema to `ShellMetricCoreAlternative`. It deliberately
does not postulate that every arbitrary-cardinality carrier contains such an
occurrence; that remaining coverage statement is the mathematical frontier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace UniformLiveMetricCoreProducer

open Census554.EqualityCore
open Census554.GeneralCarrierBridge

/-- One ordered occurrence of the front-before-isosceles schema. -/
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

/-- An ordered front-schema occurrence is exactly the final shell-aware core
alternative. This is uniform in the carrier cardinality. -/
theorem shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding
    {A : Finset ℝ²} (hA : ConvexIndep A)
    (rows : FaithfulCarrierPattern A) (H : CriticalShellSystem A)
    {boundary : Fin A.card → ℝ²}
    (boundary_injective : Function.Injective boundary)
    (boundary_image : Finset.univ.image boundary = A)
    (boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (schema : OrderedFrontSchemaEmbedding (rowPattern rows) boundary) :
    ShellMetricCoreAlternative rows H := by
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
  have hFZIndex : schema.iF < schema.iZ :=
    schema.f_before_p.trans (schema.p_before_x.trans schema.x_before_z)
  have hFXIndex : schema.iF < schema.iX :=
    schema.f_before_p.trans schema.p_before_x
  have hWFZ :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) < 0 := by
    have harea := hneg_of_ccw boundary_injective boundary_ccw
      schema.w_before_f hFZIndex
    dsimp only [core]
    rwa [← schema.point_w, ← schema.point_f, ← schema.point_z]
  have hFXZ :
      signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) < 0 := by
    have harea := hneg_of_ccw boundary_injective boundary_ccw
      hFXIndex schema.x_before_z
    dsimp only [core]
    rwa [← schema.point_f, ← schema.point_x, ← schema.point_z]
  obtain ⟨q, hqFX, hqPZ⟩ :=
    CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
      hA boundary_injective boundary_image boundary_ccw
      schema.f_before_p schema.p_before_x schema.x_before_z
  unfold ShellMetricCoreAlternative
  repeat' apply Or.inr
  refine ⟨core, hWFZ, hFXZ, q, ?_, ?_⟩
  · simpa only [schema.point_f, schema.point_x] using hqFX
  · simpa only [schema.point_p, schema.point_z] using hqPZ

#print axioms shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding

end UniformLiveMetricCoreProducer
end Problem97
