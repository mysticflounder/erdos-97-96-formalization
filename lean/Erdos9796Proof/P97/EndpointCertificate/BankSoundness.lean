/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness
import Erdos9796Proof.P97.EndpointCertificate.Bank

/-!
# Endpoint row-bank soundness

This module composes finite endpoint-row bank membership with the generated
certificate aggregate soundness theorem.
-/

namespace Problem97

namespace EndpointCertificate

namespace Bank

/-- Endpoint row-bank membership is inconsistent once the matching generated
certificate payload has its semantic zero-evaluation condition. -/
theorem false_of_endpointShadowInBank_of_payload_zeros
    (ν : Nat → ℝ) {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true)
    (hzeros : ∀ rowCert : Row × Certificate,
      rowCert ∈ certifiedEndpointRows →
        rowCert.1.escapee = escapee →
          rowCert.1.masks = shadow.masks →
            rowCert.2.payload.evaluationZeros ν) :
    False := by
  rcases exists_alignedCertifiedEndpointRow_of_endpointShadowInBank hin with
    ⟨rowCert, hrowCert, hescapee, hmasks, _hid, _hcheck⟩
  exact Patterns.false_of_verifiedCertificate ν rowCert.2
    (hzeros rowCert hrowCert hescapee hmasks)

/-- Endpoint row-bank membership is inconsistent once the matching generated
certificate payload has its coefficient-aware semantic zero-evaluation
condition. -/
theorem false_of_endpointShadowInBank_of_weighted_payload_zeros
    (ν : Nat → ℝ) {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true)
    (hzeros : ∀ rowCert : Row × Certificate,
      rowCert ∈ certifiedEndpointRows →
        rowCert.1.escapee = escapee →
          rowCert.1.masks = shadow.masks →
            rowCert.2.payload.weightedEvaluationZeros ν) :
    False := by
  rcases exists_alignedCertifiedEndpointRow_of_endpointShadowInBank hin with
    ⟨rowCert, hrowCert, hescapee, hmasks, _hid, _hcheck⟩
  exact Patterns.false_of_verifiedCertificate_weighted ν rowCert.2
    (hzeros rowCert hrowCert hescapee hmasks)

end Bank

end EndpointCertificate

end Problem97
