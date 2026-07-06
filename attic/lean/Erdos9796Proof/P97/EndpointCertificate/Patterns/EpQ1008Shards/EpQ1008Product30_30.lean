/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate ep_Q1_008, product shard 30

This generated module checks products 30 through 30 for the
sharded endpoint certificate row `ep_Q1_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1008Shards

/-- Generator polynomial 30 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_generator_30 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]

/-- Coefficient polynomial 30 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_coefficient_30 : Poly :=
[
  term (-1 : Rat) []
]

/-- Product polynomial 30 for endpoint certificate `ep_Q1_008`. -/
def ep_Q1_008_product_30 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked product identity 30 for endpoint certificate `ep_Q1_008`. -/
theorem ep_Q1_008_product_30_valid :
    mulPoly ep_Q1_008_coefficient_30 ep_Q1_008_generator_30 =
      ep_Q1_008_product_30 := by
  native_decide

end EpQ1008Shards

end Patterns

end EndpointCertificate

end Problem97
