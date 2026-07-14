/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement10AFirstNative
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10ASecondNative

/-! P2 pair certificate for center 10 and deleted labels
3-4, assembled from four restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxRecDepth 100000 in
theorem p2PlacementsAt_ten_a_native_chunks_eq_true :
    p2PlacementsAtDeletedPairChunks 10 3 4 = true := by
  exact p2PlacementsAtDeletedPairChunks_eq_true_of_halves
    p2PlacementsAt_ten_a_native_first_half_eq_true
    p2PlacementsAt_ten_a_native_second_half_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
