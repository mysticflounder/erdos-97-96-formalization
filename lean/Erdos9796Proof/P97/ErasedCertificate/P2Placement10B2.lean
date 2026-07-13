/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement10D5C2
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10D6C2

/-! P2 deleted-pair aggregator for center 10, deleted labels 5-6,
and support-mask bin 2. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_ten_b_chunk_2_eq_true :
    p2PlacementsAtDeletedPairChunk 10 5 6 2 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_10_deleted_5_chunk_2_eq_true,
    p2PlacementsAt_10_deleted_6_chunk_2_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
