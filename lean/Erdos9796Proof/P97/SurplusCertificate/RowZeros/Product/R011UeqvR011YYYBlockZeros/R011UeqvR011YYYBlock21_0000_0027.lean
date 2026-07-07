/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2054
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.R011UeqvR011YYYBlock21_0000_0027

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

private theorem rs_R011_ueqv_R011YYY_generator_21_0000_0027_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_generator_21_0000_0027) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Checked block `21:0-27` in product-sum row `R011:u=v:R011YYY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R011_ueqv_R011YYY_block_21_0000_0027_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_21_0000_0027 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_generator_21_0000_0027) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index)
      rs_R011_ueqv_R011YYY_generator_21_0000_0027_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Pw)
          (leftLabel := .u)
          (rightLabel := .s3)
          (cx := EndpointVar.pwx) (cy := EndpointVar.pwy) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_054") (center := .Pw) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_054_Pw_u)
          (maskHas_exactRow_of_pid (pid := "s2_054") (center := .Pw) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_054_Pw_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_block_21_0000_0027_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partials_21_0000_0027,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0014_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0015_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0016_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0017_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0018_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0019_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0020_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0021_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0022_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0023_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0024_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0025_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0026_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R011UeqvR011YYYTermShards.rs_R011_ueqv_R011YYY_partial_21_0027_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
