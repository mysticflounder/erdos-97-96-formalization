/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement7ANative

/-! P2 placement projection for center 7, deleted label 3,
and support-mask bin 7 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_7_deleted_3_chunk_7_eq_true :
    p2PlacementsAtDeletedChunk 7 3 7 = true := by
  exact
    (p2PlacementsAtDeletedChunks_eq_true_of_pairChunks
      p2PlacementsAt_seven_a_native_chunks_eq_true
      (by norm_num : 7 < 8)).1

end Problem97.ErasedCertificate.ErasedNativeClassifier
