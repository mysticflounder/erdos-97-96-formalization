/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2066
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.R010UeqvR010NYNBlock08_0000_0014

/-!
# Product-sum row block zero for relaxed split surplus certificate R010:u=v:R010NYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R010:u=v:R010NYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NYN.json`.
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

private theorem rs_R010_ueqv_R010NYN_generator_08_0000_0014_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_generator_08_0000_0014) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `8:0-14` in product-sum row `R010:u=v:R010NYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R010_ueqv_R010NYN_block_08_0000_0014_eval_zero
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
    (hpidEq : exactRow.pid = "s2_066") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_08_0000_0014 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_generator_08_0000_0014) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R010_ueqv_R010NYN_generator_08_0000_0014_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .u)
          (memberLabel := .s2)
          (cx := EndpointVar.s2x) (cy := EndpointVar.s2y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_066") (center := .u) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_066_u_w)
          (maskHas_exactRow_of_pid (pid := "s2_066") (center := .u) (label := .s2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_066_u_s2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_block_08_0000_0014_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partials_08_0000_0014,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0000_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0001_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0002_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0003_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0004_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0005_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0006_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0007_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0008_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0009_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0010_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0011_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0012_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0013_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNTermShards.rs_R010_ueqv_R010NYN_partial_08_0014_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
