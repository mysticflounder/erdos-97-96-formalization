/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2053
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R011Ueqs1R011Y
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R011Ueqs1R011Y

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R011:u=s1:R011Y

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqs1_R011Y.json`.
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

/-- Generator 1 for `R011:u=s1:R011Y` evaluates to zero. -/
theorem rs_R011_ueqs1_R011Y_generator_01_zero
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
    (hpidEq : exactRow.pid = "s2_053") :
    evalPoly (endpointPairAssignment pointOf .u .s1) (Problem97.SurplusCertificate.RelaxedSplit.rs_R011_ueqs1_R011Y_generators.get (Fin.mk 1 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .s1) (q := sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pwx.index EndpointVar.pwy.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R011_ueqs1_R011Y_generator_01_shape
    (by
      exact (
        eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := .u)
          (rightLabel := .Pw)
          (ax := EndpointVar.ux) (ay := EndpointVar.uy) (bx := EndpointVar.pwx) (b_y := EndpointVar.pwy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_053") (center := .v) (label := .u) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_053_v_u)
          (maskHas_exactRow_of_pid (pid := "s2_053") (center := .v) (label := .Pw) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_053_v_Pw)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
