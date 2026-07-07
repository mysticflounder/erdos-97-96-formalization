/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2039
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R009UeqvR009YNNYY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009YNNYY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R009:u=v:R009YNNYY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNYY.json`.
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

/-- Generator 10 for `R009:u=v:R009YNNYY` evaluates to zero. -/
theorem rs_R009_ueqv_R009YNNYY_generator_10_zero
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
    (hpidEq : exactRow.pid = "s2_039") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqv_R009YNNYY_generators.get (Fin.mk 10 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := twiceVarMinusOnePoly EndpointVar.s1x.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R009_ueqv_R009YNNYY_generator_10_shape
    (by
      exact (
        eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s1)
          (ax := EndpointVar.s1x)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_039") (center := .s1) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_039_s1_v)
          (maskHas_exactRow_of_pid (pid := "s2_039") (center := .s1) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_039_s1_w)
          (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
