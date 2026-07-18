/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Full-parent all-center K4 extraction delta audit

The existing scratch
`generic-biapex-kalmanson-search/WholeCarrierBiApexKalmansonSurface.lean`
already extracts the profile-independent boundary indexing, one global K4 row
at every center, the common critical system, both apex omissions, strong
connectivity, exact blocker rows, and Kalmanson inequalities.  This file does
not duplicate that surface.

It records only two deltas needed by the present audit:

* a compact blocker-row manifest exposing full deletion-criticality in
  addition to support exactness; and
* the cap-cardinality obstruction preventing the fixed `(8,4,5)` saved stream
  from being a role-faithful image of the live large-opposite-caps parent.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FullParentGlobalK4ExtractionAudit

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailLargeOppositeCapsBiApexSurface
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The complete theorem-derived payload at one actual blocker row.

The support equality and source membership connect an arbitrary global K4 row
table to the common critical map.  `deletion_blocked` is strictly more
information than ambient exactness of this one radius class: it rules out
every K4 radius after deleting the source. -/
structure BlockerRowManifest
    {D : CounterexampleData}
    (P : FaithfulCarrierPattern D.A)
    (H : CriticalShellSystem D.A)
    (source : CarrierLabel D.A) : Prop where
  support_eq_critical :
    (P.classAt (blockerLabel H source.1 source.2).1
      (blockerLabel H source.1 source.2).2).support =
      (H.selectedAt source.1 source.2).toCriticalFourShell.support
  source_mem_row :
    source.1 ∈
      (P.classAt (blockerLabel H source.1 source.2).1
        (blockerLabel H source.1 source.2).2).support
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source.1)
        (H.centerAt source.1 source.2)

/-- Every source in every faithful all-center K4 table has the complete
blocker-row manifest.  There is no additional occurrence assumption here. -/
theorem blockerRowManifest
    {D : CounterexampleData}
    (P : FaithfulCarrierPattern D.A)
    (H : CriticalShellSystem D.A)
    (source : CarrierLabel D.A) :
    BlockerRowManifest P H source := by
  refine {
    support_eq_critical :=
      blocker_row_support_eq_shell P H source.1 source.2
    source_mem_row := ?_
    deletion_blocked := H.no_qfree_at source.1 source.2 }
  rw [blocker_row_support_eq_shell P H source.1 source.2]
  exact (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support

/-- The manifest is uniform over the complete carrier source type and hence
can be exported directly as the exact/deletion-critical part of an
arbitrary-cardinality K4-completion or MUS search object. -/
theorem all_blockerRowManifests
    {D : CounterexampleData}
    (P : FaithfulCarrierPattern D.A)
    (H : CriticalShellSystem D.A) :
    ∀ source : CarrierLabel D.A, BlockerRowManifest P H source :=
  blockerRowManifest P H

/-- The saved fixed `(8,4,5)` surface cannot be a role-faithful codomain for
the live large-opposite-caps branch: in that surface one of the two opposite
caps has cardinality four, whereas the live parent requires both to have
cardinality at least six.  The disjunction covers swapping the two opposite
cap names. -/
theorem no_fixed_profile_with_opposite_cap_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (hfour : S.oppCap1.card = 4 ∨ S.oppCap2.card = 4) : False := by
  rcases hfour with hfirst | hsecond
  · have hsix := L.firstOppCap_card_ge_six
    rw [hfirst] at hsix
    omega
  · have hsix := L.secondOppCap_card_ge_six
    rw [hsecond] at hsix
    omega

#print axioms blockerRowManifest
#print axioms all_blockerRowManifests
#print axioms no_fixed_profile_with_opposite_cap_card_four

end FullParentGlobalK4ExtractionAudit
end Problem97
