/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3BFirstNative
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3BSecondNative

/-! P4-S pair certificate for center 3 and deleted labels
5-6, assembled from four restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_three_b_native_chunks_eq_true :
    p4sPlacementsAtDeletedPairChunks 3 5 6 = true := by
  exact p4sPlacementsAtDeletedPairChunks_eq_true_of_halves
    p4sPlacementsAt_three_b_native_first_half_eq_true
    p4sPlacementsAt_three_b_native_second_half_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
