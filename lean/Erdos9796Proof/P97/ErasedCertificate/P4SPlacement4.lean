/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4A
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B

/-! Complete native P4-S placement certificate for center 4. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_four_eq_true : p4sPlacementsAt 4 = true := by
  simp [p4sPlacementsAt, p4sPlacementsAt_four_a_eq_true,
    p4sPlacementsAt_four_b_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
