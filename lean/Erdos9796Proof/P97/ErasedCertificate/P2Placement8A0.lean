/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement8D3C0
import Erdos9796Proof.P97.ErasedCertificate.P2Placement8D4C0

/-! P2 deleted-pair aggregator for center 8, deleted labels 3-4,
and support-mask bin 0. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_eight_a_chunk_0_eq_true :
    p2PlacementsAtDeletedPairChunk 8 3 4 0 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_8_deleted_3_chunk_0_eq_true,
    p2PlacementsAt_8_deleted_4_chunk_0_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
