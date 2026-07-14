/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement9BNative

/-! P2 placement certificate for center 9 and deleted labels
5-6, projected directly from the pair-wide native result. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_nine_b_chunks_eq_true :
    p2PlacementsAtDeletedPairChunks 9 5 6 = true :=
  p2PlacementsAt_nine_b_native_chunks_eq_true

theorem p2PlacementsAt_nine_b_eq_true :
    p2PlacementsAtDeletedPair 9 5 6 = true := by
  exact p2PlacementsAtDeletedPair_eq_true_of_chunks
    p2PlacementsAt_nine_b_chunks_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
