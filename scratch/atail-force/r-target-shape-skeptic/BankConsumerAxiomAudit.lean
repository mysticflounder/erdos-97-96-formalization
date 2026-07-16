/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RVOL.P97.U1kOppositeEndpoint

/-!
# Focused axiom audit for the sibling cap-order bank

This file imports, but does not reproduce, the sibling `p97-rvol` cap-order bank.  The
printed endpoints distinguish the consequences of one already-produced same-cap edge
from the genuinely contradictory terminal packets.
-/

namespace Problem97

#check SameCapIncompatibleEdge
#check source_pushout_right
#check source_pushout_left
#check samecap_wrongSide_right_contradiction
#check samecap_wrongSide_left_contradiction
#check ConsecutiveOppositeEndpointEdges.b2a1e_disjoint_fires_exit
#check ConsecutiveOppositeEndpointEdges.b2a1_fires_exit
#check strictLapPacket_nonreturn

#print axioms source_pushout_right
#print axioms source_pushout_left
#print axioms samecap_wrongSide_right_contradiction
#print axioms samecap_wrongSide_left_contradiction
#print axioms ConsecutiveOppositeEndpointEdges.b2a1e_disjoint_fires_exit
#print axioms ConsecutiveOppositeEndpointEdges.b2a1_fires_exit
#print axioms strictLapPacket_nonreturn

end Problem97
