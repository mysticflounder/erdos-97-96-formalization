/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate ep_Q1_008, product shard 27

This generated module checks products 27 through 27 for the
sharded endpoint certificate row `ep_Q1_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1008Shards

/-- Generator polynomial 27 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_generator_27 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient polynomial 27 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_coefficient_27 : Poly :=
[]

/-- Product polynomial 27 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_product_27 : Poly :=
[]

set_option linter.style.nativeDecide false in
/-- Checked product identity 27 for endpoint certificate `ep_Q1_008`. -/
theorem ep_Q1_008_product_27_valid :
    mulPoly ep_Q1_008_coefficient_27 ep_Q1_008_generator_27 =
      ep_Q1_008_product_27 := by
  native_decide

end EpQ1008Shards

end Patterns

end EndpointCertificate

end Problem97
