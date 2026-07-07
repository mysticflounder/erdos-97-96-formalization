/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2067
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.R010UeqvR010YYBlock27_0100_0120

/-!
# Product-sum row block zero for relaxed split surplus certificate R010:u=v:R010YY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R010:u=v:R010YY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YY.json`.
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

private theorem rs_R010_ueqv_R010YY_generator_27_0100_0120_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_generator_27_0100_0120) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `27:100-120` in product-sum row `R010:u=v:R010YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R010_ueqv_R010YY_block_27_0100_0120_eval_zero
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
    (hpidEq : exactRow.pid = "s2_067") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_27_0100_0120 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_generator_27_0100_0120) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R010_ueqv_R010YY_generator_27_0100_0120_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q1)
          (memberLabel := .Q2)
          (ax := EndpointVar.q1x) (ay := EndpointVar.q1y) (bx := EndpointVar.q2x) (b_y := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_067") (center := .Q1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_067_Q1_v)
          (maskHas_exactRow_of_pid (pid := "s2_067") (center := .Q1) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_067_Q1_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_block_27_0100_0120_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partials_27_0100_0120,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0109_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0110_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0111_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0112_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0113_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0114_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0115_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0116_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0117_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0118_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0119_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YYTermShards.rs_R010_ueqv_R010YY_partial_27_0120_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
