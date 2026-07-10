/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Payload
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.DirectSoundness
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R001NoSeparatorR001N

/-!
# Direct row zeros for relaxed split surplus certificate R001:no_separator:R001N

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

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

set_option linter.style.nativeDecide false in
/-- The generated rules are valid for the selected exact-row bank entry. -/
private theorem rs_R001_no_separator_R001N_rules_check :
    rulesValidForPid "s1_001" .s1s3
      rs_R001_no_separator_R001N_rules = true := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem rs_R001_no_separator_R001N_exactRow_pid_eq
    {exactRow : SurplusCOMPGBank.Row}
    (hpid : ["s1_001"] = [exactRow.pid]) :
    exactRow.pid = "s1_001" := by
  simpa using hpid.symm

/-- The direct payload for `R001:no_separator:R001N` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem rs_R001_no_separator_R001N_evaluationZeros_of_metricShadow
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
    (hpid : ["s1_001"] = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct rs_R001_no_separator_R001N) (endpointS1S3Assignment pointOf) := by
  have hpidEq := rs_R001_no_separator_R001N_exactRow_pid_eq hpid
  change ∀ g ∈ rs_R001_no_separator_R001N_generators, evalPoly (endpointS1S3Assignment pointOf) g = 0
  simpa [rs_R001_no_separator_R001N_generators, RowAssignment.evaluation] using
    (evaluationZeros_of_rulesValidForPid
      (pointOf := pointOf) (centerClass := centerClass)
      (exactRow := exactRow) (pid := "s1_001")
      (assignment := .s1s3) (rules := rs_R001_no_separator_R001N_rules)
      rs_R001_no_separator_R001N_rules_check hmetric hrow hmasks hpidEq)

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
