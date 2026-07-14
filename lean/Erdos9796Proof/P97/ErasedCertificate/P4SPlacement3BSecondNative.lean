/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3BSecondPart1Native
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3BSecondPart2Native

/-! P4-S placement certificate for center 3, deleted labels
5-6, assembled from two restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxRecDepth 100000 in
theorem p4sPlacementsAt_three_b_native_second_half_eq_true :
    p4sPlacementsAtDeletedPairChunkSet
      3 5 6 [0, 2, 5, 7] = true := by
  exact p4sPlacementsAtDeletedPairChunkSet_append_eq_true
    p4sPlacementsAt_three_b_native_second_part_one_eq_true
    p4sPlacementsAt_three_b_native_second_part_two_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
