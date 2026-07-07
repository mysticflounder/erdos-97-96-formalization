/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 21:100-100

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_21_0100_0100 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0100 : Poly :=
[
  term ((7151638057699172224 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0100 : Poly :=
[
  term ((14303276115398344448 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7151638057699172224 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-7151638057699172224 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((14303276115398344448 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0100
        rs_R010_ueqv_R010YNN_generator_21_0100_0100 =
      rs_R010_ueqv_R010YNN_partial_21_0100 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_21_0100_0100 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_21_0100
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_21_0100_0100 : Poly :=
[
  term ((14303276115398344448 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7151638057699172224 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-7151638057699172224 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((14303276115398344448 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 100. -/
theorem rs_R010_ueqv_R010YNN_block_21_0100_0100_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_21_0100_0100
      rs_R010_ueqv_R010YNN_block_21_0100_0100 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
