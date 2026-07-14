/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement8ANative

/-! P2 placement projection for center 8, deleted label 3,
and support-mask bin 2 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_8_deleted_3_chunk_2_eq_true :
    p2PlacementsAtDeletedChunk 8 3 2 = true := by
  exact
    (p2PlacementsAtDeletedChunks_eq_true_of_pairChunks
      p2PlacementsAt_eight_a_native_chunks_eq_true
      (by norm_num : 2 < 8)).1

end Problem97.ErasedCertificate.ErasedNativeClassifier
