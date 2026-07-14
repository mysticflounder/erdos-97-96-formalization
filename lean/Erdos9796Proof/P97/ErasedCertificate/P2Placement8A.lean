/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement8ANative

/-! P2 placement certificate for center 8 and deleted labels
3-4, projected directly from the pair-wide native result. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_eight_a_chunks_eq_true :
    p2PlacementsAtDeletedPairChunks 8 3 4 = true :=
  p2PlacementsAt_eight_a_native_chunks_eq_true

theorem p2PlacementsAt_eight_a_eq_true :
    p2PlacementsAtDeletedPair 8 3 4 = true := by
  exact p2PlacementsAtDeletedPair_eq_true_of_chunks
    p2PlacementsAt_eight_a_chunks_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
