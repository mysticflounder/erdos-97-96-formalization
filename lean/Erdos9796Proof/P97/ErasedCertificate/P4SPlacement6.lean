/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6A
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6B

/-! Complete native P4-S placement certificate for center 6. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_six_eq_true : p4sPlacementsAt 6 = true := by
  simp [p4sPlacementsAt, p4sPlacementsAt_six_a_eq_true,
    p4sPlacementsAt_six_b_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
