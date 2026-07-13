/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacementDefs

/-! Native P4-S placement certificate for center 3, deleted label 6,
and support-mask bin 5. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxHeartbeats 0 in
-- Native evaluation closes one bounded finite certificate shard.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p4sPlacementsAt_3_deleted_6_chunk_5_eq_true :
    p4sPlacementsAtDeletedChunk 3 6 5 = true := by
  native_decide

end Problem97.ErasedCertificate.ErasedNativeClassifier
