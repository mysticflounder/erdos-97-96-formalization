/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2070
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.R010UeqvR010YNNBlock29_0000_0068

/-!
# Product-sum row block zero for relaxed split surplus certificate R010:u=v:R010YNN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R010:u=v:R010YNN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YNN.json`.
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

private theorem rs_R010_ueqv_R010YNN_generator_29_0000_0068_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_generator_29_0000_0068) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Checked block `29:0-68` in product-sum row `R010:u=v:R010YNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R010_ueqv_R010YNN_block_29_0000_0068_eval_zero
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
    (hpidEq : exactRow.pid = "s2_070") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_block_29_0000_0068 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_generator_29_0000_0068) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index)
      rs_R010_ueqv_R010YNN_generator_29_0000_0068_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (leftLabel := .u)
          (rightLabel := .s1)
          (cx := EndpointVar.q2x) (cy := EndpointVar.q2y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.s1x) (b_y := EndpointVar.s1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_070") (center := .Q2) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_070_Q2_u)
          (maskHas_exactRow_of_pid (pid := "s2_070") (center := .Q2) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_070_Q2_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_block_29_0000_0068_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partials_29_0000_0068,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0027_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0028_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0029_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0030_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0031_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0032_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0033_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0034_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0035_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0036_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0037_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0038_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0039_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0040_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0041_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0042_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0043_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0044_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0045_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0046_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0047_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0048_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0049_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0050_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0051_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0052_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0053_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0054_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0055_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0056_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0057_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0058_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0059_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0060_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0061_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0062_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0063_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0064_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0065_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0066_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0067_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010YNNTermShards.rs_R010_ueqv_R010YNN_partial_29_0068_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
