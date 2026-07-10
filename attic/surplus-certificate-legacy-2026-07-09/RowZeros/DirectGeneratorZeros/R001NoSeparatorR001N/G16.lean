/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1001
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R001NoSeparatorR001N
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R001NoSeparatorR001N

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R001:no_separator:R001N

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R001_no_separator_R001N.json`.
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

/-- Generator 16 for `R001:no_separator:R001N` evaluates to zero. -/
theorem rs_R001_no_separator_R001N_generator_16_zero
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
    (hpidEq : exactRow.pid = "s1_001") :
    evalPoly (endpointS1S3Assignment pointOf) (Problem97.SurplusCertificate.RelaxedSplit.rs_R001_no_separator_R001N_generators.get (Fin.mk 16 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointS1S3Assignment pointOf) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.s3x.index EndpointVar.s3y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R001_no_separator_R001N_generator_16_shape
    (by
      exact (
        eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s3)
          (memberLabel := .Pu)
          (cx := EndpointVar.pux) (cy := EndpointVar.puy) (ax := EndpointVar.s3x) (ay := EndpointVar.s3y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_001") (center := .s3) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_001_s3_w)
          (maskHas_exactRow_of_pid (pid := "s1_001") (center := .s3) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_001_s3_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
