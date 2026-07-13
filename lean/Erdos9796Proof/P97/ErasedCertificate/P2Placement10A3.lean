/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement10D3C3
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10D4C3

/-! P2 deleted-pair aggregator for center 10, deleted labels 3-4,
and support-mask bin 3. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_ten_a_chunk_3_eq_true :
    p2PlacementsAtDeletedPairChunk 10 3 4 3 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_10_deleted_3_chunk_3_eq_true,
    p2PlacementsAt_10_deleted_4_chunk_3_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
