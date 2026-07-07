/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2064
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.R011UeqvR011NNNNBlock24_0200_0215

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

private theorem rs_R011_ueqv_R011NNNN_generator_24_0200_0215_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_generator_24_0200_0215) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `24:200-215` in product-sum row `R011:u=v:R011NNNN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R011_ueqv_R011NNNN_block_24_0200_0215_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_block_24_0200_0215 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_generator_24_0200_0215) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R011_ueqv_R011NNNN_generator_24_0200_0215_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Pu)
          (leftLabel := .u)
          (rightLabel := .Q1)
          (cx := EndpointVar.pux) (cy := EndpointVar.puy) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_064") (center := .Pu) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_064_Pu_u)
          (maskHas_exactRow_of_pid (pid := "s2_064") (center := .Pu) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_064_Pu_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_block_24_0200_0215_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partials_24_0200_0215,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNNTermShards.rs_R011_ueqv_R011NNNN_partial_24_0215_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
