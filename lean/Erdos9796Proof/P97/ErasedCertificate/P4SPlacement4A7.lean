/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4D3C7
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4D4C7

/-! Native P4-S placement certificate for center 4, deleted labels 3-4,
and support-mask bin 7. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_four_a_chunk_7_eq_true :
    p4sPlacementsAtDeletedPairChunk 4 3 4 7 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_4_deleted_3_chunk_7_eq_true,
    p4sPlacementsAt_4_deleted_4_chunk_7_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
