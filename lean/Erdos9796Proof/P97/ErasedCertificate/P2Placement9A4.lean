/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement9D3C4
import Erdos9796Proof.P97.ErasedCertificate.P2Placement9D4C4

/-! P2 deleted-pair aggregator for center 9, deleted labels 3-4,
and support-mask bin 4. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_nine_a_chunk_4_eq_true :
    p2PlacementsAtDeletedPairChunk 9 3 4 4 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_9_deleted_3_chunk_4_eq_true,
    p2PlacementsAt_9_deleted_4_chunk_4_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
