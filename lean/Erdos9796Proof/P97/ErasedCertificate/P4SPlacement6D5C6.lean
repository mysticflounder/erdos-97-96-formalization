/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6BNative

/-! P4-S placement projection for center 6, deleted label 5,
and support-mask bin 6 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_6_deleted_5_chunk_6_eq_true :
    p4sPlacementsAtDeletedChunk 6 5 6 = true := by
  exact
    (p4sPlacementsAtDeletedChunks_eq_true_of_pairChunks
      p4sPlacementsAt_six_b_native_chunks_eq_true
      (by norm_num : 6 < 8)).1

end Problem97.ErasedCertificate.ErasedNativeClassifier
