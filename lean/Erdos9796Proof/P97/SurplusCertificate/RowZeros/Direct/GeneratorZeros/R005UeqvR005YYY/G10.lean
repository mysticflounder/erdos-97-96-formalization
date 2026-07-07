/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1015
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R005UeqvR005YYY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R005UeqvR005YYY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R005:u=v:R005YYY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YYY.json`.
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

/-- Generator 10 for `R005:u=v:R005YYY` evaluates to zero. -/
theorem rs_R005_ueqv_R005YYY_generator_10_zero
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
    (hpidEq : exactRow.pid = "s1_015") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R005_ueqv_R005YYY_generators.get (Fin.mk 10 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := sqDistMinusSqNormFirstPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R005_ueqv_R005YYY_generator_10_shape
    (by
      exact (
        eval_sqDistVsNorm_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (memberLabel := .u)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.ux) (b_y := EndpointVar.uy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_015") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_015_s1_v)
          (maskHas_exactRow_of_pid (pid := "s1_015") (center := .s1) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_015_s1_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
