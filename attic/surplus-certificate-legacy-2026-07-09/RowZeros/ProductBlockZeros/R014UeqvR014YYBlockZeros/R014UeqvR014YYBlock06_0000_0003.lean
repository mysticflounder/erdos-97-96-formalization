/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3019
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.R014UeqvR014YYBlock06_0000_0003

/-!
# Product-sum row block zero for relaxed split surplus certificate R014:u=v:R014YY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R014:u=v:R014YY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YY.json`.
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

private theorem rs_R014_ueqv_R014YY_generator_06_0000_0003_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_06_0000_0003) =
      normalizePoly (rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `6:0-3` in product-sum row `R014:u=v:R014YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R014_ueqv_R014YY_block_06_0000_0003_eval_zero
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (_hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (_hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (_hpidEq : exactRow.pid = "s3_019") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_06_0000_0003 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_generator_06_0000_0003) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R014_ueqv_R014YY_generator_06_0000_0003_shape
      (by
        exact (
          eval_rabinowitsch_sqNorm_zero_of_pair_v
          (pointOf := pointOf) (centerClass := centerClass)
          (label := .u) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          hmetric (by native_decide) (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_block_06_0000_0003_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partials_06_0000_0003,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_06_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_06_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_06_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R014UeqvR014YYTermShards.rs_R014_ueqv_R014YY_partial_06_0003_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
