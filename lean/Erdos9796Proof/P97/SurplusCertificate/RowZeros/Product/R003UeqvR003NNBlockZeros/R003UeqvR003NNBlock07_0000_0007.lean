/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1027
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.R003UeqvR003NNBlock07_0000_0007

/-!
# Product-sum row block zero for relaxed split surplus certificate R003:u=v:R003NN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R003:u=v:R003NN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NN.json`.
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

private theorem rs_R003_ueqv_R003NN_generator_07_0000_0007_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_generator_07_0000_0007) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `7:0-7` in product-sum row `R003:u=v:R003NN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003NN_block_07_0000_0007_eval_zero
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
    (hpidEq : exactRow.pid = "s1_027") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_07_0000_0007 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_generator_07_0000_0007) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R003_ueqv_R003NN_generator_07_0000_0007_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .u)
          (memberLabel := .s1)
          (cx := EndpointVar.s1x) (cy := EndpointVar.s1y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_027") (center := .u) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_027_u_w)
          (maskHas_exactRow_of_pid (pid := "s1_027") (center := .u) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_027_u_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_block_07_0000_0007_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partials_07_0000_0007,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NNTermShards.rs_R003_ueqv_R003NN_partial_07_0007_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
