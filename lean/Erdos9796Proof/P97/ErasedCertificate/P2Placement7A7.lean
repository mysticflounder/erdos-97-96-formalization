/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement7D3C7
import Erdos9796Proof.P97.ErasedCertificate.P2Placement7D4C7

/-! P2 deleted-pair aggregator for center 7, deleted labels 3-4,
and support-mask bin 7. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_seven_a_chunk_7_eq_true :
    p2PlacementsAtDeletedPairChunk 7 3 4 7 = true := by
  simp [p2PlacementsAtDeletedPairChunk,
    p2PlacementsAt_7_deleted_3_chunk_7_eq_true,
    p2PlacementsAt_7_deleted_4_chunk_7_eq_true]

end Problem97.ErasedCertificate.ErasedNativeClassifier
