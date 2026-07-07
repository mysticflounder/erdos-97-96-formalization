/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2046
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.R009UeqvR009YNNNNBlock25_0300_0399

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009YNNNN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009YNNNN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNNN.json`.
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

private theorem rs_R009_ueqv_R009YNNNN_generator_25_0300_0399_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_generator_25_0300_0399) =
      normalizePoly (sqDistMinusSqNormFirstPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `25:300-399` in product-sum row `R009:u=v:R009YNNNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009YNNNN_block_25_0300_0399_eval_zero
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
    (hpidEq : exactRow.pid = "s2_046") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0300_0399 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_generator_25_0300_0399) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistMinusSqNormFirstPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R009_ueqv_R009YNNNN_generator_25_0300_0399_shape
      (by
        exact (
          eval_sqDistVsNorm_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q1)
          (memberLabel := .u)
          (ax := EndpointVar.q1x) (ay := EndpointVar.q1y) (bx := EndpointVar.ux) (b_y := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_046") (center := .Q1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_046_Q1_v)
          (maskHas_exactRow_of_pid (pid := "s2_046") (center := .Q1) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_046_Q1_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_block_25_0300_0399_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partials_25_0300_0399,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0300_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0301_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0302_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0303_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0304_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0305_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0306_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0307_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0308_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0309_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0310_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0311_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0312_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0313_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0314_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0315_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0316_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0317_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0318_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0319_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0320_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0321_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0322_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0323_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0324_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0325_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0326_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0327_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0328_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0329_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0330_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0331_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0332_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0333_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0334_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0335_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0336_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0337_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0338_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0339_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0340_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0341_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0342_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0343_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0344_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0345_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0346_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0347_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0348_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0349_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0350_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0351_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0352_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0353_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0354_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0355_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0356_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0357_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0358_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0359_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0360_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0361_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0362_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0363_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0364_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0365_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0366_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0367_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0368_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0369_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0370_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0371_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0372_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0373_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0374_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0375_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0376_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0377_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0378_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0379_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0380_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0381_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0382_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0383_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0384_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0385_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0386_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0387_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0388_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0389_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0390_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0391_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0392_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0393_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0394_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0395_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0396_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0397_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0398_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNNNTermShards.rs_R009_ueqv_R009YNNNN_partial_25_0399_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
