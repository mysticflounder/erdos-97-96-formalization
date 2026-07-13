/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement7D5C5
import Erdos9796Proof.P97.ErasedCertificate.P2Placement7D6C5

/-! P2 deleted-pair aggregator for center 7, deleted labels 5-6,
and support-mask bin 5. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_seven_b_chunk_5_eq_true :
    p2PlacementsAtDeletedPairChunk 7 5 6 5 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_7_deleted_5_chunk_5_eq_true,
    p2PlacementsAt_7_deleted_6_chunk_5_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
