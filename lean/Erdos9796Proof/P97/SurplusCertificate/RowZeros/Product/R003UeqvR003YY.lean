/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Payload
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.DirectSoundness
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003YY

/-!
# Product-sum row zeros for relaxed split surplus certificate R003:u=v:R003YY

This generated module interprets the checked product blocks through the shared
generator-rule soundness theorem. The row-specific content is only finite rule
data and one Boolean check.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YY.json`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

set_option linter.style.nativeDecide false in
/-- The generated rules are valid for the selected exact-row bank entry. -/
private theorem rs_R003_ueqv_R003YY_rules_check :
    rulesValidForPid "s1_024" (.pair .u .v)
      rs_R003_ueqv_R003YY_rules = true := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R003_ueqv_R003YY_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : ["s1_024"] = [exactRow.pid]) :
    exactRow.pid = "s1_024" := by
  simpa using hpid.symm

/-- Every computed block in product-sum relaxed split surplus certificate
`R003:u=v:R003YY` evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003YY_evaluationZeros_of_metricShadow
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
    (hpid : ["s1_024"] = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.rs_R003_ueqv_R003YY_blocks)
      (endpointPairAssignment pointOf .u .v) := by
  have hpidEq := rs_R003_ueqv_R003YY_exactRow_pid_eq hpid
  change ∀ p ∈ computedProductPolys rs_R003_ueqv_R003YY_productBlocks,
    evalPoly (endpointPairAssignment pointOf .u .v) p = 0
  refine evaluationZeros_of_computedProductBlocks
    (endpointPairAssignment pointOf .u .v) rs_R003_ueqv_R003YY_productBlocks ?_
  simpa [rs_R003_ueqv_R003YY_generators, RowAssignment.evaluation] using
    (evaluationZeros_of_rulesValidForPid
      (pointOf := pointOf) (centerClass := centerClass)
      (exactRow := exactRow) (pid := "s1_024")
      (assignment := (.pair .u .v)) (rules := rs_R003_ueqv_R003YY_rules)
      rs_R003_ueqv_R003YY_rules_check hmetric hrow hmasks hpidEq)

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
