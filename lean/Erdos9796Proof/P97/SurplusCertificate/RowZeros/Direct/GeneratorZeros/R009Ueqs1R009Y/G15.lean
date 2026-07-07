/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2030
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R009Ueqs1R009Y
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009Ueqs1R009Y

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R009:u=s1:R009Y

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009Y.json`.
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

/-- Generator 15 for `R009:u=s1:R009Y` evaluates to zero. -/
theorem rs_R009_ueqs1_R009Y_generator_15_zero
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
    (hpidEq : exactRow.pid = "s2_030") :
    evalPoly (endpointPairAssignment pointOf .u .s1) (Problem97.SurplusCertificate.RelaxedSplit.rs_R009_ueqs1_R009Y_generators.get (Fin.mk 15 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .s1) (q := sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.s2x.index EndpointVar.s2y.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R009_ueqs1_R009Y_generator_15_shape
    (by
      exact (
        eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .s2)
          (memberLabel := .Q2)
          (cx := EndpointVar.q2x) (cy := EndpointVar.q2y) (ax := EndpointVar.s2x) (ay := EndpointVar.s2y)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s2_030") (center := .s2) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_030_s2_w)
          (maskHas_exactRow_of_pid (pid := "s2_030") (center := .s2) (label := .Q2) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s2_030_s2_Q2)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
