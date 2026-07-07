/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3005
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.R013UeqvR013YYNYNBlock28_1500_1599

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

private theorem rs_R013_ueqv_R013YYNYN_generator_28_1500_1599_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_generator_28_1500_1599) =
      normalizePoly (sqDistMinusSqNormFirstPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Checked block `28:1500-1599` in product-sum row `R013:u=v:R013YYNYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R013_ueqv_R013YYNYN_block_28_1500_1599_eval_zero
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
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_block_28_1500_1599 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_generator_28_1500_1599) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistMinusSqNormFirstPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index)
      rs_R013_ueqv_R013YYNYN_generator_28_1500_1599_shape
      (by
        exact (
          eval_sqDistVsNorm_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .u)
          (ax := EndpointVar.q2x) (ay := EndpointVar.q2y) (bx := EndpointVar.ux) (b_y := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_005") (center := .Q2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_005_Q2_v)
          (maskHas_exactRow_of_pid (pid := "s3_005") (center := .Q2) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_005_Q2_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_block_28_1500_1599_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partials_28_1500_1599,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1500_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1501_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1502_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1503_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1504_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1505_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1506_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1507_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1508_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1509_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1510_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1511_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1512_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1513_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1514_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1515_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1516_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1517_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1518_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1519_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1520_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1521_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1522_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1523_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1524_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1525_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1526_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1527_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1528_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1529_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1530_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1531_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1532_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1533_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1534_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1535_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1536_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1537_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1538_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1539_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1540_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1541_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1542_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1543_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1544_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1545_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1546_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1547_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1548_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1549_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1550_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1551_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1552_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1553_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1554_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1555_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1556_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1557_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1558_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1559_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1560_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1561_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1562_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1563_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1564_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1565_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1566_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1567_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1568_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1569_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1570_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1571_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1572_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1573_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1574_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1575_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1576_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1577_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1578_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1579_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1580_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1581_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1582_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1583_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1584_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1585_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1586_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1587_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1588_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1589_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1590_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1591_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1592_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1593_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1594_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1595_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1596_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1597_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1598_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R013UeqvR013YYNYNTermShards.rs_R013_ueqv_R013YYNYN_partial_28_1599_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
