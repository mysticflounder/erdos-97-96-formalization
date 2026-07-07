/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3019
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlock11_0000_0011

/-!
# Product-sum row block zero for relaxed split surplus certificate R014:u=v:R014YY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R014:u=v:R014YY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YY.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

private theorem rs_R014_ueqv_R014YY_generator_11_0000_0011_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_11_0000_0011) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Checked block `11:0-11` in product-sum row `R014:u=v:R014YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R014_ueqv_R014YY_block_11_0000_0011_eval_zero
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpidEq : exactRow.pid = "s3_019") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_11_0000_0011 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_11_0000_0011) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index)
      rs_R014_ueqv_R014YY_generator_11_0000_0011_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (memberLabel := .s3)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_s1_v)
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .s1) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_s1_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_11_0000_0011_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partials_11_0000_0011,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_11_0011_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
