/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 30:0-1

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 30 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_30_0000_0001 : Poly :=
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
def ep_Q2_024_coefficient_30_0000 : Poly :=
[
  term (-4 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 0 for generator 30. -/
def ep_Q2_024_partial_30_0000 : Poly :=
[
  term (8 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem ep_Q2_024_partial_30_0000_valid :
    mulPoly ep_Q2_024_coefficient_30_0000
        ep_Q2_024_generator_30_0000_0001 =
      ep_Q2_024_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def ep_Q2_024_coefficient_30_0001 : Poly :=
[
  term (8 : Rat) [(15, 2)]
]

/-- Partial product 1 for generator 30. -/
def ep_Q2_024_partial_30_0001 : Poly :=
[
  term (-16 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem ep_Q2_024_partial_30_0001_valid :
    mulPoly ep_Q2_024_coefficient_30_0001
        ep_Q2_024_generator_30_0000_0001 =
      ep_Q2_024_partial_30_0001 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_30_0000_0001 : List Poly :=
[
  ep_Q2_024_partial_30_0000,
  ep_Q2_024_partial_30_0001
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_30_0000_0001 : Poly :=
[
  term (8 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1)],
  term (-8 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 1. -/
theorem ep_Q2_024_block_30_0000_0001_valid :
    checkProductSumEq ep_Q2_024_partials_30_0000_0001
      ep_Q2_024_block_30_0000_0001 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
