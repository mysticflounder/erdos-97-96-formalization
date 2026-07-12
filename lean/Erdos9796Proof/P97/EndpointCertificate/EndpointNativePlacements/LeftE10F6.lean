/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.EndpointNativeClassifier

/-!
# Endpoint native placement chunk: left family, escapee 10, fourth 6

Kernel-checked (`native_decide`) placement-search closures for the endpoint
card-eleven extension lane.  One theorem per deleted-source choice at the fixed
`(family, escapee, fourth)` seed.
-/

namespace Problem97

namespace EndpointCertificate

namespace EndpointNativeClassifier

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem endpointLeftPlacementCheck_e10_f6_d3 :
    endpointLeftPlacementCheck 10 6 3 = true := by
  native_decide

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem endpointLeftPlacementCheck_e10_f6_d4 :
    endpointLeftPlacementCheck 10 6 4 = true := by
  native_decide

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem endpointLeftPlacementCheck_e10_f6_d5 :
    endpointLeftPlacementCheck 10 6 5 = true := by
  native_decide

end EndpointNativeClassifier

end EndpointCertificate

end Problem97
