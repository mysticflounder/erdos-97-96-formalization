/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1014
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.R005UeqvR005YNYBlock00_0000_0032

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

private theorem rs_R005_ueqv_R005YNY_generator_00_0000_0032_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_00_0000_0032) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Checked block `0:0-32` in product-sum row `R005:u=v:R005YNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R005_ueqv_R005YNY_block_00_0000_0032_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_00_0000_0032 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_00_0000_0032) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index)
      rs_R005_ueqv_R005YNY_generator_00_0000_0032_shape
      (by
        exact (
          eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .u)
          (rightLabel := .s1)
          (ax := EndpointVar.ux) (ay := EndpointVar.uy) (bx := EndpointVar.s1x) (b_y := EndpointVar.s1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .v) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_v_u)
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .v) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_v_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_00_0000_0032_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partials_00_0000_0032,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0027_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0028_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0029_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0030_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0031_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_00_0032_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
