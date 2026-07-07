/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1028
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.R006UeqvR006Block16_1100_1152

/-!
# Product-sum row block zero for relaxed split surplus certificate R006:u=v:R006

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R006:u=v:R006`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R006_ueqv_R006.json`.
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

private theorem rs_R006_ueqv_R006_generator_16_1100_1152_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_generator_16_1100_1152) =
      normalizePoly (twiceVarMinusOnePoly EndpointVar.s3x.index) := by
  native_decide

/-- Checked block `16:1100-1152` in product-sum row `R006:u=v:R006`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R006_ueqv_R006_block_16_1100_1152_eval_zero
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
    (hpidEq : exactRow.pid = "s1_028") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_1100_1152 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_generator_16_1100_1152) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := twiceVarMinusOnePoly EndpointVar.s3x.index)
      rs_R006_ueqv_R006_generator_16_1100_1152_shape
      (by
        exact (
          eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (ax := EndpointVar.s3x)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_028") (center := .s3) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_028_s3_v)
          (maskHas_exactRow_of_pid (pid := "s1_028") (center := .s3) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_028_s3_w)
          (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_block_16_1100_1152_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partials_16_1100_1152,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1100_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1101_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1102_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1103_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1104_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1105_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1106_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1107_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1108_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1109_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1110_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1111_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1112_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1113_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1114_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1115_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1116_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1117_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1118_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1119_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1120_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1121_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1122_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1123_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1124_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1125_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1126_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1127_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1128_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1129_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1130_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1131_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1132_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1133_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1134_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1135_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1136_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1137_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1138_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1139_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1140_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1141_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1142_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1143_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1144_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1145_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1146_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1147_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1148_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1149_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1150_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1151_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R006UeqvR006TermShards.rs_R006_ueqv_R006_partial_16_1152_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
