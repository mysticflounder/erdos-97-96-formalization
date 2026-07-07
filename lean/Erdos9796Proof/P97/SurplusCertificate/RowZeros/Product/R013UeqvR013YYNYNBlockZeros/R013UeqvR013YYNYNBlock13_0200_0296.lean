/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3005
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.R013UeqvR013YYNYNBlock13_0200_0296

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013YYNYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013YYNYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYNYN.json`.
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

private theorem rs_R013_ueqv_R013YYNYN_generator_13_0200_0296_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_generator_13_0200_0296) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Checked block `13:200-296` in product-sum row `R013:u=v:R013YYNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YYNYN_block_13_0200_0296_eval_zero
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
    (hpidEq : exactRow.pid = "s3_005") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_block_13_0200_0296 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_generator_13_0200_0296) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s2x.index EndpointVar.s2y.index)
      rs_R013_ueqv_R013YYNYN_generator_13_0200_0296_shape
      (by
        exact (
          eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s2)
          (memberLabel := .s1)
          (cx := EndpointVar.s1x) (cy := EndpointVar.s1y) (ax := EndpointVar.s2x) (ay := EndpointVar.s2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_005") (center := .s2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_005_s2_w)
          (maskHas_exactRow_of_pid (pid := "s3_005") (center := .s2) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_005_s2_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_block_13_0200_0296_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partials_13_0200_0296,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0226_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0227_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0228_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0229_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0230_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0231_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0232_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0233_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0234_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0235_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0236_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0237_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0238_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0239_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0240_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0241_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0242_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0243_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0244_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0245_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0246_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0247_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0248_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0249_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0250_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0251_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0252_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0253_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0254_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0255_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0256_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0257_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0258_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0259_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0260_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0261_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0262_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0263_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0264_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0265_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0266_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0267_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0268_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0269_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0270_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0271_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0272_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0273_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0274_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0275_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0276_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0277_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0278_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0279_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0280_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0281_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0282_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0283_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0284_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0285_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0286_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0287_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0288_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0289_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0290_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0291_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0292_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0293_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0294_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0295_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_13_0296_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
