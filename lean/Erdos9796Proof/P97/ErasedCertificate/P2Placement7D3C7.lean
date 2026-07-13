/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2PlacementDefs

/-! Native P2 placement certificate for center 7, deleted label 3,
and support-mask bin 7. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxHeartbeats 0 in
-- Native evaluation closes one bounded finite certificate shard.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p2PlacementsAt_7_deleted_3_chunk_7_eq_true :
    p2PlacementsAtDeletedChunk 7 3 7 = true := by
  native_decide

end Problem97.ErasedCertificate.ErasedNativeClassifier
