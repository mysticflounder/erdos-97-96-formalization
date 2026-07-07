/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2050
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.R009UeqvR009NYNYNBlock23_0400_0421

/-!
# Product-sum row block zero for relaxed split surplus certificate R009:u=v:R009NYNYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R009:u=v:R009NYNYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNYN.json`.
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

private theorem rs_R009_ueqv_R009NYNYN_generator_23_0400_0421_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_generator_23_0400_0421) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pwx.index EndpointVar.pwy.index) := by
  native_decide

/-- Checked block `23:400-421` in product-sum row `R009:u=v:R009NYNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R009_ueqv_R009NYNYN_block_23_0400_0421_eval_zero
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
    (hpidEq : exactRow.pid = "s2_050") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0400_0421 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_generator_23_0400_0421) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pwx.index EndpointVar.pwy.index)
      rs_R009_ueqv_R009NYNYN_generator_23_0400_0421_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Pu)
          (leftLabel := .u)
          (rightLabel := .Pw)
          (cx := EndpointVar.pux) (cy := EndpointVar.puy) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.pwx) (b_y := EndpointVar.pwy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_050") (center := .Pu) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_050_Pu_u)
          (maskHas_exactRow_of_pid (pid := "s2_050") (center := .Pu) (label := .Pw) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_050_Pu_Pw)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_block_23_0400_0421_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partials_23_0400_0421,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0400_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0401_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0402_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0403_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0404_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0405_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0406_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0407_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0408_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0409_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0410_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0411_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0412_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0413_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0414_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0415_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0416_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0417_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0418_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0419_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0420_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R009UeqvR009NYNYNTermShards.rs_R009_ueqv_R009NYNYN_partial_23_0421_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
