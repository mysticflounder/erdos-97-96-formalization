/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SelectedFourClassOneBoundaryIntersection

/-!
# Focused checks for the one-boundary selected-row helper

The test module keeps the public declaration and its kernel axiom probe at a
small import boundary; it does not instantiate an exact-thirteen source cell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SelectedFourClass

#check inter_card_le_one_of_mem_boundary_apex
#print axioms inter_card_le_one_of_mem_boundary_apex

end SelectedFourClass
end Problem97
