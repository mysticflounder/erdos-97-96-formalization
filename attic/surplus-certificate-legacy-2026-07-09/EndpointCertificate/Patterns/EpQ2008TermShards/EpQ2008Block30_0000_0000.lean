/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 30:0-0

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 30 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_30_0000_0000 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def ep_Q2_008_coefficient_30_0000 : Poly :=
[
  term (-1 : Rat) []
]

/-- Partial product 0 for generator 30. -/
def ep_Q2_008_partial_30_0000 : Poly :=
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
/-- Checked partial-product identity 0 for generator 30. -/
theorem ep_Q2_008_partial_30_0000_valid :
    mulPoly ep_Q2_008_coefficient_30_0000
        ep_Q2_008_generator_30_0000_0000 =
      ep_Q2_008_partial_30_0000 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_30_0000_0000 : List Poly :=
[
  ep_Q2_008_partial_30_0000
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_30_0000_0000 : Poly :=
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
/-- Checked block-sum identity for generator 30, terms 0 through 0. -/
theorem ep_Q2_008_block_30_0000_0000_valid :
    checkProductSumEq ep_Q2_008_partials_30_0000_0000
      ep_Q2_008_block_30_0000_0000 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
