/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 6:200-200

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 6 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_06_0200_0200 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 6. -/
def ep_Q2_024_coefficient_06_0200 : Poly :=
[
  term ((-5554516538586266 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 200 for generator 6. -/
def ep_Q2_024_partial_06_0200 : Poly :=
[
  term ((11109033077172532 : Rat) / 1162780221153193) [(0, 1), (15, 2), (16, 1)],
  term ((-5554516538586266 : Rat) / 1162780221153193) [(0, 2), (15, 2), (16, 1)],
  term ((-5554516538586266 : Rat) / 1162780221153193) [(1, 2), (15, 2), (16, 1)],
  term ((-11109033077172532 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)],
  term ((5554516538586266 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)],
  term ((5554516538586266 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 6. -/
theorem ep_Q2_024_partial_06_0200_valid :
    mulPoly ep_Q2_024_coefficient_06_0200
        ep_Q2_024_generator_06_0200_0200 =
      ep_Q2_024_partial_06_0200 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_06_0200_0200 : List Poly :=
[
  ep_Q2_024_partial_06_0200
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_06_0200_0200 : Poly :=
[
  term ((11109033077172532 : Rat) / 1162780221153193) [(0, 1), (15, 2), (16, 1)],
  term ((-5554516538586266 : Rat) / 1162780221153193) [(0, 2), (15, 2), (16, 1)],
  term ((-5554516538586266 : Rat) / 1162780221153193) [(1, 2), (15, 2), (16, 1)],
  term ((-11109033077172532 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)],
  term ((5554516538586266 : Rat) / 1162780221153193) [(4, 2), (15, 2), (16, 1)],
  term ((5554516538586266 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 200 through 200. -/
theorem ep_Q2_024_block_06_0200_0200_valid :
    checkProductSumEq ep_Q2_024_partials_06_0200_0200
      ep_Q2_024_block_06_0200_0200 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
