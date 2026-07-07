/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1014
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.R005UeqvR005YNYBlock10_0000_0034

/-!
# Product-sum row block zero for relaxed split surplus certificate R005:u=v:R005YNY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R005:u=v:R005YNY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNY.json`.
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

private theorem rs_R005_ueqv_R005YNY_generator_10_0000_0034_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_10_0000_0034) =
      normalizePoly (sqDistMinusSqNormFirstPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `10:0-34` in product-sum row `R005:u=v:R005YNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R005_ueqv_R005YNY_block_10_0000_0034_eval_zero
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
    (hpidEq : exactRow.pid = "s1_014") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_10_0000_0034 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_10_0000_0034) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistMinusSqNormFirstPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R005_ueqv_R005YNY_generator_10_0000_0034_shape
      (by
        exact (
          eval_sqDistVsNorm_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (memberLabel := .u)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.ux) (b_y := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_s1_v)
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .s1) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_s1_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_10_0000_0034_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partials_10_0000_0034,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0027_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0028_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0029_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0030_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0031_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0032_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0033_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_10_0034_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
