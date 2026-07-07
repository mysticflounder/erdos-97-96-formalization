/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1007
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.R002UeqvR002YNYNBlock30_0200_0226

/-!
# Product-sum row block zero for relaxed split surplus certificate R002:u=v:R002YNYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R002:u=v:R002YNYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNYN.json`.
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

private theorem rs_R002_ueqv_R002YNYN_generator_30_0200_0226_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_30_0200_0226) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `30:200-226` in product-sum row `R002:u=v:R002YNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R002_ueqv_R002YNYN_block_30_0200_0226_eval_zero
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
    (hpidEq : exactRow.pid = "s1_007") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_30_0200_0226 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_30_0200_0226) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R002_ueqv_R002YNYN_generator_30_0200_0226_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .Q1)
          (ax := EndpointVar.q2x) (ay := EndpointVar.q2y) (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .Q2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_Q2_v)
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .Q2) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_Q2_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_30_0200_0226_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partials_30_0200_0226,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_30_0226_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
