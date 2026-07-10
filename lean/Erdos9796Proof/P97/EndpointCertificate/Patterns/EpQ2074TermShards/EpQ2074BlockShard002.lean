/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ProductCertificate
import Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2074Generators

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074 computed product shard

This generated module stores bounded coefficient blocks. The shared checker
computes each coefficient-generator product when the row coordinator is
checked.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Computed coefficient block `30:0-0` for
endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_block_30_0000_0000 :
    ComputedProductBlock EpQ2074Generators.ep_Q2_074_generators :=
  { generatorIndex := 30
    coefficient :=
[
  term (-1 : Rat) []
] }

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
