/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import NonEquilateralGeometryConsumer

/-!
# Scratch: import-reachable strict-witness bank candidates

This file records only declarations already visible from the exact
non-equilateral consumer import surface.  It does not claim that any of them
constructs `StrictWitnessBankCompletion`.
-/

namespace Problem97

#check SelectedFourClass.exists_gauge_witness
#check u2_sharedBase_strictWitness_elim
#check eq_of_equidistant_three_noncollinear
#check U5QDeletedK4Class.inter_card_le_two
#check U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility

#print axioms SelectedFourClass.exists_gauge_witness
#print axioms u2_sharedBase_strictWitness_elim
#print axioms eq_of_equidistant_three_noncollinear
#print axioms U5QDeletedK4Class.inter_card_le_two
#print axioms U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility

end Problem97
