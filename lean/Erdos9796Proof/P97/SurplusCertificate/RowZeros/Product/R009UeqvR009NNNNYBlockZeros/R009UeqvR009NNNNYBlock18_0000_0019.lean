/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2026
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.R009UeqvR009NNNNYBlock18_0000_0019

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009NNNNY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009NNNNY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNNY.json`.
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

private theorem rs_R009_ueqv_R009NNNNY_generator_18_0000_0019_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_generator_18_0000_0019) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Checked block `18:0-19` in product-sum row `R009:u=v:R009NNNNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NNNNY_block_18_0000_0019_eval_zero
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
    (hpidEq : exactRow.pid = "s2_026") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_18_0000_0019 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_generator_18_0000_0019) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.pux.index EndpointVar.puy.index)
      rs_R009_ueqv_R009NNNNY_generator_18_0000_0019_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (memberLabel := .Pu)
          (ax := EndpointVar.s3x) (ay := EndpointVar.s3y) (bx := EndpointVar.pux) (b_y := EndpointVar.puy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_026") (center := .s3) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_026_s3_v)
          (maskHas_exactRow_of_pid (pid := "s2_026") (center := .s3) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_026_s3_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_block_18_0000_0019_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partials_18_0000_0019,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYTermShards.rs_R009_ueqv_R009NNNNY_partial_18_0019_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
