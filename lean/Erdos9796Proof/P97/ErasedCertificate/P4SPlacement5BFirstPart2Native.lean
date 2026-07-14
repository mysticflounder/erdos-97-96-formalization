/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacementDefs

/-! Native P4-S placement certificate for center 5, deleted labels
5-6, and support chunks 4, 6. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p4sPlacementsAt_five_b_native_first_part_two_eq_true :
    p4sPlacementsAtDeletedPairChunkSet
      5 5 6 [4, 6] = true := by
  rw [← p4sPlacementsAtDeletedPairChunkSetHoisted_eq]
  native_decide

end Problem97.ErasedCertificate.ErasedNativeClassifier
