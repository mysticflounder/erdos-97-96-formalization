/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1037
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.R007UeqvR007NYBlock06_0000_0020

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

private theorem rs_R007_ueqv_R007NY_generator_06_0000_0020_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_generator_06_0000_0020) =
      normalizePoly (rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `6:0-20` in product-sum row `R007:u=v:R007NY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R007_ueqv_R007NY_block_06_0000_0020_eval_zero
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
    (_hpidEq : exactRow.pid = "s1_037") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_06_0000_0020 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_generator_06_0000_0020) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R007_ueqv_R007NY_generator_06_0000_0020_shape
      (by
        exact (
          eval_rabinowitsch_sqNorm_zero_of_pair_v
          (pointOf := pointOf) (centerClass := centerClass)
          (label := .u) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          hmetric (by native_decide) (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_block_06_0000_0020_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partials_06_0000_0020,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R007UeqvR007NYTermShards.rs_R007_ueqv_R007NY_partial_06_0020_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
