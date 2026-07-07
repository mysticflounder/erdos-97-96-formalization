/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2032
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.R009UeqvR009NYYNYBlock29_0000_0008

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009NYYNY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009NYYNY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYNY.json`.
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

private theorem rs_R009_ueqv_R009NYYNY_generator_29_0000_0008_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_generator_29_0000_0008) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Checked block `29:0-8` in product-sum row `R009:u=v:R009NYYNY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NYYNY_block_29_0000_0008_eval_zero
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
    (hpidEq : exactRow.pid = "s2_032") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_block_29_0000_0008 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_generator_29_0000_0008) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.q2x.index EndpointVar.q2y.index)
      rs_R009_ueqv_R009NYYNY_generator_29_0000_0008_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .s2)
          (cx := EndpointVar.s2x) (cy := EndpointVar.s2y) (ax := EndpointVar.q2x) (ay := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_032") (center := .Q2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_032_Q2_w)
          (maskHas_exactRow_of_pid (pid := "s2_032") (center := .Q2) (label := .s2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_032_Q2_s2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_block_29_0000_0008_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partials_29_0000_0008,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYYNYTermShards.rs_R009_ueqv_R009NYYNY_partial_29_0008_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
