/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1026
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.R003UeqvR003NYBlock13_0200_0245

/-!
# Product-sum row block zero for relaxed split surplus certificate R003:u=v:R003NY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R003:u=v:R003NY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NY.json`.
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

private theorem rs_R003_ueqv_R003NY_generator_13_0200_0245_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_generator_13_0200_0245) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Checked block `13:200-245` in product-sum row `R003:u=v:R003NY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003NY_block_13_0200_0245_eval_zero
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
    (hpidEq : exactRow.pid = "s1_026") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0200_0245 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_generator_13_0200_0245) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s1x.index EndpointVar.s1y.index)
      rs_R003_ueqv_R003NY_generator_13_0200_0245_shape
      (by
        exact (
          eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s2)
          (memberLabel := .s1)
          (ax := EndpointVar.s2x) (ay := EndpointVar.s2y) (bx := EndpointVar.s1x) (b_y := EndpointVar.s1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_026") (center := .s2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_026_s2_v)
          (maskHas_exactRow_of_pid (pid := "s1_026") (center := .s2) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_026_s2_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_block_13_0200_0245_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partials_13_0200_0245,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0226_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0227_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0228_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0229_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0230_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0231_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0232_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0233_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0234_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0235_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0236_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0237_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0238_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0239_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0240_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0241_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0242_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0243_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0244_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003NYTermShards.rs_R003_ueqv_R003NY_partial_13_0245_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
