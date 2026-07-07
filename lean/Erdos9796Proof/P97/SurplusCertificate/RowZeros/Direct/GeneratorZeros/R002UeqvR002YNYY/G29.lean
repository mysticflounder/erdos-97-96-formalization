/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1006
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R002UeqvR002YNYY
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R002UeqvR002YNYY

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R002:u=v:R002YNYY

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNYY.json`.
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

/-- Generator 29 for `R002:u=v:R002YNYY` evaluates to zero. -/
theorem rs_R002_ueqv_R002YNYY_generator_29_zero
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
    (hpidEq : exactRow.pid = "s1_006") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R002_ueqv_R002YNYY_generators.get (Fin.mk 29 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := sqNormFirstMinusSqDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.pux.index EndpointVar.puy.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R002_ueqv_R002YNYY_generator_29_shape
    (by
      exact (
        eval_sqNormVsDist_zero_of_exactRow_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Q2)
          (memberLabel := .Pu)
          (ax := EndpointVar.q2x) (ay := EndpointVar.q2y) (bx := EndpointVar.pux) (b_y := EndpointVar.puy)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_006") (center := .Q2) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_006_Q2_v)
          (maskHas_exactRow_of_pid (pid := "s1_006") (center := .Q2) (label := .Pu) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_006_Q2_Pu)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
