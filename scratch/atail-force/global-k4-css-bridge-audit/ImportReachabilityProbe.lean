/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Parent-import reachability probe for the robust ATAIL bridge

This scratch file intentionally uses exactly the two production imports used by
`parent-transport-extraction/ParentTransportExtraction.lean`.  The successful
checks below distinguish declarations available to that packet from results
that require an additional production or sibling-worktree import.
-/

#check Problem97.CriticalShellSystem.source_mem_selectedFourClass
#check Problem97.CriticalShellSystem.selectedFourClass_support_eq_shell
#check Problem97.CriticalShellSystem.exists_blocker_cycle

#check Problem97.ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
#check Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
#check Problem97.ATailCriticalPairFrontier.cross_survival_unique_radius_and_exact_support

#check Problem97.exists_faithfulCarrierPattern_of_globalK4
#check Problem97.exists_faithfulCarrierPattern_with_two_classes

#check Problem97.U1Depth5.PacketLabelCenteredRows.record001QTShellSupport_ofGlobalK4
