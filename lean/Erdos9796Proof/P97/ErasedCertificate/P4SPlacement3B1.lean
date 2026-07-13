/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3D5C1
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3D6C1

/-! Native P4-S placement certificate for center 3, deleted labels 5-6,
and support-mask bin 1. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_three_b_chunk_1_eq_true :
    p4sPlacementsAtDeletedPairChunk 3 5 6 1 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_3_deleted_5_chunk_1_eq_true,
    p4sPlacementsAt_3_deleted_6_chunk_1_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
