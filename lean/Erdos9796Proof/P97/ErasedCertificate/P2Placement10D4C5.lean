/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement10ANative

/-! P2 placement projection for center 10, deleted label 4,
and support-mask bin 5 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_10_deleted_4_chunk_5_eq_true :
    p2PlacementsAtDeletedChunk 10 4 5 = true := by
  exact
    (p2PlacementsAtDeletedChunks_eq_true_of_pairChunks
      p2PlacementsAt_ten_a_native_chunks_eq_true
      (by norm_num : 5 < 8)).2

end Problem97.ErasedCertificate.ErasedNativeClassifier
