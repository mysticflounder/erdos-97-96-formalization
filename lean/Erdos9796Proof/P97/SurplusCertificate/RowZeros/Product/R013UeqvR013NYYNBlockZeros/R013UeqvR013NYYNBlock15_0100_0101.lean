/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3014
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.R013UeqvR013NYYNBlock15_0100_0101

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013NYYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013NYYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NYYN.json`.
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

private theorem rs_R013_ueqv_R013NYYN_generator_15_0100_0101_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_generator_15_0100_0101) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Checked block `15:100-101` in product-sum row `R013:u=v:R013NYYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013NYYN_block_15_0100_0101_eval_zero
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
    (hpidEq : exactRow.pid = "s3_014") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_block_15_0100_0101 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_generator_15_0100_0101) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.s2x.index EndpointVar.s2y.index)
      rs_R013_ueqv_R013NYYN_generator_15_0100_0101_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s2)
          (memberLabel := .Q2)
          (cx := EndpointVar.q2x) (cy := EndpointVar.q2y) (ax := EndpointVar.s2x) (ay := EndpointVar.s2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_014") (center := .s2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_014_s2_w)
          (maskHas_exactRow_of_pid (pid := "s3_014") (center := .s2) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_014_s2_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_block_15_0100_0101_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_partials_15_0100_0101,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_partial_15_0100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013NYYNTermShards.rs_R013_ueqv_R013NYYN_partial_15_0101_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
