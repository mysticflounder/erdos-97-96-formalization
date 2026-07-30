/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.DirectSoundness
import Erdos9796Proof.P97.EndpointCertificate.ProductCertificateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ1028

/-!
# Endpoint computed product row-zero certificate ep_Q1_028

This generated module uses the shared computed-product soundness theorem. The
row-specific content is only the finite endpoint generator-zero data.

The generators are derived from `Patterns.EpQ1028Generators.ep_Q1_028_rules`, so
the whole row-local obligation is the single kernel-decidable check that every
rule is supported by this row's shadow.  No polynomial-shape matching subgoal is
emitted.

Source certificate: `certificates/endpoint/ep_Q1_028.json`.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

private def ep_Q1_028_row : ShadowBank.EndpointRow :=
  ShadowBank.endpointRowsQ1.get (Fin.mk 28 (by decide))

/-- Every generator rule of `ep_Q1_028` is supported by its own row shadow. -/
private theorem ep_Q1_028_rulesOK :
    RowZeros.rulesOK Patterns.EpQ1028Generators.ep_Q1_028_rules
      ep_Q1_028_row.toShadow = true := by
  decide

/-- Every computed product in endpoint certificate `ep_Q1_028` evaluates to zero
under a metric interpretation of its finite shadow. -/
theorem ep_Q1_028_evaluationZeros_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    (hmetric : EndpointMetricShadow pointOf ep_Q1_028_row.toShadow) :
    Patterns.CertificatePayload.evaluationZeros
      (.productSum Patterns.ep_Q1_028_blocks)
      (endpointS1S3Assignment pointOf) := by
  change ∀ p ∈ computedProductPolys Patterns.ep_Q1_028_productBlocks,
    evalPoly (endpointS1S3Assignment pointOf) p = 0
  refine evaluationZeros_of_computedProductBlocks
    (endpointS1S3Assignment pointOf) Patterns.ep_Q1_028_productBlocks ?_
  dsimp [Patterns.EpQ1028Generators.ep_Q1_028_generators]
  exact RowZeros.evaluationZeros_of_rulesOK ep_Q1_028_rulesOK hmetric

end Variables

end EndpointCertificate

end Problem97
