/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3019
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlock16_0300_0311

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

private theorem rs_R014_ueqv_R014YY_generator_16_0300_0311_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_16_0300_0311) =
      normalizePoly (twiceVarMinusOnePoly EndpointVar.s3x.index) := by
  native_decide

/-- Checked block `16:300-311` in product-sum row `R014:u=v:R014YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R014_ueqv_R014YY_block_16_0300_0311_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0300_0311 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_16_0300_0311) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := twiceVarMinusOnePoly EndpointVar.s3x.index)
      rs_R014_ueqv_R014YY_generator_16_0300_0311_shape
      (by
        exact (
          eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (ax := EndpointVar.s3x)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .s3) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_s3_v)
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .s3) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_s3_w)
          (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_16_0300_0311_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partials_16_0300_0311,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0300_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0301_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0302_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0303_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0304_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0305_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0306_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0307_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0308_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0309_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0310_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_16_0311_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
