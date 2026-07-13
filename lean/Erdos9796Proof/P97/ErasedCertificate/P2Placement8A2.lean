/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement8D3C2
import Erdos9796Proof.P97.ErasedCertificate.P2Placement8D4C2

/-! P2 deleted-pair aggregator for center 8, deleted labels 3-4,
and support-mask bin 2. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_eight_a_chunk_2_eq_true :
    p2PlacementsAtDeletedPairChunk 8 3 4 2 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_8_deleted_3_chunk_2_eq_true,
    p2PlacementsAt_8_deleted_4_chunk_2_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
