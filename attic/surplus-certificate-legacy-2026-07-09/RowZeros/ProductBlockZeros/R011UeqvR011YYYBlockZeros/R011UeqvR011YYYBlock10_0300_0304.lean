/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2054
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.R011UeqvR011YYYBlock10_0300_0304

/-!
# Product-sum row block zero for relaxed split surplus certificate R011:u=v:R011YYY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R011:u=v:R011YYY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YYY.json`.
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

private theorem rs_R011_ueqv_R011YYY_generator_10_0300_0304_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_generator_10_0300_0304) =
      normalizePoly (twiceVarMinusOnePoly EndpointVar.s1x.index) := by
  native_decide

/-- Checked block `10:300-304` in product-sum row `R011:u=v:R011YYY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R011_ueqv_R011YYY_block_10_0300_0304_eval_zero
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
    (hpidEq : exactRow.pid = "s2_054") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0300_0304 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_generator_10_0300_0304) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := twiceVarMinusOnePoly EndpointVar.s1x.index)
      rs_R011_ueqv_R011YYY_generator_10_0300_0304_shape
      (by
        exact (
          eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (ax := EndpointVar.s1x)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_054") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_054_s1_v)
          (maskHas_exactRow_of_pid (pid := "s2_054") (center := .s1) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_054_s1_w)
          (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_10_0300_0304_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partials_10_0300_0304,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_10_0300_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_10_0301_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_10_0302_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_10_0303_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_10_0304_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
