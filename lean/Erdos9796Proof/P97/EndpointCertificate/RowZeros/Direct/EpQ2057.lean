/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.DirectSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2057

/-!
# Endpoint row-zero certificate ep_Q2_057

This generated module proves that the direct certificate payload for endpoint
row `ep_Q2_057` vanishes under the endpoint normal-axis assignment attached to any
metric interpretation of the row shadow.

The generators are derived from `Patterns.ep_Q2_057_rules`, so the whole row-local
obligation is the single kernel-decidable check that every rule is supported by
this row's shadow.  No polynomial-shape matching subgoal is emitted.

Source certificate: `certificates/endpoint/ep_Q2_057.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- Finite endpoint row paired with direct certificate `ep_Q2_057`. -/
private def ep_Q2_057_row : ShadowBank.EndpointRow :=
  ShadowBank.endpointRowsQ2.get (Fin.mk 57 (by decide))

/-- Every generator rule of `ep_Q2_057` is supported by its own row shadow. -/
private theorem ep_Q2_057_rulesOK :
    RowZeros.rulesOK Patterns.ep_Q2_057_rules ep_Q2_057_row.toShadow = true := by
  decide

/-- Every generator in direct endpoint certificate `ep_Q2_057` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q2_057_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf ep_Q2_057_row.toShadow) :
    Patterns.CertificatePayload.evaluationZeros (.direct Patterns.ep_Q2_057)
      (endpointS1S3Assignment pointOf) := by
  dsimp [Patterns.CertificatePayload.evaluationZeros, Patterns.ep_Q2_057,
    Patterns.ep_Q2_057_generators]
  exact RowZeros.evaluationZeros_of_rulesOK ep_Q2_057_rulesOK hmetric

end Variables

end EndpointCertificate

end Problem97
