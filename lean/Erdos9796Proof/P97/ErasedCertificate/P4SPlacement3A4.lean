/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3D3C4
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3D4C4

/-! Native P4-S placement certificate for center 3, deleted labels 3-4,
and support-mask bin 4. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_three_a_chunk_4_eq_true :
    p4sPlacementsAtDeletedPairChunk 3 3 4 4 = true := by
  simp [p4sPlacementsAtDeletedPairChunk,
    p4sPlacementsAt_3_deleted_3_chunk_4_eq_true,
    p4sPlacementsAt_3_deleted_4_chunk_4_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
