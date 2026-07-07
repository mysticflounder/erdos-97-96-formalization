/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1016
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.R005UeqvR005NYNBlock30_1400_1456

/-!
# Product-sum row block zero for relaxed split surplus certificate R005:u=v:R005NYN

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R005:u=v:R005NYN`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NYN.json`.
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

private theorem rs_R005_ueqv_R005NYN_generator_30_1400_1456_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_generator_30_1400_1456) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Checked block `30:1400-1456` in product-sum row `R005:u=v:R005NYN`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R005_ueqv_R005NYN_block_30_1400_1456_eval_zero
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
    (hpidEq : exactRow.pid = "s1_016") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_block_30_1400_1456 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_generator_30_1400_1456) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := sqDistToCenterDiffPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index)
      rs_R005_ueqv_R005NYN_generator_30_1400_1456_shape
      (by
        exact (
          eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (leftLabel := .u)
          (rightLabel := .Q1)
          (cx := EndpointVar.q2x) (cy := EndpointVar.q2y) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          (bx := EndpointVar.q1x) (b_y := EndpointVar.q1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_016") (center := .Q2) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_016_Q2_u)
          (maskHas_exactRow_of_pid (pid := "s1_016") (center := .Q2) (label := .Q1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_016_Q2_Q1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_block_30_1400_1456_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partials_30_1400_1456,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1400_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1401_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1402_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1403_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1404_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1405_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1406_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1407_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1408_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1409_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1410_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1411_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1412_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1413_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1414_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1415_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1416_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1417_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1418_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1419_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1420_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1421_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1422_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1423_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1424_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1425_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1426_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1427_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1428_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1429_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1430_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1431_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1432_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1433_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1434_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1435_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1436_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1437_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1438_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1439_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1440_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1441_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1442_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1443_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1444_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1445_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1446_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1447_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1448_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1449_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1450_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1451_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1452_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1453_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1454_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1455_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R005UeqvR005NYNTermShards.rs_R005_ueqv_R005NYN_partial_30_1456_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
