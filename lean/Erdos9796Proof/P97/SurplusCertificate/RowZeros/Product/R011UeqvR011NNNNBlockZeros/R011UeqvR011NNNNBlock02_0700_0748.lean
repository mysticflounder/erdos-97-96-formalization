/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2064
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.R011UeqvR011NNNNBlock02_0700_0748

/-!
# Product-sum row block zero for relaxed split surplus certificate R011:u=v:R011NNNN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R011:u=v:R011NNNN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNNN.json`.
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

private theorem rs_R011_ueqv_R011NNNN_generator_02_0700_0748_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_generator_02_0700_0748) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Checked block `2:700-748` in product-sum row `R011:u=v:R011NNNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R011_ueqv_R011NNNN_block_02_0700_0748_eval_zero
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
    (hpidEq : exactRow.pid = "s2_064") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_block_02_0700_0748 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_generator_02_0700_0748) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index)
      rs_R011_ueqv_R011NNNN_generator_02_0700_0748_shape
      (by
        exact (
          eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .u)
          (rightLabel := .Pu)
          (ax := EndpointVar.ux) (ay := EndpointVar.uy) (bx := EndpointVar.pux) (b_y := EndpointVar.puy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_064") (center := .v) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_064_v_u)
          (maskHas_exactRow_of_pid (pid := "s2_064") (center := .v) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_064_v_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_block_02_0700_0748_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partials_02_0700_0748,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0700_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0701_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0702_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0703_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0704_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0705_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0706_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0707_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0708_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0709_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0710_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0711_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0712_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0713_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0714_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0715_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0716_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0717_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0718_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0719_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0720_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0721_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0722_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0723_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0724_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0725_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0726_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0727_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0728_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0729_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0730_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0731_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0732_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0733_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0734_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0735_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0736_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0737_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0738_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0739_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0740_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0741_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0742_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0743_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0744_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0745_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0746_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0747_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_02_0748_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
