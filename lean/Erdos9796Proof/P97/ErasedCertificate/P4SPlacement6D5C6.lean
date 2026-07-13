/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacementDefs

/-! Native P4-S placement certificate for center 6, deleted label 5,
and support-mask bin 6. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

set_option maxHeartbeats 0 in
-- Native evaluation closes one bounded finite certificate shard.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p4sPlacementsAt_6_deleted_5_chunk_6_eq_true :
    p4sPlacementsAtDeletedChunk 6 5 6 = true := by
  native_decide

end Problem97.ErasedCertificate.ErasedNativeClassifier
