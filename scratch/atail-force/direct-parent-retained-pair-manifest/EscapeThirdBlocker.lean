/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionEscape
import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Third-blocker fact for the direct-parent retained-pair audit

This scratch theorem records the source-faithful consequence used by the
direct-parent manifest.  It is deliberately not a production adapter: its
only purpose is to validate the role constraint before a terminal geometry
producer is chosen.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailDirectParentRetainedPairManifest

open ATailCriticalPairFrontier
open ATailFrontierCommonDeletionEscape
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- An off-confinement escape has a blocker different from both of the two
known centers on the directed cross-membership arm. -/
theorem escape_blocker_ne_known_pair_centers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R)
    (escape : FrontierSecondRowOffConfinementEscape R.common) :
    H.centerAt escape.point escape.point_mem_A ≠ S.oppApex1 ∧
      H.centerAt escape.point escape.point_mem_A ≠
        H.centerAt F.pair.q F.pair.q_mem_A := by
  constructor
  · exact B.firstApex_robust.centerAt_ne H escape.point escape.point_mem_A
  · intro hcenter
    apply H.no_qfree_at escape.point escape.point_mem_A
    simpa only [hcenter] using escape.actualBlocker_survives_deleting_point

#print axioms escape_blocker_ne_known_pair_centers

end ATailDirectParentRetainedPairManifest
end Problem97
