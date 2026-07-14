/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4ANative

/-! P4-S placement projection for center 4, deleted label 3,
and support-mask bin 3 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_4_deleted_3_chunk_3_eq_true :
    p4sPlacementsAtDeletedChunk 4 3 3 = true := by
  exact
    (p4sPlacementsAtDeletedChunks_eq_true_of_pairChunks
      p4sPlacementsAt_four_a_native_chunks_eq_true
      (by norm_num : 3 < 8)).1

end Problem97.ErasedCertificate.ErasedNativeClassifier
