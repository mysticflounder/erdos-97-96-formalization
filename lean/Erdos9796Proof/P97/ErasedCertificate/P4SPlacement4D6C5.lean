/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4BNative

/-! P4-S placement projection for center 4, deleted label 6,
and support-mask bin 5 from the pair-wide native certificate. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_4_deleted_6_chunk_5_eq_true :
    p4sPlacementsAtDeletedChunk 4 6 5 = true := by
  exact
    (p4sPlacementsAtDeletedChunks_eq_true_of_pairChunks
      p4sPlacementsAt_four_b_native_chunks_eq_true
      (by norm_num : 5 < 8)).2

end Problem97.ErasedCertificate.ErasedNativeClassifier
