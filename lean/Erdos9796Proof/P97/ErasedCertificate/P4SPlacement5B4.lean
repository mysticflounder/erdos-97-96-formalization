/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5D5C4
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5D6C4

/-! Native P4-S placement certificate for center 5, deleted labels 5-6,
and support-mask bin 4. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_five_b_chunk_4_eq_true :
    p4sPlacementsAtDeletedPairChunk 5 5 6 4 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_5_deleted_5_chunk_4_eq_true,
    p4sPlacementsAt_5_deleted_6_chunk_4_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
