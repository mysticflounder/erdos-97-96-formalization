/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement9D5C3
import Erdos9796Proof.P97.ErasedCertificate.P2Placement9D6C3

/-! P2 deleted-pair aggregator for center 9, deleted labels 5-6,
and support-mask bin 3. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_nine_b_chunk_3_eq_true :
    p2PlacementsAtDeletedPairChunk 9 5 6 3 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_9_deleted_5_chunk_3_eq_true,
    p2PlacementsAt_9_deleted_6_chunk_3_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
