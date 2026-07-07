/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3007
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.R013UeqvR013YNNNBlock20_0100_0103

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013YNNN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013YNNN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNNN.json`.
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

private theorem rs_R013_ueqv_R013YNNN_generator_20_0100_0103_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_generator_20_0100_0103) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Checked block `20:100-103` in product-sum row `R013:u=v:R013YNNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YNNN_block_20_0100_0103_eval_zero
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
    (hpidEq : exactRow.pid = "s3_007") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_block_20_0100_0103 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_generator_20_0100_0103) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.s3x.index EndpointVar.s3y.index)
      rs_R013_ueqv_R013YNNN_generator_20_0100_0103_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Pw)
          (memberLabel := .s3)
          (ax := EndpointVar.pwx) (ay := EndpointVar.pwy) (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_007") (center := .Pw) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_007_Pw_v)
          (maskHas_exactRow_of_pid (pid := "s3_007") (center := .Pw) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_007_Pw_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_block_20_0100_0103_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_partials_20_0100_0103,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_partial_20_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_partial_20_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_partial_20_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YNNNTermShards.rs_R013_ueqv_R013YNNN_partial_20_0103_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
