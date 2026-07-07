/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2028
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.R009UeqvR009NNNNNBlock30_0500_0511

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009NNNNN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009NNNNN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNNN.json`.
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

private theorem rs_R009_ueqv_R009NNNNN_generator_30_0500_0511_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_generator_30_0500_0511) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `30:500-511` in product-sum row `R009:u=v:R009NNNNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NNNNN_block_30_0500_0511_eval_zero
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
    (hpidEq : exactRow.pid = "s2_028") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_block_30_0500_0511 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_generator_30_0500_0511) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R009_ueqv_R009NNNNN_generator_30_0500_0511_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .Q1)
          (ax := EndpointVar.q2x) (ay := EndpointVar.q2y) (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_028") (center := .Q2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_028_Q2_v)
          (maskHas_exactRow_of_pid (pid := "s2_028") (center := .Q2) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_028_Q2_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_block_30_0500_0511_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partials_30_0500_0511,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0500_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0501_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0502_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0503_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0504_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0505_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0506_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0507_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0508_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0509_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0510_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNNTermShards.rs_R009_ueqv_R009NNNNN_partial_30_0511_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
