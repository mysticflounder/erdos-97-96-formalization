/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3A
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3B

/-! Complete native P4-S placement certificate for center 3. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_three_eq_true : p4sPlacementsAt 3 = true := by
  simp [p4sPlacementsAt, p4sPlacementsAt_three_a_eq_true,
    p4sPlacementsAt_three_b_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
