/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S2069
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ShapeFacts.R010UeqvR010NN
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NN

/-!
# Generator-zero proof for direct relaxed split row-zero certificate R010:u=v:R010NN

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NN.json`.
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

/-- Generator 6 for `R010:u=v:R010NN` evaluates to zero. -/
theorem rs_R010_ueqv_R010NN_generator_06_zero
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
    (hpidEq : exactRow.pid = "s2_069") :
    evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.rs_R010_ueqv_R010NN_generators.get (Fin.mk 6 (by native_decide))) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (endpointPairAssignment pointOf .u .v) (q := rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index)
    Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts.rs_R010_ueqv_R010NN_generator_06_shape
    (by
      exact (
        eval_rabinowitsch_sqNorm_zero_of_pair_v
          (pointOf := pointOf) (centerClass := centerClass)
          (label := .u) (ax := EndpointVar.ux) (ay := EndpointVar.uy)
          hmetric (by native_decide) (by native_decide) (by native_decide)))

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
