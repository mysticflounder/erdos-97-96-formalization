/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1024
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.R003UeqvR003YYBlock02_0000_0099

/-!
# Product-sum row block zero for relaxed split surplus certificate R003:u=v:R003YY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R003:u=v:R003YY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YY.json`.
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

private theorem rs_R003_ueqv_R003YY_generator_02_0000_0099_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_generator_02_0000_0099) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Checked block `2:0-99` in product-sum row `R003:u=v:R003YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003YY_block_02_0000_0099_eval_zero
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
    (hpidEq : exactRow.pid = "s1_024") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_block_02_0000_0099 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_generator_02_0000_0099) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index)
      rs_R003_ueqv_R003YY_generator_02_0000_0099_shape
      (by
        exact (
          eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .u)
          (rightLabel := .Pu)
          (ax := EndpointVar.ux) (ay := EndpointVar.uy) (bx := EndpointVar.pux) (b_y := EndpointVar.puy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_024") (center := .v) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_024_v_u)
          (maskHas_exactRow_of_pid (pid := "s1_024") (center := .v) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_024_v_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_block_02_0000_0099_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partials_02_0000_0099,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0027_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0028_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0029_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0030_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0031_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0032_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0033_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0034_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0035_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0036_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0037_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0038_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0039_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0040_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0041_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0042_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0043_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0044_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0045_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0046_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0047_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0048_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0049_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0050_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0051_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0052_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0053_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0054_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0055_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0056_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0057_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0058_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0059_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0060_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0061_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0062_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0063_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0064_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0065_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0066_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0067_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0068_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0069_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0070_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0071_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0072_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0073_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0074_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0075_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0076_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0077_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0078_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0079_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0080_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0081_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0082_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0083_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0084_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0085_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0086_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0087_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0088_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0089_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0090_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0091_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0092_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0093_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0094_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0095_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0096_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0097_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0098_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_02_0099_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
