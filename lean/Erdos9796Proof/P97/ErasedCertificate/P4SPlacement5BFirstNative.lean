/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5BFirstPart1Native
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5BFirstPart2Native

/-! P4-S placement certificate for center 5, deleted labels
5-6, assembled from two restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_five_b_native_first_half_eq_true :
    p4sPlacementsAtDeletedPairChunkSet
      5 5 6 [1, 3, 4, 6] = true := by
  exact p4sPlacementsAtDeletedPairChunkSet_append_eq_true
    p4sPlacementsAt_five_b_native_first_part_one_eq_true
    p4sPlacementsAt_five_b_native_first_part_two_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
