/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1032
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R004UeqvR004YNN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R004UeqvR004YNN

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R004:u=v:R004YNN

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004YNN.json`.
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

/-- Generator 3 for `R004:u=v:R004YNN` evaluates to zero. -/
theorem rs_R004_ueqv_R004YNN_generator_03_zero
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
    (hpidEq : exactRow.pid = "s1_032") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004YNN_generators.get (Fin.mk 3 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.pwx.index EndpointVar.pwy.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R004_ueqv_R004YNN_generator_03_shape
    (by
      exact (
        eval_sqDistToUnitX_zero_of_exactRow_w_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .s3)
          (rightLabel := .Pw)
          (ax := EndpointVar.s3x) (ay := EndpointVar.s3y) (bx := EndpointVar.pwx) (b_y := EndpointVar.pwy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_032") (center := .w) (label := .s3) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_032_w_s3)
          (maskHas_exactRow_of_pid (pid := "s1_032") (center := .w) (label := .Pw) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_032_w_Pw)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
