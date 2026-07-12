/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifier

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem placementCheck_p6_d3 : placementCheck 6 3 = true := by
  native_decide

end CapSelectedNativeClassifier
end Census554
end Problem97
