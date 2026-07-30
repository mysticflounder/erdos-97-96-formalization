/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.DirectSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1022

/-!
# Endpoint row-zero certificate ep_Q1_022

This generated module proves that the direct certificate payload for endpoint
row `ep_Q1_022` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

The generators are derived from `Patterns.ep_Q1_022_rules`, so the whole row-local
obligation is the single kernel-decidable check that every rule is supported by
this row's shadow.  No polynomial-shape matching subgoal is emitted.

Source certificate: `certificates/endpoint/ep_Q1_022.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Finite endpoint row paired with direct certificate `ep_Q1_022`. -/
private def ep_Q1_022_row : ShadowBank.EndpointRow :=
  ShadowBank.endpointRowsQ1.get (Fin.mk 22 (by decide))

/-- Every generator rule of `ep_Q1_022` is supported by its own row shadow. -/
private theorem ep_Q1_022_rulesOK :
    RowZeros.rulesOK Patterns.ep_Q1_022_rules ep_Q1_022_row.toShadow = true := by
  decide

/-- Every generator in direct endpoint certificate `ep_Q1_022` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q1_022_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf ep_Q1_022_row.toShadow) :
    Patterns.CertificatePayload.evaluationZeros (.direct Patterns.ep_Q1_022)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros, Patterns.ep_Q1_022,
    Patterns.ep_Q1_022_generators]
  exact RowZeros.evaluationZeros_of_rulesOK ep_Q1_022_rulesOK hmetric

end Variables

end EndpointCertificate

end Problem97
