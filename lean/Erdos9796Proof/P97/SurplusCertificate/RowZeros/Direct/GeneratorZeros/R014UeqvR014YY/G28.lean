/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S3019
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R014UeqvR014YY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R014UeqvR014YY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R014:u=v:R014YY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YY.json`.
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

/-- Generator 28 for `R014:u=v:R014YY` evaluates to zero. -/
theorem rs_R014_ueqv_R014YY_generator_28_zero
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
    (hpidEq : exactRow.pid = "s3_019") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R014_ueqv_R014YY_generators.get (Fin.mk 28 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := sqDistPointToUnitXDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q2x.index EndpointVar.q2y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R014_ueqv_R014YY_generator_28_shape
    (by
      exact (
        eval_sqDistPointToUnitX_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .u)
          (cx := EndpointVar.ux) (cy := EndpointVar.uy) (ax := EndpointVar.q2x) (ay := EndpointVar.q2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .Q2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_Q2_w)
          (maskHas_exactRow_of_pid (pid := "s3_019") (center := .Q2) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s3_019_Q2_u)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
