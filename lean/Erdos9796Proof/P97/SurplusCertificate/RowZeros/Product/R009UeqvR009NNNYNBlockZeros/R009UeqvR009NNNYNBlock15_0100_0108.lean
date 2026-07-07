/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2029
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.R009UeqvR009NNNYNBlock15_0100_0108

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009NNNYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009NNNYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNYN.json`.
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

private theorem rs_R009_ueqv_R009NNNYN_generator_15_0100_0108_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_generator_15_0100_0108) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `15:100-108` in product-sum row `R009:u=v:R009NNNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NNNYN_block_15_0100_0108_eval_zero
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
    (hpidEq : exactRow.pid = "s2_029") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_block_15_0100_0108 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_generator_15_0100_0108) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R009_ueqv_R009NNNYN_generator_15_0100_0108_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s2)
          (leftLabel := .s1)
          (rightLabel := .Q2)
          (cx := EndpointVar.s2x) (cy := EndpointVar.s2y) (ax := EndpointVar.s1x) (ay := EndpointVar.s1y)
          (bx := EndpointVar.q2x) (b_y := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_029") (center := .s2) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_029_s2_s1)
          (maskHas_exactRow_of_pid (pid := "s2_029") (center := .s2) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_029_s2_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_block_15_0100_0108_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partials_15_0100_0108,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNYNTermShards.rs_R009_ueqv_R009NNNYN_partial_15_0108_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
