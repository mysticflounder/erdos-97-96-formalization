/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 16:0-0

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 16 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_16_0000_0000 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def ep_Q2_020_coefficient_16_0000 : Poly :=
[
  term (-1 : Rat) [(16, 1)]
]

/-- Partial product 0 for generator 16. -/
def ep_Q2_020_partial_16_0000 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (16, 1)],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem ep_Q2_020_partial_16_0000_valid :
    mulPoly ep_Q2_020_coefficient_16_0000
        ep_Q2_020_generator_16_0000_0000 =
      ep_Q2_020_partial_16_0000 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_16_0000_0000 : List Poly :=
[
  ep_Q2_020_partial_16_0000
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_16_0000_0000 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (16, 1)],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 0. -/
theorem ep_Q2_020_block_16_0000_0000_valid :
    checkProductSumEq ep_Q2_020_partials_16_0000_0000
      ep_Q2_020_block_16_0000_0000 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
