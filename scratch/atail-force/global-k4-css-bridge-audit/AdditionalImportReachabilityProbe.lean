/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U5GlobalIncidenceSupport
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Current-worktree declarations requiring imports beyond the parent packet

These checks are intentionally separate from `ImportReachabilityProbe.lean`.
They establish that the declarations are current-worktree, source-reachable
results, but not part of the live parent packet's two-import environment.
-/

#check Problem97.U5QAllowedK4Class.exists_card_four_of_globalK4
#check Problem97.U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
#check Problem97.U5QAllowedAuditSupport.two_le_selected_inter_anchorSupport_erase_center_card
#check Problem97.U5QAllowedConfinedK4AuditPayload.toAuditedSupport

#check Problem97.Census554.GeneralCarrierBridge.blocker_row_support_eq_shell
#check Problem97.Census554.GeneralCarrierBridge.source_mem_blocker_row

