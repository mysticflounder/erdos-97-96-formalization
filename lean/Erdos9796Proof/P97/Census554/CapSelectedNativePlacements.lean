/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P3D4
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P3D5
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P3D6
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P4D3
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P4D5
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P4D6
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P5D3
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P5D4
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P5D6
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P6D3
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements.P6D5

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifier

/-- All twelve ordered choices of distinct pinned and deleted surplus-interior
labels are rejected by the native finite classifier. -/
theorem allPlacementChecks :
    placementCheck 3 4 = true /\
    placementCheck 3 5 = true /\
    placementCheck 3 6 = true /\
    placementCheck 4 3 = true /\
    placementCheck 4 5 = true /\
    placementCheck 4 6 = true /\
    placementCheck 5 3 = true /\
    placementCheck 5 4 = true /\
    placementCheck 5 6 = true /\
    placementCheck 6 3 = true /\
    placementCheck 6 4 = true /\
    placementCheck 6 5 = true :=
  ⟨placementCheck_p3_d4, placementCheck_p3_d5, placementCheck_p3_d6,
    placementCheck_p4_d3, placementCheck_p4_d5, placementCheck_p4_d6,
    placementCheck_p5_d3, placementCheck_p5_d4, placementCheck_p5_d6,
    placementCheck_p6_d3, placementCheck_p6_d4, placementCheck_p6_d5⟩

end CapSelectedNativeClassifier
end Census554
end Problem97
