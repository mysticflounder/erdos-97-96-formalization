/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5A
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5B

/-! Complete native P4-S placement certificate for center 5. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_five_eq_true : p4sPlacementsAt 5 = true := by
  simp [p4sPlacementsAt, p4sPlacementsAt_five_a_eq_true,
    p4sPlacementsAt_five_b_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
