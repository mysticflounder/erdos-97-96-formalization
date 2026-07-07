/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1014
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.R005UeqvR005YNYBlock03_0000_0056

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

private theorem rs_R005_ueqv_R005YNY_generator_03_0000_0056_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_03_0000_0056) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Checked block `3:0-56` in product-sum row `R005:u=v:R005YNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R005_ueqv_R005YNY_block_03_0000_0056_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_03_0000_0056 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_generator_03_0000_0056) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToUnitXDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.pux.index EndpointVar.puy.index)
      rs_R005_ueqv_R005YNY_generator_03_0000_0056_shape
      (by
        exact (
          eval_sqDistToUnitX_zero_of_exactRow_w_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .s1)
          (rightLabel := .Pu)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.pux) (b_y := EndpointVar.puy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .w) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_w_s1)
          (maskHas_exactRow_of_pid (pid := "s1_014") (center := .w) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_014_w_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_block_03_0000_0056_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partials_03_0000_0056,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0027_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0028_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0029_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0030_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0031_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0032_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0033_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0034_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0035_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0036_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0037_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0038_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0039_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0040_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0041_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0042_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0043_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0044_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0045_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0046_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0047_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0048_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0049_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0050_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0051_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0052_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0053_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0054_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0055_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005YNYTermShards.rs_R005_ueqv_R005YNY_partial_03_0056_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
