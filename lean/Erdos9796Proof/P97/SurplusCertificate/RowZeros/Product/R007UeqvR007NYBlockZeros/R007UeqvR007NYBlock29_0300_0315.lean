/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1037
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.R007UeqvR007NYBlock29_0300_0315

/-!
# Product-sum row block zero for relaxed split surplus certificate R007:u=v:R007NY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R007:u=v:R007NY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NY.json`.
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

private theorem rs_R007_ueqv_R007NY_generator_29_0300_0315_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_generator_29_0300_0315) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `29:300-315` in product-sum row `R007:u=v:R007NY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R007_ueqv_R007NY_block_29_0300_0315_eval_zero
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
    (hpidEq : exactRow.pid = "s1_037") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0300_0315 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_generator_29_0300_0315) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R007_ueqv_R007NY_generator_29_0300_0315_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .s3)
          (cx := EndpointVar.s3x) (cy := EndpointVar.s3y) (ax := EndpointVar.q2x) (ay := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_037") (center := .Q2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_037_Q2_w)
          (maskHas_exactRow_of_pid (pid := "s1_037") (center := .Q2) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_037_Q2_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_29_0300_0315_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partials_29_0300_0315,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0300_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0301_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0302_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0303_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0304_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0305_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0306_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0307_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0308_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0309_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0310_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0311_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0312_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0313_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0314_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_29_0315_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
