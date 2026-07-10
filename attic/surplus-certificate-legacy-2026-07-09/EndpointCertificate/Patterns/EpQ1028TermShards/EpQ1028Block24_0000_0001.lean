/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 24:0-1

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 24 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_24_0000_0001 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (12, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def ep_Q1_028_coefficient_24_0000 : Poly :=
[
  term ((56 : Rat) / 3) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 24. -/
def ep_Q1_028_partial_24_0000 : Poly :=
[
  term ((-112 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 3) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-112 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((56 : Rat) / 3) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((112 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem ep_Q1_028_partial_24_0000_valid :
    mulPoly ep_Q1_028_coefficient_24_0000
        ep_Q1_028_generator_24_0000_0001 =
      ep_Q1_028_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def ep_Q1_028_coefficient_24_0001 : Poly :=
[
  term (-44 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def ep_Q1_028_partial_24_0001 : Poly :=
[
  term (88 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (88 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-88 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (44 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-88 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (44 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem ep_Q1_028_partial_24_0001_valid :
    mulPoly ep_Q1_028_coefficient_24_0001
        ep_Q1_028_generator_24_0000_0001 =
      ep_Q1_028_partial_24_0001 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_24_0000_0001 : List Poly :=
[
  ep_Q1_028_partial_24_0000,
  ep_Q1_028_partial_24_0001
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_24_0000_0001 : Poly :=
[
  term ((-112 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term (88 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 3) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term (-44 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (88 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 3) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term (-44 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term (-88 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term (44 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-88 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term (44 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 1. -/
theorem ep_Q1_028_block_24_0000_0001_valid :
    checkProductSumEq ep_Q1_028_partials_24_0000_0001
      ep_Q1_028_block_24_0000_0001 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
