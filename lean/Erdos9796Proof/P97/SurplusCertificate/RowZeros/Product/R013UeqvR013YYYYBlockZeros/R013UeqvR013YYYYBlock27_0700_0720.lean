/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3004
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.R013UeqvR013YYYYBlock27_0700_0720

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013YYYY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013YYYY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYYY.json`.
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

private theorem rs_R013_ueqv_R013YYYY_generator_27_0700_0720_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_generator_27_0700_0720) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `27:700-720` in product-sum row `R013:u=v:R013YYYY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YYYY_block_27_0700_0720_eval_zero
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
    (hpidEq : exactRow.pid = "s3_004") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0700_0720 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_generator_27_0700_0720) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R013_ueqv_R013YYYY_generator_27_0700_0720_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q1)
          (leftLabel := .u)
          (rightLabel := .Q2)
          (cx := EndpointVar.q1x) (cy := EndpointVar.q1y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.q2x) (b_y := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_004") (center := .Q1) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_004_Q1_u)
          (maskHas_exactRow_of_pid (pid := "s3_004") (center := .Q1) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_004_Q1_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_block_27_0700_0720_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partials_27_0700_0720,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0700_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0701_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0702_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0703_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0704_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0705_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0706_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0707_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0708_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0709_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0710_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0711_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0712_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0713_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0714_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0715_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0716_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0717_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0718_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0719_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYYTermShards.rs_R013_ueqv_R013YYYY_partial_27_0720_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
