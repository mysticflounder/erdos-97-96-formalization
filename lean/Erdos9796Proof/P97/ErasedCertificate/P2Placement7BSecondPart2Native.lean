/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2PlacementDefs

/-! Native P2 placement certificate for center 7, deleted labels
5-6, and support chunks 4, 7. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p2PlacementsAt_seven_b_native_second_part_two_eq_true :
    p2PlacementsAtDeletedPairChunkSet
      7 5 6 [4, 7] = true := by
  rw [← p2PlacementsAtDeletedPairChunkSetHoisted_eq]
  native_decide

end Problem97.ErasedCertificate.ErasedNativeClassifier
