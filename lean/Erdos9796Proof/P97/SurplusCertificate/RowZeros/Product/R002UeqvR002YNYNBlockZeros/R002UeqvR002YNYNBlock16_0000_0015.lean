/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1007
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.R002UeqvR002YNYNBlock16_0000_0015

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

private theorem rs_R002_ueqv_R002YNYN_generator_16_0000_0015_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_16_0000_0015) =
      normalizePoly (sqDistPointToUnitXDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Checked block `16:0-15` in product-sum row `R002:u=v:R002YNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R002_ueqv_R002YNYN_block_16_0000_0015_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_16_0000_0015 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_generator_16_0000_0015) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistPointToUnitXDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index)
      rs_R002_ueqv_R002YNYN_generator_16_0000_0015_shape
      (by
        exact (
          eval_sqDistPointToUnitX_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (memberLabel := .u)
          (cx := EndpointVar.ux) (cy := EndpointVar.uy) (ax := EndpointVar.s3x) (ay := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .s3) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_s3_w)
          (maskHas_exactRow_of_pid (pid := "s1_007") (center := .s3) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_007_s3_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_block_16_0000_0015_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partials_16_0000_0015,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYNTermShards.rs_R002_ueqv_R002YNYN_partial_16_0015_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
