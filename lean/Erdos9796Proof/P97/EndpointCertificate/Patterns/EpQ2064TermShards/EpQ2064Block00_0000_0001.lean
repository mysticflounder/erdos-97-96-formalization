/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 0:0-1

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_00_0000_0001 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_064_coefficient_00_0000 : Poly :=
[
  term (18 : Rat) []
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_064_partial_00_0000 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1)],
  term (36 : Rat) [(0, 1), (6, 1)],
  term (-36 : Rat) [(1, 1), (3, 1)],
  term (36 : Rat) [(1, 1), (7, 1)],
  term (18 : Rat) [(2, 2)],
  term (18 : Rat) [(3, 2)],
  term (-18 : Rat) [(6, 2)],
  term (-18 : Rat) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_064_partial_00_0000_valid :
    mulPoly ep_Q2_064_coefficient_00_0000
        ep_Q2_064_generator_00_0000_0001 =
      ep_Q2_064_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_064_coefficient_00_0001 : Poly :=
[
  term (-18 : Rat) [(14, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_064_partial_00_0001 : Poly :=
[
  term (36 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (-36 : Rat) [(0, 1), (6, 1), (14, 1)],
  term (36 : Rat) [(1, 1), (3, 1), (14, 1)],
  term (-36 : Rat) [(1, 1), (7, 1), (14, 1)],
  term (-18 : Rat) [(2, 2), (14, 1)],
  term (-18 : Rat) [(3, 2), (14, 1)],
  term (18 : Rat) [(6, 2), (14, 1)],
  term (18 : Rat) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_064_partial_00_0001_valid :
    mulPoly ep_Q2_064_coefficient_00_0001
        ep_Q2_064_generator_00_0000_0001 =
      ep_Q2_064_partial_00_0001 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_00_0000_0001 : List Poly :=
[
  ep_Q2_064_partial_00_0000,
  ep_Q2_064_partial_00_0001
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_00_0000_0001 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1)],
  term (36 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (36 : Rat) [(0, 1), (6, 1)],
  term (-36 : Rat) [(0, 1), (6, 1), (14, 1)],
  term (-36 : Rat) [(1, 1), (3, 1)],
  term (36 : Rat) [(1, 1), (3, 1), (14, 1)],
  term (36 : Rat) [(1, 1), (7, 1)],
  term (-36 : Rat) [(1, 1), (7, 1), (14, 1)],
  term (18 : Rat) [(2, 2)],
  term (-18 : Rat) [(2, 2), (14, 1)],
  term (18 : Rat) [(3, 2)],
  term (-18 : Rat) [(3, 2), (14, 1)],
  term (-18 : Rat) [(6, 2)],
  term (18 : Rat) [(6, 2), (14, 1)],
  term (-18 : Rat) [(7, 2)],
  term (18 : Rat) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 1. -/
theorem ep_Q2_064_block_00_0000_0001_valid :
    checkProductSumEq ep_Q2_064_partials_00_0000_0001
      ep_Q2_064_block_00_0000_0001 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
