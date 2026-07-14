/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5BNative

/-! P4-S placement certificate for center 5 and deleted labels
5-6, projected directly from the pair-wide native result. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxRecDepth 100000 in
theorem p4sPlacementsAt_five_b_chunks_eq_true :
    p4sPlacementsAtDeletedPairChunks 5 5 6 = true :=
  p4sPlacementsAt_five_b_native_chunks_eq_true

theorem p4sPlacementsAt_five_b_eq_true :
    p4sPlacementsAtDeletedPair 5 5 6 = true := by
  exact p4sPlacementsAtDeletedPair_eq_true_of_chunks
    p4sPlacementsAt_five_b_chunks_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
