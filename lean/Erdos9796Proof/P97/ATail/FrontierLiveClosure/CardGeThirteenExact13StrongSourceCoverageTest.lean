/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13StrongSourceCoverage

/-! Focused checks for the exact-13 strong-valid source refinement. -/

namespace Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13StrongSourceCoverage

open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13WeightedProviderBankBridge

example (k : Key) (hk : StrongValid k) : k.Valid := hk.1

example (k : Key) (hk : StrongValid k) : GlobalOneBoundaryValid k := hk.2

#check globalOneBoundaryValid_of_source
#check exists_mem_strongValidKeys
#check bankCovers_of_strongValidKeyCover
#check SelectedFourClass.inter_card_le_one_of_mem_boundary_apex

#print axioms globalOneBoundaryValid_of_source
#print axioms exists_mem_strongValidKeys
#print axioms bankCovers_of_strongValidKeyCover

end Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13StrongSourceCoverage
