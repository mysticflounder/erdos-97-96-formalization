/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1033
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R004UeqvR004NNY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R004UeqvR004NNY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R004:u=v:R004NNY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNY.json`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Direct

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- Generator 0 for `R004:u=v:R004NNY` evaluates to zero. -/
theorem rs_R004_ueqv_R004NNY_generator_00_zero
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
    (hpidEq : exactRow.pid = "s1_033") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NNY_generators.get (Fin.mk 0 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R004_ueqv_R004NNY_generator_00_shape
    (by
      exact (
        eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .u)
          (rightLabel := .s1)
          (ax := EndpointVar.ux) (ay := EndpointVar.uy) (bx := EndpointVar.s1x) (b_y := EndpointVar.s1y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_033") (center := .v) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_033_v_u)
          (maskHas_exactRow_of_pid (pid := "s1_033") (center := .v) (label := .s1) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_033_v_s1)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
