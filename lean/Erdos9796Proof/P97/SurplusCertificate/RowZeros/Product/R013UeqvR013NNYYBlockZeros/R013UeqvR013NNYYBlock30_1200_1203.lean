/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3015
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.R013UeqvR013NNYYBlock30_1200_1203

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

private theorem rs_R013_ueqv_R013NNYY_generator_30_1200_1203_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_generator_30_1200_1203) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `30:1200-1203` in product-sum row `R013:u=v:R013NNYY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013NNYY_block_30_1200_1203_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_block_30_1200_1203 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_generator_30_1200_1203) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R013_ueqv_R013NNYY_generator_30_1200_1203_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (leftLabel := .u)
          (rightLabel := .Q1)
          (cx := EndpointVar.q2x) (cy := EndpointVar.q2y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_015") (center := .Q2) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_015_Q2_u)
          (maskHas_exactRow_of_pid (pid := "s3_015") (center := .Q2) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_015_Q2_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_block_30_1200_1203_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partials_30_1200_1203,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_30_1200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_30_1201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_30_1202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NNYYTermShards.rs_R013_ueqv_R013NNYY_partial_30_1203_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
