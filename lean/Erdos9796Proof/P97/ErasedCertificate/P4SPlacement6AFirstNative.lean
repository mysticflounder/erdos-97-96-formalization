/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6AFirstPart1Native
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6AFirstPart2Native

/-! P4-S placement certificate for center 6, deleted labels
3-4, assembled from two restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxRecDepth 100000 in
theorem p4sPlacementsAt_six_a_native_first_half_eq_true :
    p4sPlacementsAtDeletedPairChunkSet
      6 3 4 [1, 3, 4, 6] = true := by
  exact p4sPlacementsAtDeletedPairChunkSet_append_eq_true
    p4sPlacementsAt_six_a_native_first_part_one_eq_true
    p4sPlacementsAt_six_a_native_first_part_two_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
