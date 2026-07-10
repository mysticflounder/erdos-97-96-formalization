/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3015
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.R013UeqvR013NNYYBlock17_0100_0109

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013NNYY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013NNYY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNYY.json`.
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

private theorem rs_R013_ueqv_R013NNYY_generator_17_0100_0109_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_generator_17_0100_0109) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Checked block `17:100-109` in product-sum row `R013:u=v:R013NNYY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013NNYY_block_17_0100_0109_eval_zero
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
    (hpidEq : exactRow.pid = "s3_015") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_block_17_0100_0109 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_generator_17_0100_0109) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.s2x.index EndpointVar.s2y.index)
      rs_R013_ueqv_R013NNYY_generator_17_0100_0109_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (memberLabel := .s2)
          (ax := EndpointVar.s3x) (ay := EndpointVar.s3y) (bx := EndpointVar.s2x) (b_y := EndpointVar.s2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_015") (center := .s3) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_015_s3_v)
          (maskHas_exactRow_of_pid (pid := "s3_015") (center := .s3) (label := .s2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_015_s3_s2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_block_17_0100_0109_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partials_17_0100_0109,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_17_0109_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
