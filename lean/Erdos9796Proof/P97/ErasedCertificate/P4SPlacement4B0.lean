/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4D5C0
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4D6C0

/-! Native P4-S placement certificate for center 4, deleted labels 5-6,
and support-mask bin 0. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_four_b_chunk_0_eq_true :
    p4sPlacementsAtDeletedPairChunk 4 5 6 0 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_4_deleted_5_chunk_0_eq_true,
    p4sPlacementsAt_4_deleted_6_chunk_0_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
