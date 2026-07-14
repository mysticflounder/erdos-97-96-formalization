/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5ANative

/-! P4-S placement projection for center 5, deleted label 3,
and support-mask bin 1 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_5_deleted_3_chunk_1_eq_true :
    p4sPlacementsAtDeletedChunk 5 3 1 = true := by
  exact
    (p4sPlacementsAtDeletedChunks_eq_true_of_pairChunks
      p4sPlacementsAt_five_a_native_chunks_eq_true
      (by norm_num : 1 < 8)).1

end Problem97.ErasedCertificate.ErasedNativeClassifier
