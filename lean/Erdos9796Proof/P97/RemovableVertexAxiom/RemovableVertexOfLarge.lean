/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.Continuation
import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusBank

/-!
# Removable-vertex existence for `|A| > 9` — bank composition

This shard composes the continuation branch with the pinned-surplus
row-zero bank consumer (`isM44PinnedSurplusResidualsExcluded`).  It is the
only module in the continuation lane that imports
`PinnedSurplusBank` — and, through it, the generated
`SurplusCertificate.*` forest — so the `Continuation` edit loop does not
rebuild the certificate bank.  Keep bank-dependent composition here.
-/

namespace Problem97

/-- `IsM44` surplus-cap packets close the removable-vertex branch after the
  endpoint residuals, pinned surplus-family residuals, and
  containment-to-removable extraction are discharged.  This is consumed by
  `RemovableVertexOfLarge_from_threeWaySplit`. -/
theorem removableVertexOfLarge_of_isM44PinnedSurplus :
      IsM44PinnedSurplusBranchStatement :=
    removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit
      isM44EndpointResidualsExcluded
      isM44PinnedSurplusResidualsExcluded
      isM44NonSurplusContainmentRemovable

/-- Remaining removable-vertex obligation with the finite pinned-surplus bank
handoff available as a closed input.  It is now routed through the three-way
split into packet extraction, the `IsM44` pinned-surplus branch, and the
non-`IsM44` descent branch. -/
theorem RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank :
    RemovableVertexOfLargeFromPinnedSurplusCOMPGBankStatement :=
  RemovableVertexOfLarge_from_threeWaySplit
    largeK4SurplusCapPacket
    removableVertexOfLarge_of_isM44PinnedSurplus
    removableVertexOfLarge_of_nonIsM44

/-- **Removable-vertex existence for `|A| > 9` counterexamples.**
This is now wired through the finite pinned-surplus COMP-G bank bridge; the
open work is
the three obligations consumed by
`RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`. -/
theorem RemovableVertexOfLarge : RemovableVertexOfLargeStatement :=
  RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank
    pinnedSurplusCOMPGBankBridge


end Problem97
