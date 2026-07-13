/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6D5C5
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6D6C5

/-! Native P4-S placement certificate for center 6, deleted labels 5-6,
and support-mask bin 5. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_six_b_chunk_5_eq_true :
    p4sPlacementsAtDeletedPairChunk 6 5 6 5 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_6_deleted_5_chunk_5_eq_true,
    p4sPlacementsAt_6_deleted_6_chunk_5_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
