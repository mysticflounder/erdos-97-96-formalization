/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3009
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.R013UeqvR013YYYNBlock04_1200_1299

/-!
# Product-sum row block zero for relaxed split surplus certificate R013:u=v:R013YYYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R013:u=v:R013YYYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYYN.json`.
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

private theorem rs_R013_ueqv_R013YYYN_generator_04_1200_1299_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_generator_04_1200_1299) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `4:1200-1299` in product-sum row `R013:u=v:R013YYYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YYYN_block_04_1200_1299_eval_zero
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
    (hpidEq : exactRow.pid = "s3_009") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_block_04_1200_1299 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_generator_04_1200_1299) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R013_ueqv_R013YYYN_generator_04_1200_1299_shape
      (by
        exact (
          eval_sqDistToUnitX_zero_of_exactRow_w_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .s3)
          (rightLabel := .Q1)
          (ax := EndpointVar.s3x) (ay := EndpointVar.s3y) (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_009") (center := .w) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_009_w_s3)
          (maskHas_exactRow_of_pid (pid := "s3_009") (center := .w) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_009_w_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_block_04_1200_1299_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partials_04_1200_1299,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1200_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1201_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1202_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1203_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1204_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1205_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1206_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1207_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1208_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1209_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1210_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1211_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1212_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1213_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1214_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1215_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1216_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1217_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1218_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1219_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1220_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1221_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1222_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1223_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1224_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1225_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1226_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1227_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1228_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1229_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1230_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1231_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1232_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1233_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1234_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1235_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1236_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1237_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1238_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1239_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1240_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1241_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1242_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1243_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1244_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1245_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1246_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1247_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1248_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1249_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1250_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1251_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1252_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1253_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1254_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1255_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1256_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1257_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1258_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1259_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1260_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1261_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1262_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1263_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1264_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1265_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1266_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1267_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1268_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1269_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1270_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1271_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1272_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1273_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1274_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1275_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1276_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1277_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1278_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1279_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1280_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1281_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1282_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1283_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1284_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1285_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1286_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1287_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1288_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1289_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1290_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1291_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1292_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1293_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1294_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1295_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1296_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1297_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1298_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYYNTermShards.rs_R013_ueqv_R013YYYN_partial_04_1299_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
