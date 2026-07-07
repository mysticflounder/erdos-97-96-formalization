/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 14:0-3

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_14_0000_0003 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R010_ueqv_R010YY_coefficient_14_0000 : Poly :=
[
  term ((-5718 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R010_ueqv_R010YY_partial_14_0000 : Poly :=
[
  term ((11436 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R010_ueqv_R010YY_partial_14_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_14_0000
        rs_R010_ueqv_R010YY_generator_14_0000_0003 =
      rs_R010_ueqv_R010YY_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R010_ueqv_R010YY_coefficient_14_0001 : Poly :=
[
  term ((-448 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R010_ueqv_R010YY_partial_14_0001 : Poly :=
[
  term ((896 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R010_ueqv_R010YY_partial_14_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_14_0001
        rs_R010_ueqv_R010YY_generator_14_0000_0003 =
      rs_R010_ueqv_R010YY_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R010_ueqv_R010YY_coefficient_14_0002 : Poly :=
[
  term ((448 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R010_ueqv_R010YY_partial_14_0002 : Poly :=
[
  term ((-896 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R010_ueqv_R010YY_partial_14_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_14_0002
        rs_R010_ueqv_R010YY_generator_14_0000_0003 =
      rs_R010_ueqv_R010YY_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R010_ueqv_R010YY_coefficient_14_0003 : Poly :=
[
  term ((5718 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R010_ueqv_R010YY_partial_14_0003 : Poly :=
[
  term ((-11436 : Rat) / 25) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((5718 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((5718 : Rat) / 25) [(3, 2), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5718 : Rat) / 25) [(10, 2), (15, 2), (16, 1)],
  term ((-5718 : Rat) / 25) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R010_ueqv_R010YY_partial_14_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_14_0003
        rs_R010_ueqv_R010YY_generator_14_0000_0003 =
      rs_R010_ueqv_R010YY_partial_14_0003 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_14_0000_0003 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_14_0000,
  rs_R010_ueqv_R010YY_partial_14_0001,
  rs_R010_ueqv_R010YY_partial_14_0002,
  rs_R010_ueqv_R010YY_partial_14_0003
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_14_0000_0003 : Poly :=
[
  term ((11436 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(3, 2), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 25) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(10, 2), (15, 2), (16, 1)],
  term ((-5718 : Rat) / 25) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 3. -/
theorem rs_R010_ueqv_R010YY_block_14_0000_0003_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_14_0000_0003
      rs_R010_ueqv_R010YY_block_14_0000_0003 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
