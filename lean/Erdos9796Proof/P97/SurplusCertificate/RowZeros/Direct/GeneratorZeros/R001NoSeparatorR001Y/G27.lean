/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1000
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R001NoSeparatorR001Y
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R001NoSeparatorR001Y

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R001:no_separator:R001Y

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R001_no_separator_R001Y.json`.
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

/-- Generator 27 for `R001:no_separator:R001Y` evaluates to zero. -/
theorem rs_R001_no_separator_R001Y_generator_27_zero
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
    (hpidEq : exactRow.pid = "s1_000") :
    evalPoly (endpointS1S3Assignment pointOf) (Problem97.SurplusCertificate.RelaxedSplit.rs_R001_no_separator_R001Y_generators.get (Fin.mk 27 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointS1S3Assignment pointOf) (q := sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.s3x.index EndpointVar.s3y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R001_no_separator_R001Y_generator_27_shape
    (by
      exact (
        eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .s3)
          (ax := EndpointVar.q2x) (ay := EndpointVar.q2y) (bx := EndpointVar.s3x) (b_y := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_000") (center := .Q2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_000_Q2_v)
          (maskHas_exactRow_of_pid (pid := "s1_000") (center := .Q2) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_000_Q2_s3)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
