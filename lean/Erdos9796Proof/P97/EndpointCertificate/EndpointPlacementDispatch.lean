/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE9F2
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE9F3
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE9F4
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE9F5
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE9F6
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE10F2
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE10F3
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE10F4
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE10F5
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.LeftE10F6
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE7F1
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE7F3
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE7F4
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE7F5
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE7F6
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE8F1
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE8F3
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE8F4
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE8F5
import Erdos9796Proof.P97.EndpointCertificate.EndpointNativePlacements.RightE8F6
import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode

/-!
# Endpoint native placement dispatchers (card-eleven extension lane)

Per-family aggregate dispatchers collapsing the 64 kernel-checked
(`native_decide`) placement-search closures in `EndpointNativePlacements/` into a
single seed-quantified fact over the canonical `Fin 11` label vocabulary.
Mirrors `Census554.CapSelectedNativeClosureSound.placementCheck_of_interior`.
-/

namespace Problem97

namespace EndpointCertificate

namespace EndpointNativeClassifier

open Census554.CapSelectedFiniteCode

set_option maxHeartbeats 0 in
-- Case-splits every left seed placement onto its native placement closure.
theorem endpointLeftPlacementCheck_of_seed
    {escapee fourth deleted : Label}
    (he : escapee ∈ intO2) (hf : fourth ∈ insert 2 intS)
    (hd : deleted ∈ intS) (hfd : fourth ≠ deleted) :
    endpointLeftPlacementCheck escapee.val fourth.val deleted.val = true := by
  fin_cases escapee <;> fin_cases fourth <;> fin_cases deleted <;>
    simp_all [intO2, intS,
      endpointLeftPlacementCheck_e9_f2_d3,
      endpointLeftPlacementCheck_e9_f2_d4,
      endpointLeftPlacementCheck_e9_f2_d5,
      endpointLeftPlacementCheck_e9_f2_d6,
      endpointLeftPlacementCheck_e9_f3_d4,
      endpointLeftPlacementCheck_e9_f3_d5,
      endpointLeftPlacementCheck_e9_f3_d6,
      endpointLeftPlacementCheck_e9_f4_d3,
      endpointLeftPlacementCheck_e9_f4_d5,
      endpointLeftPlacementCheck_e9_f4_d6,
      endpointLeftPlacementCheck_e9_f5_d3,
      endpointLeftPlacementCheck_e9_f5_d4,
      endpointLeftPlacementCheck_e9_f5_d6,
      endpointLeftPlacementCheck_e9_f6_d3,
      endpointLeftPlacementCheck_e9_f6_d4,
      endpointLeftPlacementCheck_e9_f6_d5,
      endpointLeftPlacementCheck_e10_f2_d3,
      endpointLeftPlacementCheck_e10_f2_d4,
      endpointLeftPlacementCheck_e10_f2_d5,
      endpointLeftPlacementCheck_e10_f2_d6,
      endpointLeftPlacementCheck_e10_f3_d4,
      endpointLeftPlacementCheck_e10_f3_d5,
      endpointLeftPlacementCheck_e10_f3_d6,
      endpointLeftPlacementCheck_e10_f4_d3,
      endpointLeftPlacementCheck_e10_f4_d5,
      endpointLeftPlacementCheck_e10_f4_d6,
      endpointLeftPlacementCheck_e10_f5_d3,
      endpointLeftPlacementCheck_e10_f5_d4,
      endpointLeftPlacementCheck_e10_f5_d6,
      endpointLeftPlacementCheck_e10_f6_d3,
      endpointLeftPlacementCheck_e10_f6_d4,
      endpointLeftPlacementCheck_e10_f6_d5]

set_option maxHeartbeats 0 in
-- Case-splits every right seed placement onto its native placement closure.
theorem endpointRightPlacementCheck_of_seed
    {escapee fourth deleted : Label}
    (he : escapee ∈ intO1) (hf : fourth ∈ insert 1 intS)
    (hd : deleted ∈ intS) (hfd : fourth ≠ deleted) :
    endpointRightPlacementCheck escapee.val fourth.val deleted.val = true := by
  fin_cases escapee <;> fin_cases fourth <;> fin_cases deleted <;>
    simp_all [intO1, intS,
      endpointRightPlacementCheck_e7_f1_d3,
      endpointRightPlacementCheck_e7_f1_d4,
      endpointRightPlacementCheck_e7_f1_d5,
      endpointRightPlacementCheck_e7_f1_d6,
      endpointRightPlacementCheck_e7_f3_d4,
      endpointRightPlacementCheck_e7_f3_d5,
      endpointRightPlacementCheck_e7_f3_d6,
      endpointRightPlacementCheck_e7_f4_d3,
      endpointRightPlacementCheck_e7_f4_d5,
      endpointRightPlacementCheck_e7_f4_d6,
      endpointRightPlacementCheck_e7_f5_d3,
      endpointRightPlacementCheck_e7_f5_d4,
      endpointRightPlacementCheck_e7_f5_d6,
      endpointRightPlacementCheck_e7_f6_d3,
      endpointRightPlacementCheck_e7_f6_d4,
      endpointRightPlacementCheck_e7_f6_d5,
      endpointRightPlacementCheck_e8_f1_d3,
      endpointRightPlacementCheck_e8_f1_d4,
      endpointRightPlacementCheck_e8_f1_d5,
      endpointRightPlacementCheck_e8_f1_d6,
      endpointRightPlacementCheck_e8_f3_d4,
      endpointRightPlacementCheck_e8_f3_d5,
      endpointRightPlacementCheck_e8_f3_d6,
      endpointRightPlacementCheck_e8_f4_d3,
      endpointRightPlacementCheck_e8_f4_d5,
      endpointRightPlacementCheck_e8_f4_d6,
      endpointRightPlacementCheck_e8_f5_d3,
      endpointRightPlacementCheck_e8_f5_d4,
      endpointRightPlacementCheck_e8_f5_d6,
      endpointRightPlacementCheck_e8_f6_d3,
      endpointRightPlacementCheck_e8_f6_d4,
      endpointRightPlacementCheck_e8_f6_d5]

end EndpointNativeClassifier

end EndpointCertificate

end Problem97
