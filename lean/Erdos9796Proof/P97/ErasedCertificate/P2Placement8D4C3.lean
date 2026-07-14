/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement8ANative

/-! P2 placement projection for center 8, deleted label 4,
and support-mask bin 3 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_8_deleted_4_chunk_3_eq_true :
    p2PlacementsAtDeletedChunk 8 4 3 = true := by
  exact
    (p2PlacementsAtDeletedChunks_eq_true_of_pairChunks
      p2PlacementsAt_eight_a_native_chunks_eq_true
      (by norm_num : 3 < 8)).2

end Problem97.ErasedCertificate.ErasedNativeClassifier
