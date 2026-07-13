/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6D3C3
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6D4C3

/-! Native P4-S placement certificate for center 6, deleted labels 3-4,
and support-mask bin 3. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_six_a_chunk_3_eq_true :
    p4sPlacementsAtDeletedPairChunk 6 3 4 3 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_6_deleted_3_chunk_3_eq_true,
    p4sPlacementsAt_6_deleted_4_chunk_3_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
