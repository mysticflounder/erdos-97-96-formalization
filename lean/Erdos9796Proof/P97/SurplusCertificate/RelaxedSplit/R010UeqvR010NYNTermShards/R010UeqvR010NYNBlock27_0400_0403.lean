/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 27:400-403

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_27_0400_0403 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010NYN_coefficient_27_0400 : Poly :=
[
  term ((1211904 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 400 for generator 27. -/
def rs_R010_ueqv_R010NYN_partial_27_0400 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((2423808 : Rat) / 2995) [(13, 1), (14, 1), (15, 3)],
  term ((-1211904 : Rat) / 2995) [(14, 1), (15, 4)],
  term ((-1211904 : Rat) / 2995) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem rs_R010_ueqv_R010NYN_partial_27_0400_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_27_0400
        rs_R010_ueqv_R010NYN_generator_27_0400_0403 =
      rs_R010_ueqv_R010NYN_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010NYN_coefficient_27_0401 : Poly :=
[
  term ((-267 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 27. -/
def rs_R010_ueqv_R010NYN_partial_27_0401 : Poly :=
[
  term ((-534 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((267 : Rat) / 5) [(14, 1), (15, 4), (16, 1)],
  term ((267 : Rat) / 5) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem rs_R010_ueqv_R010NYN_partial_27_0401_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_27_0401
        rs_R010_ueqv_R010NYN_generator_27_0400_0403 =
      rs_R010_ueqv_R010NYN_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010NYN_coefficient_27_0402 : Poly :=
[
  term ((102688 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 402 for generator 27. -/
def rs_R010_ueqv_R010NYN_partial_27_0402 : Poly :=
[
  term ((205376 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((205376 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((-102688 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((-102688 : Rat) / 2995) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem rs_R010_ueqv_R010NYN_partial_27_0402_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_27_0402
        rs_R010_ueqv_R010NYN_generator_27_0400_0403 =
      rs_R010_ueqv_R010NYN_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010NYN_coefficient_27_0403 : Poly :=
[
  term ((-33 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 403 for generator 27. -/
def rs_R010_ueqv_R010NYN_partial_27_0403 : Poly :=
[
  term ((-33 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((33 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((33 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem rs_R010_ueqv_R010NYN_partial_27_0403_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_27_0403
        rs_R010_ueqv_R010NYN_generator_27_0400_0403 =
      rs_R010_ueqv_R010NYN_partial_27_0403 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_27_0400_0403 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_27_0400,
  rs_R010_ueqv_R010NYN_partial_27_0401,
  rs_R010_ueqv_R010NYN_partial_27_0402,
  rs_R010_ueqv_R010NYN_partial_27_0403
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_27_0400_0403 : Poly :=
[
  term ((205376 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((-33 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2423808 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2423808 : Rat) / 2995) [(13, 1), (14, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((205376 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((-33 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((-1211904 : Rat) / 2995) [(14, 1), (15, 4)],
  term ((267 : Rat) / 5) [(14, 1), (15, 4), (16, 1)],
  term ((-102688 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((33 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((-1211904 : Rat) / 2995) [(14, 3), (15, 2)],
  term ((267 : Rat) / 5) [(14, 3), (15, 2), (16, 1)],
  term ((-102688 : Rat) / 2995) [(15, 4)],
  term ((33 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 403. -/
theorem rs_R010_ueqv_R010NYN_block_27_0400_0403_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_27_0400_0403
      rs_R010_ueqv_R010NYN_block_27_0400_0403 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
