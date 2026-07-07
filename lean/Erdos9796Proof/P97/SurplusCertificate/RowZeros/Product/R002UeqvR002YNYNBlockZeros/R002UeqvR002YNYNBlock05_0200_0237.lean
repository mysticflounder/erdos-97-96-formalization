/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1007
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.R002UeqvR002YNYNBlock05_0200_0237

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

private theorem rs_R002_ueqv_R002YNYN_generator_05_0200_0237_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_05_0200_0237) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `5:200-237` in product-sum row `R002:u=v:R002YNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R002_ueqv_R002YNYN_block_05_0200_0237_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_05_0200_0237 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_05_0200_0237) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToUnitXDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R002_ueqv_R002YNYN_generator_05_0200_0237_shape
      (by
        exact (
          eval_sqDistToUnitX_zero_of_exactRow_w_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .s1)
          (rightLabel := .Q2)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.q2x) (b_y := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .w) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_w_s1)
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .w) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_w_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_05_0200_0237_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partials_05_0200_0237,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0226_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0227_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0228_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0229_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0230_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0231_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0232_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0233_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0234_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0235_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0236_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_05_0237_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
