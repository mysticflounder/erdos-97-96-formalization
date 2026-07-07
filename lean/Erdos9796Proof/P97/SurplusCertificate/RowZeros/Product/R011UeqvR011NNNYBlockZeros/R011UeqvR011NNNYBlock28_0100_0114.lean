/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2063
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.R011UeqvR011NNNYBlock28_0100_0114

/-!
# Product-sum row block zero for relaxed split surplus certificate R011:u=v:R011NNNY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R011:u=v:R011NNNY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNNY.json`.
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

private theorem rs_R011_ueqv_R011NNNY_generator_28_0100_0114_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_generator_28_0100_0114) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `28:100-114` in product-sum row `R011:u=v:R011NNNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R011_ueqv_R011NNNY_block_28_0100_0114_eval_zero
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
    (hpidEq : exactRow.pid = "s2_063") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_28_0100_0114 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_generator_28_0100_0114) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R011_ueqv_R011NNNY_generator_28_0100_0114_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .s1)
          (cx := EndpointVar.s1x) (cy := EndpointVar.s1y) (ax := EndpointVar.q2x) (ay := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_063") (center := .Q2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_063_Q2_w)
          (maskHas_exactRow_of_pid (pid := "s2_063") (center := .Q2) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_063_Q2_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_block_28_0100_0114_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partials_28_0100_0114,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0109_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0110_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0111_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0112_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0113_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011NNNYTermShards.rs_R011_ueqv_R011NNNY_partial_28_0114_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
