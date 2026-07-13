/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5D3C0
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5D4C0

/-! Native P4-S placement certificate for center 5, deleted labels 3-4,
and support-mask bin 0. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_five_a_chunk_0_eq_true :
    p4sPlacementsAtDeletedPairChunk 5 3 4 0 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_5_deleted_3_chunk_0_eq_true,
    p4sPlacementsAt_5_deleted_4_chunk_0_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
