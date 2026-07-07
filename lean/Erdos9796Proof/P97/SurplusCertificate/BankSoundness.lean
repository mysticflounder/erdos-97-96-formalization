/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Bank

/-!
# Relaxed split surplus row-bank soundness

This module composes finite singleton relaxed split row-bank membership with the
generated certificate aggregate soundness theorem.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

/-- Singleton relaxed split row-id membership is inconsistent once the matching
generated certificate payload has its semantic zero-evaluation condition. -/
theorem false_of_relaxedSplitRowIdInBank_of_payload_zeros
    (ν : Nat → ℝ) {id : String}
    (hin : relaxedSplitRowIdInBank id = true)
    (hzeros : ∀ rowCert : Row × Certificate,
      rowCert ∈ certifiedRelaxedSplitRows →
        rowCert.1.id = id →
          rowCert.2.payload.evaluationZeros ν) :
    False := by
  rcases exists_certifiedRelaxedSplitRow_of_rowIdInBank hin with
    ⟨rowCert, hrowCert, hid, _hcheck⟩
  exact Problem97.SurplusCertificate.RelaxedSplit.false_of_verifiedCertificate
    ν rowCert.2 (hzeros rowCert hrowCert hid)

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
