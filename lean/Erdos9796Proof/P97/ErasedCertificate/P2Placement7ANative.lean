/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement7AFirstNative
import Erdos9796Proof.P97.ErasedCertificate.P2Placement7ASecondNative

/-! P2 pair certificate for center 7 and deleted labels
3-4, assembled from four restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_seven_a_native_chunks_eq_true :
    p2PlacementsAtDeletedPairChunks 7 3 4 = true := by
  exact p2PlacementsAtDeletedPairChunks_eq_true_of_halves
    p2PlacementsAt_seven_a_native_first_half_eq_true
    p2PlacementsAt_seven_a_native_second_half_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
