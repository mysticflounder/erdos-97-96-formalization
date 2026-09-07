/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13ThirdApexSourceCoverage

/-! Focused checks for the third-apex source refinement. -/

namespace Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13ThirdApexSourceCoverage

open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13StrongSourceCoverage
open CardGeThirteenExact13WeightedProviderBankBridge

example (k : Key) (hk : ThirdApexStrongValid k) : StrongValid k := hk.1

example (k : Key) (hk : ThirdApexStrongValid k) : GlobalThirdApexValid k := hk.2

#check globalThirdApexValid_of_source
#check exists_mem_thirdApexStrongValidKeys
#check bankCovers_of_thirdApexStrongValidKeyCover
#check SelectedFourClass.inter_card_le_one_of_mem_boundary_apex

#print axioms globalThirdApexValid_of_source
#print axioms exists_mem_thirdApexStrongValidKeys
#print axioms bankCovers_of_thirdApexStrongValidKeyCover

end Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13ThirdApexSourceCoverage
