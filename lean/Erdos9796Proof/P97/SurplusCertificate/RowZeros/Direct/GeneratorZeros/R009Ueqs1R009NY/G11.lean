/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2043
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R009Ueqs1R009NY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009Ueqs1R009NY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R009:u=s1:R009NY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009NY.json`.
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

/-- Generator 11 for `R009:u=s1:R009NY` evaluates to zero. -/
theorem rs_R009_ueqs1_R009NY_generator_11_zero
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
    (hpidEq : exactRow.pid = "s2_043") :
    evalPoly (endpointPairAssignment pointOf .u .s1) (Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqs1_R009NY_generators.get (Fin.mk 11 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .s1) (q := sqNormFirstMinusSqDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R009_ueqs1_R009NY_generator_11_shape
    (by
      exact (
        eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (memberLabel := .s3)
          (ax := EndpointVar.s1x) (ay := EndpointVar.s1y) (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_043") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_043_s1_v)
          (maskHas_exactRow_of_pid (pid := "s2_043") (center := .s1) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_043_s1_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
