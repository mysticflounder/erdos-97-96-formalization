/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement9AFirstPart1Native
import Erdos9796Proof.P97.ErasedCertificate.P2Placement9AFirstPart2Native

/-! P2 placement certificate for center 9, deleted labels
3-4, assembled from two restartable two-chunk native units. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxRecDepth 100000 in
theorem p2PlacementsAt_nine_a_native_first_half_eq_true :
    p2PlacementsAtDeletedPairChunkSet
      9 3 4 [0, 1, 5, 6] = true := by
  exact p2PlacementsAtDeletedPairChunkSet_append_eq_true
    p2PlacementsAt_nine_a_native_first_part_one_eq_true
    p2PlacementsAt_nine_a_native_first_part_two_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
