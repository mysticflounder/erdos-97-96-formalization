/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate ep_Q1_008, product shard 21

This generated module checks products 21 through 21 for the
sharded endpoint certificate row `ep_Q1_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1008Shards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_generator_21 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient polynomial 21 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_coefficient_21 : Poly :=
[]

/-- Product polynomial 21 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_product_21 : Poly :=
[]

set_option linter.style.nativeDecide false in
/-- Checked product identity 21 for endpoint certificate `ep_Q1_008`. -/
theorem ep_Q1_008_product_21_valid :
    mulPoly ep_Q1_008_coefficient_21 ep_Q1_008_generator_21 =
      ep_Q1_008_product_21 := by
  native_decide

end EpQ1008Shards

end Patterns

end EndpointCertificate

end Problem97
